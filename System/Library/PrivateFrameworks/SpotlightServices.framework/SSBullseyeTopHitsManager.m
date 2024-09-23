@implementation SSBullseyeTopHitsManager

- (SSBullseyeTopHitsManager)initWithQueryId:(int64_t)a3 categoryToResultMapping:(id)a4 currentTopHitSection:(id)a5 queryContext:(id)a6 ranker:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SSBullseyeTopHitsManager *v17;
  SSBullseyeTopHitsManager *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SSBullseyeTopHitsManager;
  v17 = -[SSBullseyeTopHitsManager init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_categoryToResultMapping, a4);
    v18->_queryID = a3;
    objc_storeStrong((id *)&v18->_topHitSection, a5);
    objc_storeStrong((id *)&v18->_queryContext, a6);
    objc_storeStrong((id *)&v18->_ranker, a7);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          SSScreenTimeStatusForBundleIDWithCompletionHandler(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v23++), 0);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v21);
    }

  }
  return v18;
}

- (id)bullseyeResultSetForTopHit:(int)a3 checkForTopHit:(int)a4 boostSafari:(int)a5 thresholdCounter:(void *)a6 existingResults:(int)a7 allowMultipleTopHits:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  id v18;
  _BOOL4 v19;
  uint64_t ImportantBits;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  float v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  int v36;
  const __CFString *v37;
  float v38;
  float v39;
  PRSRankingItem *v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  int v54;
  int v55;
  id v56;
  void *v57;
  void *v58;
  float v59;
  float v60;
  float v61;
  float v62;
  void *v63;
  float v64;
  void *v65;
  float v66;
  float v67;
  void *v68;
  float v69;
  float v70;
  void *v71;
  void *v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  float v77;
  _BOOL4 v78;
  _BOOL4 v79;
  int v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  __CFString *v91;
  __CFString *v92;
  const __CFString *v93;
  double v94;
  void *v95;
  double v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  int v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  int v112;
  const __CFString *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  double SpecialThreshold;
  int v120;
  PRSRankingItem *v121;
  int v122;
  int v123;
  void *v124;
  int v125;
  char v126;
  int v127;
  int v128;
  int v129;
  __CFString *v130;
  char v131;
  char v132;
  void *v133;
  char v134;
  NSObject *v135;
  int v136;
  void *v137;
  void *v138;
  void *v139;
  const __CFString *v140;
  int v141;
  int v142;
  int v143;
  int v144;
  void *v145;
  int v146;
  double v147;
  int v148;
  _BOOL4 v149;
  BOOL v150;
  _BOOL4 v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  void *v158;
  void *v159;
  float v160;
  float v161;
  void *v162;
  void *v163;
  int v164;
  int v165;
  int v166;
  void *v167;
  void *v168;
  uint64_t v169;
  int v170;
  int v171;
  int v172;
  _BOOL4 v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t Count;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  int v183;
  void *v184;
  float v185;
  float v186;
  id v187;
  __CFString *v189;
  void *v190;
  int v191;
  __CFString *v192;
  void *v194;
  int v195;
  int v196;
  id v197;
  void *v198;
  id v199;
  int v200;
  void *v201;
  void *v202;
  void *v203;
  int v204;
  void *v205;
  BOOL v207;
  void *v208;
  int v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  void *v213;
  _BOOL4 v214;
  _BOOL4 v215;
  __int128 v216;
  int v217;
  id v218;
  int v219;
  void *v220;
  int v221;
  _BOOL4 v222;
  void *v223;
  void *v224;
  uint64_t v225;
  int v226;
  void *v227;
  void *v228;
  uint64_t v229;
  float v230;
  void *v231;
  float v232;
  void *v233;
  unsigned int v234;
  void *v235;
  PRSRankingItem *v236;
  uint64_t v237;
  void *v238;
  _BOOL4 v239;
  int v240;
  int v241;
  int v242;
  unint64_t v243;
  unint64_t v244;
  const __CFString *v245;
  void *v246;
  int v247;
  unint64_t v248;
  int v249;
  uint64_t v250;
  void *v251;
  int v252;
  uint8_t buf[4];
  _BYTE v254[10];
  _BYTE v255[12];
  double v256;
  _BOOL4 v257;
  __int16 v258;
  unsigned int v259;
  __int16 v260;
  void *v261;
  __int16 v262;
  void *v263;
  __int16 v264;
  id v265;
  __int16 v266;
  double v267;
  __int16 v268;
  double v269;
  __int16 v270;
  const __CFString *v271;
  __int16 v272;
  uint64_t v273;
  __int16 v274;
  uint64_t v275;
  __int16 v276;
  uint64_t v277;
  __int16 v278;
  const __CFString *v279;
  __int16 v280;
  void *v281;
  __int16 v282;
  uint64_t v283;
  __int16 v284;
  uint64_t v285;
  uint64_t v286;

  v286 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a6;
  v225 = a1;
  if (!a1)
  {
    v187 = 0;
    goto LABEL_316;
  }
  objc_msgSend(v11, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relatedSectionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resultSet");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = objc_msgSend(v224, "count");
  v249 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));
  v205 = v13;
  if ((v249 & 1) != 0)
    goto LABEL_3;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
  {
    v252 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.app-clips")) & 1) != 0)
  {
    v252 = 0;
    v15 = 0;
    v17 = 0;
    v16 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) == 0)
  {
    if ((objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.parsec")) & 1) != 0)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v252 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0
      && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedPhotos")) & 1) == 0)
    {
      v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobiletimer"));
      v252 = 0;
      goto LABEL_4;
    }
LABEL_3:
    v252 = 0;
    v15 = 0;
LABEL_4:
    v16 = 0;
    v17 = 0;
LABEL_9:
    v221 = 1;
    goto LABEL_10;
  }
  v252 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v221 = 0;
LABEL_10:
  v18 = v11;
  v247 = a3;
  v208 = v14;
  v19 = (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0
     || objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.app-clips"));
  v248 = objc_msgSend(*(id *)(a1 + 64), "queryTermLength");
  v244 = objc_msgSend(*(id *)(a1 + 64), "queryTermCount");
  SSMinSpellCorrectedAppTopHitScore();
  ImportantBits = PRSRankingQueryImportantBits(0);
  v210 = v21;
  v211 = ImportantBits;
  v22 = objc_msgSend(*(id *)(a1 + 64), "isAltNamePrefixMatchOnlyTopHitExcludedQuery");
  v23 = objc_msgSend(*(id *)(a1 + 64), "isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery");
  v239 = SSEnableSpotlightTopHitPersonalizedRanking();
  if (SSDefaultsGetState(3uLL))
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("com.apple.parsec.dictionary"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("com.apple.dictionary"));
      v24 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v24 = 0;
  }
  v199 = (id)v24;
  if (v229)
  {
    v223 = 0;
    v25 = 0;
    v196 = v22 ^ 1;
    v191 = v23 ^ 1;
    if (((a5 == 0) & (v16 | v17 | v15 | a7 & ~v221 | v249 & v19)) != 0)
      v26 = 0;
    else
      v26 = 2;
    v195 = v26;
    v27 = -1;
    v28 = 1.0;
    v11 = v18;
    v197 = v12;
    v198 = v18;
    v29 = v224;
    v30 = v229;
    while (1)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v27 == -1)
        v33 = v252;
      else
        v33 = 0;
      if (v33 == 1)
      {
        if (objc_msgSend(v31, "topHit"))
          v27 = -1;
        else
          v27 = v25;
      }
      if ((objc_msgSend(v32, "forceNoTopHit") & 1) != 0 || objc_msgSend(v12, "containsObject:", v32))
      {
        PRSLogCategoryDefault();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = objc_msgSend(v32, "topHit");
          v36 = objc_msgSend(v32, "forceNoTopHit");
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)v254 = v32;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v35;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)&v255[6] = v36;
          _os_log_impl(&dword_1B86C5000, v34, OS_LOG_TYPE_INFO, "skipping bullseye top hit logic for %p: topHit=%d, forceNoTopHit=%d", buf, 0x18u);
        }

