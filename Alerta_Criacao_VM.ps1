###Login section

Login-AzureRMAccount

Select-AzureRmSubscription -Subscription General-Proj

##testes(desconsiderar)

#$log = Get-AzureRmLog -MaxRecord 1

#$s1 = "Microsoft.WindowsServer2016Datacenter*"#need the *
#$s2 = "Microsoft.WindowsServer2016Datacenter-20180821150034"

#$s2 -like $s1

#fim testes

#returns true


#para um resource group



#para todos resource group

#$rgs = Get-AzurRmResourceGroupDeployment #lista os dpeloys de um resource
#em ordem decrescente(mais novo para mais velho)

###Limitar para tempos em tempos
### Criar parâmetro de entrada para rodar no automation runbook da azure


Foreach ($rg in $rgs){

    
    $rg.ResourceGroupName
    $rg_deploys = Get-AzureRmResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName #lista os deployments
    
    Foreach($deploy in $rg_deploys){
    
        #Comparação para Windows Server 2016(testar se funciona com todas variações do Win2016 na azure marketplace)
        $param1 = "Microsoft.WindowsServer2016Datacenter*"
        $string1 = $deploy.DeploymentName

        #adicinar outros parâmetros(win 2012, red hat, etc)
        
        if($string1 -like $param1){
        
            $deploy.Parameters.virtualMachineName.Value
            $deploy.Timestamp
            
           ##retornar log
           ##enviar o alerta, ideia inicial por email
           ###mensagem: vm X criada no resource Y na subscription Z no dia D 
    
        }

    }



}

#avaliar caso de criação de vm em novo resource group

# a váriavel rgs será a coleção com todos resource groups(Get-AzureRMResourceGroup)

#$deploy_ts.GetType() #return type of a variable