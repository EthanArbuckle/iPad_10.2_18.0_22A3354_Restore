@implementation SUManagerEngine

+ (id)_generateStateTable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  const __CFString *v170;
  uint64_t v171;
  const __CFString *v172;
  uint64_t v173;
  const __CFString *v174;
  uint64_t v175;
  const __CFString *v176;
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const __CFString *v186;
  uint64_t v187;
  const __CFString *v188;
  uint64_t v189;
  const __CFString *v190;
  _QWORD v191[6];
  _QWORD v192[6];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  uint64_t v197;
  const __CFString *v198;
  _QWORD v199[2];
  _QWORD v200[2];
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const __CFString *v204;
  uint64_t v205;
  const __CFString *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const __CFString *v210;
  _QWORD v211[9];
  _QWORD v212[9];
  _QWORD v213[2];
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[2];
  _QWORD v218[2];
  _QWORD v219[2];
  _QWORD v220[2];
  _QWORD v221[4];
  _QWORD v222[4];
  _QWORD v223[2];
  _QWORD v224[2];
  _QWORD v225[2];
  _QWORD v226[2];
  uint64_t v227;
  uint64_t v228;
  _QWORD v229[2];
  _QWORD v230[2];
  _QWORD v231[2];
  _QWORD v232[2];
  uint64_t v233;
  const __CFString *v234;
  _QWORD v235[2];
  _QWORD v236[2];
  _QWORD v237[7];
  _QWORD v238[7];
  _QWORD v239[2];
  _QWORD v240[2];
  _QWORD v241[2];
  _QWORD v242[2];
  _QWORD v243[2];
  _QWORD v244[2];
  uint64_t v245;
  const __CFString *v246;
  _QWORD v247[2];
  _QWORD v248[2];
  _QWORD v249[5];
  _QWORD v250[5];
  _QWORD v251[2];
  _QWORD v252[2];
  _QWORD v253[2];
  _QWORD v254[2];
  _QWORD v255[2];
  _QWORD v256[2];
  uint64_t v257;
  const __CFString *v258;
  _QWORD v259[2];
  _QWORD v260[2];
  _QWORD v261[5];
  _QWORD v262[5];
  _QWORD v263[2];
  _QWORD v264[2];
  _QWORD v265[2];
  _QWORD v266[2];
  uint64_t v267;
  const __CFString *v268;
  uint64_t v269;
  const __CFString *v270;
  uint64_t v271;
  const __CFString *v272;
  _QWORD v273[2];
  _QWORD v274[2];
  _QWORD v275[2];
  _QWORD v276[2];
  uint64_t v277;
  const __CFString *v278;
  _QWORD v279[2];
  _QWORD v280[2];
  _QWORD v281[5];
  uint64_t v282;
  const __CFString *v283;
  const __CFString *v284;
  uint64_t v285;
  _QWORD v286[9];
  _QWORD v287[2];
  _QWORD v288[2];
  uint64_t v289;
  const __CFString *v290;
  uint64_t v291;
  const __CFString *v292;
  uint64_t v293;
  const __CFString *v294;
  uint64_t v295;
  const __CFString *v296;
  uint64_t v297;
  uint64_t v298;
  _QWORD v299[2];
  _QWORD v300[2];
  _QWORD v301[2];
  _QWORD v302[2];
  _QWORD v303[2];
  _QWORD v304[2];
  _QWORD v305[2];
  _QWORD v306[2];
  _QWORD v307[2];
  _QWORD v308[2];
  uint64_t v309;
  const __CFString *v310;
  uint64_t v311;
  const __CFString *v312;
  _QWORD v313[2];
  _QWORD v314[2];
  _QWORD v315[2];
  _QWORD v316[2];
  uint64_t v317;
  const __CFString *v318;
  _QWORD v319[2];
  _QWORD v320[2];
  _QWORD v321[17];
  _QWORD v322[17];
  _QWORD v323[2];
  _QWORD v324[2];
  uint64_t v325;
  const __CFString *v326;
  _QWORD v327[2];
  _QWORD v328[2];
  uint64_t v329;
  const __CFString *v330;
  _QWORD v331[2];
  _QWORD v332[2];
  _QWORD v333[5];
  _QWORD v334[5];
  _QWORD v335[2];
  _QWORD v336[2];
  _QWORD v337[2];
  _QWORD v338[2];
  _QWORD v339[2];
  _QWORD v340[2];
  _QWORD v341[2];
  _QWORD v342[2];
  uint64_t v343;
  const __CFString *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const __CFString *v348;
  _QWORD v349[2];
  _QWORD v350[2];
  _QWORD v351[8];
  _QWORD v352[8];
  _QWORD v353[2];
  _QWORD v354[2];
  uint64_t v355;
  const __CFString *v356;
  uint64_t v357;
  const __CFString *v358;
  uint64_t v359;
  const __CFString *v360;
  uint64_t v361;
  const __CFString *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const __CFString *v368;
  uint64_t v369;
  const __CFString *v370;
  _QWORD v371[9];
  _QWORD v372[9];
  _QWORD v373[2];
  _QWORD v374[2];
  uint64_t v375;
  const __CFString *v376;
  uint64_t v377;
  const __CFString *v378;
  uint64_t v379;
  const __CFString *v380;
  uint64_t v381;
  const __CFString *v382;
  uint64_t v383;
  const __CFString *v384;
  uint64_t v385;
  const __CFString *v386;
  uint64_t v387;
  const __CFString *v388;
  uint64_t v389;
  const __CFString *v390;
  _QWORD v391[9];
  _QWORD v392[9];
  _QWORD v393[2];
  _QWORD v394[2];
  uint64_t v395;
  const __CFString *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  const __CFString *v402;
  uint64_t v403;
  const __CFString *v404;
  _QWORD v405[6];
  _QWORD v406[6];
  _QWORD v407[2];
  _QWORD v408[2];
  uint64_t v409;
  const __CFString *v410;
  uint64_t v411;
  const __CFString *v412;
  uint64_t v413;
  const __CFString *v414;
  uint64_t v415;
  const __CFString *v416;
  uint64_t v417;
  const __CFString *v418;
  _QWORD v419[6];
  _QWORD v420[6];
  _QWORD v421[2];
  _QWORD v422[2];
  uint64_t v423;
  const __CFString *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  const __CFString *v428;
  _QWORD v429[2];
  _QWORD v430[2];
  _QWORD v431[5];
  _QWORD v432[5];
  _QWORD v433[2];
  _QWORD v434[2];
  _QWORD v435[2];
  _QWORD v436[2];
  uint64_t v437;
  const __CFString *v438;
  uint64_t v439;
  const __CFString *v440;
  uint64_t v441;
  const __CFString *v442;
  _QWORD v443[2];
  _QWORD v444[2];
  _QWORD v445[6];
  _QWORD v446[6];
  _QWORD v447[2];
  _QWORD v448[2];
  _QWORD v449[2];
  _QWORD v450[2];
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  const __CFString *v454;
  uint64_t v455;
  const __CFString *v456;
  _QWORD v457[5];
  _QWORD v458[5];
  _QWORD v459[18];
  _QWORD v460[20];

  v460[18] = *MEMORY[0x24BDAC8D0];
  v459[0] = *MEMORY[0x24BEAEA20];
  v457[0] = CFSTR("DownloadAndPrepare");
  v455 = *MEMORY[0x24BEAEA90];
  v2 = v455;
  v456 = CFSTR("ReportDownloadFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v456, &v455, 1);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v458[0] = v160;
  v457[1] = CFSTR("InstallUpdate");
  v453 = v2;
  v454 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v454, &v453, 1);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v458[1] = v159;
  v457[2] = CFSTR("RollbackRequested");
  v451 = v2;
  v452 = *MEMORY[0x24BEAE9B0];
  v125 = v452;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v452, &v451, 1);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v458[2] = v158;
  v457[3] = CFSTR("ActivateNoPersisted");
  v449[0] = *MEMORY[0x24BEAEBD8];
  v3 = v449[0];
  v449[1] = v2;
  v450[0] = CFSTR("RemovingAll");
  v450[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v450, v449, 2);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v458[3] = v157;
  v457[4] = CFSTR("ActivateHavePersisted");
  v447[0] = v3;
  v447[1] = v2;
  v448[0] = CFSTR("RemovingExceptPreserved");
  v448[1] = CFSTR("RemovePreserving");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v448, v447, 2);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v458[4] = v156;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v458, v457, 5);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v460[0] = v155;
  v459[1] = CFSTR("RemovingExceptPreserved");
  v445[0] = CFSTR("DownloadAndPrepare");
  v443[0] = v3;
  v443[1] = v2;
  v444[0] = CFSTR("CancelingDownloadRequested");
  v444[1] = CFSTR("NewDownloadPending");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v444, v443, 2);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v446[0] = v154;
  v445[1] = CFSTR("InstallUpdate");
  v441 = v2;
  v442 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v442, &v441, 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v446[1] = v153;
  v445[2] = CFSTR("RemoveUpdate");
  v439 = v3;
  v440 = CFSTR("CancelingRemoveRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v440, &v439, 1);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v446[2] = v152;
  v445[3] = CFSTR("RollbackRequested");
  v437 = v3;
  v438 = CFSTR("CancelingRollbackRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v438, &v437, 1);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v446[3] = v151;
  v445[4] = CFSTR("PreservedInvalid");
  v435[0] = v3;
  v435[1] = v2;
  v436[0] = CFSTR("RemovingAll");
  v436[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v436, v435, 2);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v446[4] = v150;
  v445[5] = CFSTR("PreservedValidated");
  v4 = *MEMORY[0x24BEAEA00];
  v433[0] = v3;
  v433[1] = v2;
  v5 = *MEMORY[0x24BEAE990];
  v434[0] = v4;
  v162 = v4;
  v434[1] = v5;
  v6 = v5;
  v164 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v434, v433, 2);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v446[5] = v149;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v446, v445, 6);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v460[1] = v148;
  v459[2] = CFSTR("RemovingAll");
  v431[0] = CFSTR("DownloadAndPrepare");
  v429[0] = v3;
  v429[1] = v2;
  v430[0] = CFSTR("RemovingAllDownloadRequested");
  v430[1] = CFSTR("NewDownloadPending");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v430, v429, 2);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v432[0] = v147;
  v431[1] = CFSTR("InstallUpdate");
  v427 = v2;
  v428 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v428, &v427, 1);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v432[1] = v146;
  v431[2] = CFSTR("RemoveUpdate");
  v425 = v2;
  v426 = *MEMORY[0x24BEAEBA8];
  v167 = v426;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v426, &v425, 1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v432[2] = v145;
  v431[3] = CFSTR("RollbackRequested");
  v423 = v3;
  v424 = CFSTR("RemovingAllRollbackRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v424, &v423, 1);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v432[3] = v144;
  v431[4] = CFSTR("RemovedAll");
  v166 = *MEMORY[0x24BEAEA10];
  v421[0] = v3;
  v421[1] = v2;
  v422[0] = v166;
  v422[1] = CFSTR("ActivatedClean");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v422, v421, 2);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v432[4] = v143;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v432, v431, 5);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v460[2] = v142;
  v459[3] = CFSTR("RemovingAllDownloadRequested");
  v419[0] = CFSTR("DownloadAndPrepare");
  v417 = v2;
  v418 = CFSTR("NewDownloadPending");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v418, &v417, 1);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v420[0] = v141;
  v419[1] = CFSTR("InstallUpdate");
  v415 = v2;
  v416 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v416, &v415, 1);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v420[1] = v140;
  v419[2] = CFSTR("RemoveUpdate");
  v413 = v3;
  v414 = CFSTR("RemovingAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v414, &v413, 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v420[2] = v139;
  v419[3] = CFSTR("RollbackRequested");
  v411 = v3;
  v412 = CFSTR("RemovingAllRollbackRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v412, &v411, 1);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v420[3] = v138;
  v419[4] = CFSTR("RemovedAll");
  v409 = v2;
  v410 = CFSTR("HandlePendingDownload");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v410, &v409, 1);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v420[4] = v137;
  v419[5] = CFSTR("ReadyToDownload");
  v407[0] = v3;
  v407[1] = v2;
  v408[0] = v4;
  v408[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v408, v407, 2);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v420[5] = v136;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v420, v419, 6);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v460[3] = v135;
  v459[4] = CFSTR("RemovingAllRollbackRequested");
  v405[0] = CFSTR("DownloadAndPrepare");
  v403 = v2;
  v404 = CFSTR("ReportDownloadFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v404, &v403, 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v406[0] = v134;
  v405[1] = CFSTR("InstallUpdate");
  v401 = v2;
  v402 = CFSTR("ReportInstallFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v402, &v401, 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v406[1] = v133;
  v405[2] = CFSTR("RemoveUpdate");
  v399 = v2;
  v400 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v400, &v399, 1);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v406[2] = v132;
  v405[3] = CFSTR("RollbackRequested");
  v397 = v2;
  v398 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v398, &v397, 1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v406[3] = v131;
  v405[4] = CFSTR("RemovedAll");
  v395 = v2;
  v396 = CFSTR("HandleCanceledPendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v396, &v395, 1);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v406[4] = v130;
  v405[5] = CFSTR("ReadyToRollback");
  v393[0] = v3;
  v393[1] = v2;
  v394[0] = CFSTR("RollingBack");
  v394[1] = CFSTR("PerformRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v394, v393, 2);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v406[5] = v129;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v406, v405, 6);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v460[4] = v128;
  v459[5] = CFSTR("CancelingDownloadRequested");
  v391[0] = CFSTR("DownloadAndPrepare");
  v389 = v2;
  v390 = CFSTR("NewDownloadPending");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v390, &v389, 1);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v392[0] = v127;
  v391[1] = CFSTR("InstallUpdate");
  v387 = v2;
  v388 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v388, &v387, 1);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v392[1] = v126;
  v391[2] = CFSTR("RemoveUpdate");
  v385 = v3;
  v386 = CFSTR("CancelingRemoveRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v386, &v385, 1);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v392[2] = v124;
  v391[3] = CFSTR("RollbackRequested");
  v383 = v3;
  v384 = CFSTR("CancelingRollbackRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v384, &v383, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v392[3] = v123;
  v391[4] = CFSTR("UpdateCanceled");
  v381 = v2;
  v382 = CFSTR("CanceledDownloadRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v382, &v381, 1);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v392[4] = v122;
  v391[5] = CFSTR("UpdateFailed");
  v379 = v2;
  v380 = CFSTR("CanceledDownloadRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v380, &v379, 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v392[5] = v121;
  v391[6] = CFSTR("PreservedInvalid");
  v377 = v2;
  v378 = CFSTR("CanceledDownloadRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v378, &v377, 1);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v392[6] = v120;
  v391[7] = CFSTR("PreservedValidated");
  v375 = v2;
  v376 = CFSTR("CanceledDownloadRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v376, &v375, 1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v392[7] = v119;
  v391[8] = CFSTR("ReadyToDownload");
  v373[0] = v3;
  v373[1] = v2;
  v374[0] = CFSTR("RemovingExceptPreserved");
  v374[1] = CFSTR("RemovePreserving");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v374, v373, 2);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v392[8] = v118;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v392, v391, 9);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v460[5] = v117;
  v459[6] = CFSTR("CancelingRollbackRequested");
  v371[0] = CFSTR("DownloadAndPrepare");
  v369 = v2;
  v370 = CFSTR("ReportDownloadFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v370, &v369, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v372[0] = v116;
  v371[1] = CFSTR("InstallUpdate");
  v367 = v2;
  v368 = CFSTR("ReportInstallFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v368, &v367, 1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v372[1] = v115;
  v371[2] = CFSTR("RemoveUpdate");
  v365 = v2;
  v366 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v366, &v365, 1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v372[2] = v114;
  v371[3] = CFSTR("RollbackRequested");
  v363 = v2;
  v364 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v364, &v363, 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v372[3] = v113;
  v371[4] = CFSTR("UpdateCanceled");
  v361 = v2;
  v362 = CFSTR("HandleCanceledPendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v372[4] = v112;
  v371[5] = CFSTR("UpdateFailed");
  v359 = v2;
  v360 = CFSTR("HandleCanceledPendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v372[5] = v111;
  v371[6] = CFSTR("PreservedInvalid");
  v357 = v2;
  v358 = CFSTR("HandleCanceledPendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v358, &v357, 1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v372[6] = v110;
  v371[7] = CFSTR("PreservedValidated");
  v355 = v2;
  v356 = CFSTR("HandleCanceledPendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v372[7] = v109;
  v371[8] = CFSTR("ReadyToRollback");
  v353[0] = v3;
  v353[1] = v2;
  v354[0] = CFSTR("RollingBack");
  v354[1] = CFSTR("PerformRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v354, v353, 2);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v372[8] = v108;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v372, v371, 9);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v460[6] = v107;
  v459[7] = CFSTR("CancelingRemoveRequested");
  v351[0] = CFSTR("DownloadAndPrepare");
  v349[0] = v3;
  v349[1] = v2;
  v350[0] = CFSTR("CancelingDownloadRequested");
  v350[1] = CFSTR("NewDownloadPending");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v350, v349, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v352[0] = v106;
  v351[1] = CFSTR("InstallUpdate");
  v347 = v2;
  v348 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v352[1] = v105;
  v351[2] = CFSTR("RemoveUpdate");
  v345 = v2;
  v346 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v352[2] = v104;
  v351[3] = CFSTR("RollbackRequested");
  v343 = v3;
  v344 = CFSTR("CancelingRollbackRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v344, &v343, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v352[3] = v103;
  v351[4] = CFSTR("UpdateCanceled");
  v341[0] = v3;
  v341[1] = v2;
  v342[0] = CFSTR("RemovingAll");
  v342[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v342, v341, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v352[4] = v102;
  v351[5] = CFSTR("UpdateFailed");
  v339[0] = v3;
  v339[1] = v2;
  v340[0] = CFSTR("RemovingAll");
  v340[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v340, v339, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v352[5] = v101;
  v351[6] = CFSTR("PreservedValidated");
  v337[0] = v3;
  v337[1] = v2;
  v338[0] = CFSTR("RemovingAll");
  v338[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v338, v337, 2);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v352[6] = v100;
  v351[7] = CFSTR("PreservedInvalid");
  v335[0] = v3;
  v335[1] = v2;
  v336[0] = CFSTR("RemovingAll");
  v336[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v336, v335, 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v352[7] = v99;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v352, v351, 8);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v460[7] = v98;
  v459[8] = v166;
  v333[0] = CFSTR("DownloadAndPrepare");
  v331[0] = v3;
  v331[1] = v2;
  v332[0] = v4;
  v332[1] = v164;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v332, v331, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v334[0] = v97;
  v333[1] = CFSTR("InstallUpdate");
  v329 = v2;
  v330 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v334[1] = v96;
  v333[2] = CFSTR("RemoveUpdate");
  v327[0] = v3;
  v327[1] = v2;
  v328[0] = CFSTR("RemovingAll");
  v328[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v328, v327, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v334[2] = v95;
  v333[3] = CFSTR("RollbackRequested");
  v325 = v2;
  v326 = CFSTR("HandlePendingRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v334[3] = v94;
  v333[4] = CFSTR("ReadyToRollback");
  v323[0] = v3;
  v323[1] = v2;
  v324[0] = CFSTR("RollingBack");
  v324[1] = CFSTR("PerformRollback");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v324, v323, 2);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v334[4] = v93;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v334, v333, 5);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v460[8] = v92;
  v459[9] = v4;
  v321[0] = CFSTR("DownloadAndPrepare");
  v319[0] = v3;
  v319[1] = v2;
  v320[0] = CFSTR("CancelingDownloadRequested");
  v320[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v320, v319, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v322[0] = v91;
  v321[1] = CFSTR("InstallUpdate");
  v317 = v2;
  v318 = CFSTR("ArmInstallOrFail");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v322[1] = v90;
  v321[2] = CFSTR("RemoveUpdate");
  v315[0] = v3;
  v315[1] = v2;
  v316[0] = CFSTR("CancelingRemoveRequested");
  v316[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v316, v315, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v322[2] = v89;
  v321[3] = CFSTR("RollbackRequested");
  v313[0] = v3;
  v313[1] = v2;
  v314[0] = CFSTR("CancelingRollbackRequested");
  v314[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v314, v313, 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v322[3] = v88;
  v321[4] = CFSTR("BrainLoading");
  v311 = v2;
  v312 = CFSTR("Activated");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v322[4] = v87;
  v321[5] = *MEMORY[0x24BEAE9E0];
  v309 = v2;
  v310 = CFSTR("BrainLoaded");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v310, &v309, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v322[5] = v86;
  v321[6] = CFSTR("BrainLoaded");
  v307[0] = v3;
  v307[1] = v2;
  v308[0] = CFSTR("DownloadAndPrepare");
  v308[1] = CFSTR("DownloadAndPrepare");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v308, v307, 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v322[6] = v85;
  v321[7] = CFSTR("AlreadyDownloaded");
  v305[0] = v3;
  v305[1] = v2;
  v306[0] = CFSTR("DownloadAndPrepare");
  v306[1] = CFSTR("Prepare");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v306, v305, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v322[7] = v84;
  v321[8] = CFSTR("PrepareInterrupted");
  v7 = *MEMORY[0x24BEAEA18];
  v303[0] = v3;
  v303[1] = v2;
  v8 = *MEMORY[0x24BEAE9C0];
  v304[0] = v7;
  v304[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v304, v303, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v322[8] = v83;
  v321[9] = CFSTR("AlreadyPrepared");
  v9 = *MEMORY[0x24BEAEA08];
  v301[0] = v3;
  v301[1] = v2;
  v302[0] = v9;
  v302[1] = CFSTR("ReportPreparedSet");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v302, v301, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v322[9] = v82;
  v321[10] = CFSTR("ArmedInstall");
  v49 = *MEMORY[0x24BEAE9F0];
  v299[0] = v3;
  v299[1] = v2;
  v300[0] = v49;
  v300[1] = CFSTR("InstallArmed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v300, v299, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v322[10] = v81;
  v321[11] = CFSTR("UpdateProgress");
  v297 = v2;
  v298 = *MEMORY[0x24BEAE9A0];
  v46 = v298;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v322[11] = v80;
  v321[12] = CFSTR("UpdateFailed");
  v295 = v2;
  v296 = CFSTR("CheckLockAndNetwork");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v322[12] = v79;
  v321[13] = CFSTR("Unlocked");
  v293 = v2;
  v294 = CFSTR("ReloadBrain");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v322[13] = v78;
  v321[14] = CFSTR("WaitUnlock");
  v291 = v3;
  v292 = CFSTR("WaitingFirstUnlock");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v322[14] = v77;
  v321[15] = CFSTR("WaitNetwork");
  v289 = v3;
  v290 = CFSTR("WaitingNetwork");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v322[15] = v76;
  v321[16] = *MEMORY[0x24BEAE9D8];
  v287[0] = v3;
  v287[1] = v2;
  v288[0] = CFSTR("CancelingRemoveRequested");
  v288[1] = CFSTR("ReportDownloadFailedRemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v288, v287, 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v322[16] = v75;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v322, v321, 17);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v460[9] = v74;
  v459[10] = v7;
  v281[0] = CFSTR("DownloadAndPrepare");
  v279[0] = v3;
  v279[1] = v2;
  v280[0] = CFSTR("CancelingDownloadRequested");
  v280[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v280, v279, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v286[0] = v73;
  v281[1] = CFSTR("InstallUpdate");
  v277 = v2;
  v278 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v286[1] = v72;
  v281[2] = CFSTR("RemoveUpdate");
  v275[0] = v3;
  v275[1] = v2;
  v276[0] = CFSTR("CancelingRemoveRequested");
  v276[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v276, v275, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v286[2] = v71;
  v281[3] = CFSTR("RollbackRequested");
  v273[0] = v3;
  v273[1] = v2;
  v274[0] = CFSTR("CancelingRollbackRequested");
  v274[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v274, v273, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v286[3] = v70;
  v281[4] = CFSTR("ApplyFailedDone");
  v271 = v2;
  v272 = CFSTR("RemoveAllPreserveCache");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v286[4] = v69;
  v282 = *MEMORY[0x24BEAE9C8];
  v40 = v282;
  v269 = v2;
  v270 = CFSTR("RemoveAllPreserveCache");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v270, &v269, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v286[5] = v68;
  v283 = CFSTR("RemovedAllPreservedCache");
  v267 = v2;
  v268 = CFSTR("CanceledDownloadRequested");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v286[6] = v67;
  v284 = CFSTR("ReadyToDownload");
  v265[0] = v3;
  v265[1] = v2;
  v266[0] = v162;
  v266[1] = v164;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v266, v265, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v286[7] = v66;
  v285 = *MEMORY[0x24BEAE9E8];
  v44 = v285;
  v263[0] = v3;
  v263[1] = v2;
  v42 = *MEMORY[0x24BEAE9A8];
  v264[0] = v9;
  v264[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v264, v263, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v286[8] = v65;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v286, v281, 9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v460[10] = v64;
  v459[11] = CFSTR("WaitingFirstUnlock");
  v261[0] = CFSTR("DownloadAndPrepare");
  v259[0] = v3;
  v259[1] = v2;
  v260[0] = CFSTR("CancelingDownloadRequested");
  v260[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v260, v259, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v262[0] = v63;
  v261[1] = CFSTR("InstallUpdate");
  v257 = v2;
  v258 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v262[1] = v62;
  v261[2] = CFSTR("RemoveUpdate");
  v255[0] = v3;
  v255[1] = v2;
  v256[0] = CFSTR("CancelingRemoveRequested");
  v256[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v256, v255, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v262[2] = v61;
  v261[3] = CFSTR("RollbackRequested");
  v253[0] = v3;
  v253[1] = v2;
  v254[0] = CFSTR("CancelingRollbackRequested");
  v254[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v254, v253, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v262[3] = v60;
  v261[4] = CFSTR("Unlocked");
  v251[0] = v3;
  v251[1] = v2;
  v252[0] = v162;
  v252[1] = v164;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v252, v251, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v262[4] = v59;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v262, v261, 5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v460[11] = v58;
  v459[12] = CFSTR("WaitingNetwork");
  v249[0] = CFSTR("DownloadAndPrepare");
  v247[0] = v3;
  v247[1] = v2;
  v248[0] = CFSTR("CancelingDownloadRequested");
  v248[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v248, v247, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v250[0] = v57;
  v249[1] = CFSTR("InstallUpdate");
  v245 = v2;
  v246 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v250[1] = v56;
  v249[2] = CFSTR("RemoveUpdate");
  v243[0] = v3;
  v243[1] = v2;
  v244[0] = CFSTR("CancelingRemoveRequested");
  v244[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v244, v243, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v250[2] = v55;
  v249[3] = CFSTR("RollbackRequested");
  v241[0] = v3;
  v241[1] = v2;
  v242[0] = CFSTR("CancelingRollbackRequested");
  v242[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v242, v241, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v250[3] = v54;
  v249[4] = CFSTR("NetworkAvailable");
  v239[0] = v3;
  v239[1] = v2;
  v240[0] = v162;
  v240[1] = v164;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v240, v239, 2);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v250[4] = v165;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v250, v249, 5);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v460[12] = v163;
  v459[13] = CFSTR("DownloadAndPrepare");
  v237[0] = CFSTR("DownloadAndPrepare");
  v235[0] = v3;
  v235[1] = v2;
  v236[0] = CFSTR("CancelingDownloadRequested");
  v236[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v236, v235, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v238[0] = v53;
  v237[1] = CFSTR("InstallUpdate");
  v233 = v2;
  v234 = CFSTR("ReportInstallFailedNoUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v238[1] = v52;
  v237[2] = CFSTR("RemoveUpdate");
  v231[0] = v3;
  v231[1] = v2;
  v232[0] = CFSTR("CancelingRemoveRequested");
  v232[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v232, v231, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v238[2] = v51;
  v237[3] = CFSTR("RollbackRequested");
  v229[0] = v3;
  v229[1] = v2;
  v230[0] = CFSTR("CancelingRollbackRequested");
  v230[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v230, v229, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v238[3] = v48;
  v237[4] = CFSTR("UpdateProgress");
  v227 = v2;
  v228 = v46;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v228, &v227, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v238[4] = v47;
  v237[5] = v44;
  v225[0] = v3;
  v225[1] = v2;
  v226[0] = v9;
  v226[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v226, v225, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v238[5] = v45;
  v237[6] = CFSTR("UpdateFailed");
  v223[0] = v3;
  v223[1] = v2;
  v224[0] = CFSTR("CancelingRemoveRequested");
  v224[1] = CFSTR("ReportDownloadFailedRemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v224, v223, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v238[6] = v43;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v238, v237, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v460[13] = v39;
  v459[14] = v9;
  v221[0] = CFSTR("DownloadAndPrepare");
  v219[0] = v3;
  v219[1] = v2;
  v220[0] = CFSTR("CancelingDownloadRequested");
  v220[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v220, v219, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v222[0] = v38;
  v221[1] = CFSTR("InstallUpdate");
  v217[0] = v3;
  v217[1] = v2;
  v218[0] = v49;
  v218[1] = CFSTR("InstallUpdate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v218, v217, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = v37;
  v221[2] = CFSTR("RemoveUpdate");
  v215[0] = v3;
  v215[1] = v2;
  v216[0] = CFSTR("RemovingAll");
  v216[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v216, v215, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v222[2] = v36;
  v221[3] = CFSTR("RollbackRequested");
  v213[0] = v3;
  v213[1] = v2;
  v214[0] = CFSTR("CancelingRollbackRequested");
  v214[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v214, v213, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v222[3] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v222, v221, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v460[14] = v34;
  v459[15] = v49;
  v211[0] = CFSTR("DownloadAndPrepare");
  v209 = v2;
  v210 = CFSTR("ReportDownloadInstalling");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = v50;
  v211[1] = CFSTR("InstallUpdate");
  v207 = v2;
  v208 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v212[1] = v33;
  v211[2] = CFSTR("RemoveUpdate");
  v205 = v2;
  v206 = CFSTR("ReportRemoveInstalling");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v212[2] = v32;
  v211[3] = CFSTR("RollbackRequested");
  v203 = v2;
  v204 = CFSTR("ReportRollbackInstalling");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v212[3] = v31;
  v211[4] = CFSTR("UpdateProgress");
  v201 = v2;
  v202 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v212[4] = v30;
  v211[5] = v40;
  v199[0] = v3;
  v199[1] = v2;
  v10 = *MEMORY[0x24BEAE998];
  v200[0] = v9;
  v200[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v200, v199, 2);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v212[5] = v161;
  v211[6] = CFSTR("ApplyFailedDone");
  v197 = v2;
  v198 = CFSTR("ReportApplyFailedRemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v212[6] = v41;
  v211[7] = CFSTR("ApplyFailedRemoveNow");
  v195[0] = v3;
  v195[1] = v2;
  v196[0] = CFSTR("RemovingAll");
  v196[1] = CFSTR("RemoveAll");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v196, v195, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v212[7] = v29;
  v211[8] = *MEMORY[0x24BEAE9D0];
  v11 = *MEMORY[0x24BEAE9F8];
  v193[0] = v3;
  v193[1] = v2;
  v194[0] = v11;
  v194[1] = CFSTR("ReportAwaitingReboot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v194, v193, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v212[8] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v212, v211, 9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v460[15] = v27;
  v459[16] = CFSTR("RollingBack");
  v191[0] = CFSTR("DownloadAndPrepare");
  v189 = v2;
  v190 = CFSTR("ReportDownloadFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v26;
  v191[1] = CFSTR("InstallUpdate");
  v187 = v2;
  v188 = CFSTR("ReportInstallFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v192[1] = v25;
  v191[2] = CFSTR("RemoveUpdate");
  v185 = v2;
  v186 = CFSTR("ReportRemoveFailedRollingBack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v192[2] = v24;
  v191[3] = CFSTR("RollbackRequested");
  v183 = v2;
  v184 = v167;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v192[3] = v12;
  v191[4] = CFSTR("RollbackComplete");
  v181[0] = v3;
  v181[1] = v2;
  v13 = *MEMORY[0x24BEAE9B8];
  v182[0] = v11;
  v182[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v182, v181, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v192[4] = v14;
  v191[5] = CFSTR("RollbackFailed");
  v179[0] = v3;
  v179[1] = v2;
  v180[0] = v166;
  v180[1] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v192[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v192, v191, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v460[16] = v16;
  v459[17] = v11;
  v177[0] = CFSTR("DownloadAndPrepare");
  v175 = v2;
  v176 = CFSTR("ReportDownloadAwaitingReboot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v17;
  v177[1] = CFSTR("InstallUpdate");
  v173 = v2;
  v174 = CFSTR("ReportInstallAwaitingReboot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v18;
  v177[2] = CFSTR("RemoveUpdate");
  v171 = v2;
  v172 = CFSTR("ReportRemoveAwaitingReboot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v19;
  v177[3] = CFSTR("RollbackRequested");
  v169 = v2;
  v170 = CFSTR("ReportRollbackAwaitingReboot");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v178[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v178, v177, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v460[17] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v460, v459, 18);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v168, 1);
  return v22;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;

  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAEBA8]) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemovePreserving")))
    {
      v14 = -[SUManagerEngine action_RemovePreserving:error:](self, "action_RemovePreserving:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Activated")))
    {
      v14 = -[SUManagerEngine action_Activated:error:](self, "action_Activated:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ActivatedClean")))
    {
      v14 = -[SUManagerEngine action_ActivatedClean:error:](self, "action_ActivatedClean:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("NewDownloadPending")))
    {
      v14 = -[SUManagerEngine action_NewDownloadPending:error:](self, "action_NewDownloadPending:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HandlePendingDownload")))
    {
      v14 = -[SUManagerEngine action_HandlePendingDownload:error:](self, "action_HandlePendingDownload:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CheckLockAndNetwork")))
    {
      v14 = -[SUManagerEngine action_CheckLockAndNetwork:error:](self, "action_CheckLockAndNetwork:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("BrainLoaded")))
    {
      v14 = -[SUManagerEngine action_BrainLoaded:error:](self, "action_BrainLoaded:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE990]))
    {
      v14 = -[SUManagerEngine action_LoadBrain:error:](self, "action_LoadBrain:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReloadBrain")))
    {
      v14 = -[SUManagerEngine action_ReloadBrain:error:](self, "action_ReloadBrain:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadAndPrepare")))
    {
      v14 = -[SUManagerEngine action_DownloadAndPrepare:error:](self, "action_DownloadAndPrepare:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Prepare")))
    {
      v14 = -[SUManagerEngine action_Prepare:error:](self, "action_Prepare:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE9C0]))
    {
      v14 = -[SUManagerEngine action_Resume:error:](self, "action_Resume:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("InstallUpdate")))
    {
      v14 = -[SUManagerEngine action_InstallUpdate:error:](self, "action_InstallUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ArmInstallOrFail")))
    {
      v14 = -[SUManagerEngine action_ArmInstallOrFail:error:](self, "action_ArmInstallOrFail:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("InstallArmed")))
    {
      v14 = -[SUManagerEngine action_InstallArmed:error:](self, "action_InstallArmed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Cancel")))
    {
      v14 = -[SUManagerEngine action_Cancel:error:](self, "action_Cancel:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CanceledDownloadRequested")))
    {
      v14 = -[SUManagerEngine action_CanceledDownloadRequested:error:](self, "action_CanceledDownloadRequested:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveAll")))
    {
      v14 = -[SUManagerEngine action_RemoveAll:error:](self, "action_RemoveAll:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveAllPreserveCache")))
    {
      v14 = -[SUManagerEngine action_RemoveAllPreserveCache:error:](self, "action_RemoveAllPreserveCache:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("PerformRollback")))
    {
      v14 = -[SUManagerEngine action_RollbackUpdate:error:](self, "action_RollbackUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HandlePendingRollback")))
    {
      v14 = -[SUManagerEngine action_HandlePendingRollback:error:](self, "action_HandlePendingRollback:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HandleCanceledPendingRollback")))
    {
      v14 = -[SUManagerEngine action_HandleCanceledPendingRollback:error:](self, "action_HandleCanceledPendingRollback:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadFailedRemoveAll")))
    {
      v14 = -[SUManagerEngine action_ReportDownloadFailedRemoveAll:error:](self, "action_ReportDownloadFailedRemoveAll:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE9A0]))
    {
      v14 = -[SUManagerEngine action_ReportDownloadProgress:error:](self, "action_ReportDownloadProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportPreparedSet")))
    {
      v14 = -[SUManagerEngine action_ReportPreparedSet:error:](self, "action_ReportPreparedSet:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE9A8]))
    {
      v14 = -[SUManagerEngine action_ReportPrepared:error:](self, "action_ReportPrepared:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE998]))
    {
      v14 = -[SUManagerEngine action_ReportApplyFailed:error:](self, "action_ReportApplyFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportApplyFailedRemoveAll")))
    {
      v14 = -[SUManagerEngine action_ReportApplyFailedRemoveAll:error:](self, "action_ReportApplyFailedRemoveAll:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadFailedNoUpdate")))
    {
      v14 = -[SUManagerEngine action_ReportDownloadFailedNoUpdate:error:](self, "action_ReportDownloadFailedNoUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportInstallFailedNoUpdate")))
    {
      v14 = -[SUManagerEngine action_ReportInstallFailedNoUpdate:error:](self, "action_ReportInstallFailedNoUpdate:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadFailedRollingBack")))
    {
      v14 = -[SUManagerEngine action_ReportDownloadFailedRollingBack:error:](self, "action_ReportDownloadFailedRollingBack:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportInstallFailedRollingBack")))
    {
      v14 = -[SUManagerEngine action_ReportInstallFailedRollingBack:error:](self, "action_ReportInstallFailedRollingBack:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRemoveFailedRollingBack")))
    {
      v14 = -[SUManagerEngine action_ReportRemoveFailedRollingBack:error:](self, "action_ReportRemoveFailedRollingBack:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadInstalling")))
    {
      v14 = -[SUManagerEngine action_ReportDownloadInstalling:error:](self, "action_ReportDownloadInstalling:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRemoveInstalling")))
    {
      v14 = -[SUManagerEngine action_ReportRemoveInstalling:error:](self, "action_ReportRemoveInstalling:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRollbackInstalling")))
    {
      v14 = -[SUManagerEngine action_ReportRollbackInstalling:error:](self, "action_ReportRollbackInstalling:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportAwaitingReboot")))
    {
      v14 = -[SUManagerEngine action_ReportAwaitingReboot:error:](self, "action_ReportAwaitingReboot:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadAwaitingReboot")))
    {
      v14 = -[SUManagerEngine action_ReportDownloadAwaitingReboot:error:](self, "action_ReportDownloadAwaitingReboot:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportInstallAwaitingReboot")))
    {
      v14 = -[SUManagerEngine action_ReportInstallAwaitingReboot:error:](self, "action_ReportInstallAwaitingReboot:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRemoveAwaitingReboot")))
    {
      v14 = -[SUManagerEngine action_ReportRemoveAwaitingReboot:error:](self, "action_ReportRemoveAwaitingReboot:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportRollbackAwaitingReboot")))
    {
      v14 = -[SUManagerEngine action_ReportRollbackAwaitingReboot:error:](self, "action_ReportRollbackAwaitingReboot:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE9B0]))
    {
      v14 = -[SUManagerEngine action_ReportRollbackFailed:error:](self, "action_ReportRollbackFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEAE9B8]))
    {
      v14 = -[SUManagerEngine action_ReportRollbackSucceeded:error:](self, "action_ReportRollbackSucceeded:error:", v12, a8);
    }
    else
    {
      v14 = -[SUManagerEngine actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }
    v13 = v14;
  }

  return v13;
}

- (int64_t)action_RemovePreserving:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_msgSend(v5, "paramType");
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2)
  {
    objc_msgSend(v9, "postEvent:withInfo:", CFSTR("PreservedValidated"), v5);
    v11 = 0;
  }
  else
  {
    objc_msgSend(v9, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 8102;
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("param type is not DOWNLOAD_DESCRIPTOR"), 8102, 0);

  }
  return v11;
}

- (int64_t)action_ActivatedHelper:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUManagerEngine activating](self, "activating"))
  {
    -[SUManagerEngine setActivated:](self, "setActivated:", 1);
    -[SUManagerEngine setActivating:](self, "setActivating:", 0);
    -[SUManagerEngine managerDelegate](self, "managerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activated:", v3);
LABEL_5:

    return 0;
  }
  if (!-[SUManagerEngine activated](self, "activated"))
  {
    -[SUManagerEngine engineFSM](self, "engineFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("not in activating state"), 8115, 0);

    goto LABEL_5;
  }
  return 0;
}

- (int64_t)action_Activated:(id)a3 error:(id *)a4
{
  return -[SUManagerEngine action_ActivatedHelper:](self, "action_ActivatedHelper:", 0, a4);
}

- (int64_t)action_ActivatedClean:(id)a3 error:(id *)a4
{
  return -[SUManagerEngine action_ActivatedHelper:](self, "action_ActivatedHelper:", 1, a4);
}

- (int64_t)action_NewDownloadPending:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine setDownloadDescriptor:](self, "setDownloadDescriptor:", v8);
  return 0;
}

- (int64_t)action_HandlePendingDownload:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  SUManagerEngineParam *v8;
  void *v9;
  SUManagerEngineParam *v10;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SUManagerEngineParam alloc];
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUManagerEngineParam initWithDownloadDescriptor:](v8, "initWithDownloadDescriptor:", v9);
  objc_msgSend(v7, "followupEvent:withInfo:", CFSTR("ReadyToDownload"), v10);

  return 0;
}

- (int64_t)action_CheckLockAndNetwork:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  SUManagerEngineParam *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  SUManagerEngineParam *v40;
  SUManagerEngineParam *v41;
  void *v42;
  SUManagerEngineParam *v43;
  void *v44;
  _QWORD block[5];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "disarmInstall");

  if ((_DWORD)v7)
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ disarming install", buf, 0xCu);

    }
    -[SUManagerEngine actionHelper_ReportInstallFailedNoUpdate](self, "actionHelper_ReportInstallFailedNoUpdate");
  }
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_28;
  if (!-[SUManagerEngine isBrainNetworkError:](self, "isBrainNetworkError:", v5)
    || (+[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isPathSatisfied"),
        v14,
        (v15 & 1) != 0))
  {
    if (-[SUManagerEngine isBrainReloadError:](self, "isBrainReloadError:", v5))
    {
      v16 = 0;
    }
    else
    {
      -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "attributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SUCoreBorder_MSUBrainIsLoadable();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if (v20)
      {
        objc_msgSend(v20, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("LoadTrustCachePurgedBrain"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", MEMORY[0x24BDBD1C8]);

        if (!v23)
        {
          +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isPasscodeLocked");

          if (v25)
          {
            -[SUManagerEngine managerDelegate](self, "managerDelegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_opt_respondsToSelector();

            -[SUManagerEngine engineLog](self, "engineLog");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "oslog");
            v29 = objc_claimAutoreleasedReturnValue();

            v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if ((v27 & 1) != 0)
            {
              if (v30)
              {
                -[SUManagerEngine engineName](self, "engineName");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v48 = v31;
                _os_log_impl(&dword_2128D9000, v29, OS_LOG_TYPE_DEFAULT, "%@ load brain failed, waiting for unlock", buf, 0xCu);

              }
              -[SUManagerEngine engineFSM](self, "engineFSM");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_alloc_init(SUManagerEngineParam);
              objc_msgSend(v32, "followupEvent:withInfo:", CFSTR("WaitUnlock"), v33);

              objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "delegateCallbackQueue");
              v35 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __52__SUManagerEngine_action_CheckLockAndNetwork_error___block_invoke;
              block[3] = &unk_24CE3B5C0;
              block[4] = self;
              dispatch_async(v35, block);

              goto LABEL_23;
            }
            if (v30)
            {
              -[SUManagerEngine engineName](self, "engineName");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v48 = v44;
              _os_log_impl(&dword_2128D9000, v29, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to sendUnlockNotifications, failing", buf, 0xCu);

            }
          }
          goto LABEL_27;
        }
      }
      else
      {

      }
    }
    if (-[SUManagerEngine loadBrainRetries](self, "loadBrainRetries") <= 9)
    {
      -[SUManagerEngine engineFSM](self, "engineFSM");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = [SUManagerEngineParam alloc];
      -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SUManagerEngineParam initWithDownloadDescriptor:](v41, "initWithDownloadDescriptor:", v42);
      objc_msgSend(v34, "followupEvent:withInfo:", CFSTR("Unlocked"), v43);

LABEL_23:
      goto LABEL_29;
    }
LABEL_27:

LABEL_28:
    -[SUManagerEngine _queue_cancelLockAssertion](self, "_queue_cancelLockAssertion");
    -[SUManagerEngine engineFSM](self, "engineFSM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "followupEvent:withInfo:", *MEMORY[0x24BEAE9D8], v5);
    goto LABEL_29;
  }
  -[SUManagerEngine engineLog](self, "engineLog");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "oslog");
  v37 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v38;
    _os_log_impl(&dword_2128D9000, v37, OS_LOG_TYPE_DEFAULT, "%@ network unavailable, will wait for network", buf, 0xCu);

  }
  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObserver:", self);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(SUManagerEngineParam);
  objc_msgSend(v16, "followupEvent:withInfo:", CFSTR("WaitNetwork"), v40);

LABEL_29:
  return 0;
}

void __52__SUManagerEngine_action_CheckLockAndNetwork_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendUnlockNotifications:", 1);

}

- (int64_t)action_BrainLoaded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  SUManagerEngineParam *v24;
  void *v25;
  SUManagerEngineParam *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SUCoreBorder_MSUBrainIsLoadable();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "atPhase");

      if (v16 == 6)
      {
        -[SUManagerEngine engineFSM](self, "engineFSM");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        v18 = CFSTR("ArmedInstall");
      }
      else
      {
        -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "atPhase");

        if (v28 == 5)
        {
          -[SUManagerEngine engineFSM](self, "engineFSM");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v17;
          v18 = CFSTR("AlreadyPrepared");
        }
        else
        {
          -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "atPhase");

          if (v30 == 4)
          {
            -[SUManagerEngine engineFSM](self, "engineFSM");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v17;
            v18 = CFSTR("PrepareInterrupted");
          }
          else
          {
            -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "atPhase");

            -[SUManagerEngine engineFSM](self, "engineFSM");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v17;
            if (v32 == 3)
              v18 = CFSTR("AlreadyDownloaded");
            else
              v18 = CFSTR("BrainLoaded");
          }
        }
      }
      objc_msgSend(v17, "followupEvent:withInfo:", v18, v5);
      goto LABEL_18;
    }
  }
  else
  {

    v14 = 0;
  }
  objc_msgSend(v14, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("LoadTrustCachePurgedBrain"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqual:", MEMORY[0x24BDBD1C8]);

  if (v21)
    v22 = 107;
  else
    v22 = 54;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [SUManagerEngineParam alloc];
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SUManagerEngineParam initWithError:](v24, "initWithError:", v25);
  objc_msgSend(v23, "followupEvent:withInfo:", CFSTR("UpdateFailed"), v26);

LABEL_18:
  return 0;
}

- (int64_t)loadBrainHelper:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SUPolicyFactory *policyFactory;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SUManagerEngineParam *v24;
  int64_t v25;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend(v4, "paramType") == 2)
  {
    objc_msgSend(v4, "downloadDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerEngine setDownloadDescriptor:](self, "setDownloadDescriptor:", v7);

    -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coreDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUManagerEngine resetPolicy](self, "resetPolicy");
    -[SUManagerEngine setPendingPurgeParams:](self, "setPendingPurgeParams:", 0);
    -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "installTonightConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerEngine _updatePolicyFactoryMetricEventFields:updateUUID:](self, "_updatePolicyFactoryMetricEventFields:updateUUID:", v11, v13);

    v14 = objc_alloc(MEMORY[0x24BEAE870]);
    -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithDelegate:updateDescriptor:updateUUID:", self, v9, v16);
    -[SUManagerEngine setUpdateControl:](self, "setUpdateControl:", v17);

    policyFactory = self->_policyFactory;
    objc_msgSend(v4, "downloadDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scanOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUPolicyFactory setScanOptions:](policyFactory, "setScanOptions:", v20);

    -[SUManagerEngine updateControl](self, "updateControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerEngine updatePolicy](self, "updatePolicy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "targetBrainLoaded:", v22);

    if (!-[SUManagerEngine activating](self, "activating"))
    {
      v25 = 0;
      goto LABEL_7;
    }
    -[SUManagerEngine engineFSM](self, "engineFSM");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(SUManagerEngineParam);
    objc_msgSend(v23, "followupEvent:withInfo:", CFSTR("BrainLoading"), v24);

    v25 = 0;
  }
  else
  {
    -[SUManagerEngine engineFSM](self, "engineFSM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "diag");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 8102;
    objc_msgSend(v23, "trackAnomaly:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("param type is not DOWNLOAD_DESCRIPTOR"), 8102, 0);
  }

LABEL_7:
  return v25;
}

- (int64_t)action_LoadBrain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t v8;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine setLoadBrainRetries:](self, "setLoadBrainRetries:", 0);
  v8 = -[SUManagerEngine loadBrainHelper:](self, "loadBrainHelper:", v5);

  return v8;
}

- (int64_t)action_ReloadBrain:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t v8;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine setLoadBrainRetries:](self, "setLoadBrainRetries:", -[SUManagerEngine loadBrainRetries](self, "loadBrainRetries") + 1);
  v8 = -[SUManagerEngine loadBrainHelper:](self, "loadBrainHelper:", v5);

  return v8;
}

- (int64_t)action_DownloadAndPrepare:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  SUPolicyFactory *policyFactory;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyFactory setDownloadOptions:](policyFactory, "setDownloadOptions:", v10);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "followupEvent:withInfo:", CFSTR("UpdateProgress"), v5);

  -[SUManagerEngine updateControl](self, "updateControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "targetPrepared:", v13);

  return 0;
}

- (int64_t)action_Prepare:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  SUPolicyFactory *policyFactory;
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

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyFactory setDownloadOptions:](policyFactory, "setDownloadOptions:", v10);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "followupEvent:withInfo:", CFSTR("UpdateProgress"), v5);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCheckAvailableSpace:", 0);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "downloadPreflightPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "softwareUpdateDownloadPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSkipPhase:", 1);

  -[SUManagerEngine updateControl](self, "updateControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targetPrepared:", v18);

  return 0;
}

- (int64_t)action_Resume:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
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

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadPreflightPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCheckAvailableSpace:", 0);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "softwareUpdateDownloadPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preparePolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suspendPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSkipPhase:", 1);

  -[SUManagerEngine updateControl](self, "updateControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetPrepared:", v17);

  return 0;
}

- (int64_t)action_InstallUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  SUPolicyFactory *policyFactory;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  objc_msgSend(v5, "installOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUPolicyFactory setInstallOptions:](policyFactory, "setInstallOptions:", v9);
  -[SUManagerEngine updateControl](self, "updateControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetApplied:", v11);

  return 0;
}

- (int64_t)action_InstallArmed:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  SUPolicyFactory *policyFactory;
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

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  policyFactory = self->_policyFactory;
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyFactory setInstallOptions:](policyFactory, "setInstallOptions:", v9);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCheckAvailableSpace:", 0);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "downloadPreflightPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "softwareUpdateDownloadPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preparePolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "suspendPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSkipPhase:", 1);

  -[SUManagerEngine updateControl](self, "updateControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "targetApplied:", v20);

  return 0;
}

- (int64_t)action_ArmInstallOrFail:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "armInstall:", v9);

  -[SUManagerEngine engineLog](self, "engineLog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      -[SUManagerEngine engineName](self, "engineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "installOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2128D9000, v12, OS_LOG_TYPE_DEFAULT, "%@ install is armed with options:%@", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    if (v13)
    {
      -[SUManagerEngine engineName](self, "engineName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_2128D9000, v12, OS_LOG_TYPE_DEFAULT, "%@ install can't be armed", (uint8_t *)&v18, 0xCu);

    }
    -[SUManagerEngine actionHelper_ReportInstallFailedNoUpdate](self, "actionHelper_ReportInstallFailedNoUpdate");
  }

  return 0;
}

- (int64_t)action_Cancel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine setDownloadDescriptor:](self, "setDownloadDescriptor:", v8);

  if (objc_msgSend(v5, "paramType") == 9)
    -[SUManagerEngine setPendingPurgeParams:](self, "setPendingPurgeParams:", v5);
  -[SUManagerEngine updateControl](self, "updateControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelCurrentUpdate");

  return 0;
}

- (int64_t)action_CanceledDownloadRequested:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  SUManagerEngineParam *v8;
  void *v9;
  SUManagerEngineParam *v10;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SUManagerEngineParam alloc];
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUManagerEngineParam initWithDownloadDescriptor:](v8, "initWithDownloadDescriptor:", v9);
  objc_msgSend(v7, "followupEvent:withInfo:", CFSTR("ReadyToDownload"), v10);

  return 0;
}

- (int64_t)action_RemoveAll:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine setUpdateControl:](self, "setUpdateControl:", 0);
  -[SUManagerEngine setDownloadDescriptor:](self, "setDownloadDescriptor:", 0);
  -[SUPolicyFactory setScanOptions:](self->_policyFactory, "setScanOptions:", 0);
  -[SUPolicyFactory setDownloadOptions:](self->_policyFactory, "setDownloadOptions:", 0);
  -[SUPolicyFactory setInstallOptions:](self->_policyFactory, "setInstallOptions:", 0);
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (objc_msgSend(v5, "paramType") == 9 && objc_msgSend(v5, "skipDocAssetsPurge"))
    objc_msgSend(v9, "setDocumentationAssetType:", 0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke;
  v11[3] = &unk_24CE3CA78;
  v11[4] = self;
  objc_msgSend(MEMORY[0x24BEAE850], "removeAllUpdateContentWithPolicy:completion:", v9, v11);

  return 0;
}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackError:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("unable to remove all update content"), objc_msgSend(v3, "code"), v3);

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", CFSTR("com.apple.MobileAssetError.Purge")))
  {

    goto LABEL_6;
  }
  if (objc_msgSend(v3, "code") != 11)
  {
    v8 = objc_msgSend(v3, "code");

    if (v8 == 8)
      goto LABEL_8;
LABEL_6:
    v7 = *MEMORY[0x24BEAE958];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_2;
    v12[3] = &unk_24CE3CA78;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEAE850], "removeAllAssetsOfType:completion:", v7, v12);
    goto LABEL_11;
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "engineLog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ Trying to purge installed assets one by one", buf, 0xCu);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_346;
  v13[3] = &unk_24CE3B5C0;
  v13[4] = *(_QWORD *)(a1 + 32);
  +[SUAssetSupport cleanupAllInstalledAssets:](SUAssetSupport, "cleanupAllInstalledAssets:", v13);
