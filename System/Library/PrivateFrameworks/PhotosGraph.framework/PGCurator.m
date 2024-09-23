@implementation PGCurator

- (PGCurator)init
{
  PGCurator *v2;
  PGCurator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCurator;
  v2 = -[PGCurator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_loggingConnection, MEMORY[0x1E0C81028]);
  return v3;
}

- (id)focusedItemsInItems:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  char v19;
  BOOL v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "personLocalIdentifiersToFocus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "focusOnInterestingItems");

  v9 = objc_msgSend(v7, "count");
  if ((v8 & 1) != 0 || v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __45__PGCurator_focusedItemsInItems_withOptions___block_invoke;
    v17 = &unk_1E8428DE8;
    v19 = v8;
    v20 = v9 != 0;
    v18 = v7;
    objc_msgSend(v11, "predicateWithBlock:", &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v12, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)targetDurationBasedNumberOfItemsToElectFromItems:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *loggingConnection;
  NSObject *v32;
  PGCurator *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uuidsOfEligibleAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDuration");
  v10 = v9;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v12)
  {
    v13 = v12;
    v34 = self;
    v35 = v7;
    v14 = 0;
    v36 = 0;
    v37 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v39;
    v17 = *MEMORY[0x1E0D77DE0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "clsIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v8, "containsObject:", v20);

          if (!v21)
            continue;
        }
        objc_msgSend(v19, "clsContentScore", v34);
        if (v22 >= v17)
        {
          ++v15;
          if (objc_msgSend(v19, "isVideo"))
          {
            ++v14;
          }
          else if (objc_msgSend(v19, "clsIsInterestingLivePhoto"))
          {
            ++v37;
          }
          else
          {
            ++v36;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v13);

    self = v34;
    v7 = v35;
    if (v15)
    {
      v23 = v10 * (double)v15;
      objc_msgSend(v35, "defaultDurationOfStillPhoto");
      v25 = v24;
      objc_msgSend(v35, "defaultDurationOfLivePhoto");
      v27 = v26 * (double)v37 + v25 * (double)v36;
      objc_msgSend(v35, "defaultDurationOfVideo");
      v29 = vcvtad_u64_f64(v23 / (v27 + v28 * (double)v14));
      if (v15 >= v29)
        v30 = v29;
      else
        v30 = v15;
      loggingConnection = v34->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219008;
        v43 = v30;
        v44 = 2048;
        v45 = v15;
        v46 = 2048;
        v47 = v36;
        v48 = 2048;
        v49 = v37;
        v50 = 2048;
        v51 = v14;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "targetNumberOfItemsToElect = %lu for %lu eligible items, %lu still photos, %lu live photos, %lu videos", buf, 0x34u);
      }
      goto LABEL_26;
    }
  }
  else
  {

  }
  v32 = self->_loggingConnection;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "targetNumberOfItemsToElect = 0 because all items are non-eligible", buf, 2u);
  }
  v30 = 0;
LABEL_26:

  return v30;
}

- (double)evaluatedDurationWithItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isVideo"))
        {
          objc_msgSend(v6, "defaultDurationOfVideo");
          v14 = v13;
          objc_msgSend(v12, "clsDuration");
          if (v14 < v15)
            v15 = v14;
        }
        else if (objc_msgSend(v12, "clsIsInterestingLivePhoto"))
        {
          objc_msgSend(v6, "defaultDurationOfLivePhoto");
        }
        else
        {
          objc_msgSend(v6, "defaultDurationOfStillPhoto");
        }
        v10 = v10 + v15;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)maximumDurationWithItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isVideo"))
        {
          objc_msgSend(v12, "clsDuration");
        }
        else if (objc_msgSend(v12, "clsIsInterestingLivePhoto"))
        {
          objc_msgSend(v6, "defaultDurationOfLivePhoto");
        }
        else
        {
          objc_msgSend(v6, "defaultDurationOfStillPhoto");
        }
        v10 = v10 + v13;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)summarizedItemsFromCluster:(id)a3 withBeautifier:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *loggingConnection;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "numberOfItemsToElect");
  objc_msgSend(v13, "cluster");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "cluster");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "debugInfoForCluster:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", v16, v14, v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    v22 = loggingConnection;
    v23 = 134218496;
    v24 = objc_msgSend(v16, "count");
    v25 = 2048;
    v26 = v14;
    v27 = 2048;
    v28 = objc_msgSend(v19, "count");
    _os_log_debug_impl(&dword_1CA237000, v22, OS_LOG_TYPE_DEBUG, "Curated Items: summarize cluster of %lu items, expected to elect %lu, got %lu", (uint8_t *)&v23, 0x20u);

  }
  return v19;
}

- (id)bestItemsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  void (**v10)(void *, _QWORD *, double);
  double Current;
  char v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSObject *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  PGUnfairLock *v68;
  size_t v69;
  id v70;
  void (**v71)(void *, _QWORD *, double);
  id v72;
  id v73;
  NSObject *v74;
  int v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void (**v85)(_QWORD, _QWORD, double);
  int v86;
  unint64_t v87;
  NSObject *v88;
  uint64_t v89;
  int v90;
  unint64_t v91;
  void (**v92)(_QWORD, _QWORD, double);
  void *v93;
  size_t v94;
  id v95;
  id v96;
  id v97;
  int v98;
  NSObject *v99;
  id v100;
  double v101;
  char v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  char v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  id v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t k;
  void *v122;
  double v123;
  NSObject *v124;
  NSObject *v125;
  int v126;
  __CFString *v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t m;
  void *v133;
  double v134;
  char v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  NSObject *v141;
  id v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  double v149;
  _BOOL4 v150;
  _BOOL4 v151;
  BOOL v152;
  BOOL v153;
  __CFString *v154;
  __CFString *v155;
  NSObject *v156;
  uint64_t v157;
  double v158;
  char v159;
  NSObject *v160;
  id v161;
  uint64_t v162;
  unint64_t v163;
  double v164;
  char v165;
  NSObject *v166;
  id v167;
  double v168;
  char v169;
  NSObject *v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  id v175;
  unint64_t v176;
  id v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  NSObject *v183;
  uint64_t v184;
  int v185;
  unint64_t v186;
  unint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  NSObject *v192;
  id v193;
  double v194;
  char v195;
  NSObject *v196;
  id v197;
  unint64_t v198;
  void *v199;
  NSObject *v200;
  id v201;
  double v202;
  char v203;
  NSObject *v204;
  id v205;
  void *v206;
  double v207;
  char v208;
  NSObject *v209;
  id v210;
  void *v211;
  int v212;
  int v213;
  void *v214;
  void *v215;
  void (**v216)(_QWORD, _QWORD, double);
  int v217;
  int v218;
  PGUnfairLock *v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  unint64_t v225;
  void *v226;
  uint64_t v227;
  int v228;
  unsigned int v229;
  id v230;
  void *v231;
  id v232;
  void *context;
  void (**v234)(void *, _QWORD *, double);
  id v235;
  PGCurator *v236;
  id v237;
  void *v238;
  id v239;
  id v240;
  void *v241;
  _QWORD v242[4];
  id v243;
  uint64_t *v244;
  uint64_t *v245;
  uint64_t v246;
  _QWORD v247[4];
  id v248;
  uint64_t *v249;
  uint64_t *v250;
  uint64_t v251;
  _QWORD v252[4];
  __CFString *v253;
  uint64_t *v254;
  uint64_t *v255;
  uint64_t v256;
  _QWORD v257[4];
  void (**v258)(_QWORD, _QWORD, double);
  uint64_t *v259;
  uint64_t *v260;
  uint64_t v261;
  _QWORD v262[4];
  void (**v263)(_QWORD, _QWORD, double);
  uint64_t *v264;
  uint64_t *v265;
  uint64_t v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  _QWORD v271[4];
  void (**v272)(_QWORD, _QWORD, double);
  uint64_t *v273;
  uint64_t *v274;
  uint64_t v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  char v280;
  _QWORD v281[4];
  PGUnfairLock *v282;
  id v283;
  PGCurator *v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  void (**v290)(_QWORD, _QWORD, double);
  uint64_t *v291;
  uint64_t *v292;
  uint64_t v293;
  _QWORD v294[4];
  id v295;
  uint64_t *v296;
  uint64_t *v297;
  uint64_t v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  _QWORD block[4];
  id v304;
  PGUnfairLock *v305;
  PGCurator *v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  uint64_t *v314;
  uint64_t *v315;
  uint64_t *v316;
  uint64_t *v317;
  uint64_t *v318;
  uint64_t v319;
  char v320;
  uint64_t v321;
  uint64_t *v322;
  uint64_t v323;
  uint64_t (*v324)(uint64_t, uint64_t);
  void (*v325)(uint64_t);
  id v326;
  uint64_t v327;
  uint64_t *v328;
  uint64_t v329;
  uint64_t (*v330)(uint64_t, uint64_t);
  void (*v331)(uint64_t);
  id v332;
  uint64_t v333;
  uint64_t *v334;
  uint64_t v335;
  uint64_t v336;
  _QWORD v337[4];
  void (**v338)(void *, _QWORD *, double);
  uint64_t *v339;
  uint64_t *v340;
  uint64_t v341;
  _QWORD v342[4];
  id v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  uint64_t v352;
  double *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t *v357;
  uint64_t v358;
  char v359;
  uint8_t v360[128];
  uint8_t buf[4];
  _BYTE v362[30];
  _BYTE v363[10];
  uint64_t v364;
  __int16 v365;
  int v366;
  _BYTE v367[128];
  _BYTE v368[128];
  void *v369;
  _BYTE v370[128];
  _BYTE v371[128];
  uint64_t v372;

  v372 = *MEMORY[0x1E0C80C00];
  v239 = a3;
  v240 = a4;
  v237 = a5;
  v235 = a6;
  v10 = (void (**)(void *, _QWORD *, double))_Block_copy(v235);
  v356 = 0;
  v357 = &v356;
  v358 = 0x2020000000;
  v359 = 0;
  v352 = 0;
  v353 = (double *)&v352;
  v354 = 0x2020000000;
  v355 = 0;
  if (v10)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v353[3] >= 0.01)
    {
      v353[3] = Current;
      LOBYTE(v327) = 0;
      v10[2](v10, &v327, 0.0);
      v12 = *((_BYTE *)v357 + 24) | v327;
      *((_BYTE *)v357 + 24) = v12;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 155;
          *(_WORD *)&v362[4] = 2080;
          *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_11;
      }
    }
  }
  if (objc_msgSend(v239, "numberOfItems"))
  {
    v236 = self;
    v234 = v10;
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v13 = objc_msgSend(v240, "sharingFilter");
    if (v13)
    {
      if (v13 == 1)
      {
        objc_msgSend(v239, "sharedItems");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v238, "count");
      }
      else if (v13 == 2)
      {
        objc_msgSend(v239, "allItems");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v238, "count");
      }
      else
      {
        v238 = 0;
        v14 = objc_msgSend(0, "count");
      }
    }
    else
    {
      objc_msgSend(v239, "privateItems");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v238, "count");
    }
    if (!v14)
    {
      v15 = MEMORY[0x1E0C9AA60];
LABEL_97:

      objc_autoreleasePoolPop(context);
      v10 = v234;
      goto LABEL_98;
    }
    objc_msgSend(v240, "uuidsOfEligibleAssets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = objc_msgSend(v240, "identicalDedupingIsEnabled");
    objc_msgSend(v240, "uuidsOfRequiredAssets");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v241, "count");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v17);
    if (v17)
    {
      v351 = 0u;
      v350 = 0u;
      v349 = 0u;
      v348 = 0u;
      v19 = v238;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v348, v371, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v349;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v349 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v348 + 1) + 8 * i);
            objc_msgSend(v23, "clsIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v241, "containsObject:", v24))
            {
              if (v16 && (objc_msgSend(v16, "containsObject:", v24) & 1) == 0)
              {
                v25 = v236->_loggingConnection;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v362 = v24;
                  _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "Required item %@ is not part of eligible items", buf, 0xCu);
                }

              }
              objc_msgSend(v18, "addObject:", v23);
              if (objc_msgSend(v18, "count") == v17)
              {

                goto LABEL_34;
              }
            }

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v348, v371, 16);
          if (v20)
            continue;
          break;
        }
      }
