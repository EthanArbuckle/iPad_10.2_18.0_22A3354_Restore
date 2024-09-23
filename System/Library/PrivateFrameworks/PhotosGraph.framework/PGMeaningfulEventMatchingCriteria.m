@implementation PGMeaningfulEventMatchingCriteria

- (PGMeaningfulEventMatchingCriteria)initWithMoment:(id)a3 cache:(id)a4 serviceManager:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PGMeaningfulEventMatchingCriteria *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  PGMeaningfulEventNumberTrait *v32;
  PGMeaningfulEventCollectionTrait *v33;
  void *v34;
  PGMeaningfulEventCollectionTrait *v35;
  PGMeaningfulEventCollectionTrait *v36;
  void *v37;
  PGMeaningfulEventCollectionTrait *v38;
  PGMeaningfulEventCollectionTrait *v39;
  void *v40;
  PGMeaningfulEventCollectionTrait *v41;
  PGMeaningfulEventLocationCollectionTrait *v42;
  void *v43;
  PGMeaningfulEventLocationCollectionTrait *v44;
  PGMeaningfulEventCollectionTrait *v45;
  void *v46;
  PGMeaningfulEventCollectionTrait *v47;
  PGMeaningfulEventCollectionTrait *v48;
  void *v49;
  PGMeaningfulEventCollectionTrait *v50;
  PGMeaningfulEventSceneCollectionTrait *v51;
  void *v52;
  PGMeaningfulEventSceneCollectionTrait *v53;
  PGMeaningfulEventNumberTrait *v54;
  PGMeaningfulEventNumberTrait *v55;
  PGMeaningfulEventPartOfDayTrait *v56;
  PGMeaningfulEventPartOfDayTrait *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  PGMeaningfulEventLocationMobilityTrait *v62;
  PGMeaningfulEventCollectionTrait *v63;
  void *v64;
  PGMeaningfulEventCollectionTrait *v65;
  char v66;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  PGMeaningfulEventMatchingCriteria *v74;
  void *v75;
  id obj;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v79 = a5;
  objc_msgSend(v9, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91.receiver = self;
  v91.super_class = (Class)PGMeaningfulEventMatchingCriteria;
  v12 = -[PGMeaningfulEventCriteria initWithGraph:](&v91, sel_initWithGraph_, v11);

  if (v12)
  {
    v69 = a3;
    v74 = v12;
    objc_storeStrong((id *)&v12->_cache, a4);
    objc_msgSend(v9, "collection");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "universalStartDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v9;
    objc_msgSend(v9, "universalEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v15);
    v16 = v14;
    v17 = v15;
    v70 = v10;
    v73 = (void *)v13;
    objc_msgSend(v10, "preciseAddressNodesForMomentNodes:", v13);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "locations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v71 = v17;
    v72 = v16;
    v18 = v16;
    v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    if (v80)
    {
      v77 = *(_QWORD *)v88;
      v18 = v16;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v88 != v77)
            objc_enumerationMutation(obj);
          v81 = v19;
          objc_msgSend(v79, "fetchLocationOfInterestVisitsAtLocation:inDateInterval:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v19), v78);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v82 = v20;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v84;
            do
            {
              v24 = 0;
              v25 = v17;
              v26 = v18;
              do
              {
                if (*(_QWORD *)v84 != v23)
                  objc_enumerationMutation(v82);
                objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v24), "visitInterval");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "startDate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "endDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "earlierDate:", v28);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "laterDate:", v29);
                v17 = (id)objc_claimAutoreleasedReturnValue();

                ++v24;
                v25 = v17;
                v26 = v18;
              }
              while (v22 != v24);
              v22 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
            }
            while (v22);
          }

          v19 = v81 + 1;
        }
        while (v81 + 1 != v80);
        v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      }
      while (v80);
    }

    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    v31 = v30;
    v32 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", (double)(unint64_t)objc_msgSend(v75, "totalNumberOfPersons"));
    -[PGMeaningfulEventCriteria setNumberOfPeopleTrait:](v74, "setNumberOfPeopleTrait:", v32);

    v33 = [PGMeaningfulEventCollectionTrait alloc];
    v10 = v70;
    objc_msgSend(v70, "peopleNodesForMomentNodes:", v73);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v33, "initWithNodes:", v34);
    -[PGMeaningfulEventCriteria setPeopleTrait:](v74, "setPeopleTrait:", v35);

    v36 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v70, "socialGroupNodesForMomentNodes:", v73);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v36, "initWithNodes:", v37);
    -[PGMeaningfulEventCriteria setSocialGroupsTrait:](v74, "setSocialGroupsTrait:", v38);

    v39 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v70, "dateNodesForMomentNodes:", v73);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v39, "initWithNodes:", v40);
    -[PGMeaningfulEventCriteria setDatesTrait:](v74, "setDatesTrait:", v41);

    v42 = [PGMeaningfulEventLocationCollectionTrait alloc];
    objc_msgSend(v70, "addressNodesForMomentNodes:", v73);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v42, "initWithNodes:", v43);
    -[PGMeaningfulEventCriteria setLocationsTrait:](v74, "setLocationsTrait:", v44);

    v45 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v70, "roiNodesWithNonzeroConfidenceForMomentNodes:", v73);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v45, "initWithNodes:", v46);
    -[PGMeaningfulEventCriteria setRoisTrait:](v74, "setRoisTrait:", v47);

    v48 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v70, "poiNodesWithNonzeroConfidenceForMomentNodes:", v73);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v48, "initWithNodes:", v49);
    -[PGMeaningfulEventCriteria setPoisTrait:](v74, "setPoisTrait:", v50);

    v51 = [PGMeaningfulEventSceneCollectionTrait alloc];
    objc_msgSend(v70, "sceneNodesForMomentNodes:", v73);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:](v51, "initWithNodes:", v52);
    -[PGMeaningfulEventCriteria setScenesTrait:](v74, "setScenesTrait:", v53);

    v54 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", v31);
    -[PGMeaningfulEventCriteria setMinimumDurationTrait:](v74, "setMinimumDurationTrait:", v54);

    v55 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", v31);
    -[PGMeaningfulEventCriteria setMaximumDurationTrait:](v74, "setMaximumDurationTrait:", v55);

    v56 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", objc_msgSend(v70, "significantPartsOfDayForMomentNodes:", v73));
    -[PGMeaningfulEventCriteria setSignificantPartsOfDayTrait:](v74, "setSignificantPartsOfDayTrait:", v56);

    v57 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", objc_msgSend(v70, "partsOfDayForMomentNodes:", v73));
    -[PGMeaningfulEventCriteria setAllPartsOfDayTrait:](v74, "setAllPartsOfDayTrait:", v57);

    objc_msgSend(v70, "mobilityNodesForMomentNodes:", v73);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "locationMobilityTypes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "unsignedIntegerValue");

    v62 = -[PGMeaningfulEventLocationMobilityTrait initWithMobility:]([PGMeaningfulEventLocationMobilityTrait alloc], "initWithMobility:", v61);
    -[PGMeaningfulEventCriteria setLocationMobilityTrait:](v74, "setLocationMobilityTrait:", v62);

    v63 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v70, "publicEventCategoryNodesForMomentNodes:", v73);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v63, "initWithNodes:", v64);
    -[PGMeaningfulEventCriteria setPublicEventCategoriesTrait:](v74, "setPublicEventCategoriesTrait:", v65);

    objc_storeStrong((id *)&v74->_momentNode, v69);
    if (-[PGGraphMomentNode isInteresting](v74->_momentNode, "isInteresting"))
      v66 = 1;
    else
      v66 = -[PGGraphMomentNode isSmartInteresting](v74->_momentNode, "isSmartInteresting");
    v12 = v74;
    v74->_interestingForMeaningInference = v66;

    v9 = v75;
  }

  return v12;
}

