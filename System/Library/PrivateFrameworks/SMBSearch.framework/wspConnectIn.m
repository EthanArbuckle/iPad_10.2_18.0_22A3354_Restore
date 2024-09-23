@implementation wspConnectIn

- (wspConnectIn)initWithCtx:(id)a3 EnableRowSetEvents:(BOOL)a4 NoExpensiveProps:(BOOL)a5 UseExtendedBTypes:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  char *v11;
  wspConnectIn *v12;
  uint64_t v13;
  NSString *clientMachineName;
  uint64_t v15;
  NSString *serverMachineName;
  uint64_t v17;
  NSString *userName;
  wspPropertySet *v19;
  wspPropertySet *fsciFrameworkSet1;
  catalogNameProp *v21;
  catalogNameProp *v22;
  queryTypeProp *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  scopeFlagsProp *v28;
  includeScopesProp *v29;
  wspPropertySet *v30;
  wspPropertySet *coreFrameworkSet;
  machineProp *v32;
  void *v33;
  wspPropertySet *v34;
  wspPropertySet *msidxsRowSetSet;
  rowQueryStatusProp *v36;
  cmdLocaleStrProp *v37;
  queryRestrictionProp *v38;
  parseTreeProp *v39;
  maxRankProp *v40;
  resultsFoundProp *v41;
  whereIDProp *v42;
  serverVersionProp *v43;
  serverWinVersionMajorProp *v44;
  serverWinVersionMinorProp *v45;
  _BOOL4 v46;
  serverNlsVersionProp *v47;
  serverNlsVersionDefProp *v48;
  wspPropertySet *v49;
  wspPropertySet *queryExtSet;
  useContentIndexProp *v51;
  useExtendedBtypesProp *v52;
  useExtendedBtypesProp *v53;
  wspConnectIn *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL8 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL8 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL8 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BOOL8 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BOOL8 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _BOOL8 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _BOOL8 v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _BOOL8 v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _BOOL8 v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  _BOOL8 v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _BOOL8 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  _BOOL8 v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _BOOL8 v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _BOOL8 v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  _BOOL8 v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  _BOOL8 v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  _BOOL8 v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  _BOOL8 v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  useExtendedBtypesProp *v227;
  ignoreNoiseOnlyClausesProp *v228;
  genericOptionsStrProp *v229;
  deferCatalogVerifyProp *v230;
  ignoreSBRIProp *v231;
  genParseTreeProp *v232;
  freeTextAnyTermProp *v233;
  noExpensivePropsProp *v234;
  noExpensivePropsProp *v235;
  noExpensivePropsProp *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  _BOOL8 v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  _BOOL8 v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  _BOOL8 v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  _BOOL8 v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  _BOOL8 v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  _BOOL8 v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  _BOOL8 v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  _BOOL8 v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  noExpensivePropsProp *v304;
  enableRowSetEventsProp *v305;
  enableRowSetEventsProp *v306;
  wspConnectIn *v307;
  void *v308;
  void *v309;
  uint64_t v310;
  _BOOL8 v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  enableRowSetEventsProp *v319;
  wspPropertySet *v320;
  wspPropertySet *coreFrameworkSet2;
  machineProp *v322;
  void *v323;
  machineProp *v324;
  void *v325;
  wspPropertySet *v326;
  wspPropertySet *fsciFrameworkSet2;
  void *v328;
  void *v329;
  void *v330;
  uint64_t v331;
  scopeFlagsProp *v332;
  void *v333;
  catalogNameProp *v334;
  catalogNameProp *v335;
  void *v336;
  int v337;
  _BOOL8 v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  _BOOL8 v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  _BOOL8 v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  _BOOL8 v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  _BOOL8 v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  _BOOL8 v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  _BOOL8 v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  void *v395;
  includeScopesProp *v396;
  machineProp *v397;
  scopeFlagsProp *v398;
  wspConnectIn *v399;
  objc_super v400;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v400.receiver = self;
  v400.super_class = (Class)wspConnectIn;
  v11 = -[wspConnectIn init](&v400, sel_init);
  v12 = (wspConnectIn *)v11;
  if (!v11)
  {
    v27 = 0;
    v25 = 0;
    v23 = 0;
    goto LABEL_38;
  }
  *(_OWORD *)(v11 + 8) = xmmword_227C48D10;
  *((_QWORD *)v11 + 3) = 0x100010700;
  *((_DWORD *)v11 + 8) = 0;
  objc_msgSend(v10, "clientMachineName");
  v13 = objc_claimAutoreleasedReturnValue();
  clientMachineName = v12->_clientMachineName;
  v12->_clientMachineName = (NSString *)v13;

  objc_msgSend(v10, "serverName");
  v15 = objc_claimAutoreleasedReturnValue();
  serverMachineName = v12->_serverMachineName;
  v12->_serverMachineName = (NSString *)v15;

  objc_msgSend(v10, "userName");
  v17 = objc_claimAutoreleasedReturnValue();
  userName = v12->_userName;
  v12->_userName = (NSString *)v17;

  v12->_cPropSets = 2;
  v19 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 1);
  fsciFrameworkSet1 = v12->_fsciFrameworkSet1;
  v12->_fsciFrameworkSet1 = v19;

  if (!v12->_fsciFrameworkSet1)
    goto LABEL_35;
  v21 = -[catalogNameProp initWithCatName:UseExtBTypes:]([catalogNameProp alloc], "initWithCatName:UseExtBTypes:", CFSTR("Windows\\SystemIndex"), 1);
  if (!v21)
  {
    v58 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v58)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.1(v58, v59, v60, v61, v62, v63, v64, v65);
    goto LABEL_35;
  }
  v22 = v21;
  -[wspPropertySet addProperty:](v12->_fsciFrameworkSet1, "addProperty:", v21);
  v23 = objc_alloc_init(queryTypeProp);

  if (!v23)
  {
    v66 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v66)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.2(v66, v67, v68, v69, v70, v71, v72, v73);
