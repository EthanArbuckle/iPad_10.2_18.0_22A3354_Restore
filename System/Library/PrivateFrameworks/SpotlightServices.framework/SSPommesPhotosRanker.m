@implementation SSPommesPhotosRanker

- (void)updatePhotosRankingItemScore:(id)a3 userQuery:(id)a4 currentTime:(double)a5 collectL2Signals:(BOOL)a6 keyboardLanguage:(id)a7 uniqueSessionID:(id)a8 onlyEmbeddingResults:(BOOL)a9 amlInputs:(id)a10
{
  _BOOL4 v10;
  id v15;
  int Float;
  float v17;
  void *v18;
  double v19;
  float v20;
  int v21;
  float v22;
  int v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  unint64_t v54;
  NSObject *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  BOOL v62;
  SSTokenizedString *v63;
  void *v64;
  void *v65;
  SSTokenizedString *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  BOOL v76;
  SSTokenizedString *v77;
  void *v78;
  void *v79;
  SSTokenizedString *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void *v91;
  void *v92;
  unint64_t v93;
  id v94;
  id v95;
  SSTokenizedString *v96;
  id v97;
  SSTokenizedString *v98;
  void *v99;
  uint64_t i;
  void *v101;
  void *v102;
  double v103;
  _BOOL4 v104;
  NSObject *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  float v111;
  float v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  float v125;
  float v126;
  float v127;
  double v128;
  double v129;
  float v130;
  double v131;
  double v132;
  float v133;
  double v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  void *v155;
  id v156;
  NSObject *v157;
  void *v158;
  void *v159;
  uint64_t (*v160)(uint64_t, uint64_t);
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  double v165;
  int v166;
  uint64_t v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  NSObject *v173;
  float v174;
  float v175;
  float v176;
  float v177;
  void *v178;
  id v179;
  _BOOL4 v180;
  void *v181;
  void *v182;
  id v183;
  SSTokenizedString *v184;
  id v185;
  void *v186;
  id v187;
  void *v188;
  id v189;
  void *v190;
  SSPommesPhotosRanker *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  double v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  void *v206;
  unint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  id v213;
  _QWORD v214[4];
  id v215;
  id v216;
  uint64_t *v217;
  uint64_t v218;
  double *v219;
  uint64_t v220;
  uint64_t v221;
  _QWORD v222[4];
  id v223;
  id v224;
  SSTokenizedString *v225;
  uint64_t *v226;
  uint64_t *v227;
  _QWORD v228[4];
  SSTokenizedString *v229;
  id v230;
  uint64_t *v231;
  uint64_t v232;
  double *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  double *v237;
  uint64_t v238;
  uint64_t v239;
  _QWORD v240[4];
  id v241;
  id v242;
  id v243;
  id v244;
  float v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint8_t *v249;
  id v250;
  id v251;
  _QWORD v252[15];
  _QWORD v253[15];
  _QWORD v254[2];
  _QWORD v255[2];
  uint8_t v256[16];
  __int128 v257;
  id v258;
  _BYTE *v259;
  _BYTE buf[24];
  uint64_t (*v261)(uint64_t, uint64_t);
  _BYTE v262[30];
  uint64_t v263;

  v10 = a9;
  v180 = a6;
  v263 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v185 = a4;
  v187 = a7;
  v179 = a8;
  v183 = a10;
  v245 = 0.0;
  v192 = v15;
  Float = SSCompactRankingAttrsGetFloat(objc_msgSend(v15, "attributes"), 0x78uLL, &v245);
  v17 = v245;
  if (!Float)
    v17 = 0.0;
  v177 = v17;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v15, "attributes"), 0x20uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v18;
  if (v18)
  {
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = 1.0 - exp(v19 / -86400.0 * 0.0000152587891);
  }
  else
  {
    v20 = 0.0;
  }
  v176 = v20;
  v21 = SSCompactRankingAttrsGetFloat(objc_msgSend(v15, "attributes"), 0x90uLL, &v245);
  v22 = v245;
  if (!v21)
    v22 = 0.0;
  v175 = v22;
  v23 = SSCompactRankingAttrsGetFloat(objc_msgSend(v15, "attributes"), 0x91uLL, &v245);
  v24 = v245;
  if (!v23)
    v24 = 0.0;
  v174 = v24;
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v15, "attributes"), 0x7CuLL);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v186, "containsObject:", CFSTR("Screenshots")))
    v25 = -10.0;
  else
    v25 = 0.0;
  if (!v10)
  {
    v184 = -[SSTokenizedString initWithString:locale:]([SSTokenizedString alloc], "initWithString:locale:", v185, v187);
    v33 = v15;
    v34 = v187;
    v193 = v33;
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v33, "attributes"), 0x4DuLL);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_opt_new();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v261 = __Block_byref_object_copy__6;
    *(_QWORD *)v262 = __Block_byref_object_dispose__6;
    *(_QWORD *)&v262[8] = 0;
    *(_QWORD *)v256 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v256[8] = 3221225472;
    *(_QWORD *)&v257 = __getMatchInfoDictionary_block_invoke;
    *((_QWORD *)&v257 + 1) = &unk_1E6E455C0;
    v259 = buf;
    v37 = v36;
    v258 = v37;
    objc_msgSend(v35, "enumerateObjectsUsingBlock:", v256);
    v38 = (void *)objc_opt_new();
    v246 = MEMORY[0x1E0C809B0];
    v247 = 3221225472;
    v248 = (uint64_t)__getMatchInfoDictionary_block_invoke_3;
    v249 = (uint8_t *)&unk_1E6E45678;
    v39 = v34;
    v250 = v39;
    v40 = v38;
    v251 = v40;
    objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", &v246);
    v41 = v251;
    v189 = v40;

    _Block_object_dispose(buf, 8);
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0x6BuLL);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v42, "BOOLValue");

    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6648]);
    v173 = objc_claimAutoreleasedReturnValue();
    v169 = (void *)objc_opt_new();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0x80uLL);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    if (v173)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0xA1uLL);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v240[0] = MEMORY[0x1E0C809B0];
      v240[1] = 3221225472;
      v240[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke;
      v240[3] = &unk_1E6E45428;
      v241 = v43;
      v242 = v169;
      v243 = v178;
      v44 = v43;
      -[NSObject enumerateObjectsUsingBlock:](v173, "enumerateObjectsUsingBlock:", v240);

    }
    v236 = 0;
    v237 = (double *)&v236;
    v238 = 0x2020000000;
    v239 = 0;
    v232 = 0;
    v233 = (double *)&v232;
    v234 = 0x2020000000;
    v235 = 0;
    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6630]);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6638]);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_opt_new();
    if (v181)
    {
      v45 = objc_msgSend(v181, "count");
      v46 = objc_msgSend(v178, "count");
      v237[3] = (double)v45 / (double)v46;
      v228[0] = MEMORY[0x1E0C809B0];
      v228[1] = 3221225472;
      v228[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_3;
      v228[3] = &unk_1E6E45450;
      v231 = &v232;
      v229 = v184;
      v230 = v171;
      objc_msgSend(v181, "enumerateObjectsUsingBlock:", v228);

    }
    if (v172)
    {
      v222[0] = MEMORY[0x1E0C809B0];
      v222[1] = 3221225472;
      v222[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_4;
      v222[3] = &unk_1E6E45478;
      v223 = v171;
      v226 = &v236;
      v224 = v178;
      v227 = &v232;
      v225 = v184;
      objc_msgSend(v172, "enumerateObjectsUsingBlock:", v222);

    }
    v218 = 0;
    v219 = (double *)&v218;
    v220 = 0x2020000000;
    v221 = 0;
    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA65E8]);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (v168)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0x8AuLL);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "tokenizedStringArray:", v39);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0xC7uLL);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v49);
      v214[0] = MEMORY[0x1E0C809B0];
      v214[1] = 3221225472;
      v214[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_5;
      v214[3] = &unk_1E6E454C8;
      v51 = v48;
      v215 = v51;
      v216 = v168;
      v217 = &v218;
      objc_msgSend(v50, "enumerateObjectsUsingBlock:", v214);

    }
    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6678]);
    v170 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6688]);
    v167 = objc_claimAutoreleasedReturnValue();
    if (v170 | v167)
    {
      v52 = v193;
      v191 = self;
      v205 = v39;
      v164 = v185;
      v182 = v52;
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0x81uLL);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0x84uLL);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0x85uLL);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0xB6uLL);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0xB7uLL);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0x82uLL);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0xB9uLL);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v52, "attributes"), 0xBAuLL);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = (void *)objc_opt_new();
      if (v201)
      {
        if (v203)
        {
          v54 = objc_msgSend(v201, "count");
          if (v54 < 4 * objc_msgSend(v203, "count"))
          {
            SSPommesRankerLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              SSRedactString(v164, 0);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "identifier");
              v160 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              v161 = objc_msgSend(v201, "count");
              v162 = objc_msgSend(v203, "count");
              v163 = objc_msgSend(v197, "count");
              *(_DWORD *)buf = 138413570;
              *(_QWORD *)&buf[4] = CFSTR("com.apple.mobileslideshow");
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v159;
              *(_WORD *)&buf[22] = 2112;
              v261 = v160;
              *(_WORD *)v262 = 2048;
              *(_QWORD *)&v262[2] = v161;
              *(_WORD *)&v262[10] = 2048;
              *(_QWORD *)&v262[12] = v162;
              *(_WORD *)&v262[20] = 2048;
              *(_QWORD *)&v262[22] = v163;
              _os_log_error_impl(&dword_1B86C5000, v55, OS_LOG_TYPE_ERROR, "[bundle:%@][query:\"%@\"] id (%@) Bounding box count (%lu) scene identifiers count (%lu) scene label count (%lu)", buf, 0x3Eu);

            }
          }
        }
      }
      if (objc_msgSend(v203, "count"))
      {
        v56 = 0;
        v211 = 0;
        do
        {
          v207 = v56;
          v57 = (void *)objc_opt_new();
          objc_msgSend(v203, "objectAtIndexedSubscript:", v207);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setIdentifier:", v58);

          objc_msgSend(v57, "setTotalLabels:", objc_msgSend(v203, "count"));
          objc_msgSend(v57, "setRankerReference:", v191);
          objc_msgSend(v57, "setSceneReferenceDictionary:", v199);
          objc_msgSend(v57, "setSceneMatchedType:", 0);
          v59 = objc_msgSend(v197, "count");
          v60 = v207;
          if (v59 > v207)
          {
            objc_msgSend(v197, "objectAtIndexedSubscript:");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "length") == 0;

            v60 = v207;
            if (!v62)
            {
              v63 = [SSTokenizedString alloc];
              objc_msgSend(v197, "objectAtIndexedSubscript:", v207);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "lowercaseString");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = -[SSTokenizedString initWithString:locale:](v63, "initWithString:locale:", v65, v205);
              objc_msgSend(v57, "setLabel:", v66);

              v60 = v207;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v60);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v190, "containsObject:", v67);

          if (v68)
            objc_msgSend(v57, "setSceneMatchedType:", 1);
          if (v195)
          {
            v69 = (void *)objc_opt_new();
            objc_msgSend(v195, "objectAtIndexedSubscript:", v207);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "unsignedLongValue");

            v72 = (void *)objc_opt_new();
            if (v71)
            {
              v73 = 0;
              while (1)
              {
                v74 = v211 + v73;
                if (objc_msgSend(v53, "count") > (unint64_t)(v211 + v73))
                {
                  objc_msgSend(v53, "objectAtIndexedSubscript:", v211 + v73);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = objc_msgSend(v75, "length") == 0;

                  if (!v76)
                  {
                    v77 = [SSTokenizedString alloc];
                    objc_msgSend(v53, "objectAtIndexedSubscript:", v74);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "lowercaseString");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v80 = -[SSTokenizedString initWithString:locale:](v77, "initWithString:locale:", v79, v205);
                    objc_msgSend(v69, "addObject:", v80);

                  }
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v74);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = objc_msgSend(v209, "containsObject:", v81);

                if (!v82)
                  goto LABEL_52;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v73);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "addObject:", v83);

                if (!objc_msgSend(v57, "sceneMatchedType"))
                  break;
                if (objc_msgSend(v57, "sceneMatchedType") == 1)
                {
                  v84 = 3;
LABEL_51:
                  objc_msgSend(v57, "setSceneMatchedType:", v84);
                }
