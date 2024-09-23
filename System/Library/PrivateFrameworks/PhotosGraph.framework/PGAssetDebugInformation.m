@implementation PGAssetDebugInformation

+ (id)debugInformationForAsset:(id)a3 curationContext:(id)a4
{
  id v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
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
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BOOL8 v84;
  __CFString *v85;
  void *v86;
  void *v87;
  _BOOL8 v88;
  __CFString *v89;
  void *v90;
  void *v91;
  _BOOL8 v92;
  __CFString *v93;
  void *v94;
  void *v95;
  _BOOL8 v96;
  __CFString *v97;
  void *v98;
  void *v99;
  _BOOL8 v100;
  id v101;
  void *v102;
  void *v103;
  _BOOL8 v104;
  id v105;
  void *v106;
  void *v107;
  _BOOL8 v108;
  id v109;
  void *v110;
  void *v111;
  _BOOL8 v112;
  id v113;
  void *v114;
  void *v115;
  _BOOL8 v116;
  id v117;
  void *v118;
  void *v119;
  _BOOL8 v120;
  id v121;
  void *v122;
  void *v123;
  _BOOL8 v124;
  id v125;
  void *v126;
  void *v127;
  _BOOL8 v128;
  id v129;
  void *v130;
  void *v131;
  _BOOL8 v132;
  id v133;
  void *v134;
  void *v135;
  _BOOL8 v136;
  id v137;
  void *v138;
  void *v139;
  _BOOL8 v140;
  id v141;
  void *v142;
  void *v143;
  _BOOL8 v144;
  id v145;
  void *v146;
  void *v147;
  _BOOL8 v148;
  id v149;
  void *v150;
  void *v151;
  _BOOL8 v152;
  id v153;
  void *v154;
  void *v155;
  _BOOL8 v156;
  id v157;
  void *v158;
  void *v159;
  _BOOL8 v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  PGWallpaperSuggestionAssetGater *v173;
  void *v174;
  void *v175;
  PGWallpaperSuggestionAssetGater *v176;
  id v177;
  void *v178;
  void *v180;
  void *v181;
  void *v182;
  __CFString *v184;
  __CFString *v185;
  void *v186;
  void *v187;
  id v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  __CFString *v207;
  __CFString *v208;
  __CFString *v209;
  __CFString *v210;
  id v211;
  _QWORD v212[4];
  id v213;
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[2];
  _QWORD v218[2];
  _QWORD v219[2];
  _QWORD v220[2];
  _QWORD v221[3];

  v221[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(v7, "setIncludeGuestAssets:", 1);
  v9 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v6, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v221[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v221, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAssetsWithLocalIdentifiers:options:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v12, 31, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v16 = (void *)MEMORY[0x1E0D77E18];
  v212[0] = MEMORY[0x1E0C809B0];
  v212[1] = 3221225472;
  v212[2] = __68__PGAssetDebugInformation_debugInformationForAsset_curationContext___block_invoke;
  v212[3] = &unk_1E842EF28;
  v188 = v15;
  v213 = v188;
  objc_msgSend(v16, "enumerateSignalsFromAsset:fullHierarchyName:usingBlock:", v14, 1, v212);
  v219[0] = CFSTR("latest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D47688]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v219[1] = CFSTR("current");
  v220[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v14, "faceAnalysisVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v220, v219, 2);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v217[0] = CFSTR("latest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D47690]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v217[1] = CFSTR("current");
  v218[0] = v19;
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "sceneAnalysisProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithShort:", objc_msgSend(v21, "sceneAnalysisVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v218[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v218, v217, 2);
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "curationModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scoreWithAsset:inContext:", v14, 0);
  v25 = v24;

  objc_msgSend(v14, "photoLibrary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBuilder topTierAestheticScoreForRatio:inPhotoLibrary:](PGGraphBuilder, "topTierAestheticScoreForRatio:inPhotoLibrary:", v26, 0.01);
  v28 = v27;

  v29 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v14, 3, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v32);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v216[0] = v33;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v216[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v216, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v35);

  v180 = v7;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v31, v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fetchedObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v182 = v5;
  objc_msgSend(v5, "curationSession");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "prepareAssets:", v37);

  objc_msgSend(MEMORY[0x1E0D77E18], "scoringContextWithAssets:aestheticScoreThresholdToBeAwesome:", v37, v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curationModel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scoreWithAsset:inContext:", v14, v39);
  v42 = v41;

  +[PGMemoryGenerationHelper scoringContextForMemoriesWithAssets:withTopTierAestheticScore:](PGMemoryGenerationHelper, "scoringContextForMemoriesWithAssets:withTopTierAestheticScore:", v37, v28);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curationModel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "scoreWithAsset:inContext:", v14, v43);
  v46 = v45;

  objc_msgSend(v14, "clsSceneprint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = objc_msgSend(v37, "indexOfObject:", v14);
    v49 = v48;
    if (v48)
    {
      objc_msgSend(v37, "objectAtIndexedSubscript:", v48 - 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_sceneprintDistanceStringFromAsset:toAsset:", v14, v50);
      v185 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v185 = CFSTR("No asset");
    }
    if (v49 >= objc_msgSend(v37, "count") - 1)
    {
      v184 = CFSTR("No asset");
    }
    else
    {
      objc_msgSend(v37, "objectAtIndexedSubscript:", v49 + 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_sceneprintDistanceStringFromAsset:toAsset:", v14, v51);
      v184 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v184 = CFSTR("-");
    v185 = CFSTR("-");
  }

  objc_autoreleasePoolPop(v29);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "clsIsBlurry"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v53, CFSTR("isBlurryMedia"));

  v54 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "curationModel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "mediaPreAnalysisModel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sharpnessNode");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "highRecallOperatingPoint");
  objc_msgSend(v54, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v58, CFSTR("sharpnessThreshold"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v187, CFSTR("faceAnalysisVersions"));
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v186, CFSTR("sceneAnalysisVersions"));
  objc_msgSend(v14, "curationModel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sceneModel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "identifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v61, CFSTR("sceneTaxonomyDigest"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v188, CFSTR("classification"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v62, CFSTR("curationScoreWithContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v63, CFSTR("curationScoreWithoutContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v64, CFSTR("curationScoreForMemories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v65, CFSTR("libraryTopTierAestheticScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "clsIsUtility"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v66, CFSTR("isUtility"));

  v67 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "curationModel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "userFeedbackCalculator");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v14, v69));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v70, CFSTR("isUtilityForMemories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "clsIsTragicFailure"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v71, CFSTR("isTragicFailure"));

  v211 = 0;
  v72 = objc_msgSend(v14, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:", 0, 0, &v211);
  v73 = (__CFString *)v211;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v72);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v74, CFSTR("avoidForKeyAsset"));

  if ((_DWORD)v72)
  {
    if (v73)
      v75 = v73;
    else
      v75 = CFSTR("Unknown");
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v75, CFSTR("avoidForKeyAssetReason"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 1, 0));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v76, CFSTR("avoidForMemoryKeyAsset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v14));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v77, CFSTR("isSafeForWidgetDisplay"));

  objc_msgSend(a1, "_personDescriptionStringsInAsset:", v14);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v78, CFSTR("peopleNames"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v185, CFSTR("sceneprintDistanceToPreviousAsset"));
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v184, CFSTR("sceneprintDistanceToNextAsset"));
  v79 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "clsSquareCropScore");
  objc_msgSend(v79, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v80, CFSTR("squareCropScore"));

  objc_msgSend(v14, "cropScoreForTargetAspectRatio:forFaces:", 1, 0.75);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v81, CFSTR("3x4CropScore"));

  objc_msgSend(v14, "cropScoreForTargetAspectRatio:forFaces:", 1, 1.5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v82, CFSTR("3x2CropScore"));

  v83 = (void *)MEMORY[0x1E0CB37E8];
  v210 = v73;
  v84 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopPeopleWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v210);
  v85 = v210;

  objc_msgSend(v83, "numberWithBool:", v84);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v86, CFSTR("WSTopPeoplePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v85, CFSTR("WSTopPeoplePortraitReason"));
  v87 = (void *)MEMORY[0x1E0CB37E8];
  v209 = v85;
  v88 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopPeopleWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v209);
  v89 = v209;

  objc_msgSend(v87, "numberWithBool:", v88);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v90, CFSTR("WSTopPeopleLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v89, CFSTR("WSTopPeopleLandscapeReason"));
  v91 = (void *)MEMORY[0x1E0CB37E8];
  v208 = v89;
  v92 = +[PGPetWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopPetWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v208);
  v93 = v208;

  objc_msgSend(v91, "numberWithBool:", v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v94, CFSTR("WSTopPetPortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v93, CFSTR("WSTopPetPortraitReason"));
  v95 = (void *)MEMORY[0x1E0CB37E8];
  v207 = v93;
  v96 = +[PGPetWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopPetWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v207);
  v97 = v207;

  objc_msgSend(v95, "numberWithBool:", v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v98, CFSTR("WSTopPetLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v97, CFSTR("WSTopPetLandscapeReason"));
  v99 = (void *)MEMORY[0x1E0CB37E8];
  v206 = v97;
  v100 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopLandscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v206);
  v101 = v206;

  objc_msgSend(v99, "numberWithBool:", v100);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v102, CFSTR("WSTopNaturePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v101, CFSTR("WSTopNaturePortraitReason"));
  v103 = (void *)MEMORY[0x1E0CB37E8];
  v205 = v101;
  v104 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopLandscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v205);
  v105 = v205;

  objc_msgSend(v103, "numberWithBool:", v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v106, CFSTR("WSTopNatureLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v105, CFSTR("WSTopNatureLandscapeReason"));
  v107 = (void *)MEMORY[0x1E0CB37E8];
  v204 = v105;
  v108 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopCityscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v204);
  v109 = v204;

  objc_msgSend(v107, "numberWithBool:", v108);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v110, CFSTR("WSTopCityscapePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v109, CFSTR("WSTopCityscapePortraitReason"));
  v111 = (void *)MEMORY[0x1E0CB37E8];
  v203 = v109;
  v112 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGTopCityscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v203);
  v113 = v203;

  objc_msgSend(v111, "numberWithBool:", v112);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v114, CFSTR("WSTopCityscapeLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v113, CFSTR("WSTopCityscapeLandscapeReason"));
  v115 = (void *)MEMORY[0x1E0CB37E8];
  v202 = v113;
  v116 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPeopleWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v202);
  v117 = v202;

  objc_msgSend(v115, "numberWithBool:", v116);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v118, CFSTR("WSPeoplePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v117, CFSTR("WSPeoplePortraitReason"));
  v119 = (void *)MEMORY[0x1E0CB37E8];
  v201 = v117;
  v120 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPeopleWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v201);
  v121 = v201;

  objc_msgSend(v119, "numberWithBool:", v120);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v122, CFSTR("WSPeopleLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v121, CFSTR("WSPeopleLandscapeReason"));
  v123 = (void *)MEMORY[0x1E0CB37E8];
  v200 = v121;
  v124 = +[PGPetWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPetWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v200);
  v125 = v200;

  objc_msgSend(v123, "numberWithBool:", v124);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v126, CFSTR("WSPetPortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v125, CFSTR("WSPetPortraitReason"));
  v127 = (void *)MEMORY[0x1E0CB37E8];
  v199 = v125;
  v128 = +[PGPetWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPetWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v199);
  v129 = v199;

  objc_msgSend(v127, "numberWithBool:", v128);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v130, CFSTR("WSPetLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v129, CFSTR("WSPetLandscapeReason"));
  v131 = (void *)MEMORY[0x1E0CB37E8];
  v198 = v129;
  v132 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGLandscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v198);
  v133 = v198;

  objc_msgSend(v131, "numberWithBool:", v132);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v134, CFSTR("WSNaturePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v133, CFSTR("WSNaturePortraitReason"));
  v135 = (void *)MEMORY[0x1E0CB37E8];
  v197 = v133;
  v136 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGLandscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v197);
  v137 = v197;

  objc_msgSend(v135, "numberWithBool:", v136);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v138, CFSTR("WSNatureLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v137, CFSTR("WSNatureLandscapeReason"));
  v139 = (void *)MEMORY[0x1E0CB37E8];
  v196 = v137;
  v140 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGCityscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v196);
  v141 = v196;

  objc_msgSend(v139, "numberWithBool:", v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v142, CFSTR("WSCityscapePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v141, CFSTR("WSCityscapePortraitReason"));
  v143 = (void *)MEMORY[0x1E0CB37E8];
  v195 = v141;
  v144 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGCityscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v195);
  v145 = v195;

  objc_msgSend(v143, "numberWithBool:", v144);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v146, CFSTR("WSCityscapeLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v145, CFSTR("WSCityscapeLandscapeReason"));
  v147 = (void *)MEMORY[0x1E0CB37E8];
  v194 = v145;
  v148 = +[PGSettlingEffectWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGSettlingEffectWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v194);
  v149 = v194;

  objc_msgSend(v147, "numberWithBool:", v148);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v150, CFSTR("WSSettlingEffectPortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v149, CFSTR("WSSettlingEffectPortraitReason"));
  v151 = (void *)MEMORY[0x1E0CB37E8];
  v193 = v149;
  v152 = +[PGSettlingEffectWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGSettlingEffectWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v193);
  v153 = v193;

  objc_msgSend(v151, "numberWithBool:", v152);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v154, CFSTR("WSSettlingEffectLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v153, CFSTR("WSSettlingEffectLandscapeReason"));
  v155 = (void *)MEMORY[0x1E0CB37E8];
  v192 = v153;
  v156 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGMeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 1, &v192);
  v157 = v192;

  objc_msgSend(v155, "numberWithBool:", v156);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v158, CFSTR("WSMePortraitPass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v157, CFSTR("WSMePortraitReason"));
  v159 = (void *)MEMORY[0x1E0CB37E8];
  v191 = v157;
  v160 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGMeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v14, v182, 2, &v191);
  v161 = v191;

  objc_msgSend(v159, "numberWithBool:", v160);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v162, CFSTR("WSMeLandscapePass"));

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v161, CFSTR("WSMeLandscapeReason"));
  objc_msgSend(v14, "photoAnalysisWallpaperProperties");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v214[0] = CFSTR("current");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PGWallpaperSuggestionAssetGater currentWallpaperPropertiesVersion](PGWallpaperSuggestionAssetGater, "currentWallpaperPropertiesVersion"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v214[1] = CFSTR("persisted");
  v215[0] = v164;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v163, "wallpaperPropertiesVersion"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v215[1] = v165;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v215, v214, 2);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v166, CFSTR("NSWallpaperPropertiesVersions"));

  objc_msgSend(v163, "wallpaperPropertiesTimestamp");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v163, "wallpaperPropertiesTimestamp");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "localizedStringFromDate:dateStyle:timeStyle:", v169, 1, 1);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v170, CFSTR("NSWallpaperPropertiesTimestamp"));

  }
  else
  {
    objc_msgSend(v52, "setObject:forKeyedSubscript:", CFSTR("Never computed"), CFSTR("NSWallpaperPropertiesTimestamp"));
  }

  objc_msgSend(v163, "wallpaperPropertiesData");
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  if (v171)
  {
    v172 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v163, "wallpaperPropertiesData");
    v173 = (PGWallpaperSuggestionAssetGater *)objc_claimAutoreleasedReturnValue();
    v190 = 0;
    objc_msgSend(v172, "propertyListWithData:options:format:error:", v173, 0, 0, &v190);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v190;
  }
  else
  {
    v176 = [PGWallpaperSuggestionAssetGater alloc];
    v173 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v176, "initWithType:loggingConnection:", 1, MEMORY[0x1E0C81028]);
    -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v173, "setIsUserInitiated:", 1);
    v189 = 0;
    -[PGWallpaperSuggestionAssetGater requestWallpaperPropertiesForAsset:progressBlock:error:](v173, "requestWallpaperPropertiesForAsset:progressBlock:error:", v14, &__block_literal_global_44272, &v189);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v189;
  }
  v177 = v175;

  if (v174)
  {
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v174, CFSTR("NSWallpaperProperties"));
  }
  else
  {
    objc_msgSend(v177, "description");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v178, CFSTR("NSWallpaperProperties"));

  }
  return v52;
}