LABEL_34:

      if (v237)
      {
        objc_msgSend(v237, "setAgent:", CFSTR("Curator"));
        objc_msgSend(v237, "setStage:", CFSTR("Required Items"));
        objc_msgSend(v237, "setState:ofItems:withReason:", 4, v18, CFSTR("Items are required"));
      }
    }
    -[PGCurator focusedItemsInItems:withOptions:](v236, "focusedItemsInItems:withOptions:", v238, v240);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
    {
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "setByAddingObjectsFromArray:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allObjects");
        v28 = objc_claimAutoreleasedReturnValue();

        v26 = (id)v28;
      }
      if (v237)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "chooseItems:inItems:withReason:", v29, v238, CFSTR("Focused Items"));

      }
      v26 = v26;

      v30 = v26;
    }
    else
    {
      v30 = v238;
    }
    v238 = v30;
    v31 = objc_msgSend(v30, "count");
    if (!v31)
    {
      v15 = MEMORY[0x1E0C9AA60];
LABEL_96:

      goto LABEL_97;
    }
    v32 = v31;
    if (v16)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v31);
      v347 = 0u;
      v346 = 0u;
      v345 = 0u;
      v344 = 0u;
      v34 = v238;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v344, v370, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v345;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v345 != v36)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v344 + 1) + 8 * j), "clsIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v38);

          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v344, v370, 16);
        }
        while (v35);
      }

      objc_msgSend(v33, "intersectSet:", v16);
      v232 = v33;

    }
    else
    {
      v232 = 0;
    }
    v227 = objc_msgSend(v240, "duration");
    v39 = objc_msgSend(v240, "includesAllFaces");
    v40 = objc_msgSend(v240, "useDurationBasedCuration");
    if (v40)
    {
      -[PGCurator maximumDurationWithItems:options:](v236, "maximumDurationWithItems:options:", v238, v240);
      v42 = v41;
      objc_msgSend(v240, "minimumDuration");
      v44 = v43;
      if (v43 > 0.0 && v42 < v43)
      {
        v45 = v236->_loggingConnection;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)v362 = v42;
          *(_WORD *)&v362[8] = 2048;
          *(double *)&v362[10] = v44;
          _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "DurationEvaluation: maximumDuration with all items is %f, cannot match minimum duration %f", buf, 0x16u);
        }

        if ((objc_msgSend(v240, "failIfMinimumDurationNotReached") & 1) != 0)
        {
          v15 = MEMORY[0x1E0C9AA60];
LABEL_95:
          v16 = v232;
          goto LABEL_96;
        }
      }
      v46 = -[PGCurator targetDurationBasedNumberOfItemsToElectFromItems:options:](v236, "targetDurationBasedNumberOfItemsToElectFromItems:options:", v238, v240);
    }
    else if (objc_msgSend(v240, "targetNumberOfItems"))
    {
      v46 = objc_msgSend(v240, "targetNumberOfItems");
    }
    else
    {
      objc_msgSend(v239, "universalEndDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "universalStartDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "timeIntervalSinceDate:", v48);
      v50 = v49;

      v46 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsToElectWithTotalNumberOfItems:spanningNumberOfDays:options:", v32, v240, v50 / 86400.0);
    }
    v51 = v46;
    if (v46 <= objc_msgSend(v18, "count"))
    {
      -[PGCurator defaultItemSortDescriptors](v236, "defaultItemSortDescriptors");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sortedArrayUsingDescriptors:", v57);
      v15 = objc_claimAutoreleasedReturnValue();

      goto LABEL_95;
    }
    v52 = objc_msgSend(v232, "count");
    v53 = objc_msgSend(v240, "skipCurationIfEligibleItemsFitTargetDuration");
    if (v232)
      v54 = v53;
    else
      v54 = 0;
    if (v54 == 1 && v51 + 2 >= v52)
    {
      v55 = (void *)MEMORY[0x1E0CB3880];
      v342[0] = MEMORY[0x1E0C809B0];
      v342[1] = 3221225472;
      v342[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke;
      v342[3] = &unk_1E8428E10;
      v343 = v232;
      objc_msgSend(v55, "predicateWithBlock:", v342);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "filteredArrayUsingPredicate:", v56);
      v15 = objc_claimAutoreleasedReturnValue();

      goto LABEL_95;
    }
    v225 = v51;
    +[PGCurationManager summaryClusteringForDuration:](PGCurationManager, "summaryClusteringForDuration:", v227);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v240, "shouldSkipClustering") & 1) != 0)
    {
      v58 = objc_alloc(MEMORY[0x1E0D4B270]);
      objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", v238);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v58, "initWithCluster:numberOfItemsToElect:", v59, v51);
      v369 = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v369, 1);
      v226 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v337[0] = MEMORY[0x1E0C809B0];
      v337[1] = 3221225472;
      v337[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2;
      v337[3] = &unk_1E8434F30;
      v338 = v234;
      v339 = &v352;
      v341 = 0x3F847AE147AE147BLL;
      v340 = &v356;
      objc_msgSend(v231, "performWithItems:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:", v238, v232, v51, v237, v337);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v338;
    }

    v61 = v236->_loggingConnection;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = objc_msgSend(v238, "count");
      v63 = objc_msgSend(v226, "count");
      *(_DWORD *)buf = 134219008;
      *(_QWORD *)v362 = v62;
      *(_WORD *)&v362[8] = 1024;
      *(_DWORD *)&v362[10] = v40;
      *(_WORD *)&v362[14] = 2048;
      *(_QWORD *)&v362[16] = v51;
      *(_WORD *)&v362[24] = 1024;
      *(_DWORD *)&v362[26] = v39;
      *(_WORD *)v363 = 2048;
      *(_QWORD *)&v363[2] = v63;
      _os_log_impl(&dword_1CA237000, v61, OS_LOG_TYPE_INFO, "Curated Items: feederCount:%ld durationBased:%d maximumNumberOfItems:%ld includeAllFaces:%d clustersCount:%ld", buf, 0x2Cu);
    }

    if (*((_BYTE *)v357 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 302;
        *(_WORD *)&v362[4] = 2080;
        *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v15 = MEMORY[0x1E0C9AA60];
      goto LABEL_94;
    }
    if (!objc_msgSend(v226, "count"))
    {
      -[PGCurator defaultItemSortDescriptors](v236, "defaultItemSortDescriptors");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sortedArrayUsingDescriptors:", v67);
      v15 = objc_claimAutoreleasedReturnValue();

LABEL_94:
      goto LABEL_95;
    }
    +[PGCurationManager assetsBeautifier](PGCurationManager, "assetsBeautifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setIdentifiersOfRequiredItems:", v241);
    objc_msgSend(v64, "setIdentifiersOfEligibleItems:", v232);
    objc_msgSend(v64, "setDiscardNonEligibleClustersInSampling:", v232 != 0);
    objc_msgSend(v64, "setEnableIntermediateNaturalClustering:", v229);
    objc_msgSend(v64, "setEnableFinalNaturalClustering:", v229);
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v217 = v39;
    v218 = v40;
    if (v40)
    {
      v221 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      v223 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v66 = v226;
    }
    else
    {
      v66 = v226;
      v221 = 0;
      v223 = 0;
    }
    v333 = 0;
    v334 = &v333;
    v335 = 0x2020000000;
    v336 = 0;
    v327 = 0;
    v328 = &v327;
    v329 = 0x3032000000;
    v330 = __Block_byref_object_copy__10157;
    v331 = __Block_byref_object_dispose__10158;
    v332 = 0;
    v321 = 0;
    v322 = &v321;
    v323 = 0x3032000000;
    v324 = __Block_byref_object_copy__10157;
    v325 = __Block_byref_object_dispose__10158;
    v326 = 0;
    v68 = objc_alloc_init(PGUnfairLock);
    v69 = objc_msgSend(v66, "count");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_146;
    block[3] = &unk_1E8428E60;
    v70 = v66;
    v304 = v70;
    v71 = v234;
    v313 = v71;
    v319 = 0x3F847AE147AE147BLL;
    v314 = &v352;
    v315 = &v356;
    v219 = v68;
    v305 = v219;
    v306 = v236;
    v220 = v64;
    v307 = v220;
    v72 = v237;
    v308 = v72;
    v73 = v240;
    v309 = v73;
    v230 = v65;
    v310 = v230;
    v320 = v218;
    v224 = v223;
    v311 = v224;
    v316 = &v333;
    v222 = v221;
    v312 = v222;
    v317 = &v327;
    v318 = &v321;
    dispatch_apply(v69, 0, block);
    v226 = v66;
    if (*((_BYTE *)v357 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_92:
        v15 = MEMORY[0x1E0C9AA60];
LABEL_93:

        _Block_object_dispose(&v321, 8);
        _Block_object_dispose(&v327, 8);

        _Block_object_dispose(&v333, 8);
        goto LABEL_94;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v362 = 372;
      *(_WORD *)&v362[4] = 2080;
      *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurator.m";
      v74 = MEMORY[0x1E0C81028];
LABEL_91:
      _os_log_impl(&dword_1CA237000, v74, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_92;
    }
    v211 = v70;
    v214 = v72;
    v215 = v73;
    v216 = (void (**)(_QWORD, _QWORD, double))v71;
    v76 = v217;
    if (objc_msgSend(v18, "count"))
    {
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v18);
      v301 = 0u;
      v302 = 0u;
      v299 = 0u;
      v300 = 0u;
      v78 = v230;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v299, v368, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v300;
LABEL_102:
        v81 = 0;
        while (1)
        {
          if (*(_QWORD *)v300 != v80)
            objc_enumerationMutation(v78);
          objc_msgSend(v77, "removeObject:", *(_QWORD *)(*((_QWORD *)&v299 + 1) + 8 * v81));
          if (!objc_msgSend(v77, "count"))
            break;
          if (v79 == ++v81)
          {
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v299, v368, 16);
            if (v79)
              goto LABEL_102;
            break;
          }
        }
      }

      v76 = v217;
      if (objc_msgSend(v77, "count"))
      {
        objc_msgSend(v77, "allObjects");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObjectsFromArray:", v82);

        if (v218)
        {
          objc_msgSend(v77, "allObjects");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "addObjectsFromArray:", v83);

          v84 = objc_msgSend(v77, "count");
          v334[3] += v84;
        }
      }

    }
    v85 = (void (**)(_QWORD, _QWORD, double))v71;
    v86 = objc_msgSend(v230, "count");
    v87 = objc_msgSend(v224, "count");
    if (v87)
    {
      if (v87 >= objc_msgSend(v211, "count"))
      {
        LODWORD(v87) = 0;
      }
      else
      {
        v212 = v86;
        v88 = v236->_loggingConnection;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          v89 = v334[3];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v362 = v87;
          *(_WORD *)&v362[4] = 1024;
          *(_DWORD *)&v362[6] = v89;
          _os_log_impl(&dword_1CA237000, v88, OS_LOG_TYPE_INFO, "DurationEvaluation: Initiating second pass with %d clusters, already have %d items", buf, 0xEu);
        }

        v90 = v76;
        v91 = v225 - v334[3];
        v294[0] = MEMORY[0x1E0C809B0];
        v294[1] = 3221225472;
        v294[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_149;
        v294[3] = &unk_1E8434F30;
        v92 = v216;
        v295 = v92;
        v296 = &v352;
        v298 = 0x3F847AE147AE147BLL;
        v297 = &v356;
        objc_msgSend(v231, "adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:", v224, v232, v91, v214, v294);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "count");
        v281[0] = MEMORY[0x1E0C809B0];
        v281[1] = 3221225472;
        v281[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_150;
        v281[3] = &unk_1E8428E88;
        v290 = v92;
        v282 = v219;
        v291 = &v352;
        v293 = 0x3F847AE147AE147BLL;
        v292 = &v356;
        v95 = v93;
        v283 = v95;
        v284 = v236;
        v285 = v220;
        v286 = v214;
        v287 = v215;
        v96 = v230;
        v288 = v96;
        v97 = v222;
        v289 = v97;
        dispatch_apply(v94, 0, v281);
        v230 = v97;

        v76 = v90;
        v98 = *((unsigned __int8 *)v357 + 24);
        if (*((_BYTE *)v357 + 24))
        {
          v99 = MEMORY[0x1E0C81028];
          v100 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 430;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

        }
        v86 = v212;
        if (v98)
          goto LABEL_92;
        LODWORD(v87) = 1;
        v85 = v216;
      }
    }
    if (v218)
    {
      if (v234)
      {
        v101 = CFAbsoluteTimeGetCurrent();
        if (v101 - v353[3] >= 0.01)
        {
          v353[3] = v101;
          v280 = 0;
          ((void (**)(_QWORD, char *, double))v85)[2](v85, &v280, 0.5);
          v102 = *((_BYTE *)v357 + 24) | v280;
          *((_BYTE *)v357 + 24) = v102;
          if (v102)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_92;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 440;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            v74 = MEMORY[0x1E0C81028];
            goto LABEL_91;
          }
        }
      }
      v228 = v87;
      v213 = v86;
      -[PGCurator defaultItemSortDescriptors](v236, "defaultItemSortDescriptors");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "sortedArrayUsingDescriptors:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      v278 = 0u;
      v279 = 0u;
      v276 = 0u;
      v277 = 0u;
      v113 = v112;
      v114 = -[NSObject countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v276, v367, 16);
      v115 = v26;
      v116 = 0;
      v117 = 0;
      v118 = 0;
      if (v114)
      {
        v119 = *(_QWORD *)v277;
        v120 = *MEMORY[0x1E0D77DE0];
        do
        {
          for (k = 0; k != v114; ++k)
          {
            if (*(_QWORD *)v277 != v119)
              objc_enumerationMutation(v113);
            v122 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * k);
            objc_msgSend(v122, "clsContentScore");
            if (v123 >= v120)
            {
              ++v116;
              if (objc_msgSend(v122, "isVideo"))
                ++v118;
              else
                ++v117;
            }
          }
          v114 = -[NSObject countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v276, v367, 16);
        }
        while (v114);
      }

      v26 = v115;
      v124 = v236->_loggingConnection;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v362 = v116;
        *(_WORD *)&v362[8] = 2048;
        *(_QWORD *)&v362[10] = v117;
        *(_WORD *)&v362[18] = 2048;
        *(_QWORD *)&v362[20] = v118;
        _os_log_impl(&dword_1CA237000, v124, OS_LOG_TYPE_INFO, "DurationEvaluation: elected %lu items, %lu photos, %lu videos", buf, 0x20u);
      }

      v125 = v236->_loggingConnection;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        v126 = objc_msgSend(v238, "count");
        if (v228)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d after second pass"), -[NSObject count](v113, "count"));
          v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v127 = CFSTR("no second pass");
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v362 = v126;
        *(_WORD *)&v362[4] = 1024;
        *(_DWORD *)&v362[6] = v225;
        *(_WORD *)&v362[10] = 1024;
        *(_DWORD *)&v362[12] = v213;
        *(_WORD *)&v362[16] = 2112;
        *(_QWORD *)&v362[18] = v127;
        _os_log_impl(&dword_1CA237000, v125, OS_LOG_TYPE_INFO, "DurationEvaluation: %d total assets, was aiming for %d elected assets, got %d after first pass, %@", buf, 0x1Eu);
        if (v228)

      }
      v143 = objc_msgSend(v215, "minimumNumberOfItems");
      -[PGCurator evaluatedDurationWithItems:options:](v236, "evaluatedDurationWithItems:options:", v113, v215);
      v145 = v144;
      -[PGCurator maximumDurationWithItems:options:](v236, "maximumDurationWithItems:options:", v113, v215);
      v147 = v146;
      objc_msgSend(v215, "minimumDuration");
      v149 = v148;
      v150 = v116 >= v143;
      v151 = v148 <= 0.0;
      if (v147 >= v148)
        v151 = 1;
      v153 = v150 && v151;
      v152 = !v150 || !v151;
      v154 = CFSTR("didn't pass");
      if (!v152)
        v154 = CFSTR("passed");
      v155 = v154;
      v156 = v236->_loggingConnection;
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v215, "targetDuration");
        *(_DWORD *)buf = 134219266;
        *(_QWORD *)v362 = v145;
        *(_WORD *)&v362[8] = 2048;
        *(double *)&v362[10] = v147;
        *(_WORD *)&v362[18] = 2112;
        *(_QWORD *)&v362[20] = v155;
        *(_WORD *)&v362[28] = 2048;
        *(double *)v363 = v149;
        *(_WORD *)&v363[8] = 2048;
        v364 = v157;
        v365 = 1024;
        v366 = v143;
        _os_log_impl(&dword_1CA237000, v156, OS_LOG_TYPE_INFO, "DurationEvaluation: %.2f sec. (max %.2f sec.), %@ constraint [%.2f, %.2f, %d items]", buf, 0x3Au);
      }

      if (!v153 && objc_msgSend(v215, "failIfMinimumDurationNotReached"))
      {

        v113 = MEMORY[0x1E0C9AA60];
      }
