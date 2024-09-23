@implementation STUsageReport

- (STUsageReport)initWithReportType:(unint64_t)a3 startDate:(id)a4 lastUpdatedDate:(id)a5 firstPickup:(id)a6 usageItems:(id)a7
{
  uint64_t v11;
  NSCache *dataSetByUsageIdentifier;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  id v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  NSArray *dateIntervals;
  void *v99;
  double v100;
  uint64_t v101;
  NSDictionary *screenTimeByStartOfDateInterval;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSDictionary *pickupsByTrustIdentifier;
  void *v110;
  uint64_t v111;
  NSDictionary *pickupsByStartOfDateInterval;
  void *v113;
  uint64_t v114;
  NSDictionary *pickupsByStartOfDateIntervalByTrustIdentifier;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  NSDictionary *v121;
  NSArray *v122;
  id v123;
  STUsageReport *v124;
  unint64_t v125;
  uint64_t *v126;
  unint64_t v127;
  double v128;
  double activePickupDateIntervals;
  unint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  double v138;
  NSArray *pickups;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  NSArray *v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  double v167;
  NSArray *notifications;
  void *v169;
  void *v170;
  double v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  NSArray *appUsages;
  void *v187;
  double v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  NSArray *webUsages;
  void *v204;
  void *v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  NSArray *appAndWebUsages;
  void *v211;
  void *v212;
  double v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  NSArray *categoryUsages;
  void *v231;
  void *v232;
  id v233;
  id v234;
  uint64_t v235;
  id v236;
  void *v237;
  double totalScreenTime;
  void *v239;
  void *v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  unint64_t v246;
  double v247;
  void *v248;
  void *v249;
  id v250;
  void *v251;
  double v252;
  id v253;
  id v254;
  id v255;
  void *v256;
  void *v257;
  id v258;
  id v259;
  uint64_t *v260;
  unint64_t v261;
  double v262;
  double v263;
  unint64_t v264;
  id v265;
  id v266;
  id v267;
  void *v268;
  void *v269;
  id v270;
  id v271;
  uint64_t *v272;
  unint64_t v273;
  double v274;
  double v275;
  unint64_t v276;
  id v277;
  void *v278;
  void *v279;
  id v280;
  id v281;
  uint64_t *v282;
  unint64_t v283;
  double v284;
  double v285;
  unint64_t totalPickups;
  void *v287;
  void *v288;
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  unint64_t v294;
  double v295;
  unint64_t totalNotifications;
  void *v297;
  void *v298;
  id v299;
  id v300;
  id v301;
  id v302;
  id v303;
  unint64_t v304;
  double v305;
  void *v307;
  id v308;
  id v309;
  id v310;
  id v311;
  void *v312;
  void *v313;
  id v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  id v321;
  id v322;
  void *v323;
  void *v324;
  void *v325;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  id obj;
  id v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  void *v343;
  void *v344;
  id v345;
  void *v346;
  id v347;
  void *v348;
  uint64_t v349;
  id v350;
  STUsageReport *v351;
  id v352;
  NSDictionary *v353;
  void *v354;
  void *v355;
  id v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  _QWORD v365[4];
  id v366;
  uint64_t *v367;
  uint64_t v368;
  uint64_t *v369;
  uint64_t v370;
  uint64_t v371;
  _QWORD v372[4];
  id v373;
  id v374;
  NSDictionary *v375;
  uint64_t *v376;
  uint64_t *v377;
  uint64_t *v378;
  uint64_t *v379;
  uint64_t v380;
  uint64_t *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t *v393;
  uint64_t v394;
  uint64_t v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  objc_super v400;
  uint64_t v401;
  uint64_t *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void (*v407)(uint64_t, uint64_t);
  void *v408;
  id v409;
  id v410;
  uint64_t *v411;
  uint64_t *v412;
  uint64_t v413;
  double *v414;
  uint64_t v415;
  uint64_t v416;
  _QWORD v417[2];
  _BYTE v418[128];
  uint64_t v419;

  v419 = *MEMORY[0x24BDAC8D0];
  v314 = a4;
  v309 = a5;
  v321 = a5;
  v308 = a6;
  v311 = a6;
  v322 = a7;
  v400.receiver = self;
  v400.super_class = (Class)STUsageReport;
  v351 = -[STUsageReport init](&v400, sel_init);
  if (!v351)
    goto LABEL_184;
  v11 = objc_opt_new();
  dataSetByUsageIdentifier = v351->_dataSetByUsageIdentifier;
  v351->_dataSetByUsageIdentifier = (NSCache *)v11;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (a3 != 1)
    {
      v16 = 0;
      v15 = 0;
      v342 = 0;
      v13 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v360, "startOfDayForDate:", v314);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v360, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v360, "components:fromDate:toDate:options:", 32, v13, v342, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hour");
    v16 = 32;
  }
  else
  {
    objc_msgSend(v360, "startOfDayForDate:", v314);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v360, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v13, 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v360, "components:fromDate:toDate:options:", 16, v13, v342, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "day");
    v16 = 16;
  }

LABEL_8:
  v344 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v15);
  v17 = v13;
  v343 = v17;
  if (v15)
  {
    v18 = v17;
    do
    {
      objc_msgSend(v360, "dateByAddingUnit:value:toDate:options:", v16, 1, v18, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v18, v17);
      objc_msgSend(v344, "addObject:", v19);

      v18 = v17;
      --v15;
    }
    while (v15);
  }
  v307 = v17;
  v310 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v343, v342);
  v334 = (void *)objc_opt_new();
  v329 = (void *)objc_opt_new();
  v330 = (void *)objc_opt_new();
  v333 = (void *)objc_opt_new();
  v348 = (void *)objc_opt_new();
  v324 = (void *)objc_opt_new();
  v325 = (void *)objc_opt_new();
  v323 = (void *)objc_opt_new();
  if (a3)
  {
    v320 = (void *)objc_opt_new();
    v319 = (void *)objc_opt_new();
    v318 = (void *)objc_opt_new();
    v312 = (void *)objc_opt_new();
    v313 = (void *)objc_opt_new();
    v315 = 0;
    v316 = 0;
    v317 = v325;
    v325 = 0;
  }
  else
  {
    v312 = 0;
    v313 = 0;
    v317 = 0;
    v318 = 0;
    v319 = 0;
    v320 = 0;
    v315 = v323;
    v316 = v324;
    v323 = 0;
    v324 = 0;
  }
  v398 = 0u;
  v399 = 0u;
  v396 = 0u;
  v397 = 0u;
  obj = v322;
  v341 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v396, v418, 16);
  if (!v341)
  {
    v327 = 0;
    v328 = 0;
    goto LABEL_84;
  }
  v327 = 0;
  v328 = 0;
  v339 = v16 | 0x221E;
  v340 = *(_QWORD *)v397;
  while (2)
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v397 != v340)
      {
        v21 = v20;
        objc_enumerationMutation(obj);
        v20 = v21;
      }
      v349 = v20;
      v22 = *(void **)(*((_QWORD *)&v396 + 1) + 8 * v20);
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v360, "components:fromDate:", v339, v23);
      v358 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v360, "dateFromComponents:", v358);
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v342, "compare:", v363) != 1)
      {

        goto LABEL_84;
      }
      v24 = objc_msgSend(v22, "itemType");
      if ((unint64_t)(v24 - 1) > 5)
        v25 = 0;
      else
        v25 = (uint64_t)*(&off_24DB887C8 + v24 - 1);
      objc_msgSend(v22, "totalUsage");
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v363, "compare:", v343) == -1)
      {
        switch(v24)
        {
          case 6:
            v356 = v325;
            v352 = v317;
            v332 = v319;
            v28 = v312;
            v71 = v22;
            v345 = v358;
            v29 = v71;
            objc_msgSend(v71, "totalUsage");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "doubleValue");
            v74 = v73;

            objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startDate");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v337, "startOfDayForDate:", v75);
            v335 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v337, "components:fromDate:", 8766, v335);
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v356, "objectForKeyedSubscript:", v336);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v76, "doubleValue");
            objc_msgSend(v77, "numberWithDouble:", v74 + v78);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v356, "setObject:forKeyedSubscript:", v37, v336);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v345, "weekday"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v345, "hour"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "objectForKeyedSubscript:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v43)
            {
              v43 = (void *)objc_opt_new();
              objc_msgSend(v352, "setObject:forKeyedSubscript:", v43, v38);
            }
            objc_msgSend(v43, "objectForKeyedSubscript:", v39);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v79, "doubleValue");
            objc_msgSend(v80, "numberWithDouble:", v74 + v81);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, v39);
            if ((objc_msgSend(v28, "containsObject:", v345) & 1) != 0)
              goto LABEL_72;
            objc_msgSend(v28, "addObject:", v345);
            objc_msgSend(v332, "objectForKeyedSubscript:", v38);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v46)
            {
              v46 = (void *)objc_opt_new();
              objc_msgSend(v332, "setObject:forKeyedSubscript:", v46, v38);
            }
            break;
          case 5:
            v356 = v315;
            v352 = v323;
            v332 = v318;
            v28 = v313;
            v82 = v22;
            v345 = v358;
            v29 = v82;
            objc_msgSend(v82, "totalUsage");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "doubleValue");
            v85 = v84;

            objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startDate");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v337, "startOfDayForDate:", v86);
            v335 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v337, "components:fromDate:", 8766, v335);
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v356, "objectForKeyedSubscript:", v336);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v87, "doubleValue");
            objc_msgSend(v88, "numberWithDouble:", v85 + v89);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v356, "setObject:forKeyedSubscript:", v37, v336);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v345, "weekday"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v345, "hour"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "objectForKeyedSubscript:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v43)
            {
              v43 = (void *)objc_opt_new();
              objc_msgSend(v352, "setObject:forKeyedSubscript:", v43, v38);
            }
            objc_msgSend(v43, "objectForKeyedSubscript:", v39);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v90, "doubleValue");
            objc_msgSend(v91, "numberWithDouble:", v85 + v92);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, v39);
            if ((objc_msgSend(v28, "containsObject:", v345) & 1) != 0)
              goto LABEL_72;
            objc_msgSend(v28, "addObject:", v345);
            objc_msgSend(v332, "objectForKeyedSubscript:", v38);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v46)
            {
              v46 = (void *)objc_opt_new();
              objc_msgSend(v332, "setObject:forKeyedSubscript:", v46, v38);
            }
            break;
          case 1:
            v356 = v316;
            v352 = v324;
            v332 = v320;
            v28 = v22;
            v29 = v358;
            objc_msgSend(v28, "totalUsage");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "doubleValue");
            v32 = v31;

            objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
            v345 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "startDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v345, "startOfDayForDate:", v33);
            v337 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v345, "components:fromDate:", 8766, v337);
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v356, "objectForKeyedSubscript:", v335);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v34, "doubleValue");
            objc_msgSend(v35, "numberWithDouble:", v32 + v36);
            v336 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v356, "setObject:forKeyedSubscript:", v336, v335);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "weekday"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v29, "hour"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "objectForKeyedSubscript:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              v39 = (void *)objc_opt_new();
              objc_msgSend(v352, "setObject:forKeyedSubscript:", v39, v37);
            }
            objc_msgSend(v39, "objectForKeyedSubscript:", v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v40, "doubleValue");
            objc_msgSend(v41, "numberWithDouble:", v32 + v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, v38);
            if ((objc_msgSend(0, "containsObject:", v29) & 1) != 0)
              goto LABEL_73;
            objc_msgSend(0, "addObject:", v29);
            objc_msgSend(v332, "objectForKeyedSubscript:", v37);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v44)
            {
              v44 = (void *)objc_opt_new();
              objc_msgSend(v332, "setObject:forKeyedSubscript:", v44, v37);
            }
            objc_msgSend(v44, "objectForKeyedSubscript:", v38);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v45, "unsignedIntegerValue") + 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "setObject:forKeyedSubscript:", v46, v38);
            goto LABEL_71;
          default:
            goto LABEL_79;
        }
        objc_msgSend(v46, "objectForKeyedSubscript:", v39);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v93, "unsignedIntegerValue") + 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "setObject:forKeyedSubscript:", v94, v39);