LABEL_35:
    v27 = 0;
    v25 = 0;
    v23 = 0;
LABEL_36:
    v28 = (scopeFlagsProp *)v12;
LABEL_37:

    v12 = 0;
    goto LABEL_38;
  }
  -[wspPropertySet addProperty:](v12->_fsciFrameworkSet1, "addProperty:", v23);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v75 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v75)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.3(v75, v76, v77, v78, v79, v80, v81, v82);
    v27 = 0;
    v25 = 0;
    goto LABEL_36;
  }
  v25 = (void *)v24;
  v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v24, 0);
  if (!v26)
  {
    v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v83)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.4(v83, v84, v85, v86, v87, v88, v89, v90);
    v27 = 0;
    goto LABEL_36;
  }
  v27 = (void *)v26;
  v28 = -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:]([scopeFlagsProp alloc], "initWithScopeFlagsArr:UseExtBTypes:", v26, 1);
  if (!v28)
  {
    v91 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v91)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.5(v91, v92, v93, v94, v95, v96, v97, v98);
    goto LABEL_56;
  }
  -[wspPropertySet addProperty:](v12->_fsciFrameworkSet1, "addProperty:", v28);

  v29 = -[includeScopesProp initWithIncludeScopes:UseExtBTypes:]([includeScopesProp alloc], "initWithIncludeScopes:UseExtBTypes:", &unk_24F069950, 1);
  if (!v29)
  {
    v99 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v99)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.6(v99, v100, v101, v102, v103, v104, v105, v106);
    goto LABEL_50;
  }
  -[wspPropertySet addProperty:](v12->_fsciFrameworkSet1, "addProperty:", v29);
  v30 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 2);
  coreFrameworkSet = v12->_coreFrameworkSet;
  v12->_coreFrameworkSet = v30;

  if (!v12->_coreFrameworkSet)
  {
    v27 = &unk_24F069950;
    v23 = (queryTypeProp *)v29;
    goto LABEL_56;
  }
  v398 = v28;
  v32 = [machineProp alloc];
  objc_msgSend(v10, "serverName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[machineProp initWithServerMachine:UseExtBTypes:](v32, "initWithServerMachine:UseExtBTypes:", v33, 0);

  if (!v23)
  {
    v107 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v107)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.7(v107, v108, v109, v110, v111, v112, v113, v114);
    v23 = 0;
    goto LABEL_55;
  }
  -[wspPropertySet addProperty:](v12->_coreFrameworkSet, "addProperty:", v23);
  v12->_cExtPropSet = 4;
  v34 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 4);
  msidxsRowSetSet = v12->_msidxsRowSetSet;
  v12->_msidxsRowSetSet = v34;

  if (!v12->_msidxsRowSetSet)
  {
LABEL_55:
    v27 = &unk_24F069950;
    v28 = v398;
    goto LABEL_56;
  }
  v36 = -[rowQueryStatusProp initWithInt:]([rowQueryStatusProp alloc], "initWithInt:", 0);

  if (!v36)
  {
    v115 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v28 = v398;
    if (v115)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.8(v115, v116, v117, v118, v119, v120, v121, v122);
LABEL_50:
    v23 = 0;
    v27 = &unk_24F069950;
LABEL_56:

    goto LABEL_37;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v36);
  v37 = -[cmdLocaleStrProp initWithLocaleStr:]([cmdLocaleStrProp alloc], "initWithLocaleStr:", CFSTR("EN"));
  -[cmdLocaleStrProp set_dbpropOptions:](v37, "set_dbpropOptions:", 1);
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v37);
  v38 = -[queryRestrictionProp initWithRestrictionStr:]([queryRestrictionProp alloc], "initWithRestrictionStr:", &stru_24F061C38);

  if (!v38)
  {
    v123 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v28 = v398;
    if (v123)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.9(v123, v124, v125, v126, v127, v128, v129, v130);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v38);
  v39 = -[parseTreeProp initWithParseTreeStr:]([parseTreeProp alloc], "initWithParseTreeStr:", &stru_24F061C38);

  v28 = v398;
  if (!v39)
  {
    v131 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v131)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.10(v131, v132, v133, v134, v135, v136, v137, v138);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v39);
  v40 = -[maxRankProp initWithInt:]([maxRankProp alloc], "initWithInt:", 0);

  if (!v40)
  {
    v139 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v139)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.11(v139, v140, v141, v142, v143, v144, v145, v146);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v40);
  v41 = -[resultsFoundProp initWithInt:]([resultsFoundProp alloc], "initWithInt:", 0);

  if (!v41)
  {
    v147 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v147)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.12(v147, v148, v149, v150, v151, v152, v153, v154);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v41);
  v42 = -[whereIDProp initWithUInt:]([whereIDProp alloc], "initWithUInt:", 0);

  if (!v42)
  {
    v155 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v155)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.13(v155, v156, v157, v158, v159, v160, v161, v162);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v42);
  v43 = -[serverVersionProp initWithInt:]([serverVersionProp alloc], "initWithInt:", 0);

  if (!v43)
  {
    v163 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v163)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.14(v163, v164, v165, v166, v167, v168, v169, v170);
    goto LABEL_73;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v43);
  v44 = -[serverWinVersionMajorProp initWithInt:]([serverWinVersionMajorProp alloc], "initWithInt:", 0);

  if (!v44)
  {
    v171 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v171)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.15(v171, v172, v173, v174, v175, v176, v177, v178);