LABEL_11:

}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_346(uint64_t a1)
{
  SUManagerEngineParam *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(SUManagerEngineParam);
  objc_msgSend(v2, "postEvent:withInfo:", CFSTR("RemovedAll"), v1);

}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUManagerEngineParam *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackError:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("unable to remove all splat update content"), objc_msgSend(v3, "code"), v3);

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", CFSTR("com.apple.MobileAssetError.Purge")))
  {

    goto LABEL_6;
  }
  if (objc_msgSend(v3, "code") != 11)
  {
    v9 = objc_msgSend(v3, "code");

    if (v9 == 8)
      goto LABEL_8;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "engineFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(SUManagerEngineParam);
    objc_msgSend(v7, "postEvent:withInfo:", CFSTR("RemovedAll"), v8);

    goto LABEL_11;
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "engineLog");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_impl(&dword_2128D9000, v11, OS_LOG_TYPE_DEFAULT, "%@ Trying to purge installed assets one by one", buf, 0xCu);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_349;
  v13[3] = &unk_24CE3B5C0;
  v13[4] = *(_QWORD *)(a1 + 32);
  +[SUAssetSupport cleanupAllInstalledAssets:](SUAssetSupport, "cleanupAllInstalledAssets:", v13);
LABEL_11:

}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_349(uint64_t a1)
{
  SUManagerEngineParam *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(SUManagerEngineParam);
  objc_msgSend(v2, "postEvent:withInfo:", CFSTR("RemovedAll"), v1);

}

