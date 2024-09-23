@implementation PNSuggestionWallpaperUtilities

+ (id)randomNumberGeneratorForWallpaperDonation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "randomNumberGeneratorForWallpaperDonationWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)randomNumberGeneratorForWallpaperDonationWithDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyMMdd"));
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v9 + 1;
      v8 += (v9 + 1) * objc_msgSend(v5, "characterAtIndex:");
      v9 = v10;
    }
    while (v7 != v10);
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72430]), "initWithSeed:", v8);

  return v11;
}

+ (id)fetchWallpaperGallerySuggestionsInPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %d AND %K <= %d"), CFSTR("subtype"), 602, CFSTR("subtype"), 605);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x24BDE3698], "fetchWallpaperSuggestionsWithFeaturedState:withOptions:", 1, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  objc_msgSend(a1, "randomNumberGeneratorForWallpaperDonation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PFMutableArrayShuffleWithRandomNumberGenerator();

  return v8;
}

+ (id)wallpaperGallerySmartAlbumSuggestionsFromSuggestions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "coldStartPortraitWallpaperInPhotoLibrary:passingFilterBlock:maximumNumberOfTries:", a3, &__block_literal_global_1152, 0x7FFFFFFFFFFFFFFFLL);
}

+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3 passingFilterBlock:(id)a4 maximumNumberOfTries:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  id v13;
  void *v14;
  char *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  os_signpost_id_t spid;
  uint64_t v30;
  void *v31;
  id v32;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32 = a4;
  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ColdStartPortraitWallpaperPeopleFetch", ", buf, 2u);
  }
  spid = v9;

  v30 = mach_absolute_time();
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE36A8]), "initWithPhotoLibrary:", v7);
  objc_msgSend(v31, "personUUIDsWithNegativeFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unionSet:", v14);
  objc_msgSend(a1, "_mePersonUUIDInPhotoLibrary:", v7);
  v15 = (char *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl(&dword_243C3E000, v16, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] exclude mePersonUUID %@", buf, 0xCu);
    }

    objc_msgSend(v13, "addObject:", v15);
  }
  objc_msgSend(a1, "_personFetchOptionsWithPhotoLibrary:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("personUUID"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInternalPredicate:", v18);

  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v21;
    _os_log_impl(&dword_243C3E000, v20, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %d candidate people found in library", buf, 8u);
  }

  v22 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v25 = v11;
  v26 = v25;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v26, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaperPeopleFetch", ", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "ColdStartPortraitWallpaperPeopleFetch";
    v37 = 2048;
    v38 = (float)((float)((float)((float)(v22 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  objc_msgSend(a1, "_coldStartPortraitWallpaperInPhotoLibrary:candidatePersons:passingFilterBlock:maximumNumberOfTries:targetCount:", v7, v19, v32, a5, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)coldStartDeviceOwnerWallpaperInPhotoLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint32_t v25;
  uint32_t v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t spid;
  uint64_t v31;
  mach_timebase_info info;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ColdStartMeWallpaperPeopleFetch", ", buf, 2u);
  }

  v10 = mach_absolute_time();
  objc_msgSend(a1, "_mePersonUUIDInPhotoLibrary:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    spid = v6;
    v31 = v10;
    objc_msgSend(a1, "_personFetchOptionsWithPhotoLibrary:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDE35E0];
    v33 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchPersonsWithLocalIdentifiers:options:", v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v20 = v8;
    v21 = v20;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v21, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartMeWallpaperPeopleFetch", ", buf, 2u);
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "ColdStartMeWallpaperPeopleFetch";
      v36 = 2048;
      v37 = (float)((float)((float)((float)(v17 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_243C3E000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    objc_msgSend(a1, "_coldStartPortraitWallpaperInPhotoLibrary:candidatePersons:passingFilterBlock:maximumNumberOfTries:targetCount:", v4, v16, &__block_literal_global_170, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLWallpaperGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, v23, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No device owner found", buf, 2u);
    }

    v24 = mach_absolute_time();
    v26 = info.numer;
    v25 = info.denom;
    v27 = v8;
    v28 = v27;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v28, OS_SIGNPOST_INTERVAL_END, v6, "ColdStartMeWallpaperPeopleFetch", ", buf, 2u);
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "ColdStartMeWallpaperPeopleFetch";
      v36 = 2048;
      v37 = (float)((float)((float)((float)(v24 - v10) * (float)v26) / (float)v25) / 1000000.0);
      _os_log_impl(&dword_243C3E000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

+ (id)_coldStartPortraitWallpaperInPhotoLibrary:(id)a3 candidatePersons:(id)a4 passingFilterBlock:(id)a5 maximumNumberOfTries:(unint64_t)a6 targetCount:(unint64_t)a7
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t j;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint32_t v44;
  uint32_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint32_t v50;
  uint32_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t (**v63)(_QWORD, _QWORD, _QWORD);
  id v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  double v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t ii;
  void *v103;
  id v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  NSObject *v123;
  NSObject *v124;
  const char *v125;
  uint32_t v126;
  uint64_t v127;
  NSObject *v128;
  _BOOL4 v129;
  uint64_t v130;
  uint64_t v131;
  uint32_t numer;
  uint32_t denom;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint32_t v140;
  uint32_t v141;
  NSObject *v142;
  NSObject *v143;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  NSObject *v149;
  id v150;
  unint64_t v151;
  os_signpost_id_t spid;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v159;
  id v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  id v165;
  unint64_t v166;
  void *context;
  void *v168;
  unint64_t v169;
  unint64_t v170;
  id v171;
  void *v173;
  id v174;
  unsigned int (**v175)(id, _QWORD);
  id v176;
  id obj;
  id v179;
  uint64_t v180;
  id v181;
  unint64_t v182;
  id v183;
  char v184;
  id v185;
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
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[4];
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  mach_timebase_info info;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _QWORD v221[3];
  _BYTE v222[128];
  uint8_t v223[128];
  uint8_t buf[4];
  _BYTE v225[18];
  _BYTE v226[128];
  uint64_t v227;

  v227 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v175 = (unsigned int (**)(id, _QWORD))a5;
  if (objc_msgSend(v10, "count"))
  {
    v157 = v9;
    PLWallpaperGetLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);
    info = 0;
    mach_timebase_info(&info);
    v13 = v11;
    v14 = v13;
    v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ColdStartPortraitWallpaper", ", buf, 2u);
    }
    spid = v12;

    v153 = mach_absolute_time();
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v212 = 0u;
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v212, v226, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v213;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v213 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * i), "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v212, v226, 16);
      }
      while (v19);
    }

    PLWallpaperGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v225 = v24;
      *(_WORD *)&v225[4] = 2112;
      *(_QWORD *)&v225[6] = v16;
      _os_log_impl(&dword_243C3E000, v23, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Starting with %d candidate people: %@", buf, 0x12u);
    }

    v9 = v157;
    objc_msgSend(a1, "_mostRecentAssetDateInPhotoLibrary:", v157);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v151 = v15;
      objc_msgSend(v25, "dateByAddingTimeInterval:", -94608000.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE35E0], "momentCountsByPersonUUIDForPersonsWithUUIDs:afterDate:photoLibrary:", v16, v27, v157);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");
      if (v29)
      {
        v30 = v29;
        v147 = v26;
        v149 = v14;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "allKeys");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v225 = v30;
          *(_WORD *)&v225[4] = 2112;
          *(_QWORD *)&v225[6] = v31;
          _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %d people found in library that were present in the past 3 years: %@", buf, 0x12u);

        }
        v150 = v10;
        objc_msgSend(v17, "fetchedObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v210[0] = MEMORY[0x24BDAC760];
        v210[1] = 3221225472;
        v210[2] = __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke;
        v210[3] = &unk_25147FE18;
        v33 = v28;
        v211 = v33;
        objc_msgSend(v32, "sortedArrayUsingComparator:", v210);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v208 = 0u;
        v209 = 0u;
        v206 = 0u;
        v207 = 0u;
        obj = v33;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v223, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v207;
          v38 = 0.0;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v207 != v37)
                objc_enumerationMutation(obj);
              objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * j));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v38 + (double)(unint64_t)objc_msgSend(v40, "unsignedIntegerValue");

            }
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v223, 16);
          }
          while (v36);
        }
        else
        {
          v38 = 0.0;
        }
        v145 = v28;
        v146 = v27;
        v148 = v16;

        v160 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v174 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v202 = 0u;
        v203 = 0u;
        v204 = 0u;
        v205 = 0u;
        v171 = v34;
        v54 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v203;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v203 != v56)
                objc_enumerationMutation(v171);
              v58 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * k);
              objc_msgSend(v58, "uuid");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectForKeyedSubscript:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "unsignedIntegerValue");

              if (v61)
              {
                objc_msgSend(v58, "uuid");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "addObject:", v62);

              }
            }
            v55 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
          }
          while (v55);
        }

        objc_msgSend(a1, "_assetSortComparatorForPortraitWallpaper");
        v63 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v65 = objc_msgSend(v174, "count");
        v66 = 5;
        if (v65 < 5)
          v66 = v65;
        v161 = v66;
        v67 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v165 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v173 = v64;
        v163 = v67;
        if (objc_msgSend(v64, "count") < a7)
        {
          v169 = 0;
          v68 = v38 / (double)v30;
          v156 = *MEMORY[0x24BDE3720];
          v155 = *MEMORY[0x24BDE36E0];
          v154 = *MEMORY[0x24BDE3750];
          do
          {
            if (!objc_msgSend(v174, "count") || v169 >= a6)
              break;
            v69 = (void *)objc_msgSend(v174, "copy");
            if (!objc_msgSend(v69, "count"))
              goto LABEL_142;
            v164 = 0;
            v70 = 0;
            v162 = v69;
            do
            {
              v71 = (void *)MEMORY[0x249506444]();
              objc_msgSend(v69, "objectAtIndexedSubscript:", v70);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v67, "count") >= 5
                && (objc_msgSend(v67, "containsObject:", v72) & 1) == 0)
              {
                objc_msgSend(v174, "removeObject:", v72);
                ++v164;
                goto LABEL_141;
              }
              context = v71;
              if ((unint64_t)objc_msgSend(v67, "count") >= 3)
              {
                objc_msgSend(v160, "objectForKeyedSubscript:", v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v73, "type") == 1)
                {

                }
                else
                {
                  objc_msgSend(obj, "objectForKeyedSubscript:", v72);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "doubleValue");
                  v76 = v75;

                  if (v76 < v68)
                  {
                    objc_msgSend(v174, "removeObjectsInRange:", v70 - v164, objc_msgSend(v174, "count") - (v70 - v164));

                    objc_autoreleasePoolPop(context);
                    v69 = v162;
                    break;
                  }
                }
              }
              objc_msgSend(v165, "objectForKeyedSubscript:", v72);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = v70;
              v168 = v72;
              if (v77)
                goto LABEL_102;
              objc_msgSend(v157, "librarySpecificFetchOptions");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v221[0] = v156;
              v221[1] = v155;
              v221[2] = v154;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v221, 3);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "setFetchPropertySets:", v79);

              v80 = (void *)MEMORY[0x24BDBCF20];
              objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", v72);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "setWithObject:", v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:", v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "setInternalPredicate:", v83);

              v176 = v78;
              objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v78);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v181 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v198 = 0u;
              v199 = 0u;
              v200 = 0u;
              v201 = 0u;
              v185 = v84;
              v85 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v198, v220, 16);
              if (v85)
              {
                v86 = v85;
                v87 = *(_QWORD *)v199;
                do
                {
                  for (m = 0; m != v86; ++m)
                  {
                    if (*(_QWORD *)v199 != v87)
                      objc_enumerationMutation(v185);
                    v89 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * m);
                    if (+[PNAssetCurationUtilities assetIsSafeForWidgetDisplay:](PNAssetCurationUtilities, "assetIsSafeForWidgetDisplay:", v89))
                    {
                      buf[0] = 0;
                      +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:](PNSuggestionWallpaperUtilities, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:", v89, 1, 0, buf);
                      if (buf[0])
                        objc_msgSend(v181, "addObject:", v89);
                    }
                  }
                  v86 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v198, v220, 16);
                }
                while (v86);
              }

              if (!objc_msgSend(v181, "count"))
              {
                v72 = v168;
                objc_msgSend(v174, "removeObject:", v168);
                ++v164;

                v69 = v162;
                v70 = v166;
                v71 = context;
                goto LABEL_140;
              }
              v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71F88]), "initWithDistanceBlock:", &__block_literal_global_180);
              objc_msgSend(v90, "setMaximumDistance:", 7200.0);
              objc_msgSend(v90, "setMinimumNumberOfObjects:", 1);
              v159 = v90;
              objc_msgSend(v90, "performWithDataset:progressBlock:", v181, 0);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v179 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v194 = 0u;
              v195 = 0u;
              v196 = 0u;
              v197 = 0u;
              v183 = v91;
              v92 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v194, v219, 16);
              if (!v92)
                goto LABEL_101;
              v93 = v92;
              v94 = *(_QWORD *)v195;
              do
              {
                for (n = 0; n != v93; ++n)
                {
                  if (*(_QWORD *)v195 != v94)
                    objc_enumerationMutation(v183);
                  v96 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * n);
                  v190 = 0u;
                  v191 = 0u;
                  v192 = 0u;
                  v193 = 0u;
                  objc_msgSend(v96, "objects");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v190, v218, 16);
                  if (!v98)
                  {
                    v100 = v97;
                    goto LABEL_98;
                  }
                  v99 = v98;
                  v100 = 0;
                  v101 = *(_QWORD *)v191;
                  do
                  {
                    for (ii = 0; ii != v99; ++ii)
                    {
                      if (*(_QWORD *)v191 != v101)
                        objc_enumerationMutation(v97);
                      v103 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * ii);
                      if (!v100
                        || ((uint64_t (**)(_QWORD, _QWORD, void *))v63)[2](v63, *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * ii), v100) == -1)
                      {
                        v104 = v103;

                        v100 = v104;
                      }
                    }
                    v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v190, v218, 16);
                  }
                  while (v99);

                  if (v100)
                  {
                    objc_msgSend(v179, "addObject:", v100);
LABEL_98:

                    continue;
                  }
                }
                v93 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v194, v219, 16);
              }
              while (v93);
