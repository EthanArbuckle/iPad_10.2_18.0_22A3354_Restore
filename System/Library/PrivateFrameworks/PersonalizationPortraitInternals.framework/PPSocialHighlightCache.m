@implementation PPSocialHighlightCache

void __61__PPSocialHighlightCache_lastCacheInvalidationDateForClient___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v8 = (id)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%@"), CFSTR("socialHighlightCacheInvalidationDate"), *(_QWORD *)(a1 + 32));
  +[PPSQLKVStore numberForKey:transaction:](PPSQLKVStore, "numberForKey:transaction:", v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  int v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v6 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_3;
  v12[3] = &unk_1E7E15198;
  v7 = v2;
  v13 = v7;
  v16 = v17;
  v8 = v5;
  v14 = v8;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pp_social_highlights_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: Saving to cache for client '%@' with batch identifier of: '%@'", buf, 0x16u);
  }

  -[PPSocialHighlightCache saveOrderedBatch:](*(_QWORD *)(a1 + 48), v9);
  _Block_object_dispose(v17, 8);

}

- (void)saveOrderedBatch:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v6[1] = 3221225472;
    v6[2] = __43__PPSocialHighlightCache_saveOrderedBatch___block_invoke;
    v6[3] = &unk_1E7E1CB78;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "runWithLockAcquired:", v6);

    v3 = v5;
  }

}

- (_QWORD)lastCacheInvalidationDateForClient:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__597;
    v22 = __Block_byref_object_dispose__598;
    v23 = 0;
    v5 = (void *)a1[2];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __61__PPSocialHighlightCache_lastCacheInvalidationDateForClient___block_invoke;
    v15 = &unk_1E7E1EF00;
    v17 = &v18;
    v6 = v3;
    v16 = v6;
    objc_msgSend(v5, "readTransactionWithClient:block:", 0, &v12);
    if (v19[5])
    {
      pp_social_highlights_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v19[5];
        *(_DWORD *)buf = 138412546;
        v25 = v8;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: last cache invalidation of %@ for client %@.", buf, 0x16u);
      }

      v9 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend((id)v19[5], "doubleValue", v12, v13, v14, v15);
      a1 = (_QWORD *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      pp_social_highlights_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: no last invalidation date of cache", buf, 2u);
      }

      a1 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }

  return a1;
}

void __43__PPSocialHighlightCache_saveOrderedBatch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
  if (v5 >= 0)
  {
    do
    {
      v6 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sendEvent:", v7);

      objc_autoreleasePoolPop(v6);
      --v5;
    }
    while (v5 != -1);
  }
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "PPSocialHighlightCache: saved %tu events to the stream.", (uint8_t *)&v10, 0xCu);
  }

}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  -[PPSocialHighlightCache lastCacheInvalidationDateForClient:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "socialHighlightCacheTimeoutInterval");
  v9 = v6 - v8;

  v10 = objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  if (v11 >= v9)
    v12 = v11;
  else
    v12 = v9;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__597;
  v46 = __Block_byref_object_dispose__598;
  v47 = 0;
  v13 = (void *)MEMORY[0x1C3BD6630](v10);
  v14 = *(void **)(*(_QWORD *)v2 + 8);
  v15 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_13;
  v41[3] = &unk_1E7E15018;
  v41[4] = &v42;
  *(double *)&v41[5] = v12;
  objc_msgSend(v14, "runWithLockAcquired:", v41);
  objc_autoreleasePoolPop(v13);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__597;
  v39[4] = __Block_byref_object_dispose__598;
  v40 = 0;
  v16 = (void *)objc_opt_new();
  v17 = (void *)MEMORY[0x1C3BD6630]();
  v18 = (void *)v43[5];
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_2;
  v37[3] = &unk_1E7E1CDC8;
  v38 = *(id *)(a1 + 40);
  objc_msgSend(v18, "filterWithIsIncluded:", v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_3;
  v33[3] = &unk_1E7E15040;
  v34 = v16;
  v35 = *(id *)(a1 + 40);
  v36 = v39;
  v27 = v15;
  v28 = 3221225472;
  v29 = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_19;
  v30 = &unk_1E7E15068;
  v32 = v39;
  v20 = v34;
  v31 = v20;
  v21 = (id)objc_msgSend(v19, "sinkWithCompletion:shouldContinue:", v33, &v27);

  objc_autoreleasePoolPop(v17);
  pp_social_highlights_log_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v20, "count", v27, v28, v29, v30);
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v49 = v23;
    v50 = 2112;
    v51 = v24;
    _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found %tu cached items for client '%@'", buf, 0x16u);
  }

  v25 = *(_QWORD *)(a1 + 48);
  v26 = (void *)objc_msgSend(v20, "copy");
  (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v42, 8);

}

