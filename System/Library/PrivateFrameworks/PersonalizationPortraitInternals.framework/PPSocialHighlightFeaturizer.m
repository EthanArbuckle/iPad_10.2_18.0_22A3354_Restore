@implementation PPSocialHighlightFeaturizer

- (PPSocialHighlightFeaturizer)initWithFeedbackPublisher:(id)a3 topicStore:(id)a4 interactionStore:(id)a5 significantContactHandles:(id)a6 features:(id)a7 highlights:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _UNKNOWN **v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _UNKNOWN **v30;
  void *v31;
  void *v32;
  void *v33;
  _UNKNOWN **v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  _QWORD *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  NSObject *v85;
  id v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  _UNKNOWN **v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  uint64_t v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t n;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t ii;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *jj;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t kk;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  __CFString *v157;
  id v158;
  void *mm;
  uint64_t v160;
  id v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  void *v169;
  double v170;
  void *v171;
  unint64_t v172;
  void *v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  void *v178;
  _QWORD *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  id v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  PPSocialHighlightPropertyValueProvider *v193;
  void *v194;
  _QWORD *v195;
  void *v196;
  PPSocialHighlightPropertyValueProvider *v197;
  void *v198;
  uint64_t v199;
  id v200;
  id v201;
  uint64_t nn;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  void *v207;
  PPSocialHighlightStaticFeatureProvider *v208;
  void *v209;
  void *v210;
  _QWORD *v211;
  void *v212;
  id v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t i1;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t i2;
  uint64_t v235;
  void *v236;
  void *v237;
  void *v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t i3;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  id v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t i4;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  PPSocialHighlightFeaturizer *v266;
  void *v268;
  void *v269;
  __CFString *v270;
  uint64_t v271;
  NSObject *v272;
  void *v273;
  void *v274;
  void *v275;
  id v276;
  void *v278;
  id v279;
  id v280;
  void *v281;
  id v282;
  id v283;
  id v284;
  id v285;
  NSObject *v286;
  id v287;
  void *v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  id v292;
  id obj;
  NSObject *obja;
  id objb;
  id objc;
  uint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  NSObject *v302;
  id v303;
  void *v304;
  id v305;
  uint64_t v306;
  id v307;
  id v308;
  void *v309;
  void *v310;
  uint64_t v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id v316;
  uint64_t v317;
  void *v318;
  __CFString *v319;
  void *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  id contextd;
  id contexte;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
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
  __int128 v354;
  uint64_t v355;
  uint8_t v356[16];
  __int128 v357;
  __int128 v358;
  __int128 v359;
  uint8_t v360[16];
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 aBlock;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __CFString *v372;
  id v373;
  uint8_t buf[128];
  uint64_t v375;

  v375 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v280 = a4;
  v279 = a5;
  v14 = a7;
  v15 = a8;
  v276 = a6;
  v281 = (void *)objc_opt_new();
  v278 = v13;
  if (v13)
  {
    v16 = v13;
  }
  else
  {
    pp_social_highlights_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no feedback publisher provided.", buf, 2u);
    }

    v16 = 0;
  }
  +[PPSocialHighlightFeaturizer _feedbackFeaturesForPublisher:highlights:features:]((uint64_t)PPSocialHighlightFeaturizer, v16, v15, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "addEntriesFromDictionary:", v18);

  v287 = v14;
  v288 = v15;
  if (v279)
  {
    v312 = v279;
    v307 = v15;
    v19 = v14;
    v20 = &off_1E7E12000;
    objc_opt_self();
    v21 = objc_opt_new();
    *(_OWORD *)v360 = 0u;
    v361 = 0u;
    v362 = 0u;
    v363 = 0u;
    obj = v19;
    v323 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v360, &v368, 16);
    if (!v323)
      goto LABEL_28;
    v317 = *(_QWORD *)v361;
    v297 = *MEMORY[0x1E0D70E28];
    v302 = v21;
    while (1)
    {
      for (i = 0; i != v323; ++i)
      {
        if (*(_QWORD *)v361 != v317)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*(_QWORD *)&v360[8] + 8 * i);
        v24 = (void *)MEMORY[0x1C3BD6630]();
        if (objc_msgSend(v23, "isEqualToString:", CFSTR("lastMessagesInteractionWithSenderSecondsBeforeNow")))
        {
          context = v24;
          v25 = v307;
          v26 = v312;
          v27 = objc_opt_self();
          v28 = (void *)MEMORY[0x1C3BD6630](v27);
          v29 = (void *)MEMORY[0x1E0CB3880];
          *(_QWORD *)buf = v297;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v30 = v20;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "predicateWithFormat:argumentArray:", CFSTR("bundleId == %@"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v28);
          +[PPSocialHighlightFeaturizer _lastInteractionsByContactForHighlights:bundlePredicate:mechanismPredicate:interactionStore:]((uint64_t)v30[413], v25, v32, 0, v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!objc_msgSend(v23, "isEqualToString:", CFSTR("lastNonMessagesInteractionWithSenderSecondsBeforeNow")))goto LABEL_26;
          context = v24;
          v34 = v20;
          v289 = v307;
          v35 = v312;
          v36 = objc_opt_self();
          v37 = (void *)MEMORY[0x1C3BD6630](v36);
          v38 = (void *)MEMORY[0x1E0CB3880];
          *(_QWORD *)buf = &unk_1E7E5B5C0;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "predicateWithFormat:argumentArray:", CFSTR("mechanism in %@"), v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v37);
          v41 = (void *)MEMORY[0x1C3BD6630]();
          v42 = (void *)MEMORY[0x1E0CB3880];
          *(_QWORD *)&aBlock = v297;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &aBlock, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "predicateWithFormat:argumentArray:", CFSTR("bundleId != %@"), v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v41);
          +[PPSocialHighlightFeaturizer _lastInteractionsByContactForHighlights:bundlePredicate:mechanismPredicate:interactionStore:]((uint64_t)v34[413], v289, v44, v40, v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v45 = (void *)MEMORY[0x1E0C9AA70];
        if (v33)
          v45 = v33;
        v46 = v45;

        v47 = v46;
        objc_opt_self();
        v48 = (void *)objc_opt_new();
        aBlock = 0u;
        v365 = 0u;
        v366 = 0u;
        v367 = 0u;
        v49 = v47;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &aBlock, buf, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v365;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v365 != v52)
                objc_enumerationMutation(v49);
              v54 = *(_QWORD *)(*((_QWORD *)&aBlock + 1) + 8 * j);
              v55 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v49, "objectForKeyedSubscript:", v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "timeIntervalSinceNow");
              objc_msgSend(v55, "numberWithDouble:", -v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setObject:forKeyedSubscript:", v58, v54);

            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &aBlock, buf, 16);
          }
          while (v51);
        }

        v59 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v48, &__block_literal_global_87);
        v21 = v302;
        -[NSObject setObject:forKeyedSubscript:](v302, "setObject:forKeyedSubscript:", v59, v23);

        v20 = &off_1E7E12000;
        v24 = context;
