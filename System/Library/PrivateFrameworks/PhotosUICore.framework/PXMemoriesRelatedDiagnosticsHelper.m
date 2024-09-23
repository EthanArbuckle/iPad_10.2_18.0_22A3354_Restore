@implementation PXMemoriesRelatedDiagnosticsHelper

+ (id)preprocessDictionary:(id)a3 forMemoryWithLocalIdentifier:(id)a4 algorithmsVersion:(int64_t)a5 inPhotoLibrary:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id obj;
  unsigned int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v47 = a6;
  v10 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("backingMoments"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count") || !objc_msgSend(v12, "count"))
  {
    v54 = 0;
    objc_msgSend(v47, "memoryDebugInformationForMemoryWithLocalIdentifier:error:", v9, &v54);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v54;
    if (v13)
    {
      if (!objc_msgSend(v11, "count"))
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("backingMoments"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("backingMoments"));

      }
      if (!objc_msgSend(v12, "count"))
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("collectionsInfo"));

      }
    }
    if (v14)
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "+[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:]";
        v59 = 2112;
        v60 = v14;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }

    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("featureVector"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("featureVector_v2"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v19 = v18) != 0)
  {
    objc_msgSend(a1, "_featureVectorInfoGroupedByKeyForFeatureVector:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_39;
  }
  else
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    if (!v20)
      goto LABEL_39;
  }
  v49 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("People"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21
    || (objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("people")),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v41 = v20;
    v42 = v18;
    v43 = v12;
    v44 = v11;
    v45 = v10;
    v46 = v9;
    objc_msgSend(v47, "librarySpecificFetchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v21;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(obj);
          v28 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v29 = v28;
          if (v49 < 0x201)
          {
            v33 = v28;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CD1648], "personLocalIdentifierForPersonUniversalIdentifier:photoLibrary:", v28, v47);
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            if (v30)
              v32 = (void *)v30;
            else
              v32 = v29;
            v33 = v32;

          }
          v34 = (void *)MEMORY[0x1E0CD16C0];
          v55 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "fetchPersonsWithLocalIdentifiers:options:", v35, v22);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "firstObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "name");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "length"))
            v39 = v38;
          else
            v39 = v29;
          objc_msgSend(v23, "addObject:", v39);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v25);
    }

    v20 = v41;
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v23, CFSTR("People"));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, CFSTR("people"));

    v10 = v45;
    v9 = v46;
    v12 = v43;
    v11 = v44;
    v18 = v42;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("featureVector"));