LABEL_101:

              objc_msgSend(v179, "sortedArrayUsingComparator:", v63);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "setObject:forKeyedSubscript:", v77, v168);

              v64 = v173;
              v67 = v163;
LABEL_102:
              v105 = v161 - objc_msgSend(v67, "count");
              v106 = a7 - objc_msgSend(v64, "count");
              v107 = vcvtmd_u64_f64((double)v106 / (double)v105);
              v108 = v169;
              if (v107 <= 1)
                v109 = 1;
              else
                v109 = v107;
              v110 = vcvtmd_u64_f64((double)(a6 - v169) / (double)v105);
              if (v110 <= 1)
                v111 = 1;
              else
                v111 = v110;
              v185 = (id)objc_msgSend(v77, "mutableCopy");
              v186 = 0u;
              v187 = 0u;
              v188 = 0u;
              v189 = 0u;
              v176 = v77;
              v112 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v186, v217, 16);
              if (v112)
              {
                v113 = v112;
                v184 = 0;
                v114 = 0;
                v115 = 0;
                v182 = v109 + v106 - v109 * v105;
                v116 = v111 + a6 - v169 - v111 * v105;
                v117 = *(_QWORD *)v187;
                v118 = v185;
LABEL_110:
                v119 = 0;
                v170 = v108 + v113;
                v120 = v115 + 1;
                v180 = v115 + v113;
                while (1)
                {
                  if (*(_QWORD *)v187 != v117)
                    objc_enumerationMutation(v176);
                  v121 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * v119);
                  objc_msgSend(v118, "removeObject:", v121);
                  if (v175[2](v175, v121))
                  {
                    objc_msgSend(v173, "addObject:", v121);
                    if (++v114 >= v182 || objc_msgSend(v173, "count") >= a7)
                    {
                      v122 = v108 + v119;
                      v184 = 1;
                      goto LABEL_124;
                    }
                    v184 = 1;
                    v118 = v185;
                  }
                  v122 = v108 + v119 + 1;
                  if (v122 >= a6)
                    break;
                  if (v120 + v119 >= v116)
                  {
                    PLWallpaperGetLog();
                    v123 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v225 = v108 + v119 + 1;
                      *(_WORD *)&v225[4] = 2112;
                      *(_QWORD *)&v225[6] = v168;
                      v124 = v123;
                      v125 = "[PNSuggestionWallpaperUtilities] max (%d) number of filter tries reached for person (%@), s"
                             "topping early for person.";
                      v126 = 18;
LABEL_132:
                      _os_log_impl(&dword_243C3E000, v124, OS_LOG_TYPE_INFO, v125, buf, v126);
                    }
                    goto LABEL_133;
                  }
                  if (v113 == ++v119)
                  {
                    v113 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v186, v217, 16);
                    v122 = v170;
                    v108 = v170;
                    v115 = v180;
                    if (v113)
                      goto LABEL_110;
                    goto LABEL_134;
                  }
                }
                if (a6 <= v108 + 1)
                  v122 = v108 + 1;
                else
                  v122 = a6;
                PLWallpaperGetLog();
                v123 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v225 = v122;
                  v124 = v123;
                  v125 = "[PNSuggestionWallpaperUtilities] max (%d) number of total filter tries reached, stopping early.";
                  v126 = 8;
                  goto LABEL_132;
                }