LABEL_52:
                if (v71 == ++v73)
                  goto LABEL_53;
              }
              v84 = 2;
              goto LABEL_51;
            }
LABEL_53:
            objc_msgSend(v57, "setSynonyms:", v69);
            objc_msgSend(v57, "setTotalSynonyms:", objc_msgSend(v53, "count"));
            objc_msgSend(v57, "setSynonymsIndexes:", v72);

            v211 += v71;
          }
          if (v194)
          {
            objc_msgSend(v194, "objectAtIndexedSubscript:", v207);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "doubleValue");
            objc_msgSend(v57, "setConfidence:");

          }
          if (v201)
          {
            v86 = (4 * v207) | 3;
            if (objc_msgSend(v201, "count") > v86)
            {
              objc_msgSend(v201, "objectAtIndexedSubscript:", 4 * v207);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = v87;
              objc_msgSend(v201, "objectAtIndexedSubscript:", (4 * v207) | 1);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf[8] = v88;
              objc_msgSend(v201, "objectAtIndexedSubscript:", (4 * v207) | 2);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf[16] = v89;
              objc_msgSend(v201, "objectAtIndexedSubscript:", v86);
              v90 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              v261 = v90;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 4);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setBoundingBox:", v91);

            }
          }
          objc_msgSend(v57, "identifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "setObject:forKeyedSubscript:", v57, v92);

          v93 = objc_msgSend(v203, "count");
          v56 = v207 + 1;
        }
        while (v207 + 1 < v93);
      }

      v94 = v189;
      v95 = v199;
      v96 = v184;
      v258 = 0;
      *(_OWORD *)v256 = 0u;
      v257 = 0u;
      v246 = 0;
      v247 = (uint64_t)&v246;
      v248 = 0x2020000000;
      v249 = v256;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __computeSceneClassificationSignals_block_invoke;
      v261 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6E456A0;
      v97 = v94;
      *(_QWORD *)v262 = v97;
      v98 = v96;
      *(_QWORD *)&v262[8] = v98;
      *(_QWORD *)&v262[16] = &v246;
      objc_msgSend(v95, "enumerateKeysAndObjectsUsingBlock:", buf);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 40; i += 8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v256[i]);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "addObject:", v101);

      }
      _Block_object_dispose(&v246, 8);

      objc_msgSend(v99, "objectAtIndexedSubscript:", 4);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "doubleValue");
      v104 = fabs(v103 + -1.0) < 0.001;

      if (v104)
      {
        SSPommesRankerLog();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v182, "identifier");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:].cold.3(v106, v256, v105);
        }

      }
    }
    else
    {
      v99 = &unk_1E6E9B638;
    }
    objc_msgSend(v193, "interestingDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "timeIntervalSinceReferenceDate");
    v109 = v108;

    v165 = v25;
    if (v188)
    {
      objc_msgSend(v188, "timeIntervalSinceReferenceDate");
      v109 = v110;
    }
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v193, "attributes"), 0x69uLL);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = v109 - (double)(unint64_t)v109;
    if ((objc_msgSend(v212, "integerValue") & 1) != 0 || (objc_msgSend(v212, "integerValue") & 3) != 0)
    {
      objc_msgSend(v193, "pommesL1Score");
      v112 = v111;
      v113 = v237[3];
      objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "doubleValue");
      v116 = v115;
      objc_msgSend(v99, "objectAtIndexedSubscript:", 0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "doubleValue");
      v119 = v118;
      objc_msgSend(v99, "objectAtIndexedSubscript:", 2);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "doubleValue");
      v122 = v121;
      v123 = v219[3];
      v124 = v233[3];
      objc_msgSend(v193, "embeddingSimilarity");
      v126 = v125;
      objc_msgSend(v193, "l2Score");
      v128 = 0.0;
      if (v166)
        v128 = -10.0;
      v129 = v165
           + v128
           + v112 * 0.0532
           + 70.2896
           + v113 * 20.7257
           + v177 * 17.3689
           + v116 * 7.5446
           + v119 * 6.7843
           + v122 * 2.6352
           + v123 * 2.4182
           + v124 * 2.2137
           + v174 * 0.001
           + v175 * 0.001
           + v176 * 0.001
           + v196 * 0.0001
           + v126 * 0.1
           + v127;
      *(float *)&v129 = v129;
      objc_msgSend(v193, "setL2Score:", v129);

    }
    if ((objc_msgSend(v212, "integerValue") & 2) != 0)
    {
      objc_msgSend(v193, "embeddingSimilarity");
      v131 = v130;
      v132 = v131 + -0.15;
      if (v131 + -0.15 < 0.0)
        v132 = 0.0;
      v133 = fmin(v132, 0.2);
      v134 = v131 + -0.35 + 70.0 + v133 * 150.0;
      *(float *)&v134 = v134;
      objc_msgSend(v193, "setL2Score:", v134);
    }
    v252[0] = CFSTR("L1Score");
    v135 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v193, "pommesL1Score");
    objc_msgSend(v135, "numberWithFloat:");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v253[0] = v210;
    v252[1] = CFSTR("freshness");
    *(float *)&v136 = v176;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v136);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v253[1] = v208;
    v252[2] = CFSTR("photosFavorited");
    *(float *)&v137 = v177;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v137);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v253[2] = v206;
    v252[3] = CFSTR("aestheticScore");
    *(float *)&v138 = v174;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v138);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v253[3] = v204;
    v252[4] = CFSTR("curationScore");
    *(float *)&v139 = v175;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v253[4] = v202;
    v252[5] = CFSTR("peopleMatchPercent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v237[3]);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v253[5] = v200;
    v252[6] = CFSTR("peopleQueryCoverage");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v233[3]);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v253[6] = v198;
    v252[7] = CFSTR("matchedSceneBoundingBox");
    objc_msgSend(v99, "objectAtIndexedSubscript:", 0);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v253[7] = v140;
    v252[8] = CFSTR("matchedSceneConfidence");
    objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v253[8] = v141;
    v252[9] = CFSTR("matchedSceneLabelRatio");
    objc_msgSend(v99, "objectAtIndexedSubscript:", 2);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v253[9] = v142;
    v252[10] = CFSTR("matchedLocationRatio");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v219[3]);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v253[10] = v143;
    v252[11] = CFSTR("L2Score");
    v144 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v193, "l2Score");
    objc_msgSend(v144, "numberWithFloat:");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v253[11] = v145;
    v252[12] = CFSTR("embeddingSimilarity");
    v146 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v193, "embeddingSimilarity");
    objc_msgSend(v146, "numberWithFloat:");
    v147 = objc_claimAutoreleasedReturnValue();
    v148 = (void *)v147;
    v149 = &unk_1E6E9A260;
    if (v147)
      v149 = (void *)v147;
    v253[12] = v149;
    v252[13] = CFSTR("itemTimeMsPart");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v196);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v253[13] = v150;
    v252[14] = CFSTR("identifier");
    objc_msgSend(v193, "identifier");
    v151 = objc_claimAutoreleasedReturnValue();
    v152 = (void *)v151;
    v153 = &stru_1E6E549F0;
    if (v151)
      v153 = (const __CFString *)v151;
    v253[14] = v153;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v253, v252, 15);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v183, "addObject:", v154);
    if (v180)
    {
      v213 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v154, 1, &v213);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = v213;
      objc_msgSend(v193, "setL2Signals:", v155);

      if (v156)
      {
        SSPommesRankerLog();
        v157 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        {
          SSRedactString(v185, 0);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:].cold.2(v158, (uint64_t)v156, (uint64_t)buf, v157);
        }

      }
    }

    _Block_object_dispose(&v218, 8);
    _Block_object_dispose(&v232, 8);
    _Block_object_dispose(&v236, 8);

    v32 = v173;
    goto LABEL_90;
  }
  objc_msgSend(v15, "embeddingSimilarity");
  objc_msgSend(v15, "setL2Score:");
  if (v180)
  {
    v254[0] = CFSTR("embeddingSimilarity");
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "embeddingSimilarity");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v255[0] = v27;
    v254[1] = CFSTR("identifier");
    objc_msgSend(v15, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v255[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v255, v254, 2);
    v184 = (SSTokenizedString *)objc_claimAutoreleasedReturnValue();

    v244 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v184, 1, &v244);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v244;
    objc_msgSend(v15, "setL2Signals:", v29);

    v30 = v189;
    if (!v189)
    {
LABEL_91:

      goto LABEL_92;
    }
    SSPommesRankerLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:].cold.1(v185, (uint64_t)v189, v31);
      v32 = v31;
    }