LABEL_270:

      if (!v234
        || (v207 = CFAbsoluteTimeGetCurrent(), v207 - v353[3] < 0.01)
        || (v353[3] = v207,
            v280 = 0,
            ((void (**)(_QWORD, char *, double))v216)[2](v216, &v280, 1.0),
            v208 = *((_BYTE *)v357 + 24) | v280,
            (*((_BYTE *)v357 + 24) = v208) == 0))
      {
        v15 = v113;

        goto LABEL_93;
      }
      v209 = MEMORY[0x1E0C81028];
      v210 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 649;
        *(_WORD *)&v362[4] = 2080;
        *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_92;
    }
    if (v227 == 20 || v227 == 2)
    {
      objc_msgSend(v239, "universalStartDate");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "universalEndDate");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "timeIntervalSinceDate:", v103);
      v106 = v105;
      objc_msgSend((id)v322[5], "timeIntervalSinceDate:", v328[5]);
      v108 = v107;
      if (v234)
      {
        v109 = CFAbsoluteTimeGetCurrent();
        if (v109 - v353[3] >= 0.01)
        {
          v353[3] = v109;
          v280 = 0;
          ((void (**)(_QWORD, char *, double))v85)[2](v85, &v280, 0.5);
          v110 = *((_BYTE *)v357 + 24) | v280;
          *((_BYTE *)v357 + 24) = v110;
          if (v110)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 487;
              *(_WORD *)&v362[4] = 2080;
              *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v15 = MEMORY[0x1E0C9AA60];
LABEL_194:

            goto LABEL_93;
          }
        }
      }
      if (v108 <= v106 * 0.05)
      {
        objc_msgSend(v214, "resetWithReason:", CFSTR("All clustered items span insufficient"));
        v136 = (void *)objc_msgSend(v215, "copy");
        v137 = v136;
        if (v227 == 2)
          v138 = 4;
        else
          v138 = 21;
        objc_msgSend(v136, "setDuration:", v138);
        v271[0] = MEMORY[0x1E0C809B0];
        v271[1] = 3221225472;
        v271[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_163;
        v271[3] = &unk_1E8434F30;
        v272 = v85;
        v273 = &v352;
        v275 = 0x3F847AE147AE147BLL;
        v274 = &v356;
        -[PGCurator bestItemsForFeeder:options:debugInfo:progressBlock:](v236, "bestItemsForFeeder:options:debugInfo:progressBlock:", v239, v137, v214, v271);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = v139;
        if (*((_BYTE *)v357 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 497;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v15 = MEMORY[0x1E0C9AA60];
        }
        else
        {
          v15 = v139;
        }

        goto LABEL_194;
      }

      v85 = v216;
    }
    if (v76)
    {
      v128 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v269 = 0u;
      v270 = 0u;
      v267 = 0u;
      v268 = 0u;
      v129 = v238;
      v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v267, v360, 16);
      if (v130)
      {
        v131 = *(_QWORD *)v268;
        do
        {
          for (m = 0; m != v130; ++m)
          {
            if (*(_QWORD *)v268 != v131)
              objc_enumerationMutation(v129);
            objc_msgSend(*(id *)(*((_QWORD *)&v267 + 1) + 8 * m), "clsPersonAndPetLocalIdentifiers");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "addObjectsFromArray:", v133);

          }
          v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v267, v360, 16);
        }
        while (v130);
      }

      if (v234)
      {
        v134 = CFAbsoluteTimeGetCurrent();
        if (v134 - v353[3] >= 0.01)
        {
          v353[3] = v134;
          v280 = 0;
          ((void (**)(_QWORD, char *, double))v216)[2](v216, &v280, 0.5);
          v135 = *((_BYTE *)v357 + 24) | v280;
          *((_BYTE *)v357 + 24) = v135;
          if (v135)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 512;
              *(_WORD *)&v362[4] = 2080;
              *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_92;
          }
        }
      }
      v262[0] = MEMORY[0x1E0C809B0];
      v262[1] = 3221225472;
      v262[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_164;
      v262[3] = &unk_1E8434F30;
      v263 = v216;
      v264 = &v352;
      v266 = 0x3F847AE147AE147BLL;
      v265 = &v356;
      -[PGCurator completeItems:withItems:forPersonLocalIdentifiers:options:nonRemovableItems:debugInfo:progressBlock:](v236, "completeItems:withItems:forPersonLocalIdentifiers:options:nonRemovableItems:debugInfo:progressBlock:", v230, v129, v128, v215, 0, v214, v262);
      if (*((_BYTE *)v357 + 24))
      {
        v141 = MEMORY[0x1E0C81028];
        v142 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 518;
          *(_WORD *)&v362[4] = 2080;
          *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_92;
      }

      v85 = v216;
    }
    if (v234)
    {
      v158 = CFAbsoluteTimeGetCurrent();
      if (v158 - v353[3] >= 0.01)
      {
        v353[3] = v158;
        v280 = 0;
        ((void (**)(_QWORD, char *, double))v85)[2](v85, &v280, 0.5);
        v159 = *((_BYTE *)v357 + 24) | v280;
        *((_BYTE *)v357 + 24) = v159;
        if (v159)
        {
          v160 = MEMORY[0x1E0C81028];
          v161 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 521;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_92;
        }
      }
    }
    v162 = objc_msgSend(v230, "count");
    v163 = v225 - v162;
    if (v225 != v162)
    {
      v257[0] = MEMORY[0x1E0C809B0];
      v257[1] = 3221225472;
      v257[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_165;
      v257[3] = &unk_1E8434F30;
      v258 = v85;
      v259 = &v352;
      v260 = &v356;
      v261 = 0x3F847AE147AE147BLL;
      -[PGCurator completeItems:withFavoriteItemsFromItems:upToNumberOfItems:debugInfo:progressBlock:](v236, "completeItems:withFavoriteItemsFromItems:upToNumberOfItems:debugInfo:progressBlock:", v230, v238, v163, v214, v257);

      v85 = v216;
    }
    if (v234)
    {
      v164 = CFAbsoluteTimeGetCurrent();
      if (v164 - v353[3] >= 0.01)
      {
        v353[3] = v164;
        v280 = 0;
        ((void (**)(_QWORD, char *, double))v85)[2](v85, &v280, 0.5);
        v165 = *((_BYTE *)v357 + 24) | v280;
        *((_BYTE *)v357 + 24) = v165;
        if (v165)
        {
          v166 = MEMORY[0x1E0C81028];
          v167 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 531;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_209:

          goto LABEL_92;
        }
      }
    }
    -[PGCurator lastPassToCompleteItems:fromFeeder:options:maximumNumberOfItems:debugInfo:](v236, "lastPassToCompleteItems:fromFeeder:options:maximumNumberOfItems:debugInfo:", v230, v239, v215, v225, v214);
    if (v234)
    {
      v168 = CFAbsoluteTimeGetCurrent();
      if (v168 - v353[3] >= 0.01)
      {
        v353[3] = v168;
        v280 = 0;
        ((void (**)(_QWORD, char *, double))v85)[2](v85, &v280, 0.5);
        v169 = *((_BYTE *)v357 + 24) | v280;
        *((_BYTE *)v357 + 24) = v169;
        if (v169)
        {
          v170 = MEMORY[0x1E0C81028];
          v171 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 535;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_209;
        }
        v85 = v216;
      }
    }
    v252[0] = MEMORY[0x1E0C809B0];
    v252[1] = 3221225472;
    v252[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_166;
    v252[3] = &unk_1E8434F30;
    v172 = v85;
    v253 = (__CFString *)v172;
    v254 = &v352;
    v255 = &v356;
    v256 = 0x3F847AE147AE147BLL;
    -[PGCurator deduplicatedItems:options:debugInfo:progressBlock:](v236, "deduplicatedItems:options:debugInfo:progressBlock:", v230, v215, v214, v252);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v173;
    if (*((_BYTE *)v357 + 24))
    {
      v113 = MEMORY[0x1E0C81028];
      v175 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 540;
        *(_WORD *)&v362[4] = 2080;
        *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1CA237000, v113, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_220;
    }
    v176 = objc_msgSend(v173, "count");
    if (v176 > v225)
    {
      v177 = v174;
      v178 = objc_msgSend((id)objc_opt_class(), "numberOfItemsToShaveOffWithNumberOfItems:maximumNumberOfItems:options:", v176, v225, v215);
      if (v178)
      {
        -[PGCurator shaveItems:downToNumberOfItems:options:debugInfo:progressBlock:](v236, "shaveItems:downToNumberOfItems:options:debugInfo:progressBlock:", v177, v176 - v178, v215, 0, &__block_literal_global_10179);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        if (v214)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v177);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v179);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "minusSet:", v181);

          objc_msgSend(v214, "setState:ofItems:withReason:", 2, v180, CFSTR("Last minute shaving"));
        }
        v182 = v179;

        v183 = v236->_loggingConnection;
        if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
        {
          v184 = objc_msgSend(v182, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v362 = v184;
          _os_log_impl(&dword_1CA237000, v183, OS_LOG_TYPE_INFO, "Shaved down to %lu items", buf, 0xCu);
        }

      }
      else
      {
        v182 = v177;
      }

      goto LABEL_268;
    }
    v185 = 0;
    v113 = 0;
    if (v227 > 19)
    {
      if (v227 == 21)
        goto LABEL_242;
      if (v227 != 20)
        goto LABEL_243;
    }
    else if (v227 != 2)
    {
      if (v227 != 4)
        goto LABEL_243;
      goto LABEL_242;
    }
    v186 = objc_msgSend(v174, "count");
    v187 = +[PGCurationManager minimumNumberOfItemsForDuration:withMaximumNumberOfItems:](PGCurationManager, "minimumNumberOfItemsForDuration:withMaximumNumberOfItems:", v227, v225);
    if (v186 < v187)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not enough best items for Short curation, %lu for a minimum of %lu, switching to Complete Short"), v186, v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "resetWithReason:", v188);
      v189 = (void *)objc_msgSend(v215, "copy");
      v190 = v189;
      if (v227 == 2)
        v191 = 4;
      else
        v191 = 21;
      objc_msgSend(v189, "setDuration:", v191);
      v247[0] = MEMORY[0x1E0C809B0];
      v247[1] = 3221225472;
      v247[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_172;
      v247[3] = &unk_1E8434F30;
      v248 = v172;
      v249 = &v352;
      v250 = &v356;
      v251 = 0x3F847AE147AE147BLL;
      -[PGCurator bestItemsForFeeder:options:debugInfo:progressBlock:](v236, "bestItemsForFeeder:options:debugInfo:progressBlock:", v239, v190, v214, v247);
      v113 = objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v357 + 24))
      {
        v192 = MEMORY[0x1E0C81028];
        v193 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 607;
          *(_WORD *)&v362[4] = 2080;
          *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_220;
      }

      v185 = 0;
