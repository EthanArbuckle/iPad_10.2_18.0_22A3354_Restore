@implementation PGHighlightTailor

- (PGHighlightTailor)initWithWorkingContext:(id)a3
{
  id v5;
  PGHighlightTailor *v6;
  PGHighlightTailor *v7;
  void *v8;
  OS_os_log *v9;
  OS_os_log *loggingConnection;
  OS_os_log *v11;
  PGAggregationEnrichmentProfile *v12;
  PGTripEnrichmentProfile *v13;
  PGCompleteEnrichmentProfile *v14;
  PGSceneCompleteEnrichmentProfile *v15;
  PGPartialEnrichmentProfile *v16;
  PGDefaultEnrichmentProfile *v17;
  uint64_t v18;
  NSArray *enrichmentProfiles;
  dispatch_group_t v20;
  OS_dispatch_group *enrichmentCommitGroup;
  PGMoodGenerationContext *v22;
  PGMoodGenerationContext *moodGenerationContext;
  objc_super v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGHighlightTailor;
  v6 = -[PGHighlightTailor init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    objc_msgSend(v5, "curationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v9 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = v9;
    v11 = v9;

    v12 = -[PGAggregationEnrichmentProfile initWithCurationManager:loggingConnection:]([PGAggregationEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[0] = v12;
    v13 = -[PGDayGroupAbstractEnrichmentProfile initWithCurationManager:loggingConnection:]([PGTripEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[1] = v13;
    v14 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:]([PGCompleteEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[2] = v14;
    v15 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:]([PGSceneCompleteEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[3] = v15;
    v16 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:]([PGPartialEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[4] = v16;
    v17 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:]([PGDefaultEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v8, v11);
    v26[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
    v18 = objc_claimAutoreleasedReturnValue();
    enrichmentProfiles = v7->_enrichmentProfiles;
    v7->_enrichmentProfiles = (NSArray *)v18;

    v20 = dispatch_group_create();
    enrichmentCommitGroup = v7->_enrichmentCommitGroup;
    v7->_enrichmentCommitGroup = (OS_dispatch_group *)v20;

    v22 = -[PGMoodGenerationContext initWithReferenceDate:]([PGMoodGenerationContext alloc], "initWithReferenceDate:", 0);
    moodGenerationContext = v7->_moodGenerationContext;
    v7->_moodGenerationContext = v22;

  }
  return v7;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGHighlightTailor;
  return -[PGHighlightTailor init](&v3, sel_init);
}

- (id)assetSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)highlightVisibilityWeightForItem:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  int v11;
  int v12;
  double v13;
  int v14;
  double v15;
  double v16;

  v3 = a3;
  objc_msgSend(v3, "clsContentScore");
  v5 = v4;
  objc_msgSend(v3, "clsAutoplaySuggestionScore");
  v7 = v6;
  objc_msgSend(v3, "clsBehavioralScore");
  v9 = v8;
  if (objc_msgSend(v3, "isVideo"))
  {
    objc_msgSend(v3, "clsDuration");
    if (v10 >= 2.0 && (objc_msgSend(v3, "clsHasPoorResolution") & 1) == 0)
    {
      v12 = objc_msgSend(v3, "clsIsLongExposure");
      v11 = 1;
      goto LABEL_7;
    }
  }
  v11 = objc_msgSend(v3, "clsIsLoopOrBounce");
  v12 = objc_msgSend(v3, "clsIsLongExposure");
  v13 = 0.0;
  if (v11)
LABEL_7:
    v13 = 20.0;
  if (v7 > 0.5)
    v14 = 1;
  else
    v14 = v11;
  v15 = 100.0;
  if (v12)
    v15 = 0.0;
  if (!v14)
    v15 = 0.0;
  v16 = (v13 + v15 + v5 * 10.0 + v9) / 131.0;

  return v16;
}

- (id)computeChangedVisibilityScoresForItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PGHighlightTailor highlightVisibilityWeightForItem:](self, "highlightVisibilityWeightForItem:", v11, (_QWORD)v17);
        v13 = v12;
        v14 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v11, "clsHighlightVisibilityScore");
        if ((objc_msgSend(v14, "isScore:closeToValue:") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v15, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)tailorOptionsAllowedForHighlight:(id)a3 originalOptions:(unint64_t)a4
{
  int v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "kind");
  v6 = -1073741824;
  if (v5 == 3)
    v6 = -1073741793;
  if (!v5)
    v6 = -1073741569;
  return v6 & a4;
}

- (id)enrichmentValuesForHighlight:(id)a3 usingEnrichmentProfile:(id)a4 graph:(id)a5 options:(unint64_t)a6 reportChangedValuesOnly:(BOOL)a7 highlightTailorContext:(id)a8 progressBlock:(id)a9
{
  id v12;
  id v13;
  double v14;
  char v15;
  PGHighlightEnrichmentValues *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  OS_os_log *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  id *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  int v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  double Current;
  char v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  OS_os_log *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  double *v71;
  double v72;
  uint64_t m;
  double v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  double v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  double v94;
  char v95;
  NSObject *v96;
  id v97;
  double v98;
  double v99;
  double v100;
  double v101;
  char v102;
  NSObject *v103;
  id v104;
  OS_os_log *v105;
  os_signpost_id_t v106;
  NSObject *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t k;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  BOOL v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  unsigned int v126;
  unsigned int v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  double v131;
  char v132;
  NSObject *v133;
  id v134;
  OS_os_log *v135;
  os_signpost_id_t v136;
  NSObject *v137;
  NSObject *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  _BOOL4 v143;
  int v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  unsigned int v151;
  unsigned int v152;
  NSObject *v153;
  NSObject *v154;
  NSObject *v155;
  double v156;
  char v157;
  NSObject *v158;
  id v159;
  OS_os_log *v160;
  os_signpost_id_t v161;
  NSObject *v162;
  NSObject *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint32_t numer;
  uint32_t denom;
  NSObject *v186;
  NSObject *v187;
  NSObject *v188;
  void *v189;
  void *v190;
  double v191;
  char v192;
  NSObject *v193;
  id v194;
  OS_os_log *v195;
  os_signpost_id_t v196;
  NSObject *v197;
  NSObject *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  uint32_t v219;
  uint32_t v220;
  NSObject *v221;
  NSObject *v222;
  NSObject *v223;
  double v224;
  char v225;
  NSObject *v226;
  id v227;
  void *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t i;
  void *v237;
  void *v238;
  double v239;
  double v240;
  double v241;
  id v242;
  double v243;
  char v244;
  NSObject *v245;
  id v246;
  void *v247;
  void *v248;
  id v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t j;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  id v259;
  double v260;
  char v261;
  NSObject *v262;
  id v263;
  unsigned __int8 v264;
  int v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  uint64_t v269;
  OS_os_log *v270;
  OS_os_log *v271;
  double v272;
  char v273;
  NSObject *v274;
  id v275;
  os_signpost_id_t spid;
  uint64_t v278;
  void *context;
  NSObject *v280;
  unint64_t v281;
  void *v282;
  void *v283;
  void *v284;
  uint64_t v285;
  int v286;
  void *v287;
  id v288;
  void *v289;
  id v290;
  char v291;
  void *v292;
  _BOOL4 v293;
  void *v294;
  PGHighlightEnrichmentValues *v295;
  char obj;
  id obja;
  id objb;
  void *v299;
  void *v300;
  id v301;
  void *v303;
  void *v304;
  id v305;
  void *v306;
  unsigned int (**v307)(void *, void *, void *, id);
  void *v309;
  id v310;
  void (**v311)(void *, _BYTE *, double);
  id v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  id v321;
  id v322;
  id v323;
  id v324;
  id v325;
  id v326;
  mach_timebase_info v327;
  _QWORD aBlock[5];
  id v329;
  _BYTE *v330;
  BOOL v331;
  _QWORD v332[4];
  void (**v333)(void *, _BYTE *, double);
  uint64_t *v334;
  uint64_t *v335;
  uint64_t v336;
  _QWORD v337[4];
  void (**v338)(void *, _BYTE *, double);
  uint64_t *v339;
  uint64_t *v340;
  uint64_t v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  _QWORD v354[4];
  void (**v355)(void *, _BYTE *, double);
  uint64_t *v356;
  uint64_t *v357;
  uint64_t v358;
  _QWORD v359[4];
  void (**v360)(void *, _BYTE *, double);
  uint64_t *v361;
  uint64_t *v362;
  uint64_t v363;
  _QWORD v364[4];
  id v365[4];
  _QWORD v366[4];
  id v367[4];
  uint64_t v368;
  double *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t *v373;
  uint64_t v374;
  char v375;
  _BYTE v376[128];
  _BYTE v377[128];
  _BYTE info[22];
  _BYTE buf[24];
  char v380;
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  uint64_t v384;

  v293 = a7;
  v384 = *MEMORY[0x1E0C80C00];
  v312 = a3;
  v12 = a4;
  v310 = a5;
  v13 = a8;
  v301 = a9;
  v372 = 0;
  v373 = &v372;
  v374 = 0x2020000000;
  v375 = 0;
  v368 = 0;
  v369 = (double *)&v368;
  v370 = 0x2020000000;
  v371 = 0;
  v309 = v12;
  v311 = (void (**)(void *, _BYTE *, double))_Block_copy(v301);
  v300 = v13;
  if (!v311
    || (v14 = CFAbsoluteTimeGetCurrent(), v14 - v369[3] < 0.01)
    || (v369[3] = v14,
        info[0] = 0,
        v311[2](v311, info, 0.0),
        v15 = *((_BYTE *)v373 + 24) | info[0],
        (*((_BYTE *)v373 + 24) = v15) == 0))
  {
    objc_msgSend(v12, "highlightInfoWithHighlight:graph:highlightTailorContext:", v312, v310, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v16 = 0;
LABEL_371:

      goto LABEL_372;
    }
    v295 = -[PGHighlightEnrichmentValues initWithHighlight:]([PGHighlightEnrichmentValues alloc], "initWithHighlight:", v312);
    objc_msgSend(v312, "assetCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = -[PGHighlightTailor tailorOptionsAllowedForHighlight:originalOptions:](self, "tailorOptionsAllowedForHighlight:originalOptions:", v18, a6);
    v19 = objc_msgSend(v312, "isUpToDate");
    v20 = objc_msgSend(v12, "enrichmentStateWithHighlightInfo:", v17);
    v21 = objc_msgSend(v312, "enrichmentState");
    v299 = v17;
    v294 = v18;
    if ((a6 & 0x40000000) == 0 && ((v19 ^ 1) & 1) == 0 && v20 == v21)
      goto LABEL_363;
    v22 = objc_msgSend(v18, "sharingComposition");
    if (v22)
    {
      if (v22 == 1)
      {
        v24 = (void *)MEMORY[0x1CAA4EB2C]();
        v26 = 0;
        v27 = 0;
        v25 = v18;
        goto LABEL_20;
      }
      if (v22 != 2)
      {
        v24 = (void *)MEMORY[0x1CAA4EB2C]();
        v28 = 0;
        v286 = 0;
        v285 = 0;
        v26 = 0;
        goto LABEL_23;
      }
      v23 = 1;
    }
    else
    {
      v23 = 0;
    }
    v24 = (void *)MEMORY[0x1CAA4EB2C]();
    v25 = v18;
    -[PGHighlightTailor keyAssetFromHighlight:sharingFilter:](self, "keyAssetFromHighlight:sharingFilter:", v18, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 1;
    if ((v23 & 1) == 0)
    {
      v286 = 1;
      v28 = 0;
      v285 = 0;
LABEL_23:
      v29 = 0;
      goto LABEL_25;
    }
LABEL_20:
    -[PGHighlightTailor keyAssetFromHighlight:sharingFilter:](self, "keyAssetFromHighlight:sharingFilter:", v25, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v27 & 1) != 0)
    {
      +[PGHighlightEnrichmentUtilities keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:](PGHighlightEnrichmentUtilities, "keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:", objc_msgSend(v25, "mixedSharingCompositionKeyAssetRelationship"), v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v286 = 1;
      v285 = 0x100000001;
    }
    else
    {
      v285 = 0x100000000;
      v29 = 0;
      v286 = 0;
    }
LABEL_25:
    if ((v291 & 8) == 0)
    {
      v30 = v26;
      v290 = v28;
      v288 = v29;
LABEL_62:
      v289 = v30;
      objc_msgSend(v30, "uuid");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "setKeyAssetPrivateUUID:", v49);

      objc_msgSend(v290, "uuid");
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "setKeyAssetSharedUUID:", v34);
      v40 = 1;
LABEL_63:

      objc_autoreleasePoolPop(v24);
      if (!v40)
      {
LABEL_69:
        v52 = 1;
        goto LABEL_361;
      }
      if (v311)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v369[3] >= 0.01)
        {
          v369[3] = Current;
          info[0] = 0;
          v311[2](v311, info, 0.1);
          v51 = *((_BYTE *)v373 + 24) | info[0];
          *((_BYTE *)v373 + 24) = v51;
          if (v51)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 280;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            goto LABEL_69;
          }
        }
      }
      -[PGHighlightTailor assetSortDescriptors](self, "assetSortDescriptors");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1CAA4EB2C]();
      -[PGHighlightTailor sortedCurationOfType:fromHighlight:](self, "sortedCurationOfType:fromHighlight:", 2, v294);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v299;
      v56 = v54;
      if ((v291 & 0x10) == 0)
      {
        v57 = v54;
LABEL_133:
        objc_msgSend(v55, "setNumberOfExtendedAssets:", objc_msgSend(v57, "count"));
        objc_msgSend(v57, "valueForKey:", CFSTR("uuid"));
        v61 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setUuidsOfEligibleAssets:", v61);
        v282 = v57;
        v68 = 1;
LABEL_134:

        objc_autoreleasePoolPop(v53);
        if (!v68)
        {
LABEL_237:
          v52 = 1;
LABEL_360:

LABEL_361:
          v18 = v294;
          if (v52)
          {
            v16 = 0;
LABEL_370:

            v17 = v299;
            goto LABEL_371;
          }
LABEL_363:
          if (v311
            && (v272 = CFAbsoluteTimeGetCurrent(), v272 - v369[3] >= 0.01)
            && (v369[3] = v272,
                info[0] = 0,
                v311[2](v311, info, 1.0),
                v273 = *((_BYTE *)v373 + 24) | info[0],
                (*((_BYTE *)v373 + 24) = v273) != 0))
          {
            v274 = MEMORY[0x1E0C81028];
            v275 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v274, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 608;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v16 = 0;
            v18 = v294;
          }
          else
          {
            v16 = v295;
          }
          goto LABEL_370;
        }
        if (v311)
        {
          v94 = CFAbsoluteTimeGetCurrent();
          if (v94 - v369[3] >= 0.01)
          {
            v369[3] = v94;
            info[0] = 0;
            v93 = ((uint64_t (*)(void *, _BYTE *, double))v311[2])(v311, info, 0.2);
            v95 = *((_BYTE *)v373 + 24) | info[0];
            *((_BYTE *)v373 + 24) = v95;
            if (v95)
            {
              v96 = MEMORY[0x1E0C81028];
              v97 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 354;
                *(_WORD *)&buf[8] = 2080;
                *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
LABEL_140:

              goto LABEL_237;
            }
          }
        }
        if ((v291 & 1) != 0)
        {
          objc_msgSend(v309, "promotionScoreWithHighlightInfo:", v299);
          v99 = v98;
          objc_msgSend(v294, "promotionScore");
          if (!v293 || v99 != v100)
            -[PGHighlightEnrichmentValues setPromotionScore:](v295, "setPromotionScore:", v99);
          v93 = objc_msgSend(v299, "setPromotionScore:", v99);
        }
        if (v311)
        {
          v101 = CFAbsoluteTimeGetCurrent();
          if (v101 - v369[3] >= 0.01)
          {
            v369[3] = v101;
            info[0] = 0;
            v93 = ((uint64_t (*)(void *, _BYTE *, double))v311[2])(v311, info, 0.3);
            v102 = *((_BYTE *)v373 + 24) | info[0];
            *((_BYTE *)v373 + 24) = v102;
            if (v102)
            {
              v103 = MEMORY[0x1E0C81028];
              v104 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 365;
                *(_WORD *)&buf[8] = 2080;
                *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              goto LABEL_140;
            }
          }
        }
        if ((v291 & 0x20) == 0)
        {
LABEL_195:
          if (v311)
          {
            v131 = CFAbsoluteTimeGetCurrent();
            if (v131 - v369[3] >= 0.01)
            {
              v369[3] = v131;
              info[0] = 0;
              v93 = ((uint64_t (*)(void *, _BYTE *, double))v311[2])(v311, info, 0.4);
              v132 = *((_BYTE *)v373 + 24) | info[0];
              *((_BYTE *)v373 + 24) = v132;
              if (v132)
              {
                v133 = MEMORY[0x1E0C81028];
                v134 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = 408;
                  *(_WORD *)&buf[8] = 2080;
                  *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Enrich/PGHighlightTailor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                goto LABEL_237;
              }
            }
          }
          if ((v291 & 0x10) == 0)
          {
LABEL_231:
            if (v311)
            {
              v156 = CFAbsoluteTimeGetCurrent();
              if (v156 - v369[3] >= 0.01)
              {
                v369[3] = v156;
                info[0] = 0;
                v311[2](v311, info, 0.6);
                v157 = *((_BYTE *)v373 + 24) | info[0];
                *((_BYTE *)v373 + 24) = v157;
                if (v157)
                {
                  v158 = MEMORY[0x1E0C81028];
                  v159 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = 444;
                    *(_WORD *)&buf[8] = 2080;
                    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  goto LABEL_237;
                }
              }
            }
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v380 = 1;
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_151;
            aBlock[3] = &unk_1E842DD38;
            v331 = v293;
            v330 = buf;
            aBlock[4] = self;
            objb = v312;
            v329 = objb;
            v307 = (unsigned int (**)(void *, void *, void *, id))_Block_copy(aBlock);
            if ((v291 & 2) != 0)
            {
              v160 = self->_loggingConnection;
              v161 = os_signpost_id_generate((os_log_t)v160);
              v162 = v160;
              v163 = v162;
              if (v161 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v162))
              {
                *(_WORD *)info = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v163, OS_SIGNPOST_INTERVAL_BEGIN, v161, "PGHighlightTailorGenerateTitle", ", info, 2u);
              }

              v327 = 0;
              mach_timebase_info(&v327);
              v164 = mach_absolute_time();
              if (v286)
              {
                v165 = (void *)MEMORY[0x1CAA4EB2C]();
                v326 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 0, v282, v289, 0, &v326);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                v167 = v326;
                objc_msgSend(v166, "title");
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "stringValue");
                v169 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "smartDescriptionPrivate");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v169, v170, v167))
                  -[PGHighlightEnrichmentValues setSmartDescriptionPrivate:](v295, "setSmartDescriptionPrivate:", v169);

                objc_autoreleasePoolPop(v165);
              }
              if (HIDWORD(v285))
              {
                v171 = (void *)MEMORY[0x1CAA4EB2C]();
                v325 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 1, v282, v290, 0, &v325);
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                v173 = v325;
                objc_msgSend(v172, "title");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "stringValue");
                v175 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "smartDescriptionShared");
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v175, v176, v173))
                  -[PGHighlightEnrichmentValues setSmartDescriptionShared:](v295, "setSmartDescriptionShared:", v175);

                objc_autoreleasePoolPop(v171);
              }
              if ((_DWORD)v285)
              {
                v177 = (void *)MEMORY[0x1CAA4EB2C]();
                v324 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 2, v282, v288, 0, &v324);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v179 = v324;
                objc_msgSend(v178, "title");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "stringValue");
                v181 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "smartDescriptionMixed");
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v181, v182, v179))
                  -[PGHighlightEnrichmentValues setSmartDescriptionMixed:](v295, "setSmartDescriptionMixed:", v181);

                objc_autoreleasePoolPop(v177);
              }
              v183 = mach_absolute_time();
              numer = v327.numer;
              denom = v327.denom;
              v186 = v163;
              v187 = v186;
              if (v161 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
              {
                *(_WORD *)info = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v187, OS_SIGNPOST_INTERVAL_END, v161, "PGHighlightTailorGenerateTitle", ", info, 2u);
              }

              v188 = v187;
              if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)info = 136315394;
                *(_QWORD *)&info[4] = "PGHighlightTailorGenerateTitle";
                *(_WORD *)&info[12] = 2048;
                *(double *)&info[14] = (float)((float)((float)((float)(v183 - v164) * (float)numer) / (float)denom)
                                             / 1000000.0);
                _os_log_impl(&dword_1CA237000, v188, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", info, 0x16u);
              }

            }
            v189 = v309;
            v190 = v299;
            if (v311)
            {
              v191 = CFAbsoluteTimeGetCurrent();
              if (v191 - v369[3] >= 0.01)
              {
                v369[3] = v191;
                LOBYTE(v327.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v311)[2](v311, &v327, 0.7);
                v192 = *((_BYTE *)v373 + 24) | LOBYTE(v327.numer);
                *((_BYTE *)v373 + 24) = v192;
                if (v192)
                {
                  v193 = MEMORY[0x1E0C81028];
                  v194 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)info = 67109378;
                    *(_DWORD *)&info[4] = 501;
                    *(_WORD *)&info[8] = 2080;
                    *(_QWORD *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v291 & 4) != 0)
            {
              v195 = self->_loggingConnection;
              v196 = os_signpost_id_generate((os_log_t)v195);
              v197 = v195;
              v198 = v197;
              if (v196 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v197))
              {
                *(_WORD *)info = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v198, OS_SIGNPOST_INTERVAL_BEGIN, v196, "PGHighlightTailorGenerateVerboseTitle", ", info, 2u);
              }

              v327 = 0;
              mach_timebase_info(&v327);
              v199 = mach_absolute_time();
              if (v286)
              {
                v200 = (void *)MEMORY[0x1CAA4EB2C]();
                v323 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 0, 0, 0, 1, &v323);
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                v202 = v323;
                objc_msgSend(v201, "title");
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v203, "stringValue");
                v204 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "verboseSmartDescriptionPrivate");
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v204, v205, v202))
                  -[PGHighlightEnrichmentValues setVerboseSmartDescriptionPrivate:](v295, "setVerboseSmartDescriptionPrivate:", v204);

                objc_autoreleasePoolPop(v200);
              }
              if (HIDWORD(v285))
              {
                v206 = (void *)MEMORY[0x1CAA4EB2C]();
                v322 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 1, 0, 0, 1, &v322);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                v208 = v322;
                objc_msgSend(v207, "title");
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v209, "stringValue");
                v210 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "verboseSmartDescriptionShared");
                v211 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v210, v211, v208))
                  -[PGHighlightEnrichmentValues setVerboseSmartDescriptionShared:](v295, "setVerboseSmartDescriptionShared:", v210);

                objc_autoreleasePoolPop(v206);
              }
              if ((_DWORD)v285)
              {
                v212 = (void *)MEMORY[0x1CAA4EB2C]();
                v321 = 0;
                objc_msgSend(v309, "titleWithHighlightInfo:sharingFilter:curatedAssets:keyAsset:createVerboseTitle:error:", v299, 2, 0, 0, 1, &v321);
                v213 = (void *)objc_claimAutoreleasedReturnValue();
                v214 = v321;
                objc_msgSend(v213, "title");
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v215, "stringValue");
                v216 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v294, "verboseSmartDescriptionMixed");
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                if (v307[2](v307, v216, v217, v214))
                  -[PGHighlightEnrichmentValues setVerboseSmartDescriptionMixed:](v295, "setVerboseSmartDescriptionMixed:", v216);

                objc_autoreleasePoolPop(v212);
              }
              v218 = mach_absolute_time();
              v219 = v327.numer;
              v220 = v327.denom;
              v221 = v198;
              v222 = v221;
              if (v196 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v221))
              {
                *(_WORD *)info = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v222, OS_SIGNPOST_INTERVAL_END, v196, "PGHighlightTailorGenerateVerboseTitle", ", info, 2u);
              }

              v223 = v222;
              if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)info = 136315394;
                *(_QWORD *)&info[4] = "PGHighlightTailorGenerateVerboseTitle";
                *(_WORD *)&info[12] = 2048;
                *(double *)&info[14] = (float)((float)((float)((float)(v218 - v199) * (float)v219) / (float)v220)
                                             / 1000000.0);
                _os_log_impl(&dword_1CA237000, v223, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", info, 0x16u);
              }

              v189 = v309;
              v190 = v299;
            }
            if (v311)
            {
              v224 = CFAbsoluteTimeGetCurrent();
              if (v224 - v369[3] >= 0.01)
              {
                v369[3] = v224;
                LOBYTE(v327.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v311)[2](v311, &v327, 0.8);
                v225 = *((_BYTE *)v373 + 24) | LOBYTE(v327.numer);
                *((_BYTE *)v373 + 24) = v225;
                if (v225)
                {
                  v226 = MEMORY[0x1E0C81028];
                  v227 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)info = 67109378;
                    *(_DWORD *)&info[4] = 536;
                    *(_WORD *)&info[8] = 2080;
                    *(_QWORD *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v291 & 0x40) != 0)
            {
              v287 = (void *)MEMORY[0x1CAA4EB2C]();
              objc_msgSend(v299, "feeder");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v228, "allItems");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGHighlightTailor computeChangedVisibilityScoresForItems:](self, "computeChangedVisibilityScoresForItems:", v229);
              v230 = objc_claimAutoreleasedReturnValue();
              v231 = (void *)v230;
              if (v293)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                v319 = 0u;
                v320 = 0u;
                v317 = 0u;
                v318 = 0u;
                objc_msgSend(v231, "keyEnumerator");
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v317, v377, 16);
                if (v234)
                {
                  v235 = *(_QWORD *)v318;
                  do
                  {
                    for (i = 0; i != v234; ++i)
                    {
                      if (*(_QWORD *)v318 != v235)
                        objc_enumerationMutation(v233);
                      v237 = *(void **)(*((_QWORD *)&v317 + 1) + 8 * i);
                      objc_msgSend(v231, "objectForKey:", v237);
                      v238 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v237, "highlightVisibilityScore");
                      v240 = v239;
                      objc_msgSend(v238, "doubleValue");
                      if (v241 != v240)
                        objc_msgSend(v232, "setObject:forKey:", v238, v237);

                    }
                    v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v317, v377, 16);
                  }
                  while (v234);
                }

                v242 = v232;
              }
              else
              {
                v242 = (id)v230;
              }
              if (objc_msgSend(v242, "count"))
                -[PGHighlightEnrichmentValues setVisibilityScoreByAsset:](v295, "setVisibilityScoreByAsset:", v242);

              objc_autoreleasePoolPop(v287);
              v189 = v309;
              v190 = v299;
            }
            if (v311)
            {
              v243 = CFAbsoluteTimeGetCurrent();
              if (v243 - v369[3] >= 0.01)
              {
                v369[3] = v243;
                LOBYTE(v327.numer) = 0;
                ((void (**)(void *, mach_timebase_info *, double))v311)[2](v311, &v327, 0.9);
                v244 = *((_BYTE *)v373 + 24) | LOBYTE(v327.numer);
                *((_BYTE *)v373 + 24) = v244;
                if (v244)
                {
                  v245 = MEMORY[0x1E0C81028];
                  v246 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)info = 67109378;
                    *(_DWORD *)&info[4] = 561;
                    *(_WORD *)&info[8] = 2080;
                    *(_QWORD *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Enrich/PGHighlightTailor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
                  }

                  goto LABEL_340;
                }
              }
            }
            if ((v291 & 0x80) == 0)
            {
LABEL_334:
              if (!v311
                || (v260 = CFAbsoluteTimeGetCurrent(), v260 - v369[3] < 0.01)
                || (v369[3] = v260,
                    LOBYTE(v327.numer) = 0,
                    ((void (**)(void *, mach_timebase_info *, double))v311)[2](v311, &v327, 0.95),
                    v261 = *((_BYTE *)v373 + 24) | LOBYTE(v327.numer),
                    (*((_BYTE *)v373 + 24) = v261) == 0))
              {
                if ((_BYTE)a6 == 0xFF)
                {
                  v264 = objc_msgSend(v189, "canUseLocationInformationWithHighlightInfo:graph:", v190, v310);
                  v265 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
                  v266 = objc_msgSend(v189, "enrichmentStateWithHighlightInfo:", v190);
                  v267 = v266;
                  if (v266 >= 2)
                    v268 = 2;
                  else
                    v268 = v266;
                  if (((v265 != 0) & v264) != 0)
                    v269 = v266;
                  else
                    v269 = v268;
                  if ((v264 & 1) == 0)
                  {
                    v270 = self->_loggingConnection;
                    if (os_log_type_enabled((os_log_t)v270, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)info = 67109376;
                      *(_DWORD *)&info[4] = v267;
                      *(_WORD *)&info[8] = 1024;
                      *(_DWORD *)&info[10] = v269;
                      _os_log_impl(&dword_1CA237000, (os_log_t)v270, OS_LOG_TYPE_DEFAULT, "[PGHighlightTailor] Couldn't satisfy enrichment state %d: not enough location data available. Falling back to enrichment state %d", info, 0xEu);
                    }

                  }
                  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                  {
                    v271 = self->_loggingConnection;
                    if (os_log_type_enabled((os_log_t)v271, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)info = 67109376;
                      *(_DWORD *)&info[4] = v267;
                      *(_WORD *)&info[8] = 1024;
                      *(_DWORD *)&info[10] = v269;
                      _os_log_impl(&dword_1CA237000, (os_log_t)v271, OS_LOG_TYPE_DEFAULT, "[PGHighlightTailor] Couldn't satisfy enrichment state %d: error encountered while generating titles. Falling back to enrichment state %d", info, 0xEu);
                    }

                  }
                  if (objc_msgSend(objb, "enrichmentState") != (_DWORD)v269)
                    -[PGHighlightEnrichmentValues setEnrichmentState:](v295, "setEnrichmentState:", v269);
                }
                v52 = 0;
                goto LABEL_359;
              }
              v262 = MEMORY[0x1E0C81028];
              v263 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v262, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)info = 67109378;
                *(_DWORD *)&info[4] = 582;
                *(_WORD *)&info[8] = 2080;
                *(_QWORD *)&info[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Enrich/PGHighlightTailor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", info, 0x12u);
              }