LABEL_26:
        objc_autoreleasePoolPop(v24);
      }
      v323 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v360, &v368, 16);
      if (!v323)
      {
LABEL_28:

        objc_msgSend(v281, "addEntriesFromDictionary:", v21);
        v14 = v287;
        goto LABEL_31;
      }
    }
  }
  pp_social_highlights_log_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no interaction store provided.", buf, 2u);
  }
LABEL_31:

  if (!v280)
  {
    pp_social_highlights_log_handle();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v102, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no topic store provided.", buf, 2u);
    }
    v103 = v288;
    goto LABEL_152;
  }
  v60 = v280;
  v61 = v288;
  v62 = v14;
  v63 = objc_opt_self();
  v64 = (void *)MEMORY[0x1C3BD6630](v63);
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("meanTopicScore"), CFSTR("medianTopicScore"), CFSTR("topicCount"), CFSTR("maxTopicScore"), CFSTR("minTopicScore"), 0);
  objc_autoreleasePoolPop(v64);
  v274 = v65;
  v275 = v62;
  if (!objc_msgSend(v65, "intersectsSet:", v62))
  {
    v102 = MEMORY[0x1E0C9AA70];
    v103 = v288;
    goto LABEL_151;
  }
  v66 = v61;
  v284 = v60;
  v271 = objc_opt_self();
  v67 = (void *)objc_opt_new();
  v273 = (void *)objc_opt_new();
  v347 = 0u;
  v348 = 0u;
  v349 = 0u;
  v350 = 0u;
  v68 = v66;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v347, &v368, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v348;
    do
    {
      for (k = 0; k != v70; ++k)
      {
        if (*(_QWORD *)v348 != v71)
          objc_enumerationMutation(v68);
        v73 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * k);
        v74 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v73, "attributionIdentifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          objc_msgSend(v73, "highlightIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "attributionIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v76, v77);

        }
        objc_autoreleasePoolPop(v74);
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v347, &v368, 16);
    }
    while (v70);
  }

  v282 = v61;
  v283 = v60;
  if (objc_msgSend(v67, "count"))
  {
    v78 = (void *)objc_opt_new();
    v79 = (void *)objc_opt_new();
    v80 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v67, "allKeys");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "initWithArray:", v81);
    objc_msgSend(v79, "setMatchingDocumentIds:", v82);

    objc_msgSend(v79, "setLimit:", 50);
    v373 = 0;
    *(_QWORD *)&v351 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v351 + 1) = 3221225472;
    *(_QWORD *)&v352 = __79__PPSocialHighlightFeaturizer__topicScoresMatchingSocialHighlights_topicStore___block_invoke;
    *((_QWORD *)&v352 + 1) = &unk_1E7E19BD0;
    v83 = v78;
    *(_QWORD *)&v353 = v83;
    v303 = v273;
    *((_QWORD *)&v353 + 1) = v303;
    v84 = v67;
    *(_QWORD *)&v354 = v84;
    *((_QWORD *)&v354 + 1) = sel__topicScoresMatchingSocialHighlights_topicStore_;
    v355 = v271;
    v269 = v79;
    LOBYTE(v82) = objc_msgSend(v284, "iterTopicRecordsWithQuery:error:block:", v79, &v373, &v351);
    v270 = (__CFString *)v373;
    v14 = v287;
    v272 = v83;
    if ((v82 & 1) != 0)
    {
      if (-[NSObject count](v83, "count"))
      {
        v308 = v68;
        v298 = v67;
        v85 = v83;
        v86 = v284;
        v87 = objc_opt_self();
        v88 = (void *)MEMORY[0x1C3BD6630](v87);
        v89 = v86;
        objc_msgSend(v86, "cachedTopicScores");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v88);
        v91 = (void *)objc_opt_new();
        aBlock = 0u;
        v365 = 0u;
        v366 = 0u;
        v367 = 0u;
        v92 = v85;
        v93 = -[NSObject countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &aBlock, buf, 16);
        if (v93)
        {
          v94 = v93;
          v95 = *(_QWORD *)v365;
          while (2)
          {
            for (m = 0; m != v94; ++m)
            {
              if (*(_QWORD *)v365 != v95)
                objc_enumerationMutation(v92);
              v97 = *(_QWORD *)(*((_QWORD *)&aBlock + 1) + 8 * m);
              objc_msgSend(v90, "objectForKeyedSubscript:", v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v98)
              {
                pp_social_highlights_log_handle();
                v107 = objc_claimAutoreleasedReturnValue();
                v101 = v89;
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v360 = 0;
                  _os_log_impl(&dword_1C392E000, v107, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: missing QID overlap with the cache, will rerank.", v360, 2u);
                }

                v100 = 0;
                v68 = v308;
                goto LABEL_67;
              }
              objc_msgSend(v90, "objectForKeyedSubscript:", v97);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "setObject:forKeyedSubscript:", v99, v97);

            }
            v94 = -[NSObject countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &aBlock, buf, 16);
            if (v94)
              continue;
            break;
          }
        }

        v100 = v91;
        v68 = v308;
        v101 = v89;
