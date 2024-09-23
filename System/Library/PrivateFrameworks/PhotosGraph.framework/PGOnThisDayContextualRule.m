@implementation PGOnThisDayContextualRule

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  return 1;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, NSObject *, void *, id, _BYTE *, double);
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  unsigned int v44;
  double v45;
  double v46;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  PGOnThisDayContextualRule *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void (**v59)(id, NSObject *, void *, id, _BYTE *, double);
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  char v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v12 = a4;
  v83 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, NSObject *, void *, id, _BYTE *, double))a8;
  if (!v18)
    goto LABEL_52;
  v54 = self;
  v59 = v18;
  v56 = v17;
  v57 = v15;
  v76 = 0;
  +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:withOptions:](PGContextualRuleUtils, "onThisDayLocalDateForYearHighlight:withOptions:", v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v14;
  objc_msgSend(v14, "childHighlightItemsForHighlightFilter:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __139__PGOnThisDayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
  v74[3] = &unk_1E8427D98;
  v21 = v19;
  v75 = v21;
  v55 = v20;
  objc_msgSend(v20, "sortedArrayUsingComparator:", v74);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  obj = v22;
  v62 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (!v62)
  {

    goto LABEL_47;
  }
  v23 = 0;
  v61 = *(_QWORD *)v71;
  while (2)
  {
    v24 = 0;
    v25 = v23;
LABEL_5:
    if (*(_QWORD *)v71 != v61)
      objc_enumerationMutation(obj);
    v23 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * v24);

    objc_msgSend(v16, "fetchChildHighlightItemsForHighlightItem:sharingFilter:", v23, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    if (!v27)
    {

      goto LABEL_36;
    }
    v28 = v27;
    v63 = v24;
    v64 = v23;
    v29 = 0;
    v65 = 0;
    v30 = *(_QWORD *)v67;
    v31 = 2.22507386e-308;
    v32 = 978307200.0;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v67 != v30)
          objc_enumerationMutation(v26);
        v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (MEMORY[0x1CAA4E418](objc_msgSend(v16, "visibilityStateForHighlightItem:sharingFilter:", v34, v12)))
        {
          v35 = v16;
          objc_msgSend(v34, "localStartDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "timeIntervalSinceDate:", v21);
          v38 = v37;

          if (v38 >= 0.0)
            v39 = v38;
          else
            v39 = -v38;
          objc_msgSend(v34, "localEndDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSinceDate:", v21);
          v42 = v41;

          v43 = -v42;
          if (v42 >= 0.0)
            v43 = v42;
          if (v39 >= v43)
            v39 = v43;
          v44 = objc_msgSend(v34, "enrichmentState");
          objc_msgSend(v34, "promotionScore");
          v46 = v45;
          if (v44 <= 3 && v44 >= v29)
          {
            if (v45 > v31)
              goto LABEL_29;
          }
          else if (v44 == 4 && (v29 < 4 || v39 < v32))
          {
LABEL_29:
            v48 = v34;

            v29 = v44;
            v31 = v46;
            v32 = v39;
            v65 = v48;
          }
          v16 = v35;
          continue;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    }
    while (v28);

    v23 = v64;
    v49 = v65;
    v24 = v63;
    if (!v65)
    {
LABEL_36:
      ++v24;
      v25 = v23;
      if (v24 == v62)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (!v62)
        {

          if (v23)
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "loggingConnection");
            v51 = objc_claimAutoreleasedReturnValue();

            v52 = v55;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v78 = v58;
              v79 = 2112;
              v80 = v23;
              _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "No day found for highlight year %@ and month %@", buf, 0x16u);
            }
            v49 = 0;
            goto LABEL_51;
          }
LABEL_47:
          v49 = 0;
          goto LABEL_48;
        }
        continue;
      }
      goto LABEL_5;
    }
    break;
  }

  if (v64)
  {
    -[PGOnThisDayContextualRule _contextualKeyAssetForDayHighlightItem:contextualLocalDate:sharingFilter:](v54, "_contextualKeyAssetForDayHighlightItem:contextualLocalDate:sharingFilter:", v65, v21, v12);
    v51 = objc_claimAutoreleasedReturnValue();
    if (v51)
      v59[2](v59, v51, v65, v64, &v76, 0.0);
    v52 = v55;
    goto LABEL_51;
  }
LABEL_48:
  v52 = v55;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "loggingConnection");
  v51 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v58;
    _os_log_error_impl(&dword_1CA237000, v51, OS_LOG_TYPE_ERROR, "No month found for highlight year %@", buf, 0xCu);
  }
  v23 = 0;
LABEL_51:

  v15 = v57;
  v14 = v58;
  v17 = v56;
  v18 = v59;
LABEL_52:

}

- (id)_contextualKeyAssetForDayHighlightItem:(id)a3 contextualLocalDate:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "keyAssetForHighlightFilter:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PGUserDefaults onThisDayHighlightKeyAssetRotationIsEnabled](PGUserDefaults, "onThisDayHighlightKeyAssetRotationIsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:toDate:options:", 16, v8, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "day");
    objc_msgSend(v7, "extendedCuratedAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v14, objc_msgSend(v7, "sharingComposition"), v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "count");
    if (v16 < 1)
    {
      v19 = 0;
    }
    else
    {
      v17 = v16;
      v18 = objc_msgSend(v15, "indexOfObject:", v9);
      objc_msgSend(v15, "objectAtIndexedSubscript:", (v17 & (((v18 + v13) % v17) >> 63)) + (v18 + v13) % v17);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = v9;
  }

  return v19;
}

uint64_t __139__PGOnThisDayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  objc_msgSend(v8, "dateByAddingTimeInterval:", v10 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v7);
  v13 = v12;

  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = -v13;

  v15 = *(id *)(a1 + 32);
  v16 = v6;
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "timeIntervalSinceDate:", v17);
  objc_msgSend(v17, "dateByAddingTimeInterval:", v19 * 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v15);
  v22 = v21;

  if (v22 < 0.0)
    v22 = -v22;

  if (v14 >= v22)
  {
    if (v14 <= v22)
    {
      objc_msgSend(v5, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "compare:", v25);

    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = -1;
  }

  return v23;
}

@end
