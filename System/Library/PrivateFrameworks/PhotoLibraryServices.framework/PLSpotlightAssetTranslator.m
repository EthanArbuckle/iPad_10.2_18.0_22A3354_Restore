@implementation PLSpotlightAssetTranslator

+ (id)spotlightSearchableItemFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 documentObservation:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PLSearchIndexingLazyFetchHelper *v23;
  void *v24;
  PLSearchIndexingLazyFetchHelper *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  void *v36;
  os_signpost_id_t spid;
  id v38;
  unint64_t v39;
  id v41;
  id v42;
  uint8_t v43[16];
  uint8_t buf[16];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v42 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphData"));

    if (v14)
      goto LABEL_4;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexingContext"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  if (!v13)
    goto LABEL_17;
LABEL_3:
  if (!v14)
    goto LABEL_18;
LABEL_4:
  PLSearchIndexGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  v39 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLSpotlightAssetTranslator: Asset translation time", ", buf, 2u);
  }
  spid = v16;

  +[PLSpotlightDonationUtilities spotlightUniqueIdentifierForAsset:](PLSpotlightDonationUtilities, "spotlightUniqueIdentifierForAsset:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "libraryServicesManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v21, "wellKnownPhotoLibraryIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [PLSearchIndexingLazyFetchHelper alloc];
  objc_msgSend(v12, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PLSearchIndexingLazyFetchHelper initWithObject:libraryIdentifier:managedObjectContext:](v23, "initWithObject:libraryIdentifier:managedObjectContext:", v12, a4, v24);

  objc_msgSend(a1, "_spotlightSearchableAttributesForAsset:fetchHelper:libraryIdentifier:graphData:indexingContext:documentObservation:propertySets:embeddingsFetcher:", v12, v25, a4, v13, v14, v42, 3, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v38 = v14;
    v41 = v13;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v19, v22, v26);
    objc_msgSend(v12, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "libraryServicesManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "wellKnownPhotoLibraryIdentifier");

    if (v30 == 3)
      objc_msgSend(v27, "setIsUpdate:", 1);
    v31 = v18;
    v32 = v31;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)v43 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PLSpotlightAssetTranslator: Asset translation time", ", v43, 2u);
    }

    v13 = v41;
    v14 = v38;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)partialSpotlightSearchableItemFromAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 propertySets:(unint64_t)a6 graphData:(id)a7 indexingContext:(id)a8 documentObservation:(id)a9 embeddingsFetcher:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  unint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  id v50;

  v16 = a3;
  v50 = a4;
  v17 = a7;
  v49 = a8;
  v18 = a9;
  v19 = a10;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphData"));

