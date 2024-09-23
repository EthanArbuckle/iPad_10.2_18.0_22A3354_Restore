@implementation PGHighlightEnrichmentUtilities

+ (id)assetPropertySetsForEnrichment
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD19D8];
  v4[0] = *MEMORY[0x1E0CD1960];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyAssetForDayGroupHighlightWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curationManager:(id)a5 progressBlock:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(void *, _QWORD *, double);
  double v13;
  int *v14;
  double Current;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t i;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  _BOOL8 v54;
  double v55;
  _BOOL4 v56;
  double v57;
  double v58;
  char v59;
  float v61;
  float v62;
  double v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  _BOOL4 v72;
  int v73;
  int v74;
  double v75;
  void *v76;
  _BOOL4 v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  int v91;
  int v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  BOOL v104;
  char v105;
  char v106;
  id v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v114;
  void *v115;
  id v116;
  double v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  int v125;
  void *v126;
  void *v127;
  int v128;
  char v129;
  void *v130;
  id v131;
  void *v132;
  _BOOL4 v133;
  _BOOL4 v134;
  void (**v135)(void *, _QWORD *, double);
  unsigned int v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  id obj;
  int v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint8_t buf[4];
  _BYTE v157[18];
  __int16 v158;
  void *v159;
  __int16 v160;
  void *v161;
  __int16 v162;
  double v163;
  __int16 v164;
  double v165;
  __int16 v166;
  double v167;
  __int16 v168;
  _BOOL4 v169;
  __int16 v170;
  int v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  double v175;
  _BYTE v176[128];
  _QWORD v177[6];

  v8 = a4;
  v177[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v131 = a5;
  v11 = a6;
  v12 = (void (**)(void *, _QWORD *, double))_Block_copy(v11);
  v13 = 0.0;
  v14 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
  if (v12)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v151) = 0;
      v12[2](v12, &v151, 0.0);
      if ((_BYTE)v151)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 61;
          *(_WORD *)&v157[4] = 2080;
          *(_QWORD *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Enrich/PGHighlightEnrichmentUtilities.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = 0;
        goto LABEL_123;
      }
      v13 = Current;
    }
  }
  v124 = a1;
  v116 = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("promotionScore"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v177[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 3);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "childHighlights");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingDescriptors:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "highlightNode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v23, "isTrip");
  v130 = v23;
  objc_msgSend(v23, "graph");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v10;
  v24 = v131;
  v135 = v12;
  v144 = (int)v19;
  if ((_DWORD)v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "highlight");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "assetCollection");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlight");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "assetCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "highlight");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "assetCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedSubtitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v157 = v25;
    *(_WORD *)&v157[8] = 2112;
    *(_QWORD *)&v157[10] = v28;
    v158 = 2112;
    v159 = v31;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "TripKeyAsset: highlight (%@): %@, %@", buf, 0x20u);

    v12 = v135;
    v10 = v118;

    v14 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    v24 = v131;

  }
  objc_msgSend(v24, "photoLibrary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "librarySpecificFetchOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setSharingFilter:", v8);
  objc_msgSend(v33, "setIncludeGuestAssets:", 1);
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFetchPropertySets:", v34);

  v114 = v33;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", v22, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CD1390];
  v148 = v35;
  objc_msgSend(v35, "allValues");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "highlightTailorContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "curationContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "prefetchOnAssets:options:curationContext:", v37, 31, v39);

  objc_msgSend(v10, "highlightTailorContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "neighborScoreComputer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "meaningLabelsByChildHighlightUUID");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (v144)
  {
    objc_msgSend(v24, "sceneGeography");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = 0;
  }
  v115 = (void *)v20;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v41 = v22;
  obj = v41;
  v150 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v152, v176, 16);
  if (!v150)
  {
    v145 = 0;
    goto LABEL_114;
  }
  v129 = 0;
  v145 = 0;
  v146 = *(_QWORD *)v153;
  v42 = *MEMORY[0x1E0D77DF0];
  v43 = 1;
  v44 = 0.0;
  v45 = 0.0;
  v46 = 0.0;
  v47 = 0.0;
  v141 = 0.0;
  v117 = *MEMORY[0x1E0D77DF0];
  while (2)
  {
    for (i = 0; i != v150; ++i)
    {
      if (*(_QWORD *)v153 != v146)
        objc_enumerationMutation(obj);
      v49 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * i);
      v50 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v12)
      {
        v51 = CFAbsoluteTimeGetCurrent();
        if (v51 - v13 >= *((double *)v14 + 72))
        {
          LOBYTE(v151) = 0;
          v12[2](v12, &v151, 0.5);
          if ((_BYTE)v151)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v157 = 109;
              *(_WORD *)&v157[4] = 2080;
              *(_QWORD *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Enrich/PGHighlightEnrichmentUtilities.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            objc_autoreleasePoolPop(v50);
            v109 = obj;

            v16 = 0;
            v10 = v118;
            v110 = v115;
            v11 = v116;
            v111 = v114;
            goto LABEL_120;
          }
          v13 = v51;
        }
      }
      objc_msgSend(v49, "uuid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v54 = 1;
        if ((objc_msgSend(v53, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 0, 1) & 1) == 0)
        {
          objc_msgSend(v53, "curationScore");
          v54 = v55 <= v42;
        }
        v56 = !v54;
        if (!(v43 | !v54))
        {
          v43 = 0;
          goto LABEL_38;
        }
        objc_msgSend(v49, "promotionScore");
        v58 = v57;
        if (v57 >= v44)
          v59 = 1;
        else
          v59 = v144;
        if ((v59 & 1) == 0)
        {
          if ((v43 & 1) == 0)
          {

            objc_autoreleasePoolPop(v50);
            v14 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
            v41 = obj;
            goto LABEL_114;
          }
          if (v45 > v42 && v54)
          {
            v43 = 1;
LABEL_38:
            v14 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
            goto LABEL_106;
          }
        }
        v140 = v45;
        v151 = 0;
        objc_msgSend(v53, "overallAestheticScore");
        v62 = v61;
        v63 = 0.0;
        v138 = v47;
        v139 = v44;
        v142 = v13;
        if (!v144)
        {
          v73 = 0;
          v137 = 0;
          LODWORD(v66) = 0;
          v74 = 1;
          v75 = 0.0;
          v70 = v58;
          goto LABEL_78;
        }
        v136 = v43;
        v64 = v130;
        objc_msgSend(v49, "localIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "childHighlightNodeOfGroupHighlightNode:withLocalIdentifier:", v64, v65);
        v66 = objc_claimAutoreleasedReturnValue();

        if (!v66)
        {

          v73 = 0;
          v137 = 0;
          v74 = 1;
          v75 = 0.0;
          v70 = v58;
          v12 = v135;
          v43 = v136;
          goto LABEL_78;
        }
        v126 = v50;
        objc_msgSend(v49, "localIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "objectForKeyedSubscript:", v67);
        v68 = objc_claimAutoreleasedReturnValue();

        v127 = v64;
        objc_msgSend(v124, "meaningScoreWithMeanings:forLongTrip:graph:collection:keyAsset:keyAssetCriteriaScore:curationManager:", v68, objc_msgSend(v64, "isLongTrip"), v123, v66, v53, &v151, v131);
        v63 = v69;
        v70 = v58;
        v132 = (void *)v66;
        if (v58 >= 0.6)
        {
          v70 = v58;
          if (v69 == 0.0)
          {
            objc_msgSend((id)v66, "nonMeaningfulPromotionScoreForTripKeyAssetWithEnrichmentState:neighborScoreComputer:", objc_msgSend(v49, "enrichmentState"), v119);
            v70 = v71;
          }
        }
        v12 = v135;
        if (v63 <= v47)
        {
          v72 = v63 == v47;
          if (v70 <= v44)
            v72 = 0;
        }
        else
        {
          v72 = 1;
        }
        v133 = v72;
        v76 = (void *)v68;
        v77 = v63 == v47;
        if (v70 != v44)
          v77 = 0;
        v134 = v77;
        if (v121)
        {
          v120 = v46;
          objc_msgSend(v53, "clsIconicSceneScoreWithSceneGeography:", v121);
          v75 = v78;
          objc_msgSend(v53, "curationModel");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "iconicScoreModel");
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v145, "curationModel");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "iconicScoreModel");
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v80, "minimumMeaningfulIconicScore");
          v84 = v83;
          objc_msgSend(v80, "similarIconicScoreThreshold");
          v86 = v85;
          if (v75 >= v84)
          {
            objc_msgSend(v53, "curationModel");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = objc_msgSend(v87, "isAestheticallyPrettyGoodWithAsset:", v53);

          }
          else
          {
            v128 = 0;
          }
          if (v145)
          {
            v88 = objc_msgSend(v82, "version");
            v89 = objc_msgSend(v80, "version");
            v90 = vabdd_f64(v75, v141);
            if (v88 == v89)
              v91 = v128;
            else
              v91 = 0;
            if (v90 <= v86)
              v92 = v91;
            else
              v92 = 0;
            v93 = objc_msgSend(v80, "bucketForIconicScore:", v75);
            v94 = objc_msgSend(v82, "bucketForIconicScore:", v141);
            v42 = v117;
            v125 = v92;
            if (v128)
              v137 = (v93 > v94) & ~v92;
            else
              v137 = 0;
            v46 = v120;
            v76 = (void *)v68;
          }
          else
          {
            v137 = 0;
            v125 = 0;
            v42 = v117;
            v46 = v120;
          }

          v12 = v135;
        }
        else
        {
          v137 = 0;
          LOBYTE(v128) = 0;
          v125 = 0;
          v75 = 0.0;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v49, "uuid");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedTitle");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedSubtitle");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "allObjects");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "componentsJoinedByString:", CFSTR(", "));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414850;
          *(_QWORD *)v157 = v95;
          *(_WORD *)&v157[8] = 2112;
          *(_QWORD *)&v157[10] = v96;
          v158 = 2112;
          v159 = v97;
          v160 = 2112;
          v161 = v99;
          v162 = 2048;
          v163 = v63;
          v164 = 2048;
          v165 = v70;
          v166 = 2048;
          v167 = v58;
          v168 = 1024;
          v169 = v133;
          v170 = 1024;
          v171 = v134;
          v172 = 2048;
          v173 = v151;
          v174 = 2048;
          v175 = v75;
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "TripKeyAsset: child (%@): %@, %@\n\t[%@], meaningScore = %.3f, promotionScore = %.3f (%.3f), hasHigherMeaningScore %d, hasSameMeaningScore %d, criteriaScore %.3f, iconicSceneScore %.3f", buf, 0x68u);

          v12 = v135;
        }

        v74 = v134;
        if (v134)
        {
          v43 = v136;
          v50 = v126;
          LODWORD(v66) = v125;
          if (!v133)
          {
            v73 = 0;
            v129 |= v128;
            v74 = 1;
            goto LABEL_78;
          }
        }
        else
        {
          v43 = v136;
          v50 = v126;
          LODWORD(v66) = v125;
          if (!v133)
          {
            v73 = 0;
            v74 = 0;
LABEL_78:
            v100 = v62;
            objc_msgSend(v53, "clsContentScore");
            v45 = v101;
            v102 = v46;
            v103 = vabdd_f64(v100, v46);
            if (v145)
            {
              if (v43 & v56 | v54)
              {
                if (v43 & v56 & 1 | (v101 > v140))
                  goto LABEL_96;
              }
              else if ((v129 & 1) != 0)
              {
                if (((v73 | v74 & v137) & 1) != 0)
                  goto LABEL_96;
                v104 = v101 > v140;
                v105 = v74 & v66;
                if (v103 <= 0.025)
                  v105 = 0;
                if (v102 >= v100)
                  v105 = 0;
                if (v105 & 1 | ((v74 & 1) == 0) | ((v66 & 1) == 0) | (v103 > 0.025))
                  v104 = v105;
                if (v104)
                  goto LABEL_96;
              }
              else
              {
                if ((v73 & 1) != 0)
                  goto LABEL_96;
                v106 = v102 < v100;
                if (v74 & (v101 > v140) | ((v74 & 1) == 0) | (v101 != v140))
                  v106 = v74 & (v101 > v140);
                if ((v106 & 1) != 0)
                  goto LABEL_96;
              }
              v70 = v139;
              v45 = v140;
              v54 = v43;
              v100 = v102;
              v63 = v138;
              v107 = v145;
LABEL_105:
              v14 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
              v44 = v70;
              v43 = v54;
              v46 = v100;
              v47 = v63;
              v145 = v107;
              v13 = v142;
              goto LABEL_106;
            }
LABEL_96:
            v107 = v53;

            v108 = v141;
            if (v75 > v141)
              v108 = v75;
            if (!(_DWORD)v66)
              v108 = v75;
            v141 = v108;
            if (v103 <= 0.025 && v102 >= v100)
              v100 = v102;
            goto LABEL_105;
          }
        }
        v73 = 1;
        v129 = v128;
        goto LABEL_78;
      }
