@implementation PGSocialGroupsQuestionFactory

+ (void)enumerateSocialGroupsWithGraph:(id)a3 withLinkage:(unint64_t)a4 validGroupsBlock:(id)a5 invalidGroupsBlock:(id)a6 averageWeight:(float *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  uint64_t i;
  void *v27;
  float v28;
  float v29;
  int v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  uint64_t j;
  void *v42;
  float v43;
  float v44;
  int v45;
  unint64_t v46;
  float v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  float v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  float v59;
  float v60;
  double v61;
  double v62;
  double v63;
  float v64;
  float v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  id v84;
  id v85;
  id v86;
  unint64_t v87;
  double v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  unint64_t v93;
  unint64_t v94;
  double v95;
  double v96;
  unint64_t v97;
  double v98;
  float v99;
  float v100;
  float v101;
  float v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  unint64_t v118;
  unint64_t v119;
  void *v120;
  unint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  float v127;
  float v128;
  float v129;
  void *v130;
  float v131;
  float v132;
  void *v133;
  float v134;
  float v135;
  void *v136;
  float v137;
  float v138;
  void *v139;
  float v140;
  float v141;
  void *v142;
  float v143;
  float v144;
  void *v145;
  float v146;
  float v147;
  void *v148;
  unsigned int v149;
  unsigned int v150;
  void *v151;
  unsigned int v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  float v161;
  float v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  id v176;
  id v177;
  id v178;
  float v179;
  void (**v180)(id, void *, void *, void *, void *, float, double, float, float, float, float, float, float, double);
  id v181;
  id v182;
  id v183;
  id obj;
  uint64_t v185;
  int v186;
  int v187;
  void *v188;
  uint64_t v189;
  void *v190;
  id v191;
  id v192;
  id v193;
  void *v194;
  void *v195;
  id v196;
  void *v197;
  unint64_t v198;
  void *v199;
  unint64_t v200;
  void *v201;
  float v202;
  float v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t k;
  void *v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  _QWORD v227[4];
  id v228;
  id v229;
  id v230;
  id v231;
  uint64_t *v232;
  uint64_t *v233;
  uint64_t *v234;
  uint64_t v235;
  uint64_t *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  float *v240;
  uint64_t v241;
  int v242;
  uint64_t v243;
  float *v244;
  uint64_t v245;
  int v246;
  _QWORD v247[3];
  _QWORD v248[14];
  _QWORD v249[14];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  uint64_t v253;

  v253 = *MEMORY[0x1E0C80C00];
  v196 = a3;
  v180 = (void (**)(id, void *, void *, void *, void *, float, double, float, float, float, float, float, float, double))a5;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v243 = 0;
  v244 = (float *)&v243;
  v245 = 0x2020000000;
  v246 = 0;
  v239 = 0;
  v240 = (float *)&v239;
  v241 = 0x2020000000;
  v242 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v235 = 0;
  v236 = &v235;
  v237 = 0x2020000000;
  v238 = 0;
  v14 = (void *)objc_opt_class();
  v227[0] = MEMORY[0x1E0C809B0];
  v227[1] = 3221225472;
  v227[2] = __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v227[3] = &unk_1E84332D8;
  v232 = &v235;
  v233 = &v243;
  v234 = &v239;
  v178 = v12;
  v228 = v178;
  v177 = v13;
  v229 = v177;
  v181 = v10;
  v231 = v181;
  v176 = v11;
  v230 = v176;
  objc_msgSend(v14, "enumeratePeopleClustersWithGraph:withLinkage:withBlock:", v196, a4, v227);
  v15 = v236[3];
  if (!v15)
    goto LABEL_71;
  v244[6] = v244[6] / (float)v15;
  objc_msgSend(v178, "sortedArrayUsingComparator:", &__block_literal_global_58885);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v16);
  objc_msgSend(v17, "mean");
  v19 = v18;
  v174 = v17;
  objc_msgSend(v17, "standardDeviation");
  v21 = v20;
  v193 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  obj = v16;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v223, v252, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v224;
    v24 = v19 - v21;
    v25 = v19 + v21;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v224 != v23)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * i);
        objc_msgSend(v27, "floatValue");
        if (v28 >= v24)
        {
          objc_msgSend(v27, "floatValue");
          if (v29 <= v25)
            objc_msgSend(v193, "addObject:", v27);
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v223, v252, 16);
    }
    while (v22);
  }

  v173 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v193);
  objc_msgSend(v173, "mean");
  v187 = v30;
  objc_msgSend(v177, "sortedArrayUsingComparator:", &__block_literal_global_230_58887);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v31);
  objc_msgSend(v32, "mean");
  v34 = v33;
  v172 = v32;
  objc_msgSend(v32, "standardDeviation");
  v36 = v35;
  v192 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v183 = v31;
  v37 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v219, v251, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v220;
    v39 = v34 - v36;
    v40 = v34 + v36;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v220 != v38)
          objc_enumerationMutation(v183);
        v42 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * j);
        objc_msgSend(v42, "floatValue");
        if (v43 >= v39)
        {
          objc_msgSend(v42, "floatValue");
          if (v44 <= v40)
            objc_msgSend(v192, "addObject:", v42);
        }
      }
      v37 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v219, v251, 16);
    }
    while (v37);
  }

  v171 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v192);
  objc_msgSend(v171, "mean");
  v186 = v45;
  v46 = v236[3];
  if (v46 > 0xC7)
    v47 = -0.1;
  else
    v47 = (float)((float)((float)v46 / 200.0) * 0.5) + -0.1;
  v179 = v47;
  v191 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v182 = v176;
  v189 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v215, v250, 16);
  if (v189)
  {
    v185 = *(_QWORD *)v216;
    do
    {
      for (k = 0; k != v189; ++k)
      {
        if (*(_QWORD *)v216 != v185)
          objc_enumerationMutation(v182);
        v48 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * k);
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("personNodes"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("momentNodes"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("frequency"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "floatValue");
        v54 = v53;

        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("superGroupMomentNodes"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v56 = (float)(unint64_t)objc_msgSend(v51, "count");
        LODWORD(v57) = v187;
        LODWORD(v58) = 1060320051;
        objc_msgSend(v196, "normalizeFeatureValue:average:featureValues:factor:", v193, v56, v57, v58);
        v60 = v59;
        *(float *)&v61 = (float)(unint64_t)objc_msgSend(v55, "count");
        LODWORD(v62) = v186;
        LODWORD(v63) = 1060320051;
        objc_msgSend(v196, "normalizeFeatureValue:average:featureValues:factor:", v192, v61, v62, v63);
        v65 = v64;
        objc_msgSend(v196, "averageTopMomentTimes:numberOfMoments:", v55, 3);
        v67 = v66;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "timeIntervalSince1970");
        v70 = v69;
        v208 = v55;

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "dateByAddingTimeInterval:", -157680000.0);
        v210 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v210, "timeIntervalSince1970");
        v73 = v72;
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("distribution"));
        v74 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v74, "objectForKeyedSubscript:", CFSTR("relationshipsDistribution"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = (void *)v74;
        objc_msgSend(v75, "objectForKey:", CFSTR("FAMILY"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v75;
        LOBYTE(v74) = v76 == 0;

        if ((v74 & 1) != 0)
        {
          v79 = 0.0;
        }
        else
        {
          objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("FAMILY"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "floatValue");
          v79 = v78;

        }
        v80 = (v67 - v73) / (v70 - v73);
        v81 = tanh((float)(v79 * 3.0));
        v82 = -(float)(v81 - (float)(v79 * 2.0));
        if (v82 < 0.0)
          v82 = 0.0;
        if (v82 <= 1.0)
          v83 = v82;
        else
          v83 = 1.0;
        v84 = v49;
        v85 = v50;
        v86 = v51;
        v87 = 0;
        v88 = 0.0;
        while (v87 < objc_msgSend(v84, "count"))
        {
          objc_msgSend(v84, "objectAtIndexedSubscript:", v87);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectAtIndexedSubscript:", v87);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "doubleValue");
          v92 = v91;

          v93 = objc_msgSend(v89, "numberOfMomentNodes");
          if (v93)
          {
            v94 = objc_msgSend(v86, "count");
            v95 = -((double)v94 * v92 - (double)v93);
            if (-((double)v93 - (double)v94 * v92) >= 0.0)
              v95 = -((double)v93 - (double)v94 * v92);
            v96 = v95 / (double)v93;
          }
          else
          {
            v96 = 0.0;
          }

          v88 = v88 + v96;
          ++v87;
        }
        v97 = objc_msgSend(v84, "count");

        v98 = 1.0 - v88 / (double)v97;
        v99 = v98;
        v100 = (float)((float)((float)((float)((float)((float)(v65 * 0.3) + (float)(v60 * 0.7)) + (float)(v80 * 0.0))
                                     + (float)(v83 * 0.0))
                             + 0.0)
                     + (float)(v99 * 0.0))
             + 0.0;
        v101 = v54 / v240[6];
        v248[0] = CFSTR("personNodes");
        v248[1] = CFSTR("peopleWeights");
        if (v100 >= 1.0)
          v102 = (float)((float)(1.0 - v101) * -0.01) + 1.0;
        else
          v102 = v100;
        v249[0] = v84;
        v249[1] = v85;
        v248[2] = CFSTR("momentNodes");
        v248[3] = CFSTR("superGroupMomentNodes");
        v249[2] = v86;
        v249[3] = v208;
        v248[4] = CFSTR("socialGroupWeight");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        v249[4] = v206;
        v248[5] = CFSTR("groupCohesionScore");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v98);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v249[5] = v204;
        v248[6] = CFSTR("frequency");
        *(float *)&v103 = v54;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v103);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v249[6] = v201;
        v248[7] = CFSTR("avgFrequency");
        *(float *)&v104 = v244[6];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v104);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        v249[7] = v199;
        v248[8] = CFSTR("exclusiveMomentCountFeature");
        *(float *)&v105 = v60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v249[8] = v106;
        v248[9] = CFSTR("superGroupMomentCountFeature");
        *(float *)&v107 = v65;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v249[9] = v108;
        v248[10] = CFSTR("familyDistributionFeature");
        *(float *)&v109 = v83;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v249[10] = v110;
        v248[11] = CFSTR("semanticCohesionFeature");
        LODWORD(v111) = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v249[11] = v112;
        v248[12] = CFSTR("recencyFeature");
        *(float *)&v113 = v80;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v249[12] = v114;
        v248[13] = CFSTR("ranking");
        *(float *)&v115 = v102;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v249[13] = v116;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v249, v248, 14);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "addObject:", v117);

      }
      v189 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v215, v250, 16);
    }
    while (v189);
  }

  v118 = v236[3];
  if (v118 <= 0xC7)
    v119 = (unint64_t)(tanh((float)((float)((float)v118 / 200.0) * 3.0)) * 15.0);
  else
    v119 = 15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("ranking"), 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("socialGroupWeight"), 0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("superGroupMomentCountFeature"), 0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v247[0] = v195;
  v247[1] = v190;
  v247[2] = v188;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v247, 3);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "sortUsingDescriptors:", v120);

  v121 = 0;
  v122 = 5;
  if (v119 > 5)
    v122 = v119;
  v198 = v122;
  v200 = 2 * v122;
  while (v121 < objc_msgSend(v191, "count"))
  {
    objc_msgSend(v191, "objectAtIndexedSubscript:", v121);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123;
    if (v180)
    {
      objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("ranking"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "floatValue");
      if (v126 >= v179)
      {

        if (v121 < v198)
        {
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("personNodes"));
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("momentNodes"));
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("superGroupMomentNodes"));
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("socialGroupWeight"));
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "floatValue");
          v202 = v127;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("groupCohesionScore"));
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "floatValue");
          v129 = v128;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("frequency"));
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "floatValue");
          v132 = v131;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("avgFrequency"));
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "floatValue");
          v135 = v134;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("exclusiveMomentCountFeature"));
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "floatValue");
          v138 = v137;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("superGroupMomentCountFeature"));
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "floatValue");
          v141 = v140;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("familyDistributionFeature"));
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "floatValue");
          v144 = v143;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("semanticCohesionFeature"));
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "floatValue");
          v147 = v146;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("recencyFeature"));
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "floatValue");
          v150 = v149;
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("ranking"));
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "floatValue");
          v180[2](v180, v207, v205, v211, v209, v202, v129, v132, v135, v138, v141, v144, v147, COERCE_DOUBLE(__PAIR64__(v152, v150)));
