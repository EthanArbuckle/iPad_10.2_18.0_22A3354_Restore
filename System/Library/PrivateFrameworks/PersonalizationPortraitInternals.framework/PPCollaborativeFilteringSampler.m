@implementation PPCollaborativeFilteringSampler

- (PPCollaborativeFilteringSampler)initWithSamplingWeightTrie:(id)a3
{
  id v5;
  PPCollaborativeFilteringSampler *v6;
  PPCollaborativeFilteringSampler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPCollaborativeFilteringSampler;
  v6 = -[PPCollaborativeFilteringSampler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_samplingWeightTrie, a3);

  return v7;
}

- (PPCollaborativeFilteringSampler)init
{
  void *v3;
  void *v4;
  void *v5;
  PPCollaborativeFilteringSampler *v6;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filepathForFactor:namespaceName:", CFSTR("collaborativeFilteringWeights.trie"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v4);
    self = -[PPCollaborativeFilteringSampler initWithSamplingWeightTrie:](self, "initWithSamplingWeightTrie:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)_probabilityForItemString:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  _PASCFBurstTrie *samplingWeightTrie;
  objc_class *v8;
  id v9;
  void *v10;
  unsigned int v11;
  _PASCFBurstTrie *v12;
  void *v13;
  unsigned int v14;

  v6 = a4;
  samplingWeightTrie = self->_samplingWeightTrie;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:", CFSTR("%@:%@"), v6, v9);

  v11 = -[_PASCFBurstTrie payloadForString:](samplingWeightTrie, "payloadForString:", v10);
  if (!v11)
  {
    v12 = self->_samplingWeightTrie;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:*"), v6);
    v14 = -[_PASCFBurstTrie payloadForString:](v12, "payloadForString:", v13);

    if (v14)
      v11 = v14;
    else
      v11 = 100;
  }

  return v11;
}

- (id)_weightedSampleFeedbackItems:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v27;
  NSObject *obj;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v6)
    {
      v7 = v6;
      v27 = v3;
      obj = v5;
      v8 = 0;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v11, "feedbackItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "itemString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v11, "clientIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[PPCollaborativeFilteringSampler _probabilityForItemString:clientIdentifier:](self, "_probabilityForItemString:clientIdentifier:", v15, v16);

            v8 += v17;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v18);
          }
          else
          {
            objc_msgSend(v4, "addObject:", &unk_1E7E59318);
            pp_default_log_handle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPCollaborativeFilteringSampler: found feedback without item string.", buf, 2u);
            }
          }

          objc_autoreleasePoolPop(v12);
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v7);

      if (!v8)
      {
        v25 = 0;
LABEL_24:
        v3 = v27;
        goto LABEL_25;
      }
      v19 = (void *)objc_opt_new();
      v20 = objc_msgSend(v19, "next");

      if (objc_msgSend(v4, "count"))
      {
        v21 = 0;
        v22 = 0;
        v23 = v20 % v8;
        while (1)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v22 += objc_msgSend(v24, "intValue");

          if (v22 >= v23)
            break;
          if (++v21 >= (unint64_t)objc_msgSend(v4, "count"))
            goto LABEL_18;
        }
        -[NSObject objectAtIndexedSubscript:](obj, "objectAtIndexedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_18:
      pp_default_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      v3 = v27;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPCollaborativeFilteringSampler: sampling identified no items", buf, 2u);
      }
    }

    v25 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v25 = 0;
LABEL_26:

  return v25;
}