- (id)matchingResultWithCriteria:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  _BOOL4 interestingForMeaningInference;
  int v9;
  int v10;
  _BOOL8 v11;
  double v12;
  double v13;
  PGMeaningfulEventMatchingResult *v15;
  PGMeaningfulEventMatchingResult *v16;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __int16 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PGMeaningfulEventCriteria isDebug](self, "isDebug"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isDebug");
  -[PGMeaningfulEventCriteria setDebug:](self, "setDebug:", v5);
  v23 = 0;
  objc_msgSend(v4, "minimumScore");
  v7 = v6;
  interestingForMeaningInference = self->_interestingForMeaningInference;
  v9 = objc_msgSend(v4, "mustBeInteresting");
  v10 = v9;
  if (interestingForMeaningInference || (v9 & 1) == 0)
  {
    -[PGMeaningfulEventMatchingCriteria matchingScoreWithCriteria:failed:isReliable:](self, "matchingScoreWithCriteria:failed:isReliable:", v4, (char *)&v23 + 1, &v23);
    v12 = v13;
    v11 = v13 >= v7 && HIBYTE(v23) == 0;
  }
  else
  {
    v11 = 0;
    v12 = 0.0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PGGraphMomentNode name](self->_momentNode, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("YES");
    *(_DWORD *)buf = 138413826;
    v25 = v18;
    if (HIBYTE(v23))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v27 = v20;
    if (v11)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v26 = 2112;
    if (v10)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v28 = 2112;
    if (!interestingForMeaningInference)
      v19 = CFSTR("NO");
    v29 = v21;
    v30 = 2048;
    v31 = v12;
    v32 = 2048;
    v33 = v7;
    v34 = 2112;
    v35 = v22;
    v36 = 2112;
    v37 = v19;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MeaningInference] [%@] isMatching %@, traitFailed %@, score %.2f of %.2f, requiresInteresting %@, isInteresting %@", buf, 0x48u);

  }
  v15 = [PGMeaningfulEventMatchingResult alloc];
  v16 = -[PGMeaningfulEventMatchingResult initWithIsMatching:score:isReliable:requiredCriteria:](v15, "initWithIsMatching:score:isReliable:requiredCriteria:", v11, v23, v4, v12);

  return v16;
}

