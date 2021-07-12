echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
echo "Installing AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip
unzip -qq awscliv2.zip 
sudo ./aws/install
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
echo "Installing Kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
echo "Configuring AWS CLI"
aws configure set profile.default.aws_access_key_id $AKID
aws configure set profile.default.aws_secret_access_key $SK
aws configure set profile.default.region us-west-2
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
echo "updating kubeconfig file"
aws eks update-kubeconfig --name $CLUSTER_NAME
  
kubectl apply -f deployment.yml