LABEL_106:

      objc_autoreleasePoolPop(v50);
    }
    v41 = obj;
    v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v176, 16);
    if (v150)
      continue;
    break;
  }
LABEL_114:

  v10 = v118;
  v110 = v115;
  v11 = v116;
  v111 = v114;
  if (v12
    && CFAbsoluteTimeGetCurrent() - v13 >= *((double *)v14 + 72)
    && (LOBYTE(v151) = 0, v12[2](v12, &v151, 1.0), (_BYTE)v151))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v157 = 248;
      *(_WORD *)&v157[4] = 2080;
      *(_QWORD *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Enrich/PGHighlightEnrichmentUtilities.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v16 = 0;
    v109 = obj;
LABEL_120:
    v112 = v145;
  }
  else
  {
    v112 = v145;
    v16 = v112;
    v109 = obj;
  }

LABEL_123:
  return v16;
}

+ (id)childHighlightNodeOfGroupHighlightNode:(id)a3 withLocalIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__58134;
  v17 = __Block_byref_object_dispose__58135;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__PGHighlightEnrichmentUtilities_childHighlightNodeOfGroupHighlightNode_withLocalIdentifier___block_invoke;
  v10[3] = &unk_1E8433078;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateHighlightNodesUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (double)meaningScoreWithMeanings:(id)a3 forLongTrip:(BOOL)a4 graph:(id)a5 collection:(id)a6 keyAsset:(id)a7 keyAssetCriteriaScore:(double *)a8 curationManager:(id)a9
{
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double *v29;
  id v30;
  id v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v29 = a8;
  v12 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v31 = a5;
  v30 = a6;
  v14 = a7;
  v15 = a9;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    if (v12)
      v19 = 0.2;
    else
      v19 = 0.4;
    v20 = 0.0;
    v21 = 0.0;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v13);
        v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22);
        v24 = 0.0;
        switch(+[PGGraph meaningForMeaningLabel:](PGGraph, "meaningForMeaningLabel:", v23, v29))
        {
          case 1uLL:
            v24 = 0.5;
            break;
          case 2uLL:
          case 3uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 9uLL:
          case 16uLL:
            v24 = 0.1;
            break;
          case 4uLL:
            v24 = 0.3;
            break;
          case 10uLL:
          case 11uLL:
          case 12uLL:
          case 13uLL:
          case 14uLL:
            v24 = v19;
            break;
          default:
            break;
        }
        if (v24 >= v21)
        {
          objc_msgSend(v15, "curationCriteriaFactory");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", v30, v23, v31, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = 0.0;
          if (objc_msgSend(v26, "passesForItem:score:", v14, &v32)
            && (v24 > v21 || v24 == v21 && v32 >= v20))
          {
            v20 = v32;
            v21 = v24;
          }

        }
        ++v22;
      }
      while (v17 != v22);
      v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v17 = v27;
    }
    while (v27);
  }
  else
  {
    v20 = 0.0;
    v21 = 0.0;
  }
  if (v29)
    *v29 = v20;

  return v21;
}