LABEL_71:

LABEL_72:
LABEL_73:

        goto LABEL_78;
      }
      objc_msgSend(v348, "objectForKeyedSubscript:", v361);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v26, v354);
      v356 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v348, "setObject:forKeyedSubscript:", v356, v361);
      if (v24 != 1)
      {
        objc_msgSend(v334, "objectForKeyedSubscript:", v361);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v47)
        {
          v48 = objc_opt_new();
          objc_msgSend(v334, "setObject:forKeyedSubscript:", v48, v361);
          v47 = (void *)v48;
        }
        v352 = v47;
        objc_msgSend(v47, "objectForKeyedSubscript:", v363);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          v49 = (void *)objc_msgSend(v22, "copy");
          objc_msgSend(v22, "identifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "componentsSeparatedByString:", CFSTR("-"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "firstObject");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setIdentifier:", v52);

          objc_msgSend(v49, "setTotalUsage:", &unk_24DBBED90);
          objc_msgSend(v49, "setMaxUsage:", &unk_24DBBED90);
          objc_msgSend(v49, "setMinUsage:", &unk_24DBBED90);
          objc_msgSend(v352, "setObject:forKeyedSubscript:", v49, v363);
        }
        objc_msgSend(v49, "totalUsage");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "totalUsage");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setTotalUsage:", v55);

        objc_msgSend(v22, "budgetItemIdentifier");
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        if (v346)
        {
          objc_msgSend(v330, "objectForKeyedSubscript:", v361);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            v56 = (void *)objc_opt_new();
            objc_msgSend(v330, "setObject:forKeyedSubscript:", v56, v361);
          }
          v338 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v346, objc_msgSend(v22, "usageTrusted"));
          objc_msgSend(v56, "objectForKeyedSubscript:", v338);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v57)
          {
            v57 = (void *)objc_msgSend(v22, "copy");
            objc_msgSend(v57, "setTotalUsage:", &unk_24DBBED90);
            objc_msgSend(v57, "setMaxUsage:", &unk_24DBBED90);
            objc_msgSend(v57, "setMinUsage:", &unk_24DBBED90);
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v57, v338);
          }
          objc_msgSend(v57, "totalUsage");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "totalUsage");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setTotalUsage:", v60);

          objc_msgSend(v329, "objectForKeyedSubscript:", v361);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v61)
          {
            v61 = (void *)objc_opt_new();
            objc_msgSend(v329, "setObject:forKeyedSubscript:", v61, v361);
          }
          objc_msgSend(v61, "objectForKeyedSubscript:", v338);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62)
          {
            v62 = (void *)objc_opt_new();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v62, v338);
          }
          objc_msgSend(v62, "objectForKeyedSubscript:", v363);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v63)
          {
            v63 = (void *)objc_msgSend(v22, "copy");
            objc_msgSend(v63, "setTotalUsage:", &unk_24DBBED90);
            objc_msgSend(v63, "setMaxUsage:", &unk_24DBBED90);
            objc_msgSend(v63, "setMinUsage:", &unk_24DBBED90);
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, v363);
          }
          objc_msgSend(v63, "totalUsage");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "totalUsage");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setTotalUsage:", v66);

        }
        if (v24 == 6)
        {
          if (v328)
          {
            v67 = objc_msgSend(v363, "compare:");
            v70 = v327;
            v68 = v328;
            v69 = v363;
LABEL_57:
            if (v67 == -1)
              goto LABEL_76;
LABEL_77:

            goto LABEL_78;
          }
          v68 = 0;
          v70 = v327;
          v69 = v363;
        }
        else
        {
          if (v24 != 5)
            goto LABEL_77;
          if (v327)
          {
            v67 = objc_msgSend(v363, "compare:");
            v68 = v327;
            v69 = v328;
            v70 = v363;
            goto LABEL_57;
          }
          v68 = 0;
          v70 = v363;
          v69 = v328;
        }
LABEL_76:
        v95 = v363;

        v327 = v70;
        v328 = v69;
        goto LABEL_77;
      }
      objc_msgSend(v333, "objectForKeyedSubscript:", v363);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v354, "unsignedIntegerValue") + objc_msgSend(v27, "unsignedIntegerValue"));
      v352 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v333, "setObject:forKeyedSubscript:", v352, v363);
LABEL_78:

LABEL_79:
      v20 = v349 + 1;
    }
    while (v341 != v349 + 1);
    v341 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v396, v418, 16);
    if (v341)
      continue;
    break;
  }
