pipeline{
 agent any
 environment{
  registry= "akhilmylaram/register:latest"
  registeryCredentials= "dockerhub"
 }
 stages{
  stage("build app image"){
   steps{
	script{
		dockerImage = docker.build registry + ":V$BUILD_ID"
	}
   }
  }
 stage("upload image"){
 
	steps{
		script{
			docker.withRegistry('registeryCredentials'){
				dockerImage.push("V$BUILD_ID")
				dockerImage.push("latest")
			}
		}
	}
 }
 stage("remove un used docker images"){
	steps{
		sh "docker rmi $registry:V$BUILD_ID"
	}
 }
 stage("Kubernetes deploy"){
	steps{
		sh "helm upgrade --install --force vprofile-stack helm/vprofilecharts --set appimage=${registry}:V${BUILD_ID} --namespace prod"
	}
 }
 }

}