- (int64_t)action_RemoveAllPreserveCache:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetPhase");

  v8 = (void *)MEMORY[0x24BEAE850];
  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SUManagerEngine_action_RemoveAllPreserveCache_error___block_invoke;
  v11[3] = &unk_24CE3CA78;
  v11[4] = self;
  objc_msgSend(v8, "removeAllUpdateContentWithPolicy:completion:", v9, v11);

  return 0;
}

void __55__SUManagerEngine_action_RemoveAllPreserveCache_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  SUManagerEngineParam *v7;
  id v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "engineFSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackError:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("unable to remove all update content"), objc_msgSend(v4, "code"), v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(SUManagerEngineParam);
  objc_msgSend(v8, "postEvent:withInfo:", CFSTR("RemovedAllPreservedCache"), v7);

}

- (int64_t)action_RollbackUpdate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  SUPolicyFactory *policyFactory;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  objc_msgSend(v5, "rollbackOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUPolicyFactory setRollbackOptions:](policyFactory, "setRollbackOptions:", v9);
  -[SUManagerEngine updateControl](self, "updateControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE870]), "initWithDelegate:updateDescriptor:updateUUID:", self, 0, self->_rollbackUUID);
    -[SUManagerEngine setUpdateControl:](self, "setUpdateControl:", v11);

  }
  -[SUManagerEngine updateControl](self, "updateControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rollbackAvailable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine notifyRollbackStarted:](self, "notifyRollbackStarted:", v13);

  -[SUManagerEngine updateControl](self, "updateControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine rollbackPolicy](self, "rollbackPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "targetRollback:", v15);

  return 0;
}

- (int64_t)action_HandlePendingRollback:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "followupEvent:withInfo:", CFSTR("ReadyToRollback"), v5);

  return 0;
}