LABEL_73:
    v23 = 0;
LABEL_74:

    v27 = &unk_24F069950;
    goto LABEL_37;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v44);
  v45 = -[serverWinVersionMinorProp initWithInt:]([serverWinVersionMinorProp alloc], "initWithInt:", 0);

  if (!v45)
  {
    v179 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v179)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.16(v179, v180, v181, v182, v183, v184, v185, v186);
    goto LABEL_87;
  }
  v46 = v7;
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v45);
  v47 = -[serverNlsVersionProp initWithInt:]([serverNlsVersionProp alloc], "initWithInt:", 0);

  if (!v47)
  {
    v187 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v187)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.17(v187, v188, v189, v190, v191, v192, v193, v194);
    goto LABEL_87;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v47);
  v48 = -[serverNlsVersionDefProp initWithInt:]([serverNlsVersionDefProp alloc], "initWithInt:", 0);

  if (!v48)
  {
    v195 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v195)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.18(v195, v196, v197, v198, v199, v200, v201, v202);
    goto LABEL_87;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v48);
  v23 = -[sameSortOrderUsedProp initWithBool:]([sameSortOrderUsedProp alloc], "initWithBool:", 1);

  if (!v23)
  {
    v203 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v203)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.19(v203, v204, v205, v206, v207, v208, v209, v210);
    goto LABEL_87;
  }
  -[wspPropertySet addProperty:](v12->_msidxsRowSetSet, "addProperty:", v23);
  v49 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 3);
  queryExtSet = v12->_queryExtSet;
  v12->_queryExtSet = v49;

  if (!v12->_coreFrameworkSet)
  {
LABEL_88:
    v28 = v398;
    goto LABEL_74;
  }
  v51 = -[useContentIndexProp initWithBool:]([useContentIndexProp alloc], "initWithBool:", 0);

  if (!v51)
  {
    v211 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v211)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.20(v211, v212, v213, v214, v215, v216, v217, v218);
    goto LABEL_87;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v51);
  v23 = -[deferNonIndexedTrimProp initWithBool:]([deferNonIndexedTrimProp alloc], "initWithBool:", 0);

  if (!v23)
  {
    v219 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v219)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.21(v219, v220, v221, v222, v223, v224, v225, v226);