LABEL_67:

        if (v100)
        {
          v61 = v282;
        }
        else
        {
          contexta = (void *)MEMORY[0x1C3BD6630]();
          pp_social_highlights_log_handle();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v108, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: topic cache is invalid, performing reranking", buf, 2u);
          }

          v100 = (id)objc_opt_new();
          v109 = objc_opt_new();
          objc_msgSend(v269, "setMatchingTopicIds:", v92);
          objc_msgSend(v269, "setLimit:", 50);
          v372 = v270;
          v324 = (void *)v109;
          objc_msgSend(v101, "rankedTopicsWithQuery:error:", v109, &v372);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v319 = v372;

          v345 = 0u;
          v346 = 0u;
          v343 = 0u;
          v344 = 0u;
          v111 = v110;
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v343, buf, 16);
          v61 = v282;
          if (v112)
          {
            v113 = v112;
            v114 = *(_QWORD *)v344;
            do
            {
              for (n = 0; n != v113; ++n)
              {
                if (*(_QWORD *)v344 != v114)
                  objc_enumerationMutation(v111);
                v116 = *(void **)(*((_QWORD *)&v343 + 1) + 8 * n);
                v117 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v116, "score");
                objc_msgSend(v117, "numberWithDouble:");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "item");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "topicIdentifier");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "setObject:forKeyedSubscript:", v118, v120);

              }
              v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v343, buf, 16);
            }
            while (v113);
          }

          objc_autoreleasePoolPop(contexta);
          v270 = v319;
          v68 = v308;
        }
        v121 = (void *)MEMORY[0x1E0C99D20];
        v122 = objc_msgSend(v84, "count");
        objc_msgSend(v121, "_pas_proxyArrayWithObject:repetitions:", MEMORY[0x1E0C9AA60], v122);
        v123 = objc_claimAutoreleasedReturnValue();
        v124 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend(v84, "allValues");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v268 = (void *)v123;
        v318 = (void *)objc_msgSend(v124, "initWithObjects:forKeys:", v123, v125);

        v341 = 0u;
        v342 = 0u;
        v339 = 0u;
        v340 = 0u;
        v106 = v100;
        v103 = v288;
        v60 = v283;
        v67 = v298;
        v126 = v303;
        v313 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v339, &aBlock, 16);
        if (v313)
        {
          v127 = *(_QWORD *)v340;
          v290 = *(_QWORD *)v340;
          obja = v106;
          do
          {
            v128 = 0;
            do
            {
              if (*(_QWORD *)v340 != v127)
                objc_enumerationMutation(v106);
              v325 = v128;
              v129 = *(_QWORD *)(*((_QWORD *)&v339 + 1) + 8 * v128);
              objc_msgSend(v126, "objectForKeyedSubscript:", v129);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v106, "objectForKeyedSubscript:", v129);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              contextb = v130;
              if (v131)
              {
                if (v130)
                  goto LABEL_89;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "handleFailureInMethod:object:file:lineNumber:description:", sel__topicScoresMatchingSocialHighlights_topicStore_, v271, CFSTR("PPSocialHighlightFeaturizer.m"), 525, CFSTR("Iterating through keys should always result in a value"));

                v130 = contextb;
                if (contextb)
                {
LABEL_89:
                  v337 = 0u;
                  v338 = 0u;
                  v335 = 0u;
                  v336 = 0u;
                  v132 = v130;
                  v133 = -[NSObject countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v335, v360, 16);
                  if (v133)
                  {
                    v134 = v133;
                    v135 = *(_QWORD *)v336;
                    do
                    {
                      for (ii = 0; ii != v134; ++ii)
                      {
                        if (*(_QWORD *)v336 != v135)
                          objc_enumerationMutation(v132);
                        v137 = *(_QWORD *)(*((_QWORD *)&v335 + 1) + 8 * ii);
                        v138 = (void *)MEMORY[0x1C3BD6630]();
                        objc_msgSend(v318, "objectForKeyedSubscript:", v137);
                        v139 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v139, "arrayByAddingObject:", v131);
                        v140 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v318, "setObject:forKeyedSubscript:", v140, v137);

                        objc_autoreleasePoolPop(v138);
                      }
                      v134 = -[NSObject countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v335, v360, 16);
                    }
                    while (v134);
                    v103 = v288;
                    v127 = v290;
                    v61 = v282;
                    v60 = v283;
                    v67 = v298;
                    v126 = v303;
                    v106 = obja;
                  }
                  goto LABEL_100;
                }
              }
              pp_private_log_handle();
              v132 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v356 = 138412290;
                *(_QWORD *)&v356[4] = v129;
                _os_log_debug_impl(&dword_1C392E000, v132, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: no highlights found for QID: %@", v356, 0xCu);
              }