LABEL_66:

          goto LABEL_67;
        }
      }
      else
      {

      }
    }
    if (v181 && v121 < v200)
    {
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("personNodes"));
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("momentNodes"));
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("superGroupMomentNodes"));
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("socialGroupWeight"));
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "floatValue");
      v203 = v153;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("groupCohesionScore"));
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "floatValue");
      v155 = v154;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("frequency"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "floatValue");
      v157 = v156;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("avgFrequency"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "floatValue");
      v159 = v158;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("exclusiveMomentCountFeature"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "floatValue");
      v161 = v160;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("superGroupMomentCountFeature"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "floatValue");
      v163 = v162;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("familyDistributionFeature"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "floatValue");
      v165 = v164;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("semanticCohesionFeature"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "floatValue");
      v167 = v166;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("recencyFeature"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "floatValue");
      v169 = v168;
      objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("ranking"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "floatValue");
      (*((void (**)(id, void *, void *, void *, void *, float, double, float, float, float, float, float, float, double))v181
       + 2))(v181, v207, v205, v211, v209, v203, v155, v157, v159, v161, v163, v165, v167, COERCE_DOUBLE(__PAIR64__(v170, v169)));
      goto LABEL_66;
    }
LABEL_67:

    ++v121;
  }
  if (a7)
    *a7 = v244[6] / v240[6];

