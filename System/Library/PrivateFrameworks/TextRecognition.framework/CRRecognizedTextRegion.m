@implementation CRRecognizedTextRegion

- (CRRecognizedTextRegion)initWithType:(unint64_t)a3 detectedLineRegion:(id)a4
{
  id v7;
  CRRecognizedTextRegion *v8;
  uint64_t v9;
  CRNormalizedQuad *boundingQuad;
  uint64_t v11;
  CRNormalizedPolyline *polygon;

  v7 = a4;
  v8 = -[CRRecognizedTextRegion init](self, "init");
  if (v8)
  {
    objc_msgSend(v7, "boundingQuad");
    v9 = objc_claimAutoreleasedReturnValue();
    boundingQuad = v8->_boundingQuad;
    v8->_boundingQuad = (CRNormalizedQuad *)v9;

    v8->_isCurved = objc_msgSend(v7, "isCurved");
    v8->_layoutDirection = objc_msgSend(v7, "layoutDirection");
    objc_msgSend(v7, "polygon");
    v11 = objc_claimAutoreleasedReturnValue();
    polygon = v8->_polygon;
    v8->_polygon = (CRNormalizedPolyline *)v11;

    v8->_textRegionType = a3;
    objc_storeStrong((id *)&v8->_detectedLineRegion, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRRecognizedTextRegion *v4;

  v4 = objc_alloc_init(CRRecognizedTextRegion);
  if (v4)
    -[CRRecognizedTextRegion _copyContentsToObject:](self, v4);
  return v4;
}

- (void)_copyContentsToObject:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "boundingQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBoundingQuad:", v4);

    objc_msgSend(a1, "polygon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPolygon:", v5);

    objc_msgSend(v3, "setLayoutDirection:", objc_msgSend(a1, "layoutDirection"));
    objc_msgSend(v3, "setTextRegionType:", objc_msgSend(a1, "textRegionType"));
    objc_msgSend(a1, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v6);

    objc_msgSend(a1, "subregions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSubregions:", v7);

    objc_msgSend(a1, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCandidates:", v8);

    objc_msgSend(v3, "setIsCurved:", objc_msgSend(a1, "isCurved"));
    objc_msgSend(a1, "activationProbability");
    objc_msgSend(v3, "setActivationProbability:");
    objc_msgSend(a1, "confidence");
    objc_msgSend(v3, "setConfidence:");
    objc_msgSend(a1, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocale:", v9);

    objc_msgSend(v3, "setWhitespaceInjected:", objc_msgSend(a1, "whitespaceInjected"));
    objc_msgSend(a1, "detectedLineRegion");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDetectedLineRegion:", v10);

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRMutableRecognizedTextRegion *v4;

  v4 = objc_alloc_init(CRMutableRecognizedTextRegion);
  if (v4)
    -[CRRecognizedTextRegion _copyContentsToObject:](self, v4);
  return v4;
}

- (id)createSubregionsForString:(id)a3 topWhiteSpacePoints:(id)a4 bottomWhiteSpacePoints:(id)a5 hasBoundarySpacePoints:(BOOL)a6 hasCharacterAndWordBoundaries:(BOOL)a7 tokenPermutation:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void **v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  _BOOL4 v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  _BOOL4 v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  int v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  uint64_t v97;
  int v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  CRNormalizedQuad *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  CRNormalizedQuad *v129;
  void *v130;
  id v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  _BOOL4 v142;
  uint64_t v143;
  id obj;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  BOOL v150;
  int v151;
  _BOOL8 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  void *v161;
  _BYTE v162[128];
  _BYTE v163[128];
  void *v164;
  _QWORD v165[3];

  v9 = a7;
  v10 = a6;
  v165[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v150 = v9;
  v152 = !v9;
  v145 = v16;
  if (v10)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointValue");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pointValue");
    if (v20 == v25 && v22 == v24)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pointValue");
      v32 = v31;
      v34 = v33;
      objc_msgSend(v145, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pointValue");
      v37 = v32 == v36;
      if (v34 != v38)
        v37 = 0;
      v151 = v37;

      v16 = v145;
    }
    else
    {
      v151 = 0;
    }

    objc_msgSend(v15, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "pointValue");
    v41 = v40;
    v43 = v42;
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "pointValue");
    v141 = 0;
    if (v41 == v46 && v43 == v45)
    {
      objc_msgSend(v16, "lastObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "pointValue");
      v49 = v48;
      v51 = v50;
      objc_msgSend(v145, "objectAtIndexedSubscript:", objc_msgSend(v145, "count") - 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "pointValue");
      v54 = v49 == v53;
      if (v51 != v55)
        v54 = 0;
      v141 = v54;

      v16 = v145;
    }

    if (objc_msgSend(v15, "count") == 4)
    {
      if ((v151 & v141) != 1)
        goto LABEL_27;
    }
    else if (objc_msgSend(v16, "count") != 4 || ((v151 ^ 1) & 1) != 0 || ((v141 ^ 1) & 1) != 0)
    {
      goto LABEL_27;
    }
    v27 = (void *)-[CRRecognizedTextRegion mutableCopy](self, "mutableCopy");
    objc_msgSend(v27, "setText:", v14);
    objc_msgSend(v27, "setSubregions:", 0);
    objc_msgSend(v27, "setCandidates:", 0);
    objc_msgSend(v27, "setTextRegionType:", v152);
    v164 = v27;
    v28 = (void *)MEMORY[0x1E0C99D20];
    v29 = &v164;
LABEL_26:
    objc_msgSend(v28, "arrayWithObjects:count:", v29, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_68;
  }
  if (!objc_msgSend(v15, "count") || !objc_msgSend(v16, "count"))
  {
    v27 = (void *)-[CRRecognizedTextRegion mutableCopy](self, "mutableCopy");
    objc_msgSend(v27, "setText:", v14);
    objc_msgSend(v27, "setCandidates:", 0);
    objc_msgSend(v27, "setSubregions:", 0);
    objc_msgSend(v27, "setTextRegionType:", v152);
    v165[0] = v27;
    v28 = (void *)MEMORY[0x1E0C99D20];
    v29 = (void **)v165;
    goto LABEL_26;
  }
  v141 = 1;
  v151 = 1;
LABEL_27:
  v142 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)objc_msgSend(v58, "mutableCopy");
  v60 = v59;
  v135 = v17;
  if (v17)
  {
    v133 = v58;
    v148 = v27;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v62 = v17;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v158;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v158 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(v60, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * i), "unsignedIntegerValue"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v67);

        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
      }
      while (v64);
    }

    v16 = v145;
    v27 = v148;
    v58 = v133;
  }
  else
  {
    v61 = v59;
  }
  objc_msgSend(v61, "removeObject:", &stru_1E98DC948);
  v68 = objc_msgSend(v61, "count");
  v69 = 2;
  if (!v142)
    v69 = -2;
  v70 = v69 + 2 * v68;
  if (objc_msgSend(v15, "count") == v70 && objc_msgSend(v16, "count") == v70)
  {
    v132 = v14;
    v134 = v58;
    v147 = v15;
    v149 = v27;
    v71 = objc_msgSend(v61, "count");
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    obj = v61;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
    if (!v72)
      goto LABEL_65;
    v73 = v72;
    v74 = v142;
    v146 = *(_QWORD *)v154;
    v139 = 2 * (v71 - !v142) - 1;
    v75 = 2;
    if (!v142)
      v75 = 0;
    v140 = v75;
    v137 = !v142 - v71;
    v136 = -(uint64_t)v142;
    while (1)
    {
      v76 = 0;
      v77 = 2 * v74;
      v143 = v137 + v74;
      v138 = v74;
      v78 = v136 + v74;
      do
      {
        if (*(_QWORD *)v154 != v146)
          objc_enumerationMutation(obj);
        v79 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v76);
        if (v78 + v76)
          v80 = 0;
        else
          v80 = v151;
        if (v80 == 1)
        {
          -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "topLeft");
          v83 = v82;
          v85 = v84;

          -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "bottomLeft");
          v88 = v87;
          v90 = v89;

          objc_msgSend(v147, "objectAtIndexedSubscript:", v140);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "pointValue");
          v93 = v92;
          v95 = v94;

          v96 = v16;
          v97 = v140;
        }
        else
        {
          if (v143 + v76)
            v98 = 0;
          else
            v98 = v141;
          if (v98 == 1)
          {
            objc_msgSend(v147, "objectAtIndexedSubscript:", v139);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "pointValue");
            v83 = v100;
            v85 = v101;

            objc_msgSend(v16, "objectAtIndexedSubscript:", v139);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "pointValue");
            v88 = v103;
            v90 = v104;

            -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "topRight");
            v93 = v106;
            v95 = v107;

            -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "bottomRight");
            goto LABEL_60;
          }
          objc_msgSend(v147, "objectAtIndexedSubscript:", v77 - 1);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "pointValue");
          v83 = v112;
          v85 = v113;

          objc_msgSend(v145, "objectAtIndexedSubscript:", v77 - 1);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "pointValue");
          v88 = v115;
          v90 = v116;

          v16 = v145;
          objc_msgSend(v147, "objectAtIndexedSubscript:", v77);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "pointValue");
          v93 = v118;
          v95 = v119;

          v96 = v145;
          v97 = v77;
        }
        objc_msgSend(v96, "objectAtIndexedSubscript:", v97);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "pointValue");