- (double)matchingScoreWithCriteria:(id)a3 failed:(BOOL *)a4 isReliable:(BOOL *)a5
{
  id v7;
  BOOL v8;
  uint64_t v9;
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
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  unint64_t v38;
  double v39;
  void *v40;
  double v41;
  BOOL v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  BOOL v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  BOOL v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  BOOL v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  unint64_t v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  BOOL v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  unint64_t v114;
  unint64_t v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  BOOL v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  BOOL v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  BOOL v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  BOOL v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  void *v151;
  void *v152;
  BOOL v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  void *v159;
  double v160;
  BOOL v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  unint64_t v167;
  unint64_t v168;
  double v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  double v175;
  void *v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  void *v181;
  double v182;
  void *v183;
  double v184;
  void *v185;
  double v186;
  void *v187;
  double v188;
  void *v189;
  double v190;
  void *v191;
  double v192;
  void *v193;
  double v194;
  void *v195;
  void *v196;
  double v198;
  double v199;
  double v200;
  double v202;
  double v203;
  int v204;
  int v205;
  int v206;
  int v207;
  BOOL *v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  unsigned int v218;
  _QWORD v219[4];
  id v220;
  uint64_t *v221;
  uint64_t *v222;
  double v223;
  char v224;
  _QWORD v225[4];
  id v226;
  uint64_t *v227;
  uint64_t *v228;
  double v229;
  char v230;
  _QWORD v231[4];
  id v232;
  uint64_t *v233;
  uint64_t *v234;
  uint64_t *v235;
  double v236;
  char v237;
  _QWORD v238[4];
  id v239;
  uint64_t *v240;
  uint64_t *v241;
  double v242;
  char v243;
  uint64_t v244;
  double *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t *v249;
  uint64_t v250;
  char v251;
  uint64_t v252;
  double *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  double *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  double *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  double *v265;
  uint64_t v266;
  uint64_t v267;

  v7 = a3;
  v8 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");
  v9 = 1;
  if (!v8)
    v9 = objc_msgSend(v7, "isDebug", 1);
  -[PGMeaningfulEventCriteria setDebug:](self, "setDebug:", v9);
  v264 = 0;
  v265 = (double *)&v264;
  v266 = 0x2020000000;
  v267 = 0;
  v260 = 0;
  v261 = (double *)&v260;
  v262 = 0x2020000000;
  v263 = 0;
  v256 = 0;
  v257 = (double *)&v256;
  v258 = 0x2020000000;
  v259 = 0;
  v252 = 0;
  v253 = (double *)&v252;
  v254 = 0x2020000000;
  v255 = 0;
  v248 = 0;
  v249 = &v248;
  v250 = 0x2020000000;
  v251 = 1;
  objc_msgSend(v7, "numberOfPeopleTrait");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = objc_msgSend(v10, "isMatchingRequired");

  objc_msgSend(v7, "peopleTrait");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = objc_msgSend(v11, "isMatchingRequired");

  objc_msgSend(v7, "socialGroupsTrait");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = objc_msgSend(v12, "isMatchingRequired");

  objc_msgSend(v7, "locationsTrait");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = objc_msgSend(v13, "isMatchingRequired");

  objc_msgSend(v7, "datesTrait");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = objc_msgSend(v14, "isMatchingRequired");

  objc_msgSend(v7, "scenesTrait");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = objc_msgSend(v15, "isMatchingRequired");

  objc_msgSend(v7, "roisTrait");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = objc_msgSend(v16, "isMatchingRequired");

  objc_msgSend(v7, "poisTrait");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = objc_msgSend(v17, "isMatchingRequired");

  objc_msgSend(v7, "minimumDurationTrait");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = objc_msgSend(v18, "isMatchingRequired");

  objc_msgSend(v7, "maximumDurationTrait");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = objc_msgSend(v19, "isMatchingRequired");

  objc_msgSend(v7, "significantPartsOfDayTrait");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = objc_msgSend(v20, "isMatchingRequired");

  objc_msgSend(v7, "allPartsOfDayTrait");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend(v21, "isMatchingRequired");

  objc_msgSend(v7, "locationMobilityTrait");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = objc_msgSend(v22, "isMatchingRequired");

  objc_msgSend(v7, "publicEventCategoriesTrait");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = objc_msgSend(v23, "isMatchingRequired");

  objc_msgSend(v7, "numberOfPeopleTrait");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isActive");

  if (v25)
  {
    objc_msgSend(v7, "numberOfPeopleTrait");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v28 = v27;

    -[PGMeaningfulEventCriteria numberOfPeopleTrait](self, "numberOfPeopleTrait");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "value");
    v31 = v30;

    v32 = 1.0;
    if (v218)
    {
      objc_msgSend(v7, "numberOfPeopleTrait");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "minimumScore");
      v32 = v34;

    }
    objc_msgSend(v7, "minimumScore");
    v35 = (double)(unint64_t)v31 / (double)(unint64_t)v28;
    v200 = fmin(v35 / v32 * v36, 1.0);
    if (v35 < v32)
      v37 = v218;
    else
      v37 = 0;
    v38 = v218;
    if (v218)
      v39 = v200 + 0.0;
    else
      v39 = 0.0;
  }
  else
  {
    v37 = 0;
    v38 = 0;
    v200 = 0.0;
    v39 = 0.0;
  }
  objc_msgSend(v7, "locationMobilityTrait");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0.0;
  if (objc_msgSend(v40, "isActive"))
  {
    if (v37)
    {
      v42 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v42)
      {
        v37 = 1;
        goto LABEL_27;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "locationMobilityTrait");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v40, "value");
    -[PGMeaningfulEventCriteria locationMobilityTrait](self, "locationMobilityTrait");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "value");

    v46 = 1.0;
    if (v43 == v45)
      v47 = 1.0;
    else
      v47 = 0.0;
    if (v213)
    {
      objc_msgSend(v40, "minimumScore");
      v46 = v48;
    }
    objc_msgSend(v7, "minimumScore");
    v41 = fmin(v47 / v46 * v49, 1.0);
    if (v213)
    {
      v39 = v39 + v41;
      ++v38;
      if (v47 < v46)
        v37 = 1;
    }
  }

LABEL_27:
  objc_msgSend(v7, "significantPartsOfDayTrait");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = 0.0;
  if (!objc_msgSend(v50, "isActive"))
  {
LABEL_35:

    goto LABEL_36;
  }
  if (v37)
  {
    v51 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    if (!v51)
    {
      v37 = 1;
      v203 = 0.0;
      goto LABEL_36;
    }
  }
  else
  {

  }
  -[PGMeaningfulEventCriteria significantPartsOfDayTrait](self, "significantPartsOfDayTrait");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "significantPartsOfDayTrait");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForPartOfDayWithMatchingTrait:requiredTrait:requiresStrictMatching:](self, "_calculateMatchingScoreForPartOfDayWithMatchingTrait:requiredTrait:requiresStrictMatching:", v52, v53, 0);
  v55 = v54;

  objc_msgSend(v7, "minimumScore");
  v203 = fmin(v55 * v56, 1.0);
  if (v205)
  {
    objc_msgSend(v7, "significantPartsOfDayTrait");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "minimumScore");
    v39 = v39 + v203;
    ++v38;
    if (v55 < v57)
      v37 = 1;
    goto LABEL_35;
  }