LABEL_90:

    v30 = v189;
    goto LABEL_91;
  }
LABEL_92:

}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__6;
  v9[4] = __Block_byref_object_dispose__6;
  v10 = 0;
  objc_msgSend(v3, "original");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_2;
  v5[3] = &unk_1E6E45400;
  v8 = v9;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  _Block_object_dispose(v9, 8);
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "lowercaseString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", a3);
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  }

}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a2;
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = tokenMatchRatio(v4, v3) + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
  v5 = (void *)a1[5];
  objc_msgSend(v4, "original");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "original");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((v4 & 1) == 0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1.0
                                                                / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = tokenMatchRatio(v7, *(void **)(a1 + 48))
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
  }

}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;

  v6 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v7 <= objc_msgSend(v6, "unsignedLongValue"))
  {
    *a4 = 1;
  }
  else
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__6;
    v11[4] = __Block_byref_object_dispose__6;
    v12 = 0;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedLongValue"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_6;
    v10[3] = &unk_1E6E454A0;
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[4] = v11;
    v10[5] = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    _Block_object_dispose(v11, 8);

  }
}

void __156__SSPommesPhotosRanker_updatePhotosRankingItemScore_userQuery_currentTime_collectL2Signals_keyboardLanguage_uniqueSessionID_onlyEmbeddingResults_amlInputs___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  double matched;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "tokenMatchForMatchInfoToken:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    matched = tokenMatchRatio(v6, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v5 + 24) >= matched)
      matched = *(double *)(v5 + 24);
    *(double *)(v5 + 24) = matched;
  }

}

- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  id v34;
  _BOOL4 v35;
  id v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v35 = a8;
  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v34 = a4;
  v37 = a5;
  v15 = a9;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  if (objc_msgSend(v14, "count"))
  {
    v20 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSPommesPhotosRanker updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:](self, "updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:", v21, v37, v35, v15, v17, a10, a7, v18);

      if (v20 <= 0x13)
      {
        SSPommesRankerLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "pommesL1Score");
          v28 = v27;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "l2Score");
          *(_DWORD *)buf = 134219522;
          v39 = v20 + 1;
          v40 = 2112;
          v41 = v34;
          v42 = 2048;
          v43 = a6;
          v44 = 2112;
          v45 = v37;
          v46 = 2112;
          v47 = v26;
          v48 = 2048;
          v49 = v28;
          v50 = 2048;
          v51 = v30;
          _os_log_debug_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_DEBUG, "%lu. [bundle=%@][qid=%lu][query=\"%@\"] item %@: L1Score=%.04f, L2Score=%.04f", buf, 0x48u);

        }
      }
      objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos-photoId-%tu"), v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v24, v25);

      ++v20;
    }
    while (v20 < objc_msgSend(v14, "count"));
  }
  -[SSPommesPhotosRanker donateFeatureDictionaries:sessionId:metadata:](self, "donateFeatureDictionaries:sessionId:metadata:", v18, v17, v19);

}

