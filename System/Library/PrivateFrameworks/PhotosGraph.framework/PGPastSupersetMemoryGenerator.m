@implementation PGPastSupersetMemoryGenerator

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  PGPastSupersetMemoryGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
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
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void (**v84)(_QWORD, _QWORD, double);
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t k;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  BOOL v105;
  id v106;
  void *v107;
  double v108;
  BOOL v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  PGPotentialPastSupersetMemory *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void (**v150)(_QWORD, _QWORD, double);
  double v151;
  id v152;
  id v153;
  id v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  uint64_t v156;
  void *v157;
  void *v158;
  uint64_t v159;
  id v160;
  void (**v161)(id, void *, _BYTE *);
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  uint64_t v169;
  PGPastSupersetMemoryGenerator *v170;
  void *v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  id obj;
  uint64_t v180;
  void *v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *context;
  void *contexta;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  void *v198;
  void *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  _QWORD v212[4];
  id v213;
  void *v214;
  uint64_t *v215;
  char v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t, uint64_t);
  void (*v225)(uint64_t);
  PGGraphLocationNodeCollection *v226;
  _QWORD v227[4];
  id v228;
  void *v229;
  id v230;
  _BYTE *v231;
  uint64_t v232;
  uint64_t v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  _QWORD v242[4];
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  uint64_t v248;
  char v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  _BYTE v254[128];
  _QWORD v255[2];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  void *v261;
  _BYTE buf[24];
  uint64_t (*v263)(uint64_t, uint64_t);
  _BYTE v264[20];
  __int16 v265;
  uint64_t v266;
  __int16 v267;
  uint64_t v268;
  __int16 v269;
  uint64_t v270;
  _QWORD v271[4];

  v271[1] = *MEMORY[0x1E0C80C00];
  v168 = a3;
  v161 = (void (**)(id, void *, _BYTE *))a4;
  v170 = self;
  -[PGMemoryGenerator controller](self, "controller");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = 0;
  v158 = (void *)objc_opt_new();
  v6 = self;
  v156 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", self->_localDate);
  v7 = (void *)MEMORY[0x1E0D4B130];
  -[PGPastSupersetMemoryGenerator localDate](v6, "localDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingMonths:toDate:", -6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v167 = v9;
  -[PGFeaturedMemoryGenerator upperBoundLocalDate](v170, "upperBoundLocalDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v171 = v167;
  if (v10)
  {
    -[PGFeaturedMemoryGenerator upperBoundLocalDate](v170, "upperBoundLocalDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "earlierDate:", v11);
    v171 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[PGPastSupersetMemoryGenerator localDate](v170, "localDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v167, v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator locationHelper](v170, "locationHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v168);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFrequentLocationNode momentOfFrequentLocation](PGGraphFrequentLocationNode, "momentOfFrequentLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adjacencyWithSources:relation:targetsClass:", v166, v17, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFrequentLocationNode addressOfFrequentLocation](PGGraphFrequentLocationNode, "addressOfFrequentLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "adjacencyWithSources:relation:targetsClass:", v166, v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D429D8];
  objc_msgSend(v21, "targets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphAddressNode cityOfAddress](PGGraphAddressNode, "cityOfAddress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "adjacencyWithSources:relation:targetsClass:", v23, v24, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v242[0] = MEMORY[0x1E0C809B0];
  v242[1] = 3221225472;
  v242[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke;
  v242[3] = &unk_1E8427B98;
  v153 = v21;
  v243 = v153;
  v154 = v25;
  v244 = v154;
  v197 = v15;
  v245 = v197;
  v248 = 208;
  v152 = v18;
  v246 = v152;
  v160 = v14;
  v247 = v160;
  objc_msgSend(v166, "enumerateNodesUsingBlock:", v242);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateInterval"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v261, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "sortedArrayUsingDescriptors:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  obj = v28;
  v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v260, 16);
  if (v184)
  {
    v180 = *(_QWORD *)v239;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v239 != v180)
        {
          v30 = v29;
          objc_enumerationMutation(obj);
          v29 = v30;
        }
        v187 = v29;
        v31 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * v29);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v31, "dateInterval");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "momentNodes");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "supersetCityNodes");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "densestCloseLocationNodes");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v263 = __Block_byref_object_copy__1181;
        *(_QWORD *)v264 = __Block_byref_object_dispose__1182;
        *(_QWORD *)&v264[8] = 0;
        v234 = 0u;
        v235 = 0u;
        v236 = 0u;
        v237 = 0u;
        v32 = v182;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v234, v259, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v235;
          while (2)
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v235 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * i);
              objc_msgSend(v36, "dateInterval");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v198, "intersectionWithDateInterval:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "duration");
              v40 = v39 > 7889400.0;

              if (v40)
              {
                objc_msgSend(v36, "densestCloseLocationNodes");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "containsCollection:", v193);

                if (v42)
                {
                  v54 = *(_QWORD *)&buf[8];
                  v55 = v36;
                  v53 = *(id *)(v54 + 40);
                  *(_QWORD *)(v54 + 40) = v55;
LABEL_24:

                  goto LABEL_25;
                }
                objc_msgSend(v36, "supersetCityNodes");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v197, "stateNodeFromCityNodeAsCollection:", v195);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "stateNodeAsCollection");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  if ((objc_msgSend(v44, "intersectsCollection:", v45) & 1) != 0)
                  {
                    objc_msgSend(v197, "addressNodesFromLocationNodes:", v195);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "anyNode");
                    v47 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v47, "coordinate");
                    v49 = v48;
                    v51 = v50;

                    v227[0] = MEMORY[0x1E0C809B0];
                    v227[1] = 3221225472;
                    v227[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_167;
                    v227[3] = &unk_1E8427BC0;
                    v52 = v197;
                    v232 = v49;
                    v233 = v51;
                    v231 = buf;
                    v228 = v52;
                    v229 = v36;
                    v53 = v43;
                    v230 = v53;
                    objc_msgSend(v53, "enumerateIdentifiersAsCollectionsWithBlock:", v227);
                    LOBYTE(v47) = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

                    if ((v47 & 1) == 0)
                    {

                      goto LABEL_24;
                    }
                  }
                }

              }
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v234, v259, 16);
            if (v33)
              continue;
            break;
          }
        }
