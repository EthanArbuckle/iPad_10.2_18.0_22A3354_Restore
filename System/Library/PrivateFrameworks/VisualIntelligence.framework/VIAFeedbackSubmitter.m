@implementation VIAFeedbackSubmitter

- (VIAFeedbackSubmitter)initWithPARSession:(id)a3
{
  id v5;
  VIAFeedbackSubmitter *v6;
  VIAFeedbackSubmitter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIAFeedbackSubmitter;
  v6 = -[VIAFeedbackSubmitter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parSession, a3);

  return v7;
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v6;
  char isKindOfClass;
  VIAnalyticsTestingDelegate **p_testingDelegate;
  id WeakRetained;
  id v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  id v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  id v55;
  int64_t v56;
  id v57;
  __CFString *v58;
  __CFString *v59;
  id v60;
  uint64_t v61;
  id obj;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  const __CFString *v76;
  id v77;
  _BYTE v78[128];
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v6 && (isKindOfClass & 1) != 0)
    a4 = objc_msgSend(v6, "queryId");
  -[PARSession reportFeedback:queryId:](self->_parSession, "reportFeedback:queryId:", v6, a4);
  p_testingDelegate = &self->_testingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_testingDelegate);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_testingDelegate);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "timestamp");
    v14 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
    v17 = v16;
    if (v16)
    {
      v79 = CFSTR("viewAppearEvent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "viewAppearEvent"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v81 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v79, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_56:

      objc_msgSend(v10, "didLogEventName:queryID:timestamp:metadata:", v12, a4, v13, v19);
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v14;
    else
      v20 = 0;
    v21 = v20;
    v18 = v21;
    v61 = v13;
    if (v21)
    {
      -[__CFString suggestions](v21, "suggestions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (__CFString *)VICompactMapArray(v22, &__block_literal_global_1);

      -[__CFString suggestions](v18, "suggestions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (__CFString *)VICompactMapArray(v24, &__block_literal_global_27);

      v79 = CFSTR("identifierList");
      v80 = CFSTR("topicIdentifier");
      v81 = v23;
      v82 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v79, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v14;
      else
        v26 = 0;
      v27 = v26;
      if (v27)
      {
        v60 = v14;
        v59 = v27;
        -[__CFString suggestion](v27, "suggestion");
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v79 = CFSTR("identifier");
        -[__CFString identifier](v28, "identifier");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (id)v29;
        v31 = CFSTR("missing-identifier");
        if (v29)
          v31 = (const __CFString *)v29;
        v81 = v31;
        v80 = CFSTR("suggestion");
        v58 = v28;
        -[__CFString suggestion](v28, "suggestion");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v34 = CFSTR("missing-suggestion");
        if (v32)
          v34 = (const __CFString *)v32;
        v82 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v79, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v14;
        else
          v35 = 0;
        v25 = v35;
        if (!v25)
        {
          v23 = 0;
          v19 = (void *)MEMORY[0x1E0C9AA70];
          v18 = 0;
          goto LABEL_55;
        }
        v59 = 0;
        v60 = v14;
        v54 = v12;
        v55 = v10;
        v56 = a4;
        v57 = v6;
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v58 = v25;
        -[__CFString sections](v25, "sections");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, &v81, 16);
        if (v36)
        {
          v37 = v36;
          v63 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v73 != v63)
                objc_enumerationMutation(obj);
              v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              objc_msgSend(v39, "results", v54, v55, v56, v57);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, &v79, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v42; ++j)
                  {
                    if (*(_QWORD *)v69 != v43)
                      objc_enumerationMutation(v40);
                    objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "result");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "fbr");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v46)
                      objc_msgSend(v30, "addObject:", v46);

                  }
                  v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, &v79, 16);
                }
                while (v42);
              }

              v66 = 0u;
              v67 = 0u;
              v64 = 0u;
              v65 = 0u;
              objc_msgSend(v39, "section");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "results");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
              if (v49)
              {
                v50 = v49;
                v51 = *(_QWORD *)v65;
                do
                {
                  for (k = 0; k != v50; ++k)
                  {
                    if (*(_QWORD *)v65 != v51)
                      objc_enumerationMutation(v48);
                    objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "fbr");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v53)
                      objc_msgSend(v30, "addObject:", v53);

                  }
                  v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
                }
                while (v50);
              }

            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, &v81, 16);
          }
          while (v37);
        }

        v76 = CFSTR("feedbackResponseList");
        v77 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        a4 = v56;
        v6 = v57;
        v12 = v54;
        v10 = v55;
      }

      v17 = 0;
      v14 = v60;
      v18 = 0;
      v25 = v58;
      v23 = v59;
    }
LABEL_55:

    v13 = v61;
    goto LABEL_56;
  }
LABEL_57:

}

- (void)didHitCacheForQueryId:(unint64_t)a3
{
  VIAnalyticsTestingDelegate **p_testingDelegate;
  id WeakRetained;
  id v7;

  -[PARSession didSkipSearch:forInput:queryId:](self->_parSession, "didSkipSearch:forInput:queryId:", 4, 0, a3);
  p_testingDelegate = &self->_testingDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_testingDelegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_testingDelegate);
    objc_msgSend(v7, "didLogEventName:queryID:timestamp:metadata:", CFSTR("SFSkipSearchFeedback"), a3, mach_absolute_time(), MEMORY[0x1E0C9AA70]);

  }
}

- (PARSession)parSession
{
  return self->_parSession;
}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  return (VIAnalyticsTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_parSession, 0);
}

@end