LABEL_3:
  v48 = v17;
  v20 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexingContext"));

  }
  if (a6)
    v21 = a6;
  else
    v21 = 3;
  +[PLSpotlightDonationUtilities spotlightUniqueIdentifierForAsset:](PLSpotlightDonationUtilities, "spotlightUniqueIdentifierForAsset:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoLibrary");
  v23 = a1;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "libraryServicesManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", objc_msgSend(v25, "wellKnownPhotoLibraryIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v23;
  v28 = v48;
  objc_msgSend(v27, "_spotlightSearchableAttributesForAsset:fetchHelper:libraryIdentifier:graphData:indexingContext:documentObservation:propertySets:embeddingsFetcher:", v16, v50, a5, v48, v49, v18, v21, v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v22, v26, v29);
    objc_msgSend(v16, "photoLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "libraryServicesManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v26;
    v33 = v16;
    v34 = v21;
    v35 = v22;
    v36 = v19;
    v37 = v18;
    v38 = objc_msgSend(v31, "wellKnownPhotoLibraryIdentifier");

    v20 = v49;
    v40 = v38 == 3;
    v18 = v37;
    v19 = v36;
    v22 = v35;
    v39 = v47;
    v28 = v48;
    v40 = !v40 && v34 == 3;
    v16 = v33;
    v26 = v32;
    v41 = !v40;
    objc_msgSend(v47, "setIsUpdate:", v41);
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

+ (id)_spotlightSearchableAttributesForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8 propertySets:(unint64_t)a9 embeddingsFetcher:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  PLSearchIndexingEmbeddingsFetcher *v20;
  id v21;
  void *v22;
  void *v23;
  PLSearchIndexingEmbeddingsFetcher *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  id v57;
  void *v58;
  void *v59;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id v120;
  void *v121;
  void *v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  PLSearchIndexingEmbeddingsFetcher *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
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
  PLSearchIndexingEmbeddingsFetcher *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v190;
  id v191;
  id v192;
  id v193;
  void *v194;
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
  uint8_t buf[4];
  void *v207;
  __int16 v208;
  void *v209;
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v193 = a7;
  v19 = a8;
  v20 = (PLSearchIndexingEmbeddingsFetcher *)a10;
  v194 = v16;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graphData"));

LABEL_3:
  v192 = v19;
  if (!v193)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexingContext"));

  }
  v191 = a1;
  v21 = v17;
  objc_msgSend(v16, "dateCreated");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToDate:", v23) & 1) != 0)
  {
    objc_msgSend(v16, "importedByBundleIdentifier");
    v24 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

    v20 = v24;
    if (v26)
    {
      PLSearchBackendModelTranslationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "additionalAttributes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "syndicationIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v207 = v28;
        v208 = 2114;
        v209 = v30;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Not creating CSSI attributeSet (dateCreated = distantPast) Messages asset %{public}@ %{public}@", buf, 0x16u);

        v20 = v24;
      }
      v31 = 0;
      v32 = v21;
      v33 = v192;
      goto LABEL_52;
    }
  }
  else
  {

  }
  v34 = objc_alloc_init(MEMORY[0x1E0CA6B50]);
  v35 = v34;
  if ((a9 & 1) != 0)
  {
    v183 = v20;
    objc_msgSend(v34, "setPhotosResultType:", CFSTR("com.apple.photos.search.result.collection.asset"));
    objc_msgSend(v16, "formattedCameraModel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosAcquisitionModel:", v36);

    objc_msgSend(v16, "moment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosContainerIdentifier:", v38);

    objc_msgSend(v16, "uniformTypeIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosContentType:", v39);

    objc_msgSend(v16, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosTitle:", v40);

    objc_msgSend(v16, "longDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosContentDescription:", v41);

    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "curationScore");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosCurationScore:", v43);

    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "overallAestheticScore");
    objc_msgSend(v44, "numberWithFloat:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosAestheticScore:", v45);

    objc_msgSend(v193, "synonymsByIndexCategoryMask");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", &unk_1E375E838);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "_personsForAsset:fetchHelper:personSynonyms:", v16, v21, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosPeople:", v48);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isFavorite"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosFavorited:", v49);

    PLServicesLocalizedFrameworkString();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosFavorites:", v50);

    objc_msgSend(v191, "_mediaTypesForAsset:", v16);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosMediaTypes:", v51);

    objc_msgSend(v16, "dateCreated");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "calendar");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities seasonsForDate:calendar:](PLSpotlightTranslatorUtilities, "seasonsForDate:calendar:", v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosSeasons:", v54);

    v55 = v21;
    objc_msgSend(v191, "_contentRatingForAsset:fetchHelper:", v16, v21);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosContentRating:", v56);

    v57 = v18;
    objc_msgSend(v191, "_locationNamesForAsset:graphData:", v16, v18);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosLocationKeywords:", v58);

    objc_msgSend(v191, "_utilityTypesForAsset:indexingContext:", v16, v193);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosUtilityTypes:", v59);

    objc_msgSend(v16, "dateCreated");
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosContentCreationDate:", v60);
    objc_msgSend(v193, "searchIndexDateFormatter");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localizedMonthStringsFromDate:", v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "count"))
    {
      objc_msgSend(v62, "firstObject");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosContentCreationDateMonth:", v63);

    }
    v180 = v62;
    v181 = v61;
    v182 = (void *)v60;
    v64 = (void *)objc_msgSend(v61, "newLocalizedComponentsFromDate:includeMonth:", v60, 0);
    if (objc_msgSend(v64, "count") == 1)
    {
      objc_msgSend(v64, "firstObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosContentCreationDateYear:", v65);

    }
    v179 = v64;
    v66 = (void *)objc_opt_new();
    objc_msgSend(v193, "sceneTaxonomyProvider");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "_scenesForAsset:fetchHelper:sceneTaxonomyProvider:", v16, v21, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v68);

    v69 = v66;
    objc_msgSend(v191, "_audioClassificationsForAsset:", v16);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v70);

    objc_msgSend(v191, "_humanActionScenesForAsset:fetchHelper:", v16, v21);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObjectsFromArray:", v71);

    v186 = v66;
    if (_os_feature_enabled_impl())
    {
      buf[0] = 0;
      objc_msgSend(v193, "csuTaxonomyObjectStore");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "locale");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "_privateEncryptedComputeScenesForAsset:fetchHelper:csuTaxonomyObjectStore:locale:isSensitiveLocation:", v16, v21, v72, v73, buf);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addObjectsFromArray:", v74);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", buf[0]);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "photosSensitiveLocationKey");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setValue:forCustomKey:", v75, v76);

      v69 = v66;
    }
    objc_msgSend(v35, "setPhotosSceneClassifications:", v69);
    objc_msgSend(v35, "setPhotosDonationState:", &unk_1E375E850);
    v77 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "additionalAttributes");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "numberWithShort:", objc_msgSend(v78, "sceneAnalysisVersion"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosSceneAnalysisVersion:", v79);

    v80 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "mediaAnalysisAttributes");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "characterRecognitionAttributes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "numberWithShort:", objc_msgSend(v82, "algorithmVersion"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosCharacterRecognitionAnalysisVersion:", v83);

    v84 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "additionalAttributes");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "numberWithShort:", objc_msgSend(v85, "faceAnalysisVersion"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosFaceAnalysisVersion:", v86);

    v87 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "mediaAnalysisAttributes");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "numberWithUnsignedLongLong:", objc_msgSend(v88, "mediaAnalysisVersion"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosMediaAnalysisVersion:", v89);

    v90 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "mediaAnalysisAttributes");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "numberWithShort:", objc_msgSend(v91, "mediaAnalysisImageVersion"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosMediaAnalysisImageVersion:", v92);

    v93 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "mediaAnalysisAttributes");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "numberWithShort:", objc_msgSend(v94, "vaAnalysisVersion"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosPrivateEncryptedComputeAnalysisVersion:", v95);

    v96 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "mediaAnalysisAttributes");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "numberWithShort:", objc_msgSend(v97, "vaLocationAnalysisVersion"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosLocationPrivateEncryptedComputeAnalysisVersion:", v98);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "reverseLocationDataIsValid"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "photosReverseLocationDataIsValidKey");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setValue:forCustomKey:", v99, v100);

    if (objc_msgSend(v16, "kind") == 1)
    {
      v101 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v16, "duration");
      objc_msgSend(v101, "numberWithDouble:");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosDuration:", v102);

    }
    if (_shouldIndexAssetUUIDForDebugging_onceToken != -1)
      dispatch_once(&_shouldIndexAssetUUIDForDebugging_onceToken, &__block_literal_global_36454);
    if (_shouldIndexAssetUUIDForDebugging_shouldIndexAssetUUIDForDebugging)
    {
      objc_msgSend(v16, "uuid");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosDisplayName:", v103);

    }
    if (objc_msgSend(v193, "isSharedLibraryEnabled"))
    {
      objc_msgSend(v191, "_libraryScopeForAsset:", v16);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosLibraryName:", v104);

      objc_msgSend(v191, "_sharedLibraryContributorsForAsset:", v16);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosSharedLibraryContributors:", v105);

    }
    v184 = v57;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosDonationTimestamp:", v106);

    objc_msgSend(v16, "importedByBundleIdentifier");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "importedByDisplayName");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (PLShouldConstructDisplayNameForAppBundle(v107, (uint64_t)v185))
    {
      PLSyndicatedDisplayNameForAppBundle(v107, v185);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosSavedFromAppName:", v108);
      objc_msgSend(v35, "setPhotosSavedFromAppBundleIdentifier:", v107);

    }
    v178 = v107;
    objc_msgSend(v16, "additionalAttributes");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "timeZoneName");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosTimeZoneName:", v110);

    v177 = v109;
    objc_msgSend(v109, "timeZoneOffset");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosTimeZoneOffset:", v111);

    +[PLKeywordManager keywordsForAsset:](PLKeywordManager, "keywordsForAsset:", v16);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "allObjects");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosKeywords:", v113);

    v205 = 0;
    objc_msgSend(v191, "_albumsUUIDsForAsset:fetchHelper:libraryIdentifier:assetCounts:", v16, v21, a5, &v205);
    v114 = objc_claimAutoreleasedReturnValue();
    v115 = v205;
    objc_msgSend(v193, "photosAlbumUUIDsKey");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = (void *)v114;
    v117 = v114;
    v32 = v55;
    objc_msgSend(v35, "setValue:forCustomKey:", v117, v116);

    objc_msgSend(v193, "photosAlbumAssetCountsKey");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v115;
    objc_msgSend(v35, "setValue:forCustomKey:", v115, v118);

    v204 = 0;
    objc_msgSend(v191, "_memoryUUIDsForAsset:fetchHelper:libraryIdentifier:assetCounts:", v16, v55, a5, &v204);
    v119 = objc_claimAutoreleasedReturnValue();
    v120 = v204;
    objc_msgSend(v193, "photosMemoryUUIDsKey");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = (void *)v119;
    objc_msgSend(v35, "setValue:forCustomKey:", v119, v121);

    objc_msgSend(v193, "photosMemoryAssetCountsKey");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v120;
    objc_msgSend(v35, "setValue:forCustomKey:", v120, v122);

    v203 = 0;
    objc_msgSend(v191, "_highlightUUIDsForAsset:libraryIdentifier:assetCounts:", v16, a5, &v203);
    v123 = objc_claimAutoreleasedReturnValue();
    v124 = v203;
    objc_msgSend(v193, "photosHighlightUUIDsKey");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = (void *)v123;
    objc_msgSend(v35, "setValue:forCustomKey:", v123, v125);

    objc_msgSend(v193, "photosHighlightAssetCountsKey");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = v124;
    objc_msgSend(v35, "setValue:forCustomKey:", v124, v126);

    if (_os_feature_enabled_impl())
    {
      PLSearchBackendModelTranslationGetLog();
      v127 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "uuid");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v207 = v128;
        _os_log_impl(&dword_199541000, v127, OS_LOG_TYPE_DEBUG, "PLSpotlightAssetTranslator using Graph data from photo library storage for asset: %@", buf, 0xCu);

      }
      objc_msgSend(v16, "moment");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = v55;
      if (v171)
      {
        v201 = 0;
        v202 = 0;
        v199 = 0;
        v200 = 0;
        v197 = 0;
        v198 = 0;
        v196 = 0;
        v195 = 0;
        objc_msgSend(v191, "_getGraphAttributesForMomentFromFetchHelper:businessNames:businessCategories:eventNames:eventCategories:eventPerformers:meanings:holidays:locationKeywords:", v55, &v202, &v201, &v200, &v199, &v198, &v197, &v196, &v195);
        v129 = v202;
        v130 = v201;
        v131 = v200;
        v132 = v199;
        v133 = v198;
        v134 = v197;
        v135 = v196;
        v136 = v195;
      }
      else
      {
        PLSearchBackendModelTranslationGetLog();
        v149 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v16, "uuid");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v207 = v150;
          _os_log_impl(&dword_199541000, v149, OS_LOG_TYPE_INFO, "No Moment set for asset: %@. No Knowledge Graph data for this asset.", buf, 0xCu);

        }
        v129 = 0;
        v130 = 0;
        v131 = 0;
        v132 = 0;
        v133 = 0;
        v134 = 0;
        v135 = 0;
        v136 = 0;
      }
      objc_msgSend(v35, "setPhotosBusinessNames:", v129);
      v170 = v130;
      objc_msgSend(v35, "setPhotosBusinessCategories:", v130);
      objc_msgSend(v35, "setPhotosEventNames:", v131);
      objc_msgSend(v35, "setPhotosEventCategories:", v132);
      objc_msgSend(v35, "setPhotosEventPerformers:", v133);
      objc_msgSend(v35, "setPhotosMeanings:", v134);
      objc_msgSend(v35, "setPhotosHolidays:", v135);
      v151 = v129;
      v152 = v136;
      objc_msgSend(v191, "_locationNamesForAsset:graphLocations:", v16, v136);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosLocationKeywords:", v153);

      v148 = v151;
      v32 = v187;
      v18 = v184;
    }
    else
    {
      v18 = v184;
      if (!v184)
      {
        PLSearchBackendModelTranslationGetLog();
        v137 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "uuid");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v207 = v138;
          _os_log_impl(&dword_199541000, v137, OS_LOG_TYPE_DEBUG, "No Graph Data for asset: %@", buf, 0xCu);

        }
        v18 = (id)MEMORY[0x1E0C9AA70];
      }
      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v18, 0x100000);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosBusinessNames:", v139);

      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v18, 0x200000);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosBusinessCategories:", v140);

      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v18, 0x1000000);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosEventNames:", v141);

      objc_msgSend(v193, "synonymsByIndexCategoryMask");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:", v18, 0x4000000, 0x200000000, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosEventCategories:", v143);

      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v18, 0x2000000);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosEventPerformers:", v144);

      objc_msgSend(v193, "synonymsByIndexCategoryMask");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:", v18, 0x4000, 0x20000000, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosMeanings:", v146);

      +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v18, 0x8000);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosHolidays:", v147);

      objc_msgSend(v191, "_locationNamesForAsset:graphData:", v16, v18);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPhotosLocationKeywords:", v148);
    }

    objc_msgSend(v16, "uuid");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:](PLSpotlightTranslatorUtilities, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:typeDisplayName:displayTitle:displaySubtitle:", v35, v154, CFSTR("AssetEntity"), v155, &stru_1E36789C0, 0);

    v33 = v192;
    v20 = v183;
  }
  else
  {
    v32 = v21;
    v33 = v192;
  }
  if ((a9 & 2) != 0)
  {
    +[PLSearchOCRUtilities spotlightTextLinesFromDocumentObservation:](PLSearchOCRUtilities, "spotlightTextLinesFromDocumentObservation:", v33);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotosTextContentPieces:", v156);

  }
  v157 = v20;
  if (!v20)
    v157 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
  -[PLSearchIndexingEmbeddingsFetcher embeddingForAsset:indexingContext:allowFetchIfMissing:](v157, "embeddingForAsset:indexingContext:allowFetchIfMissing:", v16, v193, v20 == 0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isSuccess](v27, "isSuccess"))
  {
    -[NSObject result](v27, "result");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPhotoEmbedding:", v158);

    v159 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject result](v27, "result");
    v188 = v32;
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "vectors");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "numberWithUnsignedInteger:", objc_msgSend(v161, "count"));
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "photosEmbeddingCountKey");
    v163 = v18;
    v164 = v33;
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v35;
    objc_msgSend(v35, "setValue:forCustomKey:", v162, v165);

    v33 = v164;
    v18 = v163;

    v32 = v188;
  }
  else
  {
    v31 = v35;
  }
  v20 = v157;