+ (id)headKeyAssetWithExtendedCuration:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    v8 = 4;
    v9 = -1.79769313e308;
    *(double *)&v10 = -1.79769313e308;
LABEL_3:
    v11 = 0;
    v12 = *(double *)&v10;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v3);
      if ((v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11),
            objc_msgSend(v13, "clsContentScore", (_QWORD)v20),
            v15 = v14,
            objc_msgSend(v13, "clsAestheticScore"),
            *(double *)&v10 = v16,
            v6)
        && v15 <= v9
        && (v15 == v9 ? (v17 = v16 <= v12) : (v17 = 1), v17))
      {
        *(double *)&v10 = v12;
      }
      else
      {
        v18 = v13;

        v9 = v15;
        v6 = v18;
      }
      if (!--v8)
        break;
      ++v11;
      v12 = *(double *)&v10;
      if (v5 == v11)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)requiredAssetsInAssets:(id)a3 withHighlightInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "keyAssetPrivateUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyAssetSharedUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isFavorite") & 1) != 0
          || (objc_msgSend(v16, "isEqualToString:", v8) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", v9))
        {
          objc_msgSend(v7, "addObject:", v15);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v7;
}

+ (id)filteredAssetsInAssets:(id)a3 withSharingComposition:(unsigned __int16)a4 forSharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (objc_msgSend(a1, "canUseSharingComposition:forSharingFilter:", v6, v5))
  {
    if ((_DWORD)v6 == 2)
    {
      if ((_DWORD)v5 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((_DWORD)v5 == 1)
        {
          v9 = (void *)MEMORY[0x1E0CB3880];
          v10 = CFSTR("clsIsInSharedLibrary == YES");
        }
        else
        {
          if ((_DWORD)v5)
          {
            v13 = 0;
            goto LABEL_14;
          }
          v9 = (void *)MEMORY[0x1E0CB3880];
          v10 = CFSTR("clsIsInSharedLibrary == NO");
        }
        objc_msgSend(v9, "predicateWithFormat:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;
LABEL_14:
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v11 = v8;
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_15:

  return v11;
}

+ (id)internalPredicateForFetchingAssetsForSharingFilter:(unsigned __int16)a3
{
  void *v3;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludePrivateLibraryAssetsAllowingIndexingOnParticipationState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)filteredMomentNodesWithHighlightNode:(id)a3 forSharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "sharingComposition");
  if ((objc_msgSend(a1, "canUseSharingComposition:forSharingFilter:", v7, v4) & 1) == 0)
    goto LABEL_7;
  if ((_DWORD)v7 == 2)
  {
    switch((_DWORD)v4)
    {
      case 0:
        objc_msgSend(v6, "eventEnrichmentMomentNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subsetWithPrivateAssets");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 1:
        objc_msgSend(v6, "eventEnrichmentMomentNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subsetWithSharedAssets");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2:
        goto LABEL_6;
    }
LABEL_7:
    v9 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v6, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MAElementCollection initWithGraph:](v9, "initWithGraph:", v10);
LABEL_8:
    v8 = (void *)v11;

    goto LABEL_9;
  }
LABEL_6:
  objc_msgSend(v6, "eventEnrichmentMomentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

+ (id)filteredHighlightNodesWithHighlightNodes:(id)a3 forSharingFilter:(unsigned __int16)a4
{
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v5, "subsetWithSharedAssets");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
  }
  else
  {
    objc_msgSend(v5, "subsetWithPrivateAssets");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (unsigned)mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:(id)a3 keyAssetShared:(id)a4 shouldCompareHighlight:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  unsigned __int16 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "curationScore");
  v10 = v9;
  objc_msgSend(v8, "curationScore");
  v12 = v11;
  if (v5 && v10 >= *MEMORY[0x1E0D77DE0] && v11 >= *MEMORY[0x1E0D77DE0])
  {
    objc_msgSend(v7, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v16);

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchAssetCollectionsContainingAsset:withType:options:", v7, 6, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchAssetCollectionsContainingAsset:withType:options:", v8, 6, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v20)
    {
      objc_msgSend(v18, "promotionScore");
      v22 = v21;
      objc_msgSend(v20, "promotionScore");
      if (v22 > v23)
      {
        v24 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (v23 > v22)
      {
        v24 = 2;
        goto LABEL_24;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v27;
      v42 = 2112;
      v43 = v28;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot find corresponding highlight for key asset private %@: %@, key asset shared %@: %@", buf, 0x2Au);

    }
  }
  if (v10 > v12)
    goto LABEL_17;
  if (v12 > v10)
    goto LABEL_19;
  objc_msgSend(v7, "overallAestheticScore");
  v30 = v29;
  objc_msgSend(v8, "overallAestheticScore");
  if (v30 > v31)
  {
LABEL_17:
    v24 = 1;
    goto LABEL_25;
  }
  if (v31 > v30)
  {
LABEL_19:
    v24 = 2;
    goto LABEL_25;
  }
  objc_msgSend(v7, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "compare:", v33);

  if (v34 == -1)
    v24 = 1;
  else
    v24 = 2;
LABEL_25:

  return v24;
}

+ (id)keyAssetForMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3 keyAssetPrivate:(id)a4 keyAssetShared:(id)a5
{
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v6 == 2)
  {
    v10 = v8;
  }
  else
  {
    v10 = v7;
    if (v6 != 1)
    {
      if (v6)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      v10 = v7;
      if (v11)
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Mixed composition has unspecified key asset relationship: using private key asset.", v14, 2u);
        v10 = v7;
      }
    }
  }
  v12 = v10;
LABEL_9:

  return v12;
}