LABEL_39:

  return v10;
}

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceMemory:(id)a6 sourceDictionary:(id)a7
{
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  __CFString *v76;
  const __CFString *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  id *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  id v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  id v198;
  __CFString *v199;
  void *v200;
  id *v201;
  BOOL v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  id *v207;
  void *v208;
  id obj;
  uint64_t v210;
  id v211;
  _QWORD v212[4];
  id v213;
  id v214;
  _QWORD v215[4];
  id v216;
  id v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _QWORD v222[4];
  id v223;
  id v224;
  const __CFString *v225;
  id v226;
  void *v227;
  _BYTE v228[128];
  uint64_t v229;

  v229 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = v13;
  v207 = a3;
  if (a3)
    v15 = a4 == 0;
  else
    v15 = 1;
  v16 = !v15;
  if (!v15)
  {
    switch(a5)
    {
      case 2:
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("backingMoments"));
        v146 = a4;
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = (void *)objc_opt_new();
        v149 = (void *)objc_opt_new();
        v150 = MEMORY[0x1E0C809B0];
        v215[0] = MEMORY[0x1E0C809B0];
        v215[1] = 3221225472;
        v215[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_2;
        v215[3] = &unk_1E512C2C8;
        v151 = v148;
        v216 = v151;
        v152 = v149;
        v217 = v152;
        objc_msgSend(v145, "enumerateObjectsUsingBlock:", v215);
        v212[0] = v150;
        v212[1] = 3221225472;
        v212[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_3;
        v212[3] = &unk_1E512C2C8;
        v213 = v151;
        v214 = v152;
        v153 = v152;
        v154 = v151;
        objc_msgSend(v147, "enumerateObjectsUsingBlock:", v212);
        v155 = objc_retainAutorelease(v154);
        *v207 = v155;
        v156 = objc_retainAutorelease(v153);
        *v146 = v156;

        break;
      case 1:
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("featureVector"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "allKeys");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        v158 = objc_retainAutorelease(v157);
        *a4 = v158;

        break;
      case 0:
        v201 = a4;
        v202 = v16;
        v17 = objc_opt_new();
        v18 = v14;
        v19 = (void *)v17;
        v205 = v18;
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("info"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("category"), CFSTR("subcategory"), CFSTR("originalsubcategory"), CFSTR("sourceType"), CFSTR("creationDate"), CFSTR("assetCount"), CFSTR("title"), CFSTR("subtitle"), CFSTR("fontname"), CFSTR("representativeassetcount"), CFSTR("repCount"), CFSTR("relevantAssetCount"), CFSTR("curatedCount"), CFSTR("extendedCuratedCount"), CFSTR("meaningLabels"), CFSTR("numberOfMoments"), CFSTR("numberOfCollections"),
          CFSTR("notificationstate"),
          CFSTR("suggestedMood"),
          CFSTR("recommendedMoods"),
          CFSTR("forbiddenMoods"),
          CFSTR("moodWeights"),
          CFSTR("moodKeywords"),
          0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("[localIdentifier] %@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v24);

        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "pendingState");
        PHMemoryPendingStateDescription();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("[pendingState] %@ (%d)"), v26, objc_msgSend(v12, "pendingState"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v27);

        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "creationType");
        PHMemoryCreationTypeDescription();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("[creationType] %@ (%d)"), v29, objc_msgSend(v12, "creationType"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v30);

        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", objc_msgSend(v12, "category"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("[category] %@"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v33);

        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("sourceType"));
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = CFSTR("## Missing Source Type ##");
        if (v35)
          v37 = (const __CFString *)v35;
        objc_msgSend(v34, "stringWithFormat:", CFSTR("[sourceType] %@"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v38);

        v206 = v20;
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("creationDate"));
        v39 = objc_claimAutoreleasedReturnValue();
        if (!v39
          || (objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v39, 2, 2),
              (v40 = (const __CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v40 = CFSTR("## Missing Creation Date ##");
        }
        v199 = (__CFString *)v40;
        v200 = (void *)v39;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[creationDate] %@"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v41);

        v42 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "score");
        objc_msgSend(v42, "stringWithFormat:", CFSTR("[score] %.3f"), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v44);

        v45 = (void *)MEMORY[0x1E0CB3940];
        v46 = (void *)MEMORY[0x1E0CD1658];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "relevanceScoreForMemory:atDate:", v12, v47);
        objc_msgSend(v45, "stringWithFormat:", CFSTR("[current relevance score] %.3f"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v49);

        v50 = (void *)MEMORY[0x1E0CB3940];
        v51 = (void *)MEMORY[0x1E0CD1658];
        objc_msgSend(v12, "creationDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "relevanceScoreForMemory:atDate:", v12, v52);
        objc_msgSend(v50, "stringWithFormat:", CFSTR("[relevance score on creation date] %.3f"), v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v54);

        v55 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "localizedTitle");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v56;
        v58 = CFSTR("## Missing Title ##");
        if (v56)
          v58 = (const __CFString *)v56;
        objc_msgSend(v55, "stringWithFormat:", CFSTR("[title] %@"), v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v59);

        v60 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "localizedSubtitle");
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v61;
        v63 = &stru_1E5149688;
        if (v61)
          v63 = (const __CFString *)v61;
        objc_msgSend(v60, "stringWithFormat:", CFSTR("[subtitle] %@"), v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v64);

        v65 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "titleFontName");
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)v66;
        v68 = CFSTR("## Missing Title Font Name");
        if (v66)
          v68 = (const __CFString *)v66;
        objc_msgSend(v65, "stringWithFormat:", CFSTR("[fontName] %@"), v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v69);

        v70 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("assetCount"));
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = (void *)v71;
        v73 = CFSTR("## Missing Asset Count ##");
        if (v71)
          v73 = (const __CFString *)v71;
        objc_msgSend(v70, "stringWithFormat:", CFSTR("[assetCount] %@"), v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v74);

        v75 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("repCount"));
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v77 = v76;
        if (!v76)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("representativeAssetCount"));
          v78 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v78;
          v77 = CFSTR("## Missing Representative Asset Count ##");
          if (v78)
            v77 = (const __CFString *)v78;
        }
        objc_msgSend(v75, "stringWithFormat:", CFSTR("[representativeAssetCount] %@"), v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v79);

        if (!v76)
        v80 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("relevantAssetCount"));
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = (void *)v81;
        v83 = CFSTR("## Missing Relevant Asset Count ##");
        if (v81)
          v83 = (const __CFString *)v81;
        objc_msgSend(v80, "stringWithFormat:", CFSTR("[relevantAssetCount] %@"), v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v84);

        v85 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("curatedCount"));
        v86 = objc_claimAutoreleasedReturnValue();
        v87 = (void *)v86;
        v88 = CFSTR("## Missing Curated Asset Count ##");
        if (v86)
          v88 = (const __CFString *)v86;
        objc_msgSend(v85, "stringWithFormat:", CFSTR("[curatedAssetCount] %@"), v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v89);

        v90 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("extendedCuratedCount"));
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = (void *)v91;
        v93 = CFSTR("## Missing Extended Curated Asset Count ##");
        if (v91)
          v93 = (const __CFString *)v91;
        objc_msgSend(v90, "stringWithFormat:", CFSTR("[extendedCuratedAssetCount] %@"), v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v94);

        v95 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
        v96 = objc_claimAutoreleasedReturnValue();
        v97 = (void *)v96;
        v98 = CFSTR("## Missing Key Asset ##");
        if (v96)
          v98 = (const __CFString *)v96;
        objc_msgSend(v95, "stringWithFormat:", CFSTR("[keyAssetUUID] %@"), v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v99);

        v100 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_isSafeForWidgetDisplayForAssetUUID:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "stringWithFormat:", CFSTR("[keyAssetIsSafeForWidgetDisplay] %@"), v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v103);

        v104 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("numberOfMoments"));
        v105 = objc_claimAutoreleasedReturnValue();
        v106 = (void *)v105;
        v107 = CFSTR("## Missing Number of Moments ##");
        if (v105)
          v107 = (const __CFString *)v105;
        objc_msgSend(v104, "stringWithFormat:", CFSTR("[numberOfMoments] %@"), v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v108);

        v109 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("numberOfCollections"));
        v110 = objc_claimAutoreleasedReturnValue();
        v111 = (void *)v110;
        v112 = CFSTR("## Missing Number of Collections ##");
        if (v110)
          v112 = (const __CFString *)v110;
        objc_msgSend(v109, "stringWithFormat:", CFSTR("[numberOfCollections] %@"), v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v113);

        v114 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("suggestedMood"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "stringWithFormat:", CFSTR("[suggestedMood] %@"), v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v116);

        v117 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("recommendedMoods"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "stringWithFormat:", CFSTR("[recommendedMoods] %@"), v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v119);

        v120 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("forbiddenMoods"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "stringWithFormat:", CFSTR("[forbiddenMoods] %@"), v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v122);

        v123 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("moodWeights"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "stringWithFormat:", CFSTR("[moodWeights] %@"), v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v125);

        v126 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("moodKeywords"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "componentsJoinedByString:", CFSTR(", "));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "stringWithFormat:", CFSTR("[moodKeywords] %@"), v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v129);

        v130 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "_userFeedbackScoreInfoForMemory:", v12);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "stringWithFormat:", CFSTR("[userFeedbackScore] %@"), v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v132);

        v133 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("triggerTypes"));
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "stringWithFormat:", CFSTR("[triggerTypes] %@"), v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v135);

        v136 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("encodedFeatures"));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "stringWithFormat:", CFSTR("[memoryFeatures] %@"), v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v138);

        v139 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "graphMemoryIdentifier");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "stringWithFormat:", CFSTR("[graphMemoryIdentifier] %@"), v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v141);

        v142 = objc_msgSend(v12, "notificationState");
        if (v142 == 1)
        {
          v144 = CFSTR("Requested");
          v143 = v20;
        }
        else
        {
          v143 = v20;
          if (v142 != 2)
            goto LABEL_48;
          v144 = CFSTR("Seen");
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[notificationState] Notification State %@ (%lu)"), v144, objc_msgSend(v12, "notificationState"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v159);

LABEL_48:
        objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v204, "count"))
        {
          objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("meaning"));
          v160 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v160)
          {
            v161 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v204, "componentsJoinedByString:", CFSTR(", "));
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "stringWithFormat:", CFSTR("[meaning] %@"), v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v163);

          }
        }
        objc_msgSend(v12, "photosGraphVersion");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[graphVersion] %u"), PLGraphAlgorithmsVersionFromPhotosGraphVersion());
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v164);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[curationAlgorithmsVersion] %u"), PLCurationAlgorithmsVersionFromPhotosGraphVersion());
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v165);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[relatedAlgorithmsVersion] %u"), PLRelatedAlgorithmsVersionFromPhotosGraphVersion());
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v166);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[memoriesAlgorithmsVersion] %u"), PLMemoriesAlgorithmsVersionFromPhotosGraphVersion());
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v167);

        v222[0] = MEMORY[0x1E0C809B0];
        v222[1] = 3221225472;
        v222[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke;
        v222[3] = &unk_1E512C2A0;
        v198 = v21;
        v223 = v198;
        v211 = v19;
        v224 = v211;
        objc_msgSend(v143, "enumerateKeysAndObjectsUsingBlock:", v222);
        v168 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v168, "setDateStyle:", 2);
        objc_msgSend(v168, "setTimeStyle:", 0);
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v208 = v168;
        objc_msgSend(v168, "setTimeZone:", v169);

        v220 = 0u;
        v221 = 0u;
        v218 = 0u;
        v219 = 0u;
        v203 = v12;
        objc_msgSend(v12, "blockableFeatures");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v218, v228, 16);
        if (v170)
        {
          v171 = v170;
          v210 = *(_QWORD *)v219;
          do
          {
            v172 = 0;
            do
            {
              if (*(_QWORD *)v219 != v210)
                objc_enumerationMutation(obj);
              v173 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * v172);
              if (objc_msgSend(v173, "type") == 1)
              {
                objc_msgSend(v173, "personLocalIdentifier");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "librarySpecificFetchOptions");
                v176 = (void *)objc_claimAutoreleasedReturnValue();

                v177 = (void *)MEMORY[0x1E0CD16C0];
                v227 = v174;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v227, 1);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v177, "fetchPersonsWithLocalIdentifiers:options:", v178, v176);
                v179 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v179, "firstObject");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "name");
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v181, "length"))
                  v182 = v181;
                else
                  v182 = v174;
                v183 = v182;