LABEL_52:

  return v31;
}

+ (void)_getGraphAttributesForMomentFromFetchHelper:(id)a3 businessNames:(id *)a4 businessCategories:(id *)a5 eventNames:(id *)a6 eventCategories:(id *)a7 eventPerformers:(id *)a8 meanings:(id *)a9 holidays:(id *)a10 locationKeywords:(id *)a11
{
  id v18;
  id *v19;
  id *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  void *v47;
  id *v48;
  id *v49;
  id *v50;
  id *v51;
  id *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;

  v18 = a3;
  if (v18)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchHelper"));

    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outBusinessCategories"));

      if (a6)
        goto LABEL_5;
      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outBusinessNames"));

  if (!a5)
    goto LABEL_18;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outEventNames"));

LABEL_5:
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outEventCategories"));

  }
  v19 = a10;
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outEventPerformers"));

    v19 = a10;
  }
  v20 = a11;
  if (!a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outMeanings"));

    v20 = a11;
    v19 = a10;
  }
  v50 = a5;
  if (!v19)
  {
    v45 = v20;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outHolidays"));

    v20 = v45;
  }
  v48 = a4;
  v49 = a6;
  v51 = a7;
  v52 = a8;
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outLocationKeywords"));

  }
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v29 = (void *)objc_opt_new();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __185__PLSpotlightAssetTranslator__getGraphAttributesForMomentFromFetchHelper_businessNames_businessCategories_eventNames_eventCategories_eventPerformers_meanings_holidays_locationKeywords___block_invoke;
  v53[3] = &unk_1E3668FA8;
  v54 = v22;
  v55 = v23;
  v56 = v24;
  v57 = v25;
  v58 = v26;
  v59 = v27;
  v60 = v28;
  v61 = v29;
  v30 = v29;
  v31 = v28;
  v32 = v27;
  v33 = v26;
  v34 = v25;
  v35 = v24;
  v36 = v23;
  v37 = v22;
  objc_msgSend(v18, "enumerateMomentSearchEntitiesWithBlock:", v53);
  *v48 = (id)objc_msgSend(v37, "copy");
  *v50 = (id)objc_msgSend(v36, "copy");
  *v49 = (id)objc_msgSend(v35, "copy");
  *v51 = (id)objc_msgSend(v34, "copy");
  *v52 = (id)objc_msgSend(v33, "copy");
  *a9 = (id)objc_msgSend(v32, "copy");
  *a10 = (id)objc_msgSend(v31, "copy");
  *v21 = (id)objc_msgSend(v30, "copy");

}