LABEL_133:

                goto LABEL_134;
              }
              v184 = 0;
              v122 = v169;
LABEL_124:
              v118 = v185;
LABEL_134:
              v169 = v122;

              v72 = v168;
              if (objc_msgSend(v118, "count"))
              {
                objc_msgSend(v165, "setObject:forKeyedSubscript:", v118, v168);
              }
              else
              {
                objc_msgSend(v174, "removeObject:", v168);
                ++v164;
              }
              v64 = v173;
              v69 = v162;
              v67 = v163;
              v70 = v166;
              v71 = context;
              if ((v184 & 1) != 0)
                objc_msgSend(v163, "addObject:", v168);
LABEL_140:

LABEL_141:
              objc_autoreleasePoolPop(v71);
              ++v70;
            }
            while (v70 < objc_msgSend(v69, "count"));
LABEL_142:

          }
          while (objc_msgSend(v64, "count") < a7);
        }
        v127 = objc_msgSend(v67, "count");
        PLWallpaperGetLog();
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT);
        v10 = v150;
        if (v127)
        {
          v14 = v149;
          v27 = v146;
          if (v129)
          {
            v130 = objc_msgSend(v163, "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v225 = v130;
            _os_log_impl(&dword_243C3E000, v128, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %tu important people found in library to feature", buf, 0xCu);
          }

          v131 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v134 = v149;
          v135 = v134;
          v16 = v148;
          v28 = v145;
          if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_243C3E000, v135, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", ", buf, 2u);
          }

          if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v225 = "ColdStartPortraitWallpaper";
            *(_WORD *)&v225[8] = 2048;
            *(double *)&v225[10] = (float)((float)((float)((float)(v131 - v153) * (float)numer) / (float)denom)
                                         / 1000000.0);
            _os_log_impl(&dword_243C3E000, v135, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          PLWallpaperGetLog();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
          {
            v137 = objc_msgSend(v173, "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v225 = v137;
            _os_log_impl(&dword_243C3E000, v136, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %tu assets selected as fallback wallpaper gallery featured photo suggestions", buf, 0xCu);
          }

          v138 = v173;
          v41 = v173;
        }
        else
        {
          v16 = v148;
          v14 = v149;
          v27 = v146;
          if (v129)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_243C3E000, v128, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No candidate assets found for important people found in library, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
          }

          v139 = mach_absolute_time();
          v140 = info.numer;
          v141 = info.denom;
          v142 = v149;
          v143 = v142;
          v28 = v145;
          if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_243C3E000, v143, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", ", buf, 2u);
          }

          if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v225 = "ColdStartPortraitWallpaper";
            *(_WORD *)&v225[8] = 2048;
            *(double *)&v225[10] = (float)((float)((float)((float)(v139 - v153) * (float)v140) / (float)v141) / 1000000.0);
            _os_log_impl(&dword_243C3E000, v143, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          v41 = (id)MEMORY[0x24BDBD1A8];
          v138 = v173;
        }

        v9 = v157;
        v26 = v147;
      }
      else
      {
        PLWallpaperGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_243C3E000, v48, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No people found in library that were present in the past 3 years, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
        }

        v49 = mach_absolute_time();
        v50 = info.numer;
        v51 = info.denom;
        v52 = v14;
        v53 = v52;
        if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_243C3E000, v53, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", ", buf, 2u);
        }

        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v225 = "ColdStartPortraitWallpaper";
          *(_WORD *)&v225[8] = 2048;
          *(double *)&v225[10] = (float)((float)((float)((float)(v49 - v153) * (float)v50) / (float)v51) / 1000000.0);
          _os_log_impl(&dword_243C3E000, v53, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        v41 = (id)MEMORY[0x24BDBD1A8];
      }

    }
    else
    {
      PLWallpaperGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_243C3E000, v42, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Library has no assets, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
      }

      v43 = mach_absolute_time();
      v44 = info.numer;
      v45 = info.denom;
      v46 = v14;
      v47 = v46;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_243C3E000, v47, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", ", buf, 2u);
      }

      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v225 = "ColdStartPortraitWallpaper";
        *(_WORD *)&v225[8] = 2048;
        *(double *)&v225[10] = (float)((float)((float)((float)(v43 - v153) * (float)v44) / (float)v45) / 1000000.0);
        _os_log_impl(&dword_243C3E000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v41 = (id)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v41 = (id)MEMORY[0x24BDBD1A8];
  }

  return v41;
}

+ (id)_fetchMeContactIdentifier
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  objc_msgSend(MEMORY[0x24BDE35F0], "sharedContactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1107;
  v13 = __Block_byref_object_dispose__1108;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__PNSuggestionWallpaperUtilities__fetchMeContactIdentifier__block_invoke;
  v6[3] = &unk_25147FE80;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)_fetchSuggestedMePersonLocalIdentifierInPhotoLibrary:(id)a3
{
  void *v3;
  id v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  objc_msgSend(a3, "suggestedMePersonIdentifierWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No suggested me person found, error: %@", buf, 0xCu);
  }

  return v3;
}

+ (id)_personFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x24BDE3858];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(v3, "setPersonContext:", 1);
  return v3;
}

+ (id)_mostRecentAssetDateInPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_assetSortComparatorForPortraitWallpaper
{
  return &__block_literal_global_185;
}

+ (id)_mePersonUUIDInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_fetchMeContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_personFetchOptionsWithPhotoLibrary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDE35E0];
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchPersonsForContactIdentifiers:options:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject uuid](v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLWallpaperGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_243C3E000, v12, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found me person with contact identifier: %@, personUUID: %@", (uint8_t *)&v14, 0x16u);
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "_fetchSuggestedMePersonLocalIdentifierInPhotoLibrary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDE35E0], "uuidFromLocalIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLWallpaperGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_243C3E000, v10, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found suggestedMe personUUID: %@", (uint8_t *)&v14, 0xCu);
    }
  }

LABEL_11:
  return v11;
}

+ (id)fetchPortraitAssetsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "internalPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "knownPersonLocalIdentifiersInPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    v10 = (void *)MEMORY[0x24BDD14C0];
    v24[0] = v8;
    v24[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v8;
  }
  objc_msgSend(v4, "setInternalPredicate:", v12);
  v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithArray:", v16);

  objc_msgSend(v4, "internalSortDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    objc_msgSend(v4, "internalSortDescriptors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v20);

  }
  objc_msgSend(v4, "setInternalSortDescriptors:", v17);
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v4 = a3;
  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v12;
}