LABEL_66:
LABEL_67:

                goto LABEL_68;
              }
              if (objc_msgSend(v173, "type") == 16)
              {
                objc_msgSend(v173, "date");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v208, "stringFromDate:", v174);
                v184 = objc_claimAutoreleasedReturnValue();
                goto LABEL_63;
              }
              if (objc_msgSend(v173, "type") == 512)
              {
                objc_msgSend(v173, "dateInterval");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v185 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v174, "startDate");
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v208, "stringFromDate:", v176);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "endDate");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v208, "stringFromDate:", v186);
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "stringWithFormat:", CFSTR("%@ - %@"), v179, v187);
                v183 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_66;
              }
              if (objc_msgSend(v173, "type") == 32)
              {
                objc_msgSend(v173, "holidayName");
                v191 = objc_claimAutoreleasedReturnValue();
LABEL_76:
                v183 = (id)v191;
                goto LABEL_68;
              }
              if (objc_msgSend(v173, "type") == 4096)
              {
                objc_msgSend(v173, "location");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v192 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v174, "coordinate");
                v194 = v193;
                objc_msgSend(v174, "coordinate");
                objc_msgSend(v192, "stringWithFormat:", CFSTR("(%f,%f)"), v194, v195);
                v184 = objc_claimAutoreleasedReturnValue();
