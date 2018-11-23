   _                        _            _   
  (_) __ ___   ____ _      | |_ ___  ___| |_ 
  | |/ _` \ \ / / _` |_____| __/ _ \/ __| __|
  | | (_| |\ V / (_| |_____| ||  __/\__ \ |_ 
 _/ |\__,_| \_/ \__,_|      \__\___||___/\__|
|__/                                         
___________________________________________________________________________________________________
Versão: ${project.version}

INSTRUÇÕES PARA EXECUTAR EM CONTAINER DOCKER

---------------------------- Argumentos para o programa (--name=valor) ----------------------------


------------------------------------------- Enviroment --------------------------------------------
 + SCP_IP: Endereço IP do servidor onde estará or arquivos de log
 + SCP_PATH: Caminho no servidor onde estará os arquivos de log
 + APPLICATION: Nome da aplicação para identificar no e-mail
 + JAVA_OPTIONS: Mais opções de JVM
 + TZ: Time Zone
   default "America/Sao_Paulo"

-------------------------------------------- Volumes ----------------------------------------------
 + /var/jvm/logs: logs de erros
 + /var/jvm/dump: dump da JVM

###################################################################################################

ARQUIVO error.sh
---------------------------------------------------------------------------------------------------

Caso for fazer SCP dos arquivos de log, descomentar os comandos no "arquvo error.sh".
Para conseguir acessar, adicioanr a chave publica na máquina onde será feito SCP no aquivo "~/.ssh/authorized_keys"

GERANDO A CHAVE PÚBLICA
---------------------------------------------------------------------------------------------------
chmod 600 send_logger.pem ## Altera permissão do arquivo
ssh-keygen -y -f send_logger.pem ## gera chave pública
chmod 0664 send_logger.pem ## Altera permissão do arquivo

###################################################################################################
COMANDOS DOCKER....................................................................................
###################################################################################################

docker build -t java-test:${project.version} .
docker run -d --restart unless-stopped -e SCP_IP="ip_servidor" -e SCP_PATH="/var/jvm/java-test" -e APPLICATION="Java Teste" -v /var/jvm/java-test/dump:/var/jvm/dump -v /var/jvm/java-test/logs:/var/jvm/logs --name java-test -it java-test:${project.version}