+ (id)randomizedSuggestionsFromSuggestions:(id)a3 limit:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v6, "fetchedObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

    objc_msgSend(a1, "randomNumberGeneratorForWallpaperDonation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PFMutableArrayShuffleWithRandomNumberGenerator();
    v12 = objc_msgSend(v10, "count");
    if (v12 >= a4)
      v13 = a4;
    else
      v13 = v12;
    objc_msgSend(v10, "subarrayWithRange:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x24BDE35B0]);
    objc_msgSend(v6, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDE37E0];
    objc_msgSend(v6, "fetchPropertySets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v15, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v16, v17, v18, 0, 0);

  }
  else
  {
    v7 = v6;
  }

  return v7;
}

+ (id)wallpaperPeopleLocalIdentifiersInPhotoLibrary:(id)a3 vipOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  uint64_t v37;
  const __CFString *v38;
  _QWORD v39[2];

  v4 = a4;
  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1107;
  v30 = __Block_byref_object_dispose__1108;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v5, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = CFSTR("VipOnly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __88__PNSuggestionWallpaperUtilities_wallpaperPeopleLocalIdentifiersInPhotoLibrary_vipOnly___block_invoke;
  v23 = &unk_25147FEE8;
  v25 = &v26;
  v10 = v6;
  v24 = v10;
  objc_msgSend(v7, "requestPeopleForWallpaperSuggestionsWithOptions:reply:", v9, &v20);

  v11 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v11))
  {
    PLWallpaperGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, v12, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Timeout getting wallpaper people local identifiers", buf, 2u);
    }

  }
  v13 = CFSTR("all");
  if (v4)
    v13 = CFSTR("VIP");
  v14 = v13;
  PLWallpaperGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend((id)v27[5], "count", v20, v21, v22, v23);
    v17 = v27[5];
    *(_DWORD *)buf = 67109634;
    v33 = v16;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v17;
    _os_log_impl(&dword_243C3E000, v15, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found %d %@ wallpaper people: %@", buf, 0x1Cu);
  }

  v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

+ (void)rejectWallpaperSuggestionsUsingAssetOfSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x24BDE3488], "fetchKeyAssetsInAssetCollection:options:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rejectWallpaperSuggestionsUsingAsset:completionHandler:", v10, v6);
}

+ (void)rejectWallpaperSuggestionsUsingAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_243C3E000, v8, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] reject wallpaper asset: %@", buf, 0xCu);

  }
  objc_msgSend(v6, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsContainingAsset:withType:options:", v6, 8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rejectWallpaperSuggestions:completionHandler:", v14, v7);

}

+ (void)rejectWallpaperSuggestions:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke;
    v13[3] = &unk_251480110;
    v14 = v5;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke_2;
    v10[3] = &unk_25147FF10;
    v12 = v6;
    v11 = v14;
    objc_msgSend(v8, "performChanges:completionHandler:", v13, v10);

  }
}

+ (int64_t)primaryOrientation
{
  if (PLPhysicalDeviceIsIPad())
    return 2;
  else
    return 1;
}

+ (unint64_t)posterClassificationForSuggestionSubtype:(unsigned __int16)a3
{
  unint64_t result;

  result = 1;
  switch(a3)
  {
    case 0x25Au:
      return result;
    case 0x25Bu:
LABEL_4:
      result = 2;
      break;
    case 0x25Cu:
LABEL_5:
      result = 3;
      break;
    case 0x25Du:
LABEL_6:
      result = 4;
      break;
    default:
      switch(a3)
      {
        case 0x28Cu:
          return result;
        case 0x28Du:
          goto LABEL_4;
        case 0x28Eu:
          goto LABEL_5;
        case 0x28Fu:
          goto LABEL_6;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6 layoutConfiguration:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  CGRect result;

  v11 = a7;
  v12 = a3;
  objc_msgSend(v12, "normalizedFaceAreaRect");
  v50 = v14;
  v51 = v13;
  v48 = v16;
  v49 = v15;
  v52 = 0;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE72410], "deviceConfigurationForOrientation:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)MEMORY[0x24BE723E8];
  v18 = objc_msgSend(v12, "pixelWidth");
  v19 = objc_msgSend(v12, "pixelHeight");
  objc_msgSend(v12, "preferredCropRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v12, "acceptableCropRect");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  objc_msgSend(v17, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", a4, v11, v18, v19, a5, &v52, v21, v23, v25, v27, v29, v31, v33, v35, v51,
    v50,
    v49,
    v48,
    a6);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = v37;
  v45 = v39;
  v46 = v41;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend(a1, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:layoutConfiguration:", a3, a4, a5, a6, 0);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)bestWallpaperCropForSuggestion:(id)a3 outputCropScore:(double *)a4 outputLayoutAcceptable:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v7 = a3;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x24BDE3488], "fetchKeyAssetsInAssetCollection:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:](PNSuggestionWallpaperUtilities, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:", v11, +[PNSuggestionWallpaperUtilities posterClassificationForSuggestionSubtype:](PNSuggestionWallpaperUtilities, "posterClassificationForSuggestionSubtype:", objc_msgSend(v7, "subtype")), a4, a5);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    if (a4)
      *a4 = 0.0;
    if (a5)
      *a5 = 0;
    v13 = *MEMORY[0x24BDBF070];
    v15 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (double)cropScoreWithAsset:(id)a3 classification:(unint64_t)a4 passesClockOverlap:(BOOL *)a5 cropZoomRatio:(double *)a6 orientation:(int64_t)a7
{
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v24;

  v12 = a3;
  objc_msgSend(MEMORY[0x24BE72410], "deviceConfigurationForOrientation:", a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0.0;
  objc_msgSend(a1, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:layoutConfiguration:", v12, a4, &v24, a5, v13);
  if (a6)
  {
    v15 = v14;
    objc_msgSend(v13, "screenSize");
    v17 = v16;
    v18 = v15 * (double)(unint64_t)objc_msgSend(v12, "pixelWidth");
    v19 = v17 / v18;
    v20 = v18 <= 0.0;
    v21 = 1.0;
    if (!v20)
      v21 = v19;
    *a6 = v21;
  }
  v22 = v24;

  return v22;
}

+ (id)_facePredicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x24BDE35E0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K.%K in %@"), CFSTR("personForFace"), CFSTR("personUUID"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x24BE72418], "facePositionLimits");
  v15 = 0.0 * a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %K AND $face.%K >= %f AND $face.%K < %f"), CFSTR("height"), CFSTR("width"), CFSTR("size"), 0, CFSTR("size"), *(_QWORD *)&v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K < %K AND $face.%K >= (%f * %d / %d) AND $face.%K < (%f * %d / %d)"), CFSTR("height"), CFSTR("width"), CFSTR("size"), 0, CFSTR("width"), CFSTR("height"), CFSTR("size"), *(_QWORD *)&v15, CFSTR("width"), CFSTR("height"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD14C0];
  v42[0] = v36;
  v42[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "orPredicateWithSubpredicates:", v17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v34);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($face.%K - $face.%K * 0.5) >= %f AND ($face.%K + $face.%K * 0.5) <= %f"), CFSTR("centerX"), CFSTR("size"), 0, CFSTR("centerX"), CFSTR("size"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($face.%K - $face.%K * 0.5) >= (%f * %d / %d) AND ($face.%K + $face.%K * 0.5) <= (%f * %d / %d)"), CFSTR("centerX"), CFSTR("size"), CFSTR("width"), CFSTR("height"), 0, CFSTR("centerX"), CFSTR("size"), CFSTR("width"), CFSTR("height"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD14C0];
  v41[0] = v33;
  v41[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v31);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($face.%K + $face.%K * 0.5) >= %f AND ($face.%K + $face.%K * 0.5) <= %f"), CFSTR("bodyCenterY"), CFSTR("bodyHeight"), 0, CFSTR("bodyCenterY"), CFSTR("bodyHeight"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v20);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K >= %f AND $face.%K <= %f"), CFSTR("roll"), 0xBFE921FB54442D18, CFSTR("roll"), 0x3FE921FB54442D18);
  v30 = v5;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v21);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K IN %@"), CFSTR("poseType"), &unk_25149A6E8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v22);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K >= %f"), CFSTR("quality"), 0x3FD0000000000000);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v23);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K >= %f"), CFSTR("blurScore"), 0x3FC999999999999ALL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v24);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K != %d AND $face.%K != %d"), CFSTR("faceExpressionType"), 3, CFSTR("faceExpressionType"), 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v25);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K == %d"), CFSTR("eyesState"), 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v26);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$face.%K == %d"), CFSTR("hasFaceMask"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v27);
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)_blockedImportedByBundleIdentifiers
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.baidu.baidumobile"), CFSTR("com.google.chrome.ios"), CFSTR("com.douban.frodo"), CFSTR("com.facebook.facebook"), CFSTR("com.facebook.messenger"), CFSTR("org.mozilla.ios.firefox"), CFSTR("com.google.gmail"), CFSTR("com.burbn.instagram"), CFSTR("com.iwilab.kakaotalk"), CFSTR("jp.naver.line"), CFSTR("com.apple.mobilemail"), CFSTR("com.microsoft.office.outlook"), CFSTR("com.tencent.mqq"), CFSTR("com.reddit.reddit"), CFSTR("com.apple.mobilesafari"), CFSTR("com.toyopagroup.picaboo"), CFSTR("ph.telegra.telegraph"),
                                           CFSTR("com.zhiliaoapp.musically"),
                                           CFSTR("com.atebits.tweetie2"),
                                           CFSTR("com.viber"),
                                           CFSTR("com.vk.vkclient"),
                                           CFSTR("com.vk.vkhd"),
                                           CFSTR("com.tencent.xin"),
                                           CFSTR("com.sina.weibo"),
                                           CFSTR("net.whatsapp.whatsapp"),
                                           0));
}