+ (id)_audioClassificationsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "additionalAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "temporalSceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightTranslatorUtilities spotlightAudioClassificationsFromScenes:](PLSpotlightTranslatorUtilities, "spotlightAudioClassificationsFromScenes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v7);
  return v4;
}

+ (id)_humanActionScenesForAsset:(id)a3 fetchHelper:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allDetectedFaces", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "detectionTraits");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLSpotlightTranslatorUtilities spotlightScenesFromDetectionTraits:](PLSpotlightTranslatorUtilities, "spotlightScenesFromDetectionTraits:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObjectsFromArray:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_contentRatingForAsset:(id)a3 fetchHelper:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allSceneClassifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSpotlightTranslatorUtilities contentRatingFromScenes:algorithmVersion:](PLSpotlightTranslatorUtilities, "contentRatingFromScenes:algorithmVersion:", v9, objc_msgSend(v6, "sceneAnalysisVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_personsForAsset:(id)a3 fetchHelper:(id)a4 personSynonyms:(id)a5
{
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v43 = a5;
  v42 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v11 = 0x1E0C99000uLL;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = v10;
  objc_msgSend(v10, "allDetectedFaces");
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    v45 = *(_QWORD *)v56;
    do
    {
      v15 = 0;
      v47 = v13;
      do
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v15);
        objc_msgSend(v16, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "personUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "shouldIndexForSearch") & 1) != 0)
        {
          objc_msgSend(v17, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");

          objc_msgSend(v17, "fullName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if (v20)
          {
            objc_msgSend(v17, "displayName");
            v24 = objc_claimAutoreleasedReturnValue();
            if ((v23 & 1) == 0)
            {
              objc_msgSend(v17, "fullName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
              v26 = objc_msgSend(v17, "detectionType") - 1;
              if (v26 < 4)
                v27 = v26 + 1;
              else
                v27 = 0;
              v28 = (void *)objc_opt_new();
              if (objc_msgSend(v25, "length"))
                objc_msgSend(v28, "addObject:", v25);
              v49 = v27;
              v50 = v25;
              if ((unint64_t)(v27 - 2) <= 2)
              {
                PLServicesLocalizedFrameworkString();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v29);

                PLServicesLocalizedFrameworkString();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v30);

              }
              v31 = v11;
              v32 = (void *)objc_opt_new();
              v33 = objc_msgSend(v16, "ageType");
              v34 = MEMORY[0x1E0C809B0];
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke;
              v53[3] = &unk_1E3669E30;
              v35 = v32;
              v54 = v35;
              PLSearchSearchStringsForPersonAgeType(v33, v53);
              if (_os_feature_enabled_impl())
              {
                v51[0] = v34;
                v51[1] = 3221225472;
                v51[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_2;
                v51[3] = &unk_1E3668FD0;
                v52 = v28;
                objc_msgSend(v44, "enumerateSearchEntityRelationsForPerson:block:", v17, v51);
                v36 = v52;
              }
              else
              {
                objc_msgSend(v43, "objectForKeyedSubscript:", v18);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "count"))
                  objc_msgSend(v28, "addObjectsFromArray:", v36);
              }
              v11 = v31;

              v37 = objc_alloc(MEMORY[0x1E0CA6B10]);
              v38 = (void *)objc_msgSend(v37, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:", v24, MEMORY[0x1E0C9AA60], 0, v18, 1, v49, v28, v35);
              objc_msgSend(v17, "personUri");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setContactIdentifier:", v39);

              objc_msgSend(v46, "addObject:", v38);
              v13 = v47;
              v14 = v45;
              goto LABEL_28;
            }
          }
          else
          {
            objc_msgSend(v17, "fullName");
            v24 = objc_claimAutoreleasedReturnValue();
          }
          v25 = 0;
          goto LABEL_16;
        }
        PLSearchBackendModelTranslationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v18;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "Person not valid for indexing: %@", buf, 0xCu);
        }
LABEL_28:

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v13);
  }

  return v46;
}

+ (id)_mediaTypesForAsset:(id)a3
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "RAWBadgeAttribute") - 1 <= 2)
  {
    PLServicesLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  v8 = objc_msgSend(v5, "kind");
  if (v8 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);
  }
  else
  {
    if (v8)
      goto LABEL_10;
    PLServicesLocalizedFrameworkString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    PLSearchLocalizedSynonymsForKey(CFSTR("SEARCH_MEDIA_TYPE_PHOTOS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
LABEL_10:
  v12 = objc_msgSend(v5, "kindSubtype");
  v13 = v12;
  if (v12 > 100)
  {
    if (v12 == 103 || v12 == 102 || v12 == 101)
      goto LABEL_18;
  }
  else if (v12 == 1 || v12 == 2 || v12 == 10)
  {
LABEL_18:
    PLServicesLocalizedFrameworkString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  if (objc_msgSend(v5, "playbackVariation") == 3)
  {
    PLServicesLocalizedFrameworkString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

  }
  v16 = objc_msgSend(v5, "playbackStyle");
  if (v16 == 5 || v16 == 2)
  {
    PLServicesLocalizedFrameworkString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v17);

  }
  if ((objc_msgSend(v5, "avalanchePickType") & 0x10) != 0)
  {
    PLServicesLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
  v19 = objc_msgSend(v5, "depthType");
  if (v19 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v21);

    if (v13 != 2)
      goto LABEL_32;
    PLServicesLivePortraitLocalizedFrameworkString();
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unsigned __int16)v19 != 2)
      goto LABEL_32;
    PLServicesLocalizedFrameworkString();
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v20;
  objc_msgSend(v6, "addObject:", v20);

LABEL_32:
  if (objc_msgSend(v5, "isMagicCarpet"))
  {
    PLServicesLocalizedFrameworkString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

  }
  if (objc_msgSend(v5, "spatialType"))
  {
    PLServicesLocalizedFrameworkString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v24);

  }
  objc_msgSend(v5, "additionalAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "cameraCaptureDevice");

  if (v26 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27);
    PLServicesLocalizedFrameworkString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "length") && (objc_msgSend(v28, "isEqualToString:", CFSTR("NULL")) & 1) == 0)
    {
      v29 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("|"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v40 != v35)
              objc_enumerationMutation(v32);
            objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v34);
      }

    }
  }

  return v6;
}

+ (id)_scenesForAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 730, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneTaxonomyProvider"));