LABEL_60:
        v120 = v109;
        v121 = v110;

        v122 = (void *)-[CRRecognizedTextRegion mutableCopy](self, "mutableCopy");
        v123 = v122;
        if (v150)
        {
          objc_msgSend(v79, "combinedTokenSequenceString");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "setText:", v124);

        }
        else
        {
          objc_msgSend(v122, "setText:", v79);
        }
        objc_msgSend(v123, "setTextRegionType:", v152);
        objc_msgSend(v123, "setSubregions:", 0);
        v125 = [CRNormalizedQuad alloc];
        -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "normalizationSize");
        v129 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v125, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v83, v85, v93, v95, v120, v121, v88, v90, v127, v128);
        objc_msgSend(v123, "setBoundingQuad:", v129);

        objc_msgSend(v123, "setPolygon:", 0);
        objc_msgSend(v149, "addObject:", v123);

        ++v76;
        v77 += 2;
      }
      while (v73 != v76);
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
      v74 = v138 + v76;
      if (!v73)
      {
LABEL_65:

        v27 = v149;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v149);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v132;
        v58 = v134;
        v15 = v147;
        goto LABEL_67;
      }
    }
  }
  v130 = (void *)-[CRRecognizedTextRegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v130, "setText:", v14);
  objc_msgSend(v130, "setSubregions:", 0);
  objc_msgSend(v130, "setCandidates:", 0);
  objc_msgSend(v130, "setTextRegionType:", v152);
  v161 = v130;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_67:
  v17 = v135;