LABEL_100:

              v128 = v325 + 1;
              v68 = v308;
            }
            while ((id)(v325 + 1) != v313);
            v313 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v339, &aBlock, 16);
          }
          while (v313);
        }

        v105 = &off_1E7E12000;
        v14 = v287;
      }
      else
      {
        pp_social_highlights_log_handle();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v106, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightRanker: found no QIDs from any highlight.", buf, 2u);
        }
        v318 = (void *)MEMORY[0x1E0C9AA70];
        v105 = &off_1E7E12000;
        v103 = v288;
      }
    }
    else
    {
      pp_social_highlights_log_handle();
      v106 = objc_claimAutoreleasedReturnValue();
      v105 = &off_1E7E12000;
      v103 = v288;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v270;
        _os_log_error_impl(&dword_1C392E000, v106, OS_LOG_TYPE_ERROR, "PPSocialHighlightRanker: error querying topic store: %@", buf, 0xCu);
      }
      v318 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    pp_social_highlights_log_handle();
    v104 = objc_claimAutoreleasedReturnValue();
    v14 = v287;
    v272 = v104;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v104, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: not performing topic scoring features due to no highlights", buf, 2u);
    }
    v318 = (void *)MEMORY[0x1E0C9AA70];
    v105 = &off_1E7E12000;
    v103 = v288;
  }

  v102 = objc_opt_new();
  *(_OWORD *)v360 = 0u;
  v361 = 0u;
  v362 = 0u;
  v363 = 0u;
  v285 = v275;
  objb = (id)objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", v360, buf, 16);
  if (!objb)
    goto LABEL_150;
  v291 = *(_QWORD *)v361;
  v286 = v102;
  do
  {
    for (jj = 0; jj != objb; jj = (char *)jj + 1)
    {
      if (*(_QWORD *)v361 != v291)
        objc_enumerationMutation(v285);
      v143 = *(void **)(*(_QWORD *)&v360[8] + 8 * (_QWORD)jj);
      v144 = (void *)MEMORY[0x1C3BD6630]();
      v304 = v144;
      v309 = jj;
      v299 = v143;
      if (objc_msgSend(v143, "isEqualToString:", CFSTR("topicCount")))
      {
        v145 = (void *)objc_opt_new();
        v351 = 0u;
        v352 = 0u;
        v353 = 0u;
        v354 = 0u;
        v146 = v318;
        v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v351, &v368, 16);
        if (v147)
        {
          v148 = v147;
          v149 = *(_QWORD *)v352;
          do
          {
            for (kk = 0; kk != v148; ++kk)
            {
              if (*(_QWORD *)v352 != v149)
                objc_enumerationMutation(v146);
              v151 = *(_QWORD *)(*((_QWORD *)&v351 + 1) + 8 * kk);
              v152 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v146, "objectForKeyedSubscript:", v151);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v152, "numberWithUnsignedInteger:", objc_msgSend(v153, "count"));
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "setObject:forKeyedSubscript:", v154, v151);

            }
            v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v351, &v368, 16);
          }
          while (v148);
        }

        v14 = v287;
        v103 = v288;
        v102 = v286;
      }
      else
      {
        if (objc_msgSend(v143, "isEqualToString:", CFSTR("meanTopicScore")))
        {
          v155 = (uint64_t)v105[413];
          v156 = v318;
          v157 = CFSTR("@avg.self");
        }
        else
        {
          if (objc_msgSend(v143, "isEqualToString:", CFSTR("medianTopicScore")))
          {
            v145 = (void *)objc_opt_new();
            v347 = 0u;
            v348 = 0u;
            v349 = 0u;
            v350 = 0u;
            v158 = v318;
            contextc = (void *)objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v347, &aBlock, 16);
            if (contextc)
            {
              v326 = *(_QWORD *)v348;
              do
              {
                for (mm = 0; mm != contextc; mm = (char *)mm + 1)
                {
                  if (*(_QWORD *)v348 != v326)
                    objc_enumerationMutation(v158);
                  v160 = *(_QWORD *)(*((_QWORD *)&v347 + 1) + 8 * (_QWORD)mm);
                  objc_msgSend(v158, "objectForKeyedSubscript:", v160);
                  v161 = (id)objc_claimAutoreleasedReturnValue();
                  v162 = objc_opt_self();
                  v163 = (void *)MEMORY[0x1C3BD6630](v162);
                  if (objc_msgSend(v161, "count"))
                  {
                    if (objc_msgSend(v161, "count") == 1)
                    {
                      objc_msgSend(v161, "objectAtIndexedSubscript:", 0);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else if (objc_msgSend(v161, "count") == 2)
                    {
                      v165 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v161, "objectAtIndexedSubscript:", 0);
                      v166 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v166, "doubleValue");
                      v168 = v167;
                      objc_msgSend(v161, "objectAtIndexedSubscript:", 1);
                      v169 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v169, "doubleValue");
                      objc_msgSend(v165, "numberWithDouble:", (v168 + v170) * 0.5);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      objc_msgSend(v161, "sortedArrayUsingComparator:", &__block_literal_global_97);
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      v172 = (unint64_t)objc_msgSend(v171, "count") >> 1;
                      if ((objc_msgSend(v171, "count") & 1) != 0)
                      {
                        objc_msgSend(v171, "objectAtIndexedSubscript:", v172);
                        v164 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v314 = (id)MEMORY[0x1E0CB37E8];
                        objc_msgSend(v171, "objectAtIndexedSubscript:", v172);
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v173, "doubleValue");
                        v175 = v174;
                        objc_msgSend(v171, "objectAtIndexedSubscript:", v172 - 1);
                        v176 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v176, "doubleValue");
                        objc_msgSend(v314, "numberWithDouble:", (v175 + v177) * 0.5);
                        v164 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                    }
                  }
                  else
                  {
                    v164 = 0;
                  }
                  objc_autoreleasePoolPop(v163);

                  if (v164)
                    v178 = v164;
                  else
                    v178 = &unk_1E7E597C8;
                  objc_msgSend(v145, "setObject:forKeyedSubscript:", v178, v160);

                }
                contextc = (void *)objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v347, &aBlock, 16);
              }
              while (contextc);
            }

            v14 = v287;
            v103 = v288;
            v61 = v282;
            v60 = v283;
            v102 = v286;
            goto LABEL_147;
          }
          if (objc_msgSend(v143, "isEqualToString:", CFSTR("maxTopicScore")))
          {
            v155 = (uint64_t)v105[413];
            v156 = v318;
            v157 = CFSTR("@max.self");
          }
          else
          {
            if (!objc_msgSend(v143, "isEqualToString:", CFSTR("minTopicScore")))
              goto LABEL_148;
            v155 = (uint64_t)v105[413];
            v156 = v318;
            v157 = CFSTR("@min.self");
          }
        }
        +[PPSocialHighlightFeaturizer _flattenArraysInDictionary:keyPath:](v155, v156, v157);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_147:
      v179 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v145, &__block_literal_global_11786);
      -[NSObject setObject:forKeyedSubscript:](v102, "setObject:forKeyedSubscript:", v179, v299);

      v105 = &off_1E7E12000;
      v144 = v304;
      jj = v309;
LABEL_148:
      objc_autoreleasePoolPop(v144);
    }
    objb = (id)objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", v360, buf, 16);
  }
  while (objb);
LABEL_150:

LABEL_151:
  objc_msgSend(v281, "addEntriesFromDictionary:", v102);