- (int64_t)action_HandleCanceledPendingRollback:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v9, "delegateCallbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SUManagerEngine_action_HandleCanceledPendingRollback_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v10, block);
LABEL_5:

    goto LABEL_6;
  }
  -[SUManagerEngine engineLog](self, "engineLog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_2128D9000, v9, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "followupEvent:withInfo:", CFSTR("ReadyToRollback"), v5);

  return 0;
}

void __62__SUManagerEngine_action_HandleCanceledPendingRollback_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 16, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", v1);

}

- (int64_t)action_ReportDownloadProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int IsBeyondBrainLoad;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngine SUOperationProgressFromSUCoreProgress:](self, "SUOperationProgressFromSUCoreProgress:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsBeyondBrainLoad = SUDownloadPhaseIsBeyondBrainLoad(v10);

  if (IsBeyondBrainLoad)
    -[SUManagerEngine _queue_cancelLockAssertion](self, "_queue_cancelLockAssertion");
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCallbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__SUManagerEngine_action_ReportDownloadProgress_error___block_invoke;
    v20[3] = &unk_24CE3B610;
    v20[4] = self;
    v21 = v5;
    dispatch_async(v15, v20);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_2128D9000, v17, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadProgress:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __55__SUManagerEngine_action_ReportDownloadProgress_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SUOperationProgressFromSUCoreProgress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadProgress:", v4);

}

