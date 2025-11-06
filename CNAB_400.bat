 @echo off
TITLE *** Homologacao ***
IF EXIST Homologacao.txt del Homologacao.txt
:LOOP
ECHO.
ECHO Escolha o Sistema.
ECHO.
ECHO 1. DIFACT
ECHO 2. DISECURIT
ECHO 3. DIESC

ECHO.
SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter:
IF NOT ‘%Choice%’==” SET Choice=%Choice:~0,1%
ECHO.
IF %Choice% == 1 GOTO :DIFACT
IF %Choice% == 2 GOTO :DISECURIT
IF %Choice% == 3 GOTO :DISECURIT

ECHO “%Choice%” opcao nao valida, tente novamente!

:DIFACT
ECHO.
ECHO Homologacao CNAB400
ECHO.
ECHO 1. Banco do Brasil
ECHO 2. Bradesco
ECHO 3. Itau
ECHO 4. Santander
ECHO 5. Safra
ECHO 6. CEF
ECHO 7. INTER
ECHO 8. MONEY PLUS
ECHO.
SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter:
IF NOT ‘%Choice%’==” SET Choice=%Choice:~0,1%
ECHO.
IF %Choice% == 1 GOTO :BB
IF %Choice% == 2 GOTO :BRADESCO
IF %Choice% == 3 GOTO :ITAU
IF %Choice% == 4 GOTO :SANTANDER
IF %Choice% == 5 GOTO :SAFRA
IF %Choice% == 6 GOTO :CEF
IF %Choice% == 7 GOTO :INTER
IF %Choice% == 8 GOTO :MONEY PLUS

ECHO “%Choice%” opcao nao valida, tente novamente!