LABEL_35:
        goto LABEL_36;
      }
      if ((objc_msgSend(v12, "containsObject:", v32) & 1) != 0)
        goto LABEL_35;
      v237 = objc_msgSend(v32, "score");
      v245 = v37;
      objc_msgSend(v32, "l2score");
      v39 = v38;
      objc_msgSend(v32, "rankingItem");
      v40 = (PRSRankingItem *)objc_claimAutoreleasedReturnValue();
      v250 = -[PRSRankingItem bundleIDType](v40, "bundleIDType");
      -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "originalL2Score");
      v43 = v42;

      v215 = -[PRSRankingItem eligibleForDemotion](v40, "eligibleForDemotion");
      v226 = -[PRSRankingItem shouldHideUnderShowMore](v40, "shouldHideUnderShowMore");
      v222 = -[PRSRankingItem recentForTopHit](v40, "recentForTopHit");
      v234 = -[PRSRankingItem recentForAboveThresholdTopHit](v40, "recentForAboveThresholdTopHit");
      -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "scoreForFeature:", 2391);
      v46 = v45;

      -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "scoreForFeature:", 2390);
      v49 = v48;

      -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "scoreForFeature:", 2392);
      v52 = v51;

      SSDefaultsGetResources();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "BOOLeanForKey:", CFSTR("ResetResultTopHit"));

      if (v54 && v247 && (objc_msgSend(v32, "isSafariTopHit") & 1) == 0)
      {
        objc_msgSend(v32, "setTopHit:", 0);
        v55 = 0;
      }
      else
      {
        v55 = objc_msgSend(v32, "topHit");
      }
      v240 = v55;
      v56 = v12;
      objc_msgSend(v32, "title");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "text");
      v235 = (void *)objc_claimAutoreleasedReturnValue();

      v236 = v40;
      if ((v250 & 0x100) != 0)
      {
        v232 = v39;
        v59 = v52;
        v60 = v43;
        v61 = v49;
        v62 = v46;
        v58 = v11;
        -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "scoreForFeature:", 1);
        v230 = v64;

        -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "scoreForFeature:", 41);
        v67 = v66;

        -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "scoreForFeature:", 2327);
        v70 = v69;

        -[PRSRankingItem displayNameInitials](v40, "displayNameInitials");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "scoreForFeature:", 1614);
        v74 = v73;

        -[PRSRankingItem L2FeatureVector](v40, "L2FeatureVector");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "scoreForFeature:", 189);
        v77 = v76;

        v78 = v74 == 0.0;
        v150 = v77 == 2147500000.0;
        v28 = 1.0;
        v79 = !v150 && v74 == 0.0;
        if (v248 <= 4)
          v78 = 0;
        v214 = v78;
        v80 = v70 == 1.0 || v79;
        v207 = v71 != 0;
        if (v71)
          v80 = 1;
        v204 = v80 & v196;
        if (v248 <= +[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen"))
        {
          v219 = 0;
        }
        else
        {
          v81 = v230 == 1.0;
          if (v67 != 0.0)
            v81 = 0;
          v219 = v81 & v191;
        }
        v46 = v62;
        v49 = v61;
        v43 = v60;
        v52 = v59;
        v39 = v232;
      }
      else
      {
        v58 = v11;
        v204 = 0;
        v219 = 0;
        v214 = 0;
        v207 = 0;
      }
      objc_msgSend(v32, "isFuzzyMatch");
      v209 = objc_msgSend(v58, "domain");
      +[SSRankingManager defaultKey]();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v82, v248, v244, 0);
      v233 = (void *)objc_claimAutoreleasedReturnValue();

      +[SSRankingManager defaultKey]();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v83, v248, v244, 1);
      v231 = (void *)objc_claimAutoreleasedReturnValue();

      v243 = v27;
      if ((v250 & 0x100) != 0 && objc_msgSend(v32, "isWebClip"))
      {
        +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, CFSTR("com.apple.webclips"), v248, v244, 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, CFSTR("com.apple.webclips"), v248, v244, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = a5;
        v87 = v56;
      }
      else
      {
        if ((v249 & 1) != 0)
        {
          -[PRSRankingItem sectionBundleIdentifier](v40, "sectionBundleIdentifier");
          v88 = objc_claimAutoreleasedReturnValue();
          v89 = (void *)v88;
          v90 = v208;
          if (v88)
            v90 = (void *)v88;
          v91 = v90;

          if ((-[PRSRankingItem bundleIDType](v40, "bundleIDType") & 0x10000) != 0)
          {
            v92 = CFSTR("com.apple.app-clips");

            v91 = v92;
          }
        }
        else
        {
          v91 = v205;
        }
        v86 = a5;
        v87 = v56;
        +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v91, v248, v244, 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRankingManager getTopHitsThresholdsForBundleId:queryLength:queryTermCount:getFallback:]((uint64_t)SSRankingManager, v91, v248, v244, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v228 = v84;
      v93 = v245;
      if (objc_msgSend(v84, "count") > v86
        || (v84 = v85, objc_msgSend(v85, "count") > v86)
        || (v84 = v233, objc_msgSend(v233, "count") > v86)
        || (v84 = v231, v94 = 0.0, objc_msgSend(v231, "count") > v86))
      {
        objc_msgSend(v84, "objectAtIndexedSubscript:", v86);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "doubleValue");
        v94 = v96;

      }
      v227 = v85;
      PRSLogCategoryDefault();
      v97 = objc_claimAutoreleasedReturnValue();
      v11 = v58;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        v98 = *(_QWORD *)(v225 + 16);
        objc_msgSend(v58, "title");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v254 = v98;
        v93 = v245;
        *(_WORD *)&v254[4] = 1024;
        *(_DWORD *)&v254[6] = v25;
        *(_WORD *)v255 = 2112;
        *(_QWORD *)&v255[2] = v99;
        *(_WORD *)&v255[10] = 2048;
        v256 = v94;
        _os_log_impl(&dword_1B86C5000, v97, OS_LOG_TYPE_INFO, "### [%d] section[%d] title:%@ minTopHitScore:%f ", buf, 0x22u);

      }
      v12 = v87;
      if (v239)
      {
        objc_msgSend(v32, "rankingItem");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "isLocalTopHitCandidate");

        v27 = v243;
        v102 = v237;
        if (v101)
        {
          objc_msgSend(v32, "setPreferTopPlatter:", 1);
          v240 = SSSetTopHitWithReasonType(1, v32, 24, 0, 1);
        }
      }
      else
      {
        v27 = v243;
        v102 = v237;
      }
      if (!(v102 | (unint64_t)v93))
      {
        objc_msgSend(v32, "resultBundleId");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v103, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
          goto LABEL_89;
        objc_msgSend(v32, "resultBundleId");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v104, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL")) & 1) != 0)
          goto LABEL_88;
        objc_msgSend(v32, "resultBundleId");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v105, "isEqualToString:", CFSTR("com.apple.worldclock")))
        {

          v93 = v245;
LABEL_88:

          v102 = v237;
LABEL_89:

          goto LABEL_90;
        }
        objc_msgSend(v32, "sectionBundleIdentifier");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v133, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

        v102 = v237;
        v93 = v245;
        if ((v134 & 1) == 0)
        {
          PRSLogCategoryDefault();
          v135 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            v136 = *(_DWORD *)(v225 + 16);
            objc_msgSend(v32, "sectionBundleIdentifier");
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "applicationBundleIdentifier");
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "identifier");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sectionBundleIdentifier");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            SSRedactSuggestionIdentifier(v137, v138);
            v218 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sectionBundleIdentifier");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v238 = v137;
            v220 = v138;
            if (v139
              && (objc_msgSend(v32, "sectionBundleIdentifier"),
                  v190 = (void *)objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v190, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0))
            {
              v217 = 0;
              v140 = CFSTR("(private)");
            }
            else
            {
              v217 = 1;
              SSRedactString(v235, 1);
              v140 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v189 = (__CFString *)v140;
            }
            objc_msgSend(v32, "rankingItem");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "rankingItem");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = objc_msgSend(v175, "attributes");
            objc_msgSend(v32, "rankingItem");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            Count = SSCompactRankingAttrsGetCount(objc_msgSend(v177, "attributes"));
            *(_DWORD *)buf = 67112962;
            *(_DWORD *)v254 = v136;
            *(_WORD *)&v254[4] = 1024;
            *(_DWORD *)&v254[6] = v25;
            *(_WORD *)v255 = 1024;
            *(_DWORD *)&v255[2] = v240;
            *(_WORD *)&v255[6] = 1024;
            *(_DWORD *)&v255[8] = v226;
            LOWORD(v256) = 1024;
            *(_DWORD *)((char *)&v256 + 2) = v215;
            HIWORD(v256) = 1024;
            v257 = v222;
            v258 = 1024;
            v259 = v234;
            v260 = 2112;
            v261 = v251;
            v262 = 2112;
            v263 = v246;
            v264 = 2112;
            v265 = v218;
            v266 = 2048;
            v267 = v43;
            v268 = 2048;
            v269 = v39;
            v270 = 2112;
            v271 = v140;
            v272 = 2048;
            v273 = (uint64_t)v174;
            v274 = 2048;
            v275 = v176;
            v276 = 2048;
            v277 = Count;
            _os_log_impl(&dword_1B86C5000, v135, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d] %d %d %d %d %d %@ %@ %@ %f %f %@ (%p, %p, %lu)", buf, 0x86u);

            if (v217)
            v11 = v198;
            v27 = v243;
            if (v139)

            v12 = v197;
          }

          v30 = v229;
          v120 = v249;
          v121 = v236;
          if (v247)
          {
            v125 = v240;
            if (!v240)
            {
              if (v199 != v11)
              {
                v125 = 0;
                goto LABEL_312;
              }
              v179 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v11, "bundleIdentifier");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "stringWithFormat:", CFSTR("Promoting dictionary from %@"), v180);
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              v242 = SSSetTopHitWithReasonString(1, v32, v181, 1);

              v125 = v242;
              v120 = v249;
            }
          }
          else
          {
            v125 = v240;
          }
          if (v125 == 1)
            v182 = v252;
          else
            v182 = 0;
          if (v182 == 1)
          {
            v183 = v120;
            -[PRSRankingItem L2FeatureVector](v236, "L2FeatureVector");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "scoreForFeature:", 3233);
            v186 = v185;

            v120 = v183;
            v125 = v186 <= 0.0;
          }
LABEL_312:
          if ((v247 & 1) == 0)
            goto LABEL_109;
          goto LABEL_236;
        }
      }
LABEL_90:
      *((_QWORD *)&v216 + 1) = (unint64_t)v93 & v210;
      *(_QWORD *)&v216 = v102 & v211;
      PRSLogCategoryDefault();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        v107 = *(_DWORD *)(v225 + 16);
        objc_msgSend(v32, "sectionBundleIdentifier");
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "applicationBundleIdentifier");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "identifier");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sectionBundleIdentifier");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        SSRedactSuggestionIdentifier(v108, v109);
        v110 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sectionBundleIdentifier");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v202 = v109;
        v203 = v108;
        v201 = v110;
        if (v111
          && (objc_msgSend(v32, "sectionBundleIdentifier"),
              v194 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v194, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0))
        {
          v112 = v107;
          v200 = 0;
          v113 = CFSTR("(private)");
        }
        else
        {
          v112 = v107;
          v200 = 1;
          SSRedactString(v235, 1);
          v113 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v192 = (__CFString *)v113;
        }
        objc_msgSend(v32, "rankingItem");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "rankingItem");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "attributes");
        objc_msgSend(v32, "rankingItem");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = SSCompactRankingAttrsGetCount(objc_msgSend(v117, "attributes"));
        *(_DWORD *)buf = 67113986;
        *(_DWORD *)v254 = v112;
        *(_WORD *)&v254[4] = 1024;
        *(_DWORD *)&v254[6] = v25;
        *(_WORD *)v255 = 1024;
        *(_DWORD *)&v255[2] = v240;
        *(_WORD *)&v255[6] = 1024;
        *(_DWORD *)&v255[8] = v226;
        LOWORD(v256) = 1024;
        *(_DWORD *)((char *)&v256 + 2) = v215;
        HIWORD(v256) = 1024;
        v257 = v222;
        v258 = 1024;
        v259 = v234;
        v260 = 2112;
        v261 = v213;
        v262 = 2112;
        v263 = v212;
        v264 = 2112;
        v265 = v201;
        v266 = 2048;
        v267 = v43;
        v268 = 2048;
        v269 = v39;
        v270 = 2048;
        v271 = v245;
        v272 = 2048;
        v273 = v237;
        v274 = 2048;
        v275 = *((_QWORD *)&v216 + 1);
        v276 = 2048;
        v277 = v216;
        v278 = 2112;
        v279 = v113;
        v280 = 2048;
        v281 = v114;
        v282 = 2048;
        v283 = v116;
        v284 = 2048;
        v285 = v118;
        _os_log_impl(&dword_1B86C5000, v106, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d] %d %d %d %d %d %@ %@ %@ %f %f 0x%16.16llx%16.16llx 0x%16.16llx%16.16llx %@ (%p, %p, %lu)", buf, 0xAEu);

        if (v200)
        v12 = v197;
        v11 = v198;
        v27 = v243;
        if (v111)

      }
      v30 = v229;
      v120 = v249;
      v121 = v236;
      if (!v247)
      {
        v125 = v240;
LABEL_109:
        v126 = v252;
        if (v125)
          v126 = 0;
        if ((v126 & 1) != 0)
        {
LABEL_112:
          v127 = 1;
          goto LABEL_242;
        }
        goto LABEL_237;
      }
      v122 = v240;
      if (v239)
      {
        v123 = v219;
        goto LABEL_103;
      }
      v128 = v226;
      if (v94 >= v43)
        v128 = 1;
      v123 = v219;
      if (v128 == 1)
      {
        if (a4 && (objc_msgSend(v32, "isSafariTopHit") & 1) != 0)
          goto LABEL_125;
        v129 = -[PRSRankingItem topHitReason](v236, "topHitReason");
        v130 = CFSTR("Demoted for low quality/minTopHitScore.");
      }
      else
      {
        if ((v234 & 1) != 0 || a4 && (objc_msgSend(v32, "isSafariTopHit") & 1) != 0)
          goto LABEL_125;
        v129 = -[PRSRankingItem topHitReason](v236, "topHitReason");
        v130 = CFSTR("Demoted for not RecentForAboveThresholdTopHit.");
      }
      if (v129 != 17)
        v122 = SSSetTopHitWithReasonString(0, v32, v130, 1);