LABEL_71:
  _Block_object_dispose(&v235, 8);

  _Block_object_dispose(&v239, 8);
  _Block_object_dispose(&v243, 8);

}

+ (void)enumeratePeopleClustersWithGraph:(id)a3 withLinkage:(unint64_t)a4 withBlock:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  float v55;
  float v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  int v70;
  unint64_t v71;
  float v72;
  uint64_t v73;
  uint64_t v74;
  void *context;
  void *v76;
  id v77;
  id v78;
  void (**v79)(id, id, id, id, id, _BYTE *, float);
  uint64_t v80;
  id obj;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  unsigned __int8 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  id v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD v134[4];
  id v135;
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD *v139;
  _QWORD v140[4];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _QWORD v148[5];

  v148[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v79 = (void (**)(id, id, id, id, id, _BYTE *, float))a5;
  objc_msgSend(v7, "_checkCanRead");
  objc_msgSend(v7, "meNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "relevantMomentNodesForSocialGroupProcessing");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x2020000000;
  v140[3] = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = MEMORY[0x1E0C809B0];
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke;
  v137[3] = &unk_1E8433360;
  v12 = v10;
  v138 = v12;
  v139 = v140;
  objc_msgSend(v84, "enumerateObjectsUsingBlock:", v137);
  v134[0] = v11;
  v134[1] = 3221225472;
  v134[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3;
  v134[3] = &unk_1E8435398;
  v13 = v12;
  v135 = v13;
  v77 = v8;
  v136 = v77;
  objc_msgSend(v7, "enumerateNodesInDomain:usingBlock:", 300, v134);
  v130 = 0;
  v131 = &v130;
  v132 = 0x2020000000;
  v133 = 0;
  v126[0] = v11;
  v126[1] = 3221225472;
  v126[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4;
  v126[3] = &unk_1E8433478;
  v127 = v13;
  v129 = &v130;
  v85 = v9;
  v128 = v85;
  v78 = v127;
  objc_msgSend(v127, "enumerateKeysAndObjectsUsingBlock:", v126);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("personNodes"), 1, &__block_literal_global_276);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("superGroupMomentNodes"), 0, &__block_literal_global_279_58836);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v83;
  v148[1] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "sortUsingDescriptors:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D717A0]);
  v124[0] = v11;
  v124[1] = 3221225472;
  v124[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_6;
  v124[3] = &unk_1E8433500;
  v86 = v7;
  v125 = v86;
  v16 = (void *)objc_msgSend(v15, "initWithDistanceBlock:", v124);
  objc_msgSend(v16, "setK:", 1);
  objc_msgSend(v16, "setLinkage:", a4);
  if (objc_msgSend(v16, "linkage") == 5)
    objc_msgSend(v16, "setClusterKeyElementBlock:", &__block_literal_global_283_58839);
  if (objc_msgSend(v16, "linkage") == 4)
    objc_msgSend(v16, "setClusterConsolidationBlock:", &__block_literal_global_285);
  objc_msgSend(v16, "setThreshold:", 0.0);
  v76 = v16;
  objc_msgSend(v16, "performWithDataset:progressBlock:", v85, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_287);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v121;
    v73 = *(_QWORD *)v121;
    do
    {
      v80 = 0;
      v74 = v19;
      do
      {
        if (*(_QWORD *)v121 != v20)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v80);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v21, "objects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v92 = v22;
        objc_msgSend(v22, "valueForKey:", CFSTR("momentNodes"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v117;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v117 != v25)
                objc_enumerationMutation(v23);
              objc_msgSend(v91, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i), v73);
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v116, v146, 16);
          }
          while (v24);
        }

        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        objc_msgSend(v92, "valueForKey:", CFSTR("superGroupMomentNodes"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v145, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v113;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v113 != v30)
                objc_enumerationMutation(v28);
              v32 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
              v108 = 0u;
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v33 = v32;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v108, v144, 16);
              if (v34)
              {
                v35 = *(_QWORD *)v109;
                do
                {
                  for (k = 0; k != v34; ++k)
                  {
                    if (*(_QWORD *)v109 != v35)
                      objc_enumerationMutation(v33);
                    if ((objc_msgSend(v27, "containsObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k), v73) & 1) == 0)
                      objc_msgSend(v27, "addObjectsFromArray:", v33);
                  }
                  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v108, v144, 16);
                }
                while (v34);
              }

            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v145, 16);
          }
          while (v29);
        }

        v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v87 = v92;
        v37 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v104, v143, 16);
        if (v37)
        {
          v88 = *(_QWORD *)v105;
          do
          {
            v38 = 0;
            v89 = v37;
            do
            {
              if (*(_QWORD *)v105 != v88)
                objc_enumerationMutation(v87);
              v90 = v38;
              v39 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v38);
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v103 = 0u;
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("personNodes"), v73);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v100, v142, 16);
              if (v41)
              {
                v42 = *(_QWORD *)v101;
                v93 = v40;
                do
                {
                  for (m = 0; m != v41; ++m)
                  {
                    if (*(_QWORD *)v101 != v42)
                      objc_enumerationMutation(v93);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * m), "identifier"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "objectForKeyedSubscript:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v45, "unsignedIntegerValue");

                    v47 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("momentNodes"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "count") + v46);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "setObject:forKeyedSubscript:", v49, v44);

                  }
                  v40 = v93;
                  v41 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v142, 16);
                }
                while (v41);
              }

              v38 = v90 + 1;
            }
            while (v90 + 1 != v89);
            v37 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v104, v143, 16);
          }
          while (v37);
        }

        objc_msgSend(v94, "keysSortedByValueUsingComparator:", &__block_literal_global_290);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v50, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "floatValue");
        v56 = v55;

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v57 = v50;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v141, 16);
        if (v58)
        {
          v59 = *(_QWORD *)v97;
LABEL_49:
          v60 = 0;
          while (1)
          {
            if (*(_QWORD *)v97 != v59)
              objc_enumerationMutation(v57);
            v61 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v60);
            v62 = 0.0;
            if (v56 <= 0.0
              || (objc_msgSend(v94, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v60)),
                  v63 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v63, "doubleValue"),
                  v65 = v64,
                  v63,
                  v62 = v65 / v56,
                  v62 < 0.35))
            {
              if (objc_msgSend(v94, "count", v73) != 1)
                break;
            }
            objc_msgSend(v86, "nodeForIdentifier:", objc_msgSend(v61, "unsignedIntegerValue", v73));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addObject:", v66);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObject:", v67);

            if (v58 == ++v60)
            {
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v141, 16);
              if (v58)
                goto LABEL_49;
              break;
            }
          }
        }

        if (objc_msgSend(v51, "count") == 1)
        {
          objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (unint64_t)objc_msgSend(v68, "numberOfMomentNodes") > 1;

          if (v69)
            goto LABEL_61;
        }
        else if ((unint64_t)objc_msgSend(v27, "count") >= 2)
        {
LABEL_61:
          v71 = objc_msgSend(v27, "count", v73);
          v72 = (float)v71 / (float)(unint64_t)v131[3];
          v95 = 0;
          v79[2](v79, v51, v52, v91, v27, &v95, v72);
          v70 = v95;
          goto LABEL_62;
        }
        v70 = 3;