LABEL_87:
    v23 = 0;
    goto LABEL_88;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v23);
  v52 = [useExtendedBtypesProp alloc];
  if (v6)
  {
    v53 = -[useExtendedBtypesProp initWithBool:](v52, "initWithBool:", 1);
    if (v53)
    {
      v54 = (wspConnectIn *)v53;
      -[useExtendedBtypesProp cProps](v53, "cProps");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      v57 = 1;
      goto LABEL_91;
    }
LABEL_101:
    v240 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v240)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.22(v240, v241, v242, v243, v244, v245, v246, v247);
    v54 = v12;
    goto LABEL_119;
  }
  v227 = -[useExtendedBtypesProp initWithBool:](v52, "initWithBool:", 0);
  if (!v227)
    goto LABEL_101;
  v54 = (wspConnectIn *)v227;
  -[useExtendedBtypesProp cProps](v227, "cProps");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  v57 = 0;
LABEL_91:
  objc_msgSend(v55, "setDbPropOptions:", v57);

  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v54);
  v228 = -[ignoreNoiseOnlyClausesProp initWithBool:]([ignoreNoiseOnlyClausesProp alloc], "initWithBool:", 0);

  if (!v228)
  {
    v248 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v248)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.23(v248, v249, v250, v251, v252, v253, v254, v255);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v228);
  v229 = -[genericOptionsStrProp initWithOptionsStr:]([genericOptionsStrProp alloc], "initWithOptionsStr:", &stru_24F061C38);

  if (!v229)
  {
    v256 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v256)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.24(v256, v257, v258, v259, v260, v261, v262, v263);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v229);
  v230 = -[deferCatalogVerifyProp initWithBool:]([deferCatalogVerifyProp alloc], "initWithBool:", 0);

  if (!v230)
  {
    v264 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v264)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.25(v264, v265, v266, v267, v268, v269, v270, v271);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v230);
  v231 = -[ignoreSBRIProp initWithBool:]([ignoreSBRIProp alloc], "initWithBool:", 0);

  if (!v231)
  {
    v272 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v272)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.26(v272, v273, v274, v275, v276, v277, v278, v279);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v231);
  v232 = -[genParseTreeProp initWithBool:]([genParseTreeProp alloc], "initWithBool:", 0);

  if (!v232)
  {
    v280 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v280)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.27(v280, v281, v282, v283, v284, v285, v286, v287);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v232);
  v233 = -[freeTextAnyTermProp initWithBool:]([freeTextAnyTermProp alloc], "initWithBool:", 0);

  if (!v233)
  {
    v288 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v288)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.28(v288, v289, v290, v291, v292, v293, v294, v295);
    goto LABEL_118;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v233);
  v23 = -[freeTextUseStemmingProp initWithBool:]([freeTextUseStemmingProp alloc], "initWithBool:", 0);

  if (!v23)
  {
    v296 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v296)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.29(v296, v297, v298, v299, v300, v301, v302, v303);