LABEL_340:
              v52 = 1;
LABEL_359:

              _Block_object_dispose(buf, 8);
              goto LABEL_360;
            }
            v292 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v309, "momentProcessedLocationByMomentUUIDWithHighlightInfo:graph:", v299, v310);
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            v248 = v247;
            if (v293)
            {
              if (objc_msgSend(v247, "count"))
              {
                v249 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v299, "momentFetchResult");
                v315 = 0u;
                v316 = 0u;
                v313 = 0u;
                v314 = 0u;
                v250 = (id)objc_claimAutoreleasedReturnValue();
                v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v313, v376, 16);
                if (v251)
                {
                  v252 = *(_QWORD *)v314;
                  do
                  {
                    for (j = 0; j != v251; ++j)
                    {
                      if (*(_QWORD *)v314 != v252)
                        objc_enumerationMutation(v250);
                      v254 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * j);
                      objc_msgSend(v254, "uuid");
                      v255 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v248, "objectForKeyedSubscript:", v255);
                      v256 = (void *)objc_claimAutoreleasedReturnValue();
                      v257 = objc_msgSend(v256, "unsignedShortValue");

                      if (objc_msgSend(v254, "processedLocation") != (_DWORD)v257)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v257);
                        v258 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v249, "setObject:forKeyedSubscript:", v258, v255);

                      }
                    }
                    v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v313, v376, 16);
                  }
                  while (v251);
                }

                v259 = v249;
              }
              else
              {
                v259 = v248;
              }
              if (!objc_msgSend(v259, "count"))
                goto LABEL_333;
            }
            else
            {
              v259 = v247;
            }
            -[PGHighlightEnrichmentValues setMomentProcessedLocationByMomentUUID:](v295, "setMomentProcessedLocationByMomentUUID:", v259);