+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4
{
  objc_class *v6;
  id v7;
  id v8;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (objc_class *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.@count == %d"), CFSTR("detectedFaces"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v26);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v25);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v24);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v23);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("playbackStyle"), &unk_25149A700);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("curationScore"), 0x3FE0000000000000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);
  objc_msgSend((id)objc_opt_class(), "_blockedImportedByBundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == nil OR NOT (%K IN %@)"), CFSTR("additionalAttributes.importedByBundleIdentifier"), CFSTR("additionalAttributes.importedByBundleIdentifier"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);
  v13 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("detectedFaces"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_facePredicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:deviceAspectRatio:", v7, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "expressionForSubquery:usingIteratorVariable:predicate:", v14, CFSTR("face"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD14B8];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", CFSTR("%@.@count"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", &unk_25149A360);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v18, v19, 0, 5, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v20);
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PFDeviceScreenSize();
  v7 = v5;
  v8 = v6;
  if (v5 == 0.0
    || v6 == 0.0
    || (v5 == *MEMORY[0x24BE71BF0] ? (v9 = v6 == *(double *)(MEMORY[0x24BE71BF0] + 8)) : (v9 = 0), v9))
  {
    v10 = 1.0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v13 = 134218496;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    v10 = fabs(v5 / v6);
  }
  objc_msgSend(a1, "predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:deviceAspectRatio:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)knownPersonLocalIdentifiersInPhotoLibrary:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fetchKnownPersonLocalIdentifiersInPhotoLibrary:fetchLimit:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "localIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)posterClassificationForMedia:(id)a3 descriptorType:(int64_t)a4
{
  id v6;
  unint64_t v7;

  v6 = a3;
  v7 = 0;
  if (a4 <= 100)
  {
    if ((unint64_t)(a4 - 1) >= 2)
    {
      if (a4 != 4)
        goto LABEL_11;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if ((unint64_t)(a4 - 101) < 2)
  {
LABEL_6:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(a1, "posterClassificationForSuggestionMedia:", v6);
    else
      v7 = 0;
    goto LABEL_11;
  }
  if (a4 == 103)
LABEL_10:
    v7 = 1;
LABEL_11:

  return v7;
}

+ (unint64_t)posterClassificationForSuggestionMedia:(id)a3
{
  int v3;
  unint64_t result;

  v3 = objc_msgSend(a3, "suggestionSubtype");
  result = 1;
  switch(v3)
  {
    case 602:
      return result;
    case 603:
LABEL_4:
      result = 2;
      break;
    case 604:
LABEL_5:
      result = 3;
      break;
    case 605:
LABEL_6:
      result = 4;
      break;
    default:
      switch(v3)
      {
        case 652:
          return result;
        case 653:
          goto LABEL_4;
        case 654:
          goto LABEL_5;
        case 655:
          goto LABEL_6;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

+ (BOOL)hasAnyKnownPersonLocalIdentifierInPhotoLibrary:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "fetchKnownPersonLocalIdentifiersInPhotoLibrary:fetchLimit:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)fetchKnownPersonLocalIdentifiersInPhotoLibrary:(id)a3 fetchLimit:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDE3858];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  if (a4)
  {
    objc_msgSend(v5, "setFetchLimit:", a4);
    objc_msgSend(v5, "setShouldPrefetchCount:", 1);
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %d OR %K >= %f OR %K >= %d"), CFSTR("verifiedType"), 0, CFSTR("mergeCandidateConfidence"), 0x3FE999999999999ALL, CFSTR("faceCount"), 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v7);

  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)mediaAnalysisTypeForPosterClassification:(unint64_t)a3
{
  return (unint64_t)(a3 == 2) << 17;
}

+ (id)wallpaperCroppingDebugKeyValuePairsForAsset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  PNWallpaperCropResult *v8;
  void *v9;
  PNWallpaperCropResult *v10;
  void *v11;
  PNWallpaperCropResult *v12;
  void *v13;
  PNWallpaperCropResult *v14;
  void *v15;
  PNWallpaperCropResult *v16;
  void *v17;
  PNWallpaperCropResult *v18;
  void *v19;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "wallpaperCroppingDebugKeyValuePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  v8 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 0);
  -[PNWallpaperCropResult dictionaryRepresentation](v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("posterClassificationUnspecified"));

  v10 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 1);
  -[PNWallpaperCropResult dictionaryRepresentation](v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("posterClassificationPerson"));

  v12 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 2);
  -[PNWallpaperCropResult dictionaryRepresentation](v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("posterClassificationPet"));

  v14 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 3);
  -[PNWallpaperCropResult dictionaryRepresentation](v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("posterClassificationNature"));

  v16 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 4);
  -[PNWallpaperCropResult dictionaryRepresentation](v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("posterClassificationCityscape"));

  v18 = -[PNWallpaperCropResult initWithAsset:classification:]([PNWallpaperCropResult alloc], "initWithAsset:classification:", v4, 5);
  -[PNWallpaperCropResult dictionaryRepresentation](v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("posterClassificationOther"));

  return v7;
}

+ (BOOL)assetIsEligibleForSettlingEffect:(id)a3
{
  return objc_msgSend(a3, "isPhotoIris");
}

+ (id)settlingEffectLivePhotoPredicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kindSubtype"), 2);
}

+ (id)fetchSettlingEffectSuggestionsInPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDE3698], "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  objc_msgSend(a1, "fetchSettlingEffectSuggestionsWithOptions:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fetchSettlingEffectSuggestionsWithOptions:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filterSuggestions:includingSingleFeature:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)filterSuggestions:(id)a3 includingSingleFeature:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "_filterSuggestions:withSingleFeature:included:", a3, a4, 1);
}

+ (id)filterSuggestions:(id)a3 excludingSingleFeature:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "_filterSuggestions:withSingleFeature:included:", a3, a4, 0);
}