LABEL_118:

    v23 = 0;
LABEL_119:

    v27 = &unk_24F069950;
    v28 = v398;
    goto LABEL_37;
  }
  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v23);
  v234 = [noExpensivePropsProp alloc];
  if (v46)
  {
    v235 = -[noExpensivePropsProp initWithBool:](v234, "initWithBool:", 1);
    if (v235)
    {
      v236 = v235;
      -[noExpensivePropsProp cProps](v235, "cProps");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v237;
      v239 = 1;
      goto LABEL_122;
    }
LABEL_125:
    v311 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v311)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.30(v311, v312, v313, v314, v315, v316, v317, v318);

    goto LABEL_119;
  }
  v304 = -[noExpensivePropsProp initWithBool:](v234, "initWithBool:", 0);
  if (!v304)
    goto LABEL_125;
  v236 = v304;
  -[noExpensivePropsProp cProps](v304, "cProps");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = v237;
  v239 = 0;
LABEL_122:
  objc_msgSend(v237, "setDbPropOptions:", v239);

  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v236);
  v305 = [enableRowSetEventsProp alloc];
  if (v8)
  {
    v306 = -[enableRowSetEventsProp initWithBool:](v305, "initWithBool:", 1);
    if (v306)
    {
      v307 = (wspConnectIn *)v306;
      -[enableRowSetEventsProp cProps](v306, "cProps");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v309 = v308;
      v310 = 1;
      goto LABEL_130;
    }
LABEL_139:
    v338 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v338)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.31(v338, v339, v340, v341, v342, v343, v344, v345);
    goto LABEL_142;
  }
  v319 = -[enableRowSetEventsProp initWithBool:](v305, "initWithBool:", 0);
  if (!v319)
    goto LABEL_139;
  v307 = (wspConnectIn *)v319;
  -[enableRowSetEventsProp cProps](v319, "cProps");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v309 = v308;
  v310 = 0;
LABEL_130:
  objc_msgSend(v308, "setDbPropOptions:", v310);

  -[wspPropertySet addProperty:](v12->_queryExtSet, "addProperty:", v307);
  v320 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 2);
  coreFrameworkSet2 = v12->_coreFrameworkSet2;
  v12->_coreFrameworkSet2 = v320;

  if (!v12->_coreFrameworkSet2)
  {

    v12 = v307;
LABEL_142:

LABEL_146:
    goto LABEL_119;
  }
  v322 = [machineProp alloc];
  objc_msgSend(v10, "serverName");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v324 = -[machineProp initWithServerMachine:UseExtBTypes:](v322, "initWithServerMachine:UseExtBTypes:", v323, 0);

  v397 = v324;
  if (!v324)
  {
    v346 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v346)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.32(v346, v347, v348, v349, v350, v351, v352, v353);
    goto LABEL_145;
  }
  -[machineProp cProps](v324, "cProps");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v325, "setTimeMidGuid");

  -[wspPropertySet addProperty:](v12->_coreFrameworkSet2, "addProperty:", v324);
  v326 = -[wspPropertySet initWithPropSetID:]([wspPropertySet alloc], "initWithPropSetID:", 1);
  fsciFrameworkSet2 = v12->_fsciFrameworkSet2;
  v12->_fsciFrameworkSet2 = v326;

  if (!v12->_fsciFrameworkSet1)
  {
LABEL_145:

    goto LABEL_146;
  }
  v396 = -[includeScopesProp initWithIncludeScopes:UseExtBTypes:]([includeScopesProp alloc], "initWithIncludeScopes:UseExtBTypes:", &unk_24F069968, 0);
  if (!v396)
  {
    v354 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v354)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.33(v354, v355, v356, v357, v358, v359, v360, v361);

    goto LABEL_153;
  }
  -[includeScopesProp cProps](v396, "cProps");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v328, "setTimeMidGuid");

  -[includeScopesProp variant](v396, "variant");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "arrObj");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "setFFeatures:", 256);

  -[wspPropertySet addProperty:](v12->_fsciFrameworkSet2, "addProperty:", v396);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v331 = objc_claimAutoreleasedReturnValue();

  v394 = (void *)v331;
  if (!v331)
  {
    v362 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v362)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.34(v362, v363, v364, v365, v366, v367, v368, v369);

    v25 = 0;