LABEL_36:
  objc_msgSend(v7, "allPartsOfDayTrait");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = 0.0;
  if (!objc_msgSend(v58, "isActive"))
  {
LABEL_44:

    goto LABEL_45;
  }
  if (v37)
  {
    v59 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    if (!v59)
    {
      v37 = 1;
      v202 = 0.0;
      goto LABEL_45;
    }
  }
  else
  {

  }
  -[PGMeaningfulEventCriteria allPartsOfDayTrait](self, "allPartsOfDayTrait");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPartsOfDayTrait");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForPartOfDayWithMatchingTrait:requiredTrait:requiresStrictMatching:](self, "_calculateMatchingScoreForPartOfDayWithMatchingTrait:requiredTrait:requiresStrictMatching:", v60, v61, 0);
  v63 = v62;

  objc_msgSend(v7, "minimumScore");
  v202 = fmin(v63 * v64, 1.0);
  if (v204)
  {
    objc_msgSend(v7, "allPartsOfDayTrait");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "minimumScore");
    v39 = v39 + v202;
    ++v38;
    if (v63 < v65)
      v37 = 1;
    goto LABEL_44;
  }
LABEL_45:
  objc_msgSend(v7, "minimumDurationTrait");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v66, "isActive"))
  {

    goto LABEL_50;
  }
  if (v37)
  {
    v67 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    if (!v67)
    {
      v37 = 1;
LABEL_50:
      v199 = 0.0;
      goto LABEL_57;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "minimumDurationTrait");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "value");
  v70 = v69;

  -[PGMeaningfulEventCriteria minimumDurationTrait](self, "minimumDurationTrait");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "value");
  v73 = v72;

  v74 = 1.0;
  if (v214)
  {
    objc_msgSend(v7, "minimumDurationTrait");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "minimumScore");
    v74 = v76;

  }
  objc_msgSend(v7, "minimumScore");
  v78 = fmin(v73 / v70 / v74 * v77, 1.0);
  v199 = v78;
  if (v214)
  {
    v39 = v39 + v78;
    ++v38;
    if (v73 / v70 < v74)
      v37 = 1;
  }
LABEL_57:
  objc_msgSend(v7, "maximumDurationTrait");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v79, "isActive"))
  {

    goto LABEL_62;
  }
  if (v37)
  {
    v80 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    if (!v80)
    {
      v37 = 1;
LABEL_62:
      objc_msgSend(v7, "peopleTrait", 0);
      goto LABEL_70;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "maximumDurationTrait");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "value");
  v83 = v82;

  -[PGMeaningfulEventCriteria maximumDurationTrait](self, "maximumDurationTrait");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "value");
  v86 = v85;

  v87 = 1.0;
  if (v211)
  {
    objc_msgSend(v7, "maximumDurationTrait");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "minimumScore");
    v87 = v89;

  }
  objc_msgSend(v7, "minimumScore");
  v90 = 1.0 - v86 / v83;
  v92 = fmin(v90 / v87 * v91, 1.0);
  if (v211)
  {
    v39 = v39 + v92;
    ++v38;
    if (v90 < v87)
      v37 = 1;
  }
  objc_msgSend(v7, "peopleTrait", *(_QWORD *)&v92);
LABEL_70:
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0.0;
  v208 = a5;
  if (objc_msgSend(v93, "isActive"))
  {
    if (v37)
    {
      v95 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v95)
      {
        v37 = 1;
        goto LABEL_82;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "peopleTrait");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "nodes");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMeaningfulEventCriteria peopleTrait](self, "peopleTrait");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "nodes");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v93, "collectionByIntersecting:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "count");
    v101 = objc_msgSend(v93, "count");
    v102 = 1.0;
    if (v217)
    {
      objc_msgSend(v7, "peopleTrait");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "minimumScore");
      v102 = v104;

    }
    objc_msgSend(v7, "minimumScore");
    v105 = (double)v100 / (double)v101;
    v94 = fmin(v105 / v102 * v106, 1.0);
    if (v217)
    {
      v39 = v39 + v94;
      ++v38;
      if (v105 < v102)
        v37 = 1;
    }
    -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    a5 = v208;
  }

LABEL_82:
  objc_msgSend(v7, "socialGroupsTrait");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0.0;
  if (objc_msgSend(v107, "isActive"))
  {
    if (v37)
    {
      v109 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v109)
      {
        v37 = 1;
        goto LABEL_94;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "socialGroupsTrait");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "nodes");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMeaningfulEventCriteria socialGroupsTrait](self, "socialGroupsTrait");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "nodes");
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v107, "collectionByIntersecting:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "count");
    v115 = objc_msgSend(v107, "count");
    v116 = 1.0;
    if (v216)
    {
      objc_msgSend(v7, "socialGroupsTrait");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "minimumScore");
      v116 = v118;

    }
    objc_msgSend(v7, "minimumScore");
    v119 = (double)v114 / (double)v115;
    v108 = fmin(v119 / v116 * v120, 1.0);
    if (v216)
    {
      v39 = v39 + v108;
      ++v38;
      if (v119 < v116)
        v37 = 1;
    }
    -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

    a5 = v208;
  }