LABEL_63:
                v183 = (id)v184;
                goto LABEL_67;
              }
              if (objc_msgSend(v173, "type") == 0x20000)
              {
                objc_msgSend(v173, "areaName");
                v191 = objc_claimAutoreleasedReturnValue();
                goto LABEL_76;
              }
              v183 = 0;
LABEL_68:
              v188 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CD1648], "stringForType:", objc_msgSend(v173, "type"));
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v188, "stringWithFormat:", CFSTR("[blockableFeature] %@: %@"), v189, v183);
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "addObject:", v190);

              ++v172;
            }
            while (v171 != v172);
            v196 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v218, v228, 16);
            v171 = v196;
          }
          while (v196);
        }

        *v207 = &unk_1E53E9A80;
        v225 = &stru_1E5149688;
        v226 = v211;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v226, &v225, 1);
        *v201 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v203;
        v16 = v202;
        v14 = v205;
        break;
    }
  }

  return v16;
}

+ (id)getSummaryFromProviderItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
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
  objc_class *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMemoriesRelatedDiagnosticsHelper.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    objc_msgSend(v8, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v8, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("title"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "assetCollectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("assetCollectionType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "assetCollectionSubtype"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("assetCollectionSubtype"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "estimatedAssetCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("estimatedAssetCount"));

    objc_msgSend(v8, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "creationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("creationDate"));

    }
    if (v7)
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("localIdentifier"));
    if (objc_msgSend(v8, "assetCollectionType") == 4)
    {
      v8 = v8;
      v17 = objc_msgSend(v8, "isRejected");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("rejected"));

      v19 = objc_msgSend(v8, "isFavorite");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v20, CFSTR("favorite"));

      v21 = objc_msgSend(v8, "pendingState");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("pendingState"));

      objc_msgSend(v8, "score");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("score"));

      objc_msgSend(v8, "uuid");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("uuid"));
      v100 = (void *)v24;
      v25 = objc_msgSend(v8, "photosGraphVersion");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v26, CFSTR("photoGraphVersion"));

      objc_msgSend(v8, "photosGraphProperties");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)MEMORY[0x1A85CE17C]();
        objc_msgSend(a1, "_sanitizedGraphDataDictionaryForArchivingDictionary:memoryLocalIdentifier:", v27, v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v29, CFSTR("photosGraphProperties"));

        objc_autoreleasePoolPop(v28);
      }
      objc_msgSend(v8, "movieData");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
        objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("movieData"));
      objc_msgSend(v8, "lastViewedDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        objc_msgSend(v6, "setObject:forKey:", v31, CFSTR("lastViewedDate"));
      v96 = (void *)v30;
      v98 = (void *)v27;
      v102 = v5;
      v104 = v7;
      objc_msgSend(v8, "lastViewedDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        objc_msgSend(v6, "setObject:forKey:", v32, CFSTR("lastMoviePlayedDate"));
      v33 = a1;
      v34 = objc_msgSend(v8, "category");
      objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v35, CFSTR("category"));
      v36 = objc_msgSend(v8, "subcategory");
      objc_msgSend(MEMORY[0x1E0CD1630], "stringForSubcategory:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v37, CFSTR("subCategory"));
      objc_msgSend(v8, "subtitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "length"))
      {
        objc_msgSend(v8, "subtitle");
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = CFSTR("unknown");
      }

      objc_msgSend(v6, "setObject:forKey:", v39, CFSTR("subtitle"));
      objc_msgSend(v6, "setObject:forKey:", CFSTR("Memory"), CFSTR("referenceOrigin"));
      objc_msgSend(v8, "titleFontName");
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = (void *)v88;
      if (v88)
        v90 = (const __CFString *)v88;
      else
        v90 = CFSTR("unknown");
      objc_msgSend(v6, "setObject:forKey:", v90, CFSTR("fontName"));

      v91 = (void *)MEMORY[0x1A85CE17C]();
      objc_msgSend(v33, "_curationFullsetForMemory:", v8);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (v92)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v92, CFSTR("curationFullset"));

      objc_autoreleasePoolPop(v91);
      objc_msgSend(v33, "_datesAndAssetCountDictionaryForAssetCollection:", v8);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v93);

      v5 = v102;
      v7 = v104;
    }
    else
    {
      if (objc_msgSend(v8, "assetCollectionType") == 3)
      {
        v8 = v8;
        objc_msgSend(v8, "startDate");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73)
          objc_msgSend(v6, "setObject:forKey:", v73, CFSTR("startDate"));
        objc_msgSend(v8, "endDate");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
          objc_msgSend(v6, "setObject:forKey:", v74, CFSTR("endDate"));
        objc_msgSend(v6, "setObject:forKey:", CFSTR("Moment"), CFSTR("referenceOrigin"));
      }
      else
      {
        if (objc_msgSend(v8, "assetCollectionType") != 5)
        {
          objc_msgSend(v6, "setObject:forKey:", CFSTR("Collection"), CFSTR("referenceOrigin"));
          goto LABEL_74;
        }
        v8 = v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "relationType"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v78, CFSTR("relationType"));

        objc_msgSend(v8, "localizedSubtitle");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "length");

        if (v80)
        {
          objc_msgSend(v8, "localizedSubtitle");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v81, CFSTR("subtitle"));

        }
        objc_msgSend(v8, "localizedLocationNames");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          objc_msgSend(v8, "localizedLocationNames");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v83, CFSTR("locationNames"));

        }
        objc_msgSend(v8, "debugInfo");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "count");

        if (v85)
        {
          objc_msgSend(v8, "debugInfo");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v86, CFSTR("relatedDebugInfo"));

        }
        objc_msgSend(v8, "highlightLocalIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v73, "length"))
          objc_msgSend(v6, "setObject:forKey:", v73, CFSTR("highlightLocalIdentifier"));
        objc_msgSend(v8, "momentLocalIdentifiers");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "count"))
          objc_msgSend(v6, "setObject:forKey:", v74, CFSTR("momentLocalIdentifiers"));
        objc_msgSend(a1, "_datesAndAssetCountDictionaryForAssetCollection:", v8);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addEntriesFromDictionary:", v87);
        objc_msgSend(v6, "setObject:forKey:", CFSTR("Related"), CFSTR("referenceOrigin"));

      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v105 = v7;
      v8 = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "mediaType"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v40, CFSTR("assetType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "mediaSubtypes"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v41, CFSTR("mediaSubtypes"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "pixelWidth"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v42, CFSTR("pixelWidth"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "pixelHeight"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v43, CFSTR("pixelHeight"));

      v44 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "duration");
      objc_msgSend(v44, "numberWithDouble:");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v45, CFSTR("duration"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isHidden"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v46, CFSTR("isHidden"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isFavorite"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v47, CFSTR("isFavorite"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isTrashed"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v48, CFSTR("isTrashed"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "hasAdjustments"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v49, CFSTR("hasAdjustments"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isVideo"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v50, CFSTR("isVideo"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isPhoto"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v51, CFSTR("isPhoto"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isAudio"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v52, CFSTR("isAudio"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isIncludedInMoments"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v53, CFSTR("isIncludedInMoments"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isIncludedInCloudFeeds"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v54, CFSTR("isIncludedInCloudFeeds"));

      objc_msgSend(v8, "assetUserActivityProperties");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v55, "playCount"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v56, CFSTR("playCount"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v55, "viewCount"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v57, CFSTR("viewCount"));

      v103 = v55;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v55, "shareCount"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v58, CFSTR("shareCount"));

      objc_msgSend(v8, "creationDate");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v59)
        objc_msgSend(v6, "setObject:forKey:", v59, CFSTR("creationDate"));
      objc_msgSend(v8, "modificationDate");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v60)
        objc_msgSend(v6, "setObject:forKey:", v60, CFSTR("modificationDate"));
      objc_msgSend(v8, "location");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61)
      {
        objc_msgSend(v61, "description");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v63, CFSTR("location"));

      }
      objc_msgSend(v8, "burstIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
        objc_msgSend(v6, "setObject:forKey:", v64, CFSTR("burstIdentifier"));
      objc_msgSend(v8, "uniformTypeIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
        objc_msgSend(v6, "setObject:forKey:", v65, CFSTR("uniformTypeIdentifier"));
      v99 = (void *)v60;
      objc_msgSend(v8, "filename");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
        objc_msgSend(v6, "setObject:forKey:", v66, CFSTR("filename"));
      v97 = v62;
      objc_msgSend(v8, "cloudIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
        objc_msgSend(v6, "setObject:forKey:", v67, CFSTR("cloudIdentifier"));
      v101 = (void *)v59;
      objc_msgSend(v8, "adjustmentVersion");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
        objc_msgSend(v6, "setObject:forKey:", v68, CFSTR("adjustmentVersion"));
      objc_msgSend(v8, "faceAdjustmentVersion");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
        objc_msgSend(v6, "setObject:forKey:", v69, CFSTR("faceAdjustmentVersion"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v8, "faceAnalysisVersion"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v70, CFSTR("faceAnalysisVersion"));

      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v72, CFSTR("itemClass"));

      objc_msgSend(v6, "setObject:forKey:", CFSTR("One Up"), CFSTR("referenceOrigin"));
      v7 = v105;
      if (v105)
        objc_msgSend(v6, "setObject:forKey:", v105, CFSTR("localIdentifier"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, v75);
      v76 = (objc_class *)objc_opt_class();
      NSStringFromClass(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v77, CFSTR("itemClass"));
      objc_msgSend(v6, "setObject:forKey:", v77, CFSTR("referenceOrigin"));
      if (v7)
        objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("localIdentifier"));

    }
  }
LABEL_74:

  return v6;
}