LABEL_3:
  objc_msgSend(v9, "additionalAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sceneAnalysisVersion");

  objc_msgSend(v12, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "allSceneClassifications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLSpotlightTranslatorUtilities spotlightScenesFromScenes:sceneTaxonomy:](PLSpotlightTranslatorUtilities, "spotlightScenesFromScenes:sceneTaxonomy:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((_DWORD)v14)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v26 = v14;
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Could not open taxonomy for scene analysis version: %i, unable to index scenes for asset: %@", buf, 0x12u);

      }
    }
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (id)_privateEncryptedComputeScenesForAsset:(id)a3 fetchHelper:(id)a4 csuTaxonomyObjectStore:(id)a5 locale:(id)a6 isSensitiveLocation:(BOOL *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  signed int v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  __int16 v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  const char *v37;
  uint32_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL *v54;
  id v55;
  id v56;
  void *v57;
  NSObject *v58;
  int64_t v59;
  uint64_t v60;
  id obj;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v53 = v13;
  if (v13)
  {
    if (a7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (a7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSensitiveLocation"));

LABEL_3:
  v57 = v16;
  *a7 = 0;
  v52 = v14;
  objc_msgSend(v14, "allSceneClassifications");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (id)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v62 = *(_QWORD *)v69;
    v54 = a7;
    v55 = v15;
    while (1)
    {
      v21 = 0;
      v60 = v19;
      do
      {
        if (*(_QWORD *)v69 != v62)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v21);
        v23 = objc_msgSend(v22, "classificationType");
        v24 = v23;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(&unk_1E37639E0, "containsObject:", v25);

        if (v23 == 4 || v26 != 0)
        {
          v28 = objc_msgSend(v22, "sceneIdentifier");
          v29 = +[PLSpotlightTranslatorUtilities CSSceneTypeForPLSceneClassificationType:](PLSpotlightTranslatorUtilities, "CSSceneTypeForPLSceneClassificationType:", v23);
          if (v29)
          {
            v30 = v29;
            if (v23 > 7)
              v31 = 1;
            else
              v31 = word_199B9FE40[v23];
            v67 = v20;
            objc_msgSend(v15, "entityForIdentifier:idType:error:", v28, v31, &v67);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = v67;

            if (!v32 || v33)
            {
              PLSearchBackendSceneTaxonomyGetLog();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v74 = v28;
                v35 = v34;
                v36 = OS_LOG_TYPE_ERROR;
                v37 = "Victoria: CSU entity not found in MAD database. Ignoring any PrivateEncryptedCompute scenes for sc"
                      "ene identifier: %llu";
                v38 = 12;
LABEL_26:
                _os_log_impl(&dword_199541000, v35, v36, v37, buf, v38);
              }
LABEL_27:
              v19 = v60;
            }
            else
            {
              *a7 |= -[NSObject sensitiveLocation](v32, "sensitiveLocation");
              if (-[NSObject sensitiveLocation](v32, "sensitiveLocation"))
              {
                PLSearchBackendSceneTaxonomyGetLog();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218240;
                  v74 = v24;
                  v75 = 2048;
                  v76 = v28;
                  v35 = v34;
                  v36 = OS_LOG_TYPE_DEBUG;
                  v37 = "Victoria: CSU entity not eligible for search. Skipping Scene (%lu, %llu)";
                  v38 = 22;
                  goto LABEL_26;
                }
                goto LABEL_27;
              }
              v59 = v30;
              -[NSObject localizedLabelWithLocale:](v32, "localizedLabelWithLocale:", v57);
              v34 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject length](v34, "length"))
              {
                v39 = objc_opt_new();
                v58 = v32;
                -[NSObject localizedSynonymsWithLocale:](v32, "localizedSynonymsWithLocale:", v57);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = 0u;
                v64 = 0u;
                v65 = 0u;
                v66 = 0u;
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v64;
                  do
                  {
                    for (i = 0; i != v42; ++i)
                    {
                      if (*(_QWORD *)v64 != v43)
                        objc_enumerationMutation(v40);
                      v45 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                      if (v45 && objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "length"))
                      {
                        if ((objc_msgSend(v45, "isEqualToString:", v34) & 1) != 0)
                        {
                          PLSearchBackendSceneTaxonomyGetLog();
                          v46 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412546;
                            v74 = (uint64_t)v34;
                            v75 = 2048;
                            v76 = v28;
                            _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "Victoria: Duplicate PrivateEncryptedCompute label: '%@' found in synonyms for Scene ID: %llu", buf, 0x16u);
                          }

                        }
                        else
                        {
                          -[NSObject addObject:](v39, "addObject:", v45);
                        }
                      }
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
                  }
                  while (v42);
                }
                v47 = objc_alloc(MEMORY[0x1E0CA6B20]);
                objc_msgSend(v22, "confidence");
                v48 = (void *)objc_msgSend(v47, "initWithLabel:synonyms:confidence:sceneIdentifier:", v34, v39, v28);
                objc_msgSend(v48, "setSceneType:", v59);
                objc_msgSend(v56, "addObject:", v48);

                a7 = v54;
                v15 = v55;
                v19 = v60;
                v32 = v58;
              }
              else
              {
                PLSearchBackendSceneTaxonomyGetLog();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  v74 = v28;
                  _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Victoria: Failed to get localized text from CSU for PEC sceneIdentifier: %llu", buf, 0xCu);
                }
                v19 = v60;
              }
              v33 = 0;

            }
          }
          else
          {
            PLSearchBackendSceneTaxonomyGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              v74 = v28;
              _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Victoria: Unsupported scene classification type for scene identifier: %llu", buf, 0xCu);
            }
            v33 = v20;
            v19 = v60;
          }

          v20 = v33;
        }
        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (!v19)
        goto LABEL_54;
    }
  }
  v20 = 0;
LABEL_54:

  return v56;
}

+ (id)_utilityTypesForAsset:(id)a3 indexingContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 820, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 821, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexingContext"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PLSpotlightAssetTranslator__utilityTypesForAsset_indexingContext___block_invoke;
  v15[3] = &unk_1E3669D88;
  v11 = v10;
  v16 = v11;
  PLSearchEnumerateSearchStringsForUtilityCollections(v7, v9, v15);

  return v11;
}

+ (id)_locationNamesForAsset:(id)a3 graphLocations:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 835, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(a1, "_revGeoLocationNamesForAsset:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseLocationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "reverseLocationDataIsValid");
  v12 = v11;
  if (v10 && v11)
  {
    objc_msgSend(v9, "addObjectsFromArray:", v8);
  }
  else if (objc_msgSend(v8, "count"))
  {
    PLSearchBackendModelTranslationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      if (v12)
        v14 = CFSTR("valid");
      else
        v14 = CFSTR("invalid");
      if (v10)
        v15 = CFSTR("present");
      else
        v15 = CFSTR("nil");
      objc_msgSend(v7, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v14;
      v33 = 2114;
      v34 = v15;
      v35 = 2114;
      v36 = v16;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Location data is %{public}@ / %{public}@ for asset %{public}@. Not indexing Graph locations: %@", buf, 0x2Au);

    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = (void *)objc_msgSend(v9, "copy");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        PLSearchStringByTrimmingApostrophes(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  objc_msgSend(v9, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_locationNamesForAsset:(id)a3 graphData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 859, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(a1, "_revGeoLocationNamesForAsset:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E375E8B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_HOME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E375E8C8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v9, "addObject:", v13);
  objc_msgSend(v9, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_revGeoLocationNamesForAsset:(id)a3
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 878, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if ((objc_msgSend(v5, "reverseLocationDataIsValid") & 1) != 0)
  {
    objc_msgSend(v5, "locationInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHome");

    if (v8)
    {
      PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_HOME"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
    objc_msgSend(v5, "locationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeAnnotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeWithAnnotation:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v27 = v5;
      v13 = &qword_199B9B978;
      do
      {
        v14 = *v13;
        -[NSObject placeInfosForOrderType](v12, "placeInfosForOrderType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v29 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "placeName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v20);
        }

        --v13;
      }
      while (v13 >= _revGeoLocationNamesForAsset__revGeoDominantOrderTypes);
      v5 = v27;
    }
  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v24;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Invalid RevGeo location data for asset: %{public}@. Not indexing locations.", buf, 0xCu);

    }
  }

  return v6;
}

+ (id)_libraryScopeForAsset:(id)a3
{
  objc_msgSend(a3, "hasLibraryScope");
  PLServicesSharedLibraryLocalizedFrameworkString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_sharedLibraryContributorsForAsset:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  id v23;
  uint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v3;
  objc_msgSend(v3, "libraryScopeContributors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(a1, "_nameForContributor:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "emailAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "phoneNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        if (objc_msgSend(v5, "isCurrentUser"))
        {
          PLServicesSharedLibraryLocalizedFrameworkString();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);
          PLServicesSharedLibraryLocalizedFrameworkString();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v11);

        }
        PLServicesSharedLibraryLocalizedFrameworkString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
        {
          PFStringWithValidatedFormat();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13, v6);

        }
        if (objc_msgSend(v7, "length"))
        {
          PFStringWithValidatedFormat();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14, v7);

        }
        if (objc_msgSend(v8, "length"))
        {
          PFStringWithValidatedFormat();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15, v8);

        }
        objc_msgSend(v9, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v9, "removeObject:", v16);
          v17 = objc_alloc(MEMORY[0x1E0CA6B10]);
          objc_msgSend(v5, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:", v16, 0, 0, v18, 1, 1, v9, 0);

          objc_msgSend(v23, "addObject:", v19);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v26);
  }

  return v23;
}

