pipeline{
 agent any
 environment{
  registry= "akhilmylaram/vprohelm"
  registeryCredentials= "dockerhub"
 }
 stages{
  stage("build app image"){
   steps{
	script{
		dockerImage = docker.build registry + ":V$BUILD_NUMBER"
	}
   }
  }
 stage("upload image"){
 
	steps{
		script{
			docker.withRegistry('',registeryCredentials){
				dockerImage.push("V$BUILD_NUMBER")
				dockerImage.push("latest")
			}
		}
	}
 }
 stage("remove un used docker images"){
	steps{
		sh "docker rmi $registry:V$BUILD_NUMBER"
	}
 }
 stage("Kubernetes deploy"){
	steps{
		sh "helm upgrade --install --force vprofile-stack helm/vprofilecharts --set appimage=${registry}:V${BUILD_NUMBER} --namespace prod"
	}
 }
 }

}
