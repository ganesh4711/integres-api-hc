echo "Checking Helm release name"
helm status integres-api -n stage
if [ $? -eq 0 ]
then
   helm upgrade integres-api ./ --values ./values.yaml -f ./values-stage.yaml -n stage
   echo "Helm upgrade done!!!"
else
   helm install integres-api ./ --values ./values.yaml -f ./values-stage.yaml -n stage
   echo "Helm installed done!!!"
fi

echo "Cleaning destination directory on VM"
rm -rf ~/se-integrations/integres-api/*

echo "Completed!!!"