LABEL_25:

        v56 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v56)
        {
          objc_msgSend(v56, "dateInterval");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "startDate");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "startDate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "earlierDate:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "endDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "endDate");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "laterDate:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v60, v63);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDateInterval:", v64);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "momentNodes");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "collectionByFormingUnionWith:", v191);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setMomentNodes:", v66);

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "supersetCityNodes");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "collectionByFormingUnionWith:", v195);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setSupersetCityNodes:", v68);

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "densestCloseLocationNodes");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "collectionByFormingUnionWith:", v193);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDensestCloseLocationNodes:", v70);

        }
        else
        {
          +[PGPastSupersetGroup pastSupersetGroupWithMomentNodes:dateInterval:supersetCityNodeAsCollection:densestCloseLocationNodeAsCollection:locationHelper:](PGPastSupersetGroup, "pastSupersetGroupWithMomentNodes:dateInterval:supersetCityNodeAsCollection:densestCloseLocationNodeAsCollection:locationHelper:", v191, v198, v195, v193, v197);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v57);
        }

        _Block_object_dispose(buf, 8);
        objc_autoreleasePoolPop(context);
        v29 = v187 + 1;
      }
      while (v187 + 1 != v184);
      v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v260, 16);
    }
    while (v184);
  }

  v221 = 0;
  v222 = &v221;
  v223 = 0x3032000000;
  v224 = __Block_byref_object_copy__1181;
  v225 = __Block_byref_object_dispose__1182;
  v226 = -[MAElementCollection initWithGraph:]([PGGraphLocationNodeCollection alloc], "initWithGraph:", v168);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = 0u;
  v220 = 0u;
  v217 = 0u;
  v218 = 0u;
  v71 = v182;
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v217, v258, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v218;
    do
    {
      for (j = 0; j != v72; ++j)
      {
        if (*(_QWORD *)v218 != v73)
          objc_enumerationMutation(v71);
        v75 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * j);
        objc_msgSend(v75, "dateInterval");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "intersectsDateInterval:", v186);

        objc_msgSend(v75, "densestCloseLocationNodes");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v212[0] = MEMORY[0x1E0C809B0];
        v212[1] = 3221225472;
        v212[2] = __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2;
        v212[3] = &unk_1E8427BE8;
        v213 = v199;
        v214 = v75;
        v216 = v77;
        v215 = &v221;
        objc_msgSend(v78, "enumerateNodesUsingBlock:", v212);

      }
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v217, v258, 16);
    }
    while (v72);
  }

  objc_msgSend(v168, "meNode");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "localIdentifier");
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](v170, "momentNodesWithBlockedFeatureCache");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "momentNodesWithBlockedFeature");
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator processedScenesAndFacesCache](v170, "processedScenesAndFacesCache");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "momentNodesWithEnoughScenesProcessedInGraph:", v168);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v172 = v71;
  v82 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v208, v257, 16);
  v176 = v81;
  if (v82)
  {
    v159 = 0;
    v155 = 0;
    v162 = 0;
    v169 = 0;
    v174 = 0;
    v175 = *(_QWORD *)v209;
    while (2)
    {
      v83 = 0;
      v173 = v82;
      do
      {
        if (*(_QWORD *)v209 != v175)
          objc_enumerationMutation(v172);
        v185 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * v83);
        objc_msgSend(v178, "progressBlock");
        v84 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, char *, double))v84)[2](v84, &v249, 0.0);
        v183 = v83;

        if (v249)
        {
          v141 = v172;
          goto LABEL_116;
        }
        objc_msgSend(v185, "momentNodes");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v176, "allMomentNodesInCollectionHaveScenesProcessed:", v85) & 1) != 0)
        {
          v177 = v85;
          objc_msgSend(v185, "densestCloseLocationNodes");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "dateInterval");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "endDate");
          v194 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v194, "compare:", v171) == 1)
          {
            ++v169;
          }
          else
          {
            if (objc_msgSend((id)v222[5], "intersectsCollection:", v181))
            {
              objc_msgSend(v181, "collectionByIntersecting:", v222[5]);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v206 = 0u;
              v207 = 0u;
              v204 = 0u;
              v205 = 0u;
              objc_msgSend(v87, "temporarySet");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v204, v256, 16);
              v163 = v87;
              if (v89)
              {
                contexta = v88;
                v192 = *(_QWORD *)v205;
                while (2)
                {
                  v90 = 0;
                  v188 = v89;
                  do
                  {
                    if (*(_QWORD *)v205 != v192)
                      objc_enumerationMutation(v88);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v204 + 1) + 8 * v90), "identifier"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v199, "objectForKeyedSubscript:", v91);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();

                    v196 = v92;
                    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v271[0] = v93;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v271, 1);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v196, "sortedArrayUsingDescriptors:", v94);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v95, "firstObject");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    v253 = 0u;
                    v251 = 0u;
                    v252 = 0u;
                    v250 = 0u;
                    v97 = v95;
                    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v250, buf, 16);
                    if (v98)
                    {
                      v99 = *(_QWORD *)v251;
                      do
                      {
                        for (k = 0; k != v98; ++k)
                        {
                          if (*(_QWORD *)v251 != v99)
                            objc_enumerationMutation(v97);
                          v101 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * k);
                          if ((objc_msgSend(v101, "intersectsDateInterval:", v96) & 1) != 0)
                            goto LABEL_60;
                          objc_msgSend(v96, "startDate");
                          v102 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v101, "endDate");
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v102, "timeIntervalSinceDate:", v103);
                          v105 = v104 > 15778800.0;

                          if (!v105)
                          {
LABEL_60:
                            v106 = v101;

                            v96 = v106;
                          }
                        }
                        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v250, buf, 16);
                      }
                      while (v98);
                    }

                    objc_msgSend(v96, "startDate");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v107, "timeIntervalSinceDate:", v194);
                    v109 = v108 < 31557600.0;

                    if (v109)
                    {

                      ++v159;
                      goto LABEL_93;
                    }
                    ++v90;
                    v88 = contexta;
                  }
                  while (v90 != v188);
                  v89 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v204, v256, 16);
                  if (v89)
                    continue;
                  break;
                }
              }

            }
            objc_msgSend(v177, "collectionBySubtracting:", v165);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "collectionByIntersecting:", v164);
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v178, "memoryGenerationContext");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "interestingWithAlternateJunkingSubsetFromMomentNodes:", v111);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v113, "count") > 4)
            {
              objc_msgSend(v113, "universalDateInterval");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "duration");
              v116 = v115;

              objc_msgSend(v177, "universalDateInterval");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "duration");
              v119 = v118;
              v120 = (void *)MEMORY[0x1E0D4B130];
              objc_msgSend(v117, "startDate");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = objc_msgSend(v120, "yearFromDate:", v121);

              v123 = (void *)MEMORY[0x1E0D4B130];
              objc_msgSend(v117, "endDate");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = objc_msgSend(v123, "yearFromDate:", v124);

              if (((v156 - v125) & ~((v156 - v125) >> 63)) >= 10)
                v126 = 10;
              else
                v126 = (v156 - v125) & ~((v156 - v125) >> 63);
              if (v125 < v122)
                v127 = -1;
              else
                v127 = v125 - v122;
              if (v125 - v122 < 10)
                v128 = v127 + 1;
              else
                v128 = 10;
              if (v116 < 7889400.0 || v116 < v119 / 3.0)
              {
                v155 = (uint64_t (*)(uint64_t, uint64_t))((char *)v155 + 1);
              }
              else
              {
                objc_msgSend(v185, "supersetCityNodes");
                v129 = v177;
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = objc_msgSend(v130, "count");
                v132 = v130;
                if (v131 == 1 || (v133 = objc_msgSend(v181, "count"), v132 = v181, v133 == 1))
                {
                  objc_msgSend(v132, "anyNode");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v185, "stateNodeAsCollection");
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "anyNode");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();

                  v129 = v177;
                }
                objc_msgSend(v181, "collectionByFormingUnionWith:", v130);
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = -[PGPotentialPastSupersetMemory initWithSupersetLocationNode:supersetDateInterval:interestingMomentNodes:momentNodes:]([PGPotentialPastSupersetMemory alloc], "initWithSupersetLocationNode:supersetDateInterval:interestingMomentNodes:momentNodes:", v134, v117, v113, v129);
                -[PGPotentialMemory setScore:](v137, "setScore:", (double)v128 / 10.0 * 0.4 + (double)v126 / 10.0 * 0.6);
                +[PGFeature featureWithNode:](PGFeature, "featureWithNode:", v134);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                if (v138)
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v138);
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGPotentialMemory setFeatures:](v137, "setFeatures:", v139);

                }
                -[PGPotentialPastSupersetMemory setSupersetLocationNodes:](v137, "setSupersetLocationNodes:", v136);
                if (objc_msgSend(v157, "length"))
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v157);
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGPotentialMemory setPeopleUUIDs:](v137, "setPeopleUUIDs:", v140);

                }
                objc_msgSend(v158, "addObject:", v137);

              }
            }
            else
            {
              ++v162;
            }

          }
