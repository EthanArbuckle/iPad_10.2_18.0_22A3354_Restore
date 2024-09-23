@implementation CRHungarianTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  void *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  float v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  unint64_t v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  double v97;
  uint64_t v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t j;
  void *v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t k;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t m;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  double v130;
  uint64_t v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t n;
  void *v143;
  void *v144;
  double v145;
  double v146;
  void *v147;
  CRTrackingAssociatorResults *v148;
  void *v149;
  uint64_t v151;
  id v152;
  id v153;
  void (**v154)(id, id, void *, _QWORD *);
  void *v155;
  void (**v156)(id, void *, _QWORD *);
  id v157;
  id v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  __int128 v165;
  __int128 v166;
  id v167;
  void *v168;
  void *v169;
  __int128 v170;
  id v171;
  _BOOL4 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _QWORD v201[5];
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _QWORD v212[18];

  v172 = a4;
  v212[16] = *MEMORY[0x1E0C80C00];
  v160 = a3;
  v167 = a5;
  v152 = a6;
  v156 = (void (**)(id, void *, _QWORD *))a7;
  v154 = (void (**)(id, id, void *, _QWORD *))a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = 0;
  v203 = &v202;
  v204 = 0x2050000000;
  v12 = (void *)_MergedGlobals_23;
  v205 = _MergedGlobals_23;
  if (!_MergedGlobals_23)
  {
    v201[0] = MEMORY[0x1E0C809B0];
    v201[1] = 3221225472;
    v201[2] = __getFTBipartiteMatcherClass_block_invoke;
    v201[3] = &unk_1E98DB018;
    v201[4] = &v202;
    __getFTBipartiteMatcherClass_block_invoke((uint64_t)v201);
    v12 = (void *)v203[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v202, 8);
  v153 = objc_alloc_init(v13);
  objc_msgSend(v167, "count");
  v14 = objc_msgSend(v160, "count");
  v151 = (uint64_t)&v151;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v151 - v15;
  if (objc_msgSend(v160, "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(v160, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v167, "count"))
      {
        v19 = 0;
        do
        {
          objc_msgSend(v167, "objectAtIndexedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v172)
            objc_msgSend(v20, "boundingQuadAtOCRDispatch");
          else
            objc_msgSend(v20, "boundingQuad");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "boundingQuad");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "boundingBoxClippedIOUWithQuad:", v23);
          v25 = v24;

          v26 = objc_msgSend(v167, "count");
          v27 = 1.0 - v25;
          *(float *)&v16[4 * v19 + 4 * v17 * v26] = v27;

          ++v19;
        }
        while (v19 < objc_msgSend(v167, "count"));
      }

      ++v17;
    }
    while (v17 < objc_msgSend(v160, "count"));
  }
  if (objc_msgSend(v160, "count"))
  {
    v28 = objc_msgSend(v160, "count");
    v29 = objc_msgSend(v167, "count");
    objc_msgSend(v153, "computeMatchingForCostMatrix:withRowCount:columnCount:", v16, v28, v29);
    v161 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v161 = 0;
  }
  v164 = (id)objc_opt_new();
  v163 = (id)objc_opt_new();
  v30 = 0.0;
  if (v161 && objc_msgSend(v161, "count"))
  {
    v31 = 0;
    do
    {
      objc_msgSend(v160, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "objectAtIndexedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqual:", &unk_1E9926A78);

      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTrackingID:", v35);

        LOBYTE(v201[0]) = 1;
        v156[2](v156, v32, v201);
        if (LOBYTE(v201[0]))
        {
          objc_msgSend(v32, "trackingID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "addObject:", v36);

          objc_msgSend(v169, "addObject:", v32);
          objc_msgSend(v164, "addObject:", v32);
          objc_msgSend(v32, "boundingQuad");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "denormalizedQuad");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "area");
          v40 = v39;

          v30 = v30 + v40;
        }
      }
      else
      {
        v41 = objc_msgSend(v167, "count");
        objc_msgSend(v161, "objectAtIndexedSubscript:", v31);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = *(float *)&v16[4 * v41 * v31 + 4 * (int)objc_msgSend(v42, "intValue")] < 0.55;

        objc_msgSend(v161, "objectAtIndexedSubscript:", v31);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "intValue");
        objc_msgSend(v167, "objectAtIndexedSubscript:", v45);
        v171 = (id)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v171, "trackingID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTrackingID:", v46);

          LOBYTE(v201[0]) = 1;
          v154[2](v154, v171, v32, v201);
          if (!LOBYTE(v201[0]))
          {
            objc_msgSend(v32, "originalBoundingQuad");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "setOriginalBoundingQuad:", v47);

            objc_msgSend(v32, "boundingQuad");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "setBoundingQuad:", v48);

            objc_msgSend(v32, "boundingQuadHomography");
            v50 = v49;
            HIDWORD(v50) = HIDWORD(v165);
            HIDWORD(v51) = HIDWORD(v166);
            HIDWORD(v52) = HIDWORD(v170);
            v165 = v50;
            v166 = v51;
            v170 = v52;
            objc_msgSend(v171, "setBoundingQuadHomography:", *(double *)&v49);
          }
          objc_msgSend(v171, "trackingID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "addObject:", v53);

          objc_msgSend(v169, "addObject:", v171);
          v54 = objc_msgSend(v167, "count");
          objc_msgSend(v161, "objectAtIndexedSubscript:", v31);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = *(float *)&v16[4 * v54 * v31 + 4 * (int)objc_msgSend(v55, "intValue")];
          objc_msgSend(v171, "boundingQuad");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "denormalizedQuad");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "area");
          v60 = v59;
          objc_msgSend(v32, "boundingQuad");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "denormalizedQuad");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "area");
          v64 = v63;

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTrackingID:", v65);

          LOBYTE(v201[0]) = 1;
          v156[2](v156, v32, v201);
          if (LOBYTE(v201[0]))
          {
            objc_msgSend(v164, "addObject:", v32);
            objc_msgSend(v32, "trackingID");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "addObject:", v66);

            objc_msgSend(v169, "addObject:", v32);
          }
          objc_msgSend(v163, "addObject:", v171);
          objc_msgSend(v171, "trackingID");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "addObject:", v67);

          v68 = objc_msgSend(v167, "count");
          objc_msgSend(v161, "objectAtIndexedSubscript:", v31);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = *(float *)&v16[4 * v68 * v31 + 4 * (int)objc_msgSend(v69, "intValue")];
          objc_msgSend(v171, "boundingQuad");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "denormalizedQuad");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "area");
          v60 = v72;
          objc_msgSend(v32, "boundingQuad");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "denormalizedQuad");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "area");
          v64 = v75;

        }
        v30 = v30 + (v60 + v64) * v56 * 0.5;
      }

      ++v31;
    }
    while (v31 < objc_msgSend(v161, "count"));
  }
  if (objc_msgSend(v167, "count"))
  {
    v76 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v161, "containsObject:", v77);

      if ((v78 & 1) == 0)
      {
        objc_msgSend(v167, "objectAtIndexedSubscript:", v76);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "trackingID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "addObject:", v80);

        objc_msgSend(v167, "objectAtIndexedSubscript:", v76);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "boundingQuad");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "denormalizedQuad");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "area");
        v85 = v84;

        v30 = v30 + v85;
      }
      ++v76;
    }
    while (v76 < objc_msgSend(v167, "count"));
  }
  v158 = (id)objc_opt_new();
  v157 = (id)objc_opt_new();
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  *(_QWORD *)&v165 = v163;
  v163 = (id)objc_msgSend((id)v165, "countByEnumeratingWithState:objects:count:", &v197, v212, 16);
  if (v163)
  {
    v162 = *(id *)v198;
    do
    {
      *(_QWORD *)&v166 = 0;
      do
      {
        if (*(id *)v198 != v162)
          objc_enumerationMutation((id)v165);
        v171 = *(id *)(*((_QWORD *)&v197 + 1) + 8 * v166);
        *(_QWORD *)&v170 = objc_opt_new();
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        v86 = v164;
        v87 = 0;
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v193, v211, 16);
        if (v88)
        {
          v89 = *(_QWORD *)v194;
          do
          {
            for (i = 0; i != v88; ++i)
            {
              if (*(_QWORD *)v194 != v89)
                objc_enumerationMutation(v86);
              v91 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * i);
              if (v172)
                objc_msgSend(v171, "boundingQuadAtOCRDispatch");
              else
                objc_msgSend(v171, "boundingQuad");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "boundingQuad");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v92, "overlapsNormalizedQuad:", v93);

              if (v94)
              {
                objc_msgSend((id)v170, "addObject:", v91);
                objc_msgSend(v91, "boundingQuad");
                v95 = objc_claimAutoreleasedReturnValue();
                v96 = (void *)v95;
                if (v87)
                {
                  objc_msgSend(v87, "baselineAngle");
                  *(float *)&v97 = v97;
                  objc_msgSend(v87, "unionWithNormalizedQuad:baselineAngle:", v96, v97);
                  v98 = objc_claimAutoreleasedReturnValue();

                  v87 = (void *)v98;
                }
                else
                {
                  v87 = (void *)v95;
                }
              }

            }
            v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v193, v211, 16);
          }
          while (v88);
        }

        if ((unint64_t)objc_msgSend((id)v170, "count") >= 2)
        {
          objc_msgSend(v171, "boundingQuad");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "boundingBoxClippedIOUWithQuad:", v87);
          v101 = v100;

          if (1.0 - v101 <= 0.550000012)
          {
            objc_msgSend(v171, "boundingQuad", 1.0 - v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "denormalizedQuad");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "area");
            v105 = v104;

            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v106 = (id)v170;
            v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v189, v210, 16);
            v30 = v30 - v105;
            if (v107)
            {
              v108 = *(_QWORD *)v190;
              do
              {
                for (j = 0; j != v107; ++j)
                {
                  if (*(_QWORD *)v190 != v108)
                    objc_enumerationMutation(v106);
                  objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * j), "boundingQuad");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "denormalizedQuad");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "area");
                  v113 = v112;

                  v30 = v30 - v113;
                }
                v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v189, v210, 16);
              }
              while (v107);
            }

            objc_msgSend(v158, "addObject:", v171);
            objc_msgSend(v169, "addObject:", v171);
            objc_msgSend(v157, "addObjectsFromArray:", v106);
            objc_msgSend(v171, "trackingID");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "removeObject:", v114);

            v187 = 0u;
            v188 = 0u;
            v185 = 0u;
            v186 = 0u;
            v115 = v106;
            v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
            if (v116)
            {
              v117 = *(_QWORD *)v186;
              do
              {
                for (k = 0; k != v116; ++k)
                {
                  if (*(_QWORD *)v186 != v117)
                    objc_enumerationMutation(v115);
                  v119 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * k);
                  objc_msgSend(v169, "removeObject:", v119);
                  objc_msgSend(v119, "trackingID");
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v168, "removeObject:", v120);

                }
                v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
              }
              while (v116);
            }

          }
        }

        *(_QWORD *)&v166 = v166 + 1;
      }
      while ((id)v166 != v163);
      v163 = (id)objc_msgSend((id)v165, "countByEnumeratingWithState:objects:count:", &v197, v212, 16);
    }
    while (v163);
  }

  objc_msgSend((id)v165, "removeObjectsInArray:", v158);
  objc_msgSend(v164, "removeObjectsInArray:", v157);
  objc_msgSend(v158, "removeAllObjects");
  objc_msgSend(v157, "removeAllObjects");
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v162 = v164;
  v164 = (id)objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v181, v208, 16);
  if (v164)
  {
    v163 = *(id *)v182;
    do
    {
      *(_QWORD *)&v166 = 0;
      do
      {
        if (*(id *)v182 != v163)
          objc_enumerationMutation(v162);
        v171 = *(id *)(*((_QWORD *)&v181 + 1) + 8 * v166);
        *(_QWORD *)&v170 = objc_opt_new();
        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        v121 = (id)v165;
        v122 = 0;
        v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v177, v207, 16);
        if (v123)
        {
          v124 = *(_QWORD *)v178;
          do
          {
            for (m = 0; m != v123; ++m)
            {
              if (*(_QWORD *)v178 != v124)
                objc_enumerationMutation(v121);
              v126 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * m);
              if (v172)
                objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * m), "boundingQuadAtOCRDispatch");
              else
                objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * m), "boundingQuad");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "boundingQuad");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              v129 = objc_msgSend(v127, "overlapsNormalizedQuad:", v128);

              if (v129)
              {
                objc_msgSend((id)v170, "addObject:", v126);
                if (v122)
                {
                  objc_msgSend(v122, "baselineAngle");
                  *(float *)&v130 = v130;
                  objc_msgSend(v122, "unionWithNormalizedQuad:baselineAngle:", v127, v130);
                  v131 = objc_claimAutoreleasedReturnValue();

                  v122 = (void *)v131;
                }
                else
                {
                  objc_msgSend(v126, "boundingQuad");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                }
              }

            }
            v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v177, v207, 16);
          }
          while (v123);
        }

        if ((unint64_t)objc_msgSend((id)v170, "count") >= 2)
        {
          objc_msgSend(v171, "boundingQuad");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "boundingBoxClippedIOUWithQuad:", v122);
          v134 = v133;

          if (1.0 - v134 <= 0.550000012)
          {
            objc_msgSend(v171, "boundingQuad", 1.0 - v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "denormalizedQuad");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "area");
            v138 = v137;

            v175 = 0u;
            v176 = 0u;
            v173 = 0u;
            v174 = 0u;
            v139 = (id)v170;
            v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v173, v206, 16);
            v30 = v30 - v138;
            if (v140)
            {
              v141 = *(_QWORD *)v174;
              do
              {
                for (n = 0; n != v140; ++n)
                {
                  if (*(_QWORD *)v174 != v141)
                    objc_enumerationMutation(v139);
                  objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * n), "boundingQuad");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "denormalizedQuad");
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v144, "area");
                  v146 = v145;

                  v30 = v30 - v146;
                }
                v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v173, v206, 16);
              }
              while (v140);
            }

            objc_msgSend(v169, "addObjectsFromArray:", v139);
            objc_msgSend(v159, "removeObjectsInArray:", v139);
            objc_msgSend(v169, "removeObject:", v171);
            objc_msgSend(v171, "trackingID");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "removeObject:", v147);

          }
        }

        *(_QWORD *)&v166 = v166 + 1;
      }
      while ((id)v166 != v164);
      v164 = (id)objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v181, v208, 16);
    }
    while (v164);
  }

  v148 = [CRTrackingAssociatorResults alloc];
  v149 = -[CRTrackingAssociatorResults initWithTotalError:tracked:updatedRegionIDs:removedRegionIDs:addedRegionIDs:](v148, v169, v155, v159, v168, v30);

  return v149;
}

@end
