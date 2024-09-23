@implementation PPECRMessageTermCountsPlugin

- (PPECRMessageTermCountsPlugin)initWithMaxUniqueTokens:(unint64_t)a3
{
  PPECRMessageTermCountsPlugin *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPECRMessageTermCountsPlugin;
  v4 = -[PPECRMessageTermCountsPlugin init](&v9, sel_init);
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "enableECRMessageTokenCountsPlugin");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "registerMailConsumer:levelOfService:", v4, 1);
        objc_msgSend(v7, "registerMessagesConsumer:levelOfService:", v4, 1);
        v4->_maxUniqueTokens = a3;

      }
    }
  }
  return v4;
}

- (id)consumerName
{
  return CFSTR("com.apple.proactive.PersonalizationPortrait.ECRMessageTermCountsPlugin");
}

- (void)_sendEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "classLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PPECRMessageTermCountsPlugin__sendEvent___block_invoke;
  v10[3] = &unk_1E7E18E98;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v10);

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IntelligencePlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MessageTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v9);

}

- (id)consumeMailContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  PPECRMessageTermCountsPlugin *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  PPECRMessageTermCountsPlugin *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  PPECRMessageTermCountsPlugin *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v56 = v7;
    v57 = 2112;
    v58 = v8;
    v59 = 2112;
    v60 = (uint64_t)v4;
    v61 = 2117;
    v62 = (uint64_t)v9;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@", buf, 0x2Au);

  }
  objc_msgSend(v4, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v11 = objc_alloc(MEMORY[0x1E0D19E90]);
  objc_msgSend(v4, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentProtection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  objc_msgSend(v4, "htmlParser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithMailContentEvent:contentProtection:htmlParser:", v12, v13, v14);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "subject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPECRMessageTermCountsPlugin _updateUnigramCountsFromText:unigramCounts:totalTokenCount:](self, "_updateUnigramCountsFromText:unigramCounts:totalTokenCount:", v17, v16, &v54);

  v50 = v15;
  objc_msgSend(v15, "textContent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPECRMessageTermCountsPlugin _updateUnigramCountsFromText:unigramCounts:totalTokenCount:](self, "_updateUnigramCountsFromText:unigramCounts:totalTokenCount:", v18, v16, &v54);

  pp_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self;
    v24 = objc_msgSend(v16, "count");
    v25 = v54;
    objc_msgSend(v10, "uniqueId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v56 = v21;
    v57 = 2112;
    v58 = v22;
    v59 = 2048;
    v60 = v24;
    self = v23;
    v61 = 2048;
    v62 = v25;
    v63 = 2112;
    v64 = v26;
    _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ got %tu unique unigram counts from %lld tokens in %@", buf, 0x34u);

  }
  objc_msgSend(v10, "fromHandle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "toHandles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_pas_mappedArrayWithTransform:", &__block_literal_global_67_9873);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v29, "count");
    objc_msgSend(v10, "uniqueId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v56 = v33;
    v57 = 2112;
    v58 = v34;
    v59 = 2112;
    v60 = (uint64_t)v52;
    v61 = 2048;
    v62 = v35;
    v63 = 2112;
    v64 = v36;
    _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "%@: %@ extracted sender with id of %@ with %tu recipients in %@", buf, 0x34u);

    self = v32;
  }

  -[PPECRMessageTermCountsPlugin generateTermCountsFromUnigramCounts:](self, "generateTermCountsFromUnigramCounts:", v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc(MEMORY[0x1E0D02050]);
  v39 = *MEMORY[0x1E0D70E18];
  objc_msgSend(v10, "domainId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueId");
  v41 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v10, "absoluteTimestamp");
  v44 = (void *)objc_msgSend(v43, "initWithTimeIntervalSinceReferenceDate:");
  v45 = (void *)objc_msgSend(v38, "initWithProtoVersion:bundleID:domain:spotlightIdentifier:timestamp:sender:recipients:termCount:", 0, v39, v40, v42, v44, v52, v29, v37);

  -[PPECRMessageTermCountsPlugin _sendEvent:](v41, "_sendEvent:", v45);
  v46 = (void *)MEMORY[0x1E0D80F78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "successWithNumberOfExtractions:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  PPECRMessageTermCountsPlugin *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  PPECRMessageTermCountsPlugin *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  PPECRMessageTermCountsPlugin *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v54 = v8;
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = (uint64_t)v5;
    v59 = 2117;
    v60 = (uint64_t)v10;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@", buf, 0x2Au);

  }
  v51 = v5;
  objc_msgSend(v5, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPECRMessageTermCountsPlugin _updateUnigramCountsFromText:unigramCounts:totalTokenCount:](self, "_updateUnigramCountsFromText:unigramCounts:totalTokenCount:", v13, v12, &v52);

  pp_default_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self;
    v19 = objc_msgSend(v12, "count");
    v20 = v52;
    objc_msgSend(v11, "uniqueId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v54 = v16;
    v55 = 2112;
    v56 = v17;
    v57 = 2048;
    v58 = v19;
    self = v18;
    v59 = 2048;
    v60 = v20;
    v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ got %tu unique unigram counts from %lld tokens in %@", buf, 0x34u);

  }
  objc_msgSend(v11, "fromHandle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contactIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "toHandles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_pas_mappedArrayWithTransform:", &__block_literal_global_72_9865);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = self;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v25, "count");
    objc_msgSend(v11, "uniqueId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v54 = v29;
    v55 = 2112;
    v56 = v30;
    v57 = 2112;
    v58 = v23;
    v59 = 2048;
    v60 = v31;
    v61 = 2112;
    v62 = v32;
    _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ extracted sender with id of %@ with %tu recipients in %@", buf, 0x34u);

    self = v28;
  }

  -[PPECRMessageTermCountsPlugin generateTermCountsFromUnigramCounts:](self, "generateTermCountsFromUnigramCounts:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc(MEMORY[0x1E0D02050]);
  v35 = *MEMORY[0x1E0D70E28];
  objc_msgSend(v11, "domainId");
  v36 = self;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc(MEMORY[0x1E0C99D68]);
  v40 = v11;
  v50 = v11;
  v41 = v12;
  v42 = (void *)v23;
  v43 = v39;
  objc_msgSend(v40, "absoluteTimestamp");
  v44 = (void *)objc_msgSend(v43, "initWithTimeIntervalSinceReferenceDate:");
  v45 = (void *)objc_msgSend(v34, "initWithProtoVersion:bundleID:domain:spotlightIdentifier:timestamp:sender:recipients:termCount:", 0, v35, v37, v38, v44, v42, v25, v33);

  -[PPECRMessageTermCountsPlugin _sendEvent:](v36, "_sendEvent:", v45);
  v46 = (void *)MEMORY[0x1E0D80F78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "successWithNumberOfExtractions:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)generateTermCountsFromUnigramCounts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PPECRMessageTermCountsPlugin_generateTermCountsFromUnigramCounts___block_invoke;
  v10[3] = &unk_1E7E18E48;
  v11 = v3;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  PPECRMessageTermCountsPlugin *v12;
  SEL v13;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "classLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v10[3] = &unk_1E7E18FE8;
  v11 = v5;
  v12 = self;
  v13 = a2;
  v7 = v5;
  objc_msgSend(v6, "runWithLockAcquired:", v10);

  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_deleteEventsMatchingTest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IntelligencePlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MessageTerms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPECRMessageTermCountsPlugin classLock](PPECRMessageTermCountsPlugin, "classLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke;
  v10[3] = &unk_1E7E19038;
  v11 = v6;
  v12 = v3;
  v8 = v3;
  v9 = v6;
  objc_msgSend(v7, "runWithLockAcquired:", v10);

}

- (void)_updateUnigramCountsFromText:(id)a3 unigramCounts:(id)a4 totalTokenCount:(unint64_t *)a5
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t maxUniqueTokens;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  PPECRMessageTermCountsPlugin *v26;
  unint64_t *v27;
  SEL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "length"))
  {
    v11 = (void *)MEMORY[0x1E0D19EA0];
    v12 = objc_msgSend(v9, "length");
    if (v12 >= 0xC8000)
      v13 = 819200;
    else
      v13 = v12;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __91__PPECRMessageTermCountsPlugin__updateUnigramCountsFromText_unigramCounts_totalTokenCount___block_invoke;
    v24 = &unk_1E7E19060;
    v14 = v10;
    v25 = v14;
    v26 = self;
    v27 = a5;
    v28 = a2;
    objc_msgSend(v11, "enumerateTokensInString:withRange:block:", v9, 0, v13, &v21);
    if (objc_msgSend(v14, "count", v21, v22, v23, v24) > self->_maxUniqueTokens)
    {
      pp_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v14, "count");
        maxUniqueTokens = self->_maxUniqueTokens;
        *(_DWORD *)buf = 138413058;
        v30 = v17;
        v31 = 2112;
        v32 = v18;
        v33 = 2048;
        v34 = v19;
        v35 = 2048;
        v36 = maxUniqueTokens;
        _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_INFO, "%@: %@ pruning unique unigram counts from %tu to %llu before writing to Biome", buf, 0x2Au);

      }
      +[PPECRMessageTermCountsPlugin reduceUnigramCountSetSizeIfNeeded:maxUniqueTokens:](PPECRMessageTermCountsPlugin, "reduceUnigramCountSetSizeIfNeeded:maxUniqueTokens:", v14, self->_maxUniqueTokens);
    }

  }
}