LABEL_84:

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("totalUsage"), 0);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v417[0] = v364;
  v417[1] = v362;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v417, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v351->_type = a3;
  objc_storeStrong((id *)&v351->_reportDateInterval, v310);
  objc_storeStrong((id *)&v351->_lastUpdatedDate, v309);
  v97 = objc_msgSend(v344, "copy");
  dateIntervals = v351->_dateIntervals;
  v351->_dateIntervals = (NSArray *)v97;

  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEDA8);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "doubleValue");
  v351->_totalScreenTime = v100;

  v101 = objc_msgSend(v333, "copy");
  screenTimeByStartOfDateInterval = v351->_screenTimeByStartOfDateInterval;
  v351->_screenTimeByStartOfDateInterval = (NSDictionary *)v101;

  -[NSDictionary allValues](v351->_screenTimeByStartOfDateInterval, "allValues");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "valueForKeyPath:", CFSTR("@max.self"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "doubleValue");
  v351->_maxScreenTime = v105;

  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEDC0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v351->_totalPickups = objc_msgSend(v106, "unsignedIntegerValue");

  objc_msgSend(v330, "objectForKeyedSubscript:", &unk_24DBBEDC0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "copy");
  pickupsByTrustIdentifier = v351->_pickupsByTrustIdentifier;
  v351->_pickupsByTrustIdentifier = (NSDictionary *)v108;

  objc_msgSend(v334, "objectForKeyedSubscript:", &unk_24DBBEDC0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "copy");
  pickupsByStartOfDateInterval = v351->_pickupsByStartOfDateInterval;
  v351->_pickupsByStartOfDateInterval = (NSDictionary *)v111;

  objc_msgSend(v329, "objectForKeyedSubscript:", &unk_24DBBEDC0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "copy");
  pickupsByStartOfDateIntervalByTrustIdentifier = v351->_pickupsByStartOfDateIntervalByTrustIdentifier;
  v351->_pickupsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v114;

  -[NSDictionary allValues](v351->_pickupsByTrustIdentifier, "allValues");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "sortedArrayUsingDescriptors:", v96);
  v117 = objc_claimAutoreleasedReturnValue();
  v118 = (void *)v117;
  v119 = (void *)MEMORY[0x24BDBD1A8];
  if (v117)
    v120 = (void *)v117;
  else
    v120 = (void *)MEMORY[0x24BDBD1A8];
  objc_storeStrong((id *)&v351->_pickups, v120);

  v392 = 0;
  v393 = &v392;
  v394 = 0x2020000000;
  v395 = 0x7FFFFFFFFFFFFFFFLL;
  v388 = 0;
  v389 = &v388;
  v390 = 0x2020000000;
  v391 = 0x7FFFFFFFFFFFFFFFLL;
  v384 = 0;
  v385 = &v384;
  v386 = 0x2020000000;
  v387 = 0;
  v380 = 0;
  v381 = &v380;
  v382 = 0x2020000000;
  v383 = 0;
  v121 = v351->_pickupsByStartOfDateInterval;
  v122 = v351->_dateIntervals;
  v372[0] = MEMORY[0x24BDAC760];
  v372[1] = 3221225472;
  v372[2] = __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_22;
  v372[3] = &unk_24DB886B8;
  v350 = v328;
  v373 = v350;
  v376 = &v392;
  v123 = v321;
  v374 = v123;
  v377 = &v388;
  v353 = v121;
  v375 = v353;
  v378 = &v384;
  v379 = &v380;
  -[NSArray enumerateObjectsUsingBlock:](v122, "enumerateObjectsUsingBlock:", v372);
  v124 = v351;
  v125 = -[NSArray count](v351->_dateIntervals, "count");
  v126 = v389;
  if (v389[3] == 0x7FFFFFFFFFFFFFFFLL)
    v389[3] = v125 - 1;
  v127 = v393[3];
  if (v127 >= v125)
    v127 = v125;
  v393[3] = v127;
  if (v351->_type == 1)
  {
    if (v311)
    {
      objc_msgSend(v123, "timeIntervalSinceDate:");
      activePickupDateIntervals = v128 / 3600.0;
    }
    else
    {
      v135 = v126[3];
      v136 = -[NSArray count](v351->_dateIntervals, "count");
      if (v135 + 1 < v136)
        v137 = v135 + 1;
      else
        v137 = v136;
      activePickupDateIntervals = (double)(v137 - v393[3]);
    }
    v351->_activePickupDateIntervals = activePickupDateIntervals;
  }
  else
  {
    v130 = v126[3] + 1;
    v351->_activePickupDateIntervals = (double)v130;
    v131 = (void *)objc_opt_new();
    v132 = v131;
    v133 = 0x7FFFFFFFFFFFFFFFLL;
    if (v130 < 0x7FFFFFFFFFFFFFFFLL)
      v133 = v130;
    objc_msgSend(v131, "setDay:", -v133);
    objc_msgSend(v360, "dateByAddingComponents:toDate:options:", v132, v123, 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "timeIntervalSinceDate:", v134);

    v124 = v351;
    activePickupDateIntervals = v351->_activePickupDateIntervals;
  }
  v138 = 0.0;
  if (activePickupDateIntervals > 0.0)
    v138 = (double)v124->_totalPickups / activePickupDateIntervals;
  v124->_pickupRate = v138;
  v124->_maxPickupDateIntervalIndex = v381[3];
  objc_storeStrong((id *)&v124->_firstPickup, v308);
  v351->_maxPickups = v385[3];
  pickups = v351->_pickups;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@max.%@"), CFSTR("totalUsage"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKeyPath:](pickups, "valueForKeyPath:", v140);
  v359 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setValue:forKeyPath:](v351->_pickups, "setValue:forKeyPath:", v359, CFSTR("maxUsage"));
  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEDD8);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v351->_totalNotifications = objc_msgSend(v141, "unsignedIntegerValue");

  objc_msgSend(v330, "objectForKeyedSubscript:", &unk_24DBBEDD8);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "copy");
  v144 = (void *)v143;
  v145 = (void *)MEMORY[0x24BDBD1B8];
  if (v143)
    v146 = (void *)v143;
  else
    v146 = (void *)MEMORY[0x24BDBD1B8];
  objc_storeStrong((id *)&v351->_notificationsByTrustIdentifier, v146);

  objc_msgSend(v334, "objectForKeyedSubscript:", &unk_24DBBEDD8);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "copy");
  v149 = (void *)v148;
  if (v148)
    v150 = (void *)v148;
  else
    v150 = v145;
  objc_storeStrong((id *)&v351->_notificationsByStartOfDateInterval, v150);

  objc_msgSend(v329, "objectForKeyedSubscript:", &unk_24DBBEDD8);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend(v151, "copy");
  v153 = (void *)v152;
  if (v152)
    v154 = (void *)v152;
  else
    v154 = v145;
  objc_storeStrong((id *)&v351->_notificationsByStartOfDateIntervalByTrustIdentifier, v154);

  -[NSDictionary allValues](v351->_notificationsByTrustIdentifier, "allValues");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "sortedArrayUsingDescriptors:", v96);
  v156 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v156;
  if (v156)
    v158 = (void *)v156;
  else
    v158 = v119;
  objc_storeStrong((id *)&v351->_notifications, v158);

  v368 = 0;
  v369 = &v368;
  v370 = 0x2020000000;
  v371 = 0x7FFFFFFFFFFFFFFFLL;
  v159 = v351->_dateIntervals;
  v365[0] = MEMORY[0x24BDAC760];
  v365[1] = 3221225472;
  v365[2] = __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_31;
  v365[3] = &unk_24DB886E0;
  v347 = v327;
  v366 = v347;
  v367 = &v368;
  -[NSArray enumerateObjectsUsingBlock:](v159, "enumerateObjectsUsingBlock:", v365);
  v160 = v369[3];
  v161 = -[NSArray count](v351->_dateIntervals, "count");
  if (v160 >= v161)
    v162 = v161;
  else
    v162 = v160;
  v369[3] = v162;
  v163 = objc_msgSend(v344, "count");
  if (v351->_type == 1)
  {
    v164 = v389[3];
    v165 = -[NSArray count](v351->_dateIntervals, "count");
    if (v164 + 1 < v165)
      v166 = v164 + 1;
    else
      v166 = v165;
    v163 = v166 - v369[3];
  }
  if (v163)
    v167 = (double)v351->_totalNotifications / (double)v163;
  else
    v167 = 0.0;
  v351->_notificationRate = v167;
  notifications = v351->_notifications;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@max.%@"), CFSTR("totalUsage"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKeyPath:](notifications, "valueForKeyPath:", v169);
  v357 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setValue:forKeyPath:](v351->_notifications, "setValue:forKeyPath:", v357, CFSTR("maxUsage"));
  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEDF0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "doubleValue");
  v351->_totalAppUsage = v171;

  objc_msgSend(v330, "objectForKeyedSubscript:", &unk_24DBBEDF0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "copy");
  v174 = (void *)v173;
  if (v173)
    v175 = (void *)v173;
  else
    v175 = v145;
  objc_storeStrong((id *)&v351->_applicationUsageByTrustIdentifier, v175);

  objc_msgSend(v334, "objectForKeyedSubscript:", &unk_24DBBEDF0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = objc_msgSend(v176, "copy");
  v178 = (void *)v177;
  if (v177)
    v179 = (void *)v177;
  else
    v179 = v145;
  objc_storeStrong((id *)&v351->_appUsageByStartOfDateInterval, v179);

  objc_msgSend(v329, "objectForKeyedSubscript:", &unk_24DBBEDF0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(v180, "copy");
  v182 = (void *)v181;
  if (v181)
    v183 = (void *)v181;
  else
    v183 = v145;
  objc_storeStrong((id *)&v351->_applicationUsageByStartOfDateIntervalByTrustIdentifier, v183);

  -[NSDictionary allValues](v351->_applicationUsageByTrustIdentifier, "allValues");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "sortedArrayUsingDescriptors:", v96);
  v185 = objc_claimAutoreleasedReturnValue();
  appUsages = v351->_appUsages;
  v351->_appUsages = (NSArray *)v185;

  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEE08);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "doubleValue");
  v351->_totalWebUsage = v188;

  objc_msgSend(v330, "objectForKeyedSubscript:", &unk_24DBBEE08);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_msgSend(v189, "copy");
  v191 = (void *)v190;
  if (v190)
    v192 = (void *)v190;
  else
    v192 = v145;
  objc_storeStrong((id *)&v351->_webUsageByTrustIdentifier, v192);

  objc_msgSend(v334, "objectForKeyedSubscript:", &unk_24DBBEE08);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v193, "copy");
  v195 = (void *)v194;
  if (v194)
    v196 = (void *)v194;
  else
    v196 = v145;
  objc_storeStrong((id *)&v351->_webUsageByStartOfDateInterval, v196);

  objc_msgSend(v329, "objectForKeyedSubscript:", &unk_24DBBEE08);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = objc_msgSend(v197, "copy");
  v199 = (void *)v198;
  if (v198)
    v200 = (void *)v198;
  else
    v200 = v145;
  objc_storeStrong((id *)&v351->_webUsageByStartOfDateIntervalByTrustIdentifier, v200);

  -[NSDictionary allValues](v351->_webUsageByTrustIdentifier, "allValues");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "sortedArrayUsingDescriptors:", v96);
  v202 = objc_claimAutoreleasedReturnValue();
  webUsages = v351->_webUsages;
  v351->_webUsages = (NSArray *)v202;

  v204 = (void *)objc_opt_new();
  -[NSDictionary allValues](v351->_applicationUsageByTrustIdentifier, "allValues");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "addObjectsFromArray:", v205);

  -[NSDictionary allValues](v351->_webUsageByTrustIdentifier, "allValues");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "addObjectsFromArray:", v206);

  objc_msgSend(v204, "sortedArrayUsingDescriptors:", v96);
  v207 = objc_claimAutoreleasedReturnValue();
  v208 = (void *)v207;
  if (v207)
    v209 = (void *)v207;
  else
    v209 = v119;
  objc_storeStrong((id *)&v351->_appAndWebUsages, v209);

  appAndWebUsages = v351->_appAndWebUsages;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@max.%@"), CFSTR("totalUsage"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKeyPath:](appAndWebUsages, "valueForKeyPath:", v211);
  v355 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setValue:forKeyPath:](v351->_appAndWebUsages, "setValue:forKeyPath:", v355, CFSTR("maxUsage"));
  objc_msgSend(v348, "objectForKeyedSubscript:", &unk_24DBBEE20);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "doubleValue");
  v351->_totalCategoryUsage = v213;

  objc_msgSend(v330, "objectForKeyedSubscript:", &unk_24DBBEE20);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = objc_msgSend(v214, "copy");
  v216 = (void *)v215;
  if (v215)
    v217 = (void *)v215;
  else
    v217 = v145;
  objc_storeStrong((id *)&v351->_categoryUsageByTrustIdentifier, v217);

  objc_msgSend(v334, "objectForKeyedSubscript:", &unk_24DBBEE20);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = objc_msgSend(v218, "copy");
  v220 = (void *)v219;
  if (v219)
    v221 = (void *)v219;
  else
    v221 = v145;
  objc_storeStrong((id *)&v351->_categoryUsageByStartOfDateInterval, v221);

  objc_msgSend(v329, "objectForKeyedSubscript:", &unk_24DBBEE20);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend(v222, "copy");
  v224 = (void *)v223;
  if (v223)
    v225 = (void *)v223;
  else
    v225 = v145;
  objc_storeStrong((id *)&v351->_categoryUsageByStartOfDateIntervalByTrustIdentifier, v225);

  -[NSDictionary allValues](v351->_categoryUsageByTrustIdentifier, "allValues");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "sortedArrayUsingDescriptors:", v96);
  v227 = objc_claimAutoreleasedReturnValue();
  v228 = (void *)v227;
  if (v227)
    v229 = (void *)v227;
  else
    v229 = v119;
  objc_storeStrong((id *)&v351->_categoryUsages, v229);

  categoryUsages = v351->_categoryUsages;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@max.%@"), CFSTR("totalUsage"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray valueForKeyPath:](categoryUsages, "valueForKeyPath:", v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray setValue:forKeyPath:](v351->_categoryUsages, "setValue:forKeyPath:", v232, CFSTR("maxUsage"));
  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(v360, "components:fromDate:", 544, v343);
      v233 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v233, "weekday"));
      v234 = (id)objc_claimAutoreleasedReturnValue();
      v235 = objc_msgSend(v360, "rangeOfUnit:inUnit:forDate:", 32, 16, v343);
      v236 = objc_alloc(MEMORY[0x24BDD15E0]);
      v237 = (void *)objc_msgSend(v236, "initWithIndexesInRange:", v235, v389[3] + 1);
      totalScreenTime = v351->_totalScreenTime;
      objc_msgSend(v324, "objectForKeyedSubscript:", v234);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "objectForKeyedSubscript:", v234);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = v239;
      v242 = v240;
      v243 = v237;
      v413 = 0;
      v414 = (double *)&v413;
      v415 = 0x2020000000;
      v416 = 0;
      v401 = 0;
      v402 = &v401;
      v403 = 0x2020000000;
      v404 = 0;
      v405 = MEMORY[0x24BDAC760];
      v406 = 3221225472;
      v407 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v408 = &unk_24DB88780;
      v411 = &v413;
      v244 = v241;
      v409 = v244;
      v412 = &v401;
      v245 = v242;
      v410 = v245;
      objc_msgSend(v243, "enumerateIndexesUsingBlock:", &v405);
      v246 = v402[3];
      if (v246)
        v247 = totalScreenTime - v414[3] / (double)v246;
      else
        v247 = 0.0;

      _Block_object_dispose(&v401, 8);
      _Block_object_dispose(&v413, 8);

      v351->_screenTimeDeltaFromHistoricalAverage = v247;
      totalPickups = v351->_totalPickups;
      objc_msgSend(v317, "objectForKeyedSubscript:", v234);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "objectForKeyedSubscript:", v234);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = v287;
      v290 = v288;
      v291 = v243;
      v413 = 0;
      v414 = (double *)&v413;
      v415 = 0x2020000000;
      v416 = 0;
      v401 = 0;
      v402 = &v401;
      v403 = 0x2020000000;
      v404 = 0;
      v405 = MEMORY[0x24BDAC760];
      v406 = 3221225472;
      v407 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v408 = &unk_24DB88780;
      v411 = &v413;
      v292 = v289;
      v409 = v292;
      v412 = &v401;
      v293 = v290;
      v410 = v293;
      objc_msgSend(v291, "enumerateIndexesUsingBlock:", &v405);
      v294 = v402[3];
      if (v294)
        v295 = (double)totalPickups - v414[3] / (double)v294;
      else
        v295 = 0.0;

      _Block_object_dispose(&v401, 8);
      _Block_object_dispose(&v413, 8);

      v351->_pickupDeltaFromHistoricalAverage = v295;
      totalNotifications = v351->_totalNotifications;
      objc_msgSend(v323, "objectForKeyedSubscript:", v234);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v318, "objectForKeyedSubscript:", v234);
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      v299 = v297;
      v300 = v298;
      v301 = v291;
      v413 = 0;
      v414 = (double *)&v413;
      v415 = 0x2020000000;
      v416 = 0;
      v401 = 0;
      v402 = &v401;
      v403 = 0x2020000000;
      v404 = 0;
      v405 = MEMORY[0x24BDAC760];
      v406 = 3221225472;
      v407 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v408 = &unk_24DB88780;
      v411 = &v413;
      v302 = v299;
      v409 = v302;
      v412 = &v401;
      v303 = v300;
      v410 = v303;
      objc_msgSend(v301, "enumerateIndexesUsingBlock:", &v405);
      v304 = v402[3];
      if (v304)
        v305 = (double)totalNotifications - v414[3] / (double)v304;
      else
        v305 = 0.0;

      _Block_object_dispose(&v401, 8);
      _Block_object_dispose(&v413, 8);

      v351->_notificationDeltaFromHistoricalAverage = v305;
      goto LABEL_182;
    }
  }
  else
  {
    objc_msgSend(v310, "startDate");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v360, "startOfDayForDate:", v248);
    v249 = (void *)objc_claimAutoreleasedReturnValue();

    v250 = objc_alloc(MEMORY[0x24BDD15E0]);
    v251 = (void *)objc_msgSend(v250, "initWithIndexesInRange:", 0, v389[3] + 1);
    v252 = v351->_totalScreenTime;
    v253 = v316;
    v254 = v249;
    v255 = v251;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v254, 0);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v413 = 0;
    v414 = (double *)&v413;
    v415 = 0x2020000000;
    v416 = 0;
    v405 = MEMORY[0x24BDAC760];
    v406 = 3221225472;
    v407 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v408 = &unk_24DB887A8;
    v258 = v256;
    v409 = v258;
    v259 = v257;
    v410 = v259;
    v412 = &v413;
    v260 = (uint64_t *)v253;
    v411 = v260;
    objc_msgSend(v255, "enumerateIndexesUsingBlock:", &v405);
    v261 = objc_msgSend(v255, "count");
    v262 = 0.0;
    if (v261)
    {
      v263 = v414[3] / (double)v261;
      if (v263 > 0.0)
        v262 = (v252 / (double)v261 - v263) / v263;
    }

    _Block_object_dispose(&v413, 8);
    v351->_screenTimeDeltaFromHistoricalAverage = v262;
    v264 = v351->_totalPickups;
    v265 = v325;
    v266 = v254;
    v267 = v255;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v266, 0);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v413 = 0;
    v414 = (double *)&v413;
    v415 = 0x2020000000;
    v416 = 0;
    v405 = MEMORY[0x24BDAC760];
    v406 = 3221225472;
    v407 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v408 = &unk_24DB887A8;
    v270 = v268;
    v409 = v270;
    v271 = v269;
    v410 = v271;
    v412 = &v413;
    v272 = (uint64_t *)v265;
    v411 = v272;
    objc_msgSend(v267, "enumerateIndexesUsingBlock:", &v405);
    v273 = objc_msgSend(v267, "count");
    v274 = 0.0;
    if (v273)
    {
      v275 = v414[3] / (double)v273;
      if (v275 > 0.0)
        v274 = ((double)v264 / (double)v273 - v275) / v275;
    }

    _Block_object_dispose(&v413, 8);
    v351->_pickupDeltaFromHistoricalAverage = v274;
    v276 = v351->_totalNotifications;
    v277 = v315;
    v233 = v266;
    v234 = v267;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v233, 0);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v413 = 0;
    v414 = (double *)&v413;
    v415 = 0x2020000000;
    v416 = 0;
    v405 = MEMORY[0x24BDAC760];
    v406 = 3221225472;
    v407 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v408 = &unk_24DB887A8;
    v280 = v278;
    v409 = v280;
    v281 = v279;
    v410 = v281;
    v412 = &v413;
    v282 = (uint64_t *)v277;
    v411 = v282;
    objc_msgSend(v234, "enumerateIndexesUsingBlock:", &v405);
    v283 = objc_msgSend(v234, "count");
    v284 = 0.0;
    if (v283)
    {
      v285 = v414[3] / (double)v283;
      if (v285 > 0.0)
        v284 = ((double)v276 / (double)v283 - v285) / v285;
    }

    _Block_object_dispose(&v413, 8);
    v351->_notificationDeltaFromHistoricalAverage = v284;