LABEL_333:

            objc_autoreleasePoolPop(v292);
            v189 = v309;
            v190 = v299;
            goto LABEL_334;
          }
          v306 = (void *)MEMORY[0x1CAA4EB2C](v93);
          v135 = self->_loggingConnection;
          v136 = os_signpost_id_generate((os_log_t)v135);
          v137 = v135;
          v138 = v137;
          if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v136, "PGHighlightTailorGenerateSummaryCuration", ", buf, 2u);
          }

          *(_QWORD *)info = 0;
          mach_timebase_info((mach_timebase_info_t)info);
          v139 = mach_absolute_time();
          -[PGHighlightTailor sortedCurationOfType:fromHighlight:](self, "sortedCurationOfType:fromHighlight:", 1, v294);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          if (v286)
          {
            v337[0] = MEMORY[0x1E0C809B0];
            v337[1] = 3221225472;
            v337[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_149;
            v337[3] = &unk_1E8434F30;
            v338 = v311;
            v339 = &v368;
            v341 = 0x3F847AE147AE147BLL;
            v340 = &v372;
            objc_msgSend(v309, "summaryCurationWithHighlightInfo:sharingFilter:progressBlock:", v299, 0, v337);
            v141 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v141 = 0;
          }
          if ((v285 & 0x100000000) != 0)
          {
            v332[0] = MEMORY[0x1E0C809B0];
            v332[1] = 3221225472;
            v332[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_2;
            v332[3] = &unk_1E8434F30;
            v333 = v311;
            v334 = &v368;
            v336 = 0x3F847AE147AE147BLL;
            v335 = &v372;
            objc_msgSend(v309, "summaryCurationWithHighlightInfo:sharingFilter:progressBlock:", v299, 1, v332);
            v142 = (void *)objc_claimAutoreleasedReturnValue();

            v143 = v141 != 0;
            v144 = v285;
            if (!v141)
              v144 = 0;
            if (v144 == 1 && v142)
            {
              objc_msgSend(v141, "arrayByAddingObjectsFromArray:", v142);
              v145 = (id)objc_claimAutoreleasedReturnValue();
LABEL_219:
              v147 = v145;
              objc_msgSend(v145, "sortedArrayUsingDescriptors:", v284);
              v148 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v293 || (objc_msgSend(v148, "isEqualToArray:", v140) & 1) == 0)
              {
                if (v148)
                  v149 = v148;
                else
                  v149 = (void *)MEMORY[0x1E0C9AA60];
                -[PGHighlightEnrichmentValues setSummaryCuration:](v295, "setSummaryCuration:", v149);
              }
              v150 = mach_absolute_time();
              v151 = *(_DWORD *)info;
              v152 = *(_DWORD *)&info[4];
              v153 = v138;
              v154 = v153;
              if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v154, OS_SIGNPOST_INTERVAL_END, v136, "PGHighlightTailorGenerateSummaryCuration", ", buf, 2u);
              }

              v155 = v154;
              if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "PGHighlightTailorGenerateSummaryCuration";
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = (float)((float)((float)((float)(v150 - v139) * (float)v151) / (float)v152)
                                            / 1000000.0);
                _os_log_impl(&dword_1CA237000, v155, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              objc_autoreleasePoolPop(v306);
              goto LABEL_231;
            }
          }
          else
          {
            v142 = 0;
            v143 = v141 != 0;
          }
          if (v143)
            v146 = v141;
          else
            v146 = v142;
          v145 = v146;
          goto LABEL_219;
        }
        context = (void *)MEMORY[0x1CAA4EB2C](v93);
        v105 = self->_loggingConnection;
        v106 = os_signpost_id_generate((os_log_t)v105);
        v107 = v105;
        v108 = v107;
        v281 = v106 - 1;
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v108, OS_SIGNPOST_INTERVAL_BEGIN, v106, "PGHighlightTailorGenerateMomentTitles", ", buf, 2u);
        }
        spid = v106;
        v280 = v108;

        *(_QWORD *)info = 0;
        mach_timebase_info((mach_timebase_info_t)info);
        v278 = mach_absolute_time();
        objc_msgSend(v309, "momentTitleByMomentUUIDWithHighlightInfo:", v299);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v109;
        if (v293)
        {
          if (objc_msgSend(v109, "count"))
          {
            v305 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v299, "momentFetchResult");
            v344 = 0u;
            v345 = 0u;
            v342 = 0u;
            v343 = 0u;
            obja = (id)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v342, v381, 16);
            if (!v111)
              goto LABEL_181;
            v112 = *(_QWORD *)v343;
            while (1)
            {
              for (k = 0; k != v111; ++k)
              {
                if (*(_QWORD *)v343 != v112)
                  objc_enumerationMutation(obja);
                v114 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * k);
                objc_msgSend(v114, "uuid");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "objectForKeyedSubscript:", v115);
                v116 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v116, "title");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "stringValue");
                v118 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v114, "title");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v118, "length") || !objc_msgSend(v119, "length"))
                {
                  v120 = !objc_msgSend(v118, "length") || v118 == v119;
                  if (v120 || (objc_msgSend(v118, "isEqualToString:", v119) & 1) != 0)
                  {
                    objc_msgSend(v116, "subtitle");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v121, "stringValue");
                    v122 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v114, "localizedSubtitle");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v122, "length") || !objc_msgSend(v123, "length"))
                      && (!objc_msgSend(v122, "length")
                       || v122 == v123
                       || (objc_msgSend(v122, "isEqualToString:", v123) & 1) != 0))
                    {

                      goto LABEL_179;
                    }

                  }
                }
                objc_msgSend(v114, "uuid");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v305, "setObject:forKeyedSubscript:", v116, v122);