+ (id)_filterSuggestions:(id)a3 withSingleFeature:(unint64_t)a4 included:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint8x8_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PNSuggestionWallpaperUtilities.m"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("__builtin_popcountll(singleFeature) == 1"));

  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (((((a4 & ~objc_msgSend(v17, "availableFeatures")) == 0) ^ v5) & 1) == 0)
        {
          objc_msgSend(v17, "objectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v19 = objc_alloc(MEMORY[0x24BDE35B0]);
  objc_msgSend(v12, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BDE37E0];
  objc_msgSend(v12, "fetchPropertySets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v20, v21, v22, 0, 0);

  return v23;
}

+ (id)fetchLivePhotoTabAssetsWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  NSObject *v32;
  int v33;
  uint64_t v34;
  uint32_t denom;
  uint32_t numer;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  uint64_t v41;
  unint64_t v42;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  double v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243C3E000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab assets", buf, 2u);
  }
  v6 = v5;
  v7 = os_signpost_id_generate(v6);
  info = 0;
  mach_timebase_info(&info);
  v8 = v6;
  v9 = v8;
  v42 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchLivePhotoTabAssets", ", buf, 2u);
  }
  spid = v7;

  v41 = mach_absolute_time();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = (void *)MEMORY[0x249506444]();
  objc_msgSend(v4, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v49[0] = *MEMORY[0x24BDE3710];
  v14 = v49[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFetchPropertySets:", v15);

  objc_msgSend(a1, "_fetchSettlingEffectSuggestionKeyAssetsWithOptions:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchedObjectIDsSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v17);

  objc_autoreleasePoolPop(v11);
  v18 = (void *)MEMORY[0x249506444]();
  objc_msgSend(v4, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setFetchLimit:", objc_msgSend(v4, "fetchLimit"));
  objc_msgSend(a1, "settlingEffectAssetInternalSortDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInternalSortDescriptors:", v21);

  v48 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFetchPropertySets:", v22);

  objc_msgSend(a1, "fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:excludeExistingWallpapers:", v20, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fetchedObjectIDsSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v24);

  objc_autoreleasePoolPop(v18);
  objc_msgSend(v4, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "librarySpecificFetchOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "settlingEffectAssetInternalSortDescriptors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setInternalSortDescriptors:", v27);

  objc_msgSend(v4, "fetchPropertySets");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFetchPropertySets:", v28);

  objc_msgSend(v26, "setFetchLimit:", objc_msgSend(v4, "fetchLimit"));
  v29 = (void *)MEMORY[0x24BDE3488];
  objc_msgSend(v10, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fetchAssetsWithObjectIDs:options:", v30, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v9;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = objc_msgSend(v31, "count", spid);
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v33;
    _os_log_impl(&dword_243C3E000, v32, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d combined assets", buf, 8u);
  }

  v34 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v37 = v32;
  v38 = v37;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v38, OS_SIGNPOST_INTERVAL_END, spid, "FetchLivePhotoTabAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "FetchLivePhotoTabAssets";
    v46 = 2048;
    v47 = (float)((float)((float)((float)(v34 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v31;
}

+ (id)fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  const __CFString *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint32_t denom;
  uint32_t numer;
  NSObject *v36;
  NSObject *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  int v46;
  uint64_t v47;
  uint32_t v48;
  uint32_t v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t spid;
  os_signpost_id_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *context;
  unint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  mach_timebase_info v65;
  mach_timebase_info info;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v4 = a4;
  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fetchLimit");
  if (v8)
    v9 = *(double *)&v8;
  else
    v9 = NAN;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = &stru_251481610;
    if (v4)
      v10 = CFSTR(", excluding existing wallpapers");
    *(_DWORD *)buf = 138412546;
    v69 = (const char *)v10;
    v70 = 2048;
    v71 = v9;
    _os_log_impl(&dword_243C3E000, v7, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab highlight SettlingEffect assets%@. Limit: %lu", buf, 0x16u);
  }
  v11 = v7;
  v12 = os_signpost_id_generate(v11);
  info = 0;
  mach_timebase_info(&info);
  v13 = v11;
  v14 = v13;
  v59 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchLivePhotoTabHighlightSettlingEffectAssets", ", buf, 2u);
  }
  v54 = v12;

  v56 = mach_absolute_time();
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  context = (void *)MEMORY[0x249506444]();
  objc_msgSend(v6, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "librarySpecificFetchOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_settlingEffectAssetFetchPropertySets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFetchPropertySets:", v18);

  v60 = v6;
  objc_msgSend(v6, "internalSortDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInternalSortDescriptors:", v19);

  v57 = v17;
  objc_msgSend(a1, "fetchLivePhotoTabHighlightCandidateAssetsWithOptions:excludeExistingWallpapers:statistics:", v17, v4, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  v22 = os_signpost_id_generate(v21);
  v65 = 0;
  mach_timebase_info(&v65);
  v23 = v21;
  v24 = v23;
  v25 = v22 - 1;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "CheckFRCResources", ", buf, 2u);
  }
  spid = v22;

  v55 = mach_absolute_time();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v26 = v20;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v62;
LABEL_16:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v30);
      if (objc_msgSend(a1, "_settlingEffectVideoDecisionForAsset:", v31, spid, v54) == 1)
      {
        objc_msgSend(v31, "objectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v32);

      }
      if ((unint64_t)objc_msgSend(v15, "count") >= *(_QWORD *)&v9)
        break;
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (v28)
          goto LABEL_16;
        break;
      }
    }
  }

  v33 = mach_absolute_time();
  numer = v65.numer;
  denom = v65.denom;
  v36 = v24;
  v37 = v36;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v37, OS_SIGNPOST_INTERVAL_END, spid, "CheckFRCResources", ", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "CheckFRCResources";
    v70 = 2048;
    v71 = (float)((float)((float)((float)(v33 - v55) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  objc_autoreleasePoolPop(context);
  v38 = objc_alloc(MEMORY[0x24BDE35B0]);
  objc_msgSend(v60, "photoLibrary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *MEMORY[0x24BDE37D0];
  v41 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v60, "fetchPropertySets");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v38, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v15, v39, v40, v43, 0, 0);

  v45 = v37;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = objc_msgSend(v44, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v69) = v46;
    _os_log_impl(&dword_243C3E000, v45, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d settling effect assets", buf, 8u);
  }

  v47 = mach_absolute_time();
  v49 = info.numer;
  v48 = info.denom;
  v50 = v45;
  v51 = v50;
  if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v51, OS_SIGNPOST_INTERVAL_END, v54, "FetchLivePhotoTabHighlightSettlingEffectAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "FetchLivePhotoTabHighlightSettlingEffectAssets";
    v70 = 2048;
    v71 = (float)((float)((float)((float)(v47 - v56) * (float)v49) / (float)v48) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v51, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v44;
}

+ (id)fetchLivePhotoTabHighlightCandidateAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4 statistics:(id *)a5
{
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
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
  uint64_t v53;
  os_log_t v54;
  uint64_t v55;
  uint32_t denom;
  uint32_t numer;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  int v67;
  NSObject *v68;
  os_signpost_id_t v69;
  NSObject *v70;
  NSObject *v71;
  unint64_t v72;
  int v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint32_t v84;
  uint32_t v85;
  NSObject *v86;
  NSObject *v87;
  int v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  int v97;
  uint64_t v98;
  uint32_t v99;
  uint32_t v100;
  NSObject *v101;
  NSObject *v102;
  os_signpost_id_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  NSObject *v108;
  void *v109;
  void *context;
  unint64_t v111;
  int v113;
  int spid;
  uint64_t v115;
  int v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  os_log_t oslog;
  int osloga;
  _BOOL4 v126;
  void *v127;
  char v128;
  mach_timebase_info v129;
  mach_timebase_info info;
  _BYTE buf[14];
  double v132;
  int v133;
  __int16 v134;
  int v135;
  uint64_t v136;
  void *v137;
  _QWORD v138[4];

  v5 = a4;
  v138[2] = *MEMORY[0x24BDAC8D0];
  v119 = a3;
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v5)
      v7 = CFSTR(", excluding existing wallpapers");
    else
      v7 = &stru_251481610;
    v8 = objc_msgSend(v119, "fetchLimit");
    if (v8)
      v9 = v8;
    else
      v9 = -1;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    v132 = *(double *)&v9;
    _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab highlight candidates%@. Limit: %lu", buf, 0x16u);
  }
  v126 = v5;
  v10 = v6;
  v11 = os_signpost_id_generate(v10);
  info = 0;
  mach_timebase_info(&info);
  v12 = v10;
  v13 = v12;
  v111 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchLivePhotoTabHighlightAssets", ", buf, 2u);
  }
  v104 = v11;
  oslog = v13;

  v106 = mach_absolute_time();
  objc_msgSend(v119, "photoLibrary");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("highlightBeingExtendedAssets.kind"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("highlightBeingExtendedAssets.enrichmentState"), 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("highlightBeingExtendedAssets.visibilityState"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  objc_msgSend(a1, "settlingEffectLivePhotoPredicate");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:");
  v18 = objc_msgSend(MEMORY[0x24BE726F0], "latestVersion");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %lu"), CFSTR("additionalAttributes.sceneAnalysisVersion"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v19);
  v20 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v20, "setYear:", 2020);
  objc_msgSend(v20, "setMonth:", 9);
  objc_msgSend(v20, "setDay:", 16);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateFromComponents:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("dateCreated"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v23);
  v24 = objc_alloc(MEMORY[0x24BE726A8]);
  v25 = (void *)objc_msgSend(v24, "initWithMediaAnalysisVersion:", objc_msgSend(MEMORY[0x24BE726A8], "latestVersion"));
  objc_msgSend(v25, "settlingEffectScoreNode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "operatingPoint");
  v28 = v27;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("mediaAnalysisAttributes.settlingEffectScore"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %f) AND (%K > %f)"), CFSTR("mediaAnalysisAttributes.settlingEffectScore"), 0xBFF0000000000000, CFSTR("mediaAnalysisAttributes.autoplaySuggestionScore"), 0x3FE0000000000000);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDD14C0];
  v138[0] = v29;
  v138[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "orPredicateWithSubpredicates:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = v14;
  objc_msgSend(v14, "addObject:", v33);

  if (v126)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $suggestion, $suggestion.%K = %d).@count == 0"), CFSTR("suggestionsBeingKeyAssets"), CFSTR("type"), 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v34);

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x249506444]();
  v36 = v117;
  objc_msgSend(a1, "_mePersonUUIDInPhotoLibrary:", v117);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0x24BDE3000;
  if (v37)
  {
    v121 = v35;
    v39 = oslog;
    v40 = os_signpost_id_generate(v39);
    v129 = 0;
    mach_timebase_info(&v129);
    v41 = v39;
    v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "FetchMEHighlightAssets", ", buf, 2u);
    }

    v115 = mach_absolute_time();
    objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x24BDE35E0];
    v137 = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v137, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "librarySpecificFetchOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "fetchPersonsWithLocalIdentifiers:options:", v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v117, "librarySpecificFetchOptions");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = *MEMORY[0x24BDE3710];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFetchPropertySets:", v50);

      objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v118);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setInternalPredicate:", v51);

      objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsForPerson:faceCount:options:", v48, 1, v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "fetchedObjectIDsSet");
      v53 = objc_claimAutoreleasedReturnValue();

      v127 = (void *)v53;
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, v42, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] ME Person not found", buf, 2u);
    }
    v54 = oslog;
    v55 = mach_absolute_time();
    numer = v129.numer;
    denom = v129.denom;
    v58 = v42;
    v59 = v58;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v59, OS_SIGNPOST_INTERVAL_END, v40, "FetchMEHighlightAssets", ", buf, 2u);
    }

    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "FetchMEHighlightAssets";
      *(_WORD *)&buf[12] = 2048;
      v132 = (float)((float)((float)((float)(v55 - v115) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_243C3E000, v59, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v36 = v117;
    v38 = 0x24BDE3000uLL;
    v35 = v121;
  }
  else
  {
    v54 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C3E000, oslog, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] ME not found", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v35);
  v122 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  context = (void *)MEMORY[0x249506444]();
  objc_msgSend(v36, "librarySpecificFetchOptions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFetchLimit:", objc_msgSend(v119, "fetchLimit"));
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v118);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setInternalPredicate:", v61);

  objc_msgSend(a1, "_settlingEffectAssetFetchPropertySets");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFetchPropertySets:", v62);

  objc_msgSend(v119, "sortDescriptors");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setSortDescriptors:", v63);

  objc_msgSend(v119, "internalSortDescriptors");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setInternalSortDescriptors:", v64);

  objc_msgSend(v60, "setCacheSizeForFetch:", 500);
  objc_msgSend(v60, "setChunkSizeForFetch:", 500);
  v109 = v60;
  objc_msgSend(*(id *)(v38 + 1160), "fetchAssetsWithOptions:", v60);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v65, "count");
  v66 = v54;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    v67 = objc_msgSend(v65, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v67;
    _os_log_impl(&dword_243C3E000, v66, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d highlight extended live photo candidates", buf, 8u);
  }

  v68 = v66;
  v69 = os_signpost_id_generate(v68);
  v129 = 0;
  mach_timebase_info(&v129);
  v70 = v68;
  v71 = v70;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v69, "FilterAssetFailedFRC", ", buf, 2u);
  }

  v105 = mach_absolute_time();
  v108 = v71;
  if (objc_msgSend(v65, "count"))
  {
    v72 = 0;
    v73 = 0;
    osloga = 0;
    v113 = 0;
    spid = 0;
    v116 = 0;
    v74 = 0;
    do
    {
      v75 = (void *)MEMORY[0x249506444]();
      objc_msgSend(v65, "objectAtIndexedSubscript:", v72);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v127, "containsObject:", v77);

      if (v78)
      {
        ++v74;
      }
      else
      {
        v128 = 0;
        *(_QWORD *)buf = 0;
        objc_msgSend(v76, "mediaAnalysisProperties");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v79, "faceCount"))
          v80 = 1;
        else
          v80 = 5;

        +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:](PNSuggestionWallpaperUtilities, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:", v76, v80, buf, &v128);
        if (v128 && *(double *)buf >= 0.4)
        {
          if (+[PNAssetCurationUtilities assetIsSafeForWidgetDisplay:](PNAssetCurationUtilities, "assetIsSafeForWidgetDisplay:", v76, *(double *)buf))
          {
            v81 = objc_msgSend(a1, "_settlingEffectVideoDecisionForAsset:", v76);
            if (v81 == 2)
            {
              ++v116;
            }
            else
            {
              if (v81 == 1)
              {
                ++spid;
              }
              else if (!v81)
              {
                ++v113;
              }
              objc_msgSend(v76, "objectID");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "addObject:", v82);

            }
          }
          else
          {
            ++osloga;
          }
        }
        else
        {
          ++v73;
        }
      }

      objc_autoreleasePoolPop(v75);
      ++v72;
    }
    while (v72 < objc_msgSend(v65, "count"));
  }
  else
  {
    v74 = 0;
    v116 = 0;
    v113 = 0;
    spid = 0;
    osloga = 0;
    v73 = 0;
  }
  v83 = mach_absolute_time();
  v85 = v129.numer;
  v84 = v129.denom;
  v86 = v108;
  v87 = v86;
  if (v69 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v86))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v87, OS_SIGNPOST_INTERVAL_END, v69, "FilterAssetFailedFRC", ", buf, 2u);
  }

  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "FilterAssetFailedFRC";
    *(_WORD *)&buf[12] = 2048;
    v132 = (float)((float)((float)((float)(v83 - v105) * (float)v85) / (float)v84) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  objc_autoreleasePoolPop(context);
  v88 = objc_msgSend(v122, "count");
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&buf[4] = v73;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = osloga;
    LOWORD(v132) = 1024;
    *(_DWORD *)((char *)&v132 + 2) = v116;
    HIWORD(v132) = 1024;
    v133 = v74;
    v134 = 1024;
    v135 = v88;
    _os_log_impl(&dword_243C3E000, v87, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Filtered out %d candidates for cropping, %d candidates for NSFW, %d candidates for known FRC failure, %d candidates of device owner, %d candidates left", buf, 0x20u);
  }
  v89 = objc_alloc(MEMORY[0x24BDE35B0]);
  objc_msgSend(v119, "photoLibrary");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = *MEMORY[0x24BDE37D0];
  v92 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v119, "fetchPropertySets");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setWithArray:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)objc_msgSend(v89, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v122, v90, v91, v94, 0, 0);

  v96 = v87;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    v97 = objc_msgSend(v95, "count");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v97;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = spid;
    LOWORD(v132) = 1024;
    *(_DWORD *)((char *)&v132 + 2) = v113;
    _os_log_impl(&dword_243C3E000, v96, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d (passed: %d, unanalyzed: %d) highlight live photo candidates not failing FRC and other checks", buf, 0x14u);
  }

  if (a5)
  {
    a5->var0 = v107;
    a5->var1 = v88;
    a5->var2 = v73;
    a5->var3 = osloga;
    a5->var4 = v116;
    a5->var5 = v74;
  }
  v98 = mach_absolute_time();
  v100 = info.numer;
  v99 = info.denom;
  v101 = v96;
  v102 = v101;
  if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v102, OS_SIGNPOST_INTERVAL_END, v104, "FetchLivePhotoTabHighlightAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "FetchLivePhotoTabHighlightAssets";
    *(_WORD *)&buf[12] = 2048;
    v132 = (float)((float)((float)((float)(v98 - v106) * (float)v100) / (float)v99) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v102, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v95;
}

