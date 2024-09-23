@implementation PPSpotlightScoring

- (PPSpotlightScoring)initWithTopicStore:(id)a3
{
  id v5;
  PPSpotlightScoring *v6;
  PPSpotlightScoring *v7;
  PPTopicStore *topicStore;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  PPSpotlightScoring *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPSpotlightScoring;
  v6 = -[PPSpotlightScoring init](&v20, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  objc_storeStrong((id *)&v6->_topicStore, a3);
  topicStore = v7->_topicStore;
  v19 = 0;
  -[PPTopicStore topicCacheSandboxExtensionToken:](topicStore, "topicCacheSandboxExtensionToken:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (!v9)
  {
    pp_universal_search_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    v15 = "PPSpotlightScoring was unable to get the sandbox extension: %@";
    v16 = v14;
    v17 = 12;
LABEL_12:
    _os_log_error_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_9;
  }
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "cStringUsingEncoding:", 4);
  v12 = sandbox_extension_consume();
  if (v12 == -1)
  {
    pp_universal_search_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "PPSpotlightScoring was unable to consume the sandbox extension";
    v16 = v14;
    v17 = 2;
    goto LABEL_12;
  }
  v7->_sandboxExtensionHandle = v12;

LABEL_5:
  v13 = v7;
LABEL_10:

  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (sandbox_extension_release() == -1)
  {
    pp_universal_search_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18BE3A000, v3, OS_LOG_TYPE_ERROR, "PPSpotlightScoring was unable to release the sandbox extension", buf, 2u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)PPSpotlightScoring;
  -[PPSpotlightScoring dealloc](&v4, sel_dealloc);
}

- (id)spotlightQueryScore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t *v29;
  uint8_t *v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  double v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PPTopicStore cachedTopicScores](self->_topicStore, "cachedTopicScores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = CFSTR("Topic stored did not return scores");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 1, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    pp_universal_search_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)v35 = 0;
    v19 = "Topic stored did not return scores while computing score for spotlight";
    goto LABEL_19;
  }
  if (!v6)
  {
    pp_universal_search_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v16 = 0;
      goto LABEL_17;
    }
    *(_WORD *)v35 = 0;
    v19 = "PPSpotlightScoring: nil spotlightQueryScore for item with nil attributes";
LABEL_19:
    _os_log_error_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_ERROR, v19, v35, 2u);
    goto LABEL_12;
  }
  objc_msgSend(v6, "portraitFeatureVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portraitFeatureVectorVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSpotlightScoringFeatureVector decodeFeatureVectorFromData:version:](PPSpotlightScoringFeatureVector, "decodeFeatureVectorFromData:version:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "qidStrings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  *(_QWORD *)v35 = 0;
  v36 = v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __48__PPSpotlightScoring_spotlightQueryScore_error___block_invoke;
  v26 = &unk_1E226BB30;
  v29 = &v31;
  v13 = v10;
  v27 = v13;
  v30 = v35;
  v28 = v7;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", &v23);
  v14 = sqrt((double)v12) * sqrt(v32[3]);
  if (v14 == 0.0)
  {
    pp_universal_search_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of 0 due to empty portrait", buf, 2u);
    }

    v16 = &unk_1E22845A0;
  }
  else
  {
    v20 = *((double *)v36 + 3) / v14;
    pp_universal_search_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v40 = v20;
      _os_log_debug_impl(&dword_18BE3A000, v21, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of %f", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20, v23, v24, v25, v26, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
LABEL_17:

  return v16;
}

- (BOOL)refreshSpotlightScoringCacheWithError:(id *)a3
{
  return -[PPTopicStore computeAndCacheTopicScores:](self->_topicStore, "computeAndCacheTopicScores:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicStore, 0);
}

void __48__PPSpotlightScoring_spotlightQueryScore_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v7 * v9;
  objc_msgSend(*(id *)(a1 + 32), "qidStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v14);

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);

  }
}

+ (id)defaultInstance
{
  void *v2;
  PPSpotlightScoring *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  __int16 v10;
  uint8_t buf[2];

  pthread_mutex_lock(&defaultInstance_lock);
  if (!defaultInstance_instance)
  {
    v2 = (void *)objc_opt_new();
    if (v2)
    {
      v3 = -[PPSpotlightScoring initWithTopicStore:]([PPSpotlightScoring alloc], "initWithTopicStore:", v2);
      v4 = (void *)defaultInstance_instance;
      defaultInstance_instance = (uint64_t)v3;

      if (defaultInstance_instance)
      {
LABEL_8:

        goto LABEL_9;
      }
      pp_universal_search_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10 = 0;
        v6 = "PPSpotlightScoring defaultInstance did not initialize.";
        v7 = (uint8_t *)&v10;
LABEL_11:
        _os_log_error_impl(&dword_18BE3A000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      }
    }
    else
    {
      pp_universal_search_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v6 = "PPTopicStore gave nil, bailing on PPSpotlightScoring initialization.";
        v7 = buf;
        goto LABEL_11;
      }
    }

    goto LABEL_8;
  }
LABEL_9:
  v8 = (id)defaultInstance_instance;
  pthread_mutex_unlock(&defaultInstance_lock);
  return v8;
}

@end