LABEL_152:

  v305 = v103;
  contextd = v276;
  v180 = v14;
  objc_opt_self();
  v320 = (void *)objc_opt_new();
  v368 = 0u;
  v369 = 0u;
  v370 = 0u;
  v371 = 0u;
  v315 = v180;
  v181 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v368, buf, 16);
  if (!v181)
    goto LABEL_188;
  v182 = v181;
  v183 = MEMORY[0x1E0C809B0];
  v327 = *(_QWORD *)v369;
  while (2)
  {
    v184 = 0;
    while (2)
    {
      if (*(_QWORD *)v369 != v327)
        objc_enumerationMutation(v315);
      v185 = *(void **)(*((_QWORD *)&v368 + 1) + 8 * v184);
      v186 = (void *)MEMORY[0x1C3BD6630]();
      v187 = v185;
      v188 = contextd;
      objc_opt_self();
      *(_QWORD *)&aBlock = v183;
      *((_QWORD *)&aBlock + 1) = 3221225472;
      *(_QWORD *)&v365 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke;
      *((_QWORD *)&v365 + 1) = &unk_1E7E19E10;
      v189 = v187;
      *(_QWORD *)&v366 = v189;
      v190 = _Block_copy(&aBlock);
      *(_QWORD *)v360 = v183;
      *(_QWORD *)&v360[8] = 3221225472;
      *(_QWORD *)&v361 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_2;
      *((_QWORD *)&v361 + 1) = &unk_1E7E19E10;
      v191 = v189;
      *(_QWORD *)&v362 = v191;
      v192 = _Block_copy(v360);
      if (objc_msgSend(v191, "isEqualToString:", CFSTR("creationDateSecondsBeforeNow")))
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_187;
        goto LABEL_167;
      }
      if (objc_msgSend(v191, "isEqualToString:", CFSTR("highlightDateSecondsBeforeNow")))
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_189;
        goto LABEL_167;
      }
      if (objc_msgSend(v191, "isEqualToString:", CFSTR("isManuallySyndicated")))
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = &__block_literal_global_190;
        goto LABEL_167;
      }
      if (objc_msgSend(v191, "hasPrefix:", CFSTR("creationDateInInterval")))
      {
        v193 = [PPSocialHighlightPropertyValueProvider alloc];
        v194 = v190;
        goto LABEL_167;
      }
      if (!objc_msgSend(v191, "hasPrefix:", CFSTR("highlightDateInInterval")))
      {
        *(_QWORD *)&v351 = v183;
        *((_QWORD *)&v351 + 1) = 3221225472;
        *(_QWORD *)&v352 = __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_195;
        *((_QWORD *)&v352 + 1) = &unk_1E7E19E10;
        *(_QWORD *)&v353 = v188;
        v196 = _Block_copy(&v351);
        v310 = v196;
        if (objc_msgSend(v191, "isEqualToString:", CFSTR("messagesThreadHasDisplayName")))
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_192;
        }
        else if (objc_msgSend(v191, "isEqualToString:", CFSTR("messagesThreadHasGroupPhoto")))
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_193;
        }
        else if (objc_msgSend(v191, "isEqualToString:", CFSTR("messagesConversationAutoDonating")))
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_194;
        }
        else if (objc_msgSend(v191, "isEqualToString:", CFSTR("isContactSignificant")))
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = v196;
        }
        else if (objc_msgSend(v191, "isEqualToString:", CFSTR("sentFromMe")))
        {
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_196;
        }
        else
        {
          if (!objc_msgSend(v191, "isEqualToString:", CFSTR("isCollaboration")))
          {
            v195 = 0;
            goto LABEL_185;
          }
          v197 = [PPSocialHighlightPropertyValueProvider alloc];
          v198 = &__block_literal_global_197;
        }
        v195 = -[PPSocialHighlightPropertyValueProvider initWithProvidingBlock:](v197, v198);
LABEL_185:

        goto LABEL_168;
      }
      v193 = [PPSocialHighlightPropertyValueProvider alloc];
      v194 = v192;
LABEL_167:
      v195 = -[PPSocialHighlightPropertyValueProvider initWithProvidingBlock:](v193, v194);
LABEL_168:

      if (v195)
        objc_msgSend(v320, "setObject:forKeyedSubscript:", v195, v191);

      objc_autoreleasePoolPop(v186);
      if (v182 != ++v184)
        continue;
      break;
    }
    v199 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v368, buf, 16);
    v182 = v199;
    if (v199)
      continue;
    break;
  }
