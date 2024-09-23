@implementation PPSocialHighlightRanker

- (id)rerankSocialHighlightsForTopOneResult:(id)a3 client:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t j;
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
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *context;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  PPSocialHighlightRanker *v56;
  uint8_t buf[4];
  uint64_t v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[6];
  _QWORD v62[6];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(a4, "_pas_stringBackedByUTF8CString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_topKCount);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke;
  v54[3] = &unk_1E7E1C7F8;
  v9 = v8;
  v55 = v9;
  v56 = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v54);
  v42 = v6;
  v43 = (void *)objc_msgSend(v6, "mutableCopy");
  v10 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "second");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addIndex:", objc_msgSend(v16, "unsignedIntegerValue"));

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v13);
  }

  v36 = v10;
  objc_msgSend(v43, "removeObjectsAtIndexes:", v10);
  v17 = objc_msgSend(v11, "count");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = v11;
  objc_msgSend(v11, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v44)
  {
    v41 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        context = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v19, "first");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = CFSTR("oldRank");
        objc_msgSend(v19, "second");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v21;
        v61[1] = CFSTR("newRank");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = v22;
        v61[2] = CFSTR("clientIdentifier");
        v23 = v7;
        v24 = v7;
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v40;
        }
        v62[2] = v23;
        v61[3] = CFSTR("isStarred");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v20, "highlightType") == 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v62[3] = v25;
        v62[4] = MEMORY[0x1E0C9AAB0];
        v61[4] = CFSTR("didUprank");
        v61[5] = CFSTR("batchSize");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v62[5] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.ItemUpranked"), v27, 0);

        v7 = v24;
        if (!v24)

        objc_msgSend(v20, "setIsTopKResult:", 1);
        objc_msgSend(v20, "topKScore");
        objc_msgSend(v20, "setScore:");
        objc_msgSend(v43, "insertObject:atIndex:", v20, 0);
        --v17;

        objc_autoreleasePoolPop(context);
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v44);
  }

  if (!objc_msgSend(v37, "count"))
  {
    v28 = (void *)MEMORY[0x1C3BD6630]();
    v59[0] = CFSTR("clientIdentifier");
    v29 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v60[0] = v29;
    v60[1] = MEMORY[0x1E0C9AAA0];
    v59[1] = CFSTR("didUprank");
    v59[2] = CFSTR("batchSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlights.ItemUpranked"), v31, 0);

    if (!v7)
    pp_social_highlights_log_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 134217984;
      v58 = v33;
      _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightRanker: none of the %tu highlights were eligible to be upranked.", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v28);
  }
  v34 = (void *)objc_msgSend(v43, "copy");

  objc_autoreleasePoolPop(v38);
  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKScorer, 0);
  objc_storeStrong((id *)&self->_firstPassScorer, 0);
}

- (id)rankSocialHighlights:(id)a3 client:(id)a4 performRerank:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  os_signpost_id_t spid;
  id v33;
  unint64_t v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v35 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pp_social_highlights_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v45 = objc_msgSend(v7, "count");
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPSocialHighlightRanker: ranking %tu social highlights for '%@'", buf, 0x16u);
  }

  pp_social_highlights_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  pp_social_highlights_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v34 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Ranker.scoreSocialHighlights", ", buf, 2u);
  }
  spid = v11;
  v33 = v8;

  v14 = v7;
  v15 = v14;
  if (self)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, buf, 16, v11);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v19);
          pp_private_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "highlightIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "calculatedFeatures");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v40 = 138412546;
            v41 = v22;
            v42 = 2112;
            v43 = v23;
            _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "PPSocialHighlightRanker: %@ - ranking features %@", v40, 0x16u);

          }
          -[PPSocialHighlightScorer scoreSocialHighlight:](self->_firstPassScorer, "scoreSocialHighlight:", v20);
          objc_msgSend(v20, "setFirstPassScore:");
          -[PPSocialHighlightScorer scoreSocialHighlight:](self->_topKScorer, "scoreSocialHighlight:", v20);
          objc_msgSend(v20, "setTopKScore:");
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
      }
      while (v17);
    }
    v24 = v15;
  }
  else
  {
    v24 = 0;
  }

  pp_social_highlights_signpost_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v26, OS_SIGNPOST_INTERVAL_END, spid, "Ranker.scoreSocialHighlights", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v24, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_17145);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v35)
  {
    v29 = v33;
    -[PPSocialHighlightRanker rerankSocialHighlightsForTopOneResult:client:](self, "rerankSocialHighlightsForTopOneResult:client:", v27, v33);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = v27;
    v29 = v33;
  }

  return v30;
}

- (PPSocialHighlightRanker)init
{
  void *v3;
  void *v4;
  void *v5;
  PPSocialHighlightRanker *v6;

  +[PPSocialHighlightMLScorer sharedFirstPassInstance](PPSocialHighlightMLScorer, "sharedFirstPassInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSocialHighlightMLScorer sharedTopKInstance](PPSocialHighlightMLScorer, "sharedTopKInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSocialHighlightRanker initWithFirstPassScorer:topKScorer:topKCount:](self, "initWithFirstPassScorer:topKScorer:topKCount:", v3, v4, objc_msgSend(v5, "socialHighlightTopKCount"));

  return v6;
}

- (PPSocialHighlightRanker)initWithFirstPassScorer:(id)a3 topKScorer:(id)a4 topKCount:(unsigned int)a5
{
  id v9;
  id v10;
  PPSocialHighlightRanker *v11;
  PPSocialHighlightRanker *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPSocialHighlightRanker;
  v11 = -[PPSocialHighlightRanker init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstPassScorer, a3);
    objc_storeStrong((id *)&v12->_topKScorer, a4);
    v12->_topKCount = a5;
  }

  return v12;
}

void __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "firstPassScore");
  objc_msgSend(v13, "setScore:");
  objc_msgSend(v13, "setIsTopKResult:", 0);
  objc_msgSend(v13, "topKScore");
  if (v5 > 0.0)
  {
    objc_msgSend(v13, "firstPassScore");
    if (v6 >= 0.0)
    {
      v7 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithFirst:second:", v13, v8);

      v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_50_17137);
      v11 = objc_msgSend(*(id *)(a1 + 32), "count");
      v12 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 24);
      if (v11 < v12 || v10 < v12)
        objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, v10);

    }
  }

}

uint64_t __72__PPSocialHighlightRanker_rerankSocialHighlightsForTopOneResult_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D70D00];
  objc_msgSend(v4, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topKScore");
  v9 = v8;
  objc_msgSend(v5, "first");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topKScore");
  v12 = objc_msgSend(v6, "reverseCompareDouble:withDouble:", v9, v11);

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0D70D00];
    objc_msgSend(v4, "first");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "score");
    v16 = v15;
    objc_msgSend(v5, "first");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "score");
    v12 = objc_msgSend(v13, "reverseCompareDouble:withDouble:", v16, v18);

  }
  return v12;
}

uint64_t __69__PPSocialHighlightRanker_rankSocialHighlights_client_performRerank___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "firstPassScore");
  v7 = v6;
  objc_msgSend(v5, "firstPassScore");
  v9 = v8;

  return objc_msgSend(v4, "reverseCompareDouble:withDouble:", v7, v9);
}

@end