LABEL_125:
      if (objc_msgSend(v32, "isSafariTopHit") && objc_msgSend(v32, "topHit"))
        objc_msgSend(v32, "setPreferTopPlatter:", 1);
      if (!v122)
      {
        v122 = 0;
        if (v94 >= v43)
          v131 = 1;
        else
          v131 = v219;
        if ((v131 & 1) == 0 && (v226 & (v204 ^ 1) & 1) == 0 && ((v234 ^ 1) & 1) == 0)
        {
          v122 = SSSetTopHitWithReasonType(1, v32, 25, 1, 1);
          objc_msgSend(v32, "setPreferTopPlatter:", 1);
        }
        if (v122)
          v132 = 1;
        else
          v132 = v219;
        if ((v132 & 1) == 0)
        {
          v122 = 0;
          if ((v226 ^ 1 | v204) == 1 && v46 != v28 && v49 == v28 && v52 == v28)
          {
            v122 = SSSetTopHitWithReasonType(1, v32, 18, 1, 1);
            objc_msgSend(v32, "setPreferTopPlatter:", v234);
          }
        }
LABEL_103:
        if ((v250 & 0x100) != 0 && !v122)
        {
          -[PRSRankingItem L2FeatureVector](v236, "L2FeatureVector");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v124, "isAppInDock") & 1) != 0)
          {

            if (((v123 | v226) & 1) != 0)
            {
              v122 = 0;
            }
            else
            {
              v122 = SSSetTopHitWithReasonType(1, v32, 13, 1, 1);
              objc_msgSend(v32, "setPreferTopPlatter:", v234);
            }
            v123 = v219;
          }
          else
          {

            v122 = 0;
          }
        }
        v141 = v239;
        if (v122)
          v141 = 1;
        if (!v141)
          v122 = 0;
        if (((v141 | !v207 | v123) & 1) == 0)
        {
          SpecialThreshold = getSpecialThreshold(CFSTR("com.apple.application.initials"), v248, v244, a5, 0.1);
          if (SpecialThreshold >= v43)
          {
            v122 = 0;
          }
          else
          {
            v122 = SSSetTopHitWithReasonType(1, v32, 14, 1, 1);
            objc_msgSend(v32, "setPreferTopPlatter:", v234);
          }
        }
        if (v122)
          v142 = 0;
        else
          v142 = v123;
        if (v142 == 1)
        {
          SpecialThreshold = getSpecialThreshold(CFSTR("com.apple.application.corrections"), v248, v244, a5, -2.0);
          v143 = v249;
          if ((v250 & 0x100) != 0 && SpecialThreshold < v43)
          {
            v122 = SSSetTopHitWithReasonType(1, v32, 1, 1, 1);
            objc_msgSend(v32, "setPreferTopPlatter:", v234);
            goto LABEL_168;
          }
        }
        else
        {
LABEL_168:
          v143 = v249;
          if (v122)
            goto LABEL_169;
        }
        v152 = v209;
        if (((v209 != 3) & ~v143) != 0)
          goto LABEL_327;
        if (v143)
        {
          v153 = objc_msgSend(v208, "isEqualToString:", CFSTR("com.apple.calculation"), SpecialThreshold);
          v154 = objc_msgSend(v208, "isEqualToString:", CFSTR("com.apple.conversion"));
          v143 = v249;
          v155 = v154;
          v152 = v209;
        }
        else
        {
          v153 = 0;
          v155 = 0;
        }
        if (v152 != 3 && (v153 & 1) == 0 && !v155)
          goto LABEL_327;
        if (!v236)
        {
          v121 = [PRSRankingItem alloc];
          objc_msgSend(v32, "setRankingItem:", v121);
          if ((v153 | v155) == 1)
          {
            if (v153)
              v169 = 4096;
            else
              v169 = 0x2000;
            -[PRSRankingItem setBundleIDType:](v121, "setBundleIDType:", -[PRSRankingItem bundleIDType](v121, "bundleIDType") | v169);
          }
        }
        v122 = SSSetTopHitWithReasonType(1, v32, 7, 1, 1);
        v143 = v249;
        v152 = v209;
        if (!v122)
        {
LABEL_327:
          if (((v152 != 9) & ~v143) != 0)
            goto LABEL_328;
          if (v143)
          {
            v170 = objc_msgSend(v208, "isEqualToString:", CFSTR("com.apple.worldclock"), SpecialThreshold);
            v143 = v249;
            v171 = v170;
            v152 = v209;
          }
          else
          {
            v171 = 0;
          }
          if (v152 != 9 && !v171)
            goto LABEL_328;
          if (!v121)
          {
            v121 = [PRSRankingItem alloc];
            objc_msgSend(v32, "setRankingItem:", v121);
            if (v171)
              -[PRSRankingItem setBundleIDType:](v121, "setBundleIDType:", -[PRSRankingItem bundleIDType](v121, "bundleIDType") | 0x40000000);
          }
          v122 = SSSetTopHitWithReasonType(1, v32, 20, 1, 1);
          v143 = v249;
          v152 = v209;
          if (!v122)
          {
LABEL_328:
            if (((v152 != 10) & ~v143) != 0)
              goto LABEL_285;
            if (v143)
            {
              v172 = objc_msgSend(v208, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"), SpecialThreshold);
              v152 = v209;
            }
            else
            {
              v172 = 0;
            }
            if (v152 != 10 && !v172)
              goto LABEL_285;
            if (!v121)
            {
              v121 = [PRSRankingItem alloc];
              objc_msgSend(v32, "setRankingItem:", v121);
              if (v172)
                -[PRSRankingItem setBundleIDType:](v121, "setBundleIDType:", -[PRSRankingItem bundleIDType](v121, "bundleIDType") | 0x80000000);
            }
            v122 = SSSetTopHitWithReasonType(1, v32, 21, 1, 1);
            if (!v122)
            {
LABEL_285:
              if ((v250 & 0x40000) != 0 && -[PRSRankingItem topHitReason](v121, "topHitReason", SpecialThreshold) == 16)
                v122 = SSSetTopHitWithReasonType(1, v32, 16, 1, 0);
              else
                v122 = 0;
              if (!v122 && v216 != 0)
              {
                v173 = (v250 & 0x200000) == 0;
                if (v94 >= v43)
                  v173 = 1;
                if (((v173 | v226) & 1) != 0)
                  v122 = 0;
                else
                  v122 = SSSetTopHitWithReasonType(1, v32, 11, 1, 1);
              }
            }
          }
        }
      }
LABEL_169:
      v144 = v122;
      SSDefaultsGetResources();
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v145, "BOOLeanForKey:", CFSTR("EnableRecencyTopHitCheck"));

      if (v146)
      {
        v148 = v144;
        v149 = v214;
        v30 = v229;
        v27 = v243;
        if (!v144)
        {
          if (a5)
            v150 = 0;
          else
            v150 = v25 == 0;
          v151 = v222;
          if (!v150)
            v151 = 0;
          if (v151)
          {
            *(float *)&v147 = v43;
            v148 = 0;
            if (!+[PRSRankingItemRanker isBlendingScoreDemoted:](PRSRankingItemRanker, "isBlendingScoreDemoted:", v147)&& (v250 & 0x904) == 0)
            {
              v148 = SSSetTopHitWithReasonType(1, v32, 6, 1, 1);
            }
          }
          else
          {
            v148 = 0;
          }
        }
      }
      else
      {
        v148 = v144;
        v149 = v214;
        v30 = v229;
        v27 = v243;
      }
      v156 = !v149;
      if (v148)
        v156 = 1;
      if (!v156)
        v148 = 0;
      if ((v156 & 1) == 0 && ((v234 ^ 1) & 1) == 0)
      {
        *(float *)&v147 = v43;
        if (+[PRSRankingItemRanker isBlendingScoreDemoted:](PRSRankingItemRanker, "isBlendingScoreDemoted:", v147))
        {
          if (!v239)
            goto LABEL_199;
          goto LABEL_212;
        }
        v148 = SSSetTopHitWithReasonType(1, v32, 9, 1, 1);
      }
      if (!v239)
      {
        if (v148)
          goto LABEL_216;
LABEL_199:
        if (-[PRSRankingItem topHitReason](v121, "topHitReason") == 15)
          v148 = SSSetTopHitWithReasonType(1, v32, 15, 1, 0);
        else
          v148 = 0;
        if (v148)
          v157 = 0;
        else
          v157 = v249;
        if (v157 == 1)
        {
          if ((-[PRSRankingItem bundleIDType](v121, "bundleIDType") & 0x10) != 0
            && -[PRSRankingItem hasShortCut](v121, "hasShortCut"))
          {
            v148 = SSSetTopHitWithReasonType(1, v32, 26, 1, 1);
            goto LABEL_209;
          }
        }
        else
        {
LABEL_209:
          if (v148)
            goto LABEL_216;
        }
        if (-[PRSRankingItem topHitReason](v121, "topHitReason") == 17)
        {
          v148 = SSSetTopHitWithReasonType(1, v32, 17, 1, 0);
          if (v148)
            goto LABEL_216;
        }
        goto LABEL_212;
      }
      if (v148)
        goto LABEL_216;
LABEL_212:
      if ((v250 & 0x200000) != 0 && -[PRSRankingItem topHitReason](v121, "topHitReason") == 19)
        v148 = SSSetTopHitWithReasonType(1, v32, 19, 1, 0);
      else
        v148 = 0;
LABEL_216:
      if (-[PRSRankingItem isNotExecutable](v121, "isNotExecutable"))
        v148 = SSSetTopHitWithReasonString(0, v32, CFSTR("Demoted RankingItem.isNotExecutable"), 1);
      if (!v148)
      {
        v127 = 1;
LABEL_226:
        v120 = v249;
        goto LABEL_242;
      }
      if ((v250 & 4) != 0 && v244 == 1)
      {
        -[PRSRankingItem firstMatchedAltName](v121, "firstMatchedAltName");
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v158
          && (*(_BYTE *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v121) & 0x82) != 0
          && (*(_QWORD *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v121) & 0xFFFFFFFFFFFFFF7DLL) == 0)
        {
          v127 = 1;
          v148 = SSSetTopHitWithReasonString(0, v32, CFSTR("Demoted Contact with 1 query term and no prefix match"), 1);
          if (!v148)
            goto LABEL_226;
        }
      }
      if ((-[PRSRankingItem bundleIDType](v121, "bundleIDType") & 0x200000) == 0)
      {
        -[PRSRankingItem L2FeatureVector](v121, "L2FeatureVector");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "scoreForFeature:", 31);
        v161 = v160;

        if (v161 == v28)
        {
          v125 = SSSetTopHitWithReasonString(0, v32, CFSTR("Demoted Legacy Donated User Activity with score 1.0"), 1);
          v120 = v249;
        }
        else
        {
          v241 = v148;
          SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](v121, "attributes"), 0);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](v121, "attributes"), 0xBuLL);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v162, "hasPrefix:", CFSTR("com.apple.siri.interaction"))
            && objc_msgSend(v163, "isEqualToString:", CFSTR("/app/intents")))
          {
            v241 = SSSetTopHitWithReasonString(0, v32, CFSTR("Demoted User Activity donated from com.apple.siri.interaction"), 1);
          }

          v120 = v249;
          v125 = v241;
        }