void __91__PPECRMessageTermCountsPlugin__updateUnigramCountsFromText_unigramCounts_totalTokenCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  _PASRemoveCharacterSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "localizedLowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    ++**(_QWORD **)(a1 + 48);
    if (objc_msgSend(*(id *)(a1 + 32), "count") > (unint64_t)(3 * *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)))
    {
      pp_default_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = objc_msgSend(*(id *)(a1 + 32), "count");
        v12 = 138413058;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        v16 = 2048;
        v17 = v10;
        v18 = 2048;
        v19 = v11;
        _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ exceeded 3x max unique unigram count of %llu: %tu unique tokens -- pruning", (uint8_t *)&v12, 0x2Au);

      }
      +[PPECRMessageTermCountsPlugin reduceUnigramCountSetSizeIfNeeded:maxUniqueTokens:](PPECRMessageTermCountsPlugin, "reduceUnigramCountSetSizeIfNeeded:maxUniqueTokens:", *(_QWORD *)(a1 + 32), (unint64_t)((double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 8) * 1.5));
    }

  }
}

void __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  v4 = (void *)v3[1];
  v3[1] = 0;

  v6 = 2 * v3[2];
  if (v6 <= 0x80)
    v6 = 128;
  if (v6 >= 0x342A2)
    v7 = 213666;
  else
    v7 = v6;
  LODWORD(v5) = 1008981770;
  objc_msgSend(MEMORY[0x1E0D81538], "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "pruner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke_2;
  v14[3] = &unk_1E7E19010;
  v16 = *(id *)(a1 + 40);
  v10 = v8;
  v15 = v10;
  v17 = &v18;
  objc_msgSend(v9, "deleteEventsPassingTest:", v14);

  v11 = v19[3];
  if (!v11 || v11 < v7 >> 2)
  {

    v10 = 0;
    v11 = v19[3];
  }
  v12 = (void *)v3[1];
  v3[1] = v10;
  v3[2] = v11;
  v13 = v10;

  _Block_object_dispose(&v18, 8);
}