LABEL_179:

              }
              v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v342, v381, 16);
              if (!v111)
              {
LABEL_181:

                v124 = v305;
                goto LABEL_187;
              }
            }
          }
          v124 = v110;
LABEL_187:
          if (!objc_msgSend(v124, "count"))
            goto LABEL_189;
        }
        else
        {
          v124 = v109;
        }
        -[PGHighlightEnrichmentValues setMomentTitleByMomentUUID:](v295, "setMomentTitleByMomentUUID:", v124);
LABEL_189:
        v125 = mach_absolute_time();
        v126 = *(_DWORD *)info;
        v127 = *(_DWORD *)&info[4];
        v128 = v280;
        v129 = v128;
        if (v281 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v129, OS_SIGNPOST_INTERVAL_END, spid, "PGHighlightTailorGenerateMomentTitles", ", buf, 2u);
        }

        v130 = v129;
        if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "PGHighlightTailorGenerateMomentTitles";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v125 - v278) * (float)v126) / (float)v127) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v130, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        objc_autoreleasePoolPop(context);
        goto LABEL_195;
      }
      v58 = self->_loggingConnection;
      v59 = os_signpost_id_generate((os_log_t)v58);
      v60 = v58;
      v61 = v60;
      if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "PGHighlightTailorGenerateExtendedCuration", ", buf, 2u);
      }

      *(_QWORD *)info = 0;
      mach_timebase_info((mach_timebase_info_t)info);
      v304 = (void *)mach_absolute_time();
      if (v286)
      {
        v359[0] = MEMORY[0x1E0C809B0];
        v359[1] = 3221225472;
        v359[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_144;
        v359[3] = &unk_1E8434F30;
        v360 = v311;
        v361 = &v368;
        v363 = 0x3F847AE147AE147BLL;
        v362 = &v372;
        objc_msgSend(v309, "extendedCurationWithHighlightInfo:sharingFilter:progressBlock:", v299, 0, v359);
        v62 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v373 + 24))
        {
          v63 = MEMORY[0x1E0C81028];
          v64 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 295;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Enrich/PGHighlightTailor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_87:
          v282 = 0;
          v68 = 0;
          goto LABEL_134;
        }

      }
      else
      {
        v62 = 0;
      }
      if (HIDWORD(v285))
      {
        v354[0] = MEMORY[0x1E0C809B0];
        v354[1] = 3221225472;
        v354[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_145;
        v354[3] = &unk_1E8434F30;
        v355 = v311;
        v356 = &v368;
        v358 = 0x3F847AE147AE147BLL;
        v357 = &v372;
        objc_msgSend(v309, "extendedCurationWithHighlightInfo:sharingFilter:progressBlock:", v299, 1, v354);
        v65 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v373 + 24))
        {
          v66 = MEMORY[0x1E0C81028];
          v67 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 303;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Enrich/PGHighlightTailor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_87;
        }

      }
      else
      {
        v65 = 0;
      }
      if ((_DWORD)v285)
      {
        v352 = 0u;
        v353 = 0u;
        v350 = 0u;
        v351 = 0u;
        v62 = v62;
        v69 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v350, v383, 16);
        if (v69)
        {
          v283 = v56;
          v70 = *(_QWORD *)v351;
          v71 = (double *)MEMORY[0x1E0D77DF0];
          v72 = *MEMORY[0x1E0D77DF0];
          while (2)
          {
            for (m = 0; m != v69; ++m)
            {
              if (*(_QWORD *)v351 != v70)
                objc_enumerationMutation(v62);
              objc_msgSend(*(id *)(*((_QWORD *)&v350 + 1) + 8 * m), "curationScore");
              if (v74 > v72)
              {
                obj = 0;
                goto LABEL_101;
              }
            }
            v69 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v350, v383, 16);
            if (v69)
              continue;
            break;
          }
          obj = 1;