+ (id)_fetchSettlingEffectSuggestionKeyAssetsWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint32_t denom;
  uint32_t numer;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchSettlingEffectSuggestionKeyAssets", ", buf, 2u);
  }

  v9 = mach_absolute_time();
  objc_msgSend(v4, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchSettlingEffectSuggestionsInPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE3488], "fetchKeyAssetForEachSuggestion:options:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v16 = v8;
  v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v17, OS_SIGNPOST_INTERVAL_END, v6, "FetchSettlingEffectSuggestionKeyAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "FetchSettlingEffectSuggestionKeyAssets";
    v24 = 2048;
    v25 = (float)((float)((float)((float)(v13 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v18 = v17;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v19;
    _os_log_impl(&dword_243C3E000, v18, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d settling effect suggestion assets", buf, 8u);
  }

  return v12;
}

+ (id)_settlingEffectAssetFetchPropertySets
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE3750];
  v5[0] = *MEMORY[0x24BDE3720];
  v5[1] = v2;
  v3 = *MEMORY[0x24BDE3730];
  v5[2] = *MEMORY[0x24BDE3700];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)settlingEffectAssetInternalSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.activityScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.wallpaperScore"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.settlingEffectScore"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.autoplaySuggestionScore"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("favorite"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_assetPassesFRCInstantPlayback:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(a1, "_settlingEffectVideoDecisionForAsset:", v4) == 1)
    v5 = objc_msgSend(a1, "_cacheExistsForAsset:", v4);
  else
    v5 = 0;

  return v5;
}