+ (id)_sanitizedGraphDataDictionaryForArchivingDictionary:(id)a3 memoryLocalIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id obj;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v11 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("backingMoments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("collectionsInfo"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mutableCopy");

  v33 = v6;
  if (!v7 || !v8 || !v10)
  {
    if (!v6)
    {
      v31 = (void *)v8;
      v13 = 0;
      v14 = 0;
LABEL_17:
      v30 = (void *)v10;

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v12, "memoryDebugInformationForMemoryWithLocalIdentifier:error:", v6, &v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v41;

    if (!v13)
    {
LABEL_12:
      v31 = (void *)v8;
      if (v14)
      {
        PLUIGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "+[PXMemoriesRelatedDiagnosticsHelper _sanitizedGraphDataDictionaryForArchivingDictionary:memoryLocalIdentifier:]";
          v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
        }

      }
      goto LABEL_17;
    }
    if (v7)
    {
      if (v8)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("backingMoments"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_11:
        if (v10)
          goto LABEL_12;
LABEL_37:
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("info"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v29, "mutableCopy");

        goto LABEL_12;
      }
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_12;
    goto LABEL_37;
  }
  v30 = (void *)v10;
  v31 = (void *)v8;
LABEL_18:
  v32 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKey:", CFSTR("keywords"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __112__PXMemoriesRelatedDiagnosticsHelper__sanitizedGraphDataDictionaryForArchivingDictionary_memoryLocalIdentifier___block_invoke;
          v35[3] = &unk_1E5148268;
          v36 = v23;
          v24 = v23;
          objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v35);
          v25 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("keywords"));
          objc_msgSend(v16, "addObject:", v25);

        }
        else
        {
          objc_msgSend(v16, "addObject:", v21);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v18);
  }

  v11 = v32;
  objc_msgSend(v32, "setObject:forKey:", v16, CFSTR("backingMoments"));
  if (v31)
    objc_msgSend(v32, "setObject:forKey:", v31, CFSTR("collectionsInfo"));
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("moodKeywords"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, CFSTR("moodKeywords"));

    }
  }
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, CFSTR("info"));