LABEL_101:
          v56 = v283;
        }
        else
        {
          v71 = (double *)MEMORY[0x1E0D77DF0];
          obj = 1;
        }

        v75 = v56;
        v348 = 0u;
        v349 = 0u;
        v346 = 0u;
        v347 = 0u;
        v65 = v65;
        v76 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v346, v382, 16);
        if (v76)
        {
          v77 = *(_QWORD *)v347;
          v78 = *v71;
LABEL_105:
          v79 = 0;
          while (1)
          {
            if (*(_QWORD *)v347 != v77)
              objc_enumerationMutation(v65);
            objc_msgSend(*(id *)(*((_QWORD *)&v346 + 1) + 8 * v79), "curationScore");
            if (v80 > v78)
              break;
            if (v76 == ++v79)
            {
              v76 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v346, v382, 16);
              if (v76)
                goto LABEL_105;
              goto LABEL_111;
            }
          }

          v56 = v75;
          if ((obj & 1) == 0)
            goto LABEL_183;
          v81 = v62;
          v62 = 0;
        }
        else
        {
LABEL_111:

          v56 = v75;
          if ((obj & 1) != 0)
          {
LABEL_183:
            v82 = v62 != 0;
            if (v62 && v65)
            {
              objc_msgSend(v62, "arrayByAddingObjectsFromArray:", v65);
              v84 = (id)objc_claimAutoreleasedReturnValue();
LABEL_121:
              v85 = v84;
              objc_msgSend(v84, "sortedArrayUsingDescriptors:", v284);
              v57 = (id)objc_claimAutoreleasedReturnValue();

              if (!v293 || (objc_msgSend(v57, "isEqualToArray:", v56) & 1) == 0)
              {
                if (v57)
                  v86 = v57;
                else
                  v86 = (id)MEMORY[0x1E0C9AA60];
                -[PGHighlightEnrichmentValues setExtendedCuration:](v295, "setExtendedCuration:", v86);
              }
              v87 = mach_absolute_time();
              v88 = *(_DWORD *)info;
              v89 = *(_DWORD *)&info[4];
              v90 = v61;
              v91 = v90;
              if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v91, OS_SIGNPOST_INTERVAL_END, v59, "PGHighlightTailorGenerateExtendedCuration", ", buf, 2u);
              }

              v92 = v91;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "PGHighlightTailorGenerateExtendedCuration";
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = (float)((float)((float)((float)(v87 - (unint64_t)v304) * (float)v88)
                                                    / (float)v89)
                                            / 1000000.0);
                _os_log_impl(&dword_1CA237000, v92, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              v55 = v299;
              goto LABEL_133;
            }
LABEL_117:
            if (v82)
              v83 = v62;
            else
              v83 = v65;
            v84 = v83;
            goto LABEL_121;
          }
          v81 = v65;
          v65 = 0;
        }

      }
      v82 = v62 != 0;
      goto LABEL_117;
    }
    v31 = self->_loggingConnection;
    v32 = os_signpost_id_generate((os_log_t)v31);
    v33 = v31;
    v34 = v33;
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "PGHighlightTailorGenerateKeyAsset", ", buf, 2u);
    }

    *(_QWORD *)info = 0;
    mach_timebase_info((mach_timebase_info_t)info);
    v303 = (void *)mach_absolute_time();
    if (v286)
    {
      v366[0] = MEMORY[0x1E0C809B0];
      v366[1] = 3221225472;
      v366[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke;
      v366[3] = &unk_1E8434F30;
      v367[0] = v311;
      v367[1] = &v368;
      v367[3] = (id)0x3F847AE147AE147BLL;
      v367[2] = &v372;
      objc_msgSend(v309, "keyAssetWithHighlightInfo:sharingFilter:graph:progressBlock:", v299, 0, v310, v366);
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v373 + 24))
      {
        v35 = v367;
        v36 = MEMORY[0x1E0C81028];
        v37 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 239;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v290 = 0;
LABEL_44:

        v288 = 0;
        v40 = 0;
        goto LABEL_63;
      }
      if (!v293 || (objc_msgSend(v289, "isEqual:", v26) & 1) == 0)
        -[PGHighlightEnrichmentValues setKeyAssetPrivate:](v295, "setKeyAssetPrivate:", v289);

      v30 = v289;
    }
    else
    {
      v30 = 0;
    }
    if (HIDWORD(v285))
    {
      v289 = v30;
      v364[0] = MEMORY[0x1E0C809B0];
      v364[1] = 3221225472;
      v364[2] = __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_142;
      v364[3] = &unk_1E8434F30;
      v365[0] = v311;
      v365[1] = &v368;
      v365[3] = (id)0x3F847AE147AE147BLL;
      v365[2] = &v372;
      objc_msgSend(v309, "keyAssetWithHighlightInfo:sharingFilter:graph:progressBlock:", v299, 1, v310, v364);
      v290 = (id)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v373 + 24))
      {
        v35 = v365;
        v38 = MEMORY[0x1E0C81028];
        v39 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 249;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_44;
      }
      if (!v293 || (objc_msgSend(v290, "isEqual:", v28) & 1) == 0)
        -[PGHighlightEnrichmentValues setKeyAssetShared:](v295, "setKeyAssetShared:", v290);

    }
    else
    {
      v290 = 0;
    }
    if ((_DWORD)v285)
    {
      v41 = +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:](PGHighlightEnrichmentUtilities, "mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:", v30, v290, objc_msgSend(v312, "kind") == 3);
      +[PGHighlightEnrichmentUtilities keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:](PGHighlightEnrichmentUtilities, "keyAssetForMixedSharingCompositionKeyAssetRelationship:keyAssetPrivate:keyAssetShared:", v41, v30, v290);
      v288 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
      v288 = 0;
    }
    if (!v293 || objc_msgSend(v294, "mixedSharingCompositionKeyAssetRelationship") != (_DWORD)v41)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGHighlightEnrichmentValues setMixedSharingCompositionKeyAssetRelationshipValue:](v295, "setMixedSharingCompositionKeyAssetRelationshipValue:", v42);

    }
    v43 = mach_absolute_time();
    v44 = *(_DWORD *)info;
    v45 = *(_DWORD *)&info[4];
    v46 = v34;
    v47 = v46;
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_END, v32, "PGHighlightTailorGenerateKeyAsset", ", buf, 2u);
    }

    v48 = v47;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGHighlightTailorGenerateKeyAsset";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v43 - (unint64_t)v303) * (float)v44) / (float)v45)
                                  / 1000000.0);
      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    goto LABEL_62;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 175;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Enrich/PGHighlightTailor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = 0;
LABEL_372:
  _Block_object_dispose(&v368, 8);
  _Block_object_dispose(&v372, 8);

  return v16;
}