LABEL_153:
    v12 = 0;
    v337 = 2;
    v395 = &unk_24F069968;
    goto LABEL_165;
  }
  v395 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v331, 0);
  if (v395)
  {
    v332 = -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:]([scopeFlagsProp alloc], "initWithScopeFlagsArr:UseExtBTypes:", v395, 0);

    if (!v332)
    {
      v378 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v378)
        -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.36(v378, v379, v380, v381, v382, v383, v384, v385);
      v337 = 2;
      v399 = v12;
      v25 = v394;
      v12 = 0;

      goto LABEL_166;
    }
    -[scopeFlagsProp cProps](v332, "cProps");
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v333, "setTimeMidGuid");

    -[wspPropertySet addProperty:](v12->_fsciFrameworkSet2, "addProperty:", v332);
    v334 = -[catalogNameProp initWithCatName:UseExtBTypes:]([catalogNameProp alloc], "initWithCatName:UseExtBTypes:", CFSTR("Windows\\SystemIndex"), 0);
    v335 = v334;
    if (v334)
    {
      -[catalogNameProp cProps](v334, "cProps");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v336, "setTimeMidGuid");

      -[wspPropertySet addProperty:](v12->_fsciFrameworkSet2, "addProperty:", v335);
      v337 = 0;
    }
    else
    {
      v386 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v386)
        -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.37(v386, v387, v388, v389, v390, v391, v392, v393);

      v12 = 0;
      v337 = 2;
    }

    v398 = v332;
  }
  else
  {
    v370 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v370)
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.35(v370, v371, v372, v373, v374, v375, v376, v377);

    v395 = 0;
    v12 = 0;
    v337 = 2;
  }
  v25 = v394;
LABEL_165:

LABEL_166:
  if ((v337 | 2) != 2)
  {
    v27 = v395;
    goto LABEL_39;
  }
  v27 = v395;
LABEL_38:
  v12 = v12;