LABEL_243:
      if (v234)
      {
        v194 = CFAbsoluteTimeGetCurrent();
        if (v194 - v353[3] >= 0.01)
        {
          v353[3] = v194;
          v280 = 0;
          (*((void (**)(id, char *, double))v172 + 2))(v172, &v280, 0.5);
          v195 = *((_BYTE *)v357 + 24) | v280;
          *((_BYTE *)v357 + 24) = v195;
          if (v195)
          {
            v196 = MEMORY[0x1E0C81028];
            v197 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 615;
              *(_WORD *)&v362[4] = 2080;
              *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_220;
          }
        }
      }
      if (v185 && (v198 = objc_msgSend(v174, "count"), v198 < v32) && v198 + 2 >= v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Almost all items included in curation (%lu out of %lu), falling back to beautification"), v198, v32);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "resetWithReason:", v199);
        v242[0] = MEMORY[0x1E0C809B0];
        v242[1] = 3221225472;
        v242[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_175;
        v242[3] = &unk_1E8434F30;
        v243 = v172;
        v244 = &v352;
        v245 = &v356;
        v246 = 0x3F847AE147AE147BLL;
        objc_msgSend(v220, "performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", v238, v225, v214, v242);
        v182 = (id)objc_claimAutoreleasedReturnValue();

        if (*((_BYTE *)v357 + 24))
        {
          v200 = MEMORY[0x1E0C81028];
          v201 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 632;
            *(_WORD *)&v362[4] = 2080;
            *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_263;
        }

      }
      else
      {
        v182 = v174;
      }
      if (!v234
        || (v202 = CFAbsoluteTimeGetCurrent(), v202 - v353[3] < 0.01)
        || (v353[3] = v202,
            v280 = 0,
            (*((void (**)(id, char *, double))v172 + 2))(v172, &v280, 0.5),
            v203 = *((_BYTE *)v357 + 24) | v280,
            (*((_BYTE *)v357 + 24) = v203) == 0))
      {
        if (v113)
        {
LABEL_269:

          v155 = v253;
          goto LABEL_270;
        }
LABEL_268:
        -[PGCurator defaultItemSortDescriptors](v236, "defaultItemSortDescriptors");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "sortedArrayUsingDescriptors:", v206);
        v113 = objc_claimAutoreleasedReturnValue();

        goto LABEL_269;
      }
      v204 = MEMORY[0x1E0C81028];
      v205 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 636;
        *(_WORD *)&v362[4] = 2080;
        *(_QWORD *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

LABEL_263:
      v174 = v182;
LABEL_220:

      goto LABEL_92;
    }