- (void)writeHighlightEnrichmentValues:(id)a3 toChangeRequest:(id)a4 highlight:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v6 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "clearCurations"))
  {
    objc_msgSend(v11, "setEnrichmentState:", 0);
    objc_msgSend(v11, "clearCurations");
    goto LABEL_49;
  }
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v6 == -1)
  {
    v14 = objc_msgSend(v10, "enrichmentState");
    if ((_DWORD)v14 == 0xFFFF)
    {
      if (!objc_msgSend(v12, "enrichmentState"))
        goto LABEL_7;
      goto LABEL_6;
    }
    v15 = v14;
    objc_msgSend(v11, "setEnrichmentState:", v14);
    if (v15)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastEnrichmentDate:", v16);

      objc_msgSend(v11, "didEnrichHighlight");
    }
  }
LABEL_7:
  objc_msgSend(v10, "promotionScore");
  if (v17 != -1.0)
    objc_msgSend(v11, "setPromotionScore:");
  if (objc_msgSend(v10, "smartDescriptionPrivateUpdated"))
  {
    objc_msgSend(v10, "smartDescriptionPrivate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSmartDescription:", v18);

  }
  if (objc_msgSend(v10, "verboseSmartDescriptionPrivateUpdated"))
  {
    objc_msgSend(v10, "verboseSmartDescriptionPrivate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVerboseSmartDescription:", v19);

  }
  if (objc_msgSend(v10, "smartDescriptionSharedUpdated"))
  {
    objc_msgSend(v10, "smartDescriptionShared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSmartDescriptionShared:", v20);

  }
  if (objc_msgSend(v10, "verboseSmartDescriptionSharedUpdated"))
  {
    objc_msgSend(v10, "verboseSmartDescriptionShared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVerboseSmartDescriptionShared:", v21);

  }
  if (objc_msgSend(v10, "smartDescriptionMixedUpdated"))
  {
    objc_msgSend(v10, "smartDescriptionMixed");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSmartDescriptionMixed:", v22);

  }
  v60 = v12;
  if (objc_msgSend(v10, "verboseSmartDescriptionMixedUpdated"))
  {
    objc_msgSend(v10, "verboseSmartDescriptionMixed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVerboseSmartDescriptionMixed:", v23);

  }
  objc_msgSend(v10, "momentTitleByMomentUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    objc_msgSend(v24, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v26;
    v67[1] = 3221225472;
    v67[2] = __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke;
    v67[3] = &unk_1E842DD60;
    v68 = v25;
    objc_msgSend(v11, "enumerateMomentChangeRequestsForUUIDs:inPhotoLibrary:usingBlock:", v27, v13, v67);

  }
  objc_msgSend(v10, "momentProcessedLocationByMomentUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v26;
    v65[1] = 3221225472;
    v65[2] = __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke_2;
    v65[3] = &unk_1E842DD60;
    v66 = v29;
    objc_msgSend(v11, "enumerateMomentChangeRequestsForUUIDs:inPhotoLibrary:usingBlock:", v30, v13, v65);

  }
  objc_msgSend(v10, "keyAssetPrivate");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v11, "setKeyAssetPrivate:", v31);
  objc_msgSend(v10, "keyAssetShared");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v11, "setKeyAssetShared:", v32);
  objc_msgSend(v10, "mixedSharingCompositionKeyAssetRelationshipValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
    objc_msgSend(v11, "setMixedSharingCompositionKeyAssetRelationship:", objc_msgSend(v33, "unsignedShortValue"));
  objc_msgSend(v10, "extendedCuration");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v11, "setAssets:forCurationType:", v35, 2);
  v55 = (void *)v32;
  v57 = v29;
  objc_msgSend(v10, "summaryCuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if (objc_msgSend(v36, "count"))
      objc_msgSend(v11, "setAssets:forCurationType:", v37, 1);
    else
      objc_msgSend(v11, "clearCurationWithType:", 1);
  }
  v52 = v37;
  v53 = (void *)v35;
  v54 = v34;
  v56 = (void *)v31;
  v58 = v25;
  v59 = (void *)v13;
  v38 = objc_msgSend(v10, "mood");
  if (v38 != -1)
    objc_msgSend(v11, "setMood:", v38);
  objc_msgSend(v10, "visibilityScoreByAsset");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v10, "visibilityScoreByAsset");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "keyEnumerator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v62 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v39, "objectForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v49 = v48;
        objc_msgSend(v46, "highlightVisibilityScore");
        if (v49 != v50)
        {
          objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "doubleValue");
          objc_msgSend(v51, "setHighlightVisibilityScore:");

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v43);
  }

  v12 = v60;
LABEL_49:

}