LABEL_62:

        objc_autoreleasePoolPop(context);
        v20 = v73;
        if (v70 != 3 && v70)
          goto LABEL_66;
        ++v80;
      }
      while (v80 != v74);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
    }
    while (v19);
  }
LABEL_66:

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(v140, 8);

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2;
  v12[3] = &unk_1E8434020;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v11, "enumeratePersonNodesUsingBlock:", v12);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0x3E8uLL;
  }

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "addObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v9, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  uint64_t v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t ii;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t jj;
  uint64_t v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id obj;
  char *obja;
  id objb;
  id objc;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  _QWORD v117[4];
  id v118;
  id v119;
  __int128 v120;
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
  _QWORD v140[4];
  id v141;
  id v142;
  _QWORD v143[7];
  _QWORD v144[7];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _QWORD v150[8];
  _QWORD v151[4];
  _QWORD v152[11];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v83 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v82 = a1;
  v7 = *(void **)(a1 + 32);
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5;
  v140[3] = &unk_1E8433388;
  v8 = v5;
  v141 = v8;
  obj = v6;
  v142 = obj;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v140);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v10 = v8;
  v87 = v10;
  v97 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
  if (v97)
  {
    v95 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v137 != v95)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * i), "collection", v82);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relationshipEdges");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "labels");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v133;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v133 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j);
              objc_msgSend(v9, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                v22 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v9, "objectForKeyedSubscript:", v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "doubleValue");
                objc_msgSend(v22, "numberWithDouble:", v24 + 1.0);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v20);

              }
              else
              {
                objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E84E4D48, v20);
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
          }
          while (v17);
        }

        v10 = v87;
      }
      v97 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
    }
    while (v97);
  }

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(v9, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v129;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v129 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * k);
        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "objectForKeyedSubscript:", v31, v82);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        objc_msgSend(v32, "numberWithDouble:", v34 / (double)(unint64_t)objc_msgSend(v10, "count"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
    }
    while (v28);
  }

  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v96 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v152[0] = CFSTR("Hiking");
  v152[1] = CFSTR("Climbing");
  v152[2] = CFSTR("Beaching");
  v152[3] = CFSTR("Diving");
  v152[4] = CFSTR("WinterSport");
  v152[5] = CFSTR("Entertainment");
  v152[6] = CFSTR("Performance");
  v152[7] = CFSTR("Concert");
  v152[8] = CFSTR("Festival");
  v152[9] = CFSTR("Dance");
  v152[10] = CFSTR("SportEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = CFSTR("Beach");
  v151[1] = CFSTR("Urban");
  v151[2] = CFSTR("Mountain");
  v151[3] = CFSTR("Nature");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = CFSTR("Restaurant");
  v150[1] = CFSTR("AmusementPark");
  v150[2] = CFSTR("Park");
  v150[3] = CFSTR("Culture");
  v150[4] = CFSTR("Nightlife");
  v150[5] = CFSTR("Shopping");
  v150[6] = CFSTR("Travel");
  v150[7] = CFSTR("Entertainment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 8);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v38 = obj;
  v98 = v38;
  v88 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v124, v149, 16);
  if (v88)
  {
    v84 = *(_QWORD *)v125;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v125 != v84)
          objc_enumerationMutation(v38);
        v89 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v39);
        obja = v39;
        objc_msgSend(v89, "meaningLabelsIncludingParents", v82);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v148, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v121;
          do
          {
            for (m = 0; m != v42; ++m)
            {
              if (*(_QWORD *)v121 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * m);
              if (objc_msgSend(v37, "containsObject:", v45))
              {
                objc_msgSend(v36, "objectForKey:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  v47 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v36, "objectForKeyedSubscript:", v45);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "doubleValue");
                  objc_msgSend(v47, "numberWithDouble:", v49 + 1.0);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v50, v45);

                }
                else
                {
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_1E84E4D48, v45);
                }
              }
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v148, 16);
          }
          while (v42);
        }
        v51 = MEMORY[0x1E0C809B0];
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_268;
        v117[3] = &unk_1E8433400;
        v118 = &unk_1E84EA7C8;
        v119 = v36;
        objc_msgSend(v89, "enumerateSceneEdgesAndNodesUsingBlock:", v117);
        v114[0] = v51;
        v114[1] = 3221225472;
        v114[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2_270;
        v114[3] = &unk_1E8433428;
        v115 = v86;
        v116 = v96;
        objc_msgSend(v89, "enumerateROINodesUsingBlock:", v114);
        v111[0] = v51;
        v111[1] = 3221225472;
        v111[2] = __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3_272;
        v111[3] = &unk_1E8433450;
        v112 = v85;
        v113 = v94;
        objc_msgSend(v89, "enumeratePOINodesUsingBlock:", v111);

        v39 = obja + 1;
        v38 = v98;
      }
      while (obja + 1 != (char *)v88);
      v88 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v124, v149, 16);
    }
    while (v88);
  }

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend(v36, "allKeys");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v108;
    do
    {
      for (n = 0; n != v54; ++n)
      {
        if (*(_QWORD *)v108 != v55)
          objc_enumerationMutation(v52);
        v57 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * n);
        v58 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v36, "objectForKeyedSubscript:", v57, v82);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "doubleValue");
        objc_msgSend(v58, "numberWithDouble:", v60 / (double)(unint64_t)objc_msgSend(v98, "count"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v61, v57);

      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
    }
    while (v54);
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  objc_msgSend(v96, "allKeys");
  objb = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v103, v146, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v104;
    do
    {
      for (ii = 0; ii != v63; ++ii)
      {
        if (*(_QWORD *)v104 != v64)
          objc_enumerationMutation(objb);
        v66 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * ii);
        v67 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v96, "objectForKeyedSubscript:", v66, v82);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "doubleValue");
        objc_msgSend(v67, "numberWithDouble:", v69 / (double)(unint64_t)objc_msgSend(v98, "count"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setObject:forKeyedSubscript:", v70, v66);

      }
      v63 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v103, v146, 16);
    }
    while (v63);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend(v94, "allKeys");
  objc = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v99, v145, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v100;
    do
    {
      for (jj = 0; jj != v72; ++jj)
      {
        if (*(_QWORD *)v100 != v73)
          objc_enumerationMutation(objc);
        v75 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * jj);
        v76 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v94, "objectForKeyedSubscript:", v75, v82);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "doubleValue");
        objc_msgSend(v76, "numberWithDouble:", v78 / (double)(unint64_t)objc_msgSend(v98, "count"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKeyedSubscript:", v79, v75);

      }
      v72 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v99, v145, 16);
    }
    while (v72);
  }

  if ((unint64_t)objc_msgSend(v98, "count") >= 2 && objc_msgSend(v87, "count"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v82 + 48) + 8) + 24) += objc_msgSend(v83, "count");
    v80 = *(void **)(v82 + 40);
    v143[0] = CFSTR("momentNodes");
    v143[1] = CFSTR("superGroupMomentNodes");
    v144[0] = v83;
    v144[1] = v98;
    v143[2] = CFSTR("personNodes");
    v143[3] = CFSTR("relationshipsDistribution");
    v144[2] = v87;
    v144[3] = v9;
    v143[4] = CFSTR("activitiesDistribution");
    v143[5] = CFSTR("roisDistribution");
    v144[4] = v36;
    v144[5] = v96;
    v143[6] = CFSTR("poisDistribution");
    v144[6] = v94;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 7);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObject:", v81);

  }
}