LABEL_242:
    v113 = 0;
    v185 = 1;
    goto LABEL_243;
  }
LABEL_11:
  v15 = MEMORY[0x1E0C9AA60];
LABEL_98:
  _Block_object_dispose(&v352, 8);
  _Block_object_dispose(&v356, 8);

  return v15;
}

- (void)_checkRequiredItemsWithIdentifiers:(id)a3 inItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  NSObject *loggingConnection;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "clsIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "containsObject:", v15);

          if (v16)
          {
            if (objc_msgSend(v8, "containsObject:", v14))
            {
              loggingConnection = self->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "Required items found several times in final sorted items", buf, 2u);
              }
            }
            objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    v18 = objc_msgSend(v8, "count");
    if (v18 != objc_msgSend(v6, "count"))
    {
      v19 = self->_loggingConnection;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "Final sorted items don't contain all required items", buf, 2u);
      }
    }

    v7 = v20;
  }

}

- (id)deduplicatedItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  OS_os_log *v22;
  id v23;
  void *v24;
  OS_os_log *v25;
  double Current;
  char v27;
  int v29;
  int v30;
  int v31;
  int v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _Block_copy(v13);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (!v14
    || (v15 = CFAbsoluteTimeGetCurrent(), v15 - v45[3] < 0.01)
    || (v45[3] = v15,
        v43 = 0,
        (*((void (**)(void *, char *, double))v14 + 2))(v14, &v43, 0.0),
        v16 = *((_BYTE *)v49 + 24) | v43,
        (*((_BYTE *)v49 + 24) = v16) == 0))
  {
    objc_msgSend(v11, "uuidsOfRequiredAssets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    if (objc_msgSend(v11, "semanticalDedupingIsEnabled"))
    {
      v20 = -[PGCurator newSemanticalDeduperWithOptions:](self, "newSemanticalDeduperWithOptions:", v11);
      if (v20)
      {
        v31 = objc_msgSend(v19, "count");
        objc_msgSend(v20, "setIdentifiersOfRequiredItems:", v18);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke;
        v38[3] = &unk_1E8434F30;
        v39 = v14;
        v40 = &v44;
        v41 = &v48;
        v42 = 0x3F847AE147AE147BLL;
        objc_msgSend(v20, "deduplicatedItemsWithItems:debugInfo:progressBlock:", v19, v12, v38);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (*((_BYTE *)v49 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v53 = 704;
            v54 = 2080;
            v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_35;
        }
        v22 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
        {
          v29 = objc_msgSend(v21, "count");
          *(_DWORD *)buf = 67109376;
          v53 = v31;
          v54 = 1024;
          LODWORD(v55) = v29;
          _os_log_debug_impl(&dword_1CA237000, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Semantical deduper reduced %d assets to %d", buf, 0xEu);
        }

      }
      else
      {
        v21 = v19;
      }

    }
    else
    {
      v21 = v19;
    }
    if (objc_msgSend(v11, "movieDedupingIsEnabled"))
    {
      v23 = -[PGCurator newMovieDeduperWithOptions:](self, "newMovieDeduperWithOptions:", v11);
      if (v23)
      {
        v32 = objc_msgSend(v21, "count");
        objc_msgSend(v23, "setIdentifiersOfRequiredItems:", v18);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke_176;
        v33[3] = &unk_1E8434F30;
        v34 = v14;
        v35 = &v44;
        v36 = &v48;
        v37 = 0x3F847AE147AE147BLL;
        objc_msgSend(v23, "deduplicatedItemsWithItems:debugInfo:progressBlock:", v21, v12, v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (*((_BYTE *)v49 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v53 = 719;
            v54 = 2080;
            v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v17 = (void *)MEMORY[0x1E0C9AA60];
          v21 = v24;
          goto LABEL_37;
        }
        v25 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
        {
          v30 = objc_msgSend(v24, "count");
          *(_DWORD *)buf = 67109376;
          v53 = v32;
          v54 = 1024;
          LODWORD(v55) = v30;
          _os_log_debug_impl(&dword_1CA237000, (os_log_t)v25, OS_LOG_TYPE_DEBUG, "Movie deduper reduced %d assets to %d", buf, 0xEu);
        }

      }
      else
      {
        v24 = v21;
      }

      v21 = v24;
    }
    if (!v14
      || (Current = CFAbsoluteTimeGetCurrent(), Current - v45[3] < 0.01)
      || (v45[3] = Current,
          v43 = 0,
          (*((void (**)(void *, char *, double))v14 + 2))(v14, &v43, 1.0),
          v27 = *((_BYTE *)v49 + 24) | v43,
          (*((_BYTE *)v49 + 24) = v27) == 0))
    {
      v21 = v21;
      v17 = v21;
      goto LABEL_37;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v53 = 724;
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_35:
    v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v53 = 688;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_38:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v17;
}

- (void)completeItems:(id)a3 withFavoriteItemsFromItems:(id)a4 upToNumberOfItems:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(void *, _BYTE *, double);
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double Current;
  int *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  _QWORD v43[2];
  uint8_t v44[128];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(void *, _BYTE *, double))_Block_copy(a7);
  v15 = 0.0;
  if (!v14 || (v16 = CFAbsoluteTimeGetCurrent(), v16 < 0.01))
  {
LABEL_7:
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = v11;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v36 = v12;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v18, "containsObject:", v24) & 1) == 0 && objc_msgSend(v24, "isFavorite"))
            objc_msgSend(v17, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v21);
    }

    if (v14)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v26 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      if (Current - v15 >= 0.01)
      {
        v42 = 0;
        v14[2](v14, &v42, 0.5);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 744;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v12 = v36;
          v11 = v37;
LABEL_38:

          goto LABEL_39;
        }
        v15 = Current;
      }
    }
    else
    {
      v26 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    }
    v27 = objc_msgSend(v17, "count");
    if (v27)
    {
      v28 = v27;
      objc_msgSend(v13, "setAgent:", CFSTR("PGManager"));
      objc_msgSend(v13, "setStage:", CFSTR("Complete with Favorite Items"));
      if (v28 > a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("clsContentScore"), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v29;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cls_universalDate"), 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "sortedArrayUsingDescriptors:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "subarrayWithRange:", 0, a5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "addObjectsFromArray:", v33);
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Electing %lu out of %lu available favorite items"), objc_msgSend(v33, "count"), v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setState:ofItems:withReason:", 3, v35, v34);

        }
        v26 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
        goto LABEL_32;
      }
      objc_msgSend(v37, "addObjectsFromArray:", v17);
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enough remaining slots (%lu) to include all %lu available favorite items"), a5, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setState:ofItems:withReason:", 3, v33, v31);
LABEL_32:

      }
    }
    v12 = v36;
    v11 = v37;
    if (v14)
    {
      if (CFAbsoluteTimeGetCurrent() - v15 >= *((double *)v26 + 72))
      {
        v42 = 0;
        v14[2](v14, &v42, 1.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 774;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_38;
  }
  v42 = 0;
  v14[2](v14, &v42, 0.0);
  if (!v42)
  {
    v15 = v16;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v46 = 732;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_39:

}

- (void)completeItems:(id)a3 withItems:(id)a4 forPersonLocalIdentifiers:(id)a5 options:(id)a6 nonRemovableItems:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  double v17;
  double Current;
  id v19;
  id v20;
  uint64_t i;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  double v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t n;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  unint64_t v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  id obj;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void (**v120)(void *, _BYTE *, double);
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  char v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint8_t v161[128];
  uint8_t buf[4];
  int v163;
  __int16 v164;
  const char *v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v101 = a3;
  v111 = a4;
  v14 = a5;
  v15 = a6;
  v103 = a7;
  v16 = a8;
  v17 = 0.0;
  v120 = (void (**)(void *, _BYTE *, double))_Block_copy(a9);
  if (!v120)
    goto LABEL_7;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01)
    goto LABEL_7;
  v153 = 0;
  v120[2](v120, &v153, 0.0);
  if (!v153)
  {
    v17 = Current;
LABEL_7:
    v99 = v15;
    v100 = v16;
    v98 = v14;
    v119 = (void *)objc_msgSend(v14, "mutableCopy");
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v20 = v101;
    obj = v20;
    v116 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
    if (v116)
    {
      v113 = *(_QWORD *)v150;
      do
      {
        for (i = 0; i != v116; ++i)
        {
          if (*(_QWORD *)v150 != v113)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
          if (v120)
          {
            v23 = CFAbsoluteTimeGetCurrent();
            if (v23 - v17 >= 0.01)
            {
              v153 = 0;
              v120[2](v120, &v153, 0.5);
              if (v153)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v163 = 789;
                  v164 = 2080;
                  v165 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurator.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v92 = obj;
                v34 = v119;
                goto LABEL_100;
              }
              v17 = v23;
            }
          }
          objc_msgSend(v22, "clsPersonAndPetLocalIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "minusSet:", v25);

          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v26 = v24;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v146;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v146 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j);
                objc_msgSend(v19, "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, v31);
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
            }
            while (v28);
          }

        }
        v20 = obj;
        v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      }
      while (v116);
    }

    v34 = v119;
    if (!objc_msgSend(v119, "count"))
    {
LABEL_101:

      v14 = v98;
      v15 = v99;
      v16 = v100;
      goto LABEL_102;
    }
    +[PGCurationManager assetsBeautifier](PGCurationManager, "assetsBeautifier");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v109 = (id)objc_msgSend(v119, "copy");
    v35 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v142;
      v104 = *(_QWORD *)v142;
      do
      {
        v38 = 0;
        v107 = v36;
        do
        {
          if (*(_QWORD *)v142 != v37)
            objc_enumerationMutation(v109);
          v39 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * v38);
          if (v120)
          {
            v40 = CFAbsoluteTimeGetCurrent();
            if (v40 - v17 >= 0.01)
            {
              v153 = 0;
              v120[2](v120, &v153, 0.5);
              if (v153)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v163 = 812;
                  v164 = 2080;
                  v165 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurator.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                goto LABEL_99;
              }
              v17 = v40;
            }
          }
          if (objc_msgSend(v34, "containsObject:", v39))
          {
            v117 = v38;
            v41 = (void *)objc_opt_new();
            v137 = 0u;
            v138 = 0u;
            v139 = 0u;
            v140 = 0u;
            v42 = v111;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v138;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v138 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
                  objc_msgSend(v47, "clsPersonAndPetLocalIdentifiers");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "containsObject:", v39);

                  if (v49)
                    objc_msgSend(v41, "addObject:", v47);
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
              }
              while (v44);
            }

            objc_msgSend(v106, "bestItemInItems:", v41);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50;
            v34 = v119;
            if (v50)
            {
              objc_msgSend(v50, "clsPersonAndPetLocalIdentifiers");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "addObject:", v51);
              v114 = v51;
              objc_msgSend(v102, "addObject:", v51);
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "minusSet:", v53);

              v135 = 0u;
              v136 = 0u;
              v133 = 0u;
              v134 = 0u;
              v54 = v52;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
              if (v55)
              {
                v56 = v55;
                v57 = *(_QWORD *)v134;
                do
                {
                  for (m = 0; m != v56; ++m)
                  {
                    if (*(_QWORD *)v134 != v57)
                      objc_enumerationMutation(v54);
                    v59 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * m);
                    objc_msgSend(v19, "objectForKeyedSubscript:", v59);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v60, "unsignedIntegerValue") + 1);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v19, "setObject:forKeyedSubscript:", v61, v59);
                  }
                  v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
                }
                while (v56);
              }

              v51 = v114;
              v34 = v119;
            }

            v37 = v104;
            v36 = v107;
            v38 = v117;
          }
          ++v38;
        }
        while (v38 != v36);
        v36 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
      }
      while (v36);
    }

    v62 = +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", objc_msgSend(v99, "duration"), objc_msgSend(v111, "count"));
    if (v100)
    {
      objc_msgSend(v100, "setAgent:", CFSTR("CompleteItems"));
      objc_msgSend(v100, "setStage:", CFSTR("Repechage"));
      objc_msgSend(v100, "setState:ofItems:withReason:", 3, v102, CFSTR("Contains needed faces"));
    }
    if (objc_msgSend(obj, "count") <= v62)
      goto LABEL_109;
    v63 = objc_msgSend(obj, "count");
    v64 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    objc_msgSend(obj, "reverseObjectEnumerator");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
    if (!v66)
      goto LABEL_104;
    v67 = v66;
    v97 = v63 - v62;
    v68 = *(_QWORD *)v130;
    v95 = v65;
    v96 = v64;
    v105 = *(_QWORD *)v130;