LABEL_39:

  return v12;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  utf16leData *v16;
  void *v17;
  utf16leData *v18;
  unint64_t v19;
  unsigned int v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  id v30;
  utf16leData *v31;
  void *v32;
  utf16leData *v33;
  unint64_t v34;
  unsigned int v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  id v45;
  unsigned int v46;
  unint64_t v47;
  unsigned int v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  unint64_t v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t v72;
  utf16leData *v73;
  int __dst;
  unint64_t __dsta;
  unint64_t __dstb;
  unsigned int v77;

  v8 = a3;
  v77 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.19();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.1();
    goto LABEL_7;
  }
  v15 = v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 16) = self->_clientVersion;
  if (v10 - 20 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 20) = self->_clientIsRemote;
  v16 = [utf16leData alloc];
  -[wspConnectIn clientMachineName](self, "clientMachineName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[utf16leData initWithStr:](v16, "initWithStr:", v17);

  if (!v18)
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_7;
  }
  v19 = v10 - 48;
  v20 = -[utf16leData byteCount](v18, "byteCount");
  if (v19 < v20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();

    goto LABEL_7;
  }
  v72 = v19;
  v29 = v20;
  v70 = a4 + 48;
  -[utf16leData datab](v18, "datab");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  __dst = v29;
  memcpy((void *)(v15 + a4 + 48), (const void *)objc_msgSend(v30, "bytes"), v29);

  v31 = [utf16leData alloc];
  -[wspConnectIn userName](self, "userName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[utf16leData initWithStr:](v31, "initWithStr:", v32);

  if (!v33)
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.6(v36, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_7;
  }
  v34 = v72 - v29;
  v35 = -[utf16leData byteCount](v33, "byteCount");
  if (v72 - v29 < v35)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();
LABEL_37:

    goto LABEL_7;
  }
  v44 = v35;
  v73 = v33;
  -[utf16leData datab](v33, "datab");
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy((void *)(v15 + __dst + v70), (const void *)objc_msgSend(v45, "bytes"), v44);

  v46 = v44 + __dst + v70;
  v47 = v34 - v44;
  v48 = align8Pad(v46);
  if (!v48)
  {
LABEL_34:
    if (v47 <= 3)
    {
      v33 = v73;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.8();
      goto LABEL_37;
    }
    *(_DWORD *)(v15 + v46) = self->_cPropSets;
    v49 = v46 + 4;
    -[wspConnectIn fsciFrameworkSet1](self, "fsciFrameworkSet1");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v50, "encodeBuffer:BufferOffset:BytesWritten:", v11, v49, &v77);

    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.17();
    }
    else
    {
      __dsta = v77;
      v51 = v77 + v49;
      -[wspConnectIn coreFrameworkSet](self, "coreFrameworkSet");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v52, "encodeBuffer:BufferOffset:BytesWritten:", v11, v51, &v77);

      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.16();
      }
      else
      {
        v53 = v77 + v51;
        v54 = v47 - __dsta - v77 - 4;
        *(_DWORD *)(v15 + a4 + 24) = __dsta + v77 + 4;
        v55 = align8Pad(v53);
        if (v55)
        {
          if (v54 < v55)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.15();
            goto LABEL_32;
          }
          v53 += v55;
          v54 -= v55;
        }
        if (v54 <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.9();
          goto LABEL_32;
        }
        *(_DWORD *)(v15 + v53) = self->_cExtPropSet;
        v56 = v53 + 4;
        -[wspConnectIn msidxsRowSetSet](self, "msidxsRowSetSet");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v57, "encodeBuffer:BufferOffset:BytesWritten:", v11, v53 + 4, &v77);

        if (v13)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.14();
        }
        else
        {
          __dstb = v77;
          v58 = v77 + v56;
          -[wspConnectIn queryExtSet](self, "queryExtSet");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v59, "encodeBuffer:BufferOffset:BytesWritten:", v11, v58, &v77);

          if (v13)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.13();
          }
          else
          {
            v71 = v77;
            v60 = v77 + v58;
            -[wspConnectIn coreFrameworkSet2](self, "coreFrameworkSet2");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v61, "encodeBuffer:BufferOffset:BytesWritten:", v11, v60, &v77);

            if (v13)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.12();
            }
            else
            {
              v69 = v77;
              v62 = v77 + v60;
              -[wspConnectIn fsciFrameworkSet2](self, "fsciFrameworkSet2");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v63, "encodeBuffer:BufferOffset:BytesWritten:", v11, v62, &v77);

              if (!v13)
              {
                v64 = a4 + 32;
                v65 = v77;
                v66 = v77 + v62;
                *(_DWORD *)(v15 + v64) = __dstb + v71 + v69 + v77 + 4;
                v67 = align8Pad(v66);
                if (v67)
                {
                  v68 = v67;
                  if (v54 - (__dstb + v71) - (v69 + v65) - 4 < v67)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.10();
                    goto LABEL_32;
                  }
                  bzero((void *)(v15 + v66), v67);
                  v66 += v68;
                }
                *(_DWORD *)(v15 + 8) = getChecksum32(200, (int *)(v15 + 16), v66 - 16);
                *a5 = v66;

                v13 = 0;
                goto LABEL_8;
              }
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.11();
            }
          }
        }
      }
    }

    goto LABEL_8;
  }
  if (v47 >= v48)
  {
    v46 += v48;
    v47 -= v48;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.18();
LABEL_32:

LABEL_7:
  v13 = 12;
LABEL_8:

  return v13;
}