uint64_t __58__PPECRMessageTermCountsPlugin__deleteEventsMatchingTest___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = (*(uint64_t (**)(void))(a1[5] + 16))();
  objc_autoreleasePoolPop(v6);
  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1C3BD6630]();
    v9 = (void *)MEMORY[0x1E0D80FC0];
    objc_msgSend(v5, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:", v10, v11, v12, a1[4]);

    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  if (v4 && (objc_msgSend(*(id *)(a1 + 32), "matchesBloomFilter:", v4) & 1) == 0)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412803;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2113;
      v22 = v11;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "%@: deletion in bundle id %@ (%{private}@) bypassed by bloom filter!", buf, 0x20u);

    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_76;
    v14[3] = &unk_1E7E18F48;
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v6;
    v12[5] = v6;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
    v13[3] = &unk_1E7E18F98;
    v13[4] = v15;
    v13[5] = v6;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_82;
    v12[3] = &unk_1E7E18FC0;
    v12[4] = v15;
    objc_msgSend(v5, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v14, v13, v12);
  }

}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@", buf, 0x20u);

  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_77;
  v10[3] = &unk_1E7E18F20;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "_deleteEventsMatchingTest:", v10);

}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 2113;
    v24 = v6;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@ domain selection %{private}@", buf, 0x2Au);

  }
  v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_80;
  v14[3] = &unk_1E7E18F70;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "_deleteEventsMatchingTest:", v14);

}