+ (id)_sceneprintDistanceStringFromAsset:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  const __CFString *v13;
  double v14;
  __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  const __CFString *v21;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
  objc_msgSend(v7, "distanceBetweenItem:andItem:", v5, v6);
  v9 = v8;
  if (v8 >= 1.79769313e308)
  {
    objc_msgSend(v6, "clsSceneprint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v5, "sceneAnalysisProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "sceneAnalysisVersion");

      objc_msgSend(v6, "sceneAnalysisProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "sceneAnalysisVersion");

      if (v18 == v20)
      {
        v21 = CFSTR("Error in computation");
      }
      else
      {
        v23 = v18;
        v24 = v20;
        v21 = CFSTR("%hd != %hd");
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v21, v23, v24);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("No sceneprint");
    }

  }
  else
  {
    v10 = objc_msgSend(v5, "clsSimilarityModelVersion");
    objc_msgSend(v7, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 0, v10);
    v12 = v11;
    objc_msgSend(v7, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 2, v10);
    v13 = CFSTR("-");
    if (v9 <= v14)
      v13 = CFSTR("Sem.");
    if (v9 <= v12)
      v13 = CFSTR("Id.");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.5f (%@)"), *(_QWORD *)&v9, v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)_personDescriptionStringsInAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  __CFString *v31;
  id v32;
  int v33;
  const __CFString *v34;
  int v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  unsigned int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id obj;
  uint64_t v63;
  id v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("verifiedType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  objc_msgSend(v5, "setIncludedDetectionTypes:", &unk_1E84EA1C8);
  objc_msgSend(v5, "setPersonContext:", 5);
  v61 = v5;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v59 = v4;
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIncludedDetectionTypes:", &unk_1E84EA1E0);
    objc_msgSend(v10, "setIncludeTorsoAndFaceDetectionData:", 1);
    v60 = v3;
    v57 = v10;
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v71 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v18, "personLocalIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v15);
    }
    v56 = v13;

    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v58 = v9;
    obj = v9;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v65)
    {
      v63 = *(_QWORD *)v67;
      v20 = 0x1E0CB3000uLL;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v67 != v63)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v23, "length"))
          {
            objc_msgSend(v22, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(void **)(v20 + 2368);
            objc_msgSend(v24, "substringToIndex:", 19);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "substringFromIndex:", 19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@\n%@"), v26, v27);
            v28 = objc_claimAutoreleasedReturnValue();

            v20 = 0x1E0CB3000;
            v23 = (void *)v28;
          }
          v29 = objc_msgSend(v22, "verifiedType");
          v30 = CFSTR("Unvrfd");
          if (v29 == 2)
            v30 = CFSTR("Graph");
          if (v29 == 1)
            v30 = CFSTR("User");
          v31 = v30;
          v32 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v33 = objc_msgSend(v22, "detectionType");
          v34 = CFSTR("🐶 ");
          if (v33 == 3 || (v35 = objc_msgSend(v22, "detectionType", CFSTR("🐶 ")), v34 = CFSTR("🐱 "), v35 == 4))
            objc_msgSend(v32, "appendString:", v34);
          objc_msgSend(v32, "appendFormat:", CFSTR("%@ (%@):\n"), v23, v31);
          objc_msgSend(v22, "mergeCandidateConfidence");
          if (v36 > 0.0)
          {
            v37 = v36;
            objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidateWithConfidencePersonsForPerson:options:", v22, v61);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "name");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v40, "length"))
            {
              objc_msgSend(v39, "uuid");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "substringToIndex:", 8);
              v42 = objc_claimAutoreleasedReturnValue();

              v40 = (void *)v42;
            }
            objc_msgSend(v32, "appendFormat:", CFSTR("\t-> %@ (%.2f)\n"), v40, *(_QWORD *)&v37);

            v20 = 0x1E0CB3000uLL;
          }
          objc_msgSend(v22, "localIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v45 = CFSTR("🙈");
            if (objc_msgSend(v44, "eyesState") == 2)
            {
              v46 = objc_msgSend(v44, "faceExpressionType");
              v45 = CFSTR("⁉️");
              if (v46 <= 6)
                v45 = off_1E842EF68[v46];
            }
            v47 = *(void **)(v20 + 2368);
            objc_msgSend(v44, "size");
            v49 = v48;
            objc_msgSend(v44, "quality");
            if (v50 >= 0.0)
            {
              v52 = *(void **)(v20 + 2368);
              objc_msgSend(v44, "quality");
              objc_msgSend(v52, "stringWithFormat:", CFSTR("%.3f"), v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "stringWithFormat:", CFSTR("s=%.2f, e=%@, q=%@"), v49, v45, v54);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v47, "stringWithFormat:", CFSTR("s=%.2f, e=%@, q=%@"), v49, v45, CFSTR("-"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v32, "appendFormat:", CFSTR("\t%@"), v51);

          }
          else
          {
            objc_msgSend(v32, "appendFormat:", CFSTR("\tno face"));
          }
          objc_msgSend(v64, "addObject:", v32);

        }
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v65);
    }

    v4 = v59;
    v3 = v60;
    v9 = v58;
  }
  else
  {
    v64 = (id)MEMORY[0x1E0C9AA60];
  }

  return v64;
}