LABEL_62:
    v69 = 0;
    v108 = v67;
    while (1)
    {
      if (*(_QWORD *)v130 != v68)
        objc_enumerationMutation(v65);
      v118 = v69;
      v70 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v69);
      --v63;
      v71 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v70, "clsPersonAndPetLocalIdentifiers");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setWithArray:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v115 = v73;
      if ((objc_msgSend(v103, "containsObject:", v70) & 1) == 0)
        break;
      v74 = v118;
LABEL_90:

      v69 = v74 + 1;
      if (v69 == v67)
      {
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
        if (v67)
          goto LABEL_62;
LABEL_104:

        v34 = v119;
        if (objc_msgSend(v64, "count"))
        {
          if (v100)
          {
            objc_msgSend(obj, "objectsAtIndexes:", v64);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setState:ofItems:withReason:", 2, v94, CFSTR("Too many items after repechage"));

          }
          objc_msgSend(obj, "removeObjectsAtIndexes:", v64);
        }

LABEL_109:
        if (v120)
        {
          if (CFAbsoluteTimeGetCurrent() - v17 >= 0.01)
          {
            v153 = 0;
            v120[2](v120, &v153, 1.0);
            if (v153)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v163 = 912;
                v164 = 2080;
                v165 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework"
                       "/Curation/PGCurator.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
LABEL_99:

        v92 = v106;
LABEL_100:

        goto LABEL_101;
      }
    }
    v110 = (id)v63;
    if (v120)
    {
      v75 = CFAbsoluteTimeGetCurrent();
      if (v75 - v17 >= 0.01)
      {
        v153 = 0;
        v120[2](v120, &v153, 0.5);
        if (v153)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v163 = 871;
            v164 = 2080;
            v165 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cur"
                   "ation/PGCurator.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v34 = v119;
          goto LABEL_99;
        }
        v17 = v75;
      }
    }
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v76 = v73;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v126;
LABEL_73:
      v80 = 0;
      while (1)
      {
        if (*(_QWORD *)v126 != v79)
          objc_enumerationMutation(v76);
        objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v80));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "unsignedIntegerValue");

        if (v82 == 1)
          break;
        if (v78 == ++v80)
        {
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
          if (v78)
            goto LABEL_73;
          goto LABEL_79;
        }
      }
    }
    else
    {
LABEL_79:

      v63 = (uint64_t)v110;
      objc_msgSend(v64, "addIndex:", v110);
      if (v97 == 1)
      {

        goto LABEL_104;
      }
      --v97;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v83 = v76;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
      if (!v84)
        goto LABEL_89;
      v85 = v84;
      v86 = *(_QWORD *)v122;
      do
      {
        for (n = 0; n != v85; ++n)
        {
          if (*(_QWORD *)v122 != v86)
            objc_enumerationMutation(v83);
          v88 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * n);
          objc_msgSend(v19, "objectForKeyedSubscript:", v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "unsignedIntegerValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v90 - 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "setObject:forKeyedSubscript:", v91, v88);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
      }
      while (v85);
      v65 = v95;
      v64 = v96;
    }
    v63 = (uint64_t)v110;
LABEL_89:
    v68 = v105;
    v74 = v118;

    v67 = v108;
    goto LABEL_90;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v163 = 781;
    v164 = 2080;
    v165 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_102:

}