- (void)cachedRankedHighlightsForClient:(uint64_t)a1 variant:(void *)a2 completion:(void *)a3
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke;
    block[3] = &unk_1E7E1F488;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

- (uint64_t)cachedHighlightsArrayIsValid:(void *)a3 queryResults:
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  int v35;
  int v36;
  char v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  void *v51;
  const char *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v47 = 0;
    goto LABEL_62;
  }
  if (!objc_msgSend(v5, "count"))
  {
    pp_social_highlights_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v48 = "PPSocialHighlightCache: no social highlights found in cache, no cache will be persisted.";
LABEL_56:
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
    goto LABEL_60;
  }
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
    pp_social_highlights_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v48 = "PPSocialHighlightCache: cache length did not match query content length. Invalidating cache.";
    goto LABEL_56;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v8 = v5;
  v57 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (!v57)
  {
    v47 = 1;
    goto LABEL_61;
  }
  v53 = v5;
  v61 = *(_QWORD *)v72;
  v58 = v8;
  v59 = v6;
LABEL_6:
  v9 = 0;
LABEL_7:
  if (*(_QWORD *)v72 != v61)
    objc_enumerationMutation(v8);
  v10 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v9);
  objc_msgSend(v10, "contentCreationSecondsSinceReferenceDate", v53);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "socialHighlightDecayInterval");
  v18 = v15 - v17;

  if (v12 < v18)
  {
    pp_private_log_handle();
    v49 = objc_claimAutoreleasedReturnValue();
    v5 = v53;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      goto LABEL_59;
    objc_msgSend(v10, "highlightIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v51;
    v52 = "PPSocialHighlightCache: highlight %@ found to be expired, invalidating cache.";
    goto LABEL_68;
  }
  v19 = v10;
  v20 = v6;
  if (!objc_msgSend(v19, "hasAttributionIdentifier")
    || !objc_msgSend(v19, "hasHighlightIdentifier"))
  {

    goto LABEL_58;
  }
  v62 = v9;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
  if (!v22)
    goto LABEL_57;
  v23 = v22;
  v24 = *(_QWORD *)v76;
  while (2)
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v76 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v25);
      if (!objc_msgSend(v26, "hasAttributionIdentifier")
        || !objc_msgSend(v26, "hasHighlightIdentifier"))
      {
        goto LABEL_29;
      }
      objc_msgSend(v26, "attributionIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributionIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "isEqualToString:", v28)
        || (v29 = objc_msgSend(v26, "highlightType"), v29 != objc_msgSend(v19, "highlightType")))
      {

        goto LABEL_29;
      }
      objc_msgSend(v26, "highlightIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "highlightIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v30, "isEqualToString:", v31)
        || (objc_msgSend(v26, "syndicationSecondsSinceReferenceDate"),
            v33 = v32,
            objc_msgSend(v19, "syndicationSecondsSinceReferenceDate"),
            v33 != v34))
      {
        v37 = 0;
        goto LABEL_28;
      }
      v70 = v30;
      v35 = objc_msgSend(v26, "isCollaboration");
      if (v35 != objc_msgSend(v19, "isCollaboration")
        || (v36 = objc_msgSend(v26, "hasCollaborationIdentifier"),
            v36 != objc_msgSend(v19, "hasCollaborationIdentifier")))
      {
        v37 = 0;
        v30 = v70;
        goto LABEL_28;
      }
      objc_msgSend(v26, "collaborationIdentifier");
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collaborationIdentifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v38;
      if ((void *)v38 != v68)
      {
        objc_msgSend(v26, "collaborationIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "collaborationIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v39;
        if (!objc_msgSend(v39, "isEqual:"))
        {
          v37 = 0;
          v30 = v70;
LABEL_45:

          goto LABEL_46;
        }
      }
      objc_msgSend(v26, "contentType");
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentType");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)v40;
      if ((void *)v40 != v66)
      {
        objc_msgSend(v26, "contentType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentType");
        v60 = v41;
        v65 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v41, "isEqual:"))
        {
          v37 = 0;
LABEL_40:
          v45 = (void *)v65;
          v30 = v70;
          goto LABEL_43;
        }
      }
      objc_msgSend(v26, "contentDisplayName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentDisplayName");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v42 != (void *)v43)
      {
        v56 = (void *)v43;
        objc_msgSend(v26, "contentDisplayName");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentDisplayName");
        v55 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v54, "isEqual:", v44);

        if (v67 == v66)
        {
          v30 = v70;
          goto LABEL_44;
        }
        goto LABEL_40;
      }

      v37 = 1;
      v30 = v70;
      if (v67 == v66)
        goto LABEL_44;
      v45 = (void *)v65;