LABEL_68:

  return v56;
}

- (id)createCharacterSubFeaturesTopWhiteSpacePoints:(id)a3 bottomWhiteSpacePoints:(id)a4 falsePositiveFiltering:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  CRRecognizedTextRegion *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  _QWORD v32[4];
  _QWORD v33[5];
  id v34;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRecognizedTextRegion text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = characterCount(v11);

  if (v8 && v9 && objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    -[CRRecognizedTextRegion text](self, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRecognizedTextRegion text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2;
    v23[3] = &unk_1E98DB310;
    v24 = v8;
    v29 = 2 * v12 - 2;
    v31 = a5;
    v25 = v9;
    v26 = self;
    v28 = v32;
    v30 = v12;
    v16 = v10;
    v27 = v16;
    objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v23);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v32, 8);
  }
  else
  {
    -[CRRecognizedTextRegion text](self, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRecognizedTextRegion text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke;
    v33[3] = &unk_1E98DB2E8;
    v33[4] = self;
    v21 = v10;
    v34 = v21;
    objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 2, v33);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

void __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "setTextRegionType:", 0);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

void __118__CRRecognizedTextRegion_createCharacterSubFeaturesTopWhiteSpacePoints_bottomWhiteSpacePoints_falsePositiveFiltering___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CRNormalizedQuad *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  CRNormalizedQuad *v46;
  id v47;

  v47 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") != *(_QWORD *)(a1 + 72)
    || objc_msgSend(*(id *)(a1 + 40), "count") != *(_QWORD *)(a1 + 72))
  {
    v25 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    objc_msgSend(v25, "setText:", v47);
    objc_msgSend(v25, "setCandidates:", 0);
    objc_msgSend(v25, "setSubregions:", 0);
    objc_msgSend(v25, "setTextRegionType:", 0);
LABEL_9:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v25);

    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 88)
    || (objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v47, "rangeOfCharacterFromSet:", v3),
        v3,
        v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 80) - 1;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2 * v5 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pointValue");
      v9 = v8;
      v11 = v10;

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pointValue");
      v14 = v13;
      v16 = v15;

      if (v5 == v6)
      {
        objc_msgSend(*(id *)(a1 + 48), "boundingQuad");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "topRight");
        v19 = v18;
        v21 = v20;

        objc_msgSend(*(id *)(a1 + 48), "boundingQuad");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bottomRight");
LABEL_14:
        v40 = v23;
        v41 = v24;

        v25 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
        objc_msgSend(v25, "setTextRegionType:", 0);
        objc_msgSend(v25, "setText:", v47);
        v42 = [CRNormalizedQuad alloc];
        objc_msgSend(*(id *)(a1 + 48), "boundingQuad");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "normalizationSize");
        v46 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v42, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v9, v11, v19, v21, v40, v41, v14, v16, v44, v45);
        objc_msgSend(v25, "setBoundingQuad:", v46);

        objc_msgSend(v25, "setPolygon:", 0);
        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pointValue");
      v19 = v38;
      v21 = v39;

      v35 = *(void **)(a1 + 40);
      v36 = 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "boundingQuad");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topLeft");
      v9 = v27;
      v11 = v28;

      objc_msgSend(*(id *)(a1 + 48), "boundingQuad");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bottomLeft");
      v14 = v30;
      v16 = v31;

      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "pointValue");
      v19 = v33;
      v21 = v34;

      v35 = *(void **)(a1 + 40);
      v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    objc_msgSend(v35, "objectAtIndexedSubscript:", v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pointValue");
    goto LABEL_14;
  }
LABEL_10:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CRRecognizedTextRegion text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRecognizedTextRegion boundingQuad](self, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\"\t%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CRRecognizedTextRegion subregions](self, "subregions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSString *)v6;
}

- (double)activationProbability
{
  return self->_activationProbability;
}

- (void)setActivationProbability:(double)a3
{
  self->_activationProbability = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPolygon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (BOOL)whitespaceInjected
{
  return self->_whitespaceInjected;
}

- (void)setWhitespaceInjected:(BOOL)a3
{
  self->_whitespaceInjected = a3;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubregions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)candidates
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCandidates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CRDetectedLineRegion)detectedLineRegion
{
  return (CRDetectedLineRegion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDetectedLineRegion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (void)setTextRegionType:(unint64_t)a3
{
  self->_textRegionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_detectedLineRegion, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
}

@end