LABEL_94:
  objc_msgSend(v7, "locationsTrait");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v121, "isActive"))
  {
    if (v37)
    {
      v122 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v122)
      {
        v37 = 1;
        goto LABEL_104;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "locationsTrait");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "minimumScore");
    v125 = v124;

    v244 = 0;
    v245 = (double *)&v244;
    v246 = 0x2020000000;
    v247 = 0;
    -[PGMeaningfulEventCriteria locationsTrait](self, "locationsTrait");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationsTrait");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v238[0] = MEMORY[0x1E0C809B0];
    v238[1] = 3221225472;
    v238[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke;
    v238[3] = &unk_1E842B6C8;
    v243 = v215;
    v242 = v125;
    v240 = &v244;
    v241 = &v264;
    v239 = v7;
    -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForLocationsWithMatchingTrait:requiredTrait:result:](self, "_calculateMatchingScoreForLocationsWithMatchingTrait:requiredTrait:result:", v126, v127, v238);

    if (v215)
    {
      v39 = v39 + v265[3];
      ++v38;
      if (v245[3] < v125)
        v37 = 1;
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {

  }
LABEL_104:
  objc_msgSend(v7, "datesTrait");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0.0;
  if (objc_msgSend(v128, "isActive"))
  {
    if (v37)
    {
      v130 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v130)
      {
        v37 = 1;
        goto LABEL_119;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "datesTrait");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "nodes");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMeaningfulEventCriteria datesTrait](self, "datesTrait");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "nodes");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v128, "collectionByIntersecting:", v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = 1.0;
    if (objc_msgSend(v134, "count"))
      v136 = 1.0;
    else
      v136 = 0.0;
    if (v212)
    {
      objc_msgSend(v7, "datesTrait");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "minimumScore");
      v135 = v138;

    }
    objc_msgSend(v7, "minimumScore");
    v129 = fmin(v136 / v135 * v139, 1.0);
    if (v212)
    {
      v39 = v39 + v129;
      ++v38;
      if (v136 < v135)
        v37 = 1;
    }

    a5 = v208;
  }

LABEL_119:
  objc_msgSend(v7, "scenesTrait");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v140, "isActive"))
  {
    if (v37)
    {
      v141 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v141)
      {
        v37 = 1;
        goto LABEL_129;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "scenesTrait");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "minimumScore");
    v144 = v143;

    v244 = 0;
    v245 = (double *)&v244;
    v246 = 0x2020000000;
    v247 = 0;
    v231[0] = MEMORY[0x1E0C809B0];
    v231[1] = 3221225472;
    v231[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_2;
    v231[3] = &unk_1E842B6F0;
    v236 = v144;
    v233 = &v248;
    v234 = &v244;
    v237 = v206;
    v235 = &v260;
    v232 = v7;
    -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForScenesWithRequiredCriteria:result:](self, "_calculateMatchingScoreForScenesWithRequiredCriteria:result:", v232, v231);
    if (v206)
    {
      v39 = v39 + v261[3];
      ++v38;
      if (v245[3] < v144)
        v37 = 1;
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {

  }
LABEL_129:
  objc_msgSend(v7, "roisTrait");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v145, "isActive"))
  {
    if (v37)
    {
      v146 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v146)
      {
        v37 = 1;
        goto LABEL_139;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "roisTrait");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "minimumScore");
    v149 = v148;

    v244 = 0;
    v245 = (double *)&v244;
    v246 = 0x2020000000;
    v247 = 0;
    -[PGMeaningfulEventCriteria roisTrait](self, "roisTrait");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "roisTrait");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v225[0] = MEMORY[0x1E0C809B0];
    v225[1] = 3221225472;
    v225[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_3;
    v225[3] = &unk_1E842B6C8;
    v230 = v210;
    v229 = v149;
    v227 = &v244;
    v228 = &v256;
    v226 = v7;
    -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForPOIROIWithMatchingTrait:requiredTrait:result:](self, "_calculateMatchingScoreForPOIROIWithMatchingTrait:requiredTrait:result:", v150, v151, v225);

    if (v210)
    {
      v39 = v39 + v257[3];
      ++v38;
      if (v245[3] < v149)
        v37 = 1;
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {

  }
LABEL_139:
  objc_msgSend(v7, "poisTrait");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v152, "isActive"))
  {
    if (v37)
    {
      v153 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v153)
      {
        v37 = 1;
        goto LABEL_149;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "poisTrait");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "minimumScore");
    v156 = v155;

    v244 = 0;
    v245 = (double *)&v244;
    v246 = 0x2020000000;
    v247 = 0;
    -[PGMeaningfulEventCriteria poisTrait](self, "poisTrait");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "poisTrait");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v219[0] = MEMORY[0x1E0C809B0];
    v219[1] = 3221225472;
    v219[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_4;
    v219[3] = &unk_1E842B6C8;
    v224 = v209;
    v223 = v156;
    v221 = &v244;
    v222 = &v252;
    v220 = v7;
    -[PGMeaningfulEventMatchingCriteria _calculateMatchingScoreForPOIROIWithMatchingTrait:requiredTrait:result:](self, "_calculateMatchingScoreForPOIROIWithMatchingTrait:requiredTrait:result:", v157, v158, v219);

    if (v209)
    {
      v39 = v39 + v253[3];
      ++v38;
      if (v245[3] < v156)
        v37 = 1;
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {

  }
LABEL_149:
  objc_msgSend(v7, "publicEventCategoriesTrait");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0.0;
  if (objc_msgSend(v159, "isActive"))
  {
    if (v37)
    {
      v161 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");

      if (!v161)
      {
        v37 = 1;
        if (!v38)
          goto LABEL_153;
LABEL_163:
        v162 = v39 / (double)v38;
        if (!v37)
          goto LABEL_165;
LABEL_164:
        if (!-[PGMeaningfulEventCriteria isDebug](self, "isDebug"))
          goto LABEL_220;
        goto LABEL_165;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "publicEventCategoriesTrait");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "nodes");
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMeaningfulEventCriteria publicEventCategoriesTrait](self, "publicEventCategoriesTrait");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "nodes");
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v159, "collectionByIntersecting:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v166, "count");
    v168 = objc_msgSend(v159, "count");
    v169 = 1.0;
    if (v207)
    {
      objc_msgSend(v7, "publicEventCategoriesTrait");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "minimumScore");
      v169 = v171;

    }
    objc_msgSend(v7, "minimumScore");
    v172 = (double)v167 / (double)v168;
    v160 = fmin(v172 / v169 * v173, 1.0);
    if (v207)
    {
      v39 = v39 + v160;
      ++v38;
      if (v172 < v169)
        v37 = 1;
    }

    a5 = v208;
  }

  if (v38)
    goto LABEL_163;