void __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 2113;
    v24 = v6;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ deletion requested for bundle id %@ unique identifiers %{private}@", buf, 0x2Au);

  }
  v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_83;
  v14[3] = &unk_1E7E18F70;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "_deleteEventsMatchingTest:", v14);

}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "spotlightIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsDomain:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __76__PPECRMessageTermCountsPlugin_deleteDataDerivedFromContentMatchingRequest___block_invoke_77(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __68__PPECRMessageTermCountsPlugin_generateTermCountsFromUnigramCounts___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0D02060];
  v4 = a2;
  v9 = (id)objc_msgSend([v3 alloc], "initWithTermType:termString:termID:", 1, v4, 0);
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v6 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v4);

  v7 = (void *)objc_msgSend(v5, "initWithUnsignedInteger:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02058]), "initWithTerm:termCount:", v9, v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __66__PPECRMessageTermCountsPlugin_consumeMessagesContentWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

uint64_t __62__PPECRMessageTermCountsPlugin_consumeMailContentWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handle");
}

void __43__PPECRMessageTermCountsPlugin__sendEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  v8 = a2;
  v3 = v8[1];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D80FC0];
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "spotlightIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDeletableContentWithBundleIdentifier:domainIdentifier:uniqueIdentifier:toBloomFilter:", v5, v6, v7, v3);

  }
  v8[2] = (char *)v8[2] + 1;

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_9890 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_9890, &__block_literal_global_9891);
  return (id)sharedInstance__pasExprOnceResult_9892;
}

+ (id)classLock
{
  if (classLock__pasOnceToken3 != -1)
    dispatch_once(&classLock__pasOnceToken3, &__block_literal_global_53_9887);
  return (id)classLock__pasExprOnceResult;
}

+ (void)reduceUnigramCountSetSizeIfNeeded:(id)a3 maxUniqueTokens:(unint64_t)a4
{
  id v5;
  PPEvictingMaxTokenCountPriorityQueue *v6;
  uint64_t v7;
  id v8;
  PPEvictingMaxTokenCountPriorityQueue *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  PPEvictingMaxTokenCountPriorityQueue *v14;

  v5 = a3;
  if (objc_msgSend(v5, "count") > a4)
  {
    v6 = -[PPEvictingMaxTokenCountPriorityQueue initWithCapacity:]([PPEvictingMaxTokenCountPriorityQueue alloc], "initWithCapacity:", objc_msgSend(v5, "count") - a4);
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke;
    v12[3] = &unk_1E7E18E48;
    v8 = v5;
    v13 = v8;
    v14 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke_2;
    v10[3] = &unk_1E7E18E70;
    v11 = v8;
    -[PPEvictingMaxTokenCountPriorityQueue enumerateTokenCountsUsingBlock:](v9, "enumerateTokenCountsUsingBlock:", v10);

  }
}

void __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PPTokenCount *v4;

  v3 = a2;
  v4 = -[PPTokenCount initWithToken:count:]([PPTokenCount alloc], "initWithToken:count:", v3, objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __82__PPECRMessageTermCountsPlugin_reduceUnigramCountSetSizeIfNeeded_maxUniqueTokens___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    v3 = 0;
    do
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v6, "token");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObject:", v5);

      ++v3;
    }
    while (v3 < objc_msgSend(v6, "count"));
  }

}

void __41__PPECRMessageTermCountsPlugin_classLock__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)classLock__pasExprOnceResult;
  classLock__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __46__PPECRMessageTermCountsPlugin_sharedInstance__block_invoke()
{
  void *v0;
  PPECRMessageTermCountsPlugin *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = [PPECRMessageTermCountsPlugin alloc];
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PPECRMessageTermCountsPlugin initWithMaxUniqueTokens:](v1, "initWithMaxUniqueTokens:", objc_msgSend(v2, "maxUniqueTokensInECRTokenCounts"));
  v4 = (void *)sharedInstance__pasExprOnceResult_9892;
  sharedInstance__pasExprOnceResult_9892 = v3;

  objc_autoreleasePoolPop(v0);
}

@end