+ (BOOL)canUseSharingComposition:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4
{
  BOOL v4;
  BOOL v5;

  v4 = (a3 - 1) < 2;
  v5 = (a3 & 0xFFFD) == 0;
  if (a4)
    v5 = 0;
  if (a4 != 1)
    v4 = v5;
  return a4 == 2 || v4;
}

+ (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "infoNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canUseLocationDomain");

  if ((v7 & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "momentNodes", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasLocation") & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v8;
}

+ (id)selectKeyAssetForSharingComposition:(unsigned __int16)a3 mixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a4 givenHighlightFilter:(unsigned __int16)a5 privateHandler:(id)a6 sharedHandler:(id)a7
{
  int v8;
  unsigned int v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a7;
  v13 = v12;
  if (v10 == 2)
  {
    v12 = v11;
    if (v8)
    {
      if (v8 == 2)
      {
        v12 = v11;
        if (v9 >= 2)
        {
          if (v9 != 2)
            goto LABEL_15;
          v12 = v13;
        }
      }
      else
      {
        v12 = v13;
        if (v8 != 1)
          goto LABEL_15;
      }
    }
  }
  else
  {
    if (v10 != 1)
    {
      if (!v10)
      {
        v12 = v11;
        if ((v8 & 0xFFFFFFFD) == 0)
          goto LABEL_11;
      }
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
    if ((v8 - 1) >= 2)
      goto LABEL_15;
  }
LABEL_11:
  (*((void (**)(void))v12 + 2))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v14;
}

+ (id)filteredSummarizedFeaturesForHighlightWithInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  v6 = a3;
  v7 = v6;
  switch(v5)
  {
    case 2:
      objc_msgSend(v6, "mixedSummarizedFeatures");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v6, "sharedSummarizedFeatures");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(v6, "privateSummarizedFeatures");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v8;
      break;
  }

  return v4;
}

void __93__PGHighlightEnrichmentUtilities_childHighlightNodeOfGroupHighlightNode_withLocalIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