LABEL_236:
        if (!v125)
          goto LABEL_112;
        goto LABEL_237;
      }
      v120 = v249;
LABEL_237:
      v164 = v252;
      if (v27 == -1)
        v164 = 0;
      if (v27 < v25)
        v127 = v164;
      else
        v127 = 0;
LABEL_242:
      v165 = v221 | v120 | v127 & v247 ^ 1;
      if (v165)
        v166 = 4;
      else
        v166 = 2;
      if ((v127 & 1) != 0 || !v165)
      {
        v168 = v228;
      }
      else
      {
        v167 = v223;
        v168 = v228;
        if (!v223)
          v167 = (void *)objc_opt_new();
        v223 = v167;
        objc_msgSend(v167, "addObject:", v32);
        v166 = v195;
      }

      v29 = v224;
      if ((v166 | 4) != 4)
        goto LABEL_315;
LABEL_36:
      if (v30 == ++v25)
        goto LABEL_315;
    }
  }
  v223 = 0;
  v29 = v224;
  v11 = v18;
LABEL_315:
  v187 = v223;

LABEL_316:
  return v187;
}

- (SFMutableResultSection)bullseyeSectionForTopHit:(uint64_t)a3 initiallyHidden:(int)a4 checkForTopHit:(int)a5 boostSafari:(int)a6 thresholdCounter:(void *)a7 existingResults:(int)a8 allowMultipleTopHits:
{
  id v15;
  void *v16;
  SFMutableResultSection *v17;
  SFMutableResultSection *v18;

  v15 = a2;
  if (a1)
  {
    -[SSBullseyeTopHitsManager bullseyeResultSetForTopHit:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:](a1, v15, a4, a5, a6, a7, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[SFMutableResultSection initWithPrototype:]([SFMutableResultSection alloc], "initWithPrototype:", v15);
      v18 = v17;
      if (a6)
      {
        if ((a3 & 1) == 0 && -[SFResultSection maxInitiallyVisibleResults](v17, "maxInitiallyVisibleResults") != 1)
          -[SFResultSection setMaxInitiallyVisibleResults:](v18, "setMaxInitiallyVisibleResults:", 1);
        if (-[SFResultSection isInitiallyHidden](v18, "isInitiallyHidden") != (_DWORD)a3)
          -[SFResultSection setIsInitiallyHidden:](v18, "setIsInitiallyHidden:", a3);
      }
      -[SFMutableResultSection setResultSet:](v18, "setResultSet:", v16);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)bullseyeSectionForTopHit:(id)a3 initiallyHidden:(BOOL)a4 checkForTopHit:(BOOL)a5 thresholdCounter:(int)a6
{
  return -[SSBullseyeTopHitsManager bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:]((uint64_t)self, a3, a4, a5, 0, a6, 0, 1);
}

- (id)bullseyeTopHitSection
{
  void *v3;
  void *v4;
  NSObject *v5;
  int64_t queryID;
  void *v7;
  void *v8;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SFMutableResultSection relatedSectionBundleIdentifier](self->_topHitSection, "relatedSectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PRSLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        queryID = self->_queryID;
        objc_msgSend(v4, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = 67109378;
        v10[1] = queryID;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1B86C5000, v5, OS_LOG_TYPE_INFO, "### [%d] top hit section title:%@", (uint8_t *)v10, 0x12u);

      }
      -[SSBullseyeTopHitsManager bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:thresholdCounter:](self, "bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:thresholdCounter:", v4, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bullseyeTopHitSections:(id)a3 maxTopHitsCount:(int)a4 minThresholdForBigResult:(double)a5 needExceptionForSafariSection:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  char v40;
  BOOL v41;
  void *v42;
  char IsSyndicatedPhotos;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  NSObject *v53;
  int64_t queryID;
  _BOOL4 v55;
  void *v57;
  char v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  float v75;
  float v76;
  void *v77;
  int v78;
  char v79;
  int v80;
  char v81;
  char v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t m;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  char v97;
  void *v98;
  int v99;
  uint64_t n;
  void *v101;
  int v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  float v107;
  float v108;
  void *v109;
  id v110;
  int v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  int v116;
  SFMutableResultSection *v117;
  SFMutableResultSection *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  int v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  char v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  int v139;
  void *v140;
  char v141;
  int v142;
  void *v143;
  char v144;
  char v145;
  uint64_t v146;
  id v147;
  unint64_t v148;
  id v149;
  id v150;
  int v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  void *v155;
  void *v156;
  int v157;
  char v158;
  void *v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  int v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _BYTE v182[128];
  _BYTE v183[128];
  uint8_t v184[128];
  uint8_t buf[4];
  int v186;
  __int16 v187;
  _BYTE v188[14];
  _BYTE v189[128];
  _BYTE v190[128];
  uint64_t v191;

  v6 = a6;
  v191 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[SSRankingManager getTopHitsContinuationThresholds]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRankingManager getForbiddenSecondSections]();
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRankingManager getPoorSecondSections]();
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "count");
  v129 = v9;
  v11 = objc_msgSend(v9, "count");
  v152 = SSMaxSectionsBelowSuggestions();
  PRSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(float *)buf = 1.5047e-36;
    v186 = v11;
    v187 = 2112;
    *(_QWORD *)v188 = v129;
    _os_log_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_INFO, "### [%d] %@", buf, 0x12u);
  }

  if (!v11)
  {
    v13 = 0;
    goto LABEL_188;
  }
  v130 = v11;
  v148 = v10;
  v149 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v147 = v8;
  if (v152)
  {
    v150 = 0;
  }
  else
  {
    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v178, v190, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v179;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v179 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * i);
          objc_msgSend(v19, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

          if (v21)
          {
            v150 = v19;
            goto LABEL_17;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v178, v190, 16);
        if (v16)
          continue;
        break;
      }
      v150 = 0;