LABEL_153:
  v162 = 0.0;
  if (v37)
    goto LABEL_164;
LABEL_165:
  objc_msgSend(v7, "numberOfPeopleTrait");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v174, "isActive") ^ 1 | v218) & 1) != 0)
  {

  }
  else
  {

    v175 = v200;
    if (v200 >= v162)
    {
      v39 = v200 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "peopleTrait", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v176, "isActive") ^ 1 | v217) & 1) != 0)
  {

  }
  else
  {

    if (v94 >= v162)
    {
      v39 = v94 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "socialGroupsTrait");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v177, "isActive") ^ 1 | v216) & 1) != 0)
  {

  }
  else
  {

    if (v108 >= v162)
    {
      v39 = v108 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "locationsTrait");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v178, "isActive") ^ 1 | v215) & 1) != 0)
  {

  }
  else
  {
    v179 = v265[3];

    if (v179 >= v162)
    {
      v39 = v39 + v265[3];
      ++v38;
    }
  }
  objc_msgSend(v7, "datesTrait");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v180, "isActive") ^ 1 | v212) & 1) != 0)
  {

  }
  else
  {

    if (v129 >= v162)
    {
      v39 = v129 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "scenesTrait");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v181, "isActive") ^ 1 | v206) & 1) != 0)
  {

  }
  else
  {
    v182 = v261[3];

    if (v182 >= v162)
    {
      v39 = v39 + v261[3];
      ++v38;
    }
  }
  objc_msgSend(v7, "roisTrait");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v183, "isActive") ^ 1 | v210) & 1) != 0)
  {

  }
  else
  {
    v184 = v257[3];

    if (v184 >= v162)
    {
      v39 = v39 + v257[3];
      ++v38;
    }
  }
  objc_msgSend(v7, "poisTrait");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v185, "isActive") ^ 1 | v209) & 1) != 0)
  {

  }
  else
  {
    v186 = v253[3];

    if (v186 >= v162)
    {
      v39 = v39 + v253[3];
      ++v38;
    }
  }
  objc_msgSend(v7, "minimumDurationTrait");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v187, "isActive") ^ 1 | v214) & 1) != 0)
  {

  }
  else
  {

    v188 = v199;
    if (v199 >= v162)
    {
      v39 = v199 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "maximumDurationTrait", v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v189, "isActive") ^ 1 | v211) & 1) != 0)
  {

  }
  else
  {

    v190 = v198;
    if (v198 >= v162)
    {
      v39 = v198 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "significantPartsOfDayTrait", v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v191, "isActive") ^ 1 | v205) & 1) != 0)
  {

  }
  else
  {

    v192 = v203;
    if (v203 >= v162)
    {
      v39 = v203 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "allPartsOfDayTrait", v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v193, "isActive") ^ 1 | v204) & 1) != 0)
  {

  }
  else
  {

    v194 = v202;
    if (v202 >= v162)
    {
      v39 = v202 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "locationMobilityTrait", v194);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v195, "isActive") ^ 1 | v213) & 1) != 0)
  {

  }
  else
  {

    if (v41 >= v162)
    {
      v39 = v41 + v39;
      ++v38;
    }
  }
  objc_msgSend(v7, "publicEventCategoriesTrait");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v196, "isActive") ^ 1 | v207) & 1) != 0)
  {

  }
  else
  {

    if (v160 >= v162)
    {
      v39 = v160 + v39;
      ++v38;
      goto LABEL_223;
    }
  }
LABEL_220:
  if (v38)
LABEL_223:
    v39 = v39 / (double)v38;
  if (a4)
    *a4 = v37;
  if (a5)
    *a5 = *((_BYTE *)v249 + 24);
  _Block_object_dispose(&v248, 8);
  _Block_object_dispose(&v252, 8);
  _Block_object_dispose(&v256, 8);
  _Block_object_dispose(&v260, 8);
  _Block_object_dispose(&v264, 8);

  return v39;
}