double __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isSubsetOfSet:", v8) & 1) != 0
    || (v9 = 3.0, objc_msgSend(v8, "isSubsetOfSet:", v7)))
  {
    objc_msgSend(*(id *)(a1 + 32), "peopleDistance:withSecondBaseGroup:threshold:factor:", v5, v6, 0.28, 0.33);
    v11 = v10 + 0.0;
    objc_msgSend(*(id *)(a1 + 32), "momentsCountDistance:withSecondBaseGroup:withSubsetBias:withDistanceThreshold:withIntersectionBias:withKey:", v5, v6, CFSTR("momentNodes"), 0.0, 0.66, 0.2);
    v9 = v11 + v12;
  }

  return v9;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@sum.momentNodes.@count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.momentNodes.@count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:", v6);
  return v9;
}

id __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  id v24;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = a5;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (a4)
  {
    v8 = a4;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v28, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a2 + 8 * a3) + 8 * i));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("momentNodes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObjectsFromArray:", v11);

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("superGroupMomentNodes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
              objc_msgSend(v6, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v14);
      }

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("personNodes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v20);
      }

    }
  }
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, CFSTR("personNodes"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("momentNodes"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v6, CFSTR("superGroupMomentNodes"));

  return v24;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;

  if (a4)
  {
    v9 = 0;
    v10 = 0;
    for (i = 0; i != a4; ++i)
    {
      objc_msgSend(a5, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a2 + 8 * a3) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("personNodes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") > v9)
      {
        v9 = objc_msgSend(v13, "count");
        v10 = i;
      }

    }
  }
  else
  {
    v10 = 0;
  }
  return *(_QWORD *)(*(_QWORD *)(a2 + 8 * a3) + 8 * v10);
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5_277(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_4_274(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", a2))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_268(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = objc_msgSend(a2, "isReliable");
  v6 = v13;
  if (v5)
  {
    objc_msgSend(v13, "sceneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v9, "numberWithDouble:", v11 + 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v7);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &unk_1E84E4D48, v7);
      }
    }

    v6 = v13;
  }

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2_270(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "label");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v4, "numberWithDouble:", v6 + 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &unk_1E84E4D48, v8);
    }
  }

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_3_272(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "label");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v4, "numberWithDouble:", v6 + 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &unk_1E84E4D48, v8);
    }
  }

}