LABEL_17:
      v8 = v147;
      v10 = v148;
    }
    else
    {
      v150 = 0;
    }

  }
  v142 = 0;
  v140 = 0;
  v136 = 0;
  v22 = 0;
  v157 = 0;
  v128 = 0;
  v126 = !v6;
  v141 = 1;
  v151 = a4;
  do
  {
    if (!v10 || (int)v22 >= a4)
      goto LABEL_173;
    v23 = 0;
    v144 = 0;
    v158 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "domain");
      if (v26 == 2 && (v158 & 1) != 0)
        goto LABEL_47;
      v153 = v26;
      v159 = v25;
      objc_msgSend(v24, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

      v160 = v22;
      if (v29)
      {
        v30 = (void *)objc_opt_new();
        v174 = 0u;
        v175 = 0u;
        v176 = 0u;
        v177 = 0u;
        v155 = v28;
        objc_msgSend(v28, "resultSet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v175;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v175 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * j);
              objc_msgSend(v36, "applicationBundleIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = SSScreenTimeStatusForBundleIDWithCompletionHandler(v37, 0);

              if ((v38 & 1) == 0)
                objc_msgSend(v30, "addObject:", v36);
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
          }
          while (v33);
        }

        v39 = objc_msgSend(v30, "count");
        v40 = v39 == 0;
        if (v39)
        {
          v28 = v155;
          objc_msgSend(v155, "setResultSet:", v30);
          v40 = 0;
          v8 = v147;
          a4 = v151;
          v10 = v148;
          v22 = v160;
        }
        else
        {
          v8 = v147;
          a4 = v151;
          v10 = v148;
          v22 = v160;
          v28 = v155;
        }
      }
      else
      {
        objc_msgSend(v28, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = SSScreenTimeStatusForBundleIDWithCompletionHandler(v30, 0);
      }

      v41 = v28 == v150 && v152 == 0;
      v24 = v28;
      if (v41)
        goto LABEL_46;
      if ((v40 & 1) != 0)
        goto LABEL_46;
      objc_msgSend(v28, "bundleIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v42);

      if ((IsSyndicatedPhotos & 1) != 0)
        goto LABEL_46;
      objc_msgSend(v24, "bundleIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
      {
        v45 = v24;
        objc_msgSend(v24, "relatedSectionBundleIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = SSSectionIsSyndicatedPhotos(v46);

        if ((v47 & 1) != 0)
        {
          v24 = v45;
          goto LABEL_172;
        }
      }
      else
      {
        v45 = v24;

      }
      v25 = v159;
      if ((v141 & 1) == 0 && (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
      {
        v24 = v45;
        goto LABEL_47;
      }
      v24 = v45;
      if ((int)v22 >= 1 && v159 && objc_msgSend(v132, "containsObject:", v159))
      {
        if (!objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.Preferences")))
          goto LABEL_118;
        objc_msgSend(v45, "resultSet");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v49)
        {
          v22 = v160;
LABEL_46:
          v25 = v159;
          goto LABEL_47;
        }
        objc_msgSend(v49, "rankingItem");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "topHitReason") & 0xF;

        v25 = v159;
        if (!v51)
        {
LABEL_118:
          v22 = v160;
          goto LABEL_47;
        }
      }
      objc_msgSend(v45, "title");
      v52 = objc_claimAutoreleasedReturnValue();
      PRSLogCategoryDefault();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        queryID = self->_queryID;
        *(float *)buf = 1.5048e-36;
        v186 = queryID;
        v187 = 1024;
        *(_DWORD *)v188 = v23;
        *(_WORD *)&v188[4] = 2112;
        *(_QWORD *)&v188[6] = v52;
        _os_log_impl(&dword_1B86C5000, v53, OS_LOG_TYPE_INFO, "### [%d] section[%d] title:%@", buf, 0x18u);
      }

      v143 = (void *)v52;
      v55 = v153 == 3 || v153 == 2 || v153 == 10;
      objc_msgSend(v24, "bundleIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

      v144 |= v58;
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      v156 = v24;
      objc_msgSend(v24, "resultSet");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v170, v184, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v171;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v171 != v62)
              objc_enumerationMutation(v59);
            v64 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * k);
            v169 = 3233;
            *(float *)buf = (float)(uint64_t)(v23 - (v144 & 1));
            v186 = 0;
            objc_msgSend(v64, "rankingItem");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v65;
            if (v65)
            {
              objc_msgSend(v65, "L2FeatureVector");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setScores:forFeatures:count:", buf, &v169, 1);

            }
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v170, v184, 16);
        }
        while (v61);
      }

      v24 = v156;
      v22 = v160;
      -[SSBullseyeTopHitsManager bullseyeSectionForTopHit:initiallyHidden:checkForTopHit:boostSafari:thresholdCounter:existingResults:allowMultipleTopHits:]((uint64_t)self, v156, 0, !v55, (v142 & 1) == 0, v160, v149, v152 == 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v140)
        v140 = (void *)objc_opt_new();
      a4 = v151;
      v10 = v148;
      if (!objc_msgSend(v68, "resultsCount"))
      {
        v158 |= v153 == 2;
        v25 = v159;
        goto LABEL_171;
      }
      objc_msgSend(v68, "resultSet");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "firstObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v70)
      {
        v25 = v159;
        goto LABEL_170;
      }
      v71 = v70;
      v72 = objc_msgSend(v70, "isSafariTopHit");
      objc_msgSend(v71, "rankingItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "L2FeatureVector");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "originalL2Score");
      v76 = v75;

      objc_msgSend(v71, "sectionBundleIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = v71;
      v78 = objc_msgSend(v71, "preferTopPlatter");
      v79 = v78;
      v142 |= v72;
      if (v153 == 2)
        v80 = v78;
      else
        v80 = 0;
      if (v153 == 2)
        v81 = 0;
      else
        v81 = v78;
      v133 = v68;
      v134 = v77;
      if ((int)v160 > 0 || (v81 & 1) != 0 || v80)
      {
        v24 = v156;
        if ((int)v160 > 0)
          goto LABEL_104;
      }
      else
      {
        v82 = objc_msgSend(v77, "isEqualToString:", CFSTR("com.apple.application"));
        v24 = v156;
        if ((v82 & 1) == 0 && (objc_msgSend(v132, "containsObject:", v134) & 1) == 0)
        {
          objc_msgSend(v71, "rankingItem");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "topHitReason");

          if (!v84)
          {
LABEL_104:
            v8 = v147;
            if (v152)
            {
LABEL_121:
              v89 = 0;
            }
            else
            {
              v85 = (uint64_t)v136;
              if (!v136)
                v85 = objc_opt_new();
              v136 = (void *)v85;
              v167 = 0u;
              v168 = 0u;
              v165 = 0u;
              v166 = 0u;
              objc_msgSend(v68, "resultSet");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
              if (v87)
              {
                v88 = v87;
                v89 = 0;
                v90 = *(_QWORD *)v166;
                do
                {
                  for (m = 0; m != v88; ++m)
                  {
                    if (*(_QWORD *)v166 != v90)
                      objc_enumerationMutation(v86);
                    v92 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * m);
                    objc_msgSend(v92, "setUsesCompactDisplay:", objc_msgSend(v92, "shouldUseCompactDisplay") | objc_msgSend(v92, "usesCompactDisplay"));
                    if (v157 > v151)
                      goto LABEL_117;
                    if ((objc_msgSend(v149, "containsObject:", v92) & 1) == 0)
                    {
                      objc_msgSend(v136, "addObject:", v92);
                      ++v157;
                      ++v89;
                      objc_msgSend(v149, "addObject:", v92);
                    }
                  }
                  v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
                }
                while (v88);
LABEL_117:
                a4 = v151;
                v10 = v148;
              }
              else
              {
                v89 = 0;
              }
              v24 = v156;
LABEL_163:

            }
            LODWORD(v22) = v160;
LABEL_165:
            if (v130 <= (int)v22)
              goto LABEL_167;
            v112 = v76;
            objc_msgSend(v129, "objectAtIndexedSubscript:", (int)v22);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "doubleValue");
            v115 = v114;

            if (v115 >= v112)
              goto LABEL_167;

LABEL_172:
            break;
          }
        }
      }
      v8 = v147;
      if ((v79 & 1) != 0)
      {
        if (objc_msgSend(v140, "count"))
          goto LABEL_121;
      }
      else
      {
        objc_msgSend(v135, "sectionBundleIdentifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v127, "containsObject:", v86) & 1) != 0)
        {
          v93 = objc_msgSend(v140, "count");

          if (v93)
            goto LABEL_121;
        }
        else
        {
          objc_msgSend(v135, "rankingItem");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v94, "topHitReason"))
          {

            v89 = 0;
            goto LABEL_163;
          }
          v95 = objc_msgSend(v140, "count");

          if (v95)
            goto LABEL_121;
        }
      }
      LODWORD(v22) = v160;
      if (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")))
      {
        objc_msgSend(v24, "relatedSectionBundleIdentifier");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("com.apple.application"));

        v141 &= v97 ^ 1;
      }
      objc_msgSend(v140, "addObject:", v68);
      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      objc_msgSend(v68, "resultSet");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
      v99 = 0;
      v89 = 0;
      if (!v154)
        goto LABEL_156;
      v145 = 0;
      v137 = 0;
      v131 = 0;
      v146 = *(_QWORD *)v162;
      while (2)
      {
        for (n = 0; n != v154; ++n)
        {
          if (*(_QWORD *)v162 != v146)
            objc_enumerationMutation(v98);
          v22 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * n);
          objc_msgSend((id)v22, "setUsesCompactDisplay:", objc_msgSend((id)v22, "shouldUseCompactDisplay") | objc_msgSend((id)v22, "usesCompactDisplay"));
          objc_msgSend(v149, "addObject:", v22);
          objc_msgSend((id)v22, "sectionBundleIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v101, "isEqualToString:", CFSTR("com.apple.application")))
          {
            if ((v99 & 1) == 0)
              v99 = 1;
            v102 = v157;
            if ((v145 & 1) == 0)
              v102 = v157 + 1;
            v157 = v102;
            if ((v145 & 1) == 0)
              ++v89;
            v145 = 1;
            LODWORD(v22) = v160;
          }
          else
          {
            if (v157 > v151)
            {

              LODWORD(v22) = v160;
              goto LABEL_156;
            }
            if (objc_msgSend(v101, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
            {
              v139 = v99;
              v103 = v8;
              v104 = v98;
              objc_msgSend((id)v22, "rankingItem");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "L2FeatureVector");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "scoreForFeature:", 1982);
              v108 = v107;

              if (v108 == 0.0)
              {
                LODWORD(v22) = v160;
                v137 |= (_DWORD)v160 == 0;
                v98 = v104;
                v8 = v103;
              }
              else
              {
                v98 = v104;
                if ((v108 != 1.0 || (v137 & 1) == 0) | v131 & 1)
                {
                  LODWORD(v22) = v160;
                  v8 = v103;
                  v99 = v139;
                  goto LABEL_151;
                }
                objc_msgSend((id)v22, "setUsesCompactDisplay:", 1);
                v109 = v136;
                v8 = v103;
                if (!v136)
                  v109 = (void *)objc_opt_new();
                v136 = v109;
                objc_msgSend(v109, "addObject:", v22);
                objc_msgSend(v149, "addObject:", v22);
                v131 = 1;
                LODWORD(v22) = v160;
              }
              v99 = v139;
            }
            else
            {
              LODWORD(v22) = v160;
            }
            ++v157;
            ++v89;
          }
LABEL_151:

        }
        v154 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
        if (v154)
          continue;
        break;
      }
LABEL_156:

      v110 = v133;
      v111 = v126;
      if ((v99 & 1) == 0)
        v111 = 1;
      v128 = v110;
      a4 = v151;
      v10 = v148;
      v24 = v156;
      if (((v111 | v142) & 1) != 0)
        goto LABEL_165;
LABEL_167:
      if (v89)
        v23 = 0;
      v22 = (v89 + v22);

      v25 = v159;
      v68 = v133;
      v70 = v135;
LABEL_170:

LABEL_171:
LABEL_47:

      ++v23;
    }
    while (v23 < v10 && (int)v22 < a4);
LABEL_173:
    v116 = v22;
    v22 = 1;
  }
  while (!v116);
  if (objc_msgSend(v136, "count"))
  {
    if (v152)
    {
      v117 = v128;
      if (!v117)
      {
        v118 = [SFMutableResultSection alloc];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = -[SFMutableResultSection initWithSection:](v118, "initWithSection:", v119);

        -[SFMutableResultSection resultSet](v117, "resultSet");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "removeAllObjects");

        objc_msgSend(v140, "addObject:", v117);
      }
      -[SFMutableResultSection resultSet](v117, "resultSet");
      v121 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "addObjectsFromArray:", v136);
    }
    else
    {
      objc_msgSend(v150, "results");
      v117 = (SFMutableResultSection *)objc_claimAutoreleasedReturnValue();
      if (-[SFMutableResultSection count](v117, "count"))
      {
        v122 = (void *)MEMORY[0x1E0C99DE8];
        -[SFMutableResultSection firstObject](v117, "firstObject");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "arrayWithObject:", v123);
        v121 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v121, "addObjectsFromArray:", v136);
        if ((unint64_t)-[SFMutableResultSection count](v117, "count") >= 2)
        {
          -[SFMutableResultSection subarrayWithRange:](v117, "subarrayWithRange:", 1, -[SFMutableResultSection count](v117, "count") - 1);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObjectsFromArray:", v124);

        }
      }
      else
      {
        v121 = v136;
      }
      objc_msgSend(v150, "setResults:", v121);
    }

  }
  v13 = v140;

LABEL_188:
  return v13;
}

- (void)resetVisibilityCounts
{
  self->_initiallyVisibleSectionSentCount = 0;
  self->_initiallyHiddenSectionSentCount = 0;
}