LABEL_93:

          v85 = v177;
        }
        else
        {
          ++v174;
        }

        v83 = v183 + 1;
      }
      while (v183 + 1 != v173);
      v82 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v208, v257, 16);
      if (v82)
        continue;
      break;
    }
  }
  else
  {
    v174 = 0;
    v159 = 0;
    v155 = 0;
    v162 = 0;
    v169 = 0;
  }

  if (!v249)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v255[0] = v142;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v255[1] = v143;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v255, 2);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v158, "sortUsingDescriptors:", v141);
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v144 = v158;
    v145 = 0;
    v146 = -[NSObject countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v200, v254, 16);
    if (v146)
    {
      v147 = *(_QWORD *)v201;
LABEL_102:
      v148 = 0;
      while (1)
      {
        if (*(_QWORD *)v201 != v147)
          objc_enumerationMutation(v144);
        v149 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v148);
        objc_msgSend(v178, "progressBlock");
        v150 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, char *, double))v150)[2](v150, &v249, 0.0);

        if (v249)
          break;
        objc_msgSend(v149, "computeContentScore");
        if (v151 > 0.5 || -[PGFeaturedMemoryGenerator usesLowRequirements](v170, "usesLowRequirements"))
        {
          buf[0] = 0;
          v161[2](v161, v149, buf);
          if (buf[0])
            goto LABEL_113;
        }
        else
        {
          ++v145;
        }
        if (v146 == ++v148)
        {
          v146 = -[NSObject countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v200, v254, 16);
          if (v146)
            goto LABEL_102;
          goto LABEL_113;
        }
      }
    }
    else
    {
LABEL_113:

      objc_msgSend(v178, "loggingConnection");
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(_QWORD *)&buf[4] = 0;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v162;
        *(_WORD *)&buf[22] = 2048;
        v263 = v155;
        *(_WORD *)v264 = 2048;
        *(_QWORD *)&v264[2] = v159;
        *(_WORD *)&v264[10] = 2048;
        *(_QWORD *)&v264[12] = v169;
        v265 = 2048;
        v266 = v145;
        v267 = 2048;
        v268 = 0;
        v269 = 2048;
        v270 = v174;
        _os_log_impl(&dword_1CA237000, v144, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Found %lu, rejected %lu not interseting enough, %lu small superset duration overlap, %lu not disjoint from recent close supersets, %lu untimely, %lu low scoring, %lu insufficiently Superseted, %lu not enough scenes processed", buf, 0x52u);
      }
    }

