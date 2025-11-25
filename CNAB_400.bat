@echo off
chcp 65001 > nul
cls
TITLE ** Homologacao CNAB 400 **

set "arqHomolog="
set "hoje=%date%"
set "horaAtual=%time%"
set "ano=%hoje:~-4%"
set "mes=%hoje:~3,2%"
set "dia=%hoje:~0,2%"
set "dataAtual=%ano%-%mes%-%dia%"
set "hora=%horaAtual:~0,2%"
set "minuto=%horaAtual:~3,2%"
set "segundo=%horaAtual:~6,2%"
set "horaFormatada=%hora%:%minuto%:%segundo%"

:LOOP
ECHO DECISAO SISTEMAS - IMPLANTACAO
echo(
ECHO Escolha o Sistema:
echo(
ECHO 1. DIFACT
ECHO 2. DISECURIT
ECHO 3. DIESC
echo(

SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter: 
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%

IF "%Choice%"=="1" (
    SET "emitente=Factoring"
    GOTO :DIFACT)

IF "%Choice%"=="2" (
    SET "emitente=Securitizadora"
    GOTO :DISECURIT)

IF "%Choice%"=="3" (
    SET "emitente=ESC"
    GOTO :DISECURIT)

ECHO "%Choice%" opcao nao valida, tente novamente!
GOTO :LOOP

:DIFACT
echo(
ECHO Difact - Homologacao CNAB 400
echo(
ECHO 1. Banco do Brasil
ECHO 2. Bradesco
ECHO 3. Itau
ECHO 4. Santander
ECHO 5. Safra
ECHO 6. CEF
ECHO 7. INTER
ECHO 8. MONEY PLUS
ECHO 9. SICREDI
echo(

SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter: 
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
echo(

IF "%Choice%" == "1" (echo 1. Banco do Brasil & echo( & GOTO :BB_DIFACT)
IF "%Choice%" == "2" (echo 2. Bradesco & echo( & GOTO :BRADESCO_DIFACT)
IF "%Choice%" == "3" (echo 3. Itau & echo( & GOTO :ITAU_DIFACT)
IF "%Choice%" == "4" (echo 4. Santander & echo( & GOTO :SANTANDER_DIFACT)
IF "%Choice%" == "5" (echo 5. Safra & echo( & GOTO :SAFRA_DIFACT)
IF "%Choice%" == "6" (echo 6. CAIXA ECOMICA FEDERAL: & echo( & GOTO :CEF_DIFACT)
IF "%Choice%" == "7" (echo 7. INTER & echo( & GOTO :INTER_DIFACT)
IF "%Choice%" == "8" (echo 8. MONEY PLUS & echo( & GOTO :BMP_DIFACT)
IF "%Choice%" == "9" (echo 9. SICREDI & echo( & GOTO :SICREDI_DIFACT)


ECHO "%Choice%" opcao nao valida, tente novamente!
GOTO :DIFACT

:BB_DIFACT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Agencia com digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Conta com digito: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
echo(
set /p convenio=Convenio: 
echo(
set /p carteira=Carteira: 
echo(
set /p variacao=Variacao: 
echo(

:ENTRADA_JUROS_BB
set /p juros=Informe o Juros A.M. (Ex:1.30): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_BB
)
echo(

:ENTRADA_MULTA_BB
set /p multa=Informe Multa (Ex:3.00): 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_MULTA_BB
)
echo(

:PERGUNTA_PROTESTO_BB
Echo Protesto?
echo(
Echo 07 - Sem prostesto
Echo 03 - Envio apos 3 dias uteis do vencimento
Echo 04 - Envio apos 4 dias uteis do vencimento
Echo 05 - Envio apos 5 dias uteis do vencimento
echo 10 - Envio apos 10 dias corridos do vencimento
echo 15 - Envio apos 15 dias corridos do vencimento
echo 20 - Envio apos 20 dias corridos do vencimento
echo 25 - Envio apos 25 dias corridos do vencimento
echo 30 - Envio apos 30 dias corridos do vencimento
echo 45 - Envio apos 45 dias corridos do vencimento
echo(
set /p protesto=Digite a opcao: 
set "protesto=%protesto: =%"

if "%protesto%"=="07" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="03" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="04" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="05" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="10" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="15" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="20" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="25" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="30" goto :GERAR_ARQUIVO_DFCT_BB
if "%protesto%"=="45" goto :GERAR_ARQUIVO_DFCT_BB

echo Opcao invalida! Tente novamente.
echo(
goto :PERGUNTA_PROTESTO_BB

:GERAR_ARQUIVO_DFCT_BB
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%%contac%000000','%titular%','02                  ','   ','%agenciac%%contac%      ','0000                ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio%','                    ','                    ',' 000000                ','                  ','7                   ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','                    ','001                 ','%convenio%',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (1,39,63,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,64,80,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,146,148,149,'1                   ',150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,271,275,314,315,326,327,334,335,349,350,351,92,94,'                    ',395,400,352,391,0,0,88,88,0,0,81,84,0,0,89,91,92,94,'%variacao%                 ',32,38,95,95,0,0,96,101,0,0,'    ',10,11,'1                   ',12,19,'COBRANCA       ',27,46,47,76,95,100,0,0,'                    ',0,0,'   ',395,400,'1                   ',0,0,'  ',101,107,77,79,80,94,0,0,'    ',392,393,0,0,'0000                ','                    ',64,80,0,0,'                                                  ',0,0,'                                                  ',0,0,0,0,'                                                  ',0,0,'                                                  ',182,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO ','DECISAO ','        ','10:45:37',130,136,1,1,153,165,166,168,169,173,87,88,1,9,'02RETORNO           ',101,107,117,126,0,0,280,292,107,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=1 >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:BRADESCO_DIFACT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(
set /p convenio=Informe o Codigo da Empresa: 
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
echo(
set /p carteira=Informe a Carteira (3 digitos): 
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(

:ENTRADA_JUROS_BRADESCO
set /p juros=Informe os Juros A.M. (Ex:1.50): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_BRADESCO
)
echo(

:PERGUNTA_MULTA_BRADESCO
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_PROTESTO_BRADESCO
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_BRADESCO
)
echo Opcao invalida! Digite apenas 0 ou 2.
goto :PERGUNTA_MULTA_BRADESCO
echo(

:DIGITA_MULTA_BRADESCO
set /p multa=Informe o valor da Multa (Ex:6.00):
echo( 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_BRADESCO
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
echo(
goto :PERGUNTA_PROTESTO_BRADESCO

:PERGUNTA_PROTESTO_BRADESCO
Echo Protestar ou Negativar automaticamente?
echo(
Echo 0 - Sem protesto
Echo 6 - Protestar
ECHO 7 - Negativar
echo(
set /p cprotesto=Digite a opcao: 
set "cprotesto=%cprotesto: =%"
echo(
if "%cprotesto%"=="0" (
    set "protesto=00"
    set "dias=00"
    goto :PERGUNTA_PAPELETA_BRADESCO
)
if "%cprotesto%"=="6" (
    set "protesto=06"
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
if "%cprotesto%"=="7" (
    set "protesto=07"
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
echo Opcao invalida! Digite um valor valido.
echo(
goto :PERGUNTA_PROTESTO_BRADESCO

:DIGITA_DIAS_PROTESTO_BRADESCO
set /p dias=Informe dias para protesto (minimo 3 dias): 
echo(
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 2 numeros. & echo(
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
echo(
goto :PERGUNTA_PAPELETA_BRADESCO


:PERGUNTA_PAPELETA_BRADESCO
Echo Emitente da Papeleta?
echo(
Echo 1 - Banco
Echo 2 - Factoring
echo(
set /p papeleta=Digite a opcao: 
set "papeleta=%papeleta: =%"
if "%papeleta%"=="1" goto :GERAR_ARQUIVO_BRADESCO
if "%papeleta%"=="2" goto :GERAR_ARQUIVO_BRADESCO
echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_PAPELETA_BRADESCO
 
:GERAR_ARQUIVO_BRADESCO
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%protesto%                  ','%dias%               ','                    ',%juros%,'%papeleta%            ','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','%horaFormatada%','000                 ','000','                    ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (237,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,62,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,0,0,'',0,0,'',176,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=237; >> "%arqHomolog%"
echo update banco set (bannom) = ('BRADESCO') where bancod=237  >> "%arqHomolog%"
Echo(
echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:ITAU_DIFACT
Echo Itau:
echo(
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-6%"
echo(
Echo Informe a Carteira ( 3 digitos)
set /p carteira=
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
echo(
Echo Protesto?
Echo 09 - Com Protesto Automatico
Echo 10 - Sem Protesto
set /p protesto=
echo(
Echo Informe dias para protesto (2 digitos)
set /p dias=
 

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%00%contac%','%titular%','02                  ','   ','%agenciac%00%contac%','00000               ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','           ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','341                  ','                 ','         ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (341,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,29,38,62,63,70,0,0,84,86,109,110,111,120,121,126,127,139,0,0,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,264,275,314,315,326,327,334,335,349,350,351,108,108,'I'                   ,395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'                    ',0,0,0,0,0,0,0,0,0,0,'    ',1,9,'01REMESSA           ',10,26,'01COBRANCA     ',27,38,47,76,95,100,0,0,'                    ',18,19,'CA' ,395,400,1                   ,0,0,'  ',0,0,77,79,80,94,140,142,'    ',392,393,0,0,'          ','            ',63,70,0,0,'          ',0,0,'                    ' ,0,0,34,37,'0000',71,83,'0000000000000',176,188,0,0,215,227,'2005-10-27','2017-08-07', >> "%arqHomolog%"
echo 'DECISAO' ,'DECISAO' ,'        ','%horaFormatada%',0,0,1,1,153,165,166,168,169,172,378,385,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,280,292,83,85,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=341; >> "%arqHomolog%"
echo update banco set (bannom) = ('BANCO ITAU SA') where bancod=341 >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:SANTANDER_DIFACT
Echo Santander:
echo(
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia sem digito 
set /p agencia=
echo(
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(
Echo Informe o Codigo de Transmissao Cnab400(Informado Pelo Santander)
set /p transmissao=
set transmissaoc=%transmissao%
set "transmissaoc=000000000000000000%transmissaoc%"
set "transmissaoc=%transmissaoc:~-20%"
echo(
Echo Informe o Convenio (Informado Pelo Santander)
set /p convenio=
echo(
Echo Informe o Coplemento (Informado Pelo Santander)
set /p complemento=
echo(
Echo Informe a Carteira (3 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
echo(
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 4 - Sim
set /p cmulta=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
echo(
Echo Protesto?
Echo 00 - Sem prostesto
Echo 06 - Com Protesto Automatico
set /p protesto=
echo(
Echo Informe dias para protesto, no minimo 05 dias. (2 digitos)
set /p dias=
echo(
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 5 - Factoring
set /p papeleta=
echo(
Echo Banco Emitente informar 00000 se Factoring emitente informar numero da agencia (3 Digito)
set /p cobrador=


echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%transmissao%','%titular%','02                  ','   ','%convenio%             ','                    ','%protesto%               ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio% ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-07-20','        ','DECISAO ','        ','17:42:25','033                 ','%cobrador%               ','%convenio%             ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (33,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,0,0,38,62,63,70,0,0,0,0,109,110,111,120,121,126,127,139,143,147,63,65,148,149,01                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,383,385,'I%complemento%'                 ,395,400,0,0,0,0,0,0,0,0,18,37,102,108,78,78,79,82,'%multac%'                ,0,0,0,0,0,0,0,0,83,84,'00'  ,10,11,01                  ,12,26,'COBRANCA'       ,27,46,47,76,95,100,101,116,'0000000000000000'    ,0,0,'   ',395,400,'000001'              ,0,0,'  ',0,0,77,79,80,94,140,142,%cmulta%   ,392,393,0,0,'%transmissao%','00000%papeleta%'              ,63,73,0,0,'                                                 ',0,0,'                                                  ',0,0,143,147,00000                                             ,71,76,000000                                            ,178,188,189,201,215,22,'2005-10-27','2017-07-25', >> "%arqHomolog%"
echo 'DECISAO' ,'DECISAO','        ','15:14:26',0,0,1,1,153,165,166,168,169,173,0,0,1,26,'02RETORNO01COBRANCA' ,395,400,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=33; >> "%arqHomolog%"
echo update banco set (bannom) = ('SANTANDER') where bancod=33 >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:SAFRA_DIFACT
Echo Safra:
echo(
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
echo(
Echo Informe a Carteira ( 1 digitos)
set /p carteira=
echo(
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Obsrvacao o safra so permite duas instrucoes se for cobrar multa e juros, nao sera possivel o protesto automatico.
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Primeira Instrucao?
Echo 16 - Multa
Echo 10 - Protesto Automatico
set /p cmulta=
echo(
Echo Segunda Instrucao?
Echo 01 - Juros
Echo 10 - Com Protesto Automatico
set /p protesto=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
echo(
Echo Informe dias para protesto (2 digitos)
set /p dias=
 

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%%contac%','%titular%',02              ,'        ','%agenciac%%contac%','%agencia%','%cmulta%','%protesto%','        ','%juros%' ,'      '  ,'        ','        ','        ','        ','        ','        ','%dias%'  ,'        ','0001-01-01',' 2018-02-27','         ','DECISAO   ','          ','09:31:16  ','        ','          ','          ','1         ',0         , '0.00      ','1         ','%multa%') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (422,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,63,71,0,0,108,108,109,110,111,120,121,126,127,139,0,0,143,147,148,149,1,150,150,'N',151,156,157,158,159,160,161,173,25.00,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,324,327,334,335,349,350,351,389,391,'000',395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,1 ,12,19,'COBRANCA'       ,27,40,47,76,95,100,0,0,''  ,0,0,''   ,395,400,1                   ,0,0,''  ,392,394,77,79,80,90,140,142,''    ,0,0,0,0,''                    ,''                    ,63,71,0,0,''                                                  ,0,0,'' ,0,0,102,104,'000',106,107,'%dias%',176,188,189,201,215,227,'2005-10-27','2018-02-22', >> "%arqHomolog%"
echo 'DECISAO','DECISAO',''        ,'15:09:58',0,0,0,0,153,165,166,168,169,173,105,107,3,19,'RETORNO01COBRANCA',392,394,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=422 >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:CEF_DIFACT
Echo Caixa Economica Fedral:
echo(
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia sem digito 
set /p agencia=
echo(
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-7%"
echo(
Echo Informe o Codigo do Beneficiario
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-7%"
echo(
Echo Disribui  o do Boleto (Se emitente Factoring)
Echo 11 (titulo Registrado, emissao CAIXA)
Echo 14 (titulo Registrado, emissao Beneficiario)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-2%"
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
echo(
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
echo(
Echo Protesto?
Echo 02 - Sem prostesto
Echo 01 - Com Protesto Automatico
set /p protesto=
echo(
Echo Informe dias para protesto, no minimo 05 dias. OBs: Sem protesto deixar em branco (2 digitos)
set /p dias=
echo(
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 2 - Factoring
set /p papeleta=
echo(

 
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%%convenioc%','%titular%'       ,'02'  ,' ','%convenioc%','00000' ,'%protesto%','00','00','%juros%' ,'%papeleta%'  ,'        ','        ','%agenciac%%convenioc%','        ','        ','        ','%dias%'  ,'1 ','0001-01-01','2018-02-27','','DECISAO ','','09:31:16','000','104 ','','0','0','0.00','1','%multa%') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (104,32,56,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,21,27,32,56,57,73,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,147,148,149,02                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,29,31,000                 ,395,400,368,389,28,28,0,0,85,106,0,0,0,0,0,0,0,0,'  ',0,0,0,0,0,0,0,0,394,394,1   ,10,11,1                   ,12,26,'COBRANCA' ,27,36,47,76,95,100,0,0, ' ' ,0,0,' ',395,400,000001              ,0,0,' ',390,394,77,79,80,94,18,20,'',0,0,390,391,' ' ,' ' ,57,73,101,103,'007',0,0,' ',0,0,107,108,'01',392,393,'%dias%',176,188,0,0,215,217,'2005-10-27','2018-04-30', >> "%arqHomolog%"
echo 'DECISAO','DECISAO' ,' ' ,'14:56:49',0,0,1,1,153,165,166,168,169,173,80,82,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,0,0,107,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=104; >> "%arqHomolog%"
echo update banco set (bannom) = ('CAIXA ECONOMICA') where bancod=104  >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:INTER_DIFACT
Echo Inter:
echo(	
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia sem digito 
set /p agencia=
echo(
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-10%"
echo(
Echo Informe a Carteira (3 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(
Echo Ira cobrar Juros ?
Echo 0 - Nao
Echo 1 - Sim
set /p cjuros=
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
for /f "tokens=1,2 delims=." %%a in ("%juros%") do set jurosc=%%a%%b
set "jurosc=00000%jurosc%"
set "jurosc=%jurosc:~-4%"
echo(
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
echo(
Echo Data limite de pagamento ap s vencimento ?
Echo 30 - dias
Echo 60 - dias
set /p lpag=

 
echo update carban set (cabdtinrg, cabdtalrg, cabusuinc, cabusualt, cabhrinrg, cabhralrg, cabcedente, cabcconson, cabccoultr, cabccolay, cabresimp, cabcodemib, ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem, cabsit, cabarqmod, cabdirret, cabdirrem, cabarqbol) = >> "%arqHomolog%"
echo ('%dataAtual%', '%dataAtual%', '        ', 'DECISAO ', '14:50:20', '%horaFormatada%', '                    ', 0, 0, 0, '  ', '          ', '                    ', '%titular%                ', '                    ', '   ', '%carteirac%%agenciac%%contac%', '00000               ', '%cmulta%', '%cjuros%', '                    ', %juros%, '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', ' ', '1', '0001-01-01', '%dataAtual%', '        ', 'DECISAO ', '        ', '%horaFormatada%', '%lpag%', '                    ', '                    ', 1, 0, 0.00, 1, %multa%, 'A', '', '', 'C:\DIFACTW\EXPORTAR\', '') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (77, 38, 62, 90, 91, 92, 97, 0, 0, 0, 0, 160, 172, 0, 0, 0, 0, 0, 0, 21, 37, 38, 62, 66, 70, 0, 0, 0, 0, 109, 110, 111, 120, 121, 126, 127, 139, 0, 0, 0, 0, 148, 149, '99                  ', 150, 150, 'N', 151, 156, 66, 66, 160, 160, 161, 173, %juros%, 0, 0, 185, 197, 198, 201, 202, 220, 221, 222, 0, 223, 236, 237, 276, 277, 316, 0, 0, 317, 324, 0, 0, 0, 0, 90, 100, '00000000000         ', 395, 400, 0, 0, 0, 0, 0, 0, 325, 394, 0, 0, 0, 0, 0, 0, 67, 79, '0000000000000       ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '    ', 1, 9, '01REMESSA           ', 10, 26, '01COBRANCA     ', 27, 46, 47, 76, 95, 100, 0, 0, '                    ', 0, 0, '   ', 395, 400, '1                   ', 0, 0, '  ', 111, 117, 77, 79, 80, 94, 140, 141, '    ', 0, 0, 0, 0, '       ', '                    ', 71, 81, 0, 0, '                                                  ', 0, 0, '                                                  ', 0, 0, 80, 83, '%multac%', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2005-10-27', '%dataAtual%', >> "%arqHomolog%"
echo  'DECISAO ', 'DECISAO ', '        ', '%horaFormatada%', 0, 0, 1, 1, 125, 137, 138, 140, 141, 144, 241, 380, 0, 0, '                    ', 0, 0, 98, 107, 0, 0, 0, 0, 87, 89, 0, 0, 0, 0, 0, 0) >> "%arqHomolog%"
echo where ban3cod=77; >> "%arqHomolog%"
echo update banco set (bannom) = ('Inter') where bancod=77  >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:BMP_DIFACT
Echo Beneficiario da conta (Maximo 50 Caracteres)
set /p titular=
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

Echo Informe a Agencia sem digito 
set /p agencia=
echo(
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(
Echo Informe o Codigo da Empresa 
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
echo(
Echo Informe a Carteira (3 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
echo(
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
echo(
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
echo(

Echo Informe dias para protesto. (2 digitos, caso nao tenha interesse informar 00)
set /p dias=

 
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%dias%                  ','00','                    ',%juros%,'2','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','%horaFormatada%','000                 ','000','                    ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> "%arqHomolog%"
echo (274,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,52,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> "%arqHomolog%"
echo where ban3cod=274; >> "%arqHomolog%"
echo update banco set (bannom) = ('BMP Money Plus') where bancod=274  >> "%arqHomolog%"
Echo Arquivo Gerado:
echo Salvando em: "%arqHomolog%"
Pause
Exit

:SICREDI_DIFACT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p cnpj=CNPJ do beneficiario: 
set "cnpjc=%cnpj%"
set "cnpjc=%cnpjc:.=%"
set "cnpjc=%cnpjc:-=%"
set "cnpjc=%cnpjc:/=%"
set "cnpjc=%cnpjc: =%"
set "cnpjc=%cnpjc:~0,14%"
echo(
set /p agencia=Agencia (sem digito): 
echo(
set /p conta=Conta (sem digito): 
echo(
set /p posto=Posto do beneficiario (2 digitos): 
set "ccbagecob=%posto%" 
echo(

:ENTRADA_JUROS_SICREDI
set /p juros=Juros A.M. (Ex: 5.00 / sem juros = 0): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_SICREDI
)
echo(

:PERGUNTA_MULTA_SICREDI
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_INSTRUCAO_SICREDI
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_SICREDI
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_SICREDI

:DIGITA_MULTA_SICREDI
set /p multa=Informe o valor da Multa (Ex:2.00): 
echo( 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_SICREDI
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_INSTRUCAO_SICREDI
echo(

:PERGUNTA_INSTRUCAO_SICREDI
Echo Instrucao automatica:
echo(
Echo 6 - Protesto Automatico
REM --- Echo 7 - Negativacao Automatica
Echo 0 - Sem instrucao
echo(
set /p cInstrucao=Digite a opcao: 
set "cInstrucao=%cInstrucao: =%"
echo(

if "%cInstrucao%"=="6" (
    set "ccbinstr1=06"
    set "ccbinstr2=00"
    set "dmprzproi=159"
    set "dmprzprof=160"
    goto :DIGITA_DIAS_SICREDI
)
rem --- if "%cInstrucao%"=="7" (
rem ---     set "ccbinstr1=00"
rem ---     set "ccbinstr2=06"
rem ---     set "dmprzproi=195"
rem ---     set "dmprzprof=196"
rem ---     goto :DIGITA_DIAS_SICREDI 
rem --- )
rem --- Instrucao 2 bloqueada em codigo.

if "%cInstrucao%"=="0" (
    set "ccbinstr1=00"
    set "ccbinstr2=00"
    set "ccbprzpro=00"
    set "dmprzproi=0"
    set "dmprzprof=0"
    goto :GERAR_ARQUIVO_SICREDI
)
echo Opcao invalida! Tente novamente.
echo(
goto :PERGUNTA_INSTRUCAO_SICREDI

:DIGITA_DIAS_SICREDI
set /p dias=Quantos dias apos o vencimento? (min 3 - max 99): 
echo(
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_SICREDI
)
set "ccbprzpro=%dias%"
goto :GERAR_ARQUIVO_SICREDI
echo(

:GERAR_ARQUIVO_SICREDI
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%conta%','%titular%','AAA                 ','   ','%conta%                 ','%ccbagecob%                  ','%ccbinstr1%                  ','%ccbinstr2%                  ','                         ',%juros%,'B                        ','                         ','                         ','%conta%       ','                         ','                         ','                         ','%ccbprzpro%   ','                         ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','                         ','%cnpjc%',1,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmespdocsi, dmespdocsf, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsaccepi, dmsaccepf, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmvariaci, dmvariacf, dmvariacc, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmdatgravi, hmdatgravf, hmsequenci, hmsequencf, hmsequencc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmprzproi, dmprzprof, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, ban3dtinrg, ban3dtalrg, ban3usuinc, ban3usualt, hmnumconi, hmnumconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dnoutreci, dnoutrecf, hncconumi, hncconumf, hnbancodi, hnbancodf) = >> "%arqHomolog%"
echo (748,0,0,109,110,111,116,228,240,241,253,254,266,267,279,17,19,0,0,0,0,0,0,48,56,0,0,0,0,109,110,111,120,121,126,127,139,0,0,150,150,'N',151,156,157,158,193,194,161,173,%juros%,174,179,180,192,206,218,219,219,0,221,234,235,274,275,314,327,334,395,400,354,394,74,74,220,220,0,1,9,'01REMESSA',10,26,'01COBRANCA',27,31,95,102,395,400,'000001',111,117,77,79,80,94,%dmprzproi%,%dmprzprof%,48,62,391,394,'2.00                                      ',0,'00000',340,353,149,149,'A',335,339,'00000',176,188,189,201,'%dataAtual%','%dataAtual%','DECISAO','DECISAO',32,45,153,165,0,0,0,0,319,328,1,26,'02RETORNO01COBRANCA',111,117,117,126,280,292,27,31,77,79) >> "%arqHomolog%"
echo where ban3cod=748; >> "%arqHomolog%"
echo update banco set (bannom) = ('SICREDI') where bancod=748  >> "%arqHomolog%"
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:DISECURIT
echo(
ECHO Disecurit - Homologacao CNAB 400
echo(
ECHO 1. Banco do Brasil
ECHO 2. Bradesco
ECHO 3. Itau
ECHO 4. Santander
ECHO 5. Safra
ECHO 6. Caixa E.F.
ECHO 7. INTER
ECHO 8. MONEY PLUS
ECHO 9. SICREDI
echo(

SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter: 
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
echo(

IF "%Choice%" == "1" (echo 1. Banco do Brasil & echo( & GOTO :BB_DISECURIT)
IF "%Choice%" == "2" (echo 2. Bradesco & echo( & GOTO :BRADESCO_DISECURIT)
IF "%Choice%" == "3" (echo 3. Itau & echo( & GOTO :ITAU_DISECURIT)
IF "%Choice%" == "4" (echo 4. Santander & echo( & GOTO :SANTANDER_DISECURIT)
IF "%Choice%" == "5" (echo 5. Safra & echo( & GOTO :SAFRA_DISECURIT)
IF "%Choice%" == "6" (echo 6. CAIXA ECOMICA FEDERAL: & echo( & GOTO :CEF_DISECURIT)
IF "%Choice%" == "7" (echo 7. INTER & echo( & GOTO :INTER_DISECURIT)
IF "%Choice%" == "8" (echo 8. MONEY PLUS & echo( & GOTO :BMP_DISECURIT)
IF "%Choice%" == "9" (echo 9. SICREDI & echo( & GOTO :SICREDI_DISECURIT)

ECHO  %Choice%  opcao nao valida, tente novamente!
GOTO :DISECURIT

:BB_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia com digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Informe a Conta com digito: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
echo(
set /p convenio=Informe o Convenio: 
echo(
set /p carteira=Informe a Carteira (2 digitos): 
echo(
set /p variacao=Informe a Variacao (3 digitos): 
echo(

:ENTRADA_JUROS_BB
set /p juros=Informe os Juros A.M. (Ex:3.60): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_BB
)
echo(

:ENTRADA_MULTA_BB
set /p multa=Informe Multa (Ex:6.00): 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_MULTA_BB
)
echo(

:PERGUNTA_PROTESTO_BB
Echo Protesto?
echo(
Echo 07 - Sem prostesto
Echo 03 - Envio apos 3 dias uteis do vencimento
Echo 04 - Envio apos 4 dias uteis do vencimento
Echo 05 - Envio apos 5 dias uteis do vencimento
echo 10 - Envio apos 10 dias corridos do vencimento
echo 15 - Envio apos 15 dias corridos do vencimento
echo 20 - Envio apos 20 dias corridos do vencimento
echo 25 - Envio apos 25 dias corridos do vencimento
echo 30 - Envio apos 30 dias corridos do vencimento
echo 45 - Envio apos 45 dias corridos do vencimento
echo(
set /p protesto=Digite a opcao: 
set "protesto=%protesto: =%"


if "%protesto%"=="07" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="03" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="04" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="05" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="10" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="15" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="20" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="25" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="30" goto :GERAR_ARQUIVO_BB
if "%protesto%"=="45" goto :GERAR_ARQUIVO_BB

echo Opcao invalida! Tente novamente.
echo(
goto :PERGUNTA_PROTESTO_BB

:GERAR_ARQUIVO_BB
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%%contac%000000','%titular%','02                  ','   ','%agenciac%%contac%      ','0000                ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio%','                    ','                    ',' 000000                ','                  ','7                   ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','                    ','001                 ','%convenio%',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (1,39,63,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,64,80,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,146,148,149,'1                   ',150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,271,275,314,315,326,327,334,335,349,350,351,92,94,'                    ',395,400,352,391,0,0,88,88,0,0,81,84,0,0,89,91,92,94,'%variacao%                 ',32,38,95,95,0,0,96,101,0,0,'    ',10,11,'1                   ',12,19,'COBRANCA       ',27,46,47,76,95,100,0,0,'                    ',0,0,'   ',395,400,'1                   ',0,0,'  ',101,107,77,79,80,94,0,0,'    ',392,393,0,0,'0000                ','                    ',64,80,0,0,'                                                  ',0,0,'                                                  ',0,0,0,0,'                                                  ',0,0,'                                                  ',182,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO ','DECISAO ','        ','10:45:37',130,136,1,1,153,165,166,168,169,173,87,88,1,9,'02RETORNO           ',101,107,117,126,0,0,280,292,107,108) >> "%arqHomolog%"
echo where ban3cod=1 >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:BRADESCO_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(
set /p convenio=Informe o Codigo da Empresa: 
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
echo(
set /p carteira=Informe a Carteira (3 digitos): 
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(

:ENTRADA_JUROS_BRADESCO
set /p juros=Informe os Juros A.M. (Ex:2.50): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_BRADESCO
)
echo(

:PERGUNTA_MULTA_BRADESCO
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_PROTESTO_BRADESCO
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_BRADESCO
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_BRADESCO

:DIGITA_MULTA_BRADESCO
set /p multa=Informe o valor da Multa (Ex:7.00):
echo( 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_BRADESCO
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_PROTESTO_BRADESCO
echo(

:PERGUNTA_PROTESTO_BRADESCO
Echo Protesto?
echo(
Echo 0 - Sem protesto
Echo 6 - Com Protesto Automatico
echo(
set /p cprotesto=Digite a opcao: 
set "cprotesto=%cprotesto: =%"
echo(
if "%cprotesto%"=="0" (
    set "protesto=00"
    set "dias=00"
    goto :PERGUNTA_PAPELETA_BRADESCO
)
if "%cprotesto%"=="6" (
    set "protesto=06"
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
echo Opcao invalida! Digite apenas 0 ou 6.
echo(
goto :PERGUNTA_PROTESTO_BRADESCO

:DIGITA_DIAS_PROTESTO_BRADESCO
set /p dias=Informe dias para protesto (minimo 05 dias): 
echo(
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 2 numeros. & echo(
    goto :DIGITA_DIAS_PROTESTO_BRADESCO
)
goto :PERGUNTA_PAPELETA_BRADESCO
echo(

:PERGUNTA_PAPELETA_BRADESCO
Echo Emitente da Papeleta?
echo(
Echo 1 - Banco
Echo 2 - Securitizadora
echo(
set /p papeleta=Digite a opcao: 
set "papeleta=%papeleta: =%"
if "%papeleta%"=="1" goto :GERAR_ARQUIVO_BRADESCO
if "%papeleta%"=="2" goto :GERAR_ARQUIVO_BRADESCO
echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_PAPELETA_BRADESCO

:GERAR_ARQUIVO_BRADESCO
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%protesto%                  ','%dias%               ','                    ',%juros%,'%papeleta%            ','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','%horaFormatada%','000                 ','000','                    ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (237,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,62,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108) >> "%arqHomolog%"
echo where ban3cod=237; >> "%arqHomolog%"
echo update banco set (bannom) = ('BRADESCO') where bancod=237  >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:ITAU_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
set /p conta=Informe a Conta com digito: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-6%"
echo(
set /p carteira=Informe a Carteira (3 digitos): 
echo(

:ENTRADA_JUROS_ITAU
set /p juros=Informe os Juros A.M. (Ex:4.00): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_ITAU
)
echo(

:ENTRADA_MULTA_ITAU
set /p multa=Informe Multa (Ex:9.00): 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_MULTA_ITAU
)
echo(

:PERGUNTA_PROTESTO_ITAU
Echo Protesto?
echo(
Echo 8 - Com Protesto Automatico
Echo 9 - Sem Protesto
echo(
set /p cprotesto=Digite a opcao: 
set "cprotesto=%cprotesto: =%"
if "%cprotesto%"=="8" (
    set "protesto=09"
    goto :DIGITA_DIAS_PROTESTO_ITAU
)
if "%cprotesto%"=="9" (
    set "protesto=10"
    set "dias=00"
    goto :GERAR_ARQUIVO_ITAU
)
echo Opcao invalida! Digite apenas 8 ou 9.
echo(
goto :PERGUNTA_PROTESTO_ITAU

:DIGITA_DIAS_PROTESTO_ITAU
echo(
set /p dias=Informe dias para protesto (2 digitos): 
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_PROTESTO_ITAU
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 2 numeros. & echo(
    goto :DIGITA_DIAS_PROTESTO_ITAU
)
goto :GERAR_ARQUIVO_ITAU

:GERAR_ARQUIVO_ITAU
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%00%contac%','%titular%','02                  ','   ','%agenciac%00%contac%','00000               ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','           ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','341                  ','                 ','         ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (341,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,29,38,62,63,70,0,0,84,86,109,110,111,120,121,126,127,139,0,0,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,264,275,314,315,326,327,334,335,349,350,351,108,108,'I'                   ,395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'                    ',0,0,0,0,0,0,0,0,0,0,'    ',1,9,'01REMESSA           ',10,26,'01COBRANCA     ',27,38,47,76,95,100,0,0,'                    ',18,19,'CA' ,395,400,1                   ,0,0,'  ',0,0,77,79,80,94,140,142,'    ',392,393,0,0,'          ','            ',63,70,0,0,'          ',0,0,'                    ' ,0,0,34,37,'0000',71,83,'0000000000000',176,188,0,0,215,227,'2005-10-27','2017-08-07', >> "%arqHomolog%"
echo 'DECISAO' ,'DECISAO' ,'        ','%horaFormatada%',0,0,1,1,153,165,166,168,169,172,378,385,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,280,292,83,85) >> "%arqHomolog%"
echo where ban3cod=341; >> "%arqHomolog%"
echo update banco set (bannom) = ('BANCO ITAU SA') where bancod=341 >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:SANTANDER_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(
set /p transmissao=Informe o Codigo de Transmissao Cnab400 (Informado Pelo Santander): 
set transmissaoc=%transmissao%
set "transmissaoc=000000000000000000%transmissaoc%"
set "transmissaoc=%transmissaoc:~-20%"
echo(
set /p convenio=Informe o Convenio: 
echo(
set /p complemento=Informe o Complemento: 
echo(
set /p carteira=Informe a Carteira (3 digitos): 
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(

:ENTRADA_JUROS_SANTANDER
set /p juros=Informe os Juros (A.M. Ex:6.00): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_SANTANDER
)
echo(

:PERGUNTA_MULTA_SANTANDER
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 4 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_PROTESTO_SANTANDER
)
if "%cmulta%"=="4" (
    goto :DIGITA_MULTA_SANTANDER
)
echo Opcao invalida! Digite apenas 0 ou 4.
echo(
goto :PERGUNTA_MULTA_SANTANDER

:DIGITA_MULTA_SANTANDER
set /p multa=Informe o valor da Multa (Ex:10.00): 
echo(
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_SANTANDER
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_PROTESTO_SANTANDER
echo(

:PERGUNTA_PROTESTO_SANTANDER
Echo Protesto?
echo(
Echo 0 - Sem protesto
Echo 6 - Com Protesto Automatico
echo(
set /p cprotesto=Digite a opcao: 
set "cprotesto=%cprotesto: =%"
echo(
if "%cprotesto%"=="0" (
    set "protesto=00"
    set "dias=00"
    goto :PERGUNTA_PAPELETA_SANTANDER
)
if "%cprotesto%"=="6" (
    set "protesto=06"
    goto :DIGITA_DIAS_PROTESTO_SANTANDER
)
echo Opcao invalida! Digite apenas 0 ou 6.
echo(
goto :PERGUNTA_PROTESTO_SANTANDER

:DIGITA_DIAS_PROTESTO_SANTANDER
set /p dias=Informe dias para protesto, no minimo 05 dias (2 digitos): 
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_PROTESTO_SANTANDER
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 2 numeros. & echo(
    goto :DIGITA_DIAS_PROTESTO_SANTANDER
)
goto :PERGUNTA_PAPELETA_SANTANDER
echo(

:PERGUNTA_PAPELETA_SANTANDER
Echo Emitente da Papeleta?
echo(
Echo 1 - Banco
Echo 5 - Securitizadora
echo(
set /p cpapeleta=Digite a opcao: 
set "cpapeleta=%cpapeleta: =%"
echo(
if "%cpapeleta%"=="1" (
    set "papeleta=1"
    set "cobrador=00000"
    goto :GERAR_ARQUIVO_SANTANDER
)
if "%cpapeleta%"=="5" (
    set "papeleta=5"
    set "cobrador=%agencia%"
    goto :GERAR_ARQUIVO_SANTANDER
)
echo Opcao invalida! Digite apenas 1 ou 5.
echo(
goto :PERGUNTA_PAPELETA_SANTANDER

:GERAR_ARQUIVO_SANTANDER
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%transmissao%','%titular%','02                  ','   ','%convenio%             ','                    ','%protesto%               ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio% ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-07-20','        ','DECISAO ','        ','17:42:25','033                 ','%cobrador%               ','%convenio%             ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (33,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,0,0,38,62,63,70,0,0,0,0,109,110,111,120,121,126,127,139,143,147,63,65,148,149,01                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,383,385,'I%complemento%'                 ,395,400,0,0,0,0,0,0,0,0,18,37,102,108,78,78,79,82,'%multac%'                ,0,0,0,0,0,0,0,0,83,84,'00'  ,10,11,01                  ,12,26,'COBRANCA'       ,27,46,47,76,95,100,101,116,'0000000000000000'    ,0,0,'   ',395,400,'000001'              ,0,0,'  ',0,0,77,79,80,94,140,142,%cmulta%   ,392,393,0,0,'%transmissao%','00000%papeleta%'              ,63,73,0,0,'                                                 ',0,0,'                                                  ',0,0,143,147,00000                                             ,71,76,000000                                            ,178,188,189,201,215,22,'2005-10-27','2017-07-25', >> "%arqHomolog%"
echo 'DECISAO' ,'DECISAO','        ','15:14:26',0,0,1,1,153,165,166,168,169,173,0,0,1,26,'02RETORNO01COBRANCA' ,395,400,117,126,0,0,280,292,108,108) >> "%arqHomolog%"
echo where ban3cod=33; >> "%arqHomolog%"
echo update banco set (bannom) = ('SANTANDER') where bancod=33 >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:SAFRA_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia: 
for /f "tokens=* delims=0" %%a in ("%agencia%") do set agenciaSemZeros=%%a
set agenciac=%agenciaSemZeros%00000
set "agenciac=%agenciac:~0,5%"
echo(
set /p conta=Informe a Conta com digito: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
echo(
Echo ..................................................................................................................
Echo ..................................................................................................................
Echo Obsrvacao: o Safra so permite duas instrucoes, se for cobrar multa e juros nao sera possivel o protesto automatico.
Echo ..................................................................................................................
Echo ..................................................................................................................

:PERGUNTA_COMBINACAO_SAFRA
Echo Escolha a combinacao de instrucoes:
echo(
Echo 1 - Apenas Multa
Echo 2 - Apenas Juros
Echo 3 - Apenas Protesto Automatico
Echo 4 - Multa + Juros
Echo 5 - Multa + Protesto
Echo 6 - Juros + Protesto
Echo 7 - Nenhuma instrucao
echo(
set /p cCombinacao=Digite a opcao: 
set "cCombinacao=%cCombinacao: =%"
echo(

if "%cCombinacao%"=="1" (
    set "cmulta=16"
    set "protesto=00"
    set "juros=0.00"
    set "dias=00"
    goto :DIGITA_MULTA_SAFRA
)
if "%cCombinacao%"=="2" (
    set "cmulta=00"
    set "multa=0.00"
    set "protesto=01"
    set "dias=00"
    goto :DIGITA_JUROS_SAFRA
)
if "%cCombinacao%"=="3" (
    set "cmulta=00"
    set "multa=0.00"
    set "protesto=10"
    set "juros=0.00"
    goto :DIGITA_DIAS_PROTESTO_SAFRA
)
if "%cCombinacao%"=="4" (
    set "protesto=00"
    set "dias=00"
    goto :DIGITA_MULTA_SAFRA
)
if "%cCombinacao%"=="5" (
    set "juros=0.00"
    goto :DIGITA_MULTA_SAFRA
)
if "%cCombinacao%"=="6" (
    set "cmulta=00"
    set "multa=0.00"
    goto :DIGITA_JUROS_SAFRA
)
if "%cCombinacao%"=="7" (
    set "cmulta=00"
    set "multa=0.00"
    set "protesto=00"
    set "juros=0.00"
    set "dias=00"
    goto :GERAR_ARQUIVO_SAFRA
)

echo Opcao invalida! Tente novamente.
echo(
goto :PERGUNTA_COMBINACAO_SAFRA

:DIGITA_MULTA_SAFRA
set /p multa=Informe o valor da Multa (Ex: 2.00): 
echo( 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_SAFRA
)
if "%cCombinacao%"=="1" goto :GERAR_ARQUIVO_SAFRA
if "%cCombinacao%"=="4" goto :DIGITA_JUROS_SAFRA
if "%cCombinacao%"=="5" goto :DIGITA_DIAS_PROTESTO_SAFRA
goto :GERAR_ARQUIVO_SAFRA
echo(

:DIGITA_JUROS_SAFRA
set /p juros=Informe o valor dos Juros (Ex: 9.00): 
echo( 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_JUROS_SAFRA
)
if "%cCombinacao%"=="4" (set "cmulta=16" & set "protesto=01")
if "%cCombinacao%"=="6" goto :DIGITA_DIAS_PROTESTO_SAFRA
goto :GERAR_ARQUIVO_SAFRA
echo(
 
:DIGITA_DIAS_PROTESTO_SAFRA
set /p dias=Informe dias para protesto (2 digitos): 
echo(
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_PROTESTO_SAFRA
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 2 numeros. & echo(
    goto :DIGITA_DIAS_PROTESTO_SAFRA
)
if "%cCombinacao%"=="5" (set "cmulta=16" & set "protesto=10")
if "%cCombinacao%"=="6" (set "protesto=10" & set "cmulta=01")
goto :GERAR_ARQUIVO_SAFRA

:GERAR_ARQUIVO_SAFRA
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%agenciac%%contac%','%titular%',02              ,'        ','%agenciac%%contac%','%agencia%','%cmulta%','%protesto%','        ','%juros%' ,'      '  ,'        ','        ','        ','        ','        ','        ','%dias%'  ,'        ','0001-01-01',' 2018-02-27','         ','DECISAO   ','          ','09:31:16  ','        ','          ','          ','1         ',0         , '0.00      ','1         ','%multa%') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (422,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,63,71,0,0,108,108,109,110,111,120,121,126,127,139,0,0,143,147,148,149,1,150,150,'N',151,156,157,158,159,160,161,173,25.00,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,324,327,334,335,349,350,351,389,391,'000',395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,1 ,12,19,'COBRANCA'       ,27,40,47,76,95,100,0,0,''  ,0,0,''   ,395,400,1                   ,0,0,''  ,392,394,77,79,80,90,140,142,''    ,0,0,0,0,''                    ,''                    ,63,71,0,0,''                                                  ,0,0,'' ,0,0,102,104,'000',106,107,'%dias%',176,188,189,201,215,227,'2005-10-27','2018-02-22', >> "%arqHomolog%"
echo 'DECISAO','DECISAO',''        ,'15:09:58',0,0,0,0,153,165,166,168,169,173,105,107,3,19,'RETORNO01COBRANCA',392,394,117,126,0,0,280,292,108,108) >> "%arqHomolog%"
echo where ban3cod=422 >> "%arqHomolog%"
Echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:CEF_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-7%"
echo(
set /p convenio=Informe o Codigo do Beneficiario: 
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-7%"
echo(

:PERGUNTA_JUROS_CEF
Echo Cobrar Juros ?
echo(
Echo 0 - Nao
Echo 1 - Sim
echo(
set /p cjuros=Digite a opcao: 
set "cjuros=%cjuros: =%"
echo(
if "%cjuros%"=="0" (
    set "juros=0.00"
    set "jurosc=0000"
    goto :PERGUNTA_MULTA_CEF
)
if "%cjuros%"=="1" (
    goto :DIGITA_JUROS_CEF
)
echo Opcao invalida! Digite apenas 0 ou 1.
echo(
goto :PERGUNTA_JUROS_CEF

:DIGITA_JUROS_CEF
set /p juros=Informe o valor dos Juros A.M. (Ex:10.00): 
echo( 
if "%juros%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_JUROS_CEF
)
for /f "tokens=1,2 delims=." %%a in ("%juros%") do set jurosc=%%a%%b
set "jurosc=00000%jurosc%"
set "jurosc=%jurosc:~-4%"
goto :PERGUNTA_MULTA_CEF
echo(

:PERGUNTA_MULTA_CEF
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_PROTESTO_CEF
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_CEF
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_CEF

:DIGITA_MULTA_CEF
set /p multa=Informe o valor da Multa (Ex:2.00): 
echo
if "%multa%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_MULTA_CEF
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_PROTESTO_CEF
echo(

:PERGUNTA_PROTESTO_CEF
Echo Protesto?
echo(
Echo 1 - Com Protesto Automatico
Echo 2 - Sem protesto
echo(
set /p cprotesto=Digite a opcao: 
set "cprotesto=%cprotesto: =%"
echo(
if "%cprotesto%"=="1" (
    set "protesto=01"
    goto :DIGITA_DIAS_PROTESTO_CEF
)
if "%cprotesto%"=="2" (
    set "protesto=02"
    set "dias=00"
    goto :PERGUNTA_PAPELETA_CEF
)
echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_PROTESTO_CEF

:DIGITA_DIAS_PROTESTO_CEF
set /p dias=Informe dias para protesto (minimo 05, 2 digitos): 
set "dias=%dias: =%"
echo(
if "%dias%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_DIAS_PROTESTO_CEF
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo(
    echo Valor invalido! Digite exatamente 2 numeros.
    echo(
    goto :DIGITA_DIAS_PROTESTO_CEF
)
goto :PERGUNTA_PAPELETA_CEF
echo(

:PERGUNTA_PAPELETA_CEF
Echo Emitente da Papeleta?
echo(
Echo 1 - Banco
Echo 2 - Securitizadora
echo(
set /p papeleta=Digite a opcao: 
set "papeleta=%papeleta: =%"
echo(
if "%papeleta%"=="1" goto :GERAR_ARQUIVO_CEF
if "%papeleta%"=="2" goto :GERAR_ARQUIVO_CEF
echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_PAPELETA_CEF

:GERAR_ARQUIVO_CEF 
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo (%agenciac%%convenioc%,'%titular%'       ,'02'  ,' ','%convenioc%','00000' ,'%protesto%','00','00','%juros%' ,'%papeleta%'  ,'        ','        ','%agenciac%%convenioc%','        ','        ','        ','%dias%'  ,'1 ','0001-01-01','2018-02-27','','DECISAO ','','09:31:16',000,'104 ','','0','0','0.00','1','%multa%') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (104,32,56,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,21,27,32,56,57,73,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,147,148,149,02                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,29,31,000                 ,395,400,368,389,28,28,0,0,85,106,0,0,0,0,0,0,0,0,'  ',0,0,0,0,0,0,0,0,394,394,1   ,10,11,1                   ,12,26,'COBRANCA' ,27,37,47,76,95,100,0,0, ' ' ,0,0,' ',395,400,000001              ,0,0,' ',390,394,77,79,80,94,18,20,'',0,0,390,391,' ' ,' ' ,57,73,101,103,'007',0,0,' ',0,0,107,108,'01',392,393,'%dias%',176,188,0,0,215,217,'2005-10-27','2018-04-30', >> "%arqHomolog%"
echo 'DECISAO','DECISAO' ,' ' ,'14:56:49',0,0,1,1,153,165,166,168,169,173,80,82,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,0,0,107,108) >> "%arqHomolog%"
echo where ban3cod=104; >> "%arqHomolog%"
echo update banco set (bannom) = ('CAIXA ECONOMICA') where bancod=104  >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:INTER_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-10%"
echo(
set /p carteira=Informe a Carteira (ate 3 digitos): 
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(

:PERGUNTA_JUROS_INTER
Echo Cobrar Juros ?
echo(
Echo 0 - Nao
Echo 1 - Sim
echo(
set /p cjuros=Digite a opcao: 
set "cjuros=%cjuros: =%"
echo(
if "%cjuros%"=="0" (
    set "juros=0.00"
    set "jurosc=0000"
    goto :PERGUNTA_MULTA_INTER
)
if "%cjuros%"=="1" (
    goto :DIGITA_JUROS_INTER
)
echo Opcao invalida! Digite apenas 0 ou 1.
echo(
goto :PERGUNTA_JUROS_INTER

:DIGITA_JUROS_INTER
set /p juros=Informe o valor dos Juros (Ex:10.00):
echo( 
if "%juros%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_JUROS_INTER
)
for /f "tokens=1,2 delims=." %%a in ("%juros%") do set jurosc=%%a%%b
set "jurosc=00000%jurosc%"
set "jurosc=%jurosc:~-4%"
goto :PERGUNTA_MULTA_INTER
echo(

:PERGUNTA_MULTA_INTER
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(

if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_LPAG_INTER
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_INTER
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_INTER

:DIGITA_MULTA_INTER
set /p multa=Informe valor da Multa (Ex:10.00): 
echo(
if "%multa%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_MULTA_INTER
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_LPAG_INTER
echo(

:PERGUNTA_LPAG_INTER
Echo Data limite de pagamento apos vencimento?
echo(
Echo 1 - 30 dias
Echo 2 - 60 dias
echo(
set /p clpag=Digite a opcao: 
echo(

if "%clpag%"=="1" (
    set "lpag=30"
    goto :GERAR_ARQUIVO_INTER
)
if "%clpag%"=="2" (
    set "lpag=60"
    goto :GERAR_ARQUIVO_INTER
)
echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_LPAG_INTER


:GERAR_ARQUIVO_INTER
echo update carban set (cabdtinrg, cabdtalrg, cabusuinc, cabusualt, cabhrinrg, cabhralrg, cabcedente, cabcconson, cabccoultr, cabccolay, cabresimp, cabcodemib, ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem, cabarqmod, cabdirret, cabdirrem, cabarqbol) = >> "%arqHomolog%"
echo ('%dataAtual%', '%dataAtual%', '        ', 'DECISAO ', '14:50:20', '%horaFormatada%', '                    ', 0, 0, 0, '  ', '          ', '                    ', '%titular%                ', '                    ', '   ', '%carteirac%%agenciac%%contac%', '00000               ', '%cmulta%', '%cjuros%', '                    ', %juros%, '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', ' ', '1', '0001-01-01', '%dataAtual%', '        ', 'DECISAO ', '        ', '%horaFormatada%', '%lpag%', '                    ', '                    ', 1, 0, 0.00, 1, %multa%, '', '', 'C:\DIFACTW\EXPORTAR\', '') >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (77, 38, 62, 90, 91, 92, 97, 0, 0, 0, 0, 160, 172, 0, 0, 0, 0, 0, 0, 21, 37, 38, 62, 66, 70, 0, 0, 0, 0, 109, 110, 111, 120, 121, 126, 127, 139, 0, 0, 0, 0, 148, 149, '99                  ', 150, 150, 'N', 151, 156, 66, 66, 160, 160, 161, 173, %juros%, 0, 0, 185, 197, 198, 201, 202, 220, 221, 222, 0, 223, 236, 237, 276, 277, 316, 0, 0, 317, 324, 0, 0, 0, 0, 90, 100, '00000000000         ', 395, 400, 0, 0, 0, 0, 0, 0, 325, 394, 0, 0, 0, 0, 0, 0, 67, 79, '0000000000000       ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '    ', 1, 9, '01REMESSA           ', 10, 26, '01COBRANCA     ', 27, 46, 47, 76, 95, 100, 0, 0, '                    ', 0, 0, '   ', 395, 400, '1                   ', 0, 0, '  ', 111, 117, 77, 79, 80, 94, 140, 141, '    ', 0, 0, 0, 0, '       ', '                    ', 71, 81, 0, 0, '                                                  ', 0, 0, '                                                  ', 0, 0, 80, 83, '%multac%', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2005-10-27', '%dataAtual%', >> "%arqHomolog%"
echo  'DECISAO ', 'DECISAO ', '        ', '%horaFormatada%', 0, 0, 1, 1, 125, 137, 138, 140, 141, 144, 241, 380, 0, 0, '                    ', 0, 0, 98, 107, 0, 0, 0, 0, 87, 89) >> "%arqHomolog%"
echo where ban3cod=77; >> "%arqHomolog%"
echo update banco set (bannom) = ('Inter') where bancod=77  >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:BMP_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

set /p agencia=Informe a Agencia sem digito: 
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
echo(
set /p conta=Informe a Conta com Digito Verificador: 
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
echo(

set /p carteira=Informe a Carteira (ate 3 digitos): 
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
echo(

:PERGUNTA_TIPO_CONVENIO_BMP
Echo Qual codigo de Convenio foi fornecido pelo cliente?
echo(
Echo 1 - Codigo do Cedente (7 digitos)
Echo 2 - Codigo da Empresa (10 digitos)
echo(
set /p cTipoConvenio=Digite a opcao: 
set "cTipoConvenio=%cTipoConvenio: =%"
echo(

if "%cTipoConvenio%"=="1" goto :DIGITA_CEDENTE_BMP
if "%cTipoConvenio%"=="2" goto :DIGITA_EMPRESA_BMP

echo Opcao invalida! Digite apenas 1 ou 2.
echo(
goto :PERGUNTA_TIPO_CONVENIO_BMP

:DIGITA_CEDENTE_BMP
set /p cedente=Informe o Codigo do Cedente (7 digitos): 
echo(
echo %cedente%| findstr /R "^[0-9][0-9][0-9][0-9][0-9][0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 7 numeros. & echo(
    goto :DIGITA_CEDENTE_BMP
)
set "lastDigitAgencia=%agencia:~-1%"
set "carteiraPadded=0%carteira%"
set "carteiraPadded=%carteiraPadded:~-2%"
set "convenio=%lastDigitAgencia%%cedente%%carteiraPadded%"
set "convenioc=%convenio%"
set "convenioc=00000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
goto :PERGUNTA_JUROS_BMP

:DIGITA_EMPRESA_BMP
set /p convenio=Informe o Codigo da Empresa (10 digitos): 
echo(
echo %convenio%| findstr /R "^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$" >nul || (
    echo( & echo Valor invalido! Digite exatamente 10 numeros. & echo(
    goto :DIGITA_EMPRESA_BMP
)
set "convenioc=%convenio%"
set "convenioc=00000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
goto :PERGUNTA_JUROS_BMP

:PERGUNTA_JUROS_BMP
echo Cobrar Juros ?
echo(
echo 0 - Nao
echo 2 - Sim
echo(
set /p cjuros=Digite a opcao: 
set "cjuros=%cjuros: =%"
echo(
if "%cjuros%"=="0" (
    set "juros=0"
    goto :PERGUNTA_MULTA_BMP
)
if "%cjuros%"=="2" (
    goto :DIGITA_JUROS_BMP
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_JUROS_BMP

:DIGITA_JUROS_BMP
set /p juros=Informe valor do Juros: 
echo(
if "%juros%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_JUROS_BMP
)
goto :PERGUNTA_MULTA_BMP
echo(

:PERGUNTA_MULTA_BMP
echo Cobrar Multa ?
echo(
echo 0 - Nao
echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_PROTESTO_BMP
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_BMP
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_BMP

:DIGITA_MULTA_BMP
set /p multa=Informe valor da Multa (Ex: 10.00): 
echo(
if "%multa%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_MULTA_BMP
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_PROTESTO_BMP
echo(

:PERGUNTA_PROTESTO_BMP
echo Com protesto automatico?
echo(
echo 0 - Nao
echo 2 - Sim
echo(
set /p cdias=Digite a opcao: 
set "cdias=%cdias: =%"
echo(
if "%cdias%"=="0" (
    set "dias=00"
    goto :GERAR_ARQUIVO_BMP
)
if "%cdias%"=="2" (
    goto :DIGITA_PROTESTO_BMP
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo.
goto :PERGUNTA_PROTESTO_BMP

:DIGITA_PROTESTO_BMP
set /p dias=Informe dias para protesto (2 digitos): 
set "dias=%dias: =%"
echo(
if "%dias%"=="" (
    echo(
    echo Valor invalido, tente novamente.
    echo(
    goto :DIGITA_PROTESTO_BMP
)
echo %dias%| findstr /R "^[0-9][0-9]$" >nul || (
    echo(
    echo Valor invalido! Digite exatamente 2 numeros.
    echo(
    goto :DIGITA_PROTESTO_BMP
)
goto :GERAR_ARQUIVO_BMP

:GERAR_ARQUIVO_BMP 
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%dias%                  ','00','                    ',%juros%,'2','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','%horaFormatada%','000                 ','000','                    ',0,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta:~0,-1%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> "%arqHomolog%"
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> "%arqHomolog%"
echo (274,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,52,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','%dataAtual%', >> "%arqHomolog%"
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108) >> "%arqHomolog%"
echo where ban3cod=274; >> "%arqHomolog%"
echo update banco set (bannom) = ('BMP Money Plus') where bancod=274  >> "%arqHomolog%"
echo(
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit

:SICREDI_DISECURIT
set /p titular=Beneficiario da conta (Maximo 50 Caracteres): 
set "titular=%titular:~0,50%"
set "titular=%titular:^&=&%"
set "titularNome=%titular:~0,50%"
set "titularNome=%titularNome:/=%"
set "titularNome=%titularNome%"
if "%titularNome%"=="" set "titularNome=homologacao"
set "arqHomolog=%~dp0Homologacao %titularNome%.txt"
echo(

IF EXIST "%arqHomolog%" del "%arqHomolog%"

REM --- set /p cnpj=Informe CNPJ do beneficiario: 
REM --- set "cnpjc=%cnpj%"
REM --- set "cnpjc=00000000000000%cnpjc%"
REM --- set "cnpjc=%cnpjc:~-14%"
REM --- echo(
REM --- Travado em codigo

set /p agencia=Informe a Agencia sem digito: 
echo(
set /p conta=Informe a Conta sem digito: 
echo(
set /p posto=Informe o posto do beneficiario: 
set "ccbagecob=%posto%" 
echo(

:ENTRADA_JUROS_SICREDI
set /p juros=Informe os Juros A.M. (Ex: 5.00): 
if "%juros%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :ENTRADA_JUROS_SICREDI
)
echo(

:PERGUNTA_MULTA_SICREDI
Echo Cobrar Multa ?
echo(
Echo 0 - Nao
Echo 2 - Sim
echo(
set /p cmulta=Digite a opcao: 
set "cmulta=%cmulta: =%"
echo(
if "%cmulta%"=="0" (
    set "multa=0.00"
    set "multac=0000"
    goto :PERGUNTA_INSTRUCAO_SICREDI
)
if "%cmulta%"=="2" (
    goto :DIGITA_MULTA_SICREDI
)
echo Opcao invalida! Digite apenas 0 ou 2.
echo(
goto :PERGUNTA_MULTA_SICREDI

:DIGITA_MULTA_SICREDI
set /p multa=Informe o valor da Multa (Ex:2.00): 
echo( 
if "%multa%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_MULTA_SICREDI
)
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
goto :PERGUNTA_INSTRUCAO_SICREDI
echo(

:PERGUNTA_INSTRUCAO_SICREDI
Echo Instru  o automatica:
echo(
Echo 6 - Protesto Automatico
REM --- Echo 7 - Negativacao Automatica
Echo 0 - Sem instrucao
echo(
set /p cInstrucao=Digite a opcao: 
set "cInstrucao=%cInstrucao: =%"
echo(

if "%cInstrucao%"=="6" (
    set "ccbinstr1=06"
    set "ccbinstr2=00"
    set "dmprzproi=159"
    set "dmprzprof=160"
    goto :DIGITA_DIAS_SICREDI
)
rem --- if "%cInstrucao%"=="7" (
rem ---     set "ccbinstr1=00"
rem ---     set "ccbinstr2=06"
rem ---     set "dmprzproi=195"
rem ---     set "dmprzprof=196"
rem ---     goto :DIGITA_DIAS_SICREDI 
rem --- )
rem --- Instru  o 2 bloqueada em codigo.

if "%cInstrucao%"=="0" (
    set "ccbinstr1=00"
    set "ccbinstr2=00"
    set "ccbprzpro=00"
    set "dmprzproi=0"
    set "dmprzprof=0"
    goto :GERAR_ARQUIVO_SICREDI
)
echo Opcao invalida! Tente novamente.
echo(
goto :PERGUNTA_INSTRUCAO_SICREDI

:DIGITA_DIAS_SICREDI
set /p dias=Quantos dias apos o vencimento? (min 3 - max 99): 
echo(
if "%dias%"=="" (
    echo( & echo Valor invalido, tente novamente. & echo(
    goto :DIGITA_DIAS_SICREDI
)
set "ccbprzpro=%dias%"
goto :GERAR_ARQUIVO_SICREDI
echo(

:GERAR_ARQUIVO_SICREDI
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> "%arqHomolog%"
echo ('%conta%','%titular%','AAA                 ','   ','%conta%                 ','%ccbagecob%                  ','%ccbinstr1%                  ','%ccbinstr2%                  ','                         ',%juros%,'B                        ','                         ','                         ','%conta%       ','                         ','                         ','                         ','%ccbprzpro%   ','                         ','0001-01-01','%dataAtual%','        ','DECISAO ','        ','%horaFormatada%','                         ','%cnpjc%               ',1,0,0.00,1,%multa%) >> "%arqHomolog%"
echo where cconumero=%conta%; >> "%arqHomolog%"
echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmespdocsi, dmespdocsf, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsaccepi, dmsaccepf, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmvariaci, dmvariacf, dmvariacc, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmdatgravi, hmdatgravf, hmsequenci, hmsequencf, hmsequencc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmprzproi, dmprzprof, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, ban3dtinrg, ban3dtalrg, ban3usuinc, ban3usualt, hmnumconi, hmnumconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dnoutreci, dnoutrecf, hncconumi, hncconumf, hnbancodi, hnbancodf) = >> "%arqHomolog%"
echo (748,0,0,109,110,111,116,228,240,241,253,254,266,267,279,17,19,0,0,0,0,0,0,48,56,0,0,0,0,109,110,111,120,121,126,127,139,0,0,150,150,'N',151,156,157,158,193,194,161,173,%juros%,174,179,180,192,206,218,219,219,0,221,234,235,274,275,314,327,334,395,400,354,394,74,74,220,220,0,1,9,'01REMESSA',10,26,'01COBRANCA',27,31,95,102,395,400,'000001',111,117,77,79,80,94,%dmprzproi%,%dmprzprof%,48,62,391,394,'2.00                                      ',0,'00000',340,353,149,149,'A',335,339,'00000',176,188,189,201,'%dataAtual%','%dataAtual%','DECISAO','DECISAO',32,45,153,165,0,0,0,0,319,328,1,26,'02RETORNO01COBRANCA',111,117,117,126,280,292,27,31,77,79) >> "%arqHomolog%"
echo where ban3cod=748; >> "%arqHomolog%"
echo update banco set (bannom) = ('SICREDI') where bancod=748  >> "%arqHomolog%"
Echo Arquivo Gerado: "%arqHomolog%"
echo(
Pause
Exit