- (id)tagOrFilterHiddenSectionsForClient:(id)a3 isCommittedSearch:(BOOL)a4 maxVisibleSections:(int64_t)a5 maxTopHitsCount:(int)a6 minThresholdForBigResult:(double)a7 topHitSection:(id *)a8
{
  _BOOL4 v12;
  __CFString *v14;
  SFMutableResultSection *v15;
  SFMutableResultSection *v16;
  SFMutableResultSection *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  int v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  SFMutableResultSection *v32;
  uint64_t v33;
  SFMutableResultSection *j;
  void *v35;
  void *v36;
  int v37;
  SFMutableResultSection *v38;
  void *v39;
  int IsSyndicatedPhotos;
  SFMutableResultSection *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  SFMutableResultSection *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  SFMutableResultSection *v55;
  void *v56;
  void *v57;
  void *v58;
  SFMutableResultSection *v59;
  NSObject *v60;
  SFMutableResultSection *v61;
  void *v62;
  void *v63;
  id *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  SFMutableResultSection *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  id v80;
  __CFString *v81;
  int v82;
  unint64_t v83;
  NSObject *v84;
  int64_t queryID;
  void *v86;
  id v87;
  __CFString *v88;
  void *v89;
  unint64_t v90;
  uint64_t ImportantBits;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  SFMutableResultSection *v97;
  SFMutableResultSection *v98;
  SFMutableResultSection *v99;
  int v100;
  unint64_t v101;
  SFMutableResultSection *v102;
  SFMutableResultSection *v103;
  SFMutableResultSection *v104;
  BOOL v105;
  int v106;
  NSObject *v107;
  int64_t v108;
  SFMutableResultSection *v109;
  int v110;
  void *v111;
  SFMutableResultSection *v112;
  SFMutableResultSection *v113;
  SFMutableResultSection *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  void *v119;
  const __CFString *v120;
  const __CFString *v121;
  float v122;
  float v123;
  void *v124;
  void *v125;
  float v126;
  float v127;
  int v128;
  void *v129;
  SSBullseyeTopHitsManager *v130;
  int v131;
  void *v132;
  float v133;
  float v134;
  void *v135;
  float v136;
  float v137;
  unint64_t v138;
  unint64_t v139;
  _BOOL4 v141;
  void *v142;
  void *v143;
  uint64_t v144;
  _BOOL4 v145;
  uint64_t v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  const __CFString *v152;
  int v153;
  NSObject *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t Count;
  id v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  id v169;
  id v170;
  unint64_t v171;
  uint64_t v172;
  BOOL v173;
  unint64_t v174;
  int64_t initiallyVisibleSectionSentCount;
  uint64_t v176;
  void *v177;
  void *v178;
  int v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  uint64_t v184;
  BOOL v185;
  int v186;
  SFMutableResultSection *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t m;
  void *v193;
  char v194;
  int64_t v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  SFMutableResultSection *v199;
  _BOOL4 v200;
  __int128 v201;
  NSObject *v202;
  SFMutableResultSection *topHitSection;
  uint64_t v204;
  void *v205;
  NSObject *v206;
  void *v207;
  unint64_t v208;
  unint64_t v209;
  int64_t v210;
  uint64_t v211;
  char *v212;
  unint64_t v214;
  unint64_t v215;
  uint64_t n;
  void *v217;
  void *v218;
  char v219;
  __int128 v220;
  uint64_t v221;
  __int128 *v222;
  id v223;
  const __CFString *v224;
  __int128 v225;
  SFMutableResultSection *v226;
  SFMutableResultSection *v227;
  SFMutableResultSection *v228;
  char *v229;
  __CFString *v230;
  int v231;
  unint64_t v232;
  int v233;
  SFMutableResultSection *v234;
  _BOOL4 v235;
  __int128 v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  __CFString *v240;
  int v241;
  id v242;
  id v243;
  SFMutableResultSection *v244;
  __int128 v245;
  const __CFString *v246;
  uint64_t v247;
  uint64_t v248;
  __CFString *v249;
  void *v250;
  id v251;
  uint64_t v252;
  void *v253;
  const __CFString *v254;
  int v255;
  int v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  id v260;
  id v261;
  uint64_t v262;
  SSBullseyeTopHitsManager *v263;
  id v264;
  id v265;
  id v266;
  unint64_t v267;
  uint64_t v268;
  id v269;
  SFMutableResultSection *v270;
  int v271;
  int v272;
  id *v273;
  id v274;
  NSObject *v275;
  __CFString *v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  int v290;
  _BYTE v291[10];
  _BYTE v292[20];
  int v293;
  __int16 v294;
  int v295;
  __int16 v296;
  int v297;
  __int16 v298;
  id v299;
  __int16 v300;
  id v301;
  __int16 v302;
  id v303;
  __int16 v304;
  double v305;
  __int16 v306;
  double v307;
  __int16 v308;
  const __CFString *v309;
  __int16 v310;
  void *v311;
  __int16 v312;
  uint64_t v313;
  __int16 v314;
  uint64_t v315;
  __int16 v316;
  const __CFString *v317;
  __int16 v318;
  void *v319;
  __int16 v320;
  uint64_t v321;
  __int16 v322;
  uint64_t v323;
  _BYTE v324[128];
  _BYTE v325[128];
  _QWORD v326[19];

  v12 = a4;
  v326[16] = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v263 = self;
  v235 = v12;
  v238 = a5;
  if (v12)
  {
    v230 = v14;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_76;
  }
  LODWORD(v274) = a6;
  v288 = 0u;
  v289 = 0u;
  v286 = 0u;
  v287 = 0u;
  v275 = v14;
  v18 = -[NSObject countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v286, v326, 16);
  v273 = a8;
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    *(_QWORD *)&v277 = *(_QWORD *)v287;
    v276 = CFSTR("com.apple.mobilesafari");
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v287 != (_QWORD)v277)
          objc_enumerationMutation(v275);
        v23 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * i);
        objc_msgSend(v23, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
        {
          v25 = 1;
        }
        else
        {
          objc_msgSend(v23, "relatedSectionBundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.application"));

        }
        v21 |= v25;
        objc_msgSend(v23, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v276);

        v20 |= v28;
        if ((v21 & 1) != 0 && (v20 & 1) != 0)
        {
          v29 = 1;
          goto LABEL_17;
        }
      }
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v286, v326, 16);
      if (v19)
        continue;
      break;
    }
    v29 = 0;
LABEL_17:
    self = v263;
    a8 = v273;
  }
  else
  {
    v29 = 0;
  }

  v276 = (__CFString *)objc_opt_new();
  -[SSBullseyeTopHitsManager bullseyeTopHitSections:maxTopHitsCount:minThresholdForBigResult:needExceptionForSafariSection:](self, "bullseyeTopHitSections:maxTopHitsCount:minThresholdForBigResult:needExceptionForSafariSection:", v275, v274, v29, a7);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v282 = 0u;
  v283 = 0u;
  v284 = 0u;
  v285 = 0u;
  v31 = v275;
  v16 = (SFMutableResultSection *)-[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v282, v325, 16);
  v274 = v30;
  if (!v16)
  {
    v41 = 0;
    goto LABEL_38;
  }
  v32 = 0;
  v33 = *(_QWORD *)v283;
  while (2)
  {
    for (j = 0; j != v16; j = (SFMutableResultSection *)((char *)j + 1))
    {
      if (*(_QWORD *)v283 != v33)
        objc_enumerationMutation(v31);
      v35 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * (_QWORD)j);
      objc_msgSend(v35, "bundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

      if (v37)
      {
        v38 = v35;

        v32 = v38;
      }
      objc_msgSend(v35, "bundleIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v39);

      if (IsSyndicatedPhotos)
      {
        objc_msgSend(v35, "resultSet");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "rankingItem");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "photosMatch"))
        {

          v30 = v274;
        }
        else
        {
          objc_msgSend(v43, "rankingItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "photosExactMatch");

          v30 = v274;
          if (!v46)
          {
            v41 = 0;
            goto LABEL_36;
          }
        }
        v41 = v35;
LABEL_36:
        self = v263;

        v16 = v32;
        goto LABEL_37;
      }
    }
    v16 = (SFMutableResultSection *)-[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v282, v325, 16);
    if (v16)
      continue;
    break;
  }
  v41 = 0;
  self = v263;
  v16 = v32;
  v30 = v274;
LABEL_37:
  a8 = v273;
LABEL_38:

  objc_msgSend(*a8, "results");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");

  if (v48)
  {
    self->_haveBullseyeTopHitSection = 1;
    if (!-[__CFString count](v276, "count"))
      -[__CFString addObject:](v276, "addObject:", *a8);
  }
  else if (objc_msgSend(v30, "count"))
  {
    -[__CFString addObjectsFromArray:](v276, "addObjectsFromArray:", v30);
    objc_msgSend(v30, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setBundleIdentifier:", CFSTR("com.apple.spotlight.tophits"));
    v50 = objc_retainAutorelease(v49);
    *a8 = v50;
    self->_haveBullseyeTopHitSection = 1;

  }
  v226 = v41;
  if (v16)
    -[__CFString addObject:](v276, "addObject:", v16);
  if (!v238)
  {

    v60 = v31;
    v61 = 0;
    v230 = (__CFString *)v60;
    v17 = v226;
    goto LABEL_215;
  }
  v51 = (SFMutableResultSection *)*a8;
  -[SFMutableResultSection results](v51, "results");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = v51;
  if (objc_msgSend(v52, "count") != 1)
  {

    goto LABEL_55;
  }
  -[SFMutableResultSection results](v51, "results");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "firstObject");
  v54 = (id)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
LABEL_55:
    v275 = 0;
LABEL_56:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TOPHIT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v270;
    -[SFResultSection setTitle:](v270, "setTitle:", v62);

    goto LABEL_57;
  }
  v55 = v16;
  -[NSObject sectionBundleIdentifier](v54, "sectionBundleIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = v54;
  if ((objc_msgSend(v56, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")) & 1) != 0)
    goto LABEL_51;
  -[NSObject sectionBundleIdentifier](v54, "sectionBundleIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.calculation")))
  {
    -[NSObject sectionBundleIdentifier](v54, "sectionBundleIdentifier");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = objc_msgSend(v218, "isEqualToString:", CFSTR("com.apple.conversion"));

    if ((v219 & 1) != 0)
      goto LABEL_52;
    v16 = v55;
    goto LABEL_56;
  }

LABEL_51:
LABEL_52:
  -[NSObject sectionHeader](v54, "sectionHeader");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v270;
  -[SFResultSection setTitle:](v270, "setTitle:", v58);
  v16 = v55;
LABEL_57:

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v64 = (id *)objc_claimAutoreleasedReturnValue();

  -[SFMutableResultSection results](v59, "results");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "count");

  v15 = v59;
  v227 = v16;
  v273 = v64;
  if (v66)
    -[SFResultSection setSubtitle:](v16, "setSubtitle:", v64);
  else
    -[SFResultSection setTitle:](v16, "setTitle:", v64);
  v280 = 0u;
  v281 = 0u;
  v278 = 0u;
  v279 = 0u;
  v67 = v31;
  v68 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v278, v324, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v279;
    *(_QWORD *)&v277 = CFSTR("com.apple.searchd.suggestions");
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(_QWORD *)v279 != v70)
          objc_enumerationMutation(v67);
        v72 = *(SFMutableResultSection **)(*((_QWORD *)&v278 + 1) + 8 * k);
        if (v72 != v15)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * k), "bundleIdentifier");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v73, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")))
          {

          }
          else
          {
            -[SFResultSection bundleIdentifier](v72, "bundleIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "isEqualToString:", (_QWORD)v277);

            v15 = v270;
            if ((v75 & 1) == 0)
            {
              if (!v263->_haveBullseyeTopHitSection)
                goto LABEL_72;
              -[SFMutableResultSection resultSet](v72, "resultSet");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMutableResultSection resultSet](v270, "resultSet");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v76, "intersectsOrderedSet:", v77);

              v15 = v270;
              if (v78)
              {
                -[SFMutableResultSection resultSet](v270, "resultSet");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = -[SFMutableResultSection copySectionRemovingResults:](v72, "copySectionRemovingResults:", v79);

                -[__CFString addObject:](v276, "addObject:", v80);
                v15 = v270;
              }
              else
              {
LABEL_72:
                -[__CFString addObject:](v276, "addObject:", v72);
              }
            }
          }
        }
      }
      v69 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v278, v324, 16);
    }
    while (v69);
  }

  v81 = v276;
  v230 = v81;

  self = v263;
  v17 = v226;
  v16 = v227;