LABEL_34:
  return v11;
}

+ (id)_featureVectorInfoGroupedByKeyForFeatureVector:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "firstObject", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("referenceKeywords")))
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);
          }
          objc_msgSend(v13, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_datesAndAssetCountDictionaryForAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__135154;
    v23 = __Block_byref_object_dispose__135155;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__135154;
    v17 = __Block_byref_object_dispose__135155;
    v18 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__PXMemoriesRelatedDiagnosticsHelper__datesAndAssetCountDictionaryForAssetCollection___block_invoke;
    v12[3] = &unk_1E512C318;
    v12[4] = &v19;
    v12[5] = &v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
    v8 = v20[5];
    if (v8)
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("startDate"));
    v9 = v14[5];
    if (v9)
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("endDate"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("estimatedAssetCount"));

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);

  }
  return v4;
}

+ (id)_curationFullsetForMemory:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id obj;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
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
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _QWORD v126[5];

  v126[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E0C99000uLL;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchOptionsWithPhotoLibrary:orObject:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0CD1A50];
  v126[0] = *MEMORY[0x1E0CD1A80];
  v126[1] = v9;
  v126[2] = *MEMORY[0x1E0CD1A40];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v10);

  v91 = v8;
  objc_msgSend(v8, "setChunkSizeForFetch:", 300);
  v83 = v3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsBackingMemory:options:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v118 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1A85CE17C]();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v17, v91);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fetchedObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v20);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    }
    while (v14);
  }
  v84 = v5;

  v21 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v91, "photoLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v91, "fetchPropertySets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v21, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v12, v22, v23, v26, 0, 0);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsGroupedByAssetLocalIdentifierForAssets:options:", v27, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v27;
  objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v27);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v85 = v12;
  v92 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
  if (v92)
  {
    v87 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v92; ++j)
      {
        if (*(_QWORD *)v114 != v87)
          objc_enumerationMutation(v85);
        v29 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1A85CE17C]();
        v31 = objc_alloc_init(*(Class *)(v4 + 3592));
        objc_msgSend(v29, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("identifier"));
        objc_msgSend(v29, "creationDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("creationDate"));

        objc_msgSend(v29, "localCreationDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("localCreationDate"));

        objc_msgSend(v29, "location");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v35, "coordinate");
          objc_msgSend(v37, "numberWithDouble:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, CFSTR("latitude"));

          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v35, "coordinate");
          objc_msgSend(v39, "numberWithDouble:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v41, CFSTR("longitude"));

        }
        v42 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v29, "curationScore");
        objc_msgSend(v42, "numberWithDouble:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v43, CFSTR("score"));

        objc_msgSend(v89, "objectForKeyedSubscript:", v32);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = j;
        v100 = v44;
        if (objc_msgSend(v44, "count"))
        {
          objc_msgSend(v44, "fetchedObjects");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "valueForKey:", CFSTR("localIdentifier"));
          v46 = v32;
          v47 = v30;
          v48 = v4;
          v49 = v35;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v50, CFSTR("persons"));

          v35 = v49;
          v4 = v48;
          v30 = v47;
          v32 = v46;
          j = v98;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v100, "count"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v51, CFSTR("peopleCount"));

          v44 = v100;
        }
        objc_msgSend(v88, "objectForKeyedSubscript:", v32);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v99, "count"))
        {
          v93 = v35;
          v94 = v29;
          v95 = v32;
          v96 = v31;
          v97 = v30;
          v52 = objc_alloc_init(*(Class *)(v4 + 3592));
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v53 = v99;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v110;
            do
            {
              for (k = 0; k != v55; ++k)
              {
                if (*(_QWORD *)v110 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v58, "extendedSceneIdentifier"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v58, "confidence");
                objc_msgSend(v60, "numberWithDouble:");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKeyedSubscript:", v61, v59);

              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
            }
            while (v55);
          }

          v31 = v96;
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v52, CFSTR("sceneClassifications"));

          v4 = 0x1E0C99000;
          v30 = v97;
          j = v98;
          v29 = v94;
          v32 = v95;
          v35 = v93;
          v44 = v100;
        }
        if (objc_msgSend(v29, "isFavorite"))
          objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isFavorite"));
        objc_msgSend(v90, "setObject:forKeyedSubscript:", v31, v32);

        objc_autoreleasePoolPop(v30);
      }
      v92 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
    }
    while (v92);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v90, CFSTR("assetDataByIdentifier"));
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:", v83);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v64 = v62;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v106;
    do
    {
      for (m = 0; m != v66; ++m)
      {
        if (*(_QWORD *)v106 != v67)
          objc_enumerationMutation(v64);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * m), "localIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addObject:", v69);

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
    }
    while (v66);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("curationIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchExtendedCuratedAssetsInAssetCollection:options:", v83, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v64, "count"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v72 = v70;
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v102;
    do
    {
      for (n = 0; n != v74; ++n)
      {
        if (*(_QWORD *)v102 != v75)
          objc_enumerationMutation(v72);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * n), "localIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v77);

      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    }
    while (v74);
  }

  objc_msgSend(v84, "setObject:forKeyedSubscript:", v71, CFSTR("extendedCurationIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v83, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "firstObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(v79, "localIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v80, CFSTR("keyAssetIdentifier"));

  }
  return v84;
}

+ (id)_userFeedbackScoreInfoForMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v39;
  id obj;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v3;
  objc_msgSend(v4, "fetchAssetsInAssetCollection:options:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v44)
  {
    v41 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v50 != v41)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v10);

        objc_msgSend(v9, "photoLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "librarySpecificFetchOptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIncludedDetectionTypes:", v13);

        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v9, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v14, "fetchedObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v46 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v18);
        }

        objc_msgSend(v9, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v15, v22);

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v44);
  }

  v23 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v39, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "librarySpecificFetchOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fetchKeyAssetsInAssetCollection:options:", v39, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v26, "fetchedObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  v30 = objc_alloc(MEMORY[0x1E0CD17F8]);
  objc_msgSend(v39, "photoLibrary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithPhotoLibrary:", v31);

  objc_msgSend(v39, "blockableFeatures");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", v43, v29, v42, v33);
  v35 = v34;

  objc_msgSend(MEMORY[0x1E0CD17F8], "descriptionForScore:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%.2f)"), v36, *(_QWORD *)&v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)_isSafeForWidgetDisplayForAssetUUID:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if (objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = *MEMORY[0x1E0CD1A50];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchPropertySets:", v6);

    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v5, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v8);
    v10 = CFSTR("YES");
    if (!v9)
      v10 = CFSTR("NO");
    v3 = v10;

  }
  return v3;
}