+ (unint64_t)_settlingEffectVideoDecisionForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "photoAnalysisWallpaperProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperPropertiesData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("segmentationScores"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE724C0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "BOOLValue"))
          v11 = 1;
        else
          v11 = 2;

        goto LABEL_12;
      }
    }

  }
  PLWallpaperGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_243C3E000, v12, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] missing settlingEffectVideoDecision for asset %@", (uint8_t *)&v15, 0xCu);

  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)_cacheExistsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE36B8]), "initWithPhotoAsset:", v3);
  objc_msgSend(v4, "segmentationResourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] missing segmentationResourceURL for asset %@", (uint8_t *)&v9, 0xCu);

    }
  }

  return v5 != 0;
}

+ (BOOL)setAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4
{
  return objc_msgSend(a1, "_updateAvailableFeatures:forSuggestions:toClear:", a3, a4, 0);
}

+ (BOOL)clearAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4
{
  return objc_msgSend(a1, "_updateAvailableFeatures:forSuggestions:toClear:", a3, a4, 1);
}

+ (BOOL)_updateAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4 toClear:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  int v18;
  char v19;
  __CFString *v20;
  os_log_t v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  int v25;
  os_log_t oslog;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  unint64_t v32;
  BOOL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    PLWallpaperGetLog();
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v34 = 0u;
    v35 = 0u;
    if (v5)
      v10 = 0;
    else
      v10 = a3;
    v36 = 0uLL;
    v37 = 0uLL;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_msgSend(v16, "availableFeatures") & a3) != v10)
            objc_msgSend(v9, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count"))
    {
      v17 = objc_msgSend(v11, "count");
      v18 = objc_msgSend(v9, "count");
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __82__PNSuggestionWallpaperUtilities__updateAvailableFeatures_forSuggestions_toClear___block_invoke;
      v30[3] = &unk_25147FF38;
      v33 = v5;
      v31 = v11;
      v32 = a3;
      v29 = 0;
      v19 = objc_msgSend(v28, "performChangesAndWait:error:", v30, &v29);
      v20 = (__CFString *)v29;
      v21 = oslog;
      if ((v19 & 1) != 0)
      {
        v22 = oslog;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = v17 - v18;
          if (v5)
            v24 = CFSTR("Cleared");
          else
            v24 = CFSTR("Set");
          v25 = objc_msgSend(v9, "count");
          *(_DWORD *)buf = 138413058;
          v39 = v24;
          v21 = oslog;
          v40 = 1024;
          v41 = a3;
          v42 = 1024;
          v43 = v25;
          v44 = 1024;
          v45 = v23;
          _os_log_impl(&dword_243C3E000, v22, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] %@ availableFeatures (%d) to %d suggestions, %d unchanged", buf, 0x1Eu);
        }

      }
      else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v20;
        _os_log_error_impl(&dword_243C3E000, oslog, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error updating availableFeatures: %@", buf, 0xCu);
      }

    }
    else
    {
      v19 = 1;
      v21 = oslog;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (BOOL)wallpaperDemoModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNWallpaperDemoModeEnabled"));

  return v3;
}

void __82__PNSuggestionWallpaperUtilities__updateAvailableFeatures_forSuggestions_toClear___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDE36A0], "changeRequestForSuggestion:", v7, (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(unsigned __int8 *)(a1 + 48);
        v10 = objc_msgSend(v7, "availableFeatures");
        v11 = *(_QWORD *)(a1 + 40);
        v12 = v11 | v10;
        v13 = v10 & ~v11;
        if (v9)
          v14 = v13;
        else
          v14 = v12;
        objc_msgSend(v8, "setAvailableFeatures:", v14);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

void __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x24BDE36A0], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "markDeclined");
        objc_msgSend(v6, "setFeaturedState:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_ERROR, "Could not decline wallpaper suggestion: %@", buf, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        PLWallpaperGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_243C3E000, v13, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] reject wallpaper suggestion: %@", buf, 0xCu);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

void __88__PNSuggestionWallpaperUtilities_wallpaperPeopleLocalIdentifiersInPhotoLibrary_vipOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("personLocalIdentifiers"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v9);
  }
  else
  {
    PLWallpaperGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_243C3E000, v10, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error getting wallpaper people local identifier: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __74__PNSuggestionWallpaperUtilities__assetSortComparatorForPortraitWallpaper__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isFavorite") && !objc_msgSend(v5, "isFavorite"))
    goto LABEL_6;
  if (objc_msgSend(v5, "isFavorite") && !objc_msgSend(v4, "isFavorite"))
    goto LABEL_8;
  objc_msgSend(v4, "mediaAnalysisProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperScore");
  v8 = v7;
  v9 = v7;

  objc_msgSend(v5, "mediaAnalysisProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wallpaperScore");
  v12 = v11;
  v13 = v11;

  objc_msgSend(v4, "overallAestheticScore");
  v15 = v14;
  v16 = v14;
  objc_msgSend(v5, "overallAestheticScore");
  v18 = v13 + v17;
  if (v9 + v16 > v18)
  {
LABEL_6:
    v19 = -1;
    goto LABEL_9;
  }
  if (v18 > v9 + v16)
    goto LABEL_8;
  if (v8 > v12)
    goto LABEL_6;
  if (v12 > v8)
    goto LABEL_8;
  if (v15 > v17)
    goto LABEL_6;
  if (v17 > v15)
  {
LABEL_8:
    v19 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v5, "creationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v21, "compare:", v22);

  if (!v19)
  {
    objc_msgSend(v4, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v23, "compare:", v24);

  }
LABEL_9:

  return v19;
}

void __59__PNSuggestionWallpaperUtilities__fetchMeContactIdentifier__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v16[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (v8)
    {
      objc_msgSend(v8, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No me contact found: %@", buf, 0xCu);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error gaining access to Contacts: %@", buf, 0xCu);
  }

}

uint64_t __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "type") == 1 && objc_msgSend(v6, "type") != 1)
    goto LABEL_6;
  if (objc_msgSend(v6, "type") == 1 && objc_msgSend(v5, "type") != 1)
    goto LABEL_8;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (v10 <= v14)
  {
    if (v14 <= v10)
    {
      objc_msgSend(v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v18 && !v20)
        goto LABEL_6;
      if (!v20 || v18)
      {
        objc_msgSend(v5, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v21, "compare:", v22);

        goto LABEL_9;
      }
    }
LABEL_8:
    v15 = 1;
    goto LABEL_9;
  }
LABEL_6:
  v15 = -1;
LABEL_9:

  return v15;
}

double __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = fabs(v7);

  return v8;
}

uint64_t __78__PNSuggestionWallpaperUtilities_coldStartDeviceOwnerWallpaperInPhotoLibrary___block_invoke()
{
  return 1;
}

uint64_t __75__PNSuggestionWallpaperUtilities_coldStartPortraitWallpaperInPhotoLibrary___block_invoke()
{
  return 1;
}

@end