- (void)_calculateMatchingScoreForScenesWithRequiredCriteria:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(_QWORD, double, double);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  PGGraphMomentNode *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGGraphMomentNode *v23;
  id v24;
  double (**v25)(void *, void *);
  void *v26;
  PGMeaningfulEventProcessorCache *cache;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  __n128 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PGGraphMomentNode *v42;
  void *v43;
  _QWORD aBlock[4];
  PGGraphMomentNode *v45;
  id v46;
  id v47;
  uint64_t v48;
  BOOL v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD, double, double))a4;
  -[PGMeaningfulEventCriteria scenesTrait](self, "scenesTrait");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  objc_msgSend(v6, "scenesTrait");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v8;
  objc_msgSend(v8, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "negativeNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  v13 = objc_msgSend(v11, "count");
  v14 = objc_msgSend(v9, "accumulateHighConfidenceAssetCounts");
  v15 = self->_momentNode;
  v16 = -[PGMeaningfulEventCriteria isDebug](self, "isDebug");
  v42 = v15;
  v43 = v10;
  v38 = v12;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "collectionByIntersecting:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMomentNode collection](v15, "collection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphSceneEdge filterWithMinimumNumberOfHighConfidenceAssets:](PGGraphSceneEdge, "filterWithMinimumNumberOfHighConfidenceAssets:", objc_msgSend(v9, "minimumNumberOfNegativeHighConfidenceAssets"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphSceneEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v18, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      v21 = v41;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PGMeaningfulEventMatchingCriteria momentNode](self, "momentNode");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v52 = v36;
        v53 = 2114;
        v54 = v37;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MeaningInference] Moment %{private}@ matched negative scenes for identifier %{public}@", buf, 0x16u);

      }
      v7[2](v7, 0.0, 0.0);

      v22 = v39;
      goto LABEL_12;
    }

    v15 = v42;
    v10 = v43;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke;
  aBlock[3] = &unk_1E842B7A0;
  v48 = v13;
  v49 = v16;
  v23 = v15;
  v45 = v23;
  v46 = v9;
  v50 = v14;
  v24 = v10;
  v47 = v24;
  v25 = (double (**)(void *, void *))_Block_copy(aBlock);
  v22 = v39;
  objc_msgSend(v39, "collectionByIntersecting:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  cache = self->_cache;
  -[PGGraphMomentNode collection](v23, "collection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventProcessorCache reliableSceneNodesForMomentNodes:](cache, "reliableSceneNodesForMomentNodes:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "collectionByIntersecting:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v25[2](v25, v26);
  v32 = objc_msgSend(v26, "count");
  v33 = objc_msgSend(v30, "count");
  v34.n128_f64[0] = v31;
  if (v32 != v33)
    v34.n128_u64[0] = v25[2](v25, v30);
  if (v7)
    ((void (*)(void (**)(_QWORD, double, double), double, __n128))v7[2])(v7, v31, v34);

  v17 = v45;
  v21 = v41;
LABEL_12:

}

- (void)_calculateMatchingScoreForPOIROIWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5
{
  id v8;
  void (**v9)(_QWORD, double);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PGGraphMomentNode *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void (**v19)(void *, void *);
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[5];
  PGGraphMomentNode *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a4;
  v9 = (void (**)(_QWORD, double))a5;
  objc_msgSend(a3, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "negativeNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "count");
  v14 = self->_momentNode;
  if (objc_msgSend(v12, "count"))
  {
    v22 = v10;
    objc_msgSend(v12, "collectionByIntersecting:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v16)
    {
      if (!-[PGMeaningfulEventCriteria isDebug](self, "isDebug"))
      {
        v9[2](v9, 0.0);

        v10 = v22;
        goto LABEL_11;
      }
      -[PGGraphMomentNode collection](v14, "collection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:", v21, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enumerateEdgesUsingBlock:", &__block_literal_global_191);

    }
    v10 = v22;
  }
  else
  {
    v16 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForPOIROIWithMatchingTrait_requiredTrait_result___block_invoke_2;
  aBlock[3] = &unk_1E842B848;
  v27 = v13;
  aBlock[4] = self;
  v24 = v14;
  v28 = v16;
  v25 = v8;
  v18 = v10;
  v26 = v18;
  v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v11, "collectionByIntersecting:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v20);
  if (v9)
    ((void (*)(void (**)(_QWORD, double)))v9[2])(v9);

LABEL_11:
}

- (void)_calculateMatchingScoreForLocationsWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5
{
  void (**v8)(_QWORD, __n128);
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  __n128 v18;
  __n128 v19;
  double v20;
  __n128 v21;
  int v22;
  id v23;

  v23 = a4;
  v8 = (void (**)(_QWORD, __n128))a5;
  objc_msgSend(a3, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "negativeNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  v13 = objc_msgSend(v11, "count");
  v14 = objc_msgSend(v23, "useStrictNegativeNodesMatching");
  if (v13)
  {
    if (v14)
      v15 = v12;
    else
      v15 = 1;
    objc_msgSend(v11, "collectionByIntersecting:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (v17 && v17 >= v15)
    {
      -[PGMeaningfulEventCriteria isDebug](self, "isDebug");
      v18.n128_u64[0] = 0;
      v8[2](v8, v18);
LABEL_11:

      goto LABEL_16;
    }

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "collectionByIntersecting:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (double)(unint64_t)objc_msgSend(v16, "count") / (double)v12;
    -[PGMeaningfulEventCriteria isDebug](self, "isDebug");
    v21.n128_f64[0] = v20;
    v8[2](v8, v21);
    goto LABEL_11;
  }
  v19.n128_u64[0] = 1.0;
  if (!v12)
  {
    v22 = objc_msgSend(v23, "skipNegativeRequirementForMissingLocation", 1.0);
    v19.n128_u64[0] = 0;
    if (v22)
      v19.n128_f64[0] = 1.0;
  }
  v8[2](v8, v19);
LABEL_16:

}

- (double)_calculateMatchingScoreForPartOfDayWithMatchingTrait:(id)a3 requiredTrait:(id)a4 requiresStrictMatching:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t v10;
  int8x8_t v11;
  unint64_t v12;
  int8x8_t v13;
  uint8x8_t v14;
  int v15;
  double v16;
  double v17;

  v5 = a5;
  v7 = a4;
  v8 = objc_msgSend(a3, "value");
  v9 = objc_msgSend(v7, "value");
  v10 = objc_msgSend(v7, "forbiddenValue");
  if (v10 == 1 || (v8 & v10 & 0x3F) == 0)
  {
    v11.i32[0] = v9 & v8 & 0x3F;
    v13 = vcnt_s8(v11);
    v13.i16[0] = vaddlv_u8((uint8x8_t)v13);
    v12 = v13.u32[0];
    if (v5)
    {
      v13.i32[0] = v8 & 0x3F;
      v14 = (uint8x8_t)vcnt_s8(v13);
      v14.i16[0] = vaddlv_u8(v14);
      if (v14.i32[0] > v12)
        v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  v15 = objc_msgSend(v7, "isMatchingRequired");
  v16 = 1.0;
  if (v15)
    objc_msgSend(v7, "minimumScore", 1.0);
  v17 = fmin((double)v12 / v16, 1.0);

  return v17;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PGMeaningfulEventMatchingCriteria description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventCriteria _debugDescriptionWithMomentNode:](self, "_debugDescriptionWithMomentNode:", self->_momentNode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PGGraphMomentNode)momentNode
{
  return self->_momentNode;
}

- (BOOL)interestingForMeaningInference
{
  return self->_interestingForMeaningInference;
}

- (void)setInterestingForMeaningInference:(BOOL)a3
{
  self->_interestingForMeaningInference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

double __108__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForPOIROIWithMatchingTrait_requiredTrait_result___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  double v20;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 64))
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = objc_msgSend(v3, "count");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(*(id *)(a1 + 32), "isDebug"))
    {
      objc_msgSend(*(id *)(a1 + 40), "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:", v8, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enumerateEdgesUsingBlock:", &__block_literal_global_192);

    }
    if (!*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 48), "additionalMatchingBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14
        || (objc_msgSend(*(id *)(a1 + 48), "additionalMatchingBlock"),
            v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
            v16 = ((uint64_t (**)(_QWORD, void *, _QWORD))v15)[2](v15, v4, *(_QWORD *)(a1 + 40)),
            v15,
            v16))
      {
        v17 = *(_QWORD *)(a1 + 64);
        v5 = 1.0;
        if (v17 != 1)
        {
          v18 = v17 == 2;
          v19 = 1;
          if (!v18)
            v19 = 2;
          v20 = ((double)v7 + -1.0) / (double)v19;
          if (v20 >= 1.0)
            v5 = 1.0;
          else
            v5 = v20 * 0.25 + 0.75;
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isDebug"))
    {
      objc_msgSend(v4, "collectionBySubtracting:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "collection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enumerateEdgesUsingBlock:", &__block_literal_global_193);

    }
  }

  return v5;
}

double __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 56))
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = objc_msgSend(v3, "count");
  if (v6)
  {
    v7 = v6;
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphSceneEdgeCollection, "edgesFromNodes:toNodes:", v8, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "enumerateEdgesUsingBlock:", &__block_literal_global_24858);
    }
    v10 = (double)v7;
    v11 = (double)v7 / (double)*(unint64_t *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "minimumScore");
    if (v11 >= v12)
    {
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "additionalMatchingBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14
        || (objc_msgSend(*(id *)(a1 + 40), "additionalMatchingBlock"),
            v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
            v16 = ((uint64_t (**)(_QWORD, void *, _QWORD))v15)[2](v15, v4, *(_QWORD *)(a1 + 32)),
            v15,
            v16))
      {
        v42 = 0;
        v43 = &v42;
        v44 = 0x2020000000;
        v45 = 0;
        v17 = objc_msgSend(*(id *)(a1 + 40), "minimumNumberOfHighConfidenceAssets");
        v38 = 0;
        v39 = &v38;
        v40 = 0x2020000000;
        v41 = 0;
        v34 = 0;
        v35 = &v34;
        v36 = 0x2020000000;
        v37 = 0;
        objc_msgSend(*(id *)(a1 + 32), "collection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphSceneEdgeCollection, "edgesFromNodes:toNodes:", v18, v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke_3;
        v27[3] = &unk_1E842B758;
        v28 = *(id *)(a1 + 32);
        v29 = *(id *)(a1 + 40);
        v30 = &v34;
        v31 = &v38;
        v32 = &v42;
        v33 = v17;
        objc_msgSend(v19, "enumerateEdgesUsingBlock:", v27);
        v20 = (double)*(unint64_t *)(a1 + 56);
        if (*(_BYTE *)(a1 + 65))
          v22 = v10 / v20 >= v13 && v39[3] >= v17;
        else
          v22 = (double)(unint64_t)v43[3] / v20 >= v13;
        if (v22 && (double)(unint64_t)v35[3] / v20 >= v13)
          v5 = 1.0;
        else
          v5 = 0.0;

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);
      }
    }
  }
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "collectionBySubtracting:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphSceneEdgeCollection, "edgesFromNodes:toNodes:", v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "enumerateEdgesUsingBlock:", &__block_literal_global_187_24859);
  }

  return v5;
}