- (id)allHighlightModelsNeedingEnrichmentForHighlightSubtype:(int64_t)a3 options:(unint64_t)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  if ((v4 & 0x40000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(enrichmentVersion != highlightVersion) || (enrichmentState != %ld)"), 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, a3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (BOOL)shouldEnrichHighlight:(id)a3 withEnrichmentProfile:(id)a4 options:(unint64_t)a5
{
  int v5;
  id v7;
  id v8;
  unsigned int v9;
  BOOL v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if ((v5 & 0x40000000) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "isUpToDate"))
  {
    v9 = objc_msgSend(v7, "enrichmentState");
    v10 = v9 < objc_msgSend(v8, "targetEnrichmentState");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)enrichHighlights:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  OS_os_log *v12;
  PGManagerWorkingContext *workingContext;
  OS_os_log *v14;
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  OS_os_log *v21;
  PGHighlightTailor *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_loggingConnection;
    workingContext = self->_workingContext;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke;
    v19[3] = &unk_1E842DDD8;
    v25 = v9;
    v20 = v8;
    v14 = v12;
    v21 = v14;
    v22 = self;
    v15 = v10;
    v23 = v15;
    v27 = a4;
    v16 = v11;
    v24 = v16;
    v26 = &v28;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v19);
    v17 = *((_BYTE *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)enrichAllHighlightsWithOptions:(unint64_t)a3 progressBlock:(id)a4
{
  double Current;
  char v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OS_os_log *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  OS_os_log *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  uint32_t denom;
  uint32_t numer;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  mach_timebase_info info;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  _BYTE v54[18];
  __int16 v55;
  double v56;
  _QWORD v57[6];

  v57[3] = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  v38 = _Block_copy(v37);
  if (v38
    && (Current = CFAbsoluteTimeGetCurrent(), Current - v46[3] >= 0.01)
    && (v46[3] = Current,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v38 + 2))(v38, &info, 0.0),
        v7 = *((_BYTE *)v50 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v50 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = 915;
      *(_WORD *)&v54[4] = 2080;
      *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v8 = 0;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)MEMORY[0x1CAA4EB2C]();
    -[PGHighlightTailor allHighlightModelsNeedingEnrichmentForHighlightSubtype:options:](self, "allHighlightModelsNeedingEnrichmentForHighlightSubtype:options:", 1000000301, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);
    -[PGHighlightTailor allHighlightModelsNeedingEnrichmentForHighlightSubtype:options:](self, "allHighlightModelsNeedingEnrichmentForHighlightSubtype:options:", 1000000304, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("kind"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v14;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortUsingDescriptors:", v16);

    v17 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v11, "count");
      v19 = objc_msgSend(v12, "count");
      v20 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v54 = v18;
      *(_WORD *)&v54[8] = 2048;
      *(_QWORD *)&v54[10] = v19;
      v55 = 2048;
      v56 = *(double *)&v20;
      _os_log_impl(&dword_1CA237000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "%tu day highlights and %tu day groups to enrich (%tu total)", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v10);
    v21 = objc_msgSend(v9, "count");
    if (v21)
    {
      v22 = (void *)MEMORY[0x1CAA4EB2C]();
      v23 = self->_loggingConnection;
      v24 = os_signpost_id_generate((os_log_t)v23);
      v25 = v23;
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "EnrichHighlights", ", buf, 2u);
      }

      info = 0;
      mach_timebase_info(&info);
      v27 = mach_absolute_time();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __66__PGHighlightTailor_enrichAllHighlightsWithOptions_progressBlock___block_invoke;
      v39[3] = &unk_1E8434F30;
      v40 = v38;
      v41 = &v45;
      v42 = &v49;
      v43 = 0x3F847AE147AE147BLL;
      v8 = -[PGHighlightTailor enrichHighlights:options:progressBlock:](self, "enrichHighlights:options:progressBlock:", v9, a3, v39);
      v28 = *((unsigned __int8 *)v50 + 24);
      if (*((_BYTE *)v50 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 943;
          *(_WORD *)&v54[4] = 2080;
          *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        v36 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v31 = v26;
        v32 = v31;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v54 = v21;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, v24, "EnrichHighlights", "Highlight count (%ld)", buf, 0xCu);
        }

        v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Highlight count (%ld)"), v21);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v54 = "EnrichHighlights";
          *(_WORD *)&v54[8] = 2112;
          *(_QWORD *)&v54[10] = v34;
          v55 = 2048;
          v56 = (float)((float)((float)((float)(v36 - v27) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

        }
      }

      objc_autoreleasePoolPop(v22);
      if (v28)
        v8 = 0;
    }
    else
    {
      v8 = 1;
    }

  }
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v8;
}

- (BOOL)enrichDayHighlights:(id)a3 dayGroupHighlights:(id)a4 withOptions:(unint64_t)a5 progressBlock:(id)a6
{
  void (**v9)(void *, mach_timebase_info *, double);
  double Current;
  char v11;
  NSObject *v12;
  uint64_t v13;
  OS_os_log *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  uint32_t denom;
  uint32_t numer;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  OS_os_log *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  mach_timebase_info v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v42;
  void *context;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  void (**v49)(void *, mach_timebase_info *, double);
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD v53[4];
  void (**v54)(void *, mach_timebase_info *, double);
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  mach_timebase_info info;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  _BYTE v68[18];
  __int16 v69;
  double v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v46 = a4;
  v45 = a6;
  v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v45);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = (double *)&v59;
  v61 = 0x2020000000;
  v62 = 0;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v60[3] >= 0.01)
    {
      v60[3] = Current;
      LOBYTE(info.numer) = 0;
      v9[2](v9, &info, 0.0);
      v11 = *((_BYTE *)v64 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v64 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 953;
          *(_WORD *)&v68[4] = 2080;
          *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Enrich/PGHighlightTailor.m";
          v12 = MEMORY[0x1E0C81028];
LABEL_37:
          _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_38;
        }
        goto LABEL_38;
      }
    }
  }
  v13 = objc_msgSend(v47, "count");
  if (v13)
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v14 = self->_loggingConnection;
    v15 = os_signpost_id_generate((os_log_t)v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "EnrichDayHighlights", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v18 = mach_absolute_time();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke;
    v53[3] = &unk_1E8434F30;
    v54 = v9;
    v55 = &v59;
    v56 = &v63;
    v57 = 0x3F847AE147AE147BLL;
    v19 = -[PGHighlightTailor enrichHighlights:options:progressBlock:](self, "enrichHighlights:options:progressBlock:", v47, a5, v53);
    v20 = *((unsigned __int8 *)v64 + 24);
    if (*((_BYTE *)v64 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v68 = 963;
        *(_WORD *)&v68[4] = 2080;
        *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Enrich/PGHighlightTailor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v42 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v23 = v17;
      v24 = v23;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v68 = v13;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, v15, "EnrichDayHighlights", "Day Highlight count (%ld)", buf, 0xCu);
      }

      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Day Highlight count (%ld)"), v13);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v68 = "EnrichDayHighlights";
        *(_WORD *)&v68[8] = 2112;
        *(_QWORD *)&v68[10] = v26;
        v69 = 2048;
        v70 = (float)((float)((float)((float)(v42 - v18) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(context);
    if (v20)
      goto LABEL_38;
  }
  else
  {
    v19 = 1;
  }
  if (objc_msgSend(v46, "count"))
    v27 = v19;
  else
    v27 = 0;
  if (v27)
  {
    v28 = (void *)MEMORY[0x1CAA4EB2C]();
    v29 = self->_loggingConnection;
    v30 = os_signpost_id_generate((os_log_t)v29);
    v31 = v29;
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "EnrichDayGroupHighlights", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v33 = mach_absolute_time();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke_186;
    v48[3] = &unk_1E8434F30;
    v49 = v9;
    v50 = &v59;
    v51 = &v63;
    v52 = 0x3F847AE147AE147BLL;
    LOBYTE(v19) = -[PGHighlightTailor enrichHighlights:options:progressBlock:](self, "enrichHighlights:options:progressBlock:", v46, a5, v48);
    v34 = mach_absolute_time();
    v35 = info;
    v36 = v32;
    v37 = v36;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v38 = objc_msgSend(v46, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v68 = v38;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, v30, "EnrichDayGroupHighlights", "Day Group Highlight count (%ld)", buf, 0xCu);
    }

    v39 = v37;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Day Group Highlight count (%ld)"), objc_msgSend(v46, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v68 = "EnrichDayGroupHighlights";
      *(_WORD *)&v68[8] = 2112;
      *(_QWORD *)&v68[10] = v40;
      v69 = 2048;
      v70 = (float)((float)((float)((float)(v34 - v33) * (float)v35.numer) / (float)v35.denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
  }
  if (*((_BYTE *)v64 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = 975;
      *(_WORD *)&v68[4] = 2080;
      *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      v12 = MEMORY[0x1E0C81028];
      goto LABEL_37;
    }
LABEL_38:
    LOBYTE(v19) = 0;
  }
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v19;
}

- (id)bestEnrichmentProfileForHighlight:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_enrichmentProfiles;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "canEnrichHighlight:withOptions:", v6, a4, (_QWORD)v15) & 1) != 0)
        {
          v13 = v12;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)keyAssetFromHighlight:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  PGManagerWorkingContext *workingContext;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  workingContext = self->_workingContext;
  v6 = a3;
  -[PGManagerWorkingContext photoLibrary](workingContext, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIncludeGuestAssets:", 1);
  objc_msgSend(v8, "setSharingFilter:", v4);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sortedCurationOfType:(unsigned __int16)a3 fromHighlight:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v6 = a4;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGHighlightTailor assetSortDescriptors](self, "assetSortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v9);

  objc_msgSend(v8, "setHighlightCurationType:", v4);
  +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment](PGHighlightEnrichmentUtilities, "assetPropertySetsForEnrichment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v10);

  objc_msgSend(v8, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_moodGenerationContext, 0);
  objc_storeStrong((id *)&self->_enrichmentCommitGroup, 0);
  objc_storeStrong((id *)&self->_enrichmentProfiles, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __86__PGHighlightTailor_enrichDayHighlights_dayGroupHighlights_withOptions_progressBlock___block_invoke_186(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __66__PGHighlightTailor_enrichAllHighlightsWithOptions_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double Current;
  char v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  PGHighlightEnrichmentValues *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  double v38;
  char v39;
  int v40;
  uint64_t v41;
  uint32_t numer;
  uint32_t denom;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id v48;
  double v49;
  char v50;
  NSObject *v51;
  double v52;
  char v53;
  id v54;
  void (**v55)(void *, id);
  PGHighlightTailorContext *v56;
  void *v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  os_signpost_id_t spid;
  id v63;
  void (**v64)(_QWORD, _QWORD, double);
  unint64_t v65;
  uint64_t v66;
  char v67;
  _QWORD v68[4];
  NSObject *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  double v73;
  double v74;
  mach_timebase_info info;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD aBlock[4];
  id v81;
  uint64_t v82;
  id v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  double *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  int v94;
  _BYTE v95[18];
  __int16 v96;
  PGHighlightEnrichmentValues *v97;
  _BYTE v98[128];
  uint8_t buf[40];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v54 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 72));
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v86 = 0;
  v87 = (double *)&v86;
  v88 = 0x2020000000;
  v89 = 0;
  v64 = (void (**)(_QWORD, _QWORD, double))v3;
  if (v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v87[3] >= 0.01)
    {
      v87[3] = Current;
      LOBYTE(v94) = 0;
      ((void (**)(_QWORD, int *, double))v64)[2](v64, &v94, 0.0);
      v5 = *((_BYTE *)v91 + 24) | v94;
      *((_BYTE *)v91 + 24) = v5;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 786;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightTailor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_82;
      }
    }
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  v7 = *(id *)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Starting enrichment on %lu highlights.", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_164;
  aBlock[3] = &unk_1E842DDB0;
  v84 = buf;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v81 = v9;
  v82 = v10;
  v83 = v11;
  v85 = *(_QWORD *)(a1 + 88);
  v55 = (void (**)(void *, id))_Block_copy(aBlock);
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v54, "graph");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[PGHighlightTailorContext initWithPhotoLibrary:graph:serviceManager:loggingConnection:]([PGHighlightTailorContext alloc], "initWithPhotoLibrary:graph:serviceManager:loggingConnection:", *(_QWORD *)(a1 + 56), v57, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v79 = 0u;
  v77 = 0u;
  v78 = 0u;
  v76 = 0u;
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
  if (!v12)
  {
    v14 = 0.0;
    goto LABEL_65;
  }
  v66 = 0;
  v13 = 1.0 / (double)v6;
  v60 = *(_QWORD *)v77;
  v14 = 0.0;
  while (2)
  {
    v59 = v12;
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v77 != v60)
        objc_enumerationMutation(obj);
      v16 = *(NSObject **)(a1 + 40);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
        {
          LOWORD(v94) = 0;
          _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Encountered error performing change request. Stopping enrichment.", (uint8_t *)&v94, 2u);
        }
        goto LABEL_79;
      }
      v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      v18 = v16;
      v19 = os_signpost_id_generate(v18);
      v20 = v18;
      v21 = v20;
      spid = v19;
      v65 = v19 - 1;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        LOWORD(v94) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "EnrichOneHighlight", ", (uint8_t *)&v94, 2u);
      }

      info = 0;
      mach_timebase_info(&info);
      v61 = mach_absolute_time();
      v22 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(*(id *)(a1 + 48), "bestEnrichmentProfileForHighlight:options:", v17, *(_QWORD *)(a1 + 88));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v17, "assetCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();

        v26 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v94 = 138412546;
          *(_QWORD *)v95 = v25;
          *(_WORD *)&v95[8] = 2112;
          *(_QWORD *)&v95[10] = v23;
          _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enriching highlight %@ with profile %@", (uint8_t *)&v94, 0x16u);
        }
        if (objc_msgSend(*(id *)(a1 + 48), "shouldEnrichHighlight:withEnrichmentProfile:options:", v17, v23, *(_QWORD *)(a1 + 88)))
        {
          v27 = *(void **)(a1 + 48);
          v28 = *(_QWORD *)(a1 + 88);
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_172;
          v68[3] = &unk_1E84311C8;
          v69 = v64;
          v70 = &v86;
          v73 = v14;
          v74 = v13;
          v72 = 0x3F847AE147AE147BLL;
          v71 = &v90;
          objc_msgSend(v27, "enrichmentValuesForHighlight:usingEnrichmentProfile:graph:options:reportChangedValuesOnly:highlightTailorContext:progressBlock:", v17, v23, v57, v28, 1, v56, v68);
          v29 = (PGHighlightEnrichmentValues *)objc_claimAutoreleasedReturnValue();
          if (*((_BYTE *)v91 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v94 = 67109378;
              *(_DWORD *)v95 = 854;
              *(_WORD *)&v95[4] = 2080;
              *(_QWORD *)&v95[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
            }

LABEL_44:
            v40 = 0;
            goto LABEL_46;
          }
          v34 = *(id *)(a1 + 40);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v23, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 138412802;
            *(_QWORD *)v95 = v25;
            *(_WORD *)&v95[8] = 2112;
            *(_QWORD *)&v95[10] = v35;
            v96 = 2112;
            v97 = v29;
            _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enriched %@ with profile %@, values: %@", (uint8_t *)&v94, 0x20u);

          }
          v32 = v69;
        }
        else
        {
          v32 = *(id *)(a1 + 40);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v23, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 138412546;
            *(_QWORD *)v95 = v25;
            *(_WORD *)&v95[8] = 2112;
            *(_QWORD *)&v95[10] = v33;
            _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[PGHighlightTailor] %@ already up to date with profile %@", (uint8_t *)&v94, 0x16u);

          }
          v29 = 0;
        }

      }
      else
      {
        if (!objc_msgSend(v17, "enrichmentState"))
        {
          v29 = 0;
          goto LABEL_37;
        }
        v29 = objc_alloc_init(PGHighlightEnrichmentValues);
        -[PGHighlightEnrichmentValues setClearCurations:](v29, "setClearCurations:", 1);
        v25 = *(id *)(a1 + 40);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "assetCollection");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = 138412290;
          *(_QWORD *)v95 = v31;
          _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[PGHighlightTailor] No profile, reset highlight %@ to not enriched", (uint8_t *)&v94, 0xCu);

        }
      }