- (void)actionHelper_ReportPrepared:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__SUManagerEngine_actionHelper_ReportPrepared___block_invoke;
    v12[3] = &unk_24CE3BB60;
    v12[4] = self;
    v13 = a3;
    dispatch_async(v8, v12);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }
}

void __47__SUManagerEngine_actionHelper_ReportPrepared___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:informClients:", 0, *(unsigned __int8 *)(a1 + 40));

}

- (int64_t)action_ReportPrepared:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine actionHelper_ReportPrepared:](self, "actionHelper_ReportPrepared:", 1);
  return 0;
}

- (int64_t)action_ReportPreparedSet:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  SUPolicyFactory *policyFactory;
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

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  policyFactory = self->_policyFactory;
  -[SUManagerEngine downloadDescriptor](self, "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyFactory setDownloadOptions:](policyFactory, "setDownloadOptions:", v9);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCheckAvailableSpace:", 0);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "downloadPreflightPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "softwareUpdateDownloadPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preparePolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSkipPhase:", 1);

  -[SUManagerEngine updatePolicy](self, "updatePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "suspendPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSkipPhase:", 1);

  -[SUManagerEngine actionHelper_ReportPrepared:](self, "actionHelper_ReportPrepared:", 0);
  return 0;
}

- (int64_t)action_ReportDownloadFailedNoUpdate:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_action_ReportDownloadFailedNoUpdate_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportDownloadFailedNoUpdate_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", v1);

}

- (void)actionHelper_ReportInstallFailedNoUpdate
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v5, "delegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SUManagerEngine_actionHelper_ReportInstallFailedNoUpdate__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);

    }
  }

}

void __59__SUManagerEngine_actionHelper_ReportInstallFailedNoUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleted:", v1);

}

- (int64_t)action_ReportInstallFailedNoUpdate:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine actionHelper_ReportInstallFailedNoUpdate](self, "actionHelper_ReportInstallFailedNoUpdate");
  return 0;
}

- (void)actionHelper_ReportInstallFailedRollingBack
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v5, "delegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SUManagerEngine_actionHelper_ReportInstallFailedRollingBack__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);

    }
  }

}

void __62__SUManagerEngine_actionHelper_ReportInstallFailedRollingBack__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 87);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleted:", v1);

}

- (int64_t)action_ReportInstallFailedRollingBack:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine actionHelper_ReportInstallFailedRollingBack](self, "actionHelper_ReportInstallFailedRollingBack");
  return 0;
}

- (void)actionHelper_ReportDownloadFailedRollingBack
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v5, "delegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SUManagerEngine_actionHelper_ReportDownloadFailedRollingBack__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }

}

void __63__SUManagerEngine_actionHelper_ReportDownloadFailedRollingBack__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 87);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", v1);

}

- (int64_t)action_ReportDownloadFailedRollingBack:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine actionHelper_ReportDownloadFailedRollingBack](self, "actionHelper_ReportDownloadFailedRollingBack");
  return 0;
}

- (void)actionHelper_ReportRemoveFailedRollingBack
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v5, "delegateCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_actionHelper_ReportRemoveFailedRollingBack__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);

    }
  }

}

void __61__SUManagerEngine_actionHelper_ReportRemoveFailedRollingBack__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 87);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCompleted:", v1);

}

- (int64_t)action_ReportRemoveFailedRollingBack:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUManagerEngine actionHelper_ReportRemoveFailedRollingBack](self, "actionHelper_ReportRemoveFailedRollingBack");
  return 0;
}

- (int64_t)action_ReportDownloadInstalling:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SUManagerEngine_action_ReportDownloadInstalling_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __57__SUManagerEngine_action_ReportDownloadInstalling_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", v1);

}

- (int64_t)action_ReportRemoveInstalling:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SUManagerEngine_action_ReportRemoveInstalling_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __55__SUManagerEngine_action_ReportRemoveInstalling_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCompleted:", v1);

}

- (int64_t)action_ReportRollbackInstalling:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCallbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__SUManagerEngine_action_ReportRollbackInstalling_error___block_invoke;
    v15[3] = &unk_24CE3B610;
    v15[4] = self;
    v16 = v5;
    dispatch_async(v10, v15);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_2128D9000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __57__SUManagerEngine_action_ReportRollbackInstalling_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rollback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleRollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rollbackCompleted:withError:", v3, v4);

}

- (int64_t)action_ReportDownloadAwaitingReboot:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_action_ReportDownloadAwaitingReboot_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportDownloadAwaitingReboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 42);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", v1);

}

- (int64_t)action_ReportInstallAwaitingReboot:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__SUManagerEngine_action_ReportInstallAwaitingReboot_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __60__SUManagerEngine_action_ReportInstallAwaitingReboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 42);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleted:", v1);

}

- (int64_t)action_ReportRemoveAwaitingReboot:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SUManagerEngine_action_ReportRemoveAwaitingReboot_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __59__SUManagerEngine_action_ReportRemoveAwaitingReboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 42);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCompleted:", v1);

}

- (int64_t)action_ReportRollbackAwaitingReboot:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCallbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__SUManagerEngine_action_ReportRollbackAwaitingReboot_error___block_invoke;
    v15[3] = &unk_24CE3B610;
    v15[4] = self;
    v16 = v5;
    dispatch_async(v10, v15);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_2128D9000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportRollbackAwaitingReboot_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rollback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleRollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rollbackCompleted:withError:", v3, v4);

}

- (int64_t)action_ReportDownloadFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SUManagerEngine *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCallbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __62__SUManagerEngine_action_ReportDownloadFailedRemoveAll_error___block_invoke;
    v19 = &unk_24CE3B610;
    v20 = self;
    v21 = v5;
    dispatch_async(v10, &v16);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_2128D9000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);

    }
  }
  -[SUManagerEngine engineFSM](self, "engineFSM", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "followupEvent:withInfo:", CFSTR("UpdateFailed"), v5);

  return 0;
}

void __62__SUManagerEngine_action_ReportDownloadFailedRemoveAll_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadCompleted:", v2);

}

- (void)actionHelper_ReportApplyFailed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__SUManagerEngine_actionHelper_ReportApplyFailed___block_invoke;
    v12[3] = &unk_24CE3B610;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);

    }
  }

}

void __50__SUManagerEngine_actionHelper_ReportApplyFailed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleted:", *(_QWORD *)(a1 + 40));

}

- (int64_t)action_ReportApplyFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine actionHelper_ReportApplyFailed:](self, "actionHelper_ReportApplyFailed:", v8);
  return 0;
}

- (int64_t)action_ReportApplyFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", 78, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine actionHelper_ReportApplyFailed:](self, "actionHelper_ReportApplyFailed:", v9);
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "followupEvent:withInfo:", CFSTR("ApplyFailedRemoveNow"), v5);

  return 0;
}

- (int64_t)action_ReportAwaitingReboot:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject delegateCallbackQueue](v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__SUManagerEngine_action_ReportAwaitingReboot_error___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);

    }
  }

  return 0;
}

void __53__SUManagerEngine_action_ReportAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "installCompleted:", 0);

}

- (void)actionHelper_ReportRollbackCompleted:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCallbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SUManagerEngine_actionHelper_ReportRollbackCompleted_withError___block_invoke;
    block[3] = &unk_24CE3BB38;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    dispatch_async(v11, block);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v14;
      _os_log_impl(&dword_2128D9000, v13, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);

    }
  }

}

void __66__SUManagerEngine_actionHelper_ReportRollbackCompleted_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackCompleted:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (int64_t)action_ReportRollbackFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "rollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eligibleRollback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine actionHelper_ReportRollbackCompleted:withError:](self, "actionHelper_ReportRollbackCompleted:withError:", v9, v10);
  return 0;
}

- (int64_t)action_ReportRollbackSucceeded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "rollback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eligibleRollback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine actionHelper_ReportRollbackCompleted:withError:](self, "actionHelper_ReportRollbackCompleted:withError:", v9, v10);
  return 0;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("unknown action(%@)"), v6);

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", v7, 5, 0, 0, 0);

  objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildError:underlying:description:", 8116, 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "diag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[ENGINE]"), CFSTR("engine FSM has reported an anomaly"), objc_msgSend(v11, "code"), v11);

  return 0;
}