+ (id)_nameForContributor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "No name for contributor: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)_albumsUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v26 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1010, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1011, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outAssetCounts"));

  }
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v11, "albumsEligibleForSearchIndexing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "cachedCount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  v22 = objc_retainAutorelease(v13);
  *a6 = v22;

  return v12;
}

+ (id)_memoryUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v28 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1028, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outAssetCounts"));

  }
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v11, "memoriesEligibleForSearchIndexing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v19, "curatedAssets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v23);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  v24 = objc_retainAutorelease(v13);
  *a6 = v24;

  return v12;
}

+ (id)_highlightUUIDsForAsset:(id)a3 libraryIdentifier:(int64_t)a4 assetCounts:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;

  v9 = a3;
  if (v9)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1044, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1045, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outAssetCounts"));

LABEL_3:
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v9, "dayGroupHighlightBeingAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLPhotosHighlight, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "evaluateWithObject:", v12);

  if (v14)
  {
    objc_msgSend(v12, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "dayGroupAssetsCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

  }
  v17 = objc_retainAutorelease(v11);
  *a5 = v17;

  return v10;
}

+ (id)jsonRepresentationKeys
{
  _QWORD v3[59];

  v3[58] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("photosAcquisitionModel");
  v3[1] = CFSTR("photosContainerIdentifier");
  v3[2] = CFSTR("photosContentType");
  v3[3] = CFSTR("photosContentCreationDate");
  v3[4] = CFSTR("photosContentCreationDateMonth");
  v3[5] = CFSTR("photosContentCreationDateYear");
  v3[6] = CFSTR("photosTitle");
  v3[7] = CFSTR("photosContentDescription");
  v3[8] = CFSTR("photosCurationScore");
  v3[9] = CFSTR("photosAestheticScore");
  v3[10] = CFSTR("photosFavorited");
  v3[11] = CFSTR("photosMediaTypes");
  v3[12] = CFSTR("photosContentRating");
  v3[13] = CFSTR("photosSceneAnalysisVersion");
  v3[14] = CFSTR("photosFaceAnalysisVersion");
  v3[15] = CFSTR("photosMediaAnalysisVersion");
  v3[16] = CFSTR("photosMediaAnalysisImageVersion");
  v3[17] = CFSTR("photosPrivateEncryptedComputeAnalysisVersion");
  v3[18] = CFSTR("photosLocationPrivateEncryptedComputeAnalysisVersion");
  v3[19] = CFSTR("photosCharacterRecognitionAnalysisVersion");
  v3[20] = CFSTR("photosTimeZoneName");
  v3[21] = CFSTR("photosTimeZoneOffset");
  v3[22] = CFSTR("photosLocationKeywords");
  v3[23] = CFSTR("photosSeasons");
  v3[24] = CFSTR("photosBusinessNames");
  v3[25] = CFSTR("photosBusinessCategories");
  v3[26] = CFSTR("photosEventNames");
  v3[27] = CFSTR("photosEventCategories");
  v3[28] = CFSTR("photosEventPerformers");
  v3[29] = CFSTR("photosMeanings");
  v3[30] = CFSTR("photosHolidays");
  v3[31] = CFSTR("photosResultType");
  v3[32] = CFSTR("photosDuration");
  v3[33] = CFSTR("photosLibraryName");
  v3[34] = CFSTR("photosSharedLibraryContributors");
  v3[35] = CFSTR("photosDonationTimestamp");
  v3[36] = CFSTR("photosSavedFromAppName");
  v3[37] = CFSTR("photosSavedFromAppBundleIdentifier");
  v3[38] = CFSTR("photosFilename");
  v3[39] = CFSTR("photosTextContentPieces");
  v3[40] = CFSTR("photosPeople");
  v3[41] = CFSTR("photosSceneClassifications");
  v3[42] = CFSTR("photosUtilityTypes");
  v3[43] = CFSTR("photosKeywords");
  v3[44] = CFSTR("photosAlbumUUIDs");
  v3[45] = CFSTR("photosAlbumAssetCounts");
  v3[46] = CFSTR("photosMemoryUUIDs");
  v3[47] = CFSTR("photosMemoryAssetCounts");
  v3[48] = CFSTR("photosHighlightUUIDs");
  v3[49] = CFSTR("photosHighlightAssetCounts");
  v3[50] = CFSTR("photosSensitiveLocation");
  v3[51] = CFSTR("photosReverseLocationDataIsValid");
  v3[52] = CFSTR("photosEmbeddingCount");
  v3[53] = CFSTR("photoEmbedding");
  v3[54] = CFSTR("uuid");
  v3[55] = CFSTR("hidden");
  v3[56] = CFSTR("trashedState");
  v3[57] = CFSTR("hasPhotoEmbedding");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 58);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_jsonRepresentationFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 includeEmbeddingData:(BOOL)a7
{
  id v11;
  id v12;
  PLSearchIndexingLazyFetchHelper *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  PLSearchIndexingEmbeddingsFetcher *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  int64_t v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  id v140;
  uint64_t v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  uint8_t buf[4];
  void *v157;
  uint64_t v158;

  v130 = a7;
  v158 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v133 = a5;
  v12 = a6;
  v13 = [PLSearchIndexingLazyFetchHelper alloc];
  objc_msgSend(v11, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = a4;
  v15 = -[PLSearchIndexingLazyFetchHelper initWithObject:libraryIdentifier:managedObjectContext:](v13, "initWithObject:libraryIdentifier:managedObjectContext:", v11, a4, v14);

  objc_msgSend(v11, "additionalAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaAnalysisAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("uuid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "hidden"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v11, "trashedState"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("trashedState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "reverseLocationDataIsValid"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("photosReverseLocationDataIsValid"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("com.apple.photos.search.result.collection.asset"), CFSTR("photosResultType"));
  objc_msgSend(v11, "formattedCameraModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("photosAcquisitionModel"));

  objc_msgSend(v11, "moment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uuid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("photosContainerIdentifier"));

  objc_msgSend(v11, "uniformTypeIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("photosContentType"));

  objc_msgSend(v11, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, CFSTR("photosTitle"));

  objc_msgSend(v11, "longDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("photosContentDescription"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "curationScore");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("photosCurationScore"));

  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "overallAestheticScore");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, CFSTR("photosAestheticScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "isFavorite"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v33, CFSTR("photosFavorited"));

  objc_msgSend(a1, "_mediaTypesForAsset:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, CFSTR("photosMediaTypes"));

  objc_msgSend(a1, "_contentRatingForAsset:fetchHelper:", v11, v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v35, CFSTR("photosContentRating"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v16, "sceneAnalysisVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v36, CFSTR("photosSceneAnalysisVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v16, "faceAnalysisVersion"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v37, CFSTR("photosFaceAnalysisVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "mediaAnalysisVersion"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, CFSTR("photosMediaAnalysisVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v17, "mediaAnalysisImageVersion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v39, CFSTR("photosMediaAnalysisImageVersion"));

  v40 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v17, "characterRecognitionAttributes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "numberWithShort:", objc_msgSend(v41, "algorithmVersion"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v42, CFSTR("photosCharacterRecognitionAnalysisVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v17, "vaAnalysisVersion"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v43, CFSTR("photosPrivateEncryptedComputeAnalysisVersion"));

  v131 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v17, "vaLocationAnalysisVersion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v44, CFSTR("photosLocationPrivateEncryptedComputeAnalysisVersion"));

  objc_msgSend(v16, "timeZoneName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v45, CFSTR("photosTimeZoneName"));

  v132 = v16;
  objc_msgSend(v16, "timeZoneOffset");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v46, CFSTR("photosTimeZoneOffset"));

  objc_msgSend(v11, "dateCreated");
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "stringFromDate:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v48, CFSTR("photosContentCreationDate"));

  objc_msgSend(v12, "searchIndexDateFormatter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedMonthStringsFromDate:", v47);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v50, CFSTR("photosContentCreationDateMonth"));

  v127 = v49;
  v128 = (void *)v47;
  v125 = (void *)objc_msgSend(v49, "newLocalizedComponentsFromDate:includeMonth:", v47, 0);
  objc_msgSend(v125, "firstObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v51, CFSTR("photosContentCreationDateYear"));

  v144 = v12;
  v139 = (void *)v15;
  v124 = a1;
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendModelTranslationGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "uuid");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v157 = v53;
      _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEBUG, "PLSpotlightAssetTranslator using Graph data from photo library storage for asset: %@", buf, 0xCu);

    }
    objc_msgSend(v11, "moment");
    v54 = v12;
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      v154 = 0;
      v155 = 0;
      v152 = 0;
      v153 = 0;
      v150 = 0;
      v151 = 0;
      v148 = 0;
      v149 = 0;
      v55 = a1;
      objc_msgSend(a1, "_getGraphAttributesForMomentFromFetchHelper:businessNames:businessCategories:eventNames:eventCategories:eventPerformers:meanings:holidays:locationKeywords:", v139, &v155, &v154, &v153, &v152, &v151, &v150, &v149, &v148);
      v138 = v155;
      v137 = v154;
      v136 = v153;
      v140 = v152;
      v56 = v151;
      v134 = v150;
      v57 = v149;
      v58 = v148;
    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "uuid");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v157 = v70;
        _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_INFO, "No Moment set for asset: %@. No Knowledge Graph data for this asset.", buf, 0xCu);

      }
      v58 = 0;
      v57 = 0;
      v134 = 0;
      v136 = 0;
      v56 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v55 = a1;
    }
    objc_msgSend(v11, "dateCreated");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "calendar");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities seasonsForDate:calendar:](PLSpotlightTranslatorUtilities, "seasonsForDate:calendar:", v71, v72);
    v65 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "_locationNamesForAsset:graphLocations:", v11, v58);
    v73 = objc_claimAutoreleasedReturnValue();

    v68 = v73;
    v66 = v55;
    v67 = v140;
    v61 = (uint64_t)v134;
    v62 = (uint64_t)v57;
  }
  else
  {
    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v133, 0x100000);
    v138 = (id)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v133, 0x200000);
    v137 = (id)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v133, 0x1000000);
    v136 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "synonymsByIndexCategoryMask");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:", v133, 0x4000000, 0x200000000, v59);
    v141 = objc_claimAutoreleasedReturnValue();

    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v133, 0x2000000);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "synonymsByIndexCategoryMask");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:synonymSearchIndexCategoryMask:synonyms:", v133, 0x4000, 0x20000000, v60);
    v61 = objc_claimAutoreleasedReturnValue();

    +[PLSpotlightTranslatorUtilities textFromGraphData:searchIndexCategoryMask:](PLSpotlightTranslatorUtilities, "textFromGraphData:searchIndexCategoryMask:", v133, 0x8000);
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateCreated");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendar");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightTranslatorUtilities seasonsForDate:calendar:](PLSpotlightTranslatorUtilities, "seasonsForDate:calendar:", v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();

    v66 = v124;
    v67 = (id)v141;
    objc_msgSend(v124, "_locationNamesForAsset:graphData:", v11, v133);
    v68 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v138, CFSTR("photosBusinessNames"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v137, CFSTR("photosBusinessCategories"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v136, CFSTR("photosEventNames"));
  v142 = v67;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v67, CFSTR("photosEventCategories"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v56, CFSTR("photosEventPerformers"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v61, CFSTR("photosMeanings"));
  v121 = (void *)v62;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v62, CFSTR("photosHolidays"));
  v120 = (void *)v65;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v65, CFSTR("photosSeasons"));
  v119 = (void *)v68;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v68, CFSTR("photosLocationKeywords"));
  if (objc_msgSend(v11, "kind") == 1)
  {
    v74 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "duration");
    objc_msgSend(v74, "numberWithDouble:");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v75, CFSTR("photosDuration"));

  }
  if (objc_msgSend(v144, "isSharedLibraryEnabled"))
  {
    objc_msgSend(v66, "_libraryScopeForAsset:", v11);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v76, CFSTR("photosLibraryName"));

    objc_msgSend(v66, "_sharedLibraryContributorsForAsset:", v11);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "_jsonRepresentationForCSPersons:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v78, CFSTR("photosSharedLibraryContributors"));

  }
  v135 = (void *)v61;
  v123 = v56;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "stringFromDate:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v80, CFSTR("photosDonationTimestamp"));

  objc_msgSend(v11, "importedByBundleIdentifier");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "importedByDisplayName");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (PLShouldConstructDisplayNameForAppBundle(v81, (uint64_t)v82))
  {
    PLSyndicatedDisplayNameForAppBundle(v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v83, CFSTR("photosSavedFromAppName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v81, CFSTR("photosSavedFromAppBundleIdentifier"));

  }
  v117 = v82;
  v118 = v81;
  objc_msgSend(v11, "documentObservation");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchOCRUtilities jsonOCRTextLinesFromDocumentObservation:](PLSearchOCRUtilities, "jsonOCRTextLinesFromDocumentObservation:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v85, CFSTR("photosTextContentPieces"));

  objc_msgSend(v144, "synonymsByIndexCategoryMask");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "objectForKeyedSubscript:", &unk_1E375E838);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_personsForAsset:fetchHelper:personSynonyms:", v11, v139, v87);
  v88 = objc_claimAutoreleasedReturnValue();

  v116 = (void *)v88;
  objc_msgSend(v66, "_jsonRepresentationForCSPersons:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v89;
  if (objc_msgSend(v89, "count"))
    v90 = v89;
  else
    v90 = 0;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v90, CFSTR("photosPeople"));
  buf[0] = 0;
  objc_msgSend(v66, "_jsonRepresentationForScenesFromAsset:fetchHelper:indexingContext:isSensitiveLocation:", v11, v139, v144, buf);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "count"))
    v92 = v91;
  else
    v92 = 0;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v92, CFSTR("photosSceneClassifications"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", buf[0]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v93, CFSTR("photosSensitiveLocation"));

  objc_msgSend(v66, "_utilityTypesForAsset:indexingContext:", v11, v144);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v94, CFSTR("photosUtilityTypes"));

  +[PLKeywordManager keywordsForAsset:](PLKeywordManager, "keywordsForAsset:", v11);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "allObjects");
  v96 = v66;
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v97, CFSTR("photosKeywords"));

  v147 = 0;
  objc_msgSend(v96, "_albumsUUIDsForAsset:fetchHelper:libraryIdentifier:assetCounts:", v11, v139, v129, &v147);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v147;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v98, CFSTR("photosAlbumUUIDs"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v99, CFSTR("photosAlbumAssetCounts"));
  v146 = 0;
  objc_msgSend(v96, "_memoryUUIDsForAsset:fetchHelper:libraryIdentifier:assetCounts:", v11, v139, v129, &v146);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v146;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v100, CFSTR("photosMemoryUUIDs"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v101, CFSTR("photosMemoryAssetCounts"));
  v145 = 0;
  objc_msgSend(v96, "_highlightUUIDsForAsset:libraryIdentifier:assetCounts:", v11, v129, &v145);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v145;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v102, CFSTR("photosHighlightUUIDs"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v103, CFSTR("photosHighlightAssetCounts"));
  v104 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
  -[PLSearchIndexingEmbeddingsFetcher embeddingForAsset:indexingContext:allowFetchIfMissing:](v104, "embeddingForAsset:indexingContext:allowFetchIfMissing:", v11, v144, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v105, "isSuccess"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v106, CFSTR("hasPhotoEmbedding"));

  if (v130)
  {
    objc_msgSend(v105, "result");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchJSONForCSEmbedding(v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v108, CFSTR("photoEmbedding"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v109, CFSTR("photoEmbedding"));

    }
  }
  v110 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v105, "result");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "vectors");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "numberWithUnsignedInteger:", objc_msgSend(v112, "count"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v113, CFSTR("photosEmbeddingCount"));

  return v18;
}