- (id)completedItems:(id)a3 withNumberOfItems:(unint64_t)a4 fromAllItems:(id)a5 avoidingItems:(id)a6 options:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9
{
  id v14;
  void *v15;
  double v16;
  char v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  double Current;
  char v43;
  void (**v45)(_QWORD, _QWORD, double);
  void *v46;
  unint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  _QWORD v55[4];
  void (**v56)(_QWORD, _QWORD, double);
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  char v73;
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  int v85;
  __int16 v86;
  const char *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v51 = a5;
  v53 = a6;
  v52 = a7;
  v49 = a8;
  v14 = a9;
  v15 = _Block_copy(v14);
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = (double *)&v74;
  v76 = 0x2020000000;
  v77 = 0;
  v48 = v14;
  if (!v15
    || (v16 = CFAbsoluteTimeGetCurrent(), v16 - v75[3] < 0.01)
    || (v75[3] = v16,
        v73 = 0,
        (*((void (**)(void *, char *, double))v15 + 2))(v15, &v73, 0.0),
        v17 = *((_BYTE *)v79 + 24) | v73,
        (*((_BYTE *)v79 + 24) = v17) == 0))
  {
    if (!a4)
    {
      v18 = v50;
      goto LABEL_45;
    }
    v47 = a4;
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v20 = v53;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v70 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "clsIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      }
      while (v21);
    }

    +[PGCurationManager assetsBeautifier](PGCurationManager, "assetsBeautifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setIdentifiersOfRequiredItems:", v19);
    objc_msgSend(v52, "uuidsOfEligibleAssets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setIdentifiersOfEligibleItems:", v25);

    v26 = objc_msgSend(v19, "count") + v47;
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke;
    v64[3] = &unk_1E8434F30;
    v27 = v15;
    v65 = v27;
    v66 = &v74;
    v67 = &v78;
    v68 = 0x3F847AE147AE147BLL;
    objc_msgSend(v54, "performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", v51, v26, 0, v64);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v79 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v85 = 939;
        v86 = 2080;
        v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v18 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_44;
    }
    v45 = (void (**)(_QWORD, _QWORD, double))v27;
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v29 = v46;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v61 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v33, "clsIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v19, "containsObject:", v34);

          if ((v35 & 1) == 0)
            objc_msgSend(v28, "addObject:", v33);
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      }
      while (v30);
    }

    v36 = v28;
    v37 = v36;
    if (objc_msgSend(v36, "count") > v47)
    {
      objc_msgSend(v54, "setIdentifiersOfRequiredItems:", 0);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke_201;
      v55[3] = &unk_1E8434F30;
      v56 = v45;
      v57 = &v74;
      v58 = &v78;
      v59 = 0x3F847AE147AE147BLL;
      objc_msgSend(v54, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v36, v47, v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v38 = v50;
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding %lu assets (%lu requested, %lu found) for layout purposes"), objc_msgSend(v37, "count"), v47, objc_msgSend(v36, "count"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setState:ofItems:withReason:", 3, v41, v40);

      }
      if (!v15)
        goto LABEL_42;
    }
    else
    {
      v39 = v38;
      if (!v15)
        goto LABEL_42;
    }
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v75[3] >= 0.01)
    {
      v75[3] = Current;
      v73 = 0;
      ((void (**)(_QWORD, char *, double))v45)[2](v45, &v73, 1.0);
      v43 = *((_BYTE *)v79 + 24) | v73;
      *((_BYTE *)v79 + 24) = v43;
      if (v43)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v85 = 971;
          v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v18 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_43;
      }
    }
LABEL_42:
    v18 = v39;
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v85 = 918;
    v86 = 2080;
    v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v18 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v18;
}

