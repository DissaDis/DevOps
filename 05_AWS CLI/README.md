

## Situācija 1: DevOps speciālists strādā pie esošas lietotnes, kura izmanto dažādus AWS resursus un pakalpojumus. Viņam ir jāpārbauda, vai visi attiecīgie resursi ir konfigurēti ar atbilstošo AWS CLI versiju, lai nodrošinātu, ka visi attālinie skripti un procesi darbojas pareizi.  

```bash
aws --version
```
aws-cli/2.13.14 Python/3.11.4 Windows/10 exe/AMD64 prompt/off

## Situācija 2: DevOps speciālists pievienojas jūsu komandai, un viņam ir nepieciešams izveidot savu vietējo konfigurāciju AWS CLI, lai varētu sazināties ar AWS resursiem un pakalpojumiem


It need to create key in aws IAM->Security credentials->
My security credentials->Access keys->Create access key

```bash
aws configure
```

## Situācija 3: DevOps speciālists strādā pie jaunas infrastruktūras izveides AWS, un viņam ir nepieciešams izveidot jaunu SSH atslēgu pāru, lai varētu droši piekļūt jaunizveidotām EC2 instancēm

To create a key-pair using AWS CLI, type ```aws ec2 create-key-pair --key-name <your_key_name>```, where <your_key_name> is your key's name by which it would be saved in the AWS. Save you private key.
```bash
aws ec2 create-key-pair     --key-name Deniss-key-pair-cli    --key-type rsa  --key-format pem     --query "KeyMaterial"     --output text > Deniss-key-pair.pem
```
Windows: It need to be changed: Unix(LF), UTF-8

## Situācija 4: DevOps speciālists vēlas pārbaudīt informāciju par noteiktu SSH atslēgu pāru, lai pārliecinātos, vai tā ir pareizi izveidota un konfigurēta.

[Manual](!https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/verify-keys.html)
```bash
 openssl pkcs8 -in .\Deniss-key-pair.pem -inform PEM -outform DER -topk8 -nocrypt | openssl sha1 -c

aws ec2 describe-key-pairs --key-name Deniss-key-pair-cli
```


## **Situācija 5:** DevOps speciālists strādā pie esošās EC2 infrastruktūras pārvaldības un vēlas iegūt informāciju par visām EC2 instancēm, kuras izmanto "t2.small" tipa instanču veidu
``` bash
 aws ec2 describe-instances --filters Name=instance-type,Values=t2.small
```

## **Situācija 6:** DevOps speciālists vēlas iegūt informāciju par visām EC2 instancēm, kuras izmanto "t2.small" un "t2.medium" tipa instanču veidu


 ``` bash
 aws ec2 describe-instances --filters Name=instance-type,Values=t2.medium,t2.small
 ```
## ?**Situācija 7:** DevOps speciālists vēlas saņemt informāciju par visām "t2.small" tipa EC2 instancēm un to atribūtiem

 ``` bash
 aws ec2 describe-instances --filters Name=instance-type,Values=t2.small 
 ```

```bash
aws ec2 describe-instance-attribute --instance-id i-1234567890abcdef0 --attribute kernel
```

### describe-instance-attribute
**Description**

Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: *instanceType | kernel | ramdisk | userData | disableApiTermination | instanceInitiatedShutdownBehavior | rootDeviceName | blockDeviceMapping | productCodes | sourceDestCheck | groupSet | ebsOptimized | sriovNetSupport*


## ? **Situācija 8:** DevOps speciālists vēlas iegūt vispārīgu informāciju par visām eksistējošajām EC2 instancēm jūsu AWS infrastruktūrā
```bash 
 aws ec2 describe-instances --query "Reservations[*].Instances[*].{Instance:InstanceId,InstanceT:InstanceType, Status: State.Name, IP:PrivateIpAddress,  PublicIP:PublicIpAddress}"  --output table
 ```

or [another way](!https://www.middlewareinventory.com/blog/run-aws-cli-commands-on-all-regions-awsall/)

## Situācija 9: DevOps speciālists vēlas iegūt visus EC2 instanču nosaukumus (ja tie ir norādīti tagos) no eksistējošām instancēm AWS infrastruktūrā
```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Name:Tags[?Key=='Name'] | [0].Value, Instance:InstanceId,InstanceT:InstanceType, Status: State.Name, IP:PrivateIpAddress,  PublicIP:PublicIpAddress}"  --output table
```

## Situācija 10: DevOps speciālists vēlas iegūt informāciju par visām "t2.small" tipa EC2 instancēm, tostarp nosaukumu (ja tas ir norādīts tagos) un instancijas tipu
```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Name:Tags[?Key=='Name'] | [0].Value, InstanceType:InstanceType}" --filters "Name=instance-type,Values='t2.small'" --output table
```

## Situācija 11: DevOps speciālists vēlas apturēt noteiktas EC2 instancēs, lai ietaupītu resursus vai veiktu kādu apkopi.

```bash
aws ec2 stop-instances --instance-ids i-03c649cbd80e14d9e i-1234567890abcdef0
```
## Situācija 12: DevOps speciālists ir nolēmis atsākt darbību uz noteiktām apturētām EC2 instancēm, lai atjaunotu pakalpojumu pieejamību

```bash
aws ec2 start-instances --instance-ids i-03c649cbd80e14d9e i-1234567890abcdef0
```

## Situācija 13: DevOps speciālists ir nolēmis pilnībā izslēgt (terminēt) noteiktas EC2 instancijas, jo tās vairs netiek izmantotas un ir nepieciešams atbrīvot resursus

```bash
aws ec2 terminate-instances --instance-ids i-03c649cbd80e14d9e i-1234567890abcdef0
```

## Situācija 14: DevOps speciālists vēlas izveidot jaunu drošības grupu (security group) AWS infrastruktūrā, lai kontrolētu ienākošos un izejošos tīkla pieslēgumus konkrētam VPC (Virtual Private Cloud)

```bash
aws ec2 create-security-group --group-name MySecurityGroup --description "My security group" --vpc-id vpc-1a2b3c4d
```

## Situācija 15: DevOps speciālists vēlas iegūt informāciju par visām AMI (Amazon Machine Image) attēliem, kuras pieder viņa kontam (self) un Amazon sniedzējam
```bash
 aws imagebuilder list-images --owner self,Amazon
```
*An error occurred (AccessDeniedException) when calling the ListImages operation: User: arn:aws:iam::952122846739:user/denis_p is not authorized to perform: imagebuilder:ListImages on resource: arn:aws:imagebuilder:us-west-2:952122846739:image/*


## Situācija 16: DevOps speciālists vēlas iegūt informāciju par statusu visām norādītajām EC2 instancēm, lai pārbaudītu, vai tās darbojas un kāds ir to statuss.

```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Status: State.Name, Name:Tags[?Key=='Name'] | [0].Value, Instance:InstanceId,InstanceT:InstanceType}"  --output table
```