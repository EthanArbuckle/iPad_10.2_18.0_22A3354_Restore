@implementation PXHighlightDiagnosticsHelper

+ (id)preprocessDictionaryForHighlight:(id)a3 inPhotoLibrary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
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
  id v21;
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
  uint64_t v38;
  void *v39;
  const __CFString *v40;
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
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v7, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v6, "highlightDebugInformationForHighlightWithLocalIdentifier:error:", v9, &v66);
  v10 = objc_claimAutoreleasedReturnValue();

  v60 = v8;
  v63 = (void *)v10;
  objc_msgSend(v8, "addEntriesFromDictionary:", v10);
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v7, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighlightCurationType:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v11);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighlightCurationType:", 2);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlight.uuid == %@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalPredicate:", v16);

  objc_msgSend(v15, "setShouldPrefetchCount:", 1);
  v62 = v15;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v15);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("UUID"));
  objc_msgSend(v7, "localizedTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("Title"));

  objc_msgSend(v7, "localizedSubtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("Subtitle"));

  v21 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTimeZone:", v22);

  objc_msgSend(v21, "setDateStyle:", 1);
  objc_msgSend(v21, "setTimeStyle:", 2);
  objc_msgSend(v7, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("Start Date (UTC)"));

  objc_msgSend(v7, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("End Date (UTC)"));

  objc_msgSend(v7, "localStartDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("Start Date (Local)"));

  objc_msgSend(v7, "localEndDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("End Date (Local)"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+0.1f hours"), (double)objc_msgSend(v7, "startTimeZoneOffset") / 3600.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v31, CFSTR("Start TZ Offset"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+0.1f hours"), (double)objc_msgSend(v7, "endTimeZoneOffset") / 3600.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("End TZ Offset"));

  objc_msgSend(v7, "type");
  PHShortDescriptionForPhotosHighlightType();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v33, CFSTR("Type"));

  objc_msgSend(v7, "kind");
  PHShortDescriptionForPhotosHighlightKind();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, CFSTR("Kind"));

  objc_msgSend(v7, "category");
  PHShortDescriptionForPhotosHighlightCategory();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v35, CFSTR("Category"));

  objc_msgSend(v7, "sharingComposition");
  PHDescriptionForSharingComposition();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("Sharing Composition"));

  v37 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "promotionScore");
  objc_msgSend(v37, "stringWithFormat:", CFSTR("%.3f"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v39, CFSTR("Promotion Score"));

  if (objc_msgSend(v7, "isEnriched"))
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v40, CFSTR("Is Enriched"));
  objc_msgSend(v7, "enrichmentState");
  PHShortDescriptionForPhotosHighlightEnrichmentState();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v41, CFSTR("Enrichment State"));

  objc_msgSend(v7, "visibilityState");
  PHShortDescriptionForPhotosHighlightVisibilityState();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v42, CFSTR("Visibility State Private"));

  objc_msgSend(v7, "visibilityStateShared");
  PHShortDescriptionForPhotosHighlightVisibilityState();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, CFSTR("Visibility State Shared"));

  objc_msgSend(v7, "visibilityStateMixed");
  PHShortDescriptionForPhotosHighlightVisibilityState();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, CFSTR("Visibility State Mixed"));

  objc_msgSend(v7, "mood");
  PHStringForMemoryMood();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v45, CFSTR("Mood"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v46, CFSTR("Number of Assets"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v47, CFSTR("Number of Extended Curated Assets"));

  objc_msgSend(v61, "firstObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "uuid");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v49, CFSTR("Key Asset UUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v7, "highlightVersion"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v50, CFSTR("Highlight Version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v7, "enrichmentVersion"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v51, CFSTR("Enrichment Version"));

  v52 = objc_msgSend(v7, "kind");
  if (v52 != 3)
  {
    if (v52)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v53, CFSTR("Number of Moments"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v54, CFSTR("Number of Curated Assets"));

LABEL_8:
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("sortedMeaningLabels"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    objc_msgSend(v55, "componentsJoinedByString:", CFSTR(", "));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v57, CFSTR("Meanings"));

  }
  else
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("-"), CFSTR("Meanings"));
  }
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v58, CFSTR("Graph Info"));
  objc_msgSend(v60, "setObject:forKeyedSubscript:", v17, CFSTR("debugInfo"));

  return v60;
}

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceHighlight:(id)a6 sourceDictionary:(id)a7
{
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  void *v30;
  double v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v57;
  _BOOL4 v58;
  BOOL v59;
  void *v60;
  __CFString *v61;
  void *v62;
  __CFString *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[17];
  _QWORD v77[13];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[5];

  v86[3] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = v12;
  if (a3)
    v14 = a4 == 0;
  else
    v14 = 1;
  v15 = !v14;
  if (!v14)
  {
    if (a5 == 3)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("backingMoments"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_opt_new();
      v51 = (void *)objc_opt_new();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_3;
      v65[3] = &unk_1E512C2C8;
      v66 = v50;
      v67 = v51;
      v52 = v51;
      v53 = v50;
      objc_msgSend(v49, "enumerateObjectsUsingBlock:", v65);
      v54 = objc_retainAutorelease(v53);
      *a3 = v54;
      v55 = objc_retainAutorelease(v52);
      *a4 = v55;

    }
    else if (!a5)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("debugInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = CFSTR("Generic");
      v86[1] = CFSTR("Enrichment");
      v86[2] = CFSTR("Graph Info");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v84[0] = CFSTR("Generic");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v17;
      v84[1] = CFSTR("Enrichment");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v18;
      v84[2] = CFSTR("Graph Info");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Enrichment Version"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Highlight Version"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      v24 = CFSTR("OUT-OF-DATE!!!");
      if (v23)
        v24 = CFSTR("Up-to-Date");
      v25 = v24;
      v63 = v25;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Key Asset UUID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v26 == 0;

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Key Asset UUID"));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      v29 = CFSTR("NO KEY ASSET!!!");
      if (v27)
        v29 = (__CFString *)v27;
      v64 = v11;
      v61 = v29;

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Promotion Score"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31 < 0.3;

      v82[0] = CFSTR("Is Up-to-Date");
      v82[1] = CFSTR("Key Asset UUID");
      v83[0] = v25;
      v83[1] = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = CFSTR("Is Up-to-Date");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23 ^ 1u);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v33;
      v80[1] = CFSTR("Key Asset UUID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v34;
      v80[2] = CFSTR("Promotion Score");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v81[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v78[0] = CFSTR("Generic");
      v77[0] = CFSTR("UUID");
      v77[1] = CFSTR("Type");
      v77[2] = CFSTR("Kind");
      v77[3] = CFSTR("Category");
      v77[4] = CFSTR("Sharing Composition");
      v77[5] = CFSTR("Start Date (Local)");
      v77[6] = CFSTR("End Date (Local)");
      v77[7] = CFSTR("Start Date (UTC)");
      v77[8] = CFSTR("End Date (UTC)");
      v77[9] = CFSTR("Start TZ Offset");
      v77[10] = CFSTR("End TZ Offset");
      v77[11] = CFSTR("Number of Moments");
      v77[12] = CFSTR("Highlight Version");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v78[1] = CFSTR("Enrichment");
      v79[0] = v36;
      v76[0] = CFSTR("Is Up-to-Date");
      v76[1] = CFSTR("Is Enriched");
      v76[2] = CFSTR("Enrichment State");
      v76[3] = CFSTR("Visibility State Private");
      v76[4] = CFSTR("Visibility State Shared");
      v76[5] = CFSTR("Visibility State Mixed");
      v76[6] = CFSTR("Enrichment Version");
      v76[7] = CFSTR("Title");
      v76[8] = CFSTR("Subtitle");
      v76[9] = CFSTR("Promotion Score");
      v76[10] = CFSTR("Meanings");
      v76[11] = CFSTR("Mood");
      v76[12] = CFSTR("Is Curated");
      v76[13] = CFSTR("Number of Assets");
      v76[14] = CFSTR("Key Asset UUID");
      v76[15] = CFSTR("Number of Curated Assets");
      v76[16] = CFSTR("Number of Extended Curated Assets");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 17);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
      v59 = v15;
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = MEMORY[0x1E0C809B0];
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke;
      v71[3] = &unk_1E511BDA0;
      v72 = v62;
      v73 = v60;
      v74 = v16;
      v40 = v57;
      v75 = v40;
      v41 = v16;
      v42 = v60;
      v43 = v62;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v71);
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Graph Info"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("Graph Info"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v39;
      v68[1] = 3221225472;
      v68[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_2;
      v68[3] = &unk_1E5140FF8;
      v69 = v40;
      v70 = v44;
      v46 = v44;
      v47 = v40;
      objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v68);
      v48 = objc_retainAutorelease(v43);
      *a4 = v48;

      v11 = v64;
      v15 = v59;
    }
  }

  return v15;
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v24 = v5;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v32;
    v27 = *MEMORY[0x1E0DC1138];
    v7 = *MEMORY[0x1E0DC1430];
    v8 = *MEMORY[0x1E0DC1420];
    v26 = *MEMORY[0x1E0DC1140];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(a1[6], "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
            continue;
        }
        v12 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ %@ ] "), v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v27;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v15);

        v17 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v27;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v26;
        v36[0] = v19;
        objc_msgSend(a1[7], "objectForKeyedSubscript:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "BOOLValue"))
          objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v22);
        objc_msgSend(v16, "appendAttributedString:", v23);

        objc_msgSend(v28, "addObject:", v16);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v30);
  }

}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%.3f"), v9);
    }
    else
    {
      objc_msgSend(v5, "description");
    }
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  v11 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ %@ ] "), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1138];
  v13 = v26;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1430]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v15);

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1420]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v24[1] = *MEMORY[0x1E0DC1140];
  v19 = a1;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "BOOLValue"))
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v17, "initWithString:attributes:", v10, v22);
  objc_msgSend(v16, "appendAttributedString:", v23);

  objc_msgSend(*(id *)(v19 + 40), "addObject:", v16);
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moment %d"), (a3 + 1));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByAppendingString:", CFSTR(" - Scores"));
  v31 = a1;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Asset Count: %lu"), objc_msgSend(v29, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("curationScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Curation: %.3f"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v11;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("graphScore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Graph: %.3f"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v15;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("neighborScore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Neighbor: %.3f"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingScore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingScore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Matching: %.3f"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v26);

  }
  objc_msgSend(*(id *)(v31 + 40), "setObject:forKeyedSubscript:", v21, v32);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keywords"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_4;
  v33[3] = &unk_1E512C2F0;
  v34 = v30;
  v35 = *(id *)(v31 + 32);
  v36 = *(id *)(v31 + 40);
  v28 = v30;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v33);

}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
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