void __68__PGAssetDebugInformation_debugInformationForAsset_curationContext___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, void *a9)
{
  id v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  id v25;
  id v26;

  v16 = a9;
  v26 = v16;
  if (a6 * a7 <= 0.0)
  {
    v22 = v16;
    if (a3 > 0.0)
    {
      v23 = CFSTR("<");
      if (a2 >= a3)
        v23 = CFSTR("≥");
      v24 = v23;
      v25 = v26;
      v20 = v24;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.2f, %.2f  %.2f x %.2f]"), a6 * a7, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (a3 > 0.0)
  {
    v19 = CFSTR("<");
    if (a2 >= a3)
      v19 = CFSTR("≥");
    v20 = v19;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\r\t\t confidence: (%.2f%@%.2f),\r\t\t boundingBox: %@"), v26, *(_QWORD *)&a2, v20, *(_QWORD *)&a3, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      goto LABEL_17;
    }
    v25 = v26;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\r\t\t confidence: (%.2f%@%.2f)"), v25, *(_QWORD *)&a2, v20, *(_QWORD *)&a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v22 = v26;
  if (!v17)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\r\t\t confidence: (%.2f)"), v22, *(_QWORD *)&a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\r\t\t confidence: (%.2f),\r\t\t boundingBox: %@"), v26, *(_QWORD *)&a2, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);

}

@end