- (unsigned)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(unsigned int)a3
{
  self->_clientVersion = a3;
}

- (unsigned)clientIsRemote
{
  return self->_clientIsRemote;
}

- (void)setClientIsRemote:(unsigned int)a3
{
  self->_clientIsRemote = a3;
}

- (unsigned)cbBlob2
{
  return self->_cbBlob2;
}

- (void)setCbBlob2:(unsigned int)a3
{
  self->_cbBlob2 = a3;
}

- (NSString)clientMachineName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientMachineName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)serverMachineName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServerMachineName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unsigned)cPropSets
{
  return self->_cPropSets;
}

- (void)setCPropSets:(unsigned int)a3
{
  self->_cPropSets = a3;
}

- (wspPropertySet)fsciFrameworkSet1
{
  return (wspPropertySet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFsciFrameworkSet1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (wspPropertySet)coreFrameworkSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCoreFrameworkSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)cExtPropSet
{
  return self->_cExtPropSet;
}

- (void)setCExtPropSet:(unsigned int)a3
{
  self->_cExtPropSet = a3;
}

- (wspPropertySet)msidxsRowSetSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMsidxsRowSetSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (wspPropertySet)queryExtSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueryExtSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (wspPropertySet)coreFrameworkSet2
{
  return (wspPropertySet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCoreFrameworkSet2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (wspPropertySet)fsciFrameworkSet2
{
  return (wspPropertySet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFsciFrameworkSet2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsciFrameworkSet2, 0);
  objc_storeStrong((id *)&self->_coreFrameworkSet2, 0);
  objc_storeStrong((id *)&self->_queryExtSet, 0);
  objc_storeStrong((id *)&self->_msidxsRowSetSet, 0);
  objc_storeStrong((id *)&self->_coreFrameworkSet, 0);
  objc_storeStrong((id *)&self->_fsciFrameworkSet1, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_serverMachineName, 0);
  objc_storeStrong((id *)&self->_clientMachineName, 0);
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create catalogNameProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create queryTypeProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create scopeFlags NSNumber\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create scopeFlags array\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create scopeFlagsProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create includeScopesProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create machineProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create rowQueryStatusProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create queryRestrictionProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create parseTreeProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create maxRankProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create resultsFoundProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create whereIDProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create serverVersionProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create serverWinVersionMajorProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create serverWinVersionMinorProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create serverNlsVersionProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create serverNlsVersionDefProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create sameSortOrderUsedProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create useContentIndexProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create deferNonIndexedTrimProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create useExtendedBtypesProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create ignoreNoiseOnlyClausesProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create genericOptionsStrProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create deferCatalogVerifyProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create ignoreSBRIProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create genParseTreeProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create freeTextAnyTermProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create freeTextUseStemmingProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create noExpensivePropsProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create enableRowSetEventsProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: failed to create machineProp2\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: aPropertySet, failed to create includeScopesProp2\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: aPropertySet, failed to create scopeFlags NSNumber\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: aPropertySet, failed to create scopeFlags array\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: aPropertySet, failed to create scopeFlagsArrProp\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnect:initWithUser: aPropertySet, failed to create catalogNameProp2\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for clientVersion, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for fClientIsRemote, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnectIn:encodeBuffer: failed to convert clientMachineName\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for userName, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspConnectIn:encodeBuffer: failed to convert userName\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for cPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for cExtPropSet: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for final align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode aPropertySet fsciFrameworkSet2  error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode aPropertySet coreFrameWorkSet2 error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode queryExtSet error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode msidxsRowSetSet error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for paddingExtPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode PropertySet2  error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: encode PropertySet1 error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space for paddingcPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspConnectIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