+ (id)_jsonRepresentationForCSPersons:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("displayName"));

        objc_msgSend(v9, "photosPersonIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("photosPersonIdentifier"));

        objc_msgSend(v9, "contactIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("contactIdentifier"));

        objc_msgSend(v9, "nameAlternatives");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("nameAlternatives"));

        objc_msgSend(v9, "faceAttributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("faceAttributes"));

        objc_msgSend(v9, "personType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("personType"));

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_jsonRepresentationForScenesFromAsset:(id)a3 fetchHelper:(id)a4 indexingContext:(id)a5 isSensitiveLocation:(BOOL *)a6
{
  id v11;
  id v12;
  id v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  BOOL v53;
  _BYTE v54[128];
  uint64_t v55;
  NSRect v56;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexingContext"));

    if (a6)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  if (!v14)
    goto LABEL_17;
LABEL_3:
  if (a6)
    goto LABEL_4;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightAssetTranslator.m"), 1326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSensitiveLocation"));

LABEL_4:
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v14, "sceneTaxonomyProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_scenesForAsset:fetchHelper:sceneTaxonomyProvider:", v11, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v18);

  objc_msgSend(a1, "_audioClassificationsForAsset:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v19);

  objc_msgSend(a1, "_humanActionScenesForAsset:fetchHelper:", v11, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v20);

  if (_os_feature_enabled_impl())
  {
    v53 = 0;
    objc_msgSend(v14, "csuTaxonomyObjectStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_privateEncryptedComputeScenesForAsset:fetchHelper:csuTaxonomyObjectStore:locale:isSensitiveLocation:", v11, v12, v21, v22, &v53);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v23);

    *a6 = v53;
  }
  v45 = v14;
  v46 = v12;
  v47 = v11;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v16;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v50;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v27);
        v29 = (void *)objc_opt_new();
        objc_msgSend(v28, "label");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("label"));

        objc_msgSend(v28, "synonyms");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("synonyms"));

        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "confidence");
        objc_msgSend(v32, "numberWithDouble:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("confidence"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v28, "sceneIdentifier"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, CFSTR("sceneIdentifier"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v28, "sceneType"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("sceneType"));

        v36 = objc_msgSend(v28, "sceneType");
        v37 = CFSTR("unknown");
        if (v36 <= 8)
          v37 = off_1E366CEE0[v36];
        v38 = v37;
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v38, CFSTR("sceneType_humanReadable"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v28, "mediaType"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v39, CFSTR("mediaType"));

        objc_msgSend(v28, "boundingBox");
        NSStringFromRect(v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v40, CFSTR("boundingBox"));

        objc_msgSend(v15, "addObject:", v29);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v25);
  }

  return v15;
}