- (void)donateFeatureDictionaries:(id)a3 sessionId:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SSPommesPhotosRanker *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__SSPommesPhotosRanker_donateFeatureDictionaries_sessionId_metadata___block_invoke;
  v15[3] = &unk_1E6E43028;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __69__SSPommesPhotosRanker_donateFeatureDictionaries_sessionId_metadata___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF6368]), "initWithSessionId:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = objc_alloc(MEMORY[0x1E0CF6360]);
  objc_msgSend(*(id *)(a1 + 48), "amlConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFeaturesConfiguration:", v3);

  v5 = (id)objc_msgSend(v4, "donateFeatureDictionaries:metadata:completionBlock:", *(_QWORD *)(a1 + 56), v6, 0);
}

+ (SSPommesPhotosRanker)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSPommesPhotosRanker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, block);
  return (SSPommesPhotosRanker *)(id)sharedInstance_pommesRanker;
}

void __38__SSPommesPhotosRanker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_pommesRanker;
  sharedInstance_pommesRanker = (uint64_t)v1;

  v3 = dispatch_queue_create("coreml_serial", 0);
  objc_msgSend((id)sharedInstance_pommesRanker, "setSerial_queue:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithLatestTaxonomy");
  objc_msgSend((id)sharedInstance_pommesRanker, "setSceneTaxonomy:", v4);

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF6370]), "initWithFeatureDictionary:", &unk_1E6E9B8A8);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF6358]), "initWithBundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:", CFSTR("com.apple.mobileslideshow"), CFSTR("l2LinearRegressor"), CFSTR("1.0"), 3, v6);
  objc_msgSend((id)sharedInstance_pommesRanker, "setAmlConfiguration:", v5);

}

+ (id)PhotosRankingRequiredAttributes
{
  if (PhotosRankingRequiredAttributes_onceToken != -1)
    dispatch_once(&PhotosRankingRequiredAttributes_onceToken, &__block_literal_global_349);
  return (id)PhotosRankingRequiredAttributes_requiredAttributes;
}

void __55__SSPommesPhotosRanker_PhotosRankingRequiredAttributes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[28];

  v15[27] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6048];
  v15[0] = *MEMORY[0x1E0CA5F78];
  v15[1] = v0;
  v1 = *MEMORY[0x1E0CA60D0];
  v15[2] = *MEMORY[0x1E0CA60C8];
  v15[3] = v1;
  v2 = *MEMORY[0x1E0CA62F0];
  v15[4] = *MEMORY[0x1E0CA6128];
  v15[5] = v2;
  v3 = *MEMORY[0x1E0CA65E8];
  v15[6] = *MEMORY[0x1E0CA65C8];
  v15[7] = v3;
  v4 = *MEMORY[0x1E0CA6610];
  v15[8] = *MEMORY[0x1E0CA65F0];
  v15[9] = v4;
  v5 = *MEMORY[0x1E0CA6640];
  v15[10] = *MEMORY[0x1E0CA6630];
  v15[11] = v5;
  v6 = *MEMORY[0x1E0CA6650];
  v15[12] = *MEMORY[0x1E0CA6648];
  v15[13] = v6;
  v7 = *MEMORY[0x1E0CA6668];
  v15[14] = *MEMORY[0x1E0CA6660];
  v15[15] = v7;
  v8 = *MEMORY[0x1E0CA6678];
  v15[16] = *MEMORY[0x1E0CA6670];
  v15[17] = v8;
  v9 = *MEMORY[0x1E0CA6688];
  v15[18] = *MEMORY[0x1E0CA6680];
  v15[19] = v9;
  v10 = *MEMORY[0x1E0CA6698];
  v15[20] = *MEMORY[0x1E0CA6690];
  v15[21] = v10;
  v11 = *MEMORY[0x1E0CA6A70];
  v15[22] = *MEMORY[0x1E0CA6A60];
  v15[23] = v11;
  v12 = *MEMORY[0x1E0CA6A90];
  v15[24] = *MEMORY[0x1E0CA6A98];
  v15[25] = v12;
  v15[26] = CFSTR("kMDQueryResultHasTextContentMatch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 27);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)PhotosRankingRequiredAttributes_requiredAttributes;
  PhotosRankingRequiredAttributes_requiredAttributes = v13;

}

