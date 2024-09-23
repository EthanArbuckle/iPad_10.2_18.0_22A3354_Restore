@implementation SectionL3Scores

- (SectionL3Scores)init
{
  SectionL3Scores *v2;
  SectionL3Scores *v3;
  uint64_t v9;
  NSMutableDictionary *features;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SectionL3Scores;
  v2 = -[SectionL3Scores init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    memset_pattern16(v2->l3Score, &unk_1B87DEF60, 0xCuLL);
    memset_pattern16(v3->l3ScoreLegacy, &unk_1B87DEF60, 0xCuLL);
    __asm { FMOV            V0.2S, #-1.0 }
    *(_QWORD *)&v3->_iFunScore = _D0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 67);
    v9 = objc_claimAutoreleasedReturnValue();
    features = v3->_features;
    v3->_features = (NSMutableDictionary *)v9;

    v3->_modelScore = -1.0;
  }
  return v3;
}

- (float)getL3Score:(int)a3 isLegacy:(BOOL)a4
{
  uint64_t v4;

  v4 = 8;
  if (a4)
    v4 = 20;
  return *(float *)((char *)&self->super.isa + 4 * a3 + v4);
}

+ (float)normalizeLegacyScore:(float)a3
{
  return 1.0 / (expf(-a3) + 1.0);
}