- (BOOL)constructAndSendMessageForSamplingRate:(double)a3 shouldContinueBlock:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
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
  int v30;
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
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  uint64_t (**v71)(void);
  NSObject *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  NSObject *v79;
  uint8_t *v80;
  uint8_t buf[8];
  uint8_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  const __CFString *v87;
  void *v88;
  uint8_t v89[4];
  void *v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v71 = (uint64_t (**)(void))a4;
  if ((objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", a3) & 1) != 0)
  {
    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "rankedTopicsWithQuery:error:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "_pas_shuffledArrayUsingRng:", 0);
      v72 = objc_claimAutoreleasedReturnValue();

      if ((v71[2]() & 1) == 0)
      {
        pp_default_log_handle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring snapshot", buf, 2u);
        }

        v70 = 0;
        goto LABEL_50;
      }
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "pendingTopicFeedback");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPCollaborativeFilteringSampler _weightedSampleFeedbackItems:](self, "_weightedSampleFeedbackItems:", v68);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "concatenatedTreatmentNames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_pas_stringBackedByUTF8CString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v14, "portraitAnalyticsMaximumNumberOfRecords");

      if ((_DWORD)v13)
      {
        v15 = 0;
        while (1)
        {
          v16 = (void *)MEMORY[0x1C3BD6630]();
          if ((v71[2]() & 1) == 0)
            break;
          if (v15 == -[NSObject count](v72, "count"))
          {
            objc_autoreleasePoolPop(v16);
            goto LABEL_29;
          }
          v17 = (void *)objc_opt_new();
          if (v73)
          {
            objc_msgSend(v73, "clientIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v73, "clientIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "_pas_stringBackedByUTF8CString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("clientIdentifier"));

            }
            objc_msgSend(v73, "feedbackItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "itemString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v73, "feedbackItems");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "firstObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "itemString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "_pas_stringBackedByUTF8CString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("clientTopic"));

            }
            objc_msgSend(v73, "feedbackItems");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "firstObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "itemFeedbackType");

            if (v30)
            {
              v31 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v73, "feedbackItems");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "firstObject");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "numberWithUnsignedInt:", objc_msgSend(v33, "itemFeedbackType"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, CFSTR("engagementType"));

            }
          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v69, CFSTR("activeTreatments"));
          -[NSObject objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v15);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "item");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "topicIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_pas_stringBackedByUTF8CString");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, CFSTR("topic"));

          v39 = (void *)MEMORY[0x1E0CB37E8];
          -[NSObject objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v15);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "score");
          LODWORD(v42) = vcvtmd_s64_f64(v41 * 5.0);
          objc_msgSend(v39, "numberWithInt:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, CFSTR("score"));

          AnalyticsSendEvent();
          objc_autoreleasePoolPop(v16);
          +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          ++v15;
          LODWORD(v43) = objc_msgSend(v44, "portraitAnalyticsMaximumNumberOfRecords");

          if (v15 >= (int)v43)
            goto LABEL_29;
        }
        pp_default_log_handle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v47, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring snapshot in loop.", buf, 2u);
        }

        objc_autoreleasePoolPop(v16);
        v70 = 0;
        goto LABEL_49;
      }
LABEL_29:
      v48 = (void *)objc_opt_new();
      v49 = (void *)objc_msgSend(CFSTR("PersonalizationPortrait"), "copy");
      objc_msgSend(v48, "setCaller:", v49);

      v50 = dispatch_group_create();
      dispatch_group_enter(v50);
      *(_QWORD *)buf = 0;
      v82 = buf;
      v83 = 0x3032000000;
      v84 = __Block_byref_object_copy__6178;
      v85 = __Block_byref_object_dispose__6179;
      v86 = 0;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __100__PPCollaborativeFilteringSampler_constructAndSendMessageForSamplingRate_shouldContinueBlock_error___block_invoke;
      v78[3] = &unk_1E7E1B6E8;
      v80 = buf;
      v51 = v50;
      v79 = v51;
      v67 = v48;
      objc_msgSend(v48, "makeRequestWithCompletion:", v78);
      v66 = v51;
      v52 = objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v51, 8.0);
      v70 = v71[2]();
      if ((v70 & 1) != 0)
      {
        if (v52 == 1 || !*((_QWORD *)v82 + 5))
        {
          v70 = 0;
          goto LABEL_48;
        }
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v53 = *((id *)v82 + 5);
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
        if (v54)
        {
          v55 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v75 != v55)
                objc_enumerationMutation(v53);
              v57 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              v58 = (void *)MEMORY[0x1C3BD6630]();
              pp_private_log_handle();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v57, "ID");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "name");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v89 = 138412546;
                v90 = v63;
                v91 = 2112;
                v92 = v64;
                _os_log_debug_impl(&dword_1C392E000, v59, OS_LOG_TYPE_DEBUG, "PPMaintenance: TV app favorite: %@: \t\t %@", v89, 0x16u);

              }
              objc_msgSend(v57, "ID");
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
              {
                v87 = CFSTR("sportsFavorite");
                objc_msgSend(v57, "ID");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = v61;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                AnalyticsSendEvent();

              }
              objc_autoreleasePoolPop(v58);
            }
            v54 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
          }
          while (v54);
        }
      }
      else
      {
        pp_default_log_handle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v89 = 0;
          _os_log_debug_impl(&dword_1C392E000, v53, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring WLKFavorite request for snapshot.", v89, 2u);
        }
      }

LABEL_48:
      _Block_object_dispose(buf, 8);

LABEL_49:
LABEL_50:
      v45 = v72;
      goto LABEL_51;
    }
    pp_default_log_handle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v45, OS_LOG_TYPE_ERROR, "PPMaintenance: unable to fetch ranked topics.", buf, 2u);
    }
    v70 = 0;
  }
  else
  {
    pp_default_log_handle();
    v70 = 1;
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v70 = 1;
      _os_log_impl(&dword_1C392E000, v45, OS_LOG_TYPE_INFO, "Skipping snapshot sampling.", buf, 2u);
    }
  }
LABEL_51:

  return v70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingWeightTrie, 0);
}

void __100__PPCollaborativeFilteringSampler_constructAndSendMessageForSamplingRate_shouldContinueBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPMaintenance: Enters favRequest completion block.", (uint8_t *)&v11, 2u);
  }

  if (v5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v5;
    v10 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to make WLKFavoritesRequest: %@", (uint8_t *)&v11, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