+ (int64_t)PhotosL2Compare:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int64_t v13;
  float v14;
  float v15;
  float v16;
  float v18;
  float v19;
  float v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "l2Score");
  v8 = v7;
  objc_msgSend(v6, "l2Score");
  if (v8 > v9)
  {
LABEL_5:
    v13 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v5, "l2Score");
  v11 = v10;
  objc_msgSend(v6, "l2Score");
  if (v11 >= v12)
  {
    objc_msgSend(v5, "pommesL1Score");
    v15 = v14;
    objc_msgSend(v6, "pommesL1Score");
    if (v15 <= v16)
    {
      objc_msgSend(v5, "pommesL1Score");
      v19 = v18;
      objc_msgSend(v6, "pommesL1Score");
      v13 = v19 < v20;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v13 = 1;
LABEL_6:

  return v13;
}

+ (int64_t)PhotosL1Compare:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  int64_t v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "pommesL1Score");
  v8 = v7;
  objc_msgSend(v6, "pommesL1Score");
  if (v8 <= v9)
  {
    objc_msgSend(v5, "pommesL1Score");
    v12 = v11;
    objc_msgSend(v6, "pommesL1Score");
    if (v12 >= v13)
    {
      objc_msgSend(v5, "interestingDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
      v16 = v15;

      objc_msgSend(v6, "interestingDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = v18;

      if (v16 <= v19)
        v10 = 1;
      else
        v10 = -1;
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)sortAndFilterRankedPhotosItems:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  id v7;
  id v8;
  NSObject *v9;
  double v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  double v36;
  NSObject *v37;
  double v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  unint64_t v49;
  void *v50;
  double v51;
  NSObject *v52;
  void *v53;
  unint64_t v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  double v74;
  void *v75;
  unint64_t v76;
  float v77;
  float v78;
  int v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  int v84;
  NSObject *v85;
  double v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  float v90;
  NSObject *v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  float v99;
  double v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  NSObject *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  double v125;
  __int16 v126;
  unint64_t v127;
  __int16 v128;
  unint64_t v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  SSPommesRankerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    SSRedactString(v8, 1);
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138412802;
    v125 = v10;
    v126 = 2048;
    *(double *)&v127 = COERCE_DOUBLE(objc_msgSend(v7, "count"));
    v128 = 2048;
    v129 = a4;
    _os_log_impl(&dword_1B86C5000, v9, OS_LOG_TYPE_DEFAULT, "[query: %@] Filtering %lu items, maxCount: %ld", buf, 0x20u);

  }
  if (!objc_msgSend(v7, "count"))
  {
    SSPommesRankerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_92;
    *(_WORD *)buf = 0;
    v25 = "Skipping ranking of items (Reason: no items to rank)";
LABEL_21:
    v26 = v24;
    v27 = 2;
LABEL_46:
    _os_log_impl(&dword_1B86C5000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_92;
  }
  if (*(double *)&a4 == 0.0)
  {
    SSPommesRankerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_92;
    *(_WORD *)buf = 0;
    v25 = "Skipping ranking of items (ERROR: requested to rank zero items)";
    goto LABEL_21;
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v102 = v7;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  v13 = 0x1E0CB3000uLL;
  v14 = v11;
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v118;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v118 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend(v18, "rankingItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pommesL1Score");
        if (v20 < 10.0)
        {

        }
        else
        {
          objc_msgSend(v18, "rankingItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "pommesL1Score");
          v23 = v22;

          if (v23 != 100.0)
          {
            v28 = v8;

            v13 = 0x1E0CB3000uLL;
            v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            if (objc_msgSend(v11, "count"))
            {
              v29 = 0;
              do
              {
                objc_msgSend(v11, "objectAtIndexedSubscript:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "rankingItem");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "pommesL1Score");
                v33 = v32;

                if (v33 < 10.0)
                {
                  objc_msgSend(v11, "objectAtIndexedSubscript:", v29);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "rankingItem");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v36) = 0;
                  objc_msgSend(v35, "setL2Score:", v36);

                  objc_msgSend(v14, "addIndex:", v29);
                }
                ++v29;
              }
              while (v29 < objc_msgSend(v11, "count"));
            }
            objc_msgSend(v11, "removeObjectsAtIndexes:", v14);
            SSPommesRankerLog();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = COERCE_DOUBLE(objc_msgSend(v11, "count"));
              *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(v14, "count"));
              *(_DWORD *)buf = 134218496;
              v125 = v38;
              v126 = 2048;
              v127 = v39;
              v128 = 2048;
              v129 = 0x4024000000000000;
              _os_log_impl(&dword_1B86C5000, v37, OS_LOG_TYPE_DEFAULT, "Ranking only %lu items. Rejected %lu items that are below L1 thresh of %f)", buf, 0x20u);
            }

            v8 = v28;
            goto LABEL_30;
          }
        }
      }
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
      if (v15)
        continue;
      break;
    }
    v14 = v11;
    v13 = 0x1E0CB3000uLL;
  }