LABEL_188:

  objc_msgSend(v281, "addEntriesFromDictionary:", v320);
  v200 = v305;
  v201 = v315;
  objc_opt_self();
  v316 = (id)objc_opt_new();
  v347 = 0u;
  v348 = 0u;
  v349 = 0u;
  v350 = 0u;
  objc = v201;
  v311 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v347, buf, 16);
  if (v311)
  {
    v306 = *(_QWORD *)v348;
    v292 = v200;
    do
    {
      for (nn = 0; nn != v311; ++nn)
      {
        if (*(_QWORD *)v348 != v306)
          objc_enumerationMutation(objc);
        v203 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * nn);
        v204 = (void *)MEMORY[0x1C3BD6630]();
        if (objc_msgSend(v203, "isEqualToString:", CFSTR("countDistinctHighlights")))
        {
          v205 = objc_alloc(MEMORY[0x1E0C99E60]);
          objc_msgSend(v200, "_pas_mappedArrayWithTransform:", &__block_literal_global_125_11780);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          v207 = (void *)objc_msgSend(v205, "initWithArray:", v206);

          v208 = [PPSocialHighlightStaticFeatureProvider alloc];
          v372 = &stru_1E7E221D0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v207, "count"));
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v373 = v209;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v373, &v372, 1);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:](v208, v210, &__block_literal_global_83);
          objc_msgSend(v316, "setObject:forKeyedSubscript:", v211, v203);

        }
        if (objc_msgSend(v203, "isEqualToString:", CFSTR("countThreadsWithHighlightIdentifier")))
        {
          v321 = nn;
          v328 = v204;
          v212 = (void *)objc_opt_new();
          v343 = 0u;
          v344 = 0u;
          v345 = 0u;
          v346 = 0u;
          v213 = v200;
          v214 = v200;
          v215 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v343, &v368, 16);
          if (v215)
          {
            v216 = v215;
            v217 = *(_QWORD *)v344;
            do
            {
              for (i1 = 0; i1 != v216; ++i1)
              {
                if (*(_QWORD *)v344 != v217)
                  objc_enumerationMutation(v214);
                v219 = *(void **)(*((_QWORD *)&v343 + 1) + 8 * i1);
                objc_msgSend(v219, "highlightIdentifier");
                v220 = (void *)objc_claimAutoreleasedReturnValue();

                if (v220)
                {
                  objc_msgSend(v219, "highlightIdentifier");
                  v221 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v212, "objectForKeyedSubscript:", v221);
                  v222 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v222)
                  {
                    v223 = (void *)objc_opt_new();
                    objc_msgSend(v219, "highlightIdentifier");
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v212, "setObject:forKeyedSubscript:", v223, v224);

                  }
                  objc_msgSend(v219, "domainIdentifier");
                  v225 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v225)
                  {
                    objc_msgSend(v219, "highlightIdentifier");
                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v212, "objectForKeyedSubscript:", v226);
                    v227 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v219, "domainIdentifier");
                    v228 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v227, "addObject:", v228);

                  }
                }
              }
              v216 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v343, &v368, 16);
            }
            while (v216);
          }

          v229 = (void *)objc_opt_new();
          v339 = 0u;
          v340 = 0u;
          v341 = 0u;
          v342 = 0u;
          v230 = v212;
          v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v339, &aBlock, 16);
          if (v231)
          {
            v232 = v231;
            v233 = *(_QWORD *)v340;
            do
            {
              for (i2 = 0; i2 != v232; ++i2)
              {
                if (*(_QWORD *)v340 != v233)
                  objc_enumerationMutation(v230);
                v235 = *(_QWORD *)(*((_QWORD *)&v339 + 1) + 8 * i2);
                v236 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v230, "objectForKeyedSubscript:", v235);
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v236, "numberWithUnsignedInteger:", objc_msgSend(v237, "count"));
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "setObject:forKeyedSubscript:", v238, v235);

              }
              v232 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v339, &aBlock, 16);
            }
            while (v232);
          }

          v239 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v229, &__block_literal_global_11786);
          objc_msgSend(v316, "setObject:forKeyedSubscript:", v239, v203);

          nn = v321;
          v200 = v213;
        }
        else if (objc_msgSend(v203, "isEqualToString:", CFSTR("countManualHighlightsFromSender")))
        {
          v300 = v203;
          v322 = nn;
          v328 = v204;
          v230 = (id)objc_opt_new();
          v335 = 0u;
          v336 = 0u;
          v337 = 0u;
          v338 = 0u;
          contexte = v200;
          v240 = objc_msgSend(contexte, "countByEnumeratingWithState:objects:count:", &v335, v360, 16);
          if (v240)
          {
            v241 = v240;
            v242 = *(_QWORD *)v336;
            do
            {
              for (i3 = 0; i3 != v241; ++i3)
              {
                if (*(_QWORD *)v336 != v242)
                  objc_enumerationMutation(contexte);
                v244 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * i3);
                if (objc_msgSend(v244, "highlightType") == 2)
                {
                  objc_msgSend(v244, "sender");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v245, "handle");
                  v246 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v246)
                  {
                    v247 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v244, "sender");
                    v248 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v248, "handle");
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v230, "objectForKeyedSubscript:", v249);
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v247, "numberWithInteger:", objc_msgSend(v250, "integerValue") + 1);
                    v251 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v244, "sender");
                    v252 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v252, "handle");
                    v253 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v230, "setObject:forKeyedSubscript:", v251, v253);

                  }
                }
              }
              v241 = objc_msgSend(contexte, "countByEnumeratingWithState:objects:count:", &v335, v360, 16);
            }
            while (v241);
          }

          v229 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v230, &__block_literal_global_87);
          objc_msgSend(v316, "setObject:forKeyedSubscript:", v229, v300);
          v200 = v292;
          nn = v322;
        }
        else
        {
          if (!objc_msgSend(v203, "isEqualToString:", CFSTR("countManualHighlightsFromThread")))
            goto LABEL_241;
          v301 = v203;
          v328 = v204;
          v230 = (id)objc_opt_new();
          *(_OWORD *)v356 = 0u;
          v357 = 0u;
          v358 = 0u;
          v359 = 0u;
          v254 = v200;
          v255 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", v356, &v351, 16);
          if (v255)
          {
            v256 = v255;
            v257 = *(_QWORD *)v357;
            do
            {
              for (i4 = 0; i4 != v256; ++i4)
              {
                if (*(_QWORD *)v357 != v257)
                  objc_enumerationMutation(v254);
                v259 = *(void **)(*(_QWORD *)&v356[8] + 8 * i4);
                if (objc_msgSend(v259, "highlightType") == 2)
                {
                  objc_msgSend(v259, "domainIdentifier");
                  v260 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v260)
                  {
                    v261 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v259, "domainIdentifier");
                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v230, "objectForKeyedSubscript:", v262);
                    v263 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v261, "numberWithInteger:", objc_msgSend(v263, "integerValue") + 1);
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v259, "domainIdentifier");
                    v265 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v230, "setObject:forKeyedSubscript:", v264, v265);

                  }
                }
              }
              v256 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", v356, &v351, 16);
            }
            while (v256);
          }

          v229 = -[PPSocialHighlightStaticFeatureProvider initWithComputedFeatures:highlightKeyBlock:]([PPSocialHighlightStaticFeatureProvider alloc], v230, &__block_literal_global_86_11787);
          objc_msgSend(v316, "setObject:forKeyedSubscript:", v229, v301);
          v200 = v292;
        }

        v204 = v328;
LABEL_241:
        objc_autoreleasePoolPop(v204);
      }
      v311 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v347, buf, 16);
    }
    while (v311);
  }

  objc_msgSend(v281, "addEntriesFromDictionary:", v316);
  v266 = -[PPSocialHighlightFeaturizer initWithFeatureValues:](self, "initWithFeatureValues:", v281);

  return v266;
}