LABEL_43:
      v65 = (uint64_t)v45;

LABEL_44:
      if (v69 != v68)
        goto LABEL_45;
LABEL_46:

LABEL_28:
      if ((v37 & 1) != 0)
      {

        v9 = v62 + 1;
        v8 = v58;
        v6 = v59;
        if (v62 + 1 != v57)
          goto LABEL_7;
        v47 = 1;
        v57 = -[NSObject countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        if (!v57)
        {
          v5 = v53;
          goto LABEL_61;
        }
        goto LABEL_6;
      }
LABEL_29:
      ++v25;
    }
    while (v23 != v25);
    v46 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
    v23 = v46;
    if (v46)
      continue;
    break;
  }
LABEL_57:

  v8 = v58;
  v6 = v59;
LABEL_58:
  pp_private_log_handle();
  v49 = objc_claimAutoreleasedReturnValue();
  v5 = v53;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v19, "highlightIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v51;
    v52 = "PPSocialHighlightCache: found highlight %@ in the cache that was not in the Spotlight query, invaldating cache.";
LABEL_68:
    _os_log_debug_impl(&dword_1C392E000, v49, OS_LOG_TYPE_DEBUG, v52, buf, 0xCu);

  }
LABEL_59:

LABEL_60:
  v47 = 0;
LABEL_61:

LABEL_62:
  return v47;
}

void __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_2;
  block[3] = &unk_1E7E1AC58;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  dispatch_async(v3, block);

}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  pp_social_highlights_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (uint64_t)v7;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to read from the cache: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found cache of %tu items for client: '%@'", (uint8_t *)&v12, 0x16u);
    }

    pp_social_highlights_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: batch Identifier is: %@ for client: '%@'", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (PPSocialHighlightCache)init
{
  NSUInteger v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PPSocialHighlightCache *v11;

  v3 = NSRoundUpToMultipleOfPageSize(0x30000uLL);
  +[PPPaths subdirectory:](PPPaths, "subdirectory:", CFSTR("streams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024C0]), "initWithStoreBasePath:segmentSize:", v4, v3);
  v6 = objc_alloc(MEMORY[0x1E0D024B0]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "socialHighlightRankedStorageMaxAge");
  v8 = (void *)objc_msgSend(v6, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 25 * v3);

  objc_msgSend(v5, "setPruningPolicy:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("rankedSocialHighlights"), v5);
  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (PPSocialHighlightCache *)-[PPSocialHighlightCache initWithStream:database:]((id *)&self->super.isa, v9, v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)initWithStream:(void *)a3 database:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PPSocialHighlightCache;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v5);
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "SocialHighlightCache");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[3];
      a1[3] = (id)v9;

    }
  }

  return a1;
}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(double *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithDouble:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, v9, 0, 0, 1);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (v5 && objc_msgSend(v5, "hasClientIdentifier"))
  {
    objc_msgSend(v5, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      v7 = objc_msgSend(v5, "hasBatchIdentifier");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v5, "batchIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(v5, "batchIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    pp_social_highlights_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "batchIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPSocialHighlightCache: returning cache as have completed loading of batch %@", (uint8_t *)&v14, 0xCu);

    }
  }

  return v10;
}