LABEL_30:

  if (objc_msgSend(v11, "count") > a4)
  {
    v101 = v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v41 = 0x1E0CB3000uLL;
    v104 = objc_msgSend(&unk_1E6E9B650, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
    if (v104)
    {
      v103 = *(_QWORD *)v114;
LABEL_33:
      v42 = 0;
      while (1)
      {
        if (*(_QWORD *)v114 != v103)
          objc_enumerationMutation(&unk_1E6E9B650);
        *(double *)&v43 = COERCE_DOUBLE(objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * v42), "unsignedLongValue"));
        if (objc_msgSend(v11, "count"))
        {
          v44 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "rankingItem");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "interestingDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "timeIntervalSinceReferenceDate");
            v49 = (unint64_t)(v48 / (double)v43);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v50);

            ++v44;
          }
          while (v44 < objc_msgSend(v11, "count"));
        }
        if (objc_msgSend(v40, "count") >= a4)
          break;
        objc_msgSend(v40, "removeAllObjects");
        if (++v42 == v104)
        {
          v104 = objc_msgSend(&unk_1E6E9B650, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
          if (v104)
            goto LABEL_33;
          v43 = 300;
          break;
        }
      }
      v13 = 0x1E0CB3000;
      v41 = 0x1E0CB3000;
    }
    else
    {
      v43 = 300;
    }

    SSPommesRankerLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v125 = *(double *)&v43;
      _os_log_impl(&dword_1B86C5000, v52, OS_LOG_TYPE_DEFAULT, "Setting timeWindow: %lu sec", buf, 0xCu);
    }

    v24 = objc_alloc_init(*(Class *)(v13 + 1928));
    v53 = (void *)objc_opt_new();
    if (objc_msgSend(v11, "count"))
    {
      v54 = 0;
      v55 = (double)v43;
      v105 = v24;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "rankingItem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "interestingDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "timeIntervalSinceReferenceDate");
        v60 = (unint64_t)(v59 / v55);

        objc_msgSend(*(id *)(v41 + 2024), "numberWithUnsignedInteger:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKey:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "unsignedLongValue");

          objc_msgSend(v11, "objectAtIndexedSubscript:", v54);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "rankingItem");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v64);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "rankingItem");
          v68 = v53;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = +[SSPommesPhotosRanker PhotosL2Compare:to:](SSPommesPhotosRanker, "PhotosL2Compare:to:", v66, v69);

          v24 = v105;
          if (v70 == -1)
          {
            -[NSObject addIndex:](v105, "addIndex:", v64);
            v41 = 0x1E0CB3000uLL;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v72, v61);

            v53 = v68;
          }
          else
          {
            -[NSObject addIndex:](v105, "addIndex:", v54);
            v53 = v68;
            v41 = 0x1E0CB3000;
          }
        }
        else
        {
          objc_msgSend(*(id *)(v41 + 2024), "numberWithUnsignedInteger:", v54);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v71, v61);

        }
        ++v54;
      }
      while (v54 < objc_msgSend(v11, "count"));
    }
    SSPommesRankerLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = COERCE_DOUBLE(objc_msgSend(v53, "count"));
      *(_DWORD *)buf = 134217984;
      v125 = v74;
      _os_log_impl(&dword_1B86C5000, v73, OS_LOG_TYPE_DEFAULT, "Found %ld distinct items based on bucketing logic", buf, 0xCu);
    }

    v8 = v101;
    if (objc_msgSend(v53, "count") >= a4)
    {
      SSPommesRankerLog();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = COERCE_DOUBLE(-[NSObject count](v24, "count"));
        *(double *)&v87 = COERCE_DOUBLE(objc_msgSend(v53, "count"));
        *(_DWORD *)buf = 134218496;
        v125 = v86;
        v126 = 2048;
        v127 = v87;
        v128 = 2048;
        v129 = a4;
        _os_log_impl(&dword_1B86C5000, v85, OS_LOG_TYPE_DEFAULT, "Filtering done early by rejecting %lu items (Reason: buckets(%ld) >= maxCount(%ld))", buf, 0x20u);
      }

      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __86__SSPommesPhotosRanker_sortAndFilterRankedPhotosItems_maxCount_userQuery_currentTime___block_invoke;
      v111[3] = &unk_1E6E45510;
      v112 = v11;
      -[NSObject enumerateIndexesUsingBlock:](v24, "enumerateIndexesUsingBlock:", v111);
      v88 = v112;
      goto LABEL_91;
    }
    if (objc_msgSend(v11, "count"))
    {
      v75 = v53;
      v76 = 0;
      v77 = 0.0;
      v78 = 3.4028e38;
      do
      {
        v79 = -[NSObject containsIndex:](v24, "containsIndex:", v76);
        objc_msgSend(v11, "objectAtIndexedSubscript:", v76);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "rankingItem");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "l2Score");
        v83 = v82;

        if (v78 < v83)
          v84 = 1;
        else
          v84 = v79;
        if (!v84)
          v78 = v83;
        if ((v79 & (v77 < v83)) != 0)
          v77 = v83;
        ++v76;
      }
      while (v76 < objc_msgSend(v11, "count"));
      if (v77 >= v78)
      {
        v90 = (float)(v77 - v78) + 0.1;
        SSPommesRankerLog();
        v91 = objc_claimAutoreleasedReturnValue();
        v53 = v75;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v92 = COERCE_DOUBLE(objc_msgSend(v75, "count"));
          *(_DWORD *)buf = 134218240;
          v125 = v92;
          v126 = 2048;
          *(double *)&v127 = v90;
          _os_log_impl(&dword_1B86C5000, v91, OS_LOG_TYPE_DEFAULT, "Increasing l2 scores of %lu bucket-top-items by delta: %f", buf, 0x16u);
        }

        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        objc_msgSend(v75, "allValues");
        v89 = objc_claimAutoreleasedReturnValue();
        v93 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
        if (v93)
        {
          v94 = v93;
          v95 = *(_QWORD *)v108;
          do
          {
            for (j = 0; j != v94; ++j)
            {
              if (*(_QWORD *)v108 != v95)
                objc_enumerationMutation(v89);
              objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * j), "unsignedIntValue"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "rankingItem");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "l2Score");
              *(float *)&v100 = v99 + v90;
              objc_msgSend(v98, "setL2Score:", v100);

            }
            v94 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
          }
          while (v94);
          v8 = v101;
          v53 = v75;
        }
        goto LABEL_89;
      }
      v53 = v75;
    }
    else
    {
      v77 = 0.0;
      v78 = 3.4028e38;
    }
    SSPommesRankerLog();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v125 = v78;
      v126 = 2048;
      *(double *)&v127 = v77;
      _os_log_impl(&dword_1B86C5000, v89, OS_LOG_TYPE_DEFAULT, "No score calibration needed (Reason: minBucketTopL2Score(%f) > bestRemainingL2Score(%f))", buf, 0x16u);
    }
