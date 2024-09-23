@implementation TPSContextualBiomeDiscoverabilitySignalsEvent

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Discoverability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Signals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D026F0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v7, v9, 0, 0, 0);

  objc_msgSend(v6, "publisherWithUseCase:options:", CFSTR("FeatureDiscoverability"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)filterHandler
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[TPSContextualBiomeDiscoverabilitySignalsEvent _filteringPredicate](self, "_filteringPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__TPSContextualBiomeDiscoverabilitySignalsEvent_filterHandler__block_invoke;
    aBlock[3] = &unk_1E395B858;
    v7 = v2;
    v4 = _Block_copy(aBlock);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __62__TPSContextualBiomeDiscoverabilitySignalsEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)filterParametersForBiomeQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v27.receiver = self;
  v27.super_class = (Class)TPSContextualBiomeDiscoverabilitySignalsEvent;
  -[TPSContextualBiomeEvent filterParametersForBiomeQuery](&v27, sel_filterParametersForBiomeQuery);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v9 = v7;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "TPSSafeObjectForKey:", CFSTR("contentIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "TPSSafeStringForKey:", CFSTR("contentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("contentIdentifier"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "TPSSafeObjectForKey:", CFSTR("context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "TPSSafeStringForKey:", CFSTR("context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("context"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "TPSSafeObjectForKey:", CFSTR("osBuild"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "TPSSafeStringForKey:", CFSTR("osBuild"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("osBuild"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "TPSSafeDictionaryForKey:", CFSTR("userInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "TPSSafeDictionaryForKey:", CFSTR("userInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("userInfo"));

  }
  v26 = (void *)objc_msgSend(v9, "copy");

  return v26;
}

- (id)_filteringPredicate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  BOOL (*v38)(uint64_t, void *, void *);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "TPSSafeObjectForKey:", CFSTR("contentIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("contentIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3880];
    v45[0] = v7;
    v45[1] = 3221225472;
    v45[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke;
    v45[3] = &unk_1E395BE28;
    v46 = v9;
    v11 = v9;
    objc_msgSend(v10, "predicateWithBlock:", v45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "TPSSafeObjectForKey:", CFSTR("context"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "TPSSafeStringForKey:", CFSTR("context"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3880];
    v43[0] = v7;
    v43[1] = 3221225472;
    v43[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_2;
    v43[3] = &unk_1E395BE28;
    v44 = v16;
    v18 = v16;
    objc_msgSend(v17, "predicateWithBlock:", v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "TPSSafeObjectForKey:", CFSTR("context"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "TPSSafeStringForKey:", CFSTR("osBuild"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB3880];
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_3;
    v41[3] = &unk_1E395BE28;
    v42 = v23;
    v25 = v23;
    objc_msgSend(v24, "predicateWithBlock:", v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "TPSSafeDictionaryForKey:", CFSTR("userInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "TPSSafeDictionaryForKey:", CFSTR("userInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB3880];
    v36 = v7;
    v37 = 3221225472;
    v38 = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4;
    v39 = &unk_1E395BE28;
    v40 = v30;
    v32 = v30;
    objc_msgSend(v31, "predicateWithBlock:", &v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v33, v36, v37, v38, v39);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "osBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL8 v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  id v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (!*(_QWORD *)(a1 + 32))
  {
    v14 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v11 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_5;
    v16[3] = &unk_1E395BE50;
    v12 = v9;
    v17 = v12;
    v18 = &v19;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (v10)
    {
      +[TPSLogger default](TPSLogger, "default");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4_cold_1((uint64_t)v10, v13);

    }
    v14 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v14 = 0;
  }

LABEL_12:
  return v14;
}

void __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_5(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;

  v20 = a2;
  v7 = a3;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v12 = v20;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v12 = v20;
  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_isKindOfClass();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if ((v17 & 1) != 0)
      v19 = objc_msgSend(v18, "containsObject:", v7);
    else
      v19 = objc_msgSend(v7, "isEqual:", v18);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObjectCommonWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14 != 0;

LABEL_9:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

void __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A906000, a2, OS_LOG_TYPE_ERROR, "Failed to parse userInfoDictionary. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