void __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  double v5;
  double v6;
  uint64_t v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "numberOfHighConfidenceAssets");
  v5 = (double)v4 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfAssets");
  objc_msgSend(*(id *)(a1 + 40), "minimumRatioOfHighConfidenceAssets");
  if (v5 >= v6)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = objc_msgSend(v3, "numberOfSearchConfidenceAssets");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v7 + v4;
  if (v7 + v4 >= *(_QWORD *)(a1 + 72))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = 1.0;
  if (*(_BYTE *)(a1 + 64))
    v3 = *(double *)(a1 + 56);
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) / v3;
  objc_msgSend(*(id *)(a1 + 32), "minimumScore");
  result = fmin(v4 * v5, 1.0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_2(uint64_t a1, double a2, double a3)
{
  double v4;
  double v5;
  double v6;
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 64) <= a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    a2 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v4 = 1.0;
  if (*(_BYTE *)(a1 + 72))
    v4 = *(double *)(a1 + 64);
  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) / v4;
  objc_msgSend(*(id *)(a1 + 32), "minimumScore");
  result = fmin(v5 * v6, 1.0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_3(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = 1.0;
  if (*(_BYTE *)(a1 + 64))
    v3 = *(double *)(a1 + 56);
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) / v3;
  objc_msgSend(*(id *)(a1 + 32), "minimumScore");
  result = fmin(v4 * v5, 1.0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_4(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v3 = 1.0;
  if (*(_BYTE *)(a1 + 64))
    v3 = *(double *)(a1 + 56);
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) / v3;
  objc_msgSend(*(id *)(a1 + 32), "minimumScore");
  result = fmin(v4 * v5, 1.0);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