LABEL_89:

    SSPommesRankerLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v88, OS_LOG_TYPE_DEFAULT, "Done sorting and filtering", buf, 2u);
    }
LABEL_91:

    v7 = v102;
    goto LABEL_92;
  }
  SSPommesRankerLog();
  v24 = objc_claimAutoreleasedReturnValue();
  v7 = v102;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v51 = COERCE_DOUBLE(objc_msgSend(v11, "count"));
    *(_DWORD *)buf = 134218240;
    v125 = v51;
    v126 = 2048;
    v127 = a4;
    v25 = "Filtering done early (Reason: numItems(%ld) <= maxCount(%ld))";
    v26 = v24;
    v27 = 22;
    goto LABEL_46;
  }
LABEL_92:

}

void __86__SSPommesPhotosRanker_sortAndFilterRankedPhotosItems_maxCount_userQuery_currentTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setL2Score:", v3);

}

- (void)sortAndFilterRankedPhotosItemsFilter:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  id v24;

  v24 = a3;
  -[SSPommesPhotosRanker sortAndFilterRankedPhotosItems:maxCount:userQuery:currentTime:](self, "sortAndFilterRankedPhotosItems:maxCount:userQuery:currentTime:", v24, a4, a5, a6);
  if (objc_msgSend(v24, "count") && objc_msgSend(v24, "count"))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rankingItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "l2Score");
      v15 = v14;

      if (v15 != 0.0)
        ++v11;
      ++v10;
    }
    while (v10 < objc_msgSend(v24, "count"));
    if (v11)
    {
      objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_360);
      v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if (objc_msgSend(v24, "count"))
      {
        v17 = 0;
        v18 = 0;
        do
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "rankingItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "l2Score");
          v22 = v21;

          if (v22 == 0.0 || v18 >= a4)
            objc_msgSend(v16, "addIndex:", v17);
          else
            ++v18;
          ++v17;
        }
        while (v17 < objc_msgSend(v24, "count"));
      }
      objc_msgSend(v24, "removeObjectsAtIndexes:", v16);

    }
  }

}

int64_t __92__SSPommesPhotosRanker_sortAndFilterRankedPhotosItemsFilter_maxCount_userQuery_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(a2, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[SSPommesPhotosRanker PhotosL2Compare:to:](SSPommesPhotosRanker, "PhotosL2Compare:to:", v5, v6);
  return v7;
}

- (void)sortAndFilterRankedPhotosItemsFilterFromSet:(id)a3 maxCount:(unint64_t)a4 userQuery:(id)a5 currentTime:(double)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++), (_QWORD)v19);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  +[SSPommesPhotosRanker sharedInstance](SSPommesPhotosRanker, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortAndFilterRankedPhotosItemsFilter:maxCount:userQuery:currentTime:", v11, a4, v10, a6);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

}

- (OS_dispatch_queue)serial_queue
{
  return self->_serial_queue;
}

- (void)setSerial_queue:(id)a3
{
  objc_storeStrong((id *)&self->_serial_queue, a3);
}

- (float)estimatedMaxPommesL1Score
{
  return self->_estimatedMaxPommesL1Score;
}

- (void)setEstimatedMaxPommesL1Score:(float)a3
{
  self->_estimatedMaxPommesL1Score = a3;
}

- (PFSceneTaxonomy)sceneTaxonomy
{
  return self->_sceneTaxonomy;
}

- (void)setSceneTaxonomy:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, a3);
}

- (AMLFeaturesConfiguration)amlConfiguration
{
  return self->_amlConfiguration;
}

- (void)setAmlConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_amlConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amlConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_serial_queue, 0);
}

- (void)updatePhotosRankingItemScore:(NSObject *)a3 userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SSRedactString(a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = CFSTR("com.apple.mobileslideshow");
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_0_6(&dword_1B86C5000, a3, v6, "[bundle:%@][query:\"%@\"] Failed to archive l2 signals dictionary to NSData with error %@", (uint8_t *)&v7);

}

- (void)updatePhotosRankingItemScore:(uint64_t)a3 userQuery:(NSObject *)a4 currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412802;
  *(_QWORD *)(a3 + 4) = CFSTR("com.apple.mobileslideshow");
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_0_6(&dword_1B86C5000, a4, a3, "[bundle:%@][query:\"%@\"] Failed to archive l2 signals dictionary to NSData with error %@", (uint8_t *)a3);

}

- (void)updatePhotosRankingItemScore:(os_log_t)log userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEBUG, "Scene exact match photo boosted [%@]", buf, 0xCu);

}

@end