- (float)getResultScore:(id)a3 section:(id)a4 isLegacy:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  double v27;
  double v28;
  double v29;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    if (objc_msgSend(v8, "domain") == 2)
    {
      objc_msgSend(v7, "l2score");
    }
    else
    {
      objc_msgSend(v7, "rankingItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "L2FeatureVector");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v12 = -1.0;
        goto LABEL_17;
      }
      objc_msgSend(v7, "rankingItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "L2FeatureVector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "originalL2Score");
      v21 = v20;

      if (v21 < -1000.0)
      {
        objc_msgSend(v7, "rankingItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "keywordMatchScore");
        v24 = v23;

        if (v24 > 0.05)
        {
          objc_msgSend(v7, "l2score");
          v21 = *(float *)&v10;
        }
      }
      *(float *)&v10 = v21;
    }
    +[SectionL3Scores normalizeLegacyScore:](SectionL3Scores, "normalizeLegacyScore:", v10);
    v12 = v25;
  }
  else
  {
    objc_msgSend(v7, "rankingItem");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -1.0;
    if (v11)
    {
      v13 = (void *)v11;
      objc_msgSend(v7, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "keywordMatchScore");
      if (v15 >= 0.0)
      {
        objc_msgSend(v7, "rankingItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "likelihood");
        v28 = v27;

        if (v28 <= 0.0)
          goto LABEL_17;
        objc_msgSend(v7, "rankingItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "likelihood");
        v12 = v29;
      }
      else
      {

      }
    }
  }
LABEL_17:

  return v12;
}

- (BOOL)computeScore:(id)a3 rankingConfig:(id)a4 hasGoodLocalResult:(BOOL)a5 pos:(int)a6 queryContext:(id)a7
{
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  SectionL3Scores *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  float *l3ScoreLegacy;
  float *v37;
  float *v38;
  float *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  SectionL3Scores *v52;
  int v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  float v62;
  float v63;
  float v64;
  float v65;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  _BOOL4 v71;
  float v72;
  uint64_t v73;
  int v74;
  float v75;
  float v76;
  float v77;
  float v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  SectionL3Scores *v83;
  NSMutableDictionary *features;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  NSMutableDictionary *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSMutableDictionary *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  NSMutableDictionary *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  NSMutableDictionary *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  NSMutableDictionary *v113;
  void *v114;
  void *v115;
  int v116;
  double v117;
  void *v118;
  NSMutableDictionary *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  NSMutableDictionary *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  NSMutableDictionary *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NSMutableDictionary *v137;
  void *v138;
  NSMutableDictionary *v139;
  void *v140;
  void *v141;
  NSMutableDictionary *v142;
  void *v143;
  int v144;
  int v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  float v150;
  float v151;
  void *v152;
  void *v153;
  float v154;
  float v155;
  float v156;
  float v157;
  double v158;
  void *v159;
  void *v160;
  double v161;
  void *v162;
  double v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  double v173;
  void *v174;
  void *v175;
  void *v176;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  int v182;
  id v183;
  id v184;
  void *v185;
  uint64_t v186;
  id obj;
  int v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  _BOOL4 v193;
  int v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  char v207;
  uint8_t v208[128];
  uint8_t buf[4];
  void *v210;
  __int16 v211;
  double v212;
  __int16 v213;
  int v214;
  _BYTE v215[128];
  unint64_t v216;
  int v217;
  unint64_t v218;
  int v219;
  _BYTE v220[128];
  uint64_t v221;

  v193 = a5;
  v221 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v184 = a4;
  v12 = a7;
  if (objc_msgSend(v11, "resultsCount"))
  {
    v182 = a6;
    objc_msgSend(v11, "resultsAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "domain");
    if (v14 == 2)
    {
      objc_msgSend(v13, "sectionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "rankingItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sectionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v207 = 0;
    -[SectionL3Scores getIFunScore:rankingConfig:isLocal:result:queryContext:isQUIntent:](self, "getIFunScore:rankingConfig:isLocal:result:queryContext:isQUIntent:", v16, v184, v14 != 2, v13, v12, &v207);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v12;
    if (v207)
    {
      v18 = v13;
      v19 = v16;
      v20 = self;
      v205 = 0u;
      v206 = 0u;
      v203 = 0u;
      v204 = 0u;
      objc_msgSend(v11, "resultSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v203, v220, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v204;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v204 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
            objc_msgSend(v26, "rankingItem");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v26, "rankingItem");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setShouldHideUnderShowMore:", 0);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v203, v220, 16);
        }
        while (v23);
      }

      self = v20;
      v16 = v19;
      v13 = v18;
    }
    v29 = objc_msgSend(v11, "resultsCount");
    v218 = 0xBF800000BF800000;
    v219 = -1082130432;
    v216 = 0xBF800000BF800000;
    v217 = -1082130432;
    if (v29 >= 1)
    {
      v30 = 0;
      if (v29 >= 3)
        v31 = 3;
      else
        v31 = v29;
      if (v31 <= 1)
        v32 = 1;
      else
        v32 = v31;
      do
      {
        objc_msgSend(v11, "resultsAtIndex:", v30);
        v33 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v33;
        -[SectionL3Scores getResultScore:section:isLegacy:](self, "getResultScore:section:isLegacy:", v33, v11, 1);
        *((_DWORD *)&v218 + v30) = v34;
        -[SectionL3Scores getResultScore:section:isLegacy:](self, "getResultScore:section:isLegacy:", v33, v11, 0);
        *((_DWORD *)&v216 + v30++) = v35;
      }
      while (v32 != v30);
      l3ScoreLegacy = self->l3ScoreLegacy;
      v37 = (float *)&v216;
      v38 = (float *)&v218;
      v39 = (float *)&computeScore_rankingConfig_hasGoodLocalResult_pos_queryContext__positionDiscount;
      v40 = 1.0;
      v41 = 1.0;
      v42 = v185;
      do
      {
        if (*v38 >= 0.0)
        {
          v41 = (1.0 - (float)(*v38 * *v39)) * v41;
          *l3ScoreLegacy = 1.0 - v41;
        }
        if (*v37 >= 0.0)
        {
          v40 = (1.0 - (float)(*v37 * *v39)) * v40;
          *(l3ScoreLegacy - 3) = 1.0 - v40;
        }
        if (v42)
        {
          objc_msgSend(v42, "floatValue");
          self->_iFunScore = v43;
          if (*l3ScoreLegacy > 0.0)
            *l3ScoreLegacy = v43 * *l3ScoreLegacy;
          v44 = *(l3ScoreLegacy - 3);
          v42 = v185;
          if (v44 > 0.0)
            *(l3ScoreLegacy - 3) = v44 * self->_iFunScore;
        }
        ++l3ScoreLegacy;
        ++v39;
        ++v37;
        ++v38;
        --v32;
      }
      while (v32);
      v13 = (void *)v33;
    }
    if (objc_msgSend(v11, "domain") == 2)
    {
      objc_msgSend(v184, "serverRelevanceScores");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        v47 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.parsec.web_index"));

        if (v47)
        {
          v48 = v13;
          v201 = 0u;
          v202 = 0u;
          v199 = 0u;
          v200 = 0u;
          objc_msgSend(v11, "results");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v199, v215, 16);
          if (v50)
          {
            v51 = v50;
            v179 = v16;
            v180 = v11;
            v52 = self;
            v53 = 0;
            v54 = *(_QWORD *)v200;
            v55 = v48;
            while (2)
            {
              v56 = 0;
              v57 = v53;
              v191 = v53 + v51;
              v58 = v55;
              do
              {
                if (*(_QWORD *)v200 != v54)
                  objc_enumerationMutation(v49);
                v55 = *(id *)(*((_QWORD *)&v199 + 1) + 8 * v56);

                objc_msgSend(v184, "serverRelevanceScores");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "identifier");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "objectForKey:", v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();

                if (v61)
                {
                  if (!(_DWORD)v57)
                  {
                    objc_msgSend(v61, "floatValue");
                    v52->_serverRelevanceScore = v62;
                  }
                  objc_msgSend(v61, "floatValue");
                  v64 = v63;
                  objc_msgSend(v184, "serverRelevanceScoreThreshold");
                  if (v64 < v65 && v193)
                  {
                    self = v52;
                    memset_pattern16(v52->l3Score, &unk_1B87DEF50, 0xCuLL);
                    *(_QWORD *)v52->l3ScoreLegacy = 0x80000000800000;
                    v52->l3ScoreLegacy[2] = -3.4028e38;
                    v11 = v180;
                    objc_msgSend(v180, "results");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v67, "count") - v57;

                    objc_msgSend(v180, "resultSet");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "removeObjectsInRange:", v57, v68);

                    SSGeneralLog();
                    v70 = objc_claimAutoreleasedReturnValue();
                    v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
                    v48 = v61;
                    if (v71)
                    {
                      objc_msgSend(v184, "serverRelevanceScoreThreshold");
                      *(_DWORD *)buf = 138412802;
                      v210 = v61;
                      v211 = 2048;
                      v212 = v72;
                      v213 = 1024;
                      v214 = v57;
                      _os_log_impl(&dword_1B86C5000, v70, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: website relevance score %@ < threshold %f, filter results starting from index %i", buf, 0x1Cu);
                    }

                    goto LABEL_59;
                  }
                }

                ++v56;
                ++v57;
                v58 = v55;
              }
              while (v51 != v56);
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v199, v215, 16);
              v53 = v191;
              if (v51)
                continue;
              break;
            }
            v48 = v55;
            v55 = 0;
            v11 = v180;
            self = v52;
LABEL_59:
            v16 = v179;
          }
          else
          {
            v55 = 0;
          }

          v13 = v55;
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v16, CFSTR("section_bundle_id"));
    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    objc_msgSend(v11, "resultSet");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v208, 16);
    if (v192)
    {
      v178 = v13;
      v181 = v11;
      v73 = 0;
      v74 = 0;
      v194 = 0;
      v189 = *(_QWORD *)v196;
      v190 = 0;
      v75 = 0.0;
      v76 = 0.0;
      v77 = 0.0;
      v78 = 0.0;
      do
      {
        v79 = 0;
        v186 = v73;
        do
        {
          if (*(_QWORD *)v196 != v189)
            objc_enumerationMutation(obj);
          v80 = v73 + v79;
          v81 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * v79);
          if ((int)v73 + (int)v79 <= 2)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v195 + 1) + 8 * v79), "topHit"))
              v82 = &unk_1E6E976F8;
            else
              v82 = &unk_1E6E97710;
            v188 = v74;
            v83 = self;
            features = self->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_is_tophit_%d"), v73 + v79);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v82, v85);

            if (objc_msgSend(v81, "topHit"))
              v86 = 1;
            else
              v86 = HIDWORD(v190);
            HIDWORD(v190) = v86;
            v87 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "l2Score");
            objc_msgSend(v87, "numberWithFloat:");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_pommesL2Score_%d"), v80);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v90, "setObject:forKeyedSubscript:", v89, v91);

            v92 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "keywordMatchScore");
            objc_msgSend(v92, "numberWithFloat:");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_topicalityScore_%d"), v80);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v95, "setObject:forKeyedSubscript:", v94, v96);

            v97 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "freshnessScore");
            *(float *)&v99 = v99;
            objc_msgSend(v97, "numberWithFloat:", v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_freshness_%d"), v80);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v101, "setObject:forKeyedSubscript:", v100, v102);

            v103 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "engagementScore");
            *(float *)&v105 = v105;
            objc_msgSend(v103, "numberWithFloat:", v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_engagementScore_%d"), v80);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v106, v108);

            v109 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "likelihood");
            *(float *)&v111 = v111;
            objc_msgSend(v109, "numberWithFloat:", v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_predictedLikelihoodOfEngagement_%d"), v80);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v113, "setObject:forKeyedSubscript:", v112, v114);

            v115 = (void *)MEMORY[0x1E0CB37E8];
            v116 = objc_msgSend(v81, "topHit");
            v117 = 1.0;
            if (!v116)
              v117 = 0.0;
            objc_msgSend(v115, "numberWithDouble:", v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_wasNominatedAsTopHit_%d"), v80);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v119, "setObject:forKeyedSubscript:", v118, v120);

            v121 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v122, "exactMatchedLaunchString"))
              *(float *)&v123 = 1.0;
            else
              *(float *)&v123 = 0.0;
            objc_msgSend(v121, "numberWithFloat:", v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_isExactMatchOfLaunchString_%d"), v80);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v125, "setObject:forKeyedSubscript:", v124, v126);

            v127 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v128, "wasEngagedInSpotlight"))
              *(float *)&v129 = 1.0;
            else
              *(float *)&v129 = 0.0;
            objc_msgSend(v127, "numberWithFloat:", v129);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_wasEngagedInSpotlight_%d"), v80);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v131, "setObject:forKeyedSubscript:", v130, v132);

            v133 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "rankingItem");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "L2FeatureVector");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "originalL2Score");
            objc_msgSend(v133, "numberWithFloat:");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = v83->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_originalL2Score_%d"), v80);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = v137;
            v73 = v186;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v139, "setObject:forKeyedSubscript:", v136, v138);

            self = v83;
            v74 = v188;

            v140 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v81, "l2score");
            objc_msgSend(v140, "numberWithFloat:");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = self->_features;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("results_top3_l2Score_%d"), v80);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v142, "setObject:forKeyedSubscript:", v141, v143);

          }
          if (objc_msgSend(v81, "topHit") == 1)
          {
            ++v74;
          }
          else
          {
            v144 = objc_msgSend(v81, "topHit");
            v145 = v190;
            if (v144 == 2)
              v145 = v190 + 1;
            LODWORD(v190) = v145;
          }
          v194 += +[SSTopHitNominationManager passLikelihoodForTopHitCandidate:](SSTopHitNominationManager, "passLikelihoodForTopHitCandidate:", v81);
          objc_msgSend(v81, "rankingItem");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "likelihood");
          v148 = v147;

          if (v148 > v75)
            v75 = v148;
          objc_msgSend(v81, "rankingItem");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "keywordMatchScore");
          v151 = v150;

          if (v76 < v151)
            v76 = v151;
          objc_msgSend(v81, "rankingItem");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "L2FeatureVector");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "originalL2Score");
          v155 = v154;

          if (v77 < v155)
            v77 = v155;
          objc_msgSend(v81, "l2score");
          if (v78 < v156)
            v78 = v156;
          ++v79;
        }
        while (v192 != v79);
        v73 = (v73 + v79);
        v192 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v208, 16);
      }
      while (v192);
      v157 = (float)v194;
      v11 = v181;
      v13 = v178;
    }
    else
    {
      v190 = 0;
      v74 = 0;
      v157 = 0.0;
      v75 = 0.0;
      v76 = 0.0;
      v77 = 0.0;
      v78 = 0.0;
    }

    v12 = v183;
    if (objc_msgSend(v11, "domain") == 2)
    {
      *(float *)&v158 = (float)v182;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v159, CFSTR("server_section_dpos"));

    }
    *(float *)&v158 = (float)SHIDWORD(v190);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v158);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v160, CFSTR("section_is_tophit"));

    *(float *)&v161 = (float)v74;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v162, CFSTR("section_tophit_should_be_count"));

    *(float *)&v163 = (float)(int)v190;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v164, CFSTR("section_tophit_must_be_count"));

    *(float *)&v165 = v157;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v166, CFSTR("score_over_th_threshold_count"));

    *(float *)&v167 = v75;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v168, CFSTR("max_likelihood"));

    *(float *)&v169 = v76;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v170, CFSTR("max_topicality"));

    *(float *)&v171 = v77;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v172, CFSTR("max_original_l2_score"));

    *(float *)&v173 = v78;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v174, CFSTR("max_l2_score"));

    v175 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v185, "floatValue");
    objc_msgSend(v175, "numberWithFloat:");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_features, "setObject:forKeyedSubscript:", v176, CFSTR("ifun_score"));

    v17 = v207 != 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)getIFunScore:(id)a3 rankingConfig:(id)a4 isLocal:(BOOL)a5 result:(id)a6 queryContext:(id)a7 isQUIntent:(BOOL *)a8
{
  _BOOL4 v11;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  const __CFString *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v11 = a5;
  v13 = (__CFString *)a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.spotlight.contacts")) & 1) != 0
    || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.contacts")) & 1) != 0)
  {
    v17 = CFSTR("com.apple.MobileAddressBook");
LABEL_4:

    v13 = (__CFString *)v17;
    goto LABEL_5;
  }
  if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0)
  {
    v17 = CFSTR("com.apple.calculator");
    goto LABEL_4;
  }
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    v17 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
    goto LABEL_4;
  }