void __86__PXMemoriesRelatedDiagnosticsHelper__datesAndAssetCountDictionaryForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  objc_msgSend(a2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = v3;
  if (*(_QWORD *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1)
      goto LABEL_5;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v6 + 40))
  {
LABEL_8:
    objc_storeStrong((id *)(v6 + 40), obj);
    goto LABEL_9;
  }
  if (objc_msgSend(obj, "compare:") == 1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    goto LABEL_8;
  }
LABEL_9:

}

void __112__PXMemoriesRelatedDiagnosticsHelper__sanitizedGraphDataDictionaryForArchivingDictionary_memoryLocalIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);

}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (a3 + 1);
  v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Collection %d"), v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByAppendingString:", CFSTR(" - Scores"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v32);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("averageContentScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Content Average: %.3f"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meaningScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Meaning: %.3f"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v31, v32);
  objc_msgSend(v30, "stringByAppendingString:", CFSTR(" - Titling"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v29);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Title: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Subtitle: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("titleCategory"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Category: %ld"), objc_msgSend(v23, "integerValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, v29);
  objc_msgSend(v30, "stringByAppendingString:", CFSTR(" - Meanings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, v27);
}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moment %d"), (a3 + 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByAppendingString:", CFSTR(" - General"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset Count: %lu"), objc_msgSend(v7, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  v32 = v8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Matching: %.3f"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("curationScore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Curation: %.3f"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("graphScore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Graph: %.3f"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v22;
  v30 = v11;
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("neighborScore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Neighbor: %.3f"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v27);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v33);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keywords"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_4;
  v34[3] = &unk_1E512C2F0;
  v35 = v31;
  v36 = *(id *)(a1 + 32);
  v37 = *(id *)(a1 + 40);
  v29 = v31;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v34);

}

void __115__PXMemoriesRelatedDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceMemory_sourceDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), *(_QWORD *)(a1 + 32), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v6);

  }
}

@end