LABEL_76:
  v82 = -[SPSearchQueryContext queryKind](self->_queryContext, "queryKind");
  v83 = -[SPSearchQueryContext whyQuery](self->_queryContext, "whyQuery");
  PRSLogCategoryDefault();
  v84 = objc_claimAutoreleasedReturnValue();
  v227 = v16;
  v270 = v15;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    queryID = self->_queryID;
    -[SPSearchQueryContext searchString](self->_queryContext, "searchString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v86, 0);
    v87 = (id)objc_claimAutoreleasedReturnValue();
    v290 = 67109890;
    *(_DWORD *)v291 = queryID;
    v16 = v227;
    *(_WORD *)&v291[4] = 1024;
    *(_DWORD *)&v291[6] = v82;
    *(_WORD *)v292 = 2112;
    *(_QWORD *)&v292[2] = v87;
    *(_WORD *)&v292[10] = 2048;
    *(_QWORD *)&v292[12] = v83;
    _os_log_impl(&dword_1B86C5000, v84, OS_LOG_TYPE_INFO, "### [%d] sections %d %@ %lu", (uint8_t *)&v290, 0x22u);

    v15 = v270;
    self = v263;
  }

  v243 = (id)objc_opt_new();
  v88 = v230;
  v237 = -[__CFString count](v230, "count");
  -[SFMutableResultSection relatedSectionBundleIdentifier](self->_topHitSection, "relatedSectionBundleIdentifier");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = v89;
  if (v89)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_categoryToResultMapping, "objectForKeyedSubscript:", v89);
    v228 = (SFMutableResultSection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v228 = 0;
  }
  v90 = v238;
  ImportantBits = PRSRankingQueryImportantBits(1);
  v247 = v92;
  v248 = ImportantBits;
  v222 = &v220;
  v93 = v237;
  v229 = (char *)&v220 - ((8 * v237 + 15) & 0xFFFFFFFFFFFFFFF0);
  v221 = 8 * v237;
  bzero(v229, 8 * v237);
  if (v93 < 1)
    goto LABEL_208;
  v239 = 0;
  v95 = 0;
  v241 = 0;
  v233 = 0;
  v96 = 0;
  v246 = CFSTR("com.apple.mobilesafari");
  v224 = CFSTR("com.apple.parsec.related_search");
  *(_QWORD *)&v94 = 138412546;
  v220 = v94;
  *(_QWORD *)&v94 = 67109890;
  v225 = v94;
  *(_QWORD *)&v94 = 67113218;
  v236 = v94;
  *(_QWORD *)&v94 = 67114242;
  v245 = v94;
  v226 = v17;
  do
  {
    v252 = v96;
    -[__CFString objectAtIndexedSubscript:](v88, "objectAtIndexedSubscript:", v95, v220);
    v97 = (SFMutableResultSection *)objc_claimAutoreleasedReturnValue();
    v98 = v97;
    if (v90 && !v235)
    {
      if (v97 == v15 || v97 == v16)
      {
        v99 = v97;
        objc_msgSend(v243, "addObject:");
        v98 = v99;
        ++v90;
        goto LABEL_195;
      }
LABEL_92:
      v100 = 0;
      goto LABEL_98;
    }
    if (!v95)
    {
      if (v97 == self->_topHitSection)
      {
        v101 = v90;
        v102 = v228;
        v103 = v97;
        v104 = v228;

        if (!v102)
        {
          PRSLogCategoryDefault();
          v202 = objc_claimAutoreleasedReturnValue();
          v95 = 0;
          if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
          {
            topHitSection = self->_topHitSection;
            v290 = v220;
            *(_QWORD *)v291 = v223;
            *(_WORD *)&v291[8] = 2112;
            *(_QWORD *)v292 = topHitSection;
            _os_log_impl(&dword_1B86C5000, v202, OS_LOG_TYPE_DEFAULT, "### missing results section %@ for %@", (uint8_t *)&v290, 0x16u);
          }

          v98 = 0;
          v90 = v101;
          v88 = v230;
          goto LABEL_195;
        }
        v100 = 1;
        v98 = v104;
        v90 = v101;
        v88 = v230;
        v95 = 0;
      }
      else
      {
        v100 = 1;
      }
LABEL_98:
      if (v17)
        v105 = v17 == v98;
      else
        v105 = 0;
      v106 = v105;
      if ((v106 & v241 & 1) != 0)
      {
        v241 = 1;
        v98 = v17;
        goto LABEL_195;
      }
      v231 = v100;
      v244 = v98;
      v262 = v95;
      v238 = v90;
      PRSLogCategoryDefault();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v108 = self->_queryID;
        v109 = v244;
        v110 = -[SFResultSection maxInitiallyVisibleResults](v244, "maxInitiallyVisibleResults");
        -[SFResultSection title](v109, "title");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v290 = v225;
        *(_DWORD *)v291 = v108;
        v15 = v270;
        *(_WORD *)&v291[4] = 1024;
        *(_DWORD *)&v291[6] = v262;
        *(_WORD *)v292 = 1024;
        *(_DWORD *)&v292[2] = v110;
        *(_WORD *)&v292[6] = 2112;
        *(_QWORD *)&v292[8] = v111;
        _os_log_impl(&dword_1B86C5000, v107, OS_LOG_TYPE_DEFAULT, "### [%d] section[%d] maxInitiallyVisibleResults[%d] %@", (uint8_t *)&v290, 0x1Eu);

      }
      v112 = [SFMutableResultSection alloc];
      v113 = v244;
      v114 = -[SFMutableResultSection initWithPrototype:](v112, "initWithPrototype:", v244);
      v115 = (void *)objc_opt_new();
      -[SFMutableResultSection setResultSet:](v114, "setResultSet:", v115);
      -[SFMutableResultSection resultSet](v113, "resultSet");
      v269 = (id)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v269, "count");
      v232 = -[SFResultSection maxInitiallyVisibleResults](v113, "maxInitiallyVisibleResults");
      v268 = v116;
      v253 = v115;
      v234 = v114;
      if (v116 < 1)
      {
        v171 = objc_msgSend(v115, "count");
        if ((v231 & 1) == 0)
          -[SFResultSection isInitiallyHidden](v234, "isInitiallyHidden");
        v172 = 1;
        goto LABEL_167;
      }
      v117 = 0;
      v118 = 0;
      while (1)
      {
        objc_msgSend(v269, "objectAtIndex:", v117);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v277 = objc_msgSend(v119, "score");
        v121 = v120;
        objc_msgSend(v119, "l2score");
        v123 = v122;
        objc_msgSend(v119, "rankingItem");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "L2FeatureVector");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "originalL2Score");
        v127 = v126;

        LODWORD(v274) = objc_msgSend(v124, "eligibleForDemotion");
        v128 = objc_msgSend(v124, "shouldHideUnderShowMore");
        LODWORD(v273) = objc_msgSend(v124, "recentForTopHit");
        v272 = objc_msgSend(v124, "recentForAboveThresholdTopHit");
        if ((objc_msgSend(v124, "bundleIDType") & 0x100) != 0)
        {
          v129 = v115;
          v130 = self;
          objc_msgSend(v124, "L2FeatureVector");
          v131 = v128;
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "scoreForFeature:", 1);
          v134 = v133;

          objc_msgSend(v124, "L2FeatureVector");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "scoreForFeature:", 41);
          v137 = v136;

          if (v131)
          {
            self = v130;
            v138 = -[PRSRankingItemRanker queryTermLength](v130->_ranker, "queryTermLength");
            v139 = +[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen");
            v141 = v134 != 1.0 || v138 <= v139;
            if (v137 != 0.0)
              v141 = 1;
            LODWORD(v276) = v141;
          }
          else
          {
            LODWORD(v276) = 0;
            self = v130;
          }
          v115 = v129;
        }
        else
        {
          LODWORD(v276) = v128;
        }
        v271 = objc_msgSend(v119, "topHit");
        objc_msgSend(v119, "title");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "text");
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        v144 = v277 | (unint64_t)v121;
        PRSLogCategoryDefault();
        v275 = objc_claimAutoreleasedReturnValue();
        v145 = os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT);
        if (v144)
        {
          if (v145)
          {
            v257 = (unint64_t)v121 & v247;
            v146 = v277 & v248;
            v256 = self->_queryID;
            objc_msgSend(v119, "sectionBundleIdentifier");
            v266 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "applicationBundleIdentifier");
            v265 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "identifier");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "sectionBundleIdentifier");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            SSRedactSuggestionIdentifier(v147, v148);
            v264 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "sectionBundleIdentifier");
            v259 = objc_claimAutoreleasedReturnValue();
            v260 = v148;
            v267 = v118;
            v261 = v147;
            v258 = v146;
            if (v259
              && (objc_msgSend(v119, "sectionBundleIdentifier"),
                  v251 = (id)objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v251, "isEqualToString:", v246) & 1) != 0))
            {
              v255 = 0;
              v254 = CFSTR("(private)");
            }
            else
            {
              v255 = 1;
              SSRedactString(v143, 1);
              v249 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v254 = v249;
            }
            objc_msgSend(v119, "rankingItem");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "rankingItem");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v157 = objc_msgSend(v156, "attributes");
            objc_msgSend(v119, "rankingItem");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            Count = SSCompactRankingAttrsGetCount(objc_msgSend(v158, "attributes"));
            v290 = v245;
            *(_DWORD *)v291 = v256;
            *(_WORD *)&v291[4] = 1024;
            *(_DWORD *)&v291[6] = v262;
            *(_WORD *)v292 = 1024;
            *(_DWORD *)&v292[2] = v117;
            *(_WORD *)&v292[6] = 1024;
            *(_DWORD *)&v292[8] = v271;
            *(_WORD *)&v292[12] = 1024;
            *(_DWORD *)&v292[14] = (_DWORD)v276;
            *(_WORD *)&v292[18] = 1024;
            v293 = (int)v274;
            v294 = 1024;
            v295 = (int)v273;
            v296 = 1024;
            v297 = v272;
            v298 = 2112;
            v299 = v266;
            v300 = 2112;
            v301 = v265;
            v302 = 2112;
            v303 = v264;
            v304 = 2048;
            v305 = v127;
            v306 = 2048;
            v307 = v123;
            v308 = 2048;
            v309 = v121;
            v310 = 2048;
            v311 = (void *)v277;
            v312 = 2048;
            v313 = v257;
            v314 = 2048;
            v315 = v258;
            v316 = 2112;
            v317 = v254;
            v318 = 2048;
            v319 = v155;
            v320 = 2048;
            v321 = v157;
            v322 = 2048;
            v323 = Count;
            v154 = v275;
            _os_log_impl(&dword_1B86C5000, v275, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d,%d] %d %d %d %d %d %@ %@ %@ %f %f 0x%16.16llx%16.16llx 0x%16.16llx%16.16llx %@ (%p, %p, %lu)", (uint8_t *)&v290, 0xB4u);

            if (v255)
            v115 = v253;
            v118 = v267;
            v160 = v261;
            v161 = (void *)v259;
            if (v259)

            v162 = v264;
            v163 = v266;
LABEL_146:

            self = v263;
            v153 = (int)v276;
            goto LABEL_147;
          }
        }
        else if (v145)
        {
          v149 = self->_queryID;
          objc_msgSend(v119, "sectionBundleIdentifier");
          *(_QWORD *)&v277 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "applicationBundleIdentifier");
          v266 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "identifier");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "sectionBundleIdentifier");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          SSRedactSuggestionIdentifier(v150, v151);
          v265 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "sectionBundleIdentifier");
          v260 = (id)objc_claimAutoreleasedReturnValue();
          v261 = v151;
          v267 = v118;
          v250 = v143;
          v264 = v150;
          if (v260
            && (objc_msgSend(v119, "sectionBundleIdentifier"),
                v242 = (id)objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v242, "isEqualToString:", v246) & 1) != 0))
          {
            LODWORD(v259) = 0;
            v152 = CFSTR("(private)");
          }
          else
          {
            LODWORD(v259) = 1;
            SSRedactString(v143, 1);
            v152 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v240 = (__CFString *)v152;
          }
          objc_msgSend(v119, "rankingItem");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "rankingItem");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v166 = objc_msgSend(v165, "attributes");
          objc_msgSend(v119, "rankingItem");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = SSCompactRankingAttrsGetCount(objc_msgSend(v167, "attributes"));
          v290 = v236;
          *(_DWORD *)v291 = v149;
          *(_WORD *)&v291[4] = 1024;
          *(_DWORD *)&v291[6] = v262;
          *(_WORD *)v292 = 1024;
          *(_DWORD *)&v292[2] = v117;
          *(_WORD *)&v292[6] = 1024;
          *(_DWORD *)&v292[8] = v271;
          *(_WORD *)&v292[12] = 1024;
          *(_DWORD *)&v292[14] = (_DWORD)v276;
          *(_WORD *)&v292[18] = 1024;
          v293 = (int)v274;
          v294 = 1024;
          v295 = (int)v273;
          v296 = 1024;
          v297 = v272;
          v298 = 2112;
          v299 = (id)v277;
          v300 = 2112;
          v301 = v266;
          v302 = 2112;
          v303 = v265;
          v304 = 2048;
          v305 = v127;
          v306 = 2048;
          v307 = v123;
          v308 = 2112;
          v309 = v152;
          v310 = 2048;
          v311 = v164;
          v312 = 2048;
          v313 = v166;
          v314 = 2048;
          v315 = v168;
          v154 = v275;
          _os_log_impl(&dword_1B86C5000, v275, OS_LOG_TYPE_DEFAULT, "### [%d] result[%d,%d] %d %d %d %d %d %@ %@ %@ %f %f %@ (%p, %p, %lu)", (uint8_t *)&v290, 0x8Cu);

          if ((_DWORD)v259)
          v115 = v253;
          v118 = v267;
          v143 = v250;
          v169 = v264;
          v170 = v260;
          if (v260)

          v162 = v265;
          v163 = (id)v277;
          goto LABEL_146;
        }
        v153 = (int)v276;
        v154 = v275;