LABEL_37:
      ++v66;
      v36 = *(id *)(a1 + 40);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = objc_msgSend(*(id *)(a1 + 32), "count");
        v94 = 134218240;
        *(_QWORD *)v95 = v66;
        *(_WORD *)&v95[8] = 2048;
        *(_QWORD *)&v95[10] = v37;
        _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[PGHighlightTailor] Enrichment progress: %ld / %ld", (uint8_t *)&v94, 0x16u);
      }

      v14 = v13 + v14;
      if (v64)
      {
        v38 = CFAbsoluteTimeGetCurrent();
        if (v38 - v87[3] >= 0.01)
        {
          v87[3] = v38;
          v67 = 0;
          ((void (**)(_QWORD, char *, double))v64)[2](v64, &v67, v14);
          v39 = *((_BYTE *)v91 + 24) | v67;
          *((_BYTE *)v91 + 24) = v39;
          if (v39)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v94 = 67109378;
              *(_DWORD *)v95 = 874;
              *(_WORD *)&v95[4] = 2080;
              *(_QWORD *)&v95[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Enrich/PGHighlightTailor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
            }
            goto LABEL_44;
          }
        }
      }
      v40 = 1;
LABEL_46:

      objc_autoreleasePoolPop(v22);
      if (!v40)
      {

LABEL_79:
        goto LABEL_81;
      }
      v41 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v44 = v21;
      v45 = v44;
      if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        LOWORD(v94) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v45, OS_SIGNPOST_INTERVAL_END, spid, "EnrichOneHighlight", ", (uint8_t *)&v94, 2u);
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v94 = 136315394;
        *(_QWORD *)v95 = "EnrichOneHighlight";
        *(_WORD *)&v95[8] = 2048;
        *(double *)&v95[10] = (float)((float)((float)((float)(v41 - v61) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v94, 0x16u);
      }
      if (v29)
      {
        if (!-[PGHighlightEnrichmentValues hasChanges](v29, "hasChanges"))
        {
          v46 = *(id *)(a1 + 40);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "uuid");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 138412290;
            *(_QWORD *)v95 = v47;
            _os_log_impl(&dword_1CA237000, v46, OS_LOG_TYPE_INFO, "No change in enrichment for highlight %@", (uint8_t *)&v94, 0xCu);

          }
        }
        if (-[PGHighlightEnrichmentValues hasChanges](v29, "hasChanges") || *(_BYTE *)(a1 + 88) == 0xFF)
        {
          objc_msgSend(v63, "addObject:", v29);
          if ((unint64_t)objc_msgSend(v63, "count") >= 0x14)
          {
            v48 = v63;
            v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            v55[2](v55, v48);
          }
        }
      }

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
    if (v12)
      continue;
    break;
  }
LABEL_65:

  if (v64
    && (v49 = CFAbsoluteTimeGetCurrent(), v49 - v87[3] >= 0.01)
    && (v87[3] = v49,
        LOBYTE(info.numer) = 0,
        ((void (**)(_QWORD, mach_timebase_info *, double))v64)[2](v64, &info, v14),
        v50 = *((_BYTE *)v91 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v91 + 24) = v50) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v94 = 67109378;
      *(_DWORD *)v95 = 899;
      *(_WORD *)&v95[4] = 2080;
      *(_QWORD *)&v95[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Enrich/PGHighlightTailor.m";
      v51 = MEMORY[0x1E0C81028];
      goto LABEL_77;
    }
  }
  else
  {
    v55[2](v55, v63);
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 24), 0xFFFFFFFFFFFFFFFFLL);
    if (v64
      && (v52 = CFAbsoluteTimeGetCurrent(), v52 - v87[3] >= 0.01)
      && (v87[3] = v52,
          LOBYTE(info.numer) = 0,
          ((void (**)(_QWORD, mach_timebase_info *, double))v64)[2](v64, &info, 1.0),
          v53 = *((_BYTE *)v91 + 24) | LOBYTE(info.numer),
          (*((_BYTE *)v91 + 24) = v53) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v94 = 67109378;
        *(_DWORD *)v95 = 905;
        *(_WORD *)&v95[4] = 2080;
        *(_QWORD *)&v95[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Enrich/PGHighlightTailor.m";
        v51 = MEMORY[0x1E0C81028];
LABEL_77:
        _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
  }
LABEL_81:

  _Block_object_dispose(buf, 8);
LABEL_82:
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_164(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int8x16_t v17;
  _QWORD v18[4];
  NSObject *v19;
  int8x16_t v20;
  uint64_t v21;
  uint64_t v22;
  os_signpost_id_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Encountered error performing change request. Stopping enrichment.", buf, 2u);
    }
  }
  else if (objc_msgSend(v3, "count"))
  {
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 24));
    v6 = *(id *)(a1 + 32);
    v7 = os_signpost_id_generate(v6);
    v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CommitBatchOfHighlightEnrichmentChanges", ", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    mach_timebase_info((mach_timebase_info_t)buf);
    v10 = mach_absolute_time();
    v11 = *(void **)(a1 + 48);
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_165;
    v25[3] = &unk_1E84348A8;
    v13 = v4;
    v14 = *(_QWORD *)(a1 + 40);
    v26 = v13;
    v27 = v14;
    v28 = *(_QWORD *)(a1 + 64);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_2;
    v18[3] = &unk_1E842DD88;
    v22 = v10;
    v23 = v7;
    v19 = v9;
    v17 = *(int8x16_t *)(a1 + 32);
    v24 = *(_QWORD *)buf;
    v15 = (id)v17.i64[0];
    v20 = vextq_s8(v17, v17, 8uLL);
    v21 = *(_QWORD *)(a1 + 56);
    v16 = v9;
    objc_msgSend(v11, "performChanges:completionHandler:", v25, v18);

  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_172(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + a3 * *(double *)(a1 + 72));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_165(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "highlight", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "changeRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "writeHighlightEnrichmentValues:toChangeRequest:highlight:options:", v7, v9, v8, *(_QWORD *)(a1 + 48));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __60__PGHighlightTailor_enrichHighlights_options_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = mach_absolute_time();
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(_DWORD *)(a1 + 80);
  v7 = *(_DWORD *)(a1 + 84);
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CommitBatchOfHighlightEnrichmentChanges", ", (uint8_t *)&v14, 2u);
  }

  v12 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "CommitBatchOfHighlightEnrichmentChanges";
    v16 = 2048;
    v17 = (float)((float)((float)((float)(v5 - v6) * (float)v8) / (float)v7) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v14, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 24));
  if (v4)
  {
    v13 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Error performing enrichment change request: %@", (uint8_t *)&v14, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setTitle:", v8);
    objc_msgSend(v6, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setSubtitle:", v10);
    objc_msgSend(v6, "locationNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocalizedLocationNames:", v11);

  }
}

void __86__PGHighlightTailor_writeHighlightEnrichmentValues_toChangeRequest_highlight_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedShortValue");

  objc_msgSend(v7, "setProcessedLocation:", v6);
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_142(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_144(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.05 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_145(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.05 + 0.15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_149(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __148__PGHighlightTailor_enrichmentValuesForHighlight_usingEnrichmentProfile_graph_options_reportChangedValuesOnly_highlightTailorContext_progressBlock___block_invoke_151(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v9)
    v12 = 1;
  else
    v12 = *(_BYTE *)(v11 + 24) == 0;
  v13 = !v12;
  *(_BYTE *)(v11 + 24) = v13;
  if (*(_BYTE *)(a1 + 56))
  {
    if (v9)
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(void **)(a1 + 40);
        v16 = v14;
        objc_msgSend(v15, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v17;
        v22 = 2112;
        v23 = v10;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Failed to generate title for highlight %@: %@", (uint8_t *)&v20, 0x16u);

      }
      goto LABEL_13;
    }
    if (!(v7 | v8))
    {
LABEL_13:
      v18 = 0;
      goto LABEL_14;
    }
    v18 = 1;
    if (v7 && v8)
      v18 = objc_msgSend((id)v7, "isEqualToString:", v8) ^ 1;
  }
  else
  {
    v18 = 1;
  }
LABEL_14:

  return v18;
}

+ (BOOL)itemScoreIsAutoplayable:(double)a3
{
  return a3 * 131.0 >= 100.0;
}

@end