- (SUManagerEngine)initWithDelegate:(id)a3
{
  id v4;
  SUManagerEngine *v5;
  SUManagerEngine *v6;
  uint64_t v7;
  SUCoreLog *engineLog;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SUCoreUpdate *updateControl;
  SUPolicyFactory *v17;
  SUPolicyFactory *policyFactory;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *engineName;
  uint64_t v23;
  NSDictionary *stateTable;
  id v25;
  uint64_t v26;
  SUCoreFSM *engineFSM;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  SUManagerEngineParam *pendingManagedScanParams;
  SUManagerEngineParam *pendingPurgeParams;
  SUCoreScan *activeScanner;
  void *v38;
  uint64_t v39;
  NSString *rollbackUUID;
  SUManagerEngine *v41;
  uint64_t v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SUManagerEngine;
  v5 = -[SUManagerEngine init](&v44, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_managerDelegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA78]), "initWithCategory:", CFSTR("engine"));
    engineLog = v6->_engineLog;
    v6->_engineLog = (SUCoreLog *)v7;

    if (!v6->_engineLog)
      SULogInfo(CFSTR("Failed creating engine log"), v9, v10, v11, v12, v13, v14, v15, v43);
    updateControl = v6->_updateControl;
    v6->_updateControl = 0;

    v17 = objc_alloc_init(SUPolicyFactory);
    policyFactory = v6->_policyFactory;
    v6->_policyFactory = v17;

    v19 = (void *)MGCopyAnswer();
    v20 = (void *)MGCopyAnswer();
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("engine:%@(%@)"));
    engineName = v6->_engineName;
    v6->_engineName = (NSString *)v21;

    objc_msgSend((id)objc_opt_class(), "_generateStateTable");
    v23 = objc_claimAutoreleasedReturnValue();
    stateTable = v6->_stateTable;
    v6->_stateTable = (NSDictionary *)v23;

    v25 = objc_alloc(MEMORY[0x24BEAEA68]);
    v26 = objc_msgSend(v25, "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:", v6->_engineName, v6->_stateTable, *MEMORY[0x24BEAEA20], v6, objc_opt_class());
    engineFSM = v6->_engineFSM;
    v6->_engineFSM = (SUCoreFSM *)v26;

    if (!v6->_engineFSM)
    {
      SULogInfo(CFSTR("Failed creating engine FSM"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v19);

      v41 = 0;
      goto LABEL_8;
    }
    pendingManagedScanParams = v6->_pendingManagedScanParams;
    v6->_pendingManagedScanParams = 0;

    pendingPurgeParams = v6->_pendingPurgeParams;
    v6->_pendingPurgeParams = 0;

    v6->_isManagedScan = 0;
    activeScanner = v6->_activeScanner;
    v6->_activeScanner = 0;

    *(_WORD *)&v6->_activating = 0;
    v6->_loadBrainRetries = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUIDString");
    v39 = objc_claimAutoreleasedReturnValue();
    rollbackUUID = v6->_rollbackUUID;
    v6->_rollbackUUID = (NSString *)v39;

  }
  v41 = v6;
LABEL_8:

  return v41;
}

- (void)activateLoadingPersisted:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerEngine_activateLoadingPersisted___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __44__SUManagerEngine_activateLoadingPersisted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  SUManagerEngineParam *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  id v43;
  __int16 v44;
  __int16 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackBegin:atLevel:", CFSTR("activateLoadingPersisted"), 1);

  if ((objc_msgSend(*(id *)(a1 + 32), "activated") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "activating"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setActivating:", 1);
    v45 = 0;
    v44 = 0;
    objc_msgSend(MEMORY[0x24BEAE850], "previousUpdateState:tetheredRestore:failedBackward:failedForward:", (char *)&v45 + 1, &v45, (char *)&v44 + 1, &v44);
    if (HIBYTE(v45))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v11;
        _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ previous update state: successful OTA", buf, 0xCu);

      }
    }
    if ((_BYTE)v45)
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v14;
        _os_log_impl(&dword_2128D9000, v13, OS_LOG_TYPE_DEFAULT, "%@ previous update state: tethered restore", buf, 0xCu);

      }
    }
    if (HIBYTE(v44))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "oslog");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v17;
        _os_log_impl(&dword_2128D9000, v16, OS_LOG_TYPE_DEFAULT, "%@ previous update state: failed backward", buf, 0xCu);

      }
    }
    if ((_BYTE)v44)
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl(&dword_2128D9000, v19, OS_LOG_TYPE_DEFAULT, "%@ previous update state: failed forward", buf, 0xCu);

      }
    }
    v21 = *(void **)(a1 + 40);
    if (v21)
    {
      objc_msgSend(v21, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        if (HIBYTE(v44))
        {
          objc_msgSend(*(id *)(a1 + 32), "engineLog");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2128D9000, v24, OS_LOG_TYPE_DEFAULT, "Previous OTA attempt failed backwards and prepared update has been purged", buf, 2u);
          }
          goto LABEL_37;
        }
        if (objc_msgSend(*(id *)(a1 + 40), "atPhase") == 2)
        {
          objc_msgSend(*(id *)(a1 + 32), "engineLog");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "engineName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, started downloading but not completed, will try to load";
LABEL_51:
            _os_log_impl(&dword_2128D9000, v24, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);

            goto LABEL_52;
          }
          goto LABEL_52;
        }
        if (objc_msgSend(*(id *)(a1 + 40), "atPhase") == 3)
        {
          objc_msgSend(*(id *)(a1 + 32), "engineLog");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "engineName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, update is downloaded, will try to load";
            goto LABEL_51;
          }
LABEL_52:

          objc_msgSend(*(id *)(a1 + 32), "engineFSM");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[SUManagerEngineParam initWithDownloadDescriptor:]([SUManagerEngineParam alloc], "initWithDownloadDescriptor:", *(_QWORD *)(a1 + 40));
          v31 = CFSTR("ActivateHavePersisted");
          goto LABEL_38;
        }
        if (objc_msgSend(*(id *)(a1 + 40), "atPhase") == 5)
        {
          objc_msgSend(*(id *)(a1 + 32), "engineLog");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "engineName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, update is prepared, will try to load";
            goto LABEL_51;
          }
          goto LABEL_52;
        }
        v39 = objc_msgSend(*(id *)(a1 + 40), "atPhase");
        objc_msgSend(*(id *)(a1 + 32), "engineLog");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "oslog");
        v24 = objc_claimAutoreleasedReturnValue();

        v41 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v39 == 4)
        {
          if (v41)
          {
            objc_msgSend(*(id *)(a1 + 32), "engineName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, prepare interrupted, will try to resume or purge and redownload";
            goto LABEL_51;
          }
          goto LABEL_52;
        }
        if (v41)
        {
          +[SUManagerEngineDownloadDescriptor phaseToString:](SUManagerEngineDownloadDescriptor, "phaseToString:", objc_msgSend(*(id *)(a1 + 40), "atPhase"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "engineName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v26;
          v48 = 2112;
          v49 = v42;
          _os_log_impl(&dword_2128D9000, v24, OS_LOG_TYPE_DEFAULT, "%@ download descriptor found, phase (%@) is not valid to load", buf, 0x16u);

          goto LABEL_36;
        }
LABEL_37:

        objc_msgSend(*(id *)(a1 + 32), "engineFSM");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc_init(SUManagerEngineParam);
        v31 = CFSTR("ActivateNoPersisted");
LABEL_38:
        objc_msgSend(v29, "postEvent:withInfo:", v31, v30);

        objc_msgSend(*(id *)(a1 + 32), "engineFSM");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "diag");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "trackEnd:atLevel:withResult:withError:", CFSTR("activateLoadingPersisted"), 1, objc_msgSend(0, "code"), 0);

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      v27 = "%@ no download descriptor asset to load from";
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLog");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      v27 = "%@ no download descriptor to load from";
    }
    _os_log_impl(&dword_2128D9000, v24, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_36:

    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (objc_msgSend(*(id *)(a1 + 32), "activated"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (objc_msgSend(*(id *)(a1 + 32), "activating"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("unexpected activate - activated:%@, activating:%@"), v6, v7);
  objc_msgSend(v4, "buildError:underlying:description:", 8111, 0, v8);
  v43 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)downloadUpdate:(id)a3
{
  id v4;
  SUManagerEngineParam *v5;
  id v6;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUManagerEngineParam initWithDownloadDescriptor:]([SUManagerEngineParam alloc], "initWithDownloadDescriptor:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadAndPrepare"), v5);
}

- (void)refreshInstallTonightConfig:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__SUManagerEngine_refreshInstallTonightConfig___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __47__SUManagerEngine_refreshInstallTonightConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyFactoryMetricEventFields:updateUUID:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_updatePolicyFactoryMetricEventFields:(id)a3 updateUUID:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v13)
    objc_msgSend(v9, "setValue:forKey:", v13, *MEMORY[0x24BEAEB28]);
  if (v6)
    objc_msgSend(v9, "setValue:forKey:", v6, *MEMORY[0x24BEAEBA0]);
  -[SUManagerEngine policyFactory](self, "policyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "globalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendUpdateMetricEventFields:", v9);
  -[SUManagerEngine policyFactory](self, "policyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGlobalOptions:", v11);

}

- (void)installUpdate:(id)a3
{
  id v4;
  SUManagerEngineParam *v5;
  id v6;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUManagerEngineParam initWithInstallOptions:]([SUManagerEngineParam alloc], "initWithInstallOptions:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("InstallUpdate"), v5);
}

- (void)removeUpdateKeepingDocAssets:(BOOL)a3
{
  SUManagerEngineParam *v4;
  void *v5;
  SUManagerEngineParam *v6;

  if (a3)
    v4 = -[SUManagerEngineParam initWithPurgeOptions:withError:]([SUManagerEngineParam alloc], "initWithPurgeOptions:withError:", 1, 0);
  else
    v4 = objc_alloc_init(SUManagerEngineParam);
  v6 = v4;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withInfo:", CFSTR("RemoveUpdate"), v6);

}

- (id)availableRollback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUManagerEngine updateControl](self, "updateControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE870]), "initWithDelegate:updateDescriptor:updateUUID:", self, 0, self->_rollbackUUID);
    -[SUManagerEngine setUpdateControl:](self, "setUpdateControl:", v4);

  }
  -[SUManagerEngine updateControl](self, "updateControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rollbackAvailable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previousRollback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUManagerEngine updateControl](self, "updateControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE870]), "initWithDelegate:updateDescriptor:updateUUID:", self, 0, self->_rollbackUUID);
    -[SUManagerEngine setUpdateControl:](self, "setUpdateControl:", v4);

  }
  -[SUManagerEngine updateControl](self, "updateControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousRollback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)rollbackUpdateWithOptions:(id)a3
{
  id v4;
  SUManagerEngineParam *v5;
  id v6;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUManagerEngineParam initWithRollbackOptions:]([SUManagerEngineParam alloc], "initWithRollbackOptions:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RollbackRequested"), v5);
}

- (void)onUnlock
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SUManagerEngine_onUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __27__SUManagerEngine_onUnlock__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  SUManagerEngineParam *v7;
  void *v8;
  SUManagerEngineParam *v9;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCallbackQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__SUManagerEngine_onUnlock__block_invoke_2;
    block[3] = &unk_24CE3B5C0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SUManagerEngineParam alloc];
  objc_msgSend(*(id *)(a1 + 32), "downloadDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUManagerEngineParam initWithDownloadDescriptor:](v7, "initWithDownloadDescriptor:", v8);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("Unlocked"), v9);

}

void __27__SUManagerEngine_onUnlock__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendUnlockNotifications:", 0);

}

- (void)createBrainLoadLockAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SUManagerEngine_createBrainLoadLockAssertion___block_invoke;
  v8[3] = &unk_24CE3B688;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __48__SUManagerEngine_createBrainLoadLockAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "_queue_createBrainLoadLockAssertion:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (BOOL)_queue_createBrainLoadLockAssertion:(id *)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  __MKBAssertion *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!-[SUManagerEngine isPasscodeEnabled](self, "isPasscodeEnabled"))
  {
    SULogInfo(CFSTR("Unable to create lock assertion on device without passcode"), v7, v8, v9, v10, v11, v12, v13, v35);
    if (a3)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = 86;
      goto LABEL_7;
    }
    return 0;
  }
  if (-[SUManagerEngine isPasscodeLocked](self, "isPasscodeLocked"))
  {
    SULogInfo(CFSTR("Unable to create lock assertion on locked device"), v14, v15, v16, v17, v18, v19, v20, v35);
    if (a3)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = 85;
LABEL_7:
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), v22, 0);
      v23 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v23;
    }
    return 0;
  }
  v36[0] = CFSTR("MKBAssertionKey");
  v36[1] = CFSTR("MKBAssertionTimeout");
  v37[0] = CFSTR("RemoteProfile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 240);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (__MKBAssertion *)MKBDeviceLockAssertion();
  self->_lockAssertion = v26;
  if (v26)
    SULogInfo(CFSTR("Created lock assertion"), v27, v28, v29, v30, v31, v32, v33, v35);
  v23 = self->_lockAssertion != 0;

  return v23;
}

- (void)updateBrainLoadProgress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SUManagerEngine_updateBrainLoadProgress___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __43__SUManagerEngine_updateBrainLoadProgress___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updateBrainLoadStalled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__SUManagerEngine_updateBrainLoadStalled___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __42__SUManagerEngine_updateBrainLoadStalled___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updateBrainLoaded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SUManagerEngine_updateBrainLoaded___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __37__SUManagerEngine_updateBrainLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  SUManagerEngineParam *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BEAE9E0];
  v3 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "postEvent:withInfo:", v2, v3);

}

- (void)updateAssetDownloadPreflighted
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineLog](self, "engineLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_2128D9000, v4, OS_LOG_TYPE_DEFAULT, "%@ update asset download preflighted", (uint8_t *)&v6, 0xCu);

  }
}

- (void)updateAssetDownloadProgress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__SUManagerEngine_updateAssetDownloadProgress___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __47__SUManagerEngine_updateAssetDownloadProgress___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updateAssetDownloadStalled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SUManagerEngine_updateAssetDownloadStalled___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __46__SUManagerEngine_updateAssetDownloadStalled___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updateAssetDownloaded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerEngine_updateAssetDownloaded___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__SUManagerEngine_updateAssetDownloaded___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updatePrepareProgress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerEngine_updatePrepareProgress___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__SUManagerEngine_updatePrepareProgress___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateProgress"), v2);

}

- (void)updatePrepared:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SUManagerEngine_updatePrepared___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __34__SUManagerEngine_updatePrepared___block_invoke(uint64_t a1)
{
  uint64_t v2;
  SUManagerEngineParam *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BEAE9E8];
  v3 = -[SUManagerEngineParam initWithProgress:]([SUManagerEngineParam alloc], "initWithProgress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "postEvent:withInfo:", v2, v3);

}