:BB
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia com digito
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
ECHO.
Echo Informe o Convenio 
set /p convenio=
ECHO.
Echo Informe a Carteira (2 digitos)
set /p carteira=
ECHO.
Echo Informe a Variacao (3 digitos)
set /p variacao=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Protesto ?
Echo 07 - Sem prostesto
Echo 03 - Envio apos 3 dias do vencimento
Echo 04 - Envio apos 4 dias do vencimento
Echo 05 - Envio apos 5 dias do vencimento
set /p protesto=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%%contac%000000','%titular%','02                  ','   ','%agenciac%%contac%      ','0000                ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio%','                    ','                    ',' 000000                ','                  ','7                   ','0001-01-01','2017-02-20','        ','DECISAO ','        ','15:13:46','                    ','001                 ','%convenio%',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (1,39,63,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,64,80,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,146,148,149,'1                   ',150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,271,275,314,315,326,327,334,335,349,350,351,92,94,'                    ',395,400,352,391,0,0,88,88,0,0,81,84,0,0,89,91,92,94,'%variacao%                 ',32,38,95,95,0,0,96,101,0,0,'    ',10,11,'1                   ',12,19,'COBRANCA       ',27,46,47,76,95,100,0,0,'                    ',0,0,'   ',395,400,'1                   ',0,0,'  ',101,107,77,79,80,94,0,0,'    ',392,393,0,0,'0000                ','                    ',64,80,0,0,'                                                  ',0,0,'                                                  ',0,0,0,0,'                                                  ',0,0,'                                                  ',182,188,189,201,215,227,'2005-10-27','2017-02-20', >> Homologacao.txt
echo 'DECISAO ','DECISAO ','        ','10:45:37',130,136,1,1,153,165,166,168,169,173,87,88,1,9,'02RETORNO           ',101,107,117,126,0,0,280,292,107,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=1 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:BRADESCO
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo da Empresa 
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 00 - Sem prostesto
Echo 06 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 2 - Factoring
set /p papeleta=

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%protesto%                  ','%dias%               ','                    ',%juros%,'%papeleta%            ','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','15:13:46','000                 ','000','                    ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (237,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,62,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,0,0,'',0,0,'',176,188,189,201,215,227,'2005-10-27','2017-08-04', >> Homologacao.txt
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=237; >> Homologacao.txt
echo update banco set (bannom) = ('BRADESCO') where bancod=237  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:ITAU
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-6%"
ECHO.
Echo Informe a Carteira ( 3 digitos)
set /p carteira=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Protesto?
Echo 09 - Com Protesto Automatico
Echo 10 - Sem Protesto
set /p protesto=
ECHO.
Echo Informe dias para protesto (2 digitos)
set /p dias=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%00%contac%','%titular%','02                  ','   ','%agenciac%00%contac%','00000               ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','           ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-02-20','        ','DECISAO ','        ','15:13:46','341                  ','                 ','         ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (341,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,29,38,62,63,70,0,0,84,86,109,110,111,120,121,126,127,139,0,0,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,264,275,314,315,326,327,334,335,349,350,351,108,108,'I'                   ,395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'                    ',0,0,0,0,0,0,0,0,0,0,'    ',1,9,'01REMESSA           ',10,26,'01COBRANCA     ',27,38,47,76,95,100,0,0,'                    ',18,19,'CA' ,395,400,1                   ,0,0,'  ',0,0,77,79,80,94,140,142,'    ',392,393,0,0,'          ','            ',63,70,0,0,'          ',0,0,'                    ' ,0,0,34,37,'0000',71,83,'0000000000000',176,188,0,0,215,227,'2005-10-27','2017-08-07', >> Homologacao.txt
echo 'DECISAO' ,'DECISAO' ,'        ','17:31:01',0,0,1,1,153,165,166,168,169,172,378,385,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,280,292,83,85,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=341; >> Homologacao.txt
echo update banco set (bannom) = ('BANCO ITAU SA') where bancod=341 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:SANTANDER
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo de Transmissao Cnab400(Informado Pelo Santander)
set /p transmissao=
set transmissaoc=%transmissao%
set "transmissaoc=000000000000000000%transmissaoc%"
set "transmissaoc=%transmissaoc:~-20%"
ECHO.
Echo Informe o Convenio (Informado Pelo Santander)
set /p convenio=
ECHO.
Echo Informe o Coplemento (Informado Pelo Santander)
set /p complemento=
ECHO.
Echo Informe a Carteira (3 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 4 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 00 - Sem prostesto
Echo 06 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 5 - Factoring
set /p papeleta=
ECHO.
Echo Banco Emitente informar 00000 se Factoring emitente informar numero da agencia (3 Digito)
set /p cobrador=


echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%transmissao%','%titular%','02                  ','   ','%convenio%             ','                    ','%protesto%               ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio% ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-07-20','        ','DECISAO ','        ','17:42:25','033                 ','%cobrador%               ','%convenio%             ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (33,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,0,0,38,62,63,70,0,0,0,0,109,110,111,120,121,126,127,139,143,147,63,65,148,149,01                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,383,385,'I%complemento%'                 ,395,400,0,0,0,0,0,0,0,0,18,37,102,108,78,78,79,82,'%multac%'                ,0,0,0,0,0,0,0,0,83,84,'00'  ,10,11,01                  ,12,26,'COBRANCA'       ,27,46,47,76,95,100,101,116,'0000000000000000'    ,0,0,'   ',395,400,'000001'              ,0,0,'  ',0,0,77,79,80,94,140,142,%cmulta%   ,392,393,0,0,'%transmissao%','00000%papeleta%'              ,63,73,0,0,'                                                 ',0,0,'                                                  ',0,0,143,147,00000                                             ,71,76,000000                                            ,178,188,189,201,215,22,'2005-10-27','2017-07-25', >> Homologacao.txt
echo 'DECISAO' ,'DECISAO','        ','15:14:26',0,0,1,1,153,165,166,168,169,173,0,0,1,26,'02RETORNO01COBRANCA' ,395,400,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=33; >> Homologacao.txt
echo update banco set (bannom) = ('SANTANDER') where bancod=33 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:SAFRA
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
ECHO.
Echo Informe a Carteira ( 1 digitos)
set /p carteira=
ECHO.
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Obsrvacao o safra so permite duas instrucoes se for cobrar multa e juros, nao sera possivel o protesto automatico.
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Primeira Instrucao?
Echo 16 - Multa
Echo 10 - Protesto Automatico
set /p cmulta=
ECHO.
Echo Segunda Instrucao?
Echo 01 - Juros
Echo 10 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe dias para protesto (2 digitos)
set /p dias=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%%contac%','%titular%',02              ,'        ','%agenciac%%contac%','%agencia%','%cmulta%','%protesto%','        ','%juros%' ,'      '  ,'        ','        ','        ','        ','        ','        ','%dias%'  ,'        ','0001-01-01',' 2018-02-27','         ','DECISAO   ','          ','09:31:16  ','        ','          ','          ','1         ',0         , '0.00      ','1         ','%multa%') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (422,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,63,71,0,0,108,108,109,110,111,120,121,126,127,139,0,0,143,147,148,149,1,150,150,'N',151,156,157,158,159,160,161,173,25.00,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,324,327,334,335,349,350,351,389,391,'000',395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,1 ,12,19,'COBRANÇA'       ,27,40,47,76,95,100,0,0,''  ,0,0,''   ,395,400,1                   ,0,0,''  ,392,394,77,79,80,90,140,142,''    ,0,0,0,0,''                    ,''                    ,63,71,0,0,''                                                  ,0,0,'' ,0,0,102,104,'000',106,107,'%dias%',176,188,189,201,215,227,'2005-10-27','2018-02-22', >> Homologacao.txt
echo 'DECISAO','DECISAO',''        ,'15:09:58',0,0,0,0,153,165,166,168,169,173,105,107,3,19,'RETORNO01COBRANCA',392,394,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=422 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:CEF
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-7%"
ECHO.
Echo Informe o Codigo do Beneficiario
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-7%"
ECHO.
Echo Disribuição do Boleto (Se emitente Factoring)
Echo 11 (titulo Registrado, emissao CAIXA)
Echo 14 (titulo Registrado, emissao Beneficiario)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-2%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 02 - Sem prostesto
Echo 01 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. OBs: Sem protesto deixar em branco (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 2 - Factoring
set /p papeleta=
ECHO.

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%%convenioc%','%titular%'       ,'02'  ,' ','%convenioc%','00000' ,'%protesto%','00','00','%juros%' ,'%papeleta%'  ,'        ','        ','%agenciac%%convenioc%','        ','        ','        ','%dias%'  ,'1 ','0001-01-01','2018-02-27','','DECISAO ','','09:31:16','000','104 ','','0','0','0.00','1','%multa%') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (104,32,56,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,21,27,32,56,57,73,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,147,148,149,02                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,29,31,000                 ,395,400,368,389,28,28,0,0,85,106,0,0,0,0,0,0,0,0,'  ',0,0,0,0,0,0,0,0,394,394,1   ,10,11,1                   ,12,26,'COBRANCA' ,27,36,47,76,95,100,0,0, ' ' ,0,0,' ',395,400,000001              ,0,0,' ',390,394,77,79,80,94,18,20,'',0,0,390,391,' ' ,' ' ,57,73,101,103,'007',0,0,' ',0,0,107,108,'01',392,393,'%dias%',176,188,0,0,215,217,'2005-10-27','2018-04-30', >> Homologacao.txt
echo 'DECISAO','DECISAO' ,' ' ,'14:56:49',0,0,1,1,153,165,166,168,169,173,80,82,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,0,0,107,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=104; >> Homologacao.txt
echo update banco set (bannom) = ('CAIXA ECONOMICA') where bancod=104  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:INTER	
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-10%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Ira cobrar Juros ?
Echo 0 - Nao
Echo 1 - Sim
set /p cjuros=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
for /f "tokens=1,2 delims=." %%a in ("%juros%") do set jurosc=%%a%%b
set "jurosc=00000%jurosc%"
set "jurosc=%jurosc:~-4%"
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Data limite de pagamento após vencimento ?
Echo 30 - dias
Echo 60 - dias
set /p lpag=

cd desktop
echo update carban set (cabdtinrg, cabdtalrg, cabusuinc, cabusualt, cabhrinrg, cabhralrg, cabcedente, cabcconson, cabccoultr, cabccolay, cabresimp, cabcodemib, ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem, cabsit, cabarqmod, cabdirret, cabdirrem, cabarqbol) = >> Homologacao.txt
echo ('2021-09-16', '2021-09-17', '        ', 'DECISAO ', '14:50:20', '09:44:40', '                    ', 0, 0, 0, '  ', '          ', '                    ', '%titular%                ', '                    ', '   ', '%carteirac%%agenciac%%contac%', '00000               ', '%cmulta%', '%cjuros%', '                    ', %juros%, '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', ' ', '1', '0001-01-01', '2021-09-16', '        ', 'DECISAO ', '        ', '17:09:29', '%lpag%', '                    ', '                    ', 1, 0, 0.00, 1, %multa%, 'A', '', '', 'C:\DIFACTW\EXPORTAR\', '') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (77, 38, 62, 90, 91, 92, 97, 0, 0, 0, 0, 160, 172, 0, 0, 0, 0, 0, 0, 21, 37, 38, 62, 66, 70, 0, 0, 0, 0, 109, 110, 111, 120, 121, 126, 127, 139, 0, 0, 0, 0, 148, 149, '99                  ', 150, 150, 'N', 151, 156, 66, 66, 160, 160, 161, 173, %juros%, 0, 0, 185, 197, 198, 201, 202, 220, 221, 222, 0, 223, 236, 237, 276, 277, 316, 0, 0, 317, 324, 0, 0, 0, 0, 90, 100, '00000000000         ', 395, 400, 0, 0, 0, 0, 0, 0, 325, 394, 0, 0, 0, 0, 0, 0, 67, 79, '0000000000000       ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '    ', 1, 9, '01REMESSA           ', 10, 26, '01COBRANCA     ', 27, 46, 47, 76, 95, 100, 0, 0, '                    ', 0, 0, '   ', 395, 400, '1                   ', 0, 0, '  ', 111, 117, 77, 79, 80, 94, 140, 141, '    ', 0, 0, 0, 0, '       ', '                    ', 71, 81, 0, 0, '                                                  ', 0, 0, '                                                  ', 0, 0, 80, 83, '%multac%', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2005-10-27', '2021-09-17', >> Homologacao.txt
echo  'DECISAO ', 'DECISAO ', '        ', '17:31:01', 0, 0, 1, 1, 125, 137, 138, 140, 141, 144, 241, 380, 0, 0, '                    ', 0, 0, 98, 107, 0, 0, 0, 0, 87, 89, 0, 0, 0, 0, 0, 0) >> Homologacao.txt
echo where ban3cod=77; >> Homologacao.txt
echo update banco set (bannom) = ('Inter') where bancod=77  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:MONEY PLUS
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo da Empresa 
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.

Echo Informe dias para protesto. (2 digitos, caso nao tenha interesse informar 00)
set /p dias=

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%dias%                  ','00','                    ',%juros%,'2','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','15:13:46','000                 ','000','                    ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf, hnbancodi, hnbancodf, hncconumi, hncconumf, hnagecodi, hnagecodf) = >> Homologacao.txt
echo (274,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,52,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','2017-08-04', >> Homologacao.txt
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108,0,0,0,0,0,0) >> Homologacao.txt
echo where ban3cod=274; >> Homologacao.txt
echo update banco set (bannom) = ('BMP Money Plus') where bancod=274  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:DISECURIT
ECHO.
ECHO Homologacao CNAB400
ECHO.
ECHO 1. Banco do Brasil
ECHO 2. Bradesco
ECHO 3. Itau
ECHO 4. Santander
ECHO 5. Safra
ECHO 6. CEF
ECHO 7. INTER
ECHO 8. MONEY PLUS
ECHO.
SET Choice=
SET /P Choice=Digite a opcao desejada e pressione Enter:
IF NOT ‘%Choice%’==” SET Choice=%Choice:~0,1%
ECHO.
IF %Choice% == 1 GOTO :BB
IF %Choice% == 2 GOTO :BRADESCO
IF %Choice% == 3 GOTO :ITAU
IF %Choice% == 4 GOTO :SANTANDER
IF %Choice% == 5 GOTO :SAFRA
IF %Choice% == 6 GOTO :CEF
IF %Choice% == 7 GOTO :INTER
IF %Choice% == 8 GOTO :MONEY PLUS

ECHO “%Choice%” opcao nao valida, tente novamente!

:BB
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia com digito
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
ECHO.
Echo Informe o Convenio 
set /p convenio=
ECHO.
Echo Informe a Carteira (2 digitos)
set /p carteira=
ECHO.
Echo Informe a Variacao (3 digitos)
set /p variacao=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Protesto ?
Echo 07 - Sem prostesto
Echo 03 - Envio apos 3 dias do vencimento
Echo 04 - Envio apos 4 dias do vencimento
Echo 05 - Envio apos 5 dias do vencimento
set /p protesto=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%%contac%000000','%titular%','02                  ','   ','%agenciac%%contac%      ','0000                ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio%','                    ','                    ',' 000000                ','                  ','7                   ','0001-01-01','2017-02-20','        ','DECISAO ','        ','15:13:46','                    ','001                 ','%convenio%',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (1,39,63,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,64,80,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,146,148,149,'1                   ',150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,271,275,314,315,326,327,334,335,349,350,351,92,94,'                    ',395,400,352,391,0,0,88,88,0,0,81,84,0,0,89,91,92,94,'%variacao%                 ',32,38,95,95,0,0,96,101,0,0,'    ',10,11,'1                   ',12,19,'COBRANCA       ',27,46,47,76,95,100,0,0,'                    ',0,0,'   ',395,400,'1                   ',0,0,'  ',101,107,77,79,80,94,0,0,'    ',392,393,0,0,'0000                ','                    ',64,80,0,0,'                                                  ',0,0,'                                                  ',0,0,0,0,'                                                  ',0,0,'                                                  ',182,188,189,201,215,227,'2005-10-27','2017-02-20', >> Homologacao.txt
echo 'DECISAO ','DECISAO ','        ','10:45:37',130,136,1,1,153,165,166,168,169,173,87,88,1,9,'02RETORNO           ',101,107,117,126,0,0,280,292,107,108) >> Homologacao.txt
echo where ban3cod=1 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:BRADESCO
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo da Empresa 
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 00 - Sem prostesto
Echo 06 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 2 - Securitizadora
set /p papeleta=

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%protesto%                  ','%dias%               ','                    ',%juros%,'%papeleta%            ','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','15:13:46','000                 ','000','                    ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (237,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,62,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','2017-08-04', >> Homologacao.txt
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108) >> Homologacao.txt
echo where ban3cod=237; >> Homologacao.txt
echo update banco set (bannom) = ('BRADESCO') where bancod=237  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:ITAU
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-6%"
ECHO.
Echo Informe a Carteira ( 3 digitos)
set /p carteira=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Protesto?
Echo 09 - Com Protesto Automatico
Echo 10 - Sem Protesto
set /p protesto=
ECHO.
Echo Informe dias para protesto (2 digitos)
set /p dias=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%00%contac%','%titular%','02                  ','   ','%agenciac%00%contac%','00000               ','%protesto%                  ','                    ','                    ',%juros%,'                    ','                    ','                    ','           ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-02-20','        ','DECISAO ','        ','15:13:46','341                  ','                 ','         ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (341,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,29,38,62,63,70,0,0,84,86,109,110,111,120,121,126,127,139,0,0,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,264,275,314,315,326,327,334,335,349,350,351,108,108,'I'                   ,395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'                    ',0,0,0,0,0,0,0,0,0,0,'    ',1,9,'01REMESSA           ',10,26,'01COBRANCA     ',27,38,47,76,95,100,0,0,'                    ',18,19,'CA' ,395,400,1                   ,0,0,'  ',0,0,77,79,80,94,140,142,'    ',392,393,0,0,'          ','            ',63,70,0,0,'          ',0,0,'                    ' ,0,0,34,37,'0000',71,83,'0000000000000',176,188,0,0,215,227,'2005-10-27','2017-08-07', >> Homologacao.txt
echo 'DECISAO' ,'DECISAO' ,'        ','17:31:01',0,0,1,1,153,165,166,168,169,172,378,385,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,280,292,83,85) >> Homologacao.txt
echo where ban3cod=341; >> Homologacao.txt
echo update banco set (bannom) = ('BANCO ITAU SA') where bancod=341 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:SANTANDER
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo de Transmissao Cnab400(Informado Pelo Santander)
set /p transmissao=
set transmissaoc=%transmissao%
set "transmissaoc=000000000000000000%transmissaoc%"
set "transmissaoc=%transmissaoc:~-20%"
ECHO.
Echo Informe o Convenio (Informado Pelo Santander)
set /p convenio=
ECHO.
Echo Informe o Coplemento (Informado Pelo Santander)
set /p complemento=
ECHO.
Echo Informe a Carteira (3 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 4 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 00 - Sem prostesto
Echo 06 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 5 - Securitizadora
set /p papeleta=
ECHO.
Echo Banco Emitente informar 00000 se Factoring emitente informar numero da agencia (3 Digito)
set /p cobrador=


echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%transmissao%','%titular%','02                  ','   ','%convenio%             ','                    ','%protesto%               ','                    ','                    ',%juros%,'                    ','                    ','                    ','%convenio% ','                    ','                    ','                    ','%dias%   ','1                   ','0001-01-01','2017-07-20','        ','DECISAO ','        ','17:42:25','033                 ','%cobrador%               ','%convenio%             ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (33,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,0,0,38,62,63,70,0,0,0,0,109,110,111,120,121,126,127,139,143,147,63,65,148,149,01                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,383,385,'I%complemento%'                 ,395,400,0,0,0,0,0,0,0,0,18,37,102,108,78,78,79,82,'%multac%'                ,0,0,0,0,0,0,0,0,83,84,'00'  ,10,11,01                  ,12,26,'COBRANCA'       ,27,46,47,76,95,100,101,116,'0000000000000000'    ,0,0,'   ',395,400,'000001'              ,0,0,'  ',0,0,77,79,80,94,140,142,%cmulta%   ,392,393,0,0,'%transmissao%','00000%papeleta%'              ,63,73,0,0,'                                                 ',0,0,'                                                  ',0,0,143,147,00000                                             ,71,76,000000                                            ,178,188,189,201,215,22,'2005-10-27','2017-07-25', >> Homologacao.txt
echo 'DECISAO' ,'DECISAO','        ','15:14:26',0,0,1,1,153,165,166,168,169,173,0,0,1,26,'02RETORNO01COBRANCA' ,395,400,117,126,0,0,280,292,108,108) >> Homologacao.txt
echo where ban3cod=33; >> Homologacao.txt
echo update banco set (bannom) = ('SANTANDER') where bancod=33 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:SAFRA
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia
set /p agencia=
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com digito
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-9%"
ECHO.
Echo Informe a Carteira ( 1 digitos)
set /p carteira=
ECHO.
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Obsrvacao o safra so permite duas instrucoes se for cobrar multa e juros, nao sera possivel o protesto automatico.
Echo  .................................................................................................................
Echo  .................................................................................................................
Echo Primeira Instrucao?
Echo 16 - Multa
Echo 10 - Protesto Automatico
set /p cmulta=
ECHO.
Echo Segunda Instrucao?
Echo 01 - Juros
Echo 10 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Informe dias para protesto (2 digitos)
set /p dias=
cd desktop

echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%agenciac%%contac%','%titular%',02              ,'        ','%agenciac%%contac%','%agencia%','%cmulta%','%protesto%','        ','%juros%' ,'      '  ,'        ','        ','        ','        ','        ','        ','%dias%'  ,'        ','0001-01-01',' 2018-02-27','         ','DECISAO   ','          ','09:31:16  ','        ','          ','          ','1         ',0         , '0.00      ','1         ','%multa%') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali,dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (422,38,62,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,18,31,38,62,63,71,0,0,108,108,109,110,111,120,121,126,127,139,0,0,143,147,148,149,1,150,150,'N',151,156,157,158,159,160,161,173,25.00,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,324,327,334,335,349,350,351,389,391,'000',395,400,352,381,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,1 ,12,19,'COBRANÇA'       ,27,40,47,76,95,100,0,0,''  ,0,0,''   ,395,400,1                   ,0,0,''  ,392,394,77,79,80,90,140,142,''    ,0,0,0,0,''                    ,''                    ,63,71,0,0,''                                                  ,0,0,'' ,0,0,102,104,'000',106,107,'%dias%',176,188,189,201,215,227,'2005-10-27','2018-02-22', >> Homologacao.txt
echo 'DECISAO','DECISAO',''        ,'15:09:58',0,0,0,0,153,165,166,168,169,173,105,107,3,19,'RETORNO01COBRANCA',392,394,117,126,0,0,280,292,108,108) >> Homologacao.txt
echo where ban3cod=422 >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:CEF
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-7%"
ECHO.
Echo Informe o Codigo do Beneficiario
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-7%"
ECHO.
Echo Disribuição do Boleto (Se emitente Factoring)
Echo 11 (titulo Registrado, emissao CAIXA)
Echo 14 (titulo Registrado, emissao Beneficiario)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-2%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Protesto?
Echo 02 - Sem prostesto
Echo 01 - Com Protesto Automatico
set /p protesto=
ECHO.
Echo Informe dias para protesto, no minimo 05 dias. OBs: Sem protesto deixar em branco (2 digitos)
set /p dias=
ECHO.
Echo Emitente da Papeleta? (1 Digito)
Echo 1 - Banco
Echo 2 - Securitizadora
set /p papeleta=
ECHO.

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo (%agenciac%%convenioc%,'%titular%'       ,'02'  ,' ','%convenioc%','00000' ,'%protesto%','00','00','%juros%' ,'%papeleta%'  ,'        ','        ','%agenciac%%convenioc%','        ','        ','        ','%dias%'  ,'1 ','0001-01-01','2018-02-27','','DECISAO ','','09:31:16',000,'104 ','','0','0','0.00','1','%multa%') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (104,32,56,109,110,111,116,228,240,241,253,254,266,267,279,2,3,4,17,21,27,32,56,57,73,0,0,107,108,109,110,111,120,121,126,127,139,140,142,143,147,148,149,02                  ,150,150,'N',151,156,157,158,159,160,161,173,'%juros%',174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,315,326,327,334,335,349,350,351,29,31,000                 ,395,400,368,389,28,28,0,0,85,106,0,0,0,0,0,0,0,0,'  ',0,0,0,0,0,0,0,0,394,394,1   ,10,11,1                   ,12,26,'COBRANCA' ,27,37,47,76,95,100,0,0, ' ' ,0,0,' ',395,400,000001              ,0,0,' ',390,394,77,79,80,94,18,20,'',0,0,390,391,' ' ,' ' ,57,73,101,103,'007',0,0,' ',0,0,107,108,'01',392,393,'%dias%',176,188,0,0,215,217,'2005-10-27','2018-04-30', >> Homologacao.txt
echo 'DECISAO','DECISAO' ,' ' ,'14:56:49',0,0,1,1,153,165,166,168,169,173,80,82,1,26,'02RETORNO01COBRANCA',395,400,117,126,0,0,0,0,107,108) >> Homologacao.txt
echo where ban3cod=104; >> Homologacao.txt
echo update banco set (bannom) = ('CAIXA ECONOMICA') where bancod=104  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:INTER	
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-4%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-10%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Ira cobrar Juros ?
Echo 0 - Nao
Echo 1 - Sim
set /p cjuros=
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
for /f "tokens=1,2 delims=." %%a in ("%juros%") do set jurosc=%%a%%b
set "jurosc=00000%jurosc%"
set "jurosc=%jurosc:~-4%"
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.
Echo Data limite de pagamento após vencimento ?
Echo 30 - dias
Echo 60 - dias
set /p lpag=

cd desktop
echo update carban set (cabdtinrg, cabdtalrg, cabusuinc, cabusualt, cabhrinrg, cabhralrg, cabcedente, cabcconson, cabccoultr, cabccolay, cabresimp, cabcodemib, ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbdtalrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem, cabsit, cabarqmod, cabdirret, cabdirrem, cabarqbol) = >> Homologacao.txt
echo ('2021-09-16', '2021-09-17', '        ', 'DECISAO ', '14:50:20', '09:44:40', '                    ', 0, 0, 0, '  ', '          ', '                    ', '%titular%                ', '                    ', '   ', '%carteirac%%agenciac%%contac%', '00000               ', '%cmulta%', '%cjuros%', '                    ', %juros%, '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', '                    ', ' ', '1', '0001-01-01', '2021-09-16', '        ', 'DECISAO ', '        ', '17:09:29', '%lpag%', '                    ', '                    ', 1, 0, 0.00, 1, %multa%, 'A', '', '', 'C:\DIFACTW\EXPORTAR\', '') >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (77, 38, 62, 90, 91, 92, 97, 0, 0, 0, 0, 160, 172, 0, 0, 0, 0, 0, 0, 21, 37, 38, 62, 66, 70, 0, 0, 0, 0, 109, 110, 111, 120, 121, 126, 127, 139, 0, 0, 0, 0, 148, 149, '99                  ', 150, 150, 'N', 151, 156, 66, 66, 160, 160, 161, 173, %juros%, 0, 0, 185, 197, 198, 201, 202, 220, 221, 222, 0, 223, 236, 237, 276, 277, 316, 0, 0, 317, 324, 0, 0, 0, 0, 90, 100, '00000000000         ', 395, 400, 0, 0, 0, 0, 0, 0, 325, 394, 0, 0, 0, 0, 0, 0, 67, 79, '0000000000000       ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '    ', 1, 9, '01REMESSA           ', 10, 26, '01COBRANCA     ', 27, 46, 47, 76, 95, 100, 0, 0, '                    ', 0, 0, '   ', 395, 400, '1                   ', 0, 0, '  ', 111, 117, 77, 79, 80, 94, 140, 141, '    ', 0, 0, 0, 0, '       ', '                    ', 71, 81, 0, 0, '                                                  ', 0, 0, '                                                  ', 0, 0, 80, 83, '%multac%', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2005-10-27', '2021-09-17', >> Homologacao.txt
echo  'DECISAO ', 'DECISAO ', '        ', '17:31:01', 0, 0, 1, 1, 125, 137, 138, 140, 141, 144, 241, 380, 0, 0, '                    ', 0, 0, 98, 107, 0, 0, 0, 0, 87, 89) >> Homologacao.txt
echo where ban3cod=77; >> Homologacao.txt
echo update banco set (bannom) = ('Inter') where bancod=77  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit

:MONEY PLUS
Echo Titular da conta (Maiusculo)
set /p titular=
ECHO.
Echo Informe a Agencia sem digito 
set /p agencia=
ECHO.
set agenciac=%agencia%
set "agenciac=000000000%agenciac%"
set "agenciac=%agenciac:~-5%"
ECHO.
Echo Informe a Conta com Digito Verificador
set /p conta=
set contac=%conta%
set "contac=000000000%contac%"
set "contac=%contac:~-8%"
ECHO.
Echo Informe o Codigo da Empresa 
set /p convenio=
set convenioc=%convenio%
set "convenioc=000000000000000000%convenioc%"
set "convenioc=%convenioc:~-20%"
ECHO.
Echo Informe a Carteira (3	 digitos)
set /p carteira=
set carteirac=%carteira%
set "carteirac=000000%carteirac%"
set "carteirac=%carteirac:~-3%"
ECHO.
Echo Informe os Juros (Informe Valor 0.00 Ex:10.00)
set /p juros=
ECHO.
Echo Ira cobrar Multa ?
Echo 0 - Nao
Echo 2 - Sim
set /p cmulta=
ECHO.
Echo Informe Multa (Informe Valor 0.00 Ex:10.00)
set /p multa=
for /f "tokens=1,2 delims=." %%a in ("%multa%") do set multac=%%a%%b
set "multac=00000%multac%"
set "multac=%multac:~-4%"
ECHO.

Echo Informe dias para protesto. (2 digitos, caso nao tenha interesse informar 00)
set /p dias=

cd desktop
echo update carban set (ccbcodemp, ccbnomcli, ccbcodins, ccbcodcar, ccbcodced, ccbagecob, ccbinstr1, ccbinstr2, ccbinstr3, ccbjurmor, ccbimppap, ccbprimen, ccbsegmen, ccbnumcon, ccbctacau, ccbcodres, ccbnumbor, ccbprzpro, ccbtipcon, ccbdtinrg, ccbusuinc, ccbusualt, ccbhrinrg, ccbhralrg, ccbbacodc, ccbbacodd, ccbhnumco, ccbfebdtj, ccbfebdtd, ccbfebped, ccbfebdtm, ccbfebpem) = >> Homologacao.txt
echo ('%convenioc%','%titular%','02                  ','   ','0%carteirac%%agenciac%%contac%      ','00000                ','%dias%                  ','00','                    ',%juros%,'2','                    ','                    ','            ','                    ','                    ','                    ','                  ','1                   ','0001-01-01','        ','DECISAO ','        ','15:13:46','000                 ','000','                    ',0,0,0.00,1,%multa%) >> Homologacao.txt
echo  where cconumero=%conta:~0,-1%; >> Homologacao.txt

echo update cnabdep set (ban3cod, dnusoempi, dnusoempf, dncodocoi, dncodocof, dndatbani, dndatbanf, dnabatiti, dnabatitf, dndesconi, dndesconf, dnvlrpagi, dnvlrpagf, dnjurmori, dnjurmorf, dmcodinsci, dmcodinscf, dmnuminsci, dmnuminscf, dmcodclii, dmcodclif, dmusoempi, dmusoempf, dmnosnumi, dmnosnumf, dmusobani, dmusobanf, dmcodcari, dmcodcarf, dmcodocoi, dmcodocof, dmseunumi, dmseunumf, dmdiaveni, dmdiavenf, dmvlrtiti, dmvlrtitf, dmbancodi, dmbancodf, dmagecobri, dmagecobrf, dmespdocsi, dmespdocsf, dmespdocsc, dmaceitei, dmaceitef, dmaceitec, dmdatemisi, dmdatemisf, dminstru1i, dminstru1f, dminstru2i, dminstru2f, dmjurmorai, dmjurmoraf, dmjurmorac, dmdatdesci, dmdatdescf, dmvlrdesci, dmvlrdescf, dmvlriofi, dmvlrioff, dmvlrabati, dmvlrabatf, dmcinssaci, dmcinssacf, dmcinssacc, dmninssaci, dmninssacf, dmsacnomi, dmsacnomf, dmsaclogi, dmsaclogf, dmsacbaii, dmsacbaif, dmsaccepi, dmsaccepf, dmsaccidi, dmsaccidf, dmsacufi, dmsacuff, dmcomplemi, dmcomplemf, dmcomplemc, dmsequeni, dmsequenf, dmsacavali, dmsacavalf, dmimppapi, dmimppapf, dmavanomi, dmavanomf, dmprimeni, dmprimenf, dmnumprei, dmnumpref, dmindvlri, dmindvlrf, dmpretiti, dmpretitf, dmvariaci, dmvariacf, dmvariacc, dmnumconi, dmnumconf, dmctacaui, dmctacauf, dmcodresi, dmcodresf, dmnumbori, dmnumborf, dmmoedai, dmmoedaf, dmmoedac, hmcodservi, hmcodservf, hmcodservc, hmlitservi, hmlitservf, hmlitservc, hmcodcedi, hmcodcedf, hmnomclii, hmnomclif, hmdatgravi, hmdatgravf, hmdensidi, hmdensidf, hmdensidc, hmlitdensi, hmlitdensf, hmlitdensc, hmsequenci, hmsequencf, hmsequencc, hmidesisi, hmidesisf, hmidesisc, hmremcrei, hmremcref, hmbancodi, hmbancodf, hmbannomi, hmbannomf, dmbanco2i, dmbanco2f, dmpretitc, dmprzproi, dmprzprof, dmins003i, dmins003f, dmnumprec, dmindvlrc, dnnsonumi, dnnsonumf, hmli1ini, hmli1fim, hmli1con, hmli2ini, hmli2fim, hmli2con, dmclicpfi, dmclicpff, dmli1ini, dmli1fim, dmli1con, dmli2ini, dmli2fim, dmli2con, dndestari, dndestarf, dnoutdesi, dnoutdesf, dniofi, dnioff, ban3dtinrg, ban3dtalrg, ban3usuinc,>> Homologacao.txt
echo ban3usualt, ban3hrinrg, ban3hralrg, hmnumconi, hmnumconf, dmtipconi, dmtipconf, dnvaltiti, dnvaltitf, dnbanreci, dnbanrecf, dnagereci, dnagerecf, dncodmtvi, dncodmtvf, hnlitseri, hnlitserf, hnclitser, hnseqreti, hnseqretf, dnnumtiti, dnnumtitf, dninssaci, dninssacf, dnoutreci, dnoutrecf, dncarbani, dncarbanf) = >> Homologacao.txt
echo (274,38,62,109,110,111,116,228,240,241,253,254,266,267,279,0,0,0,0,21,37,38,52,71,82,0,0,22,24,109,110,111,120,121,126,127,139,63,65,143,147,148,149,01,150,150,'N',151,156,157,158,159,160,161,173,%juros%,174,179,180,192,193,205,206,218,219,220,0,221,234,235,274,275,314,0,0,327,334,0,0,0,0,0,0,'',395,400,335,394,93,93,0,0,315,326,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,'',10,11,01,12,26,'COBRANCA',27,46,47,76,95,100,0,0,'',0,0,'',395,400,1,109,110,'MX',111,117,77,79,80,94,140,142,'',0,0,0,0,0,0,71,82,0,0,'',0,0,'',0,0,66,66,%cmulta%,67,70,'%multac%',176,188,189,201,215,227,'2005-10-27','2017-08-04', >> Homologacao.txt
echo 'DECISAO','DECISAO','','14:56:55',0,0,0,0,153,165,166,168,169,173,319,328,1,9,'02RETORNO',95,100,117,126,0,0,280,292,108,108) >> Homologacao.txt
echo where ban3cod=274; >> Homologacao.txt
echo update banco set (bannom) = ('BMP Money Plus') where bancod=274  >> Homologacao.txt
Echo Arquivo Gerado
Pause
Exit