LABEL_5:
  if (isQUIntentMatchBundle(objc_msgSend(v16, "intentFromQU"), v13))
  {
    *a8 = 1;
    v18 = &unk_1E6E9A1A0;
    goto LABEL_200;
  }
  v19 = v13;
  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.unknown"), 3))
  {
    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.applications"), 3))
    {
      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.bookmarks"), 3))
      {
        v20 = 3;
        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.calculator"), 3))
        {
          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.calendar"), 3))
          {
            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.coresuggestions"), 3))
            {
              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.developer"), 3))
              {
                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.dictionary"), 3))
                {
                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.directories"), 3))
                  {
                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.documents"), 3))
                    {
                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.ibooks"), 3))
                      {
                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.keynote"), 3))
                        {
                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mail"), 3))
                          {
                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobiletimer"), 3))
                            {
                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.news"), 3))
                              {
                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.numbers"), 3))
                                {
                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.other"), 3))
                                  {
                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.pdfs"), 3))
                                    {
                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.photos"), 3))
                                      {
                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.reminders"), 3))
                                        {
                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.settings"), 3))
                                          {
                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.voicememos"), 3))
                                            {
                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.application"), 3))
                                              {
                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.itunes.iossoftware"), 3))
                                                {
                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.getdropbox.dropbox"), 3))
                                                  {
                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.flights"), 3))
                                                    {
                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.giphy.giphyformessenger"), 3))
                                                      {
                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.google.chrome.ios"), 3))
                                                        {
                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.google.maps"), 3))
                                                          {
                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.google.photos"), 3))
                                                            {
                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.groupon.grouponapp"), 3))
                                                              {
                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.kg"), 3))
                                                                {
                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.linkedin.linkedin"), 3))
                                                                  {
                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.maps"), 3))
                                                                    {
                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.maps"), 3))
                                                                      {
                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.itunes.artist"), 3))
                                                                        {
                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.microsoft.office.outlook"), 3))
                                                                          {
                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.mlb.atbatuniversal"), 3))
                                                                            {
                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobileaddressbook"), 3))
                                                                              {
                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobilecal"), 3))
                                                                                {
                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.clouddocs.mobiledocumentsfileprovider"), 3))
                                                                                  {
                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobilemail"), 3))
                                                                                    {
                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobilenotes"), 3))
                                                                                      {
                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobilesafari"), 3))
                                                                                        {
                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.mobilesms"), 3))
                                                                                          {
                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.movies"), 3))
                                                                                            {
                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.music"), 3))
                                                                                              {
                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.news"), 3))
                                                                                                {
                                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.other:search_app_store"), 3))
                                                                                                  {
                                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.other:search_maps"), 3))
                                                                                                    {
                                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.other:search_web"), 3))
                                                                                                      {
                                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.other:taptoradar"), 3))
                                                                                                        {
                                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.pandora"), 3))
                                                                                                          {
                                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("pinterest"), 3))
                                                                                                            {
                                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.podcasts"), 3))
                                                                                                              {
                                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.preferences"), 3))
                                                                                                                {
                                                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.spotlight.related_search"), 3))
                                                                                                                  {
                                                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.riffsy.riffsykeyboard"), 3))
                                                                                                                    {
                                                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.sports"), 3))
                                                                                                                      {
                                                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.contact"), 3))
                                                                                                                        {
                                                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.local"), 3))
                                                                                                                          {
                                                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.usertypedstring"), 3))
                                                                                                                            {
                                                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.stocks"), 3))
                                                                                                                              {
                                                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.stocks"), 3))
                                                                                                                                {
                                                                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.stubhub.stubhub"), 3))
                                                                                                                                  {
                                                                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.searchd.suggestions"), 3))
                                                                                                                                    {
                                                                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.spotlight.suggestionlist.parsec"), 3))
                                                                                                                                      {
                                                                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.taptoradar"), 3))
                                                                                                                                        {
                                                                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.tv.tvshow"), 3))
                                                                                                                                          {
                                                                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.atebits.tweetie2"), 3))
                                                                                                                                            {
                                                                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("tv.twitch"), 3))
                                                                                                                                              {
                                                                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.weather"), 3))
                                                                                                                                                {
                                                                                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.weather"), 3))
                                                                                                                                                  {
                                                                                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.web_answer"), 3))
                                                                                                                                                    {
                                                                                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.web_images"), 3))
                                                                                                                                                      {
                                                                                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.web_index"), 3))
                                                                                                                                                        {
                                                                                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                                                          {
                                                                                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("net.whatsapp.whatsapp"), 3))
                                                                                                                                                            {
                                                                                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.yahoo.aerogram"), 3))
                                                                                                                                                              {
                                                                                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.yelp.yelpiphone"), 3))
                                                                                                                                                                {
                                                                                                                                                                  if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.google.ios.youtube"), 3))
                                                                                                                                                                  {
                                                                                                                                                                    if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.zillow.zillowmap"), 3))
                                                                                                                                                                    {
                                                                                                                                                                      if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.parsec.dictionary"), 3))
                                                                                                                                                                      {
                                                                                                                                                                        if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.shortcuts"), 3))
                                                                                                                                                                        {
                                                                                                                                                                          if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.tips"), 3))
                                                                                                                                                                          {
                                                                                                                                                                            if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.health"), 3))
                                                                                                                                                                            {
                                                                                                                                                                              if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.systempreferences"), 3))
                                                                                                                                                                              {
                                                                                                                                                                                if (-[__CFString compare:options:](v19, "compare:options:", CFSTR("com.apple.conversion"), 3))
                                                                                                                                                                                  v20 = 0;
                                                                                                                                                                                else
                                                                                                                                                                                  v20 = 87;
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v20 = 86;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              v20 = 85;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v20 = 84;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v20 = 83;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        v20 = 82;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v20 = 81;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v20 = 80;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  v20 = 79;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v20 = 78;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v20 = 77;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            v20 = 76;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v20 = 75;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v20 = 74;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      v20 = 73;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v20 = 72;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  v20 = 71;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v20 = 70;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v20 = 69;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            v20 = 68;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v20 = 67;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v20 = 66;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v20 = 65;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v20 = 64;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v20 = 63;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v20 = 62;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v20 = 61;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v20 = 60;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v20 = 59;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v20 = 58;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v20 = 57;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v20 = 56;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v20 = 55;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v20 = 54;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v20 = 53;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v20 = 52;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v20 = 51;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v20 = 50;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v20 = 49;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v20 = 48;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v20 = 47;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v20 = 46;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v20 = 45;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v20 = 44;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v20 = 43;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v20 = 42;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v20 = 41;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v20 = 40;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v20 = 39;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v20 = 38;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v20 = 37;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v20 = 36;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v20 = 35;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v20 = 34;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v20 = 33;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v20 = 32;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v20 = 31;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v20 = 30;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v20 = 29;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v20 = 28;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v20 = 27;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v20 = 26;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v20 = 25;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v20 = 24;
                                                  }
                                                }
                                                else
                                                {
                                                  v20 = 23;
                                                }
                                              }
                                              else
                                              {
                                                v20 = 22;
                                              }
                                            }
                                            else
                                            {
                                              v20 = 21;
                                            }
                                          }
                                          else
                                          {
                                            v20 = 20;
                                          }
                                        }
                                        else
                                        {
                                          v20 = 19;
                                        }
                                      }
                                      else
                                      {
                                        v20 = 18;
                                      }
                                    }
                                    else
                                    {
                                      v20 = 17;
                                    }
                                  }
                                  else
                                  {
                                    v20 = 16;
                                  }
                                }
                                else
                                {
                                  v20 = 15;
                                }
                              }
                              else
                              {
                                v20 = 14;
                              }
                            }
                            else
                            {
                              v20 = 13;
                            }
                          }
                          else
                          {
                            v20 = 12;
                          }
                        }
                        else
                        {
                          v20 = 11;
                        }
                      }
                      else
                      {
                        v20 = 10;
                      }
                    }
                    else
                    {
                      v20 = 9;
                    }
                  }
                  else
                  {
                    v20 = 8;
                  }
                }
                else
                {
                  v20 = 7;
                }
              }
              else
              {
                v20 = 6;
              }
            }
            else
            {
              v20 = 5;
            }
          }
          else
          {
            v20 = 4;
          }
        }
      }
      else
      {
        v20 = 2;
      }
    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(v14, "iFunScores");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainScores");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (v11)
    {
      objc_msgSend(v15, "rankingItem");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v15, "rankingItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "keywordMatchScore");
        if (v27 <= 0.0)
        {

        }
        else
        {
          objc_msgSend(v15, "rankingItem");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sectionBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.tips"));

          if ((v30 & 1) == 0)
          {
            objc_msgSend(v14, "iFunScores");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "localScore");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v14, "iFunScores");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "localScore");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_200;
            }
LABEL_198:
            v18 = &unk_1E6E9A420;
            goto LABEL_200;
          }
        }
      }
    }
    objc_msgSend(v14, "iFunScores");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v18 = 0;
      goto LABEL_200;
    }
    if ((_DWORD)v20 != 34)
      goto LABEL_198;
    objc_msgSend(v14, "iFunScores");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "domainScores");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", &unk_1E6E97728);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_198;
  }
LABEL_200:

  return v18;
}

+ (void)getComparableL3Score:(id)a3 sectionMapping:(id)a4 bundleId1:(id)a5 bundleId2:(id)a6 score1:(float *)a7 score2:(float *)a8 usePommesScore:(BOOL)a9 useLegacyScore:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  float *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  float *v34;
  void *v35;
  id v36;

  v36 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (SSEnableSpotlightFullPageRanking())
  {
    objc_msgSend(v36, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (!v18 || !v19)
      goto LABEL_21;
    v34 = a8;
    objc_msgSend(v15, "objectForKey:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v22;
    if (objc_msgSend(v21, "resultsCount") && objc_msgSend(v22, "resultsCount"))
    {
      v23 = objc_msgSend(v21, "resultsCount");
      v33 = v21;
      v24 = a7;
      v25 = v23;
      v26 = objc_msgSend(v22, "resultsCount");
      if (v25 >= v26)
        v27 = v26;
      else
        v27 = v25;
      a7 = v24;
      v21 = v33;
      if (v27 >= 3)
        LODWORD(v27) = 3;
      v28 = (v27 - 1);
      if (!a9)
        goto LABEL_16;
    }
    else
    {
      v28 = 0;
      if (!a9)
        goto LABEL_16;
    }
    objc_msgSend(v18, "getL3Score:isLegacy:", v28, 0);
    v30 = v29;
    objc_msgSend(v20, "getL3Score:isLegacy:", v28, 0);
    if (v30 >= 0.0 && v31 >= 0.0)
    {
LABEL_19:
      *a7 = v30;
      *v34 = v31;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
LABEL_16:
    if (!a10)
      goto LABEL_20;
    objc_msgSend(v18, "getL3Score:isLegacy:", v28, 1);
    v30 = v32;
    objc_msgSend(v20, "getL3Score:isLegacy:", v28, 1);
    if (v30 < 0.0 || v31 < 0.0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_22:

}

+ (void)getComparableModelL3Score:(id)a3 bundleId1:(id)a4 bundleId2:(id)a5 score1:(float *)a6 score2:(float *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  int v18;
  int v19;
  id v20;

  v20 = a3;
  v11 = a4;
  v12 = a5;
  if (SSEnableSpotlightFullPageRanking())
  {
    objc_msgSend(v20, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
    {
      if (v14)
      {
        objc_msgSend(v13, "modelScore");
        if (v16 >= 0.0)
        {
          objc_msgSend(v15, "modelScore");
          if (v17 >= 0.0)
          {
            objc_msgSend(v13, "modelScore");
            *(_DWORD *)a6 = v18;
            objc_msgSend(v15, "modelScore");
            *(_DWORD *)a7 = v19;
          }
        }
      }
    }

  }
}

- (float)iFunScore
{
  return self->_iFunScore;
}

- (void)setIFunScore:(float)a3
{
  self->_iFunScore = a3;
}

- (float)serverRelevanceScore
{
  return self->_serverRelevanceScore;
}

- (void)setServerRelevanceScore:(float)a3
{
  self->_serverRelevanceScore = a3;
}

- (NSMutableDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (float)modelScore
{
  return self->_modelScore;
}

- (void)setModelScore:(float)a3
{
  self->_modelScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