- (void)updateApplied
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SUManagerEngine_updateApplied__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __32__SUManagerEngine_updateApplied__block_invoke(uint64_t a1)
{
  uint64_t v1;
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x24BEAE9D0];
  v2 = objc_alloc_init(SUManagerEngineParam);
  objc_msgSend(v3, "postEvent:withInfo:", v1, v2);

}

- (void)applyAttemptFailed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUManagerEngine *v10;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SUManagerEngine_applyAttemptFailed___block_invoke;
  v8[3] = &unk_24CE3B610;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __38__SUManagerEngine_applyAttemptFailed___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SUManagerEngineParam *v30;
  void *v31;
  SUManagerEngineParam *v32;
  __CFString *v33;

  v2 = (__CFString *)(id)*MEMORY[0x24BEAE9C8];
  v3 = *(void **)(a1 + 32);
  v33 = v2;
  if (!v3)
  {
LABEL_21:
    v28 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v3, "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v33;
  if (v4)
  {
    v6 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE67280]) & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");

      v5 = v33;
      if (v8 != 5)
        goto LABEL_8;
      v5 = CFSTR("ApplyFailedDone");
      v6 = v33;
    }
    else
    {

      v5 = v33;
    }

  }
LABEL_8:
  v9 = *(void **)(a1 + 32);
  if (!v9)
  {
    v28 = 0;
    v33 = v5;
    goto LABEL_23;
  }
  objc_msgSend(v9, "userInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_14;
  v11 = (void *)v10;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Recoverable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Recoverable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
      v20 = v33;
    else
      v20 = CFSTR("ApplyFailedDone");
    v33 = (__CFString *)v20;

  }
  else
  {
LABEL_14:
    v33 = v5;
  }
  v21 = *(void **)(a1 + 32);
  if (!v21)
    goto LABEL_21;
  objc_msgSend(v21, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "mutableCopy");

  if (!v23)
    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 40), "policyFactory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "installOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("InstallOptions"));
  v26 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(*(id *)(a1 + 32), "code"), v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  objc_msgSend(*(id *)(a1 + 40), "engineFSM");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = [SUManagerEngineParam alloc];
  objc_msgSend(*(id *)(a1 + 40), "downloadDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[SUManagerEngineParam initWithDescriptor:andError:](v30, "initWithDescriptor:andError:", v31, v28);
  objc_msgSend(v29, "postEvent:withInfo:", v33, v32);

}

- (void)updateAttemptFailed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SUManagerEngine_updateAttemptFailed___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __39__SUManagerEngine_updateAttemptFailed___block_invoke(uint64_t a1)
{
  void *v2;
  SUManagerEngineParam *v3;
  SUManagerEngineParam *v4;
  void *v5;
  void *v6;
  SUManagerEngineParam *v7;
  SUManagerEngineParam *v8;

  objc_msgSend(*(id *)(a1 + 32), "pendingPurgeParams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [SUManagerEngineParam alloc];
  v4 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingPurgeParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUManagerEngineParam initWithPurgeOptions:withError:](v4, "initWithPurgeOptions:withError:", objc_msgSend(v5, "skipDocAssetsPurge"), *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setPendingPurgeParams:", 0);
  }
  else
  {
    v8 = -[SUManagerEngineParam initWithError:](v3, "initWithError:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUManagerEngineParam initWithError:]([SUManagerEngineParam alloc], "initWithError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("UpdateFailed"), v7);

}

- (void)updateCanceled
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUManagerEngine_updateCanceled__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __33__SUManagerEngine_updateCanceled__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SUManagerEngineParam *v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingPurgeParams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingPurgeParams");
    v4 = (SUManagerEngineParam *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingPurgeParams:", 0);
  }
  else
  {
    v4 = objc_alloc_init(SUManagerEngineParam);
  }
  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateCanceled"), v4);

}

- (void)updateRolledBack:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SUManagerEngine_updateRolledBack___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __36__SUManagerEngine_updateRolledBack___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithRollback:]([SUManagerEngineParam alloc], "initWithRollback:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("RollbackComplete"), v2);

}

- (void)rollbackAttemptFailed:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerEngine engineFSM](self, "engineFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendedStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUManagerEngine_rollbackAttemptFailed_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __51__SUManagerEngine_rollbackAttemptFailed_withError___block_invoke(uint64_t a1)
{
  SUManagerEngineParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SUManagerEngineParam initWithRollback:withError:]([SUManagerEngineParam alloc], "initWithRollback:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("RollbackFailed"), v2);

}

- (void)updateAnomaly:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUManagerEngine engineLog](self, "engineLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2128D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ anomaly reporteed by update control interface, error:%@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)pathSatisficationStatusChangedTo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[SUManagerEngine engineLog](self, "engineLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_2128D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ path satisfication changed to: %d", buf, 0x12u);

  }
  if (v3)
  {
    -[SUManagerEngine engineFSM](self, "engineFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendedStateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__SUManagerEngine_pathSatisficationStatusChangedTo___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

void __52__SUManagerEngine_pathSatisficationStatusChangedTo___block_invoke(uint64_t a1)
{
  void *v2;
  SUManagerEngineParam *v3;
  void *v4;
  SUManagerEngineParam *v5;
  id v6;

  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "engineFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SUManagerEngineParam alloc];
  objc_msgSend(*(id *)(a1 + 32), "downloadDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUManagerEngineParam initWithDownloadDescriptor:](v3, "initWithDownloadDescriptor:", v4);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("NetworkAvailable"), v5);

}

- (BOOL)isBrainNetworkError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUManagerEngine engineLog](self, "engineLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2128D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ Checking if engine parameter is brain network error, %@", (uint8_t *)&v24, 0x16u);

  }
  if (objc_msgSend(v4, "paramType") != 5)
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    -[SUManagerEngine engineName](self, "engineName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v14;
    v15 = "%@ engine parameter is not an error";
LABEL_17:
    _os_log_impl(&dword_2128D9000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, 0xCu);

    goto LABEL_18;
  }
  objc_msgSend(v4, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE67280]);

  if ((v10 & 1) == 0)
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    -[SUManagerEngine engineName](self, "engineName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v14;
    v15 = "%@ engine error parameter is not in MSU domain";
    goto LABEL_17;
  }
  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "code") != 812)
  {
    objc_msgSend(v4, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");

    if (v18 == 806)
      goto LABEL_12;
    -[SUManagerEngine engineLog](self, "engineLog");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v14;
      v15 = "%@ engine error parameter does not have a network failure code";
      goto LABEL_17;
    }
LABEL_18:
    v21 = 0;
    goto LABEL_19;
  }

LABEL_12:
  -[SUManagerEngine engineLog](self, "engineLog");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v20;
    _os_log_impl(&dword_2128D9000, v13, OS_LOG_TYPE_DEFAULT, "%@ Engine parameter is brain network error", (uint8_t *)&v24, 0xCu);

  }
  v21 = 1;
LABEL_19:

  return v21;
}

- (BOOL)isBrainReloadError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUManagerEngine engineLog](self, "engineLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUManagerEngine engineName](self, "engineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_2128D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ Checking if engine parameter is brain error that should be retried, %@", (uint8_t *)&v23, 0x16u);

  }
  if (objc_msgSend(v4, "paramType") != 5)
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    -[SUManagerEngine engineName](self, "engineName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v19;
    v20 = "%@ engine parameter is not an error";
LABEL_15:
    _os_log_impl(&dword_2128D9000, v14, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, 0xCu);

    goto LABEL_16;
  }
  objc_msgSend(v4, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  if ((v10 & 1) == 0)
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    -[SUManagerEngine engineName](self, "engineName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v19;
    v20 = "%@ engine error parameter is not in SU domain";
    goto LABEL_15;
  }
  objc_msgSend(v4, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "code");

  -[SUManagerEngine engineLog](self, "engineLog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12 != 107)
  {
    if (v15)
    {
      -[SUManagerEngine engineName](self, "engineName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v19;
      v20 = "%@ engine error parameter does not have a brain should retry failure code";
      goto LABEL_15;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (v15)
  {
    -[SUManagerEngine engineName](self, "engineName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v16;
    _os_log_impl(&dword_2128D9000, v14, OS_LOG_TYPE_DEFAULT, "%@ Engine parameter is brain retry error", (uint8_t *)&v23, 0xCu);

  }
  v17 = 1;
LABEL_17:

  return v17;
}

- (int)lockState
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE67230];
  v3[1] = CFSTR("ExtendedDeviceLockState");
  v4[0] = &unk_24CE6E088;
  v4[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return MKBGetDeviceLockState();
}

- (BOOL)isPasscodeEnabled
{
  return -[SUManagerEngine lockState](self, "lockState") != 3;
}

- (BOOL)isPasscodeLocked
{
  unsigned int v2;

  v2 = -[SUManagerEngine lockState](self, "lockState");
  return (v2 < 7) & (0x46u >> v2);
}

- (void)cancelLockAssertion
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUManagerEngine_cancelLockAssertion__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __38__SUManagerEngine_cancelLockAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelLockAssertion");
}

- (void)_queue_cancelLockAssertion
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[SUManagerEngine engineFSM](self, "engineFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_lockAssertion)
  {
    SULogInfo(CFSTR("Canceled lock assertion"), v5, v6, v7, v8, v9, v10, v11, v12);
    CFRelease(self->_lockAssertion);
    self->_lockAssertion = 0;
  }
}

- (id)updatePolicy
{
  return -[SUPolicyFactory corePolicy](self->_policyFactory, "corePolicy");
}

- (id)rollbackPolicy
{
  return -[SUPolicyFactory rollbackPolicy](self->_policyFactory, "rollbackPolicy");
}

- (void)resetPolicy
{
  SUPolicyFactory *v3;
  SUPolicyFactory *policyFactory;

  v3 = objc_alloc_init(SUPolicyFactory);
  policyFactory = self->_policyFactory;
  self->_policyFactory = v3;

}

- (void)notifyRollbackStarted:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUManagerEngine managerDelegate](self, "managerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__SUManagerEngine_notifyRollbackStarted___block_invoke;
    v12[3] = &unk_24CE3B610;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    -[SUManagerEngine engineLog](self, "engineLog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SUManagerEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_2128D9000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackStarted:) so not reporting", buf, 0xCu);

    }
  }

}

void __41__SUManagerEngine_notifyRollbackStarted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackStarted:", *(_QWORD *)(a1 + 40));

}

+ (int)softwareUpdateTypeForDescriptor:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "splatOnly") & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    v5 = objc_msgSend(v3, "updateType");
    if ((unint64_t)(v5 - 1) <= 2)
      v4 = v5;
    else
      v4 = 0;
  }

  return v4;
}

+ (unint64_t)SUCoreAudienceTypeToSUSAudienceType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (unint64_t)SUCorePreferredTypeToSUSPreferenceType:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (unint64_t)upgradeTypeForCoreDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isMinorOSUpdate:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "productBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isMajorOSUpdate:", v8);

    if (v9)
      v7 = 2;
    else
      v7 = 0;
  }

  return v7;
}