- (id)defaultItemSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cls_universalDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("clsIdentifier"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bestItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  PGCuratorInvestigationFeeder *v13;
  PGCurationOptions *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  PGCuratorInvestigationFeeder *v25;
  id v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __60__PGCurator_bestItemIdentifiersWithItems_options_debugInfo___block_invoke;
  v33[3] = &unk_1E8430348;
  v26 = v10;
  v34 = v26;
  v11 = v8;
  v35 = v11;
  v12 = v9;
  v36 = v12;
  v28 = v7;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v33);
  v13 = -[PGCuratorInvestigationFeeder initWithItems:]([PGCuratorInvestigationFeeder alloc], "initWithItems:", v12);
  v14 = -[PGCurationOptions initWithDictionaryRepresentation:]([PGCurationOptions alloc], "initWithDictionaryRepresentation:", v11);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v12);
  v25 = v13;
  -[PGCurator bestItemsForFeeder:options:debugInfo:progressBlock:](self, "bestItemsForFeeder:options:debugInfo:progressBlock:", v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "clsIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

  if (a5)
  {
    objc_msgSend(v15, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)shaveItems:(id)a3 downToNumberOfItems:(unint64_t)a4 options:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = (objc_class *)MEMORY[0x1E0D4B110];
  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithSimilarityModelClass:", objc_opt_class());
  objc_msgSend(v14, "setEnableStatisticalSampling:", 1);
  objc_msgSend(v14, "setUsesKMeans:", 1);
  objc_msgSend(v14, "setEnableIntermediateNaturalClustering:", 0);
  objc_msgSend(v14, "setEnableFinalNaturalClustering:", 0);
  objc_msgSend(v14, "setEnableFinalTimeClustering:", 0);
  objc_msgSend(v12, "uuidsOfRequiredAssets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIdentifiersOfRequiredItems:", v15);
  objc_msgSend(v14, "performWithItems:maximumNumberOfItemsToChoose:debugInfo:progressBlock:", v13, a4, 0, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)newSemanticalDeduperWithOptions:(id)a3
{
  id v3;
  PGSemanticalDeduper *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(PGSemanticalDeduper);
  v5 = objc_msgSend(v3, "semanticalDedupingUsesAdaptiveSimilarStacking");

  -[PGSemanticalDeduper setUsesAdaptiveSimilarStacking:](v4, "setUsesAdaptiveSimilarStacking:", v5);
  return v4;
}

- (id)newMovieDeduperWithOptions:(id)a3
{
  return 0;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __60__PGCurator_bestItemIdentifiersWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "curationModelForItemInfo:options:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCuratorInvestigationItem itemWithUUID:itemInfo:curationModel:](PGCuratorInvestigationItem, "itemWithUUID:itemInfo:curationModel:", v8, v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
}

void __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke_201(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke_176(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "clsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_146(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double Current;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  __int128 v50;
  uint64_t v51;
  char v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 104);
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 40), "lock");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 152))
    {
      *(double *)(v6 + 24) = Current;
      v52 = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 104) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8)
                                                                             + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "unlock");
        goto LABEL_30;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "unlock");
    v4 = *(void **)(a1 + 104);
  }
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_147;
  v47[3] = &unk_1E8428E38;
  v49 = v4;
  v48 = *(id *)(a1 + 40);
  v51 = *(_QWORD *)(a1 + 152);
  v50 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v7, "summarizedItemsFromCluster:withBeautifier:debugInfo:progressBlock:", v3, v8, v9, v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lock");
  LODWORD(v7) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) == 0;
  objc_msgSend(*(id *)(a1 + 40), "unlock");
  if ((_DWORD)v7)
  {
    v13 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 72);
    v43[0] = v10;
    v43[1] = 3221225472;
    v43[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3;
    v43[3] = &unk_1E8434F30;
    v44 = *(id *)(a1 + 104);
    v46 = *(_QWORD *)(a1 + 152);
    v45 = *(_OWORD *)(a1 + 112);
    objc_msgSend(v13, "deduplicatedItems:options:debugInfo:progressBlock:", v11, v14, v15, v43);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "lock");
    LODWORD(v14) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) == 0;
    objc_msgSend(*(id *)(a1 + 40), "unlock");
    if ((_DWORD)v14)
    {
      v16 = *(id *)(a1 + 80);
      objc_sync_enter(v16);
      objc_msgSend(v3, "cluster");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_BYTE *)(a1 + 160))
      {
        v19 = objc_msgSend(v3, "numberOfItemsToElect");
        if (objc_msgSend(v12, "count") < v19 || objc_msgSend(v18, "count") <= v19)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) += objc_msgSend(v12, "count");
          objc_msgSend(*(id *)(a1 + 96), "addObjectsFromArray:", v12);
        }
        else
        {
          v20 = *(void **)(a1 + 88);
          objc_msgSend(v3, "cluster");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v21);

        }
      }
      objc_msgSend(*(id *)(a1 + 80), "addObjectsFromArray:", v12);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v22 = v18;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "cls_universalDate", (_QWORD)v39);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
            v28 = *(void **)(v27 + 40);
            if (v28)
            {
              objc_msgSend(v28, "earlierDate:", v26);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
              v31 = *(void **)(v30 + 40);
              *(_QWORD *)(v30 + 40) = v29;
            }
            else
            {
              v32 = v26;
              v31 = *(void **)(v27 + 40);
              *(_QWORD *)(v27 + 40) = v32;
            }

            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
            v34 = *(void **)(v33 + 40);
            if (v34)
            {
              objc_msgSend(v34, "laterDate:", v26);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
              v37 = *(void **)(v36 + 40);
              *(_QWORD *)(v36 + 40) = v35;
            }
            else
            {
              v38 = v26;
              v37 = *(void **)(v33 + 40);
              *(_QWORD *)(v33 + 40) = v38;
            }

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        }
        while (v23);
      }

      objc_sync_exit(v16);
    }

  }
  else
  {
    v12 = v11;
  }

LABEL_30:
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_149(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_150(uint64_t a1, uint64_t a2)
{
  double Current;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _BYTE *, double);
  void *v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  char v30;

  if (*(_QWORD *)(a1 + 96))
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 32), "lock");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v5 + 24) = Current;
      v30 = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 96) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                             + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "unlock");
        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = MEMORY[0x1E0C809B0];
  v10 = *(_QWORD *)(a1 + 64);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3_151;
  v25[3] = &unk_1E8428E38;
  v27 = *(id *)(a1 + 96);
  v26 = *(id *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 120);
  v28 = *(_OWORD *)(a1 + 104);
  objc_msgSend(v7, "summarizedItemsFromCluster:withBeautifier:debugInfo:progressBlock:", v6, v8, v10, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lock");
  LODWORD(v7) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  if ((_DWORD)v7)
  {
    v12 = v11;
  }
  else
  {
    v13 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 72);
    v18 = v9;
    v19 = 3221225472;
    v20 = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_4;
    v21 = &unk_1E8434F30;
    v22 = *(id *)(a1 + 96);
    v24 = *(_QWORD *)(a1 + 120);
    v23 = *(_OWORD *)(a1 + 104);
    objc_msgSend(v13, "deduplicatedItems:options:debugInfo:progressBlock:", v11, v14, v15, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "lock", v18, v19, v20, v21);
    v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "unlock");
    if (!v16)
    {
      v17 = *(id *)(a1 + 80);
      objc_sync_enter(v17);
      objc_msgSend(*(id *)(a1 + 88), "addObjectsFromArray:", v12);
      objc_sync_exit(v17);

    }
  }

}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_163(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_164(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_165(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_166(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_172(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_175(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3_151(uint64_t result, _BYTE *a2, double a3)
{
  uint64_t v5;
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(result + 40))
  {
    v5 = result;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(v5 + 32), "lock");
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(v5 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(v5 + 40) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24))
        *a2 = 1;
    }
    return objc_msgSend(*(id *)(v5 + 32), "unlock");
  }
  return result;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_4(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_147(uint64_t result, _BYTE *a2, double a3)
{
  uint64_t v5;
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(result + 40))
  {
    v5 = result;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(v5 + 32), "lock");
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(v5 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(v5 + 40) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24))
        *a2 = 1;
    }
    return objc_msgSend(*(id *)(v5 + 32), "unlock");
  }
  return result;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __45__PGCurator_focusedItemsInItems_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v5, "clsContentScore");
    if (v7 < *MEMORY[0x1E0D77DE8]
      && (objc_msgSend(v5, "clsIsInhabited") & 1) == 0
      && !objc_msgSend(v5, "clsHasInterestingScenes"))
    {
      v9 = 0;
      goto LABEL_15;
    }
    v8 = objc_msgSend(v5, "clsIsUtility") ^ 1;
  }
  else
  {
    v8 = 1;
  }
  if (*(_BYTE *)(a1 + 41))
    v9 = 0;
  else
    v9 = v8;
  if (*(_BYTE *)(a1 + 41))
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "clsPersonAndPetLocalIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "intersectsSet:", v14);

  }
LABEL_15:

  return v9;
}

+ (unint64_t)maximumNumberOfItemsToElectWithTotalNumberOfItems:(unint64_t)a3 spanningNumberOfDays:(double)a4 options:(id)a5
{
  return +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:spanningNumberOfDays:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:spanningNumberOfDays:", objc_msgSend(a5, "duration"), a3, a4);
}

+ (unint64_t)numberOfItemsToShaveOffWithNumberOfItems:(unint64_t)a3 maximumNumberOfItems:(unint64_t)a4 options:(id)a5
{
  if (a3 >= a4)
    return a3 - a4;
  else
    return 0;
}

@end
