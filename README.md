# Déploiement d'un cluster de VMs dans Azure avec Terraform

## Contexte du projet
En tant qu'administrateur Cloud Azure, vous êtes régulièrement ammenés à créer des infrastructures dans le Cloud à la demande de mes collègues dans d'autres équipes et les mettre à leur disposition.

Afin de rendre cette tâche rapide et efficace, j'ai décidé récemment de monter en compétences sur l'outil d'IaC Terraform.

On est lundi, le chef d'équipe QA m'envoie un email pour m'indiquer qu'il aura besoin d'un mini cluster à base de 2 VMs Linux (Ubuntu) et un loadbalancer afin de tester une application web dont une première version vient d'être publiée. Il me demande également de lui communiquer quelques détails sur le cluster déployé car il n'a pas accès au portail Azure pour consulter directement.. C'est donc l'occasion pour moi de mettre en pratique ces nouvelles compétences.

Voici les étapes à suivre suite à la réception de la demande de mon collègue:

Concevoir l'infrastructure à déployer.
Créer les recettes de configuration
Vérifier l'infrastructure à déployer
Lancer la création de l'infrastructure
Partager les information dont votre collègue a besoin
## En réponse à la demande de l'équipe de test, je dois créer dans Azure un mini cluster avec 2 VMs Linux (Ubuntu) et un Load balancer. Ensuite, je dois communiquer au demandeur les éléments suivants afin de les implémenter dans son scénario de test:
- Nom de la région (Location) utilisée
- Nom du groupe de ressources utilisé
- Adresses IP privées des 2 VMs
- Adresse IP publique du load Balancer

## BONUS

### Une fois le cluster correctemt créé, je peux essayer les points suivants:

- Attacher à chacune de VMs un disque de données avec les cartactéristiques suivantes (size=20 GB et storage account tye= Standard_LRS).
- Faire en sorte que les disques OS et Data de chacune des 2 VMs soient supprimés avec les VMs en cas de leur suppression.
- noter les erreurs rencontrés au cas où vous êtes sûr qu'il ne s'agissait pas d'une erreur de configuration.

# Schema
![Ling-Terraform-Brief12](https://github.com/lingcode72/Ling_Terraform_Brief12/assets/66947285/9f3aaa31-56b0-4378-9038-9261abe24775)