LABEL_182:

  }
  _Block_object_dispose(&v368, 8);

  _Block_object_dispose(&v380, 8);
  _Block_object_dispose(&v384, 8);
  _Block_object_dispose(&v388, 8);
  _Block_object_dispose(&v392, 8);

LABEL_184:
  return v351;
}

uint64_t __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  return objc_msgSend(v4, "numberWithDouble:", v7 + v9);
}

uint64_t __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  return objc_msgSend(v4, "numberWithUnsignedInteger:", v7 + v6);
}

void __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_22(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  id v22;

  v5 = a2;
  v6 = (void *)a1[4];
  v22 = v5;
  if (v6)
  {
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v7) == -1)
    {

      v5 = v22;
    }
    else
    {
      v8 = (void *)a1[4];
      objc_msgSend(v22, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:", v9);

      v5 = v22;
      if (v10 == -1)
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
    }
  }
  v11 = (void *)a1[5];
  objc_msgSend(v5, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "compare:", v12) == -1)
  {

  }
  else
  {
    v13 = (void *)a1[5];
    objc_msgSend(v22, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 == -1)
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;
  }
  v16 = (void *)a1[6];
  objc_msgSend(v22, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "totalUsage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  v21 = *(_QWORD *)(a1[9] + 8);
  if (v20 > *(_QWORD *)(v21 + 24))
  {
    *(_QWORD *)(v21 + 24) = v20;
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = a3;
  }

}

void __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_31(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v11 = v5;
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v7) == -1)
    {

      v5 = v11;
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v11, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:", v9);

      v5 = v11;
      if (v10 == -1)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    }
  }

}

- (STUsageReport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUsageReport;
  return -[STUsageReport init](&v3, sel_init);
}