+ (id)_flattenArraysInDictionary:(void *)a3 keyPath:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKeyPath:", v5);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = &unk_1E7E597C8;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)_lastInteractionsByContactForHighlights:(void *)a3 bundlePredicate:(void *)a4 mechanismPredicate:(void *)a5 interactionStore:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  id obj;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[4];
  NSObject *v91;
  __int128 buf;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v71 = a3;
  v70 = a4;
  v69 = a5;
  objc_opt_self();
  v9 = v8;
  objc_opt_self();
  v10 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v87 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E0D15890];
        objc_msgSend(v15, "sender");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "normalizedStringFromContactString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v10, "addObject:", v19);
        }
        else
        {
          pp_social_highlights_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "highlightIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v21;
            _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: no contact for highlight %@, will be unresponsive to recency.", (uint8_t *)&buf, 0xCu);

          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
    }
    while (v12);
  }

  objc_msgSend(v10, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    v23 = (void *)MEMORY[0x1C3BD6630]();
    v24 = (void *)MEMORY[0x1E0CB3880];
    v85 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v25 = v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:argumentArray:", CFSTR("sender.identifier in %@"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0CB3880];
    v67 = v25;
    v84 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:argumentArray:", CFSTR("ANY recipients.identifier in %@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc(MEMORY[0x1E0CB3528]);
    v83[0] = v27;
    v83[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithType:subpredicates:", 2, v32);

    v82[0] = v71;
    v82[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    if (v70)
      objc_msgSend(v35, "addObject:");
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v35);

    objc_autoreleasePoolPop(v23);
    v37 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0;
    v66 = (void *)v36;
    objc_msgSend(v69, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v36, v39, 50, &v76);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v76;
    pp_social_highlights_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 138412290;
      v91 = v40;
      _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: found results %@", v90, 0xCu);
    }

    v68 = v40;
    if (v40)
    {
      if (!objc_msgSend(obj, "count") || -[NSObject count](v40, "count"))
      {

        objc_autoreleasePoolPop(v37);
        v43 = v40;
        objc_opt_self();
        v44 = (void *)objc_opt_new();
        buf = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v72 = v43;
        v74 = -[NSObject countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &buf, v90, 16);
        if (v74)
        {
          v73 = *(_QWORD *)v93;
          do
          {
            for (j = 0; j != v74; ++j)
            {
              if (*(_QWORD *)v93 != v73)
                objc_enumerationMutation(v72);
              v46 = *(void **)(*((_QWORD *)&buf + 1) + 8 * j);
              objc_msgSend(v46, "startDate");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                objc_msgSend(v46, "sender");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "identifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v46, "recipients");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "_pas_mappedArrayWithTransform:", &__block_literal_global_140);
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (v49)
                {
                  objc_msgSend(v44, "objectForKeyedSubscript:", v49);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v52)
                  {
                    objc_msgSend(v46, "startDate");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "setObject:forKeyedSubscript:", v53, v49);

                  }
                }
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v54 = v51;
                v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, &v86, 16);
                if (v55)
                {
                  v56 = v55;
                  v57 = *(_QWORD *)v78;
                  do
                  {
                    for (k = 0; k != v56; ++k)
                    {
                      if (*(_QWORD *)v78 != v57)
                        objc_enumerationMutation(v54);
                      v59 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
                      objc_msgSend(v44, "objectForKeyedSubscript:", v59);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v60)
                      {
                        objc_msgSend(v46, "startDate");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v44, "setObject:forKeyedSubscript:", v61, v59);

                      }
                    }
                    v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, &v86, 16);
                  }
                  while (v56);
                }

              }
            }
            v74 = -[NSObject countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &buf, v90, 16);
          }
          while (v74);
        }

        v62 = v70;
        goto LABEL_52;
      }
      pp_social_highlights_log_handle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v90 = 0;
        _os_log_error_impl(&dword_1C392E000, v64, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: interaction store returned no interactions, but highlights should be included in interactions.", v90, 2u);
      }
      v62 = v70;
    }
    else
    {
      pp_social_highlights_log_handle();
      v64 = objc_claimAutoreleasedReturnValue();
      v62 = v70;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138412290;
        v91 = v41;
        _os_log_error_impl(&dword_1C392E000, v64, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: interaction store query failed %@", v90, 0xCu);
      }
    }

    objc_autoreleasePoolPop(v37);
    v44 = 0;
LABEL_52:

    v22 = v67;
    goto LABEL_53;
  }
  pp_social_highlights_log_handle();
  v63 = objc_claimAutoreleasedReturnValue();
  v68 = v63;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v90 = 0;
    _os_log_impl(&dword_1C392E000, v63, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: no handles found.", v90, 2u);
  }
  v44 = 0;
  v62 = v70;
LABEL_53:

  return v44;
}

- (PPSocialHighlightFeaturizer)initWithFeatureValues:(id)a3
{
  id v5;
  PPSocialHighlightFeaturizer *v6;
  PPSocialHighlightFeaturizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSocialHighlightFeaturizer;
  v6 = -[PPSocialHighlightFeaturizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureValues, a3);

  return v7;
}

+ (id)_feedbackFeaturesForPublisher:(void *)a3 highlights:(void *)a4 features:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  PPSocialHighlightEngagementProvider *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PPSocialHighlightTimeSinceEngagementProvider *v19;
  PPSocialHighlightTimeSinceEngagementProvider *v20;
  void *v21;
  PPSocialHighlightEngagementProvider *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PPSocialHighlightFractionalEngagementProvider *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  id obj;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[4];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v6 = a3;
  v7 = a4;
  v41 = objc_opt_self();
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__11844;
  v56 = __Block_byref_object_dispose__11845;
  v57 = 0;
  v57 = (id)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v49;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1C3BD6630]();
        v13 = v11;
        v14 = v6;
        objc_opt_self();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countHiddenFromThread")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 2;
          goto LABEL_14;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedFromThread")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 1;
          goto LABEL_14;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countOfferedFromThread")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 0;
          goto LABEL_14;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedAppFromThread")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 3;
LABEL_14:
          v17 = &__block_literal_global_179;
          v18 = &__block_literal_global_86_11787;
LABEL_15:
          v19 = -[PPSocialHighlightEngagementProvider initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:highlights:](v15, "initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:highlights:", v16, v17, v18, v14);
LABEL_16:
          v20 = v19;
          goto LABEL_17;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countHiddenFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 2;
LABEL_31:
          v17 = &__block_literal_global_180;
          v18 = &__block_literal_global_87;
          goto LABEL_15;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 1;
          goto LABEL_31;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countOfferedFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 0;
          goto LABEL_31;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedAppFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 3;
          goto LABEL_31;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countHiddenMatchingDomain")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 2;
LABEL_38:
          v17 = &__block_literal_global_181;
          v18 = &__block_literal_global_88;
          goto LABEL_15;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedMatchingDomain")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 1;
          goto LABEL_38;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countOfferedMatchingDomain")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 0;
          goto LABEL_38;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countHiddenMatchingDomainFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 2;