LABEL_116:
  }

  _Block_object_dispose(&v221, 8);
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v9, "memoryMomentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "curationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:](PGMemoryGenerationHelper, "assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:", v14, v15, 0, v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v18, v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 67109120;
      v23[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGPastSupersetMemoryGenerator] One frequent location node expected, found %d", (uint8_t *)v23, 8u);
    }

    v20 = 0;
  }

  return v20;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _DWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v10, "memoryMomentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anyNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "curationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:](PGMemoryGenerationHelper, "assetFetchResultForMomentNodes:inLocationOrAreaNode:requireInteresting:curationManager:progressReporter:", v15, v16, 1, v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v19, v20, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24[0] = 67109120;
      v24[1] = objc_msgSend(v14, "count");
      _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "[PGPastSupersetMemoryGenerator] One frequent location node expected, found %d", (uint8_t *)v24, 8u);
    }

    v21 = 0;
  }

  return v21;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGPastSupersetMemoryGenerator;
  v5 = a4;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v10, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComplete:", 1, v10.receiver, v10.super_class);
  objc_msgSend(v5, "meNodeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v8);

  objc_msgSend(v6, "setFocusOnPeople:", 1);
  return v6;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PGPastSupersetMemoryGenerator;
  v7 = a5;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v14, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "memoryMomentNodes", v14.receiver, v14.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "universalDateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  v12 = v11;

  if (v12 > 31557600.0)
    objc_msgSend(v8, "setDuration:", 21);
  return v8;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGPastSupersetMemoryTitleGenerator *v16;
  void *v17;
  void *v18;
  PGPastSupersetMemoryTitleGenerator *v19;

  v9 = a7;
  v10 = a3;
  objc_msgSend(v10, "memoryMomentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "universalDateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphNamedLocationNodeCollection, "subsetInCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PGPastSupersetMemoryTitleGenerator alloc];
  objc_msgSend(v10, "memoryMomentNodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PGPastSupersetMemoryTitleGenerator initWithMomentNodes:supersetLocationNode:supersetDateInterval:titleGenerationContext:](v16, "initWithMomentNodes:supersetLocationNode:supersetDateInterval:titleGenerationContext:", v18, v15, v12, v9);

  return v19;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  PGYearChapterTitleGenerator *v12;

  v7 = a3;
  objc_msgSend(v7, "memoryMomentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yearNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 2)
    v12 = 0;
  else
    v12 = -[PGYearChapterTitleGenerator initWithTriggeredMemory:]([PGYearChapterTitleGenerator alloc], "initWithTriggeredMemory:", v7);

  return v12;
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (void)setLocalDate:(id)a3
{
  objc_storeStrong((id *)&self->_localDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDate, 0);
}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", objc_msgSend(v3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "targetsForSources:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v17 = v4;
    objc_msgSend(v5, "anyNode");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", v6, 0, *(_QWORD *)(a1 + 72));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loggingConnection");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "No densestLocationNode for supersetCityNode %@", buf, 0xCu);
      }

      v7 = v6;
    }
    objc_msgSend(*(id *)(a1 + 56), "targetsForSourceIdentifier:", objc_msgSend(v3, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "universalDateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject collection](v6, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject locationNodeCollection](v7, "locationNodeCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPastSupersetGroup pastSupersetGroupWithMomentNodes:dateInterval:supersetCityNodeAsCollection:densestCloseLocationNodeAsCollection:locationHelper:](PGPastSupersetGroup, "pastSupersetGroupWithMomentNodes:dateInterval:supersetCityNodeAsCollection:densestCloseLocationNodeAsCollection:locationHelper:", v10, v11, v12, v13, *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
    v4 = v17;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "anyNode");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v19 = v16;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "No supersetCityNode for home superset best address node %{private}@", buf, 0xCu);

    }
  }

}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_167(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "addressNodesFromLocationNodes:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  v11 = v8;
  v12 = v9;

  CLLocationCoordinate2DGetDistanceFrom();
  if (v10 <= 160000.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    goto LABEL_5;
  }
  if (v10 > (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count", v11, v12) * 160000.0)
LABEL_5:
    *a4 = 1;
}

void __81__PGPastSupersetMemoryGenerator__enumeratePotentialMemoriesWithGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "identifier"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  if (*(_BYTE *)(a1 + 56))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "densestCloseLocationNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionByFormingUnionWith:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

@end