LABEL_147:

        objc_msgSend(v115, "addObject:", v119);
        v118 += v153 ^ 1u;

        if (v268 == ++v117)
        {
          v171 = objc_msgSend(v115, "count");
          if ((v231 & 1) != 0)
          {
            v17 = v226;
            v16 = v227;
            if (!v118)
            {
              v172 = 1;
              goto LABEL_166;
            }
LABEL_156:
            v174 = v118;
            initiallyVisibleSectionSentCount = self->_initiallyVisibleSectionSentCount;
            v176 = objc_msgSend(v243, "count");
            if (initiallyVisibleSectionSentCount + v239 + v176 >= v238)
            {
              -[SFResultSection bundleIdentifier](v234, "bundleIdentifier");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = objc_msgSend(v177, "isEqualToString:", v224) ^ 1;

            }
            else
            {
              v172 = 0;
            }
            goto LABEL_160;
          }
          v173 = -[SFResultSection isInitiallyHidden](v234, "isInitiallyHidden");
          v17 = v226;
          v16 = v227;
          if (!v173 && v118)
            goto LABEL_156;
          v172 = 1;
          v174 = v118;
          if (v118)
          {
LABEL_160:
            -[SFResultSection bundleIdentifier](v234, "bundleIdentifier");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            v179 = SSSectionIsSyndicatedPhotos(v178);

            v180 = v232;
            if (v174 >= v232)
              v181 = v232;
            else
              v181 = v174;
            if (!v179)
              v180 = v181;
            v15 = v270;
LABEL_168:
            if (v180 >= v171)
              v182 = 0;
            else
              v182 = v180;
            v183 = objc_msgSend(v243, "count");
            v184 = v252;
            if (v17)
              v185 = v183 - v252 + self->_initiallyVisibleSectionSentCount == v238 - 1;
            else
              v185 = 0;
            v186 = !v185;
            if (((v186 | v233 | v241) & 1) != 0)
            {
LABEL_190:
              if ((_DWORD)v172)
              {
                v198 = v184 + 1;
                v199 = v234;
                objc_storeStrong((id *)&v229[8 * v184], v234);
                v252 = v198;
              }
              else
              {
                v199 = v234;
              }
              v200 = v17 == v244;
              -[SFResultSection setIsInitiallyHidden:](v199, "setIsInitiallyHidden:", v172);
              -[SFResultSection setMaxInitiallyVisibleResults:](v199, "setMaxInitiallyVisibleResults:", v182);
              objc_msgSend(v243, "addObject:", v199);
              v233 |= v200;
              v95 = v262;
            }
            else
            {
              v187 = -[SFMutableResultSection initWithPrototype:]([SFMutableResultSection alloc], "initWithPrototype:", v17);
              v188 = (void *)objc_opt_new();
              -[SFMutableResultSection setResultSet:](v187, "setResultSet:", v188);
              -[SFMutableResultSection resultSet](v17, "resultSet");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              v190 = objc_msgSend(v189, "count");
              if (v190 >= 1)
              {
                v191 = v190;
                for (m = 0; m != v191; ++m)
                {
                  objc_msgSend(v189, "objectAtIndex:", m);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v188, "addObject:", v193);

                }
              }
              -[SFResultSection setIsInitiallyHidden:](v187, "setIsInitiallyHidden:", -[SFResultSection isInitiallyHidden](v17, "isInitiallyHidden"));
              objc_msgSend(v243, "addObject:", v187);
              if (v17 == v244)
                v194 = 1;
              else
                v194 = v172;
              v16 = v227;
              v115 = v253;
              if ((v194 & 1) == 0)
              {
                v195 = v263->_initiallyVisibleSectionSentCount;
                v196 = objc_msgSend(v243, "count");
                if (v195 + v239 + v196 >= v238)
                {
                  -[SFResultSection bundleIdentifier](v234, "bundleIdentifier");
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  v172 = objc_msgSend(v197, "isEqualToString:", v224) ^ 1;

                }
                else
                {
                  v172 = 0;
                }
              }

              v241 = 1;
              if (v17 != v244)
              {
                self = v263;
                v15 = v270;
                v184 = v252;
                goto LABEL_190;
              }
              v233 = 0;
              v95 = v262;
              self = v263;
              v15 = v270;
              v199 = v234;
            }

            v90 = v238;
            v88 = v230;
            v98 = v244;
            goto LABEL_195;
          }
LABEL_166:
          v15 = v270;
LABEL_167:
          v180 = v232;
          goto LABEL_168;
        }
      }
    }
    if (v97 == v228)
    {
      v98 = v228;
      goto LABEL_195;
    }
    if (!v235 || v97 != self->_topHitSection)
      goto LABEL_92;
LABEL_195:

    ++v95;
    v96 = v252;
    v239 = -v252;
  }
  while (v95 != v237);
  if (!v252)
  {
LABEL_208:
    v252 = 0;
    goto LABEL_209;
  }
  if ((unint64_t)(self->_initiallyHiddenSectionSentCount + v252) <= 1)
  {
    v204 = 0;
    *(_QWORD *)&v201 = 134218498;
    v277 = v201;
    do
    {
      v205 = *(void **)&v229[8 * v204];
      objc_msgSend(v205, "setIsInitiallyHidden:", 0);
      SSGeneralLog();
      v206 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v205, "bundleIdentifier");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        v290 = v277;
        *(_QWORD *)v291 = v204;
        *(_WORD *)&v291[8] = 2112;
        *(_QWORD *)v292 = v207;
        *(_WORD *)&v292[8] = 1024;
        *(_DWORD *)&v292[10] = 2;
        _os_log_impl(&dword_1B86C5000, v206, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Unhiding section (%lu) %@ due to minimum hiding quota (%d)", (uint8_t *)&v290, 0x1Cu);

      }
      ++v204;
    }
    while (v252 != v204);
    v252 = 0;
    self = v263;
    v16 = v227;
  }
LABEL_209:
  v208 = objc_msgSend(v243, "count");
  v209 = v208;
  if (!self->_initiallyVisibleSectionSentCount
    && !self->_initiallyHiddenSectionSentCount
    && (!v16 && v252 == v208 || v16 && v252 == v208 - 1))
  {
    v214 = 2;
    if (v16)
      v214 = 3;
    v215 = v208 >= v214 ? v214 : v208;
    if (v215)
    {
      for (n = 0; v215 != n; ++n)
      {
        objc_msgSend(v243, "objectAtIndexedSubscript:", n);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v217, "isInitiallyHidden") & 1) != 0)
        {
          objc_msgSend(v217, "setIsInitiallyHidden:", 0);
          --v252;
        }
        else if (!v16 || n)
        {

          break;
        }

      }
    }
  }
  v210 = self->_initiallyHiddenSectionSentCount + v252;
  self->_initiallyVisibleSectionSentCount += v209 - v252;
  self->_initiallyHiddenSectionSentCount = v210;
  +[SSBullseyeTopHitsManager dedupeWebURLSuggestionsFromSections:](SSBullseyeTopHitsManager, "dedupeWebURLSuggestionsFromSections:", v243);
  v60 = objc_claimAutoreleasedReturnValue();
  v211 = v221;
  if (v237)
  {
    v212 = v229 - 8;
    do
    {

      v211 -= 8;
    }
    while (v211);
  }

  v61 = v270;
LABEL_215:

  return v60;
}

+ (id)dedupeWebURLSuggestionsFromSections:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v55 = (void *)objc_opt_new();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

    if (v6)
    {
      v49 = v3;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v7 = v4;
      objc_msgSend(v4, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v61 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v13, "url");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              v16 = v14;
            }
            else
            {
              objc_msgSend(v13, "punchout");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "urls");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "firstObject");
              v16 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v13, "contentURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              v21 = v19;
            }
            else
            {
              objc_msgSend(v16, "absoluteString");
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            v22 = v21;

            strippedURL(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v55, "addObject:", v23);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        }
        while (v10);
      }

      v3 = v49;
      v4 = v7;
    }
    objc_msgSend(v3, "objectAtIndex:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "count"))
    {
      objc_msgSend(v24, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

      if (v26)
      {
        v48 = v4;
        v50 = v3;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v51 = v24;
        objc_msgSend(v24, "results");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v57;
          v52 = *(_QWORD *)v57;
          v53 = v27;
          do
          {
            v31 = 0;
            v54 = v29;
            do
            {
              if (*(_QWORD *)v57 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v31);
              objc_msgSend(v32, "compactCard");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33;
              if (v33)
              {
                v35 = v33;
              }
              else
              {
                objc_msgSend(v32, "inlineCard");
                v35 = (id)objc_claimAutoreleasedReturnValue();
              }
              v36 = v35;

              objc_msgSend(v36, "cardSections");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "firstObject");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = v38;
                objc_msgSend(v39, "suggestionText");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "text");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v41;
                if (v41)
                {
                  v43 = v41;
                }
                else
                {
                  objc_msgSend(v40, "formattedTextPieces");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "firstObject");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "text");
                  v43 = (id)objc_claimAutoreleasedReturnValue();

                  v27 = v53;
                  v30 = v52;
                }

                if (objc_msgSend(v55, "containsObject:", v43)
                  && objc_msgSend(v39, "suggestionType") == 4)
                {
                  objc_msgSend(v51, "removeResults:", v32);
                }

                v29 = v54;
              }

              ++v31;
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          }
          while (v29);
        }

        v24 = v51;
        if (objc_msgSend(v51, "resultsCount"))
        {
          v3 = v50;
        }
        else
        {
          v46 = (void *)objc_msgSend(v50, "mutableCopy");
          objc_msgSend(v46, "removeObject:", v51);

          v3 = v46;
        }
        v4 = v48;
      }
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_topHitSection, 0);
  objc_storeStrong((id *)&self->_categoryToResultMapping, 0);
}

@end