void __88__PGSocialGroupsQuestionFactory_enumeratePeopleClustersWithGraph_withLinkage_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isMeNode") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, float a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  *(float *)(*(_QWORD *)(a1[9] + 8) + 24) = *(float *)(*(_QWORD *)(a1[9] + 8) + 24) + a6;
  v15 = *(_QWORD *)(a1[10] + 8);
  if (*(float *)(v15 + 24) == 0.0)
    *(float *)(v15 + 24) = a6;
  v16 = (void *)a1[4];
  v17 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v18 = (float)(unint64_t)objc_msgSend(v13, "count");
  objc_msgSend(v17, "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v19);

  v20 = (void *)a1[5];
  v21 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v22 = (float)(unint64_t)objc_msgSend(v14, "count");
  objc_msgSend(v21, "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v23);

  if (objc_msgSend(v11, "count") && a1[7])
  {
    v25 = (void *)a1[6];
    v28[0] = CFSTR("personNodes");
    v28[1] = CFSTR("peopleWeights");
    v29[0] = v11;
    v29[1] = v12;
    v28[2] = CFSTR("momentNodes");
    v28[3] = CFSTR("superGroupMomentNodes");
    v29[2] = v13;
    v29[3] = v14;
    v28[4] = CFSTR("frequency");
    *(float *)&v24 = a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v27);

  }
}

uint64_t __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __126__PGSocialGroupsQuestionFactory_enumerateSocialGroupsWithGraph_withLinkage_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (unsigned)questionType
{
  return 17;
}