- (void)invalidateCacheForClient:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v6[1] = 3221225472;
    v6[2] = __51__PPSocialHighlightCache_invalidateCacheForClient___block_invoke;
    v6[3] = &unk_1E7E1EEB0;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "writeTransactionWithClient:block:", 0, v6);

    v3 = v5;
  }

}

void __51__PPSocialHighlightCache_invalidateCacheForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), CFSTR("socialHighlightCacheInvalidationDate"), *(_QWORD *)(a1 + 32));
  +[PPSQLKVStore setNumber:forKey:transaction:](PPSQLKVStore, "setNumber:forKey:transaction:", v7, v8, v3);

  objc_autoreleasePoolPop(v5);
  pp_social_highlights_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: invalidated the cache as of %@ for client %@", buf, 0x16u);
  }

}

- (void)deleteMatchingPredicate:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke;
    v8[3] = &unk_1E7E1CDA0;
    v9 = v3;
    v10 = &v11;
    objc_msgSend(v5, "runWithLockAcquired:", v8);
    pp_social_highlights_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v12[3];
      *(_DWORD *)buf = 134217984;
      v16 = v7;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPSocialHighlightCache: deleted %tu items in the vended stream.", buf, 0xCu);
    }

    _Block_object_dispose(&v11, 8);
  }

}

void __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke_2;
  v6[3] = &unk_1E7E15090;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "pruneWithPredicateBlock:", v6);

}

uint64_t __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v3);
  objc_autoreleasePoolPop(v4);
  if ((_DWORD)v5)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v5;
}

void __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      if (v8)
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (*(_QWORD *)(v9 + 40))
          v10 = v6 == 0;
        else
          v10 = 1;
        if (!v10)
        {
          if (!objc_msgSend(v6, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_13;
          }
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        objc_storeStrong((id *)(v9 + 40), v6);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      }
    }
    else
    {

    }
  }
  v11 = 1;
LABEL_13:

  objc_autoreleasePoolPop(v4);
  return v11;
}

void __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  pp_social_highlights_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to read items from Biome %@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: successfully completed reading of the ranked stream from Biome.", (uint8_t *)&v7, 2u);
  }

}

void __34__PPSocialHighlightCache_allItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "publisherFromStartTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PPSocialHighlightCache_allItems__block_invoke_2;
  v8[3] = &unk_1E7E15100;
  v9 = *(id *)(a1 + 32);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __34__PPSocialHighlightCache_allItems__block_invoke_31;
  v6[3] = &unk_1E7E15128;
  v7 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", v8, v6);

}

void __34__PPSocialHighlightCache_allItems__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pp_social_highlights_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: retrieved %tu events from the stream.", (uint8_t *)&v4, 0xCu);
  }

}

void __34__PPSocialHighlightCache_allItems__block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1C3BD6630]();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_autoreleasePoolPop(v4);
  }

}

void __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "publisherFromStartTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_2;
  v10[3] = &unk_1E7E1CDC8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "filterWithIsIncluded:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D02430], "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reduce:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_35;
  v9[3] = &unk_1E7E15170;
  v9[4] = *(_QWORD *)(a1 + 40);
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_34, v9);

}

uint64_t __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPrimary"))
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "batchIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "eventBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "batchIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v10;
}

uint64_t __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    pp_social_highlights_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to count items matching batch identifier: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

id __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "highlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "setIsPrimary:", 0);
    objc_msgSend(v3, "setRank:", *(unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24));
  }
  else
  {
    objc_msgSend(v3, "setIsPrimary:", 1);
    objc_msgSend(v3, "setRank:", *(unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24));
    v6 = (void *)a1[4];
    objc_msgSend(v3, "highlightIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  objc_msgSend(v3, "setBatchIdentifier:", a1[5]);
  objc_msgSend(v3, "setClientIdentifier:", a1[6]);
  return v3;
}

@end
