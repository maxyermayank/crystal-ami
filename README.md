# **CRYSTAL-AMI**
Crystal Report Server AWS AMI using Packer

![](images/PackerAWS.png)

# **Install required tools using Home brew and Pip**
## **Install Packer**
```
brew install packer
packer --version
```

## **Install Yacker**
```
pip install matildapeak-yacker
yacker --version
```

## **Packer project structure**
- **bin:** Unix/Powershell scripts that needs to be executed and copied in AMI
- **resources:** any artifacts that needs to be in AMI

![](images/PackerPackageStructure.png)

## **Packer Lifecycle**
**Validate → Inspect → Build**
- **Validate:** check that a template is valid
```
# If using Packer:
packer validate packer.json

# If using Yacker:
yacker validate packer.yml
```
- **Inspect:** see components of a template
```
# If using Packer:
packer inspect packer.json

# If using Yacker:
yacker inspect packer.yml
```
- **Build:** build image(s) from template
```
# If using Packer:
packer build packer.json

# If using Yacker:
yacker build packer.yml
```


## **Variables**
| Variable     | Example Value | Description |
| ------------ | ------------- | ----------- |
| `ACCESS_KEY` | AWSEXAMPLEACCESSKEY | AWS Access Key |
| `SECRET_KEY` | AWSEXAMPLESECRETKEY | AWS Secret Key |
| `REGION`     | us-east-1 | AWS Region where trying to create AMI |
| `SSH_KEY`    | ~/testkey.pem | SSH Key path trying to use for AMI and instances |
| `USERNAME`   | NOTADMINEXAMPLE | Username for Windows Crystal Instance |
| `PASSWORD`   | NOTADMINEXAMPLE | Password for Windows Crystal Instance |
| `SITE_BINDING_NAME` | xyz.domain.com | Domain URL to map IIS site to |
| `DEPLOY_USER_PASSWORD` | DEPLOYEXAMPLE | Password for Deploy User of Windows Crystal Instance |


## **Set Environment Variables**
```
export USERNAME=NOTADMINEXAMPLE
export PASSWORD=NOTADMINEXAMPLE
export SSH_KEY=~/testkey.pem
export ACCESS_KEY=AWSEXAMPLEACCESSKEY
export SECRET_KEY=AWSEXAMPLESECRETKEY
export REGION=us-east-1
export SITE_BINDING_NAME=xyz.domain.com
export DEPLOY_USER_PASSWORD=DEPLOYEXAMPLE
```

# **Resources**
* [HashiCorp Packer](https://www.packer.io)
* [Yacker Documentation](https://yacker.readthedocs.io/en/latest/)
* [Yacker GitHub](https://gitlab.com/matilda.peak/yacker)