uint64_t __68__PLSpotlightAssetTranslator__utilityTypesForAsset_indexingContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v8);
}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_3;
  v3[3] = &unk_1E3669E30;
  v4 = *(id *)(a1 + 32);
  PLSearchStringsForPersonRelation(a2, v3);

}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
}

void __185__PLSpotlightAssetTranslator__getGraphAttributesForMomentFromFetchHelper_businessNames_businessCategories_eventNames_eventCategories_eventPerformers_meanings_holidays_locationKeywords___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v22;

  v22 = a2;
  v3 = objc_msgSend(v22, "type");
  if (v3 > 1699)
  {
    if (v3 <= 1799)
    {
      if (v3 == 1700)
      {
        v19 = (void *)a1[4];
        objc_msgSend(v22, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

        v6 = (void *)a1[4];
        goto LABEL_21;
      }
      if (v3 == 1701)
      {
        v11 = (void *)a1[5];
        objc_msgSend(v22, "label");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        v6 = (void *)a1[5];
        goto LABEL_21;
      }
    }
    else
    {
      switch(v3)
      {
        case 1800:
          v15 = (void *)a1[6];
          objc_msgSend(v22, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

          v6 = (void *)a1[6];
          goto LABEL_21;
        case 1801:
          v17 = (void *)a1[8];
          objc_msgSend(v22, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

          v6 = (void *)a1[8];
          goto LABEL_21;
        case 1802:
          v7 = (void *)a1[7];
          objc_msgSend(v22, "label");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v8);

          v6 = (void *)a1[7];
          goto LABEL_21;
      }
    }
  }
  else if (v3 > 1599)
  {
    if (v3 == 1600 || v3 == 1610)
    {
      v9 = (void *)a1[9];
      objc_msgSend(v22, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      v6 = (void *)a1[9];
      goto LABEL_21;
    }
  }
  else
  {
    if ((unint64_t)(v3 - 1000) < 2)
    {
      v4 = (void *)a1[11];
      objc_msgSend(v22, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      v6 = (void *)a1[11];
LABEL_21:
      objc_msgSend(v22, "synonyms");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v21);

      goto LABEL_22;
    }
    if (v3 == 1102)
    {
      v13 = (void *)a1[10];
      objc_msgSend(v22, "label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      v6 = (void *)a1[10];
      goto LABEL_21;
    }
  }
LABEL_22:

}

@end