- (STUsageReport)initWithCoder:(id)a3
{
  id v4;
  STUsageReport *v5;
  uint64_t v6;
  NSString *displayName;
  void *v8;
  uint64_t v9;
  NSDateInterval *reportDateInterval;
  uint64_t v11;
  NSDate *lastUpdatedDate;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *dateIntervals;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *screenTimeByStartOfDateInterval;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSDictionary *pickupsByTrustIdentifier;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSDictionary *pickupsByStartOfDateInterval;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSDictionary *pickupsByStartOfDateIntervalByTrustIdentifier;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSDictionary *notificationsByTrustIdentifier;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSDictionary *notificationsByStartOfDateInterval;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSDictionary *notificationsByStartOfDateIntervalByTrustIdentifier;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSArray *notifications;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  NSDictionary *applicationUsageByTrustIdentifier;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  NSDictionary *appUsageByStartOfDateInterval;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  NSDictionary *applicationUsageByStartOfDateIntervalByTrustIdentifier;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  NSArray *appUsages;
  void *v113;
  double v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSDictionary *webUsageByTrustIdentifier;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  NSDictionary *webUsageByStartOfDateInterval;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  NSDictionary *webUsageByStartOfDateIntervalByTrustIdentifier;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  NSArray *appAndWebUsages;
  void *v139;
  double v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  NSDictionary *categoryUsageByTrustIdentifier;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSDictionary *categoryUsageByStartOfDateInterval;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  NSDictionary *categoryUsageByStartOfDateIntervalByTrustIdentifier;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  NSArray *categoryUsages;
  objc_super v167;

  v4 = a3;
  v167.receiver = self;
  v167.super_class = (Class)STUsageReport;
  v5 = -[STUsageReport init](&v167, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_reportDateInterval"));
    v9 = objc_claimAutoreleasedReturnValue();
    reportDateInterval = v5->_reportDateInterval;
    v5->_reportDateInterval = (NSDateInterval *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastUpdatedDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_dateIntervals"));
    v16 = objc_claimAutoreleasedReturnValue();
    dateIntervals = v5->_dateIntervals;
    v5->_dateIntervals = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalScreenTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_totalScreenTime = v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxScreenTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v5->_maxScreenTime = v21;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("_screenTimeByStartOfDateInterval"));
    v26 = objc_claimAutoreleasedReturnValue();
    screenTimeByStartOfDateInterval = v5->_screenTimeByStartOfDateInterval;
    v5->_screenTimeByStartOfDateInterval = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_screenTimeDeltaFromHistoricalAverage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v5->_screenTimeDeltaFromHistoricalAverage = v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalPickups"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalPickups = objc_msgSend(v30, "unsignedIntegerValue");

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("_pickupsByTrustIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    pickupsByTrustIdentifier = v5->_pickupsByTrustIdentifier;
    v5->_pickupsByTrustIdentifier = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("_pickupsByStartOfDateInterval"));
    v41 = objc_claimAutoreleasedReturnValue();
    pickupsByStartOfDateInterval = v5->_pickupsByStartOfDateInterval;
    v5->_pickupsByStartOfDateInterval = (NSDictionary *)v41;

    v43 = (void *)MEMORY[0x24BDBCF20];
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("_pickupsByStartOfDateIntervalByTrustIdentifier"));
    v48 = objc_claimAutoreleasedReturnValue();
    pickupsByStartOfDateIntervalByTrustIdentifier = v5->_pickupsByStartOfDateIntervalByTrustIdentifier;
    v5->_pickupsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pickupRate"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v5->_pickupRate = v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activePickupDateIntervals"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v5->_activePickupDateIntervals = v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxPickups"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPickups = objc_msgSend(v54, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxPickupDateIntervalIndex"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPickupDateIntervalIndex = objc_msgSend(v55, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pickupDeltaFromHistoricalAverage"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    v5->_pickupDeltaFromHistoricalAverage = v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalNotifications"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalNotifications = objc_msgSend(v58, "unsignedIntegerValue");

    v59 = (void *)MEMORY[0x24BDBCF20];
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("_notificationsByTrustIdentifier"));
    v63 = objc_claimAutoreleasedReturnValue();
    notificationsByTrustIdentifier = v5->_notificationsByTrustIdentifier;
    v5->_notificationsByTrustIdentifier = (NSDictionary *)v63;

    v65 = (void *)MEMORY[0x24BDBCF20];
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    objc_msgSend(v65, "setWithObjects:", v66, v67, objc_opt_class(), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v68, CFSTR("_notificationsByStartOfDateInterval"));
    v69 = objc_claimAutoreleasedReturnValue();
    notificationsByStartOfDateInterval = v5->_notificationsByStartOfDateInterval;
    v5->_notificationsByStartOfDateInterval = (NSDictionary *)v69;

    v71 = (void *)MEMORY[0x24BDBCF20];
    v72 = objc_opt_class();
    v73 = objc_opt_class();
    v74 = objc_opt_class();
    objc_msgSend(v71, "setWithObjects:", v72, v73, v74, objc_opt_class(), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("_notificationsByStartOfDateIntervalByTrustIdentifier"));
    v76 = objc_claimAutoreleasedReturnValue();
    notificationsByStartOfDateIntervalByTrustIdentifier = v5->_notificationsByStartOfDateIntervalByTrustIdentifier;
    v5->_notificationsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v76;

    v78 = (void *)MEMORY[0x24BDBCF20];
    v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v80, CFSTR("_notifications"));
    v81 = objc_claimAutoreleasedReturnValue();
    notifications = v5->_notifications;
    v5->_notifications = (NSArray *)v81;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notificationRate"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "doubleValue");
    v5->_notificationRate = v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notificationDeltaFromHistoricalAverage"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "doubleValue");
    v5->_notificationDeltaFromHistoricalAverage = v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalAppUsage"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "doubleValue");
    v5->_totalAppUsage = v88;

    v89 = (void *)MEMORY[0x24BDBCF20];
    v90 = objc_opt_class();
    v91 = objc_opt_class();
    objc_msgSend(v89, "setWithObjects:", v90, v91, objc_opt_class(), 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v92, CFSTR("_applicationUsageByTrustIdentifier"));
    v93 = objc_claimAutoreleasedReturnValue();
    applicationUsageByTrustIdentifier = v5->_applicationUsageByTrustIdentifier;
    v5->_applicationUsageByTrustIdentifier = (NSDictionary *)v93;

    v95 = (void *)MEMORY[0x24BDBCF20];
    v96 = objc_opt_class();
    v97 = objc_opt_class();
    objc_msgSend(v95, "setWithObjects:", v96, v97, objc_opt_class(), 0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v98, CFSTR("_appUsageByStartOfDateInterval"));
    v99 = objc_claimAutoreleasedReturnValue();
    appUsageByStartOfDateInterval = v5->_appUsageByStartOfDateInterval;
    v5->_appUsageByStartOfDateInterval = (NSDictionary *)v99;

    v101 = (void *)MEMORY[0x24BDBCF20];
    v102 = objc_opt_class();
    v103 = objc_opt_class();
    v104 = objc_opt_class();
    objc_msgSend(v101, "setWithObjects:", v102, v103, v104, objc_opt_class(), 0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v105, CFSTR("_applicationUsageByStartOfDateIntervalByTrustIdentifier"));
    v106 = objc_claimAutoreleasedReturnValue();
    applicationUsageByStartOfDateIntervalByTrustIdentifier = v5->_applicationUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_applicationUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v106;

    v108 = (void *)MEMORY[0x24BDBCF20];
    v109 = objc_opt_class();
    objc_msgSend(v108, "setWithObjects:", v109, objc_opt_class(), 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v110, CFSTR("_appUsages"));
    v111 = objc_claimAutoreleasedReturnValue();
    appUsages = v5->_appUsages;
    v5->_appUsages = (NSArray *)v111;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalWebUsage"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "doubleValue");
    v5->_totalWebUsage = v114;

    v115 = (void *)MEMORY[0x24BDBCF20];
    v116 = objc_opt_class();
    v117 = objc_opt_class();
    objc_msgSend(v115, "setWithObjects:", v116, v117, objc_opt_class(), 0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v118, CFSTR("_webUsageByTrustIdentifier"));
    v119 = objc_claimAutoreleasedReturnValue();
    webUsageByTrustIdentifier = v5->_webUsageByTrustIdentifier;
    v5->_webUsageByTrustIdentifier = (NSDictionary *)v119;

    v121 = (void *)MEMORY[0x24BDBCF20];
    v122 = objc_opt_class();
    v123 = objc_opt_class();
    objc_msgSend(v121, "setWithObjects:", v122, v123, objc_opt_class(), 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v124, CFSTR("_webUsageByStartOfDateInterval"));
    v125 = objc_claimAutoreleasedReturnValue();
    webUsageByStartOfDateInterval = v5->_webUsageByStartOfDateInterval;
    v5->_webUsageByStartOfDateInterval = (NSDictionary *)v125;

    v127 = (void *)MEMORY[0x24BDBCF20];
    v128 = objc_opt_class();
    v129 = objc_opt_class();
    v130 = objc_opt_class();
    objc_msgSend(v127, "setWithObjects:", v128, v129, v130, objc_opt_class(), 0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v131, CFSTR("_webUsageByStartOfDateIntervalByTrustIdentifier"));
    v132 = objc_claimAutoreleasedReturnValue();
    webUsageByStartOfDateIntervalByTrustIdentifier = v5->_webUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_webUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v132;

    v134 = (void *)MEMORY[0x24BDBCF20];
    v135 = objc_opt_class();
    objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v136, CFSTR("_appAndWebUsages"));
    v137 = objc_claimAutoreleasedReturnValue();
    appAndWebUsages = v5->_appAndWebUsages;
    v5->_appAndWebUsages = (NSArray *)v137;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalCategoryUsage"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "doubleValue");
    v5->_totalCategoryUsage = v140;

    v141 = (void *)MEMORY[0x24BDBCF20];
    v142 = objc_opt_class();
    v143 = objc_opt_class();
    objc_msgSend(v141, "setWithObjects:", v142, v143, objc_opt_class(), 0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v144, CFSTR("_categoryUsageByTrustIdentifier"));
    v145 = objc_claimAutoreleasedReturnValue();
    categoryUsageByTrustIdentifier = v5->_categoryUsageByTrustIdentifier;
    v5->_categoryUsageByTrustIdentifier = (NSDictionary *)v145;

    v147 = (void *)MEMORY[0x24BDBCF20];
    v148 = objc_opt_class();
    v149 = objc_opt_class();
    v150 = objc_opt_class();
    objc_msgSend(v147, "setWithObjects:", v148, v149, v150, objc_opt_class(), 0);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v151, CFSTR("_categoryUsageByStartOfDateInterval"));
    v152 = objc_claimAutoreleasedReturnValue();
    categoryUsageByStartOfDateInterval = v5->_categoryUsageByStartOfDateInterval;
    v5->_categoryUsageByStartOfDateInterval = (NSDictionary *)v152;

    v154 = (void *)MEMORY[0x24BDBCF20];
    v155 = objc_opt_class();
    v156 = objc_opt_class();
    v157 = objc_opt_class();
    objc_msgSend(v154, "setWithObjects:", v155, v156, v157, objc_opt_class(), 0);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v158, CFSTR("_categoryUsageByStartOfDateIntervalByTrustIdentifier"));
    v159 = objc_claimAutoreleasedReturnValue();
    categoryUsageByStartOfDateIntervalByTrustIdentifier = v5->_categoryUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_categoryUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v159;

    v161 = (void *)MEMORY[0x24BDBCF20];
    v162 = objc_opt_class();
    objc_msgSend(v161, "setWithObjects:", v162, objc_opt_class(), 0);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v163, CFSTR("_categoryUsages"));
    v164 = objc_claimAutoreleasedReturnValue();
    categoryUsages = v5->_categoryUsages;
    v5->_categoryUsages = (NSArray *)v164;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  displayName = self->_displayName;
  v21 = a3;
  objc_msgSend(v21, "encodeObject:forKey:", displayName, CFSTR("_displayName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("_type"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_reportDateInterval, CFSTR("_reportDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("_lastUpdatedDate"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_dateIntervals, CFSTR("_dateIntervals"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalScreenTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("_totalScreenTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxScreenTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("_maxScreenTime"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_screenTimeByStartOfDateInterval, CFSTR("_screenTimeByStartOfDateInterval"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_screenTimeDeltaFromHistoricalAverage);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("_screenTimeDeltaFromHistoricalAverage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalPickups);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("_totalPickups"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_pickupsByTrustIdentifier, CFSTR("_pickupsByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_pickupsByStartOfDateInterval, CFSTR("_pickupsByStartOfDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_pickupsByStartOfDateIntervalByTrustIdentifier, CFSTR("_pickupsByStartOfDateIntervalByTrustIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pickupRate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("_pickupRate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_activePickupDateIntervals);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("_activePickupDateIntervals"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxPickups);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("_maxPickups"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxPickupDateIntervalIndex);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("_maxPickupDateIntervalIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pickupDeltaFromHistoricalAverage);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("_pickupDeltaFromHistoricalAverage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalNotifications);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("_totalNotifications"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_notificationsByTrustIdentifier, CFSTR("_notificationsByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_notificationsByStartOfDateInterval, CFSTR("_notificationsByStartOfDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_notificationsByStartOfDateIntervalByTrustIdentifier, CFSTR("_notificationsByStartOfDateIntervalByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_notifications, CFSTR("_notifications"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_notificationRate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("_notificationRate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_notificationDeltaFromHistoricalAverage);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("_notificationDeltaFromHistoricalAverage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalAppUsage);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("_totalAppUsage"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_applicationUsageByTrustIdentifier, CFSTR("_applicationUsageByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_appUsageByStartOfDateInterval, CFSTR("_appUsageByStartOfDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_applicationUsageByStartOfDateIntervalByTrustIdentifier, CFSTR("_applicationUsageByStartOfDateIntervalByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_appUsages, CFSTR("_appUsages"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalWebUsage);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("_totalWebUsage"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_webUsageByTrustIdentifier, CFSTR("_webUsageByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_webUsageByStartOfDateInterval, CFSTR("_webUsageByStartOfDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_webUsageByStartOfDateIntervalByTrustIdentifier, CFSTR("_webUsageByStartOfDateIntervalByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_appAndWebUsages, CFSTR("_appAndWebUsages"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalCategoryUsage);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("_totalCategoryUsage"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_categoryUsageByTrustIdentifier, CFSTR("_categoryUsageByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_categoryUsageByStartOfDateInterval, CFSTR("_categoryUsageByStartOfDateInterval"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_categoryUsageByStartOfDateIntervalByTrustIdentifier, CFSTR("_categoryUsageByStartOfDateIntervalByTrustIdentifier"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_categoryUsages, CFSTR("_categoryUsages"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("displayName");
  v6[1] = CFSTR("type");
  v6[2] = CFSTR("reportDateInterval");
  v6[3] = CFSTR("lastUpdatedDate");
  v6[4] = CFSTR("screenTimeDeltaFromHistoricalAverage");
  v6[5] = CFSTR("totalNotifications");
  v6[6] = CFSTR("totalPickups");
  v6[7] = CFSTR("maxPickups");
  v6[8] = CFSTR("maxPickupsDateInterval");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  STUIObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDateInterval)maxPickupsDateInterval
{
  NSDateInterval *maxPickupsDateInterval;
  unint64_t v4;
  NSDateInterval *v5;
  unint64_t v6;
  void *v7;
  NSDateInterval *v8;
  NSDateInterval *v9;

  maxPickupsDateInterval = self->_maxPickupsDateInterval;
  if (maxPickupsDateInterval)
    goto LABEL_5;
  v4 = -[STUsageReport maxPickupDateIntervalIndex](self, "maxPickupDateIntervalIndex");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    -[STUsageReport dateIntervals](self, "dateIntervals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
    v9 = self->_maxPickupsDateInterval;
    self->_maxPickupsDateInterval = v8;

    maxPickupsDateInterval = self->_maxPickupsDateInterval;
LABEL_5:
    v5 = maxPickupsDateInterval;
    return v5;
  }
  v5 = 0;
  return v5;
}

- (id)topUsageItemsWithMaxCount:(unint64_t)a3 type:(unint64_t)a4 includeAggregateItem:(BOOL)a5 nonAggregateItems:(id *)a6 darkColors:(BOOL)a7
{
  _BOOL4 v9;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v18;
  _BOOL4 v19;
  unint64_t v20;
  _BOOL8 v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  uint64_t v39;

  if (a3)
  {
    v9 = a5;
    v12 = a4 - 1;
    v13 = (void *)MEMORY[0x24BDBD1A8];
    switch(a4)
    {
      case 1uLL:
      case 5uLL:
      case 6uLL:
        return v13;
      case 2uLL:
        -[STUsageReport appUsages](self, "appUsages");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 3uLL:
        -[STUsageReport categoryUsages](self, "categoryUsages");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 4uLL:
        -[STUsageReport webUsages](self, "webUsages");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v15 = (void *)v14;
        break;
      default:
        v15 = 0;
        break;
    }
    v16 = objc_msgSend(v15, "count");
    v18 = v16 >= a3 || v16 == 0;
    v19 = v9 && v18;
    if (v16 >= a3)
      v20 = a3;
    else
      v20 = v16;
    if (v20)
      v21 = v19;
    else
      v21 = 0;
    v22 = v20 - v21;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    objc_msgSend(v15, "subarrayWithRange:", 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v23);

    +[STUsageColors orderedUsageColors](STUsageColors, "orderedUsageColors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __98__STUsageReport_topUsageItemsWithMaxCount_type_includeAggregateItem_nonAggregateItems_darkColors___block_invoke;
    v37[3] = &unk_24DB88708;
    v26 = v24;
    v38 = v26;
    v39 = v25;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v37);
    if (a6)
      *a6 = (id)objc_msgSend(v13, "copy");
    if (v19)
    {
      v27 = (void *)objc_opt_new();
      if (a7)
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setColor:", v28);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@sum.%@"), CFSTR("totalUsage"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKeyPath:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      switch(v12)
      {
        case 0uLL:
          v31 = (void *)MEMORY[0x24BDD16E0];
          -[STUsageReport totalScreenTime](self, "totalScreenTime");
          goto LABEL_35;
        case 1uLL:
          v31 = (void *)MEMORY[0x24BDD16E0];
          -[STUsageReport totalAppUsage](self, "totalAppUsage");
          goto LABEL_35;
        case 2uLL:
          v31 = (void *)MEMORY[0x24BDD16E0];
          -[STUsageReport totalCategoryUsage](self, "totalCategoryUsage");
          goto LABEL_35;
        case 3uLL:
          v31 = (void *)MEMORY[0x24BDD16E0];
          -[STUsageReport totalWebUsage](self, "totalWebUsage");
LABEL_35:
          v33 = v32;
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(v31, "numberWithDouble:", v33 - v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTotalUsage:", v35);

          break;
        default:
          break;
      }
      objc_msgSend(v13, "addObject:", v27);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v13;
}

void __98__STUsageReport_topUsageItemsWithMaxCount_type_includeAggregateItem_nonAggregateItems_darkColors___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v3;
  unint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3 % *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v6);

}

- (STUsageReportGraphDataSet)screenTimeDataSet
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  STUsageReportGraphSegment *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  STUsageReportGraphSegment *v33;
  STUsageReportGraphDataPoint *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  STUsageReportGraphDataSet *v39;
  void *v40;
  void *v41;
  void *v42;
  STUsageReportGraphDataSet *v43;
  STUsageReport *v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  STUsageReportGraphSegment *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = -[STUsageReport type](self, "type");
  -[STUsageReport maxScreenTime](self, "maxScreenTime");
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumRangeOfUnit:", 128);
  v8 = (double)v7;
  objc_msgSend(v6, "maximumRangeOfUnit:", 64);
  v10 = v8 * (double)v9;
  v11 = v10 * (double)2uLL;
  if (!v3 || (v12 = 0.0, v3 == 1) && (v12 = v10, v10 < v5))
  {
    v13 = v11 * ceil(v5 / v11);
    if (v13 >= v11)
      v12 = v13;
    else
      v12 = v11;
  }

  v14 = 2 * (v3 == 0);
  if (v3 == 1)
    v14 = 1;
  v48 = v14;
  -[STUsageReport screenTimeByStartOfDateInterval](self, "screenTimeByStartOfDateInterval");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  -[STUsageReport dateIntervals](self, "dateIntervals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v17)
  {
    v18 = v17;
    v19 = (void *)MEMORY[0x24BDBD1A8];
    v20 = *(_QWORD *)v51;
    do
    {
      v21 = 0;
      v46 = v18;
      do
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v21);
        objc_msgSend(v22, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;
        v27 = v19;
        if (v25 > 0.0)
        {
          v28 = [STUsageReportGraphSegment alloc];
          objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v20;
          v31 = v16;
          v32 = v19;
          v33 = -[STUsageReportGraphSegment initWithAmount:amountAsPercentageOfDataPointTotal:color:](v28, "initWithAmount:amountAsPercentageOfDataPointTotal:color:", v24, v29, 1.0);

          v54 = v33;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v32;
          v16 = v31;
          v20 = v30;
          v18 = v46;
        }
        v34 = -[STUsageReportGraphDataPoint initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:]([STUsageReportGraphDataPoint alloc], "initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:", v48, 1, v22, v24, v27, 0.0);
        -[STUsageReportGraphDataPoint setTotalAsPercentageOfMax:](v34, "setTotalAsPercentageOfMax:", v26 / v12);
        objc_msgSend(v16, "addObject:", v34);

        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v18);
  }

  -[STUsageReport totalScreenTime](v45, "totalScreenTime");
  v36 = v35;
  -[STUsageReport activePickupDateIntervals](v45, "activePickupDateIntervals");
  if (v37 <= 0.0)
    v38 = 0.0;
  else
    v38 = v36 / v37;
  v39 = [STUsageReportGraphDataSet alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[STUsageReportGraphDataSet initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:](v39, "initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:", v48, 1, v40, v41, v42, v16, v38 / v12);

  return v43;
}

- (STUsageReportGraphDataSet)notificationsDataSet
{
  return (STUsageReportGraphDataSet *)-[STUsageReport _dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:](self, "_dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:", 5, 0, 1, 0);
}

- (STUsageReportGraphDataSet)pickupsDataSet
{
  return (STUsageReportGraphDataSet *)-[STUsageReport _dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:](self, "_dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:", 6, 0, -[STUsageReport type](self, "type") == 1, 0);
}

- (id)appAndWebUsageDataSetWithDarkColors:(BOOL)a3
{
  return -[STUsageReport _dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:](self, "_dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:", 2, 0, 1, a3);
}

- (STUsageReportGraphDataSet)categoryUsageDataSet
{
  return (STUsageReportGraphDataSet *)-[STUsageReport _dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:](self, "_dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:", 3, 0, 1, 0);
}

- (id)dataSetWithUsageItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "itemType");
  objc_msgSend(v4, "trustIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageReport _dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:](self, "_dataSetForItemType:trustIdentifier:includeIndicatorImageName:useDarkColors:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5 useDarkColors:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v6 = a6;
  v7 = a5;
  v11 = a4;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReport.m"), 804, CFSTR("Cannot generate data set for just screen time, you need to specify app or category"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%@"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReport dataSetByUsageIdentifier](self, "dataSetByUsageIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (a3 - 2 < 3)
    {
      if (v11)
        -[STUsageReport _timedDataSetForItemType:trustIdentifier:](self, "_timedDataSetForItemType:trustIdentifier:", a3, v11);
      else
        -[STUsageReport _timedDataSetForItemType:useDarkColors:](self, "_timedDataSetForItemType:useDarkColors:", a3, v6);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 - 5 >= 2)
      {
        if (a3 != 1)
        {
          v15 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReport.m"), 815, CFSTR("Cannot generate data set for %ld"), 1);
        v15 = 0;
        goto LABEL_16;
      }
      -[STUsageReport _countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:](self, "_countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:", a3, v11, v7);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (id)v16;
    if (!v16)
      goto LABEL_17;
    -[STUsageReport dataSetByUsageIdentifier](self, "dataSetByUsageIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v15, v12);
LABEL_16:

    goto LABEL_17;
  }
  v15 = v14;
LABEL_17:

  return v15;
}

- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  STUsageReportGraphSegment *v32;
  STUsageReportGraphDataPoint *v33;
  void *v34;
  STUsageReportGraphDataPoint *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  unint64_t v44;
  char v45;
  int v46;
  double v47;
  double v48;
  double v49;
  STUsageReportGraphDataSet *v50;
  void *v51;
  void *v52;
  void *v53;
  STUsageReportGraphDataSet *v54;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  STUsageReport *v63;
  id v64;
  int v65;
  char v66;
  id obj;
  __CFString *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  STUsageReportGraphSegment *v83;
  _BYTE v84[128];
  uint64_t v85;

  v5 = a5;
  v85 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (a3 - 1 < 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReport.m"), 877, CFSTR("Cannot generate counted data set for %ld"), a3);

LABEL_3:
    v70 = 0;
    v71 = 0;
    v11 = 0;
    v68 = 0;
    v12 = 0;
    goto LABEL_4;
  }
  if (a3 == 6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[STUsageReport pickupsByTrustIdentifier](self, "pickupsByTrustIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", v9);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "totalUsage");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v58, "unsignedIntegerValue");

    }
    else
    {
      v12 = -[STUsageReport totalPickups](self, "totalPickups");
    }
    v59 = CFSTR("PickupArrowSmall");
    if (!v5)
      v59 = 0;
    v68 = v59;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[STUsageReport pickupsByStartOfDateIntervalByTrustIdentifier](self, "pickupsByStartOfDateIntervalByTrustIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", v9);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[STUsageReport pickupsByStartOfDateInterval](self, "pickupsByStartOfDateInterval");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3 != 5)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[STUsageReport notificationsByTrustIdentifier](self, "notificationsByTrustIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "totalUsage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v17, "unsignedIntegerValue");

      -[STUsageReport notificationsByStartOfDateIntervalByTrustIdentifier](self, "notificationsByStartOfDateIntervalByTrustIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v9);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = -[STUsageReport totalNotifications](self, "totalNotifications");
      -[STUsageReport notificationsByStartOfDateInterval](self, "notificationsByStartOfDateInterval");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    v68 = 0;
  }
LABEL_4:
  v13 = -[STUsageReport type](self, "type");
  if (v13)
  {
    if (v13 != 1)
    {
      v66 = 0;
      v69 = 0;
      v65 = 1;
      goto LABEL_14;
    }
    v65 = 0;
    v66 = 1;
    v14 = 1;
  }
  else
  {
    v66 = 0;
    v65 = 1;
    v14 = 2;
  }
  v69 = v14;
LABEL_14:
  -[STUsageReport dateIntervals](self, "dateIntervals");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  v72 = a3;
  obj = v20;
  if (!v21)
  {
    v40 = 10;
    v36 = v20;
    goto LABEL_47;
  }
  v22 = v21;
  v61 = v11;
  v62 = v12;
  v63 = self;
  v64 = v9;
  v23 = 0;
  v24 = *(_QWORD *)v79;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v79 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
      objc_msgSend(v26, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "totalUsage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 <= v30)
        v23 = v30;
      v32 = -[STUsageReportGraphSegment initWithAmount:amountAsPercentageOfDataPointTotal:color:]([STUsageReportGraphSegment alloc], "initWithAmount:amountAsPercentageOfDataPointTotal:color:", v31, v71, 1.0);
      v33 = [STUsageReportGraphDataPoint alloc];
      v83 = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[STUsageReportGraphDataPoint initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:](v33, "initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:", v69, v72, v26, v31, v34, 0.0);

      objc_msgSend(v73, "addObject:", v35);
    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  }
  while (v22);

  if (!v23)
  {
    v40 = 10;
    self = v63;
    v9 = v64;
    v11 = v61;
    v12 = v62;
    goto LABEL_48;
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v36 = v73;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  self = v63;
  v11 = v61;
  if (!v37)
  {
    v40 = 10 * (v23 / 0xA) + 10;
    goto LABEL_46;
  }
  v38 = v37;
  v39 = *(_QWORD *)v75;
  v40 = 10 * (v23 / 0xA) + 10;
  do
  {
    for (j = 0; j != v38; ++j)
    {
      if (*(_QWORD *)v75 != v39)
        objc_enumerationMutation(v36);
      v42 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
      objc_msgSend(v42, "total");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "unsignedIntegerValue");

      objc_msgSend(v42, "setTotalAsPercentageOfMax:", (double)v44 / (double)v40);
      if (!v68)
        goto LABEL_39;
      if (v44)
        v45 = v66;
      else
        v45 = 0;
      if (v44 == v40)
        v46 = v65;
      else
        v46 = 0;
      if ((v45 & 1) != 0 || v46)
      {
        objc_msgSend(v42, "setIndicatorImageName:", v68);

        objc_msgSend(v42, "setIndicatorImageColor:", v11);
        v11 = 0;
LABEL_39:
        v68 = 0;
        continue;
      }
    }
    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  }
  while (v38);
LABEL_46:
  v9 = v64;
  v12 = v62;
LABEL_47:

LABEL_48:
  -[STUsageReport activePickupDateIntervals](self, "activePickupDateIntervals");
  v48 = 0.0;
  v49 = 0.0;
  if (v47 > 0.0)
    v49 = (double)v12 / v47;
  if (v40)
    v48 = v49 / (double)v40;
  v50 = [STUsageReportGraphDataSet alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[STUsageReportGraphDataSet initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:](v50, "initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:", v69, v72, v51, v52, v53, v73, v48);

  return v54;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4
{
  STUsageReport *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  double v45;
  void *v46;
  id v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  STUsageReportGraphSegment *v53;
  double v54;
  STUsageReportGraphDataPoint *v55;
  void *v56;
  STUsageReportGraphDataPoint *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  STUsageReportGraphDataSet *v63;
  void *v64;
  void *v65;
  void *v66;
  STUsageReportGraphDataSet *v67;
  _BOOL4 v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t *v86;
  uint64_t *v87;
  unint64_t v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  id v94;
  uint64_t *v95;
  uint64_t v96;
  double *v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[5];

  v69 = a4;
  v4 = self;
  v73 = 0;
  v112[2] = *MEMORY[0x24BDAC8D0];
  if (a3 > 6)
  {
    v77 = 0;
  }
  else
  {
    if (((1 << a3) & 0x62) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = self;
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReport.m"), 958, CFSTR("Cannot generate timed data set for %ld"), a3);

      v73 = 0;
      v77 = 0;
      goto LABEL_33;
    }
    if (((1 << a3) & 0x14) != 0)
    {
      v111[0] = &unk_24DBBEDF0;
      -[STUsageReport appUsageByStartOfDateInterval](self, "appUsageByStartOfDateInterval");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        v6 = (void *)objc_opt_new();
      v111[1] = &unk_24DBBEE08;
      v112[0] = v6;
      -[STUsageReport webUsageByStartOfDateInterval](self, "webUsageByStartOfDateInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
        v8 = (void *)objc_opt_new();
      v112[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)

      if (!v5)
      v109[0] = &unk_24DBBEDF0;
      -[STUsageReport applicationUsageByStartOfDateIntervalByTrustIdentifier](self, "applicationUsageByStartOfDateIntervalByTrustIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        v10 = (void *)objc_opt_new();
      v109[1] = &unk_24DBBEE08;
      v110[0] = v10;
      -[STUsageReport webUsageByStartOfDateIntervalByTrustIdentifier](self, "webUsageByStartOfDateIntervalByTrustIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
        v12 = (void *)objc_opt_new();
      v110[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)

      if (!v9)
    }
    else
    {
      v77 = 0;
      if (a3 != 3)
        goto LABEL_33;
      v107 = &unk_24DBBEE20;
      -[STUsageReport categoryUsageByStartOfDateInterval](self, "categoryUsageByStartOfDateInterval");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
        v16 = (void *)objc_opt_new();
      v108 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)

      v105 = &unk_24DBBEE20;
      -[STUsageReport categoryUsageByStartOfDateIntervalByTrustIdentifier](self, "categoryUsageByStartOfDateIntervalByTrustIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
        v18 = (void *)objc_opt_new();
      v106 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)

    }
    v4 = self;
  }
LABEL_33:
  v19 = -[STUsageReport type](v4, "type");
  v20 = 2 * (v19 == 0);
  if (v19 == 1)
    v20 = 1;
  v76 = v20;
  +[STUsageColors orderedUsageColors](STUsageColors, "orderedUsageColors");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReport topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:](self, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, a3, 0, 0, v69);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v71, "count");
  v22 = objc_msgSend(v72, "count");
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  if (v23 <= 1)
    v23 = 1;
  v70 = v23;
  -[STUsageReport dateIntervals](self, "dateIntervals");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  -[STUsageReport maxScreenTime](self, "maxScreenTime");
  v26 = v25;
  v27 = -[STUsageReport type](self, "type");
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "maximumRangeOfUnit:", 128);
  v30 = v29;
  objc_msgSend(v28, "maximumRangeOfUnit:", 64);
  v32 = (double)v30 * (double)v31;
  v33 = v32 * (double)2uLL;
  if (!v27 || (v34 = 0.0, v27 == 1) && (v34 = (double)v30 * (double)v31, v32 < v26))
  {
    v35 = v33 * ceil(v26 / v33);
    if (v35 >= v33)
      v34 = v35;
    else
      v34 = v33;
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v24;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
  if (v36)
  {
    v75 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v101 != v75)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(v38, "startDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageReport screenTimeByStartOfDateInterval](self, "screenTimeByStartOfDateInterval");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        v43 = v42;

        v96 = 0;
        v97 = (double *)&v96;
        v98 = 0x2020000000;
        v99 = 0;
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke;
        v93[3] = &unk_24DB88730;
        v95 = &v96;
        v44 = v39;
        v94 = v44;
        objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", v93);
        v45 = v97[3];
        if (v45 < v43)
          v45 = v43;
        v97[3] = v45;
        v46 = (void *)objc_opt_new();
        if (v97[3] > 0.0)
        {
          v89 = 0;
          v90 = (double *)&v89;
          v91 = 0x2020000000;
          v92 = 0;
          v81[0] = MEMORY[0x24BDAC760];
          v81[1] = 3221225472;
          v81[2] = __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke_2;
          v81[3] = &unk_24DB88758;
          v82 = v73;
          v83 = v44;
          v84 = v72;
          v86 = &v89;
          v87 = &v96;
          v88 = v70;
          v47 = v46;
          v85 = v47;
          objc_msgSend(v71, "enumerateObjectsUsingBlock:", v81);
          v48 = v90[3];
          v49 = v97[3];
          if (v48 < v49)
          {
            v50 = v49 - v48;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49 - v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
              objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
            else
              objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = -[STUsageReportGraphSegment initWithAmount:amountAsPercentageOfDataPointTotal:color:]([STUsageReportGraphSegment alloc], "initWithAmount:amountAsPercentageOfDataPointTotal:color:", v51, v52, v50 / v97[3]);
            objc_msgSend(v47, "addObject:", v53);

          }
          _Block_object_dispose(&v89, 8);
        }
        if (v34 <= 0.0)
          v54 = 0.0;
        else
          v54 = v43 / v34;
        v55 = [STUsageReportGraphDataPoint alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[STUsageReportGraphDataPoint initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:](v55, "initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:", v76, a3, v38, v56, v46, v54);

        objc_msgSend(v78, "addObject:", v57);
        _Block_object_dispose(&v96, 8);

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
    }
    while (v36);
  }

  -[STUsageReport totalScreenTime](self, "totalScreenTime");
  v59 = v58;
  -[STUsageReport activePickupDateIntervals](self, "activePickupDateIntervals");
  if (v60 <= 0.0)
    v61 = 0.0;
  else
    v61 = v59 / v60;
  if (v34 <= 0.0)
    v62 = 0.0;
  else
    v62 = v61 / v34;
  v63 = [STUsageReportGraphDataSet alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v59);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[STUsageReportGraphDataSet initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:](v63, "initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:", v76, a3, v64, v65, v66, v78, v62);

  return v67;
}

void __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

void __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  STUsageReportGraphSegment *v19;
  id v20;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a2;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "itemType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trustIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "totalUsage");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "doubleValue");
  if (v13 > 0.0)
  {
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 % *(_QWORD *)(a1 + 80));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v19 = -[STUsageReportGraphSegment initWithAmount:amountAsPercentageOfDataPointTotal:color:]([STUsageReportGraphSegment alloc], "initWithAmount:amountAsPercentageOfDataPointTotal:color:", v20, v18, v14 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);

  }
}

- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  STUsageReportGraphSegment *v28;
  STUsageReportGraphDataPoint *v29;
  unint64_t v30;
  id v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  STUsageReportGraphDataSet *v63;
  void *v64;
  void *v65;
  void *v66;
  STUsageReportGraphDataSet *v67;
  STUsageReport *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  unint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v73 = a4;
  v75 = a3;
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReport.m"), 1071, CFSTR("Cannot generate timed data set for %ld"), a3);

      goto LABEL_3;
    case 2uLL:
      -[STUsageReport applicationUsageByTrustIdentifier](self, "applicationUsageByTrustIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageReport applicationUsageByStartOfDateIntervalByTrustIdentifier](self, "applicationUsageByStartOfDateIntervalByTrustIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[STUsageReport categoryUsageByTrustIdentifier](self, "categoryUsageByTrustIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageReport categoryUsageByStartOfDateIntervalByTrustIdentifier](self, "categoryUsageByStartOfDateIntervalByTrustIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[STUsageReport webUsageByTrustIdentifier](self, "webUsageByTrustIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageReport webUsageByStartOfDateIntervalByTrustIdentifier](self, "webUsageByStartOfDateIntervalByTrustIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v72 = (void *)v9;
      break;
    default:
LABEL_3:
      v72 = 0;
      v8 = 0;
      break;
  }
  v10 = -[STUsageReport type](self, "type");
  v11 = 2 * (v10 == 0);
  if (v10 == 1)
    v11 = 1;
  v71 = v11;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReport dateIntervals](self, "dateIntervals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  if (v14)
  {
    v15 = v14;
    v69 = self;
    v16 = *(_QWORD *)v81;
    v17 = 0.0;
    do
    {
      v18 = v13;
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v81 != v16)
          objc_enumerationMutation(v18);
        v20 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v20, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", v73);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "totalUsage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "doubleValue");
        v26 = v25;
        if (v17 < v25)
          v17 = v25;
        v27 = (void *)objc_opt_new();
        if (v26 > 0.0)
        {
          v28 = -[STUsageReportGraphSegment initWithAmount:amountAsPercentageOfDataPointTotal:color:]([STUsageReportGraphSegment alloc], "initWithAmount:amountAsPercentageOfDataPointTotal:color:", v24, v70, 1.0);
          objc_msgSend(v27, "addObject:", v28);

        }
        v29 = -[STUsageReportGraphDataPoint initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:]([STUsageReportGraphDataPoint alloc], "initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:", v71, v75, v20, v24, v27, 0.0);
        objc_msgSend(v74, "addObject:", v29);

      }
      v13 = v18;
      v15 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    }
    while (v15);

    if (v17 != 0.0)
    {
      self = v69;
      v39 = -[STUsageReport type](v69, "type");
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "maximumRangeOfUnit:", 128);
      v42 = (double)v41;
      objc_msgSend(v40, "maximumRangeOfUnit:", 64);
      v44 = v42 * (double)v43;
      v45 = v44 * (double)2uLL;
      if (v39)
      {
        v37 = 0.0;
        if (v39 == 1)
        {
          v37 = v44;
          if (v44 < v17)
          {
            v46 = v45 * ceil(v17 / v45);
            if (v46 >= v45)
              v37 = v46;
            else
              v37 = v45;
          }
        }
      }
      else
      {
        v47 = v45 * ceil(v17 / v45);
        if (v47 >= v45)
          v37 = v47;
        else
          v37 = v45;
      }

      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v31 = v74;
      v48 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v77 != v50)
              objc_enumerationMutation(v31);
            v52 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
            objc_msgSend(v52, "total");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "doubleValue");
            v55 = v54;

            objc_msgSend(v52, "setTotalAsPercentageOfMax:", v55 / v37);
          }
          v49 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        }
        while (v49);
      }
      goto LABEL_47;
    }
    self = v69;
  }
  else
  {

    v17 = 0.0;
  }
  v30 = -[STUsageReport type](self, "type");
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "maximumRangeOfUnit:", 128);
  v33 = (double)v32;
  objc_msgSend(v31, "maximumRangeOfUnit:", 64);
  v35 = v33 * (double)v34;
  v36 = v35 * (double)2uLL;
  if (!v30)
    goto LABEL_27;
  v37 = 0.0;
  if (v30 == 1)
  {
    if (v35 < v17)
    {
LABEL_27:
      v38 = v36 * ceil(v17 / v36);
      if (v38 >= v36)
        v37 = v38;
      else
        v37 = v36;
      goto LABEL_47;
    }
    v37 = v35;
  }
LABEL_47:

  objc_msgSend(v8, "objectForKeyedSubscript:", v73);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "totalUsage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "doubleValue");
  v59 = v58;

  -[STUsageReport activePickupDateIntervals](self, "activePickupDateIntervals");
  if (v60 <= 0.0)
    v61 = 0.0;
  else
    v61 = v59 / v60;
  if (v37 <= 0.0)
    v62 = 0.0;
  else
    v62 = v61 / v37;
  v63 = [STUsageReportGraphDataSet alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v59);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v37);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[STUsageReportGraphDataSet initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:](v63, "initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:", v71, v75, v64, v65, v66, v74, v62);

  return v67;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDateInterval)reportDateInterval
{
  return self->_reportDateInterval;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSArray)dateIntervals
{
  return self->_dateIntervals;
}

- (double)totalScreenTime
{
  return self->_totalScreenTime;
}

- (double)screenTimeDeltaFromHistoricalAverage
{
  return self->_screenTimeDeltaFromHistoricalAverage;
}

- (unint64_t)totalPickups
{
  return self->_totalPickups;
}

- (NSDictionary)pickupsByTrustIdentifier
{
  return self->_pickupsByTrustIdentifier;
}

- (NSArray)pickups
{
  return self->_pickups;
}

- (double)pickupRate
{
  return self->_pickupRate;
}

- (double)activePickupDateIntervals
{
  return self->_activePickupDateIntervals;
}

- (unint64_t)maxPickups
{
  return self->_maxPickups;
}

- (unint64_t)maxPickupDateIntervalIndex
{
  return self->_maxPickupDateIntervalIndex;
}

- (NSDate)firstPickup
{
  return self->_firstPickup;
}

- (double)pickupDeltaFromHistoricalAverage
{
  return self->_pickupDeltaFromHistoricalAverage;
}

- (unint64_t)totalNotifications
{
  return self->_totalNotifications;
}

- (NSDictionary)notificationsByTrustIdentifier
{
  return self->_notificationsByTrustIdentifier;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (double)notificationRate
{
  return self->_notificationRate;
}

- (double)notificationDeltaFromHistoricalAverage
{
  return self->_notificationDeltaFromHistoricalAverage;
}

- (NSDictionary)applicationUsageByTrustIdentifier
{
  return self->_applicationUsageByTrustIdentifier;
}

- (NSDictionary)webUsageByTrustIdentifier
{
  return self->_webUsageByTrustIdentifier;
}

- (NSArray)appAndWebUsages
{
  return self->_appAndWebUsages;
}

- (NSDictionary)categoryUsageByTrustIdentifier
{
  return self->_categoryUsageByTrustIdentifier;
}

- (NSArray)categoryUsages
{
  return self->_categoryUsages;
}

- (double)maxScreenTime
{
  return self->_maxScreenTime;
}

- (NSDictionary)screenTimeByStartOfDateInterval
{
  return self->_screenTimeByStartOfDateInterval;
}

- (NSDictionary)pickupsByStartOfDateInterval
{
  return self->_pickupsByStartOfDateInterval;
}

- (NSDictionary)pickupsByStartOfDateIntervalByTrustIdentifier
{
  return self->_pickupsByStartOfDateIntervalByTrustIdentifier;
}

- (NSDictionary)notificationsByStartOfDateInterval
{
  return self->_notificationsByStartOfDateInterval;
}

- (NSDictionary)notificationsByStartOfDateIntervalByTrustIdentifier
{
  return self->_notificationsByStartOfDateIntervalByTrustIdentifier;
}

- (double)totalAppUsage
{
  return self->_totalAppUsage;
}

- (NSDictionary)appUsageByStartOfDateInterval
{
  return self->_appUsageByStartOfDateInterval;
}

- (NSDictionary)applicationUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_applicationUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSArray)appUsages
{
  return self->_appUsages;
}

- (double)totalWebUsage
{
  return self->_totalWebUsage;
}

- (NSDictionary)webUsageByStartOfDateInterval
{
  return self->_webUsageByStartOfDateInterval;
}

- (NSDictionary)webUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_webUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSArray)webUsages
{
  return self->_webUsages;
}

- (double)totalCategoryUsage
{
  return self->_totalCategoryUsage;
}

- (NSDictionary)categoryUsageByStartOfDateInterval
{
  return self->_categoryUsageByStartOfDateInterval;
}

- (NSDictionary)categoryUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_categoryUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSCache)dataSetByUsageIdentifier
{
  return self->_dataSetByUsageIdentifier;
}

- (void)setDataSetByUsageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dataSetByUsageIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSetByUsageIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_webUsages, 0);
  objc_storeStrong((id *)&self->_webUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_webUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_appUsages, 0);
  objc_storeStrong((id *)&self->_applicationUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_appUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_notificationsByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationsByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_pickupsByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_pickupsByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_screenTimeByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_categoryUsages, 0);
  objc_storeStrong((id *)&self->_categoryUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_appAndWebUsages, 0);
  objc_storeStrong((id *)&self->_webUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_notificationsByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_firstPickup, 0);
  objc_storeStrong((id *)&self->_pickups, 0);
  objc_storeStrong((id *)&self->_pickupsByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_dateIntervals, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_reportDateInterval, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_maxPickupsDateInterval, 0);
}

@end