- (int64_t)questionOptions
{
  return 0x10000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PGSocialGroupsQuestionFactory *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__PGSocialGroupsQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E84350A0;
  v19 = v6;
  v20 = a3;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performSynchronousConcurrentGraphReadUsingBlock:", &v13);

  objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_socialGroupsForSurvey:(id)a3 withLimit:(unint64_t)a4
{
  id v6;
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
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromCurrentAlgorithm:](self, "_socialGroupsForSurveyFromCurrentAlgorithm:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") >= a4)
  {
    v20 = v8;
  }
  else
  {
    -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromNewAlgorithm:withLinkage:](self, "_socialGroupsForSurveyFromNewAlgorithm:withLinkage:", v6, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionOrderedSet:", v10);

    if (objc_msgSend(v8, "count") >= a4)
    {
      v21 = v8;
    }
    else
    {
      -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromNewAlgorithm:withLinkage:](self, "_socialGroupsForSurveyFromNewAlgorithm:withLinkage:", v6, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionOrderedSet:", v12);

      if (objc_msgSend(v8, "count") >= a4)
      {
        v22 = v8;
      }
      else
      {
        -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromNewAlgorithm:withLinkage:](self, "_socialGroupsForSurveyFromNewAlgorithm:withLinkage:", v6, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionOrderedSet:", v14);

        if (objc_msgSend(v8, "count") >= a4)
        {
          v23 = v8;
        }
        else
        {
          -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromNewAlgorithm:withLinkage:](self, "_socialGroupsForSurveyFromNewAlgorithm:withLinkage:", v6, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "unionOrderedSet:", v16);

          if (objc_msgSend(v8, "count") >= a4)
          {
            v24 = v8;
          }
          else
          {
            -[PGSocialGroupsQuestionFactory _socialGroupsForSurveyFromCustomAlgorithm:](self, "_socialGroupsForSurveyFromCustomAlgorithm:", v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionOrderedSet:", v17);
            if (objc_msgSend(v8, "count") >= a4)
            {
              v25 = v8;
            }
            else
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remainingSocialGroupsPeopleLocalIdentifiers"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "unionOrderedSet:", v18);
              v19 = v8;

            }
          }

        }
      }

    }
  }

  return v8;
}

- (id)_socialGroupsForSurveyFromCurrentAlgorithm:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  int v15;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v15 = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke;
  v13[3] = &unk_1E8433288;
  v13[4] = self;
  v14 = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke_2;
  v11[3] = &unk_1E8433288;
  v11[4] = self;
  v8 = v12;
  v9 = v7;
  objc_msgSend(v5, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", 0, 1, 0, v13, v11, &v15);

  objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("remainingSocialGroupsPeopleLocalIdentifiers"));

  return v6;
}

- (id)_socialGroupsForSurveyFromNewAlgorithm:(id)a3 withLinkage:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  int v19;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = (void *)objc_opt_class();
  v16 = v10;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke;
  v17[3] = &unk_1E84332B0;
  v17[4] = self;
  v18 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke_2;
  v15[3] = &unk_1E84332B0;
  v15[4] = self;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "enumerateSocialGroupsWithGraph:withLinkage:validGroupsBlock:invalidGroupsBlock:averageWeight:", v7, a4, v17, v15, &v19);

  objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("validSocialGroupsPeopleLocalIdentifiers"));
  objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("remainingSocialGroupsPeopleLocalIdentifiers"));

  return v8;
}

- (id)_socialGroupsForSurveyFromCustomAlgorithm:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  unint64_t j;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _QWORD *v55;
  _QWORD v56[4];
  _QWORD v57[4];
  id v58;
  _QWORD *v59;
  _QWORD v60[4];
  _BYTE v61[128];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v45 = a3;
  objc_msgSend(v45, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "relevantMomentNodesForSocialGroupProcessing");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke;
  v57[3] = &unk_1E8433360;
  v6 = v4;
  v58 = v6;
  v59 = v60;
  objc_msgSend(v44, "enumerateObjectsUsingBlock:", v57);
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v56[3] = 0;
  v53[0] = v5;
  v53[1] = 3221225472;
  v53[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_3;
  v53[3] = &unk_1E8433608;
  v55 = v56;
  v7 = v3;
  v54 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v53);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("personNodes"), 0, &__block_literal_global_291);
  v9 = objc_claimAutoreleasedReturnValue();
  v64[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingDescriptors:", v10);
  v43 = (void *)v9;

  for (i = 0; i != 10; ++i)
  {
    if (i >= objc_msgSend(v7, "count"))
      break;
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
      objc_msgSend(v8, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("momentNodes"), 1, &__block_literal_global_292);
  v13 = objc_claimAutoreleasedReturnValue();
  v63 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingDescriptors:", v14);
  v41 = (void *)v13;

  v15 = 0;
  v16 = 1;
  while (v15 < objc_msgSend(v7, "count") && v16 < 7)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("momentNodes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    if (v19 > v16)
    {
      if ((objc_msgSend(v8, "containsObject:", v17) & 1) == 0)
        objc_msgSend(v8, "addObject:", v17);
      v16 = v19;
    }

    ++v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("momentNodes"), 0, &__block_literal_global_293);
  v20 = objc_claimAutoreleasedReturnValue();
  v62 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingDescriptors:", v21);
  v40 = (void *)v20;

  v22 = 0;
  v46 = 1;
  for (j = 0; j < objc_msgSend(v7, "count"); ++j)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v23) & 1) == 0)
    {
      objc_msgSend(v8, "addObject:", v23);
      if ((unint64_t)++v22 > 0x45)
      {

        break;
      }
      v24 = 0;
      for (k = v46; k < objc_msgSend(v7, "count") && v24 < 4; ++k)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", k);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("personNodes"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("personNodes"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (((objc_msgSend(v27, "isSubsetOfSet:", v28) & 1) != 0
           || objc_msgSend(v28, "isSubsetOfSet:", v27))
          && (objc_msgSend(v8, "containsObject:", v26) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v26);
          if ((unint64_t)++v22 >= 0x46)
          {

            break;
          }
          ++v24;
        }

      }
    }

    ++v46;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * m), "objectForKeyedSubscript:", CFSTR("personNodes"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "count"))
        {
          v35 = (void *)MEMORY[0x1E0C99D20];
          objc_msgSend(v34, "allObjects");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "arrayWithArray:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[PGSocialGroupsQuestionFactory _createSocialGroupWithPersonLocalIdentifiers:](self, "_createSocialGroupWithPersonLocalIdentifiers:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v38);

        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v31);
  }

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v60, 8);

  return v29;
}

- (id)_createSocialGroupWithPersonLocalIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphPersonNode personSortDescriptors](PGGraphPersonNode, "personSortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          objc_msgSend(v13, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  -[PGSocialGroupsQuestionFactory _identifierForPersonNodesAsString:](self, "_identifierForPersonNodesAsString:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("socialGroupID");
  v26[1] = CFSTR("personLocalIdentifiers");
  v27[0] = v18;
  v27[1] = v6;
  v26[2] = CFSTR("personNames");
  v27[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_identifierForPersonNodesAsString:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_2;
  v14[3] = &unk_1E8434020;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v14);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v9);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0x3E8uLL;
  }

}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v6, "count");
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 32);
    v9[0] = CFSTR("momentNodes");
    v9[1] = CFSTR("personNodes");
    v10[0] = v6;
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __75__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCustomAlgorithm___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isMeNode") & 1) == 0)
  {
    objc_msgSend(v4, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_createSocialGroupWithPersonLocalIdentifiers:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __84__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromNewAlgorithm_withLinkage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_createSocialGroupWithPersonLocalIdentifiers:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSocialGroupWithPersonLocalIdentifiers:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

void __76__PGSocialGroupsQuestionFactory__socialGroupsForSurveyFromCurrentAlgorithm___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSocialGroupWithPersonLocalIdentifiers:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

void __74__PGSocialGroupsQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Current;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  PGSocialGroupsQuestion *v17;
  void *v18;
  void *v19;
  PGSocialGroupsQuestion *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void (**v30)(void *, _BYTE *, double);
  void *v31;
  unsigned __int8 v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (v30)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = 0.0;
    if (Current >= 0.01)
    {
      v6 = Current;
      v32 = 0;
      v30[2](v30, &v32, 0.0);
      if (v32)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_41;
        *(_DWORD *)buf = 67109378;
        v34 = 131;
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_27;
      }
      v5 = v6;
    }
    if (!*(_QWORD *)(a1 + 56))
    {
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_41;
      v32 = 0;
      v30[2](v30, &v32, 1.0);
      if (!v32 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_41;
      *(_DWORD *)buf = 67109378;
      v34 = 134;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
      v7 = MEMORY[0x1E0C81028];
LABEL_27:
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_41;
    }
  }
  else
  {
    v5 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_41;
  }
  objc_msgSend(v3, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_socialGroupsForSurvey:withLimit:", v8, *(_QWORD *)(a1 + 56));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v31, "count");
  if (!v11)
  {
    v25 = 0;
    v26 = 2;
    goto LABEL_34;
  }
  v12 = v11;
  v28 = v9;
  v29 = v8;
  v27 = v3;
  v13 = 0;
  v14 = 1.0 / (double)(unint64_t)(v11 + 1);
  while (1)
  {
    objc_msgSend(v31, "objectAtIndexedSubscript:", v13, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("personLocalIdentifiers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v16, "addObject:", v10);
    v17 = [PGSocialGroupsQuestion alloc];
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("socialGroupID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("personNames"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PGSocialGroupsQuestion initWithSocialGroupID:personLocalIdentifiers:personNames:localFactoryScore:](v17, "initWithSocialGroupID:personLocalIdentifiers:personNames:localFactoryScore:", v18, v16, v19, v14 * (double)v12);

    if (!objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v20, *(_QWORD *)(a1 + 40)))goto LABEL_20;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
    v21 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v30)
    {
      v22 = v21;
      v23 = *(_QWORD *)(a1 + 56);
      v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v5 >= 0.01)
        break;
    }
LABEL_19:
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
    {
      v25 = 0;
      v26 = 2;
      goto LABEL_32;
    }
LABEL_20:

    ++v13;
    if (!--v12)
    {
      v25 = 0;
      v26 = 2;
      v3 = v27;
      goto LABEL_33;
    }
  }
  v32 = 0;
  v30[2](v30, &v32, (double)v22 / (double)v23);
  if (!v32)
  {
    v5 = v24;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v34 = 165;
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Social Groups/PGSocialGroupsQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v26 = 1;
  v25 = 1;
  v5 = v24;
LABEL_32:
  v3 = v27;

LABEL_33:
  v9 = v28;
  v8 = v29;
LABEL_34:
  if (v30)
  {
    if (v26 == 2 && CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      v32 = 0;
      v30[2](v30, &v32, 1.0);
      if (v32 | v25)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v34 = 172;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/Social Groups/PGSocialGroupsQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_41:
}

@end