LABEL_45:
          v17 = &__block_literal_global_182;
          v18 = &__block_literal_global_89;
          goto LABEL_15;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countEngagedMatchingDomainFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 1;
          goto LABEL_45;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("countOfferedMatchingDomainFromSender")))
        {
          v15 = [PPSocialHighlightEngagementProvider alloc];
          v16 = 0;
          goto LABEL_45;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countHiddenInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 2;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countEngagedInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 1;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countOfferedInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 0;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countStartedConsumptionInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 5;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countFinishedConsumptionInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 6;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countItemDetailViewedInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 7;
          goto LABEL_60;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countParentViewedInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 8;
LABEL_60:
          v25 = &__block_literal_global_177_11857;
          v26 = &__block_literal_global_11786;
LABEL_61:
          v19 = -[PPSocialHighlightEngagementProvider initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:](v22, "initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:", v24, v25, v26, v14, v23);
          goto LABEL_16;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countAppButtonInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 3;
LABEL_66:
          v25 = &__block_literal_global_178;
          v26 = &__block_literal_global_82;
          goto LABEL_61;
        }
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("countActivityButtonInInterval")))
        {
          v22 = [PPSocialHighlightEngagementProvider alloc];
          v23 = +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v13);
          v24 = 4;
          goto LABEL_66;
        }
        v27 = objc_msgSend(v13, "isEqualToString:", CFSTR("mostRecentEngagementSecondsBeforeNow"));
        if ((v27 & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("earliestEngagementSecondsBeforeNow")))
        {
          v19 = -[PPSocialHighlightTimeSinceEngagementProvider initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:mostRecent:highlights:]([PPSocialHighlightTimeSinceEngagementProvider alloc], "initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:mostRecent:highlights:", 1, &__block_literal_global_177_11857, &__block_literal_global_11786, v27, v14);
          goto LABEL_16;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("fractionEngagedToOfferedFromSender")))
        {
          v28 = [PPSocialHighlightFractionalEngagementProvider alloc];
          v29 = &__block_literal_global_180;
          v30 = &__block_literal_global_87;
LABEL_74:
          v19 = -[PPSocialHighlightFractionalEngagementProvider initWithFeedbackGroupByBlock:highlightKeyBlock:highlights:](v28, "initWithFeedbackGroupByBlock:highlightKeyBlock:highlights:", v29, v30, v14);
          goto LABEL_16;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("fractionEngagedToOfferedFromThread")))
        {
          v28 = [PPSocialHighlightFractionalEngagementProvider alloc];
          v29 = &__block_literal_global_179;
          v30 = &__block_literal_global_86_11787;
          goto LABEL_74;
        }
        v20 = 0;
LABEL_17:

        if (v20)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__feedbackFeaturesForPublisher_highlights_features_, v41, CFSTR("PPSocialHighlightFeaturizer.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[featureProvider respondsToSelector:@selector(applyFeedback:)]"));

          }
          objc_msgSend((id)v53[5], "setObject:forKeyedSubscript:", v20, v13);
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      v8 = v31;
    }
    while (v31);
  }

  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v32 = objc_alloc(MEMORY[0x1E0D02438]);
  v33 = MEMORY[0x1E0C809B0];
  v34 = v53[5];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke;
  v46[3] = &unk_1E7E19AD8;
  v46[4] = v47;
  v35 = (void *)objc_msgSend(v32, "initWithAccumulator:closure:", v34, v46);
  v36 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v42, "reduce:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = 3221225472;
  v45[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_2;
  v45[3] = &unk_1E7E1E478;
  v45[4] = v47;
  v44[0] = v33;
  v44[1] = 3221225472;
  v44[2] = __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_123;
  v44[3] = &unk_1E7E19B00;
  v44[4] = &v52;
  v45[0] = v33;
  v38 = (id)objc_msgSend(v37, "sinkWithCompletion:receiveInput:", v45, v44);

  objc_autoreleasePoolPop(v36);
  v39 = (id)v53[5];

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v52, 8);

  return v39;
}

+ (double)_intervalForBucketedString:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5 * 3600.0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
}

+ (id)trialSpecifiedFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plistForFactorName:namespaceName:", CFSTR("social_highlight_ranker.plist"), CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("*"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  }
  else
  {
    pp_social_highlights_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: unable to load ranker from Trial.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)featurizeHighlights:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PPSocialHighlightFeaturizer_featurizeHighlights___block_invoke;
  v4[3] = &unk_1E7E19B68;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  pp_social_highlights_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightFeaturizer: failed to process feedback: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "PPSocialHighlightFeaturizer: successfully processed entire feedback stream.", (uint8_t *)&v10, 2u);
  }

  pp_social_highlights_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: completed processing with %tu items passed to aggregator.", (uint8_t *)&v10, 0xCu);
  }

}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

id __51__PPSocialHighlightFeaturizer_featurizeHighlights___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "highlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "valueForHighlight:", v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "setName:", v10);
          objc_msgSend(v12, "doubleValue");
          objc_msgSend(v13, "setValue:");
          -[NSObject addObject:](v5, "addObject:", v13);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setCalculatedFeatures:", v5);
    v14 = v3;
  }
  else
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightFeaturizer: encountered highlight without an identifier.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

uint64_t __78__PPSocialHighlightFeaturizer__globalHighlightFeaturesForHighlights_features___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highlightIdentifier");
}

void __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v2);
  domainAndSenderKey_block_invoke_14(v4, v3);

}

void __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  +[PPSocialHighlightFeaturizer _intervalForBucketedString:]((uint64_t)PPSocialHighlightFeaturizer, v2);
  domainAndSenderKey_block_invoke_15(v4, v3);

}

double __93__PPSocialHighlightFeaturizer__highlightFeatureProviderForFeature_significantContactHandles___block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v3 = a2;
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v8))
      v9 = 1.0;
    else
      v9 = 0.0;

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

uint64_t __46__PPSocialHighlightFeaturizer__medianOfArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __79__PPSocialHighlightFeaturizer__topicScoresMatchingSocialHighlights_topicStore___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = (void *)a1[4];
  objc_msgSend(v24, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topicIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = (void *)a1[5];
  objc_msgSend(v24, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topicIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)a1[5];
    objc_msgSend(v24, "topic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topicIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

  }
  v15 = (void *)a1[6];
  objc_msgSend(v24, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "documentId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[8], CFSTR("PPSocialHighlightFeaturizer.m"), 495, CFSTR("Querying for a documents matching the keys of a dictionary should always return topics complying with those keys."));

  }
  v19 = (void *)a1[5];
  objc_msgSend(v24, "topic");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topicIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v18);

  objc_autoreleasePoolPop(v3);
}

uint64_t __80__PPSocialHighlightFeaturizer__latestInteractionDatesForDescendingInteractions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applyFeedback:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v12);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return v6;
}

void __81__PPSocialHighlightFeaturizer__feedbackFeaturesForPublisher_highlights_features___block_invoke_123(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