- (id)SUOperationProgressFromSUCoreProgress:(id)a3
{
  id v3;
  SUOperationProgress *v4;
  void *v5;
  int v6;
  float v7;
  __CFString **v8;
  void *v9;
  int v10;
  int v11;
  __CFString **v12;
  void *v13;
  int v14;
  float v15;
  double v16;

  v3 = a3;
  v4 = objc_alloc_init(SUOperationProgress);
  objc_msgSend(v3, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEAEBF0]);

  if (v6)
  {
    objc_msgSend(v3, "portionComplete");
    if (v7 == 1.0)
    {
      v8 = kSUDownloadPhaseBrainExtracting;
LABEL_11:
      -[SUOperationProgress setPhase:](v4, "setPhase:", *v8);
      goto LABEL_12;
    }
    v11 = objc_msgSend(v3, "isStalled");
    v8 = kSUDownloadPhaseBrainFetching;
    v12 = kSUDownloadPhaseBrainFetchingStalled;
LABEL_9:
    if (v11)
      v8 = v12;
    goto LABEL_11;
  }
  objc_msgSend(v3, "phase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEAEBE8]);

  if (v10)
  {
    v11 = objc_msgSend(v3, "isStalled");
    v8 = kSUDownloadPhaseUpdateFetching;
    v12 = kSUDownloadPhaseUpdateFetchingStalled;
    goto LABEL_9;
  }
  objc_msgSend(v3, "phase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEAEBF8]);

  if (v14)
  {
    v8 = kSUDownloadPhasePreparingForInstallation;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v3, "portionComplete");
  -[SUOperationProgress setIsDone:](v4, "setIsDone:", v15 == 1.0);
  objc_msgSend(v3, "portionComplete");
  -[SUOperationProgress setPercentComplete:](v4, "setPercentComplete:");
  objc_msgSend(v3, "estimatedTimeRemaining");
  -[SUOperationProgress setTimeRemaining:](v4, "setTimeRemaining:");
  LODWORD(v16) = -1.0;
  -[SUOperationProgress setNormalizedPercentComplete:](v4, "setNormalizedPercentComplete:", v16);

  return v4;
}

+ (id)SUDescriptorFromCoreDescriptor:(id)a3
{
  id v4;
  SUDescriptor *v5;
  void *v6;
  SUDocumentation *v7;
  void *v8;
  SUDocumentation *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SUDescriptor);
    objc_msgSend(v4, "documentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SUDocumentation alloc];
      objc_msgSend(v4, "documentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SUDocumentation initWithSUCoreDocumentation:](v7, "initWithSUCoreDocumentation:", v8);
      -[SUDescriptor setDocumentation:](v5, "setDocumentation:", v9);

    }
    objc_msgSend(v4, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPublisher:](v5, "setPublisher:", v10);

    objc_msgSend(v4, "productSystemName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductSystemName:](v5, "setProductSystemName:", v11);

    objc_msgSend(v4, "productVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductVersion:](v5, "setProductVersion:", v12);

    objc_msgSend(v4, "productVersionExtra");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductVersionExtra:](v5, "setProductVersionExtra:", v13);

    objc_msgSend(v4, "productBuildVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v14);

    objc_msgSend(v4, "prerequisiteBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPrerequisiteBuild:](v5, "setPrerequisiteBuild:", v15);

    objc_msgSend(v4, "prerequisiteOSVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPrerequisiteOS:](v5, "setPrerequisiteOS:", v16);

    objc_msgSend(v4, "releaseType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setReleaseType:](v5, "setReleaseType:", v17);

    -[SUDescriptor setDownloadSize:](v5, "setDownloadSize:", objc_msgSend(v4, "downloadSize"));
    -[SUDescriptor _setUnarchiveSize:](v5, "_setUnarchiveSize:", objc_msgSend(v4, "unarchivedSize"));
    -[SUDescriptor _setMsuPrepareSize:](v5, "_setMsuPrepareSize:", objc_msgSend(v4, "msuPrepareSize"));
    -[SUDescriptor setInstallationSize:](v5, "setInstallationSize:", objc_msgSend(v4, "installationSize"));
    -[SUDescriptor setMinimumSystemPartitionSize:](v5, "setMinimumSystemPartitionSize:", objc_msgSend(v4, "minimumSystemPartitionSize"));
    -[SUDescriptor setPreparationSize:](v5, "setPreparationSize:", objc_msgSend(v4, "preparationSize"));
    -[SUDescriptor setTotalRequiredFreeSpace:](v5, "setTotalRequiredFreeSpace:", objc_msgSend(v4, "totalRequiredFreeSpace"));
    -[SUDescriptor _setStreamingZipCapable:](v5, "_setStreamingZipCapable:", objc_msgSend(v4, "streamingZipCapable"));
    -[SUDescriptor setUpdateType:](v5, "setUpdateType:", objc_msgSend(a1, "softwareUpdateTypeForDescriptor:", v4));
    -[SUDescriptor setAutoDownloadAllowableForCellular:](v5, "setAutoDownloadAllowableForCellular:", objc_msgSend(v4, "autoDownloadAllowableOverCellular"));
    -[SUDescriptor setDownloadableOverCellular:](v5, "setDownloadableOverCellular:", objc_msgSend(v4, "downloadAllowableOverCellular"));
    -[SUDescriptor setDownloadable:](v5, "setDownloadable:", objc_msgSend(v4, "downloadable"));
    -[SUDescriptor _setDisableSiriVoiceDeletion:](v5, "_setDisableSiriVoiceDeletion:", objc_msgSend(v4, "disableSiriVoiceDeletion"));
    -[SUDescriptor _setDisableCDLevel4:](v5, "_setDisableCDLevel4:", objc_msgSend(v4, "disableCDLevel4"));
    -[SUDescriptor _setDisableAppDemotion:](v5, "_setDisableAppDemotion:", objc_msgSend(v4, "disableAppDemotion"));
    -[SUDescriptor _setDisableInstallTonight:](v5, "_setDisableInstallTonight:", objc_msgSend(v4, "disableInstallTonight"));
    -[SUDescriptor setRampEnabled:](v5, "setRampEnabled:", objc_msgSend(v4, "rampEnabled"));
    -[SUDescriptor setGranularlyRamped:](v5, "setGranularlyRamped:", objc_msgSend(v4, "granularlyRamped"));
    -[SUDescriptor setCriticalOutOfBoxOnly:](v5, "setCriticalOutOfBoxOnly:", objc_msgSend(v4, "criticalOutOfBoxOnly"));
    -[SUDescriptor setAutoUpdateEnabled:](v5, "setAutoUpdateEnabled:", objc_msgSend(v4, "autoUpdateEnabled"));
    objc_msgSend(v4, "setupCritical");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSetupCritical:](v5, "setSetupCritical:", v18);

    objc_msgSend(v4, "criticalOverrideCellularPolicy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setCriticalDownloadPolicy:](v5, "setCriticalDownloadPolicy:", v19);

    objc_msgSend(v4, "systemPartitionPadding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSystemPartitionPadding:](v5, "setSystemPartitionPadding:", v20);

    objc_msgSend(v4, "sepDigest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSEPDigest:](v5, "setSEPDigest:", v21);

    objc_msgSend(v4, "rsepDigest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setRSEPDigest:](v5, "setRSEPDigest:", v22);

    objc_msgSend(v4, "sepTBMDigests");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSEPTBMDigest:](v5, "setSEPTBMDigest:", v23);

    objc_msgSend(v4, "rsepTBMDigests");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setRSEPTBMDigest:](v5, "setRSEPTBMDigest:", v24);

    objc_msgSend(v4, "releaseDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setReleaseDate:](v5, "setReleaseDate:", v25);

    -[SUDescriptor setMdmDelayInterval:](v5, "setMdmDelayInterval:", objc_msgSend(v4, "mdmDelayInterval"));
    objc_msgSend(v4, "assetID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setAssetID:](v5, "setAssetID:", v26);

    -[SUDescriptor setAudienceType:](v5, "setAudienceType:", objc_msgSend(a1, "SUCoreAudienceTypeToSUSAudienceType:", objc_msgSend(v4, "descriptorAudienceType")));
    -[SUDescriptor setPreferenceType:](v5, "setPreferenceType:", objc_msgSend(a1, "SUCorePreferredTypeToSUSPreferenceType:", objc_msgSend(v4, "preferredUpdateType")));
    -[SUDescriptor setUpgradeType:](v5, "setUpgradeType:", objc_msgSend(a1, "upgradeTypeForCoreDescriptor:", v4));
    -[SUDescriptor setPromoteAlternateUpdate:](v5, "setPromoteAlternateUpdate:", objc_msgSend(v4, "promoteAlternateUpdate"));
    -[SUDescriptor setHideInstallAlert:](v5, "setHideInstallAlert:", objc_msgSend(a1, "shouldHideInstallAlertForCoreDescriptor:", v4));
    -[SUDescriptor setIsSplatOnly:](v5, "setIsSplatOnly:", objc_msgSend(v4, "splatOnly"));
    objc_msgSend(v4, "humanReadableUpdateName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setHumanReadableUpdateName:](v5, "setHumanReadableUpdateName:", v27);

    -[SUDescriptor setMandatoryUpdateEligible:](v5, "setMandatoryUpdateEligible:", objc_msgSend(v4, "mandatoryUpdateEligible"));
    objc_msgSend(v4, "mandatoryUpdateVersionMin");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMandatoryUpdateVersionMin:](v5, "setMandatoryUpdateVersionMin:", v28);

    objc_msgSend(v4, "mandatoryUpdateVersionMax");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMandatoryUpdateVersionMax:](v5, "setMandatoryUpdateVersionMax:", v29);

    -[SUDescriptor setMandatoryUpdateOptional:](v5, "setMandatoryUpdateOptional:", objc_msgSend(v4, "mandatoryUpdateOptional"));
    -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v5, "setMandatoryUpdateRestrictedToOutOfTheBox:", objc_msgSend(v4, "mandatoryUpdateRestrictedToOutOfTheBox"));
    -[SUDescriptor setForcePasscodeRequired:](v5, "setForcePasscodeRequired:", objc_msgSend(v4, "forcePasscodeRequired"));
    -[SUDescriptor setAllowAutoDownloadOnBattery:](v5, "setAllowAutoDownloadOnBattery:", objc_msgSend(v4, "allowAutoDownloadOnBattery"));
    -[SUDescriptor setAutoDownloadOnBatteryDelay:](v5, "setAutoDownloadOnBatteryDelay:", objc_msgSend(v4, "autoDownloadOnBatteryDelay"));
    -[SUDescriptor setAutoDownloadOnBatteryMinBattery:](v5, "setAutoDownloadOnBatteryMinBattery:", objc_msgSend(v4, "autoDownloadOnBatteryMinBattery"));
    objc_msgSend(v4, "associatedSplatDescriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setIsSplombo:](v5, "setIsSplombo:", v30 != 0);

    objc_msgSend(v4, "associatedSplatDescriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "productBuildVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSplatComboBuildVersion:](v5, "setSplatComboBuildVersion:", v32);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)SUDescriptorFromRollbackDescriptor:(id)a3
{
  id v3;
  SUDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SUDescriptor);
    objc_msgSend(v3, "productBuildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductBuildVersion:](v4, "setProductBuildVersion:", v5);

    objc_msgSend(v3, "productVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductVersion:](v4, "setProductVersion:", v6);

    objc_msgSend(v3, "releaseType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUDescriptor setReleaseType:](v4, "setReleaseType:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)shouldHideInstallAlertForCoreDescriptor:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  if (objc_msgSend(v3, "hideInstallAlert") == 2)
  {
    +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Beta"));

    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "productVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[SUAssetSupport updateIsPreCRelease:](SUAssetSupport, "updateIsPreCRelease:", v7);

      SULogInfo(CFSTR("%s: Current release type is not developer, overriding HideInstallAlert to: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"+[SUManagerEngine shouldHideInstallAlertForCoreDescriptor:]");
    }
  }
  else
  {
    v6 = objc_msgSend(v3, "hideInstallAlert") != 0;
  }

  return v6;
}

+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4
{
  return +[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:", a3, a4, 0);
}

+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4 comparisonFlags:(unint64_t)a5
{
  char v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL result;
  char v28;

  if (!((unint64_t)a3 | (unint64_t)a4))
    return 1;
  v5 = a5;
  v7 = (void *)MEMORY[0x24BEAEA28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "prerequisiteBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prerequisiteBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v7, "stringIsEqual:to:", v10, v11);

  v12 = (void *)MEMORY[0x24BEAEA28];
  objc_msgSend(v9, "prerequisiteOS");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prerequisiteOSVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v12, "stringIsEqual:to:", v13, v14);

  v15 = (void *)MEMORY[0x24BEAEA28];
  objc_msgSend(v9, "releaseType");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "releaseType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "stringIsEqual:to:", v16, v17);

  objc_msgSend(v9, "productSystemName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productSystemName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v18, "isEqualToString:", v19);

  objc_msgSend(v9, "productVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  objc_msgSend(v9, "productBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productBuildVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v23, "isEqualToString:", v24);

  v25 = objc_msgSend(v9, "downloadSize");
  v26 = objc_msgSend(v8, "downloadSize");

  result = v28 & v12 & v15 & v16 & v22 & v7;
  if ((v5 & 1) == 0 && v25 != v26)
    return 0;
  return result;
}

+ (id)rollbackDescriptorForSUCoreRollbackDescriptor:(id)a3
{
  id v3;
  SURollbackDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SURollbackDescriptor);
    objc_msgSend(v3, "restoreVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setRestoreVersion:](v4, "setRestoreVersion:", v5);

    objc_msgSend(v3, "productVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setProductVersion:](v4, "setProductVersion:", v6);

    objc_msgSend(v3, "productBuildVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackDescriptor setProductBuildVersion:](v4, "setProductBuildVersion:", v7);

    objc_msgSend(v3, "releaseType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SURollbackDescriptor setReleaseType:](v4, "setReleaseType:", v8);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SUCoreScan)activeScanner
{
  return self->_activeScanner;
}

- (void)setActiveScanner:(id)a3
{
  objc_storeStrong((id *)&self->_activeScanner, a3);
}

- (BOOL)isManagedScan
{
  return self->_isManagedScan;
}

- (void)setIsManagedScan:(BOOL)a3
{
  self->_isManagedScan = a3;
}

- (SUManagerEngineParam)pendingManagedScanParams
{
  return self->_pendingManagedScanParams;
}

- (void)setPendingManagedScanParams:(id)a3
{
  objc_storeStrong((id *)&self->_pendingManagedScanParams, a3);
}

- (SUManagerEngineParam)pendingPurgeParams
{
  return self->_pendingPurgeParams;
}

- (void)setPendingPurgeParams:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPurgeParams, a3);
}

- (SUManagerEngineDelegate)managerDelegate
{
  return (SUManagerEngineDelegate *)objc_loadWeakRetained((id *)&self->_managerDelegate);
}

- (SUCoreLog)engineLog
{
  return self->_engineLog;
}

- (NSString)engineName
{
  return self->_engineName;
}

- (SUCoreUpdate)updateControl
{
  return self->_updateControl;
}

- (void)setUpdateControl:(id)a3
{
  objc_storeStrong((id *)&self->_updateControl, a3);
}

- (SUManagerEngineDownloadDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (void)setDownloadDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDescriptor, a3);
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)engineFSM
{
  return self->_engineFSM;
}

- (void)setEngineFSM:(id)a3
{
  objc_storeStrong((id *)&self->_engineFSM, a3);
}

- (BOOL)activating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (unint64_t)loadBrainRetries
{
  return self->_loadBrainRetries;
}

- (void)setLoadBrainRetries:(unint64_t)a3
{
  self->_loadBrainRetries = a3;
}

- (__MKBAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(__MKBAssertion *)a3
{
  self->_lockAssertion = a3;
}

- (NSString)rollbackUUID
{
  return self->_rollbackUUID;
}

- (void)setRollbackUUID:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackUUID, a3);
}

- (SUPolicyFactory)policyFactory
{
  return self->_policyFactory;
}

- (void)setPolicyFactory:(id)a3
{
  objc_storeStrong((id *)&self->_policyFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyFactory, 0);
  objc_storeStrong((id *)&self->_rollbackUUID, 0);
  objc_storeStrong((id *)&self->_engineFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_updateControl, 0);
  objc_storeStrong((id *)&self->_engineName, 0);
  objc_storeStrong((id *)&self->_engineLog, 0);
  objc_destroyWeak((id *)&self->_managerDelegate);
  objc_storeStrong((id *)&self->_pendingPurgeParams, 0);
  objc_storeStrong((id *)&self->_pendingManagedScanParams, 0);
  objc_storeStrong((id *)&self->_activeScanner, 0);
}

@end
