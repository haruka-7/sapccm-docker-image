# Docker image for SAP Commerce Cloud CLI
* Maintained by: [Pedro "P3ter" CADETE](https://github.com/P3ter)
* Based on [SAP Machine](https://sap.github.io/SapMachine/) and SAP Commerce Cloud Command Line Interface

# How to use this image
```
docker run -ti p3terfr/sapccm bash
sapccm -h
mvn -v
```
See [SAP Help Portail](https://help.sap.com/viewer/9116f1cfd16049c3a531bfb6a681ff77/v2011/en-US/8acde53272c64efb908b9f0745498015.html) for more informations.

## Bitbucket pipeline example
```
pipelines:
  default:
    - step:
        clone:
          enabled: false
        name: 'Build'
        image:
          name: p3terfr/sapccm:latest
        artifacts: # defining the artifacts to be passed to each future step.
          - build-output.txt
        script:
          - sapccm config set auth-credentials $CCV2_API_TOKEN
          - sapccm build create --subscription-code=$CCV2_SUBSCRIPTION_CODE --name=$(echo "$BITBUCKET_BRANCH" | sed -e "s/^.*\///") --branch=$BITBUCKET_BRANCH > $BITBUCKET_CLONE_DIR/build-output.txt
    - step:
        trigger: manual
        clone:
          enabled: false
        name: 'Deploy'
        image:
          name: p3terfr/sapccm:latest
        script:
          - sapccm config set auth-credentials $CCV2_API_TOKEN
          - sapccm deployment create --subscription-code=$CCV2_SUBSCRIPTION_CODE --build-code=$(grep -Po '(?<=build\-code:\s).*' $BITBUCKET_CLONE_DIR/build-output.txt) --database-update-mode=NONE --environment-code=d1 --strategy=RECREATE
```
Thanks to Maikel Bollemeijer [article](https://www.acorel.nl/2020/10/sap-ccv2-how-to-do-nightly-builds-and-deploys-ci-cd/) on Acorel blog.
