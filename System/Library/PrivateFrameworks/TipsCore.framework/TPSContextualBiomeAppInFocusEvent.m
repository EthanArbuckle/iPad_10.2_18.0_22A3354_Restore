@implementation TPSContextualBiomeAppInFocusEvent

+ (id)observationDateFromEvent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)publisherFromStartTime:(double)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D026F0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, v5, 0, 0, 0);

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "App");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "InFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publisherWithOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterHandler
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[TPSContextualBiomeAppInFocusEvent _filteringPredicate](self, "_filteringPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__TPSContextualBiomeAppInFocusEvent_filterHandler__block_invoke;
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

uint64_t __50__TPSContextualBiomeAppInFocusEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v20.receiver = self;
  v20.super_class = (Class)TPSContextualBiomeAppInFocusEvent;
  -[TPSContextualBiomeEvent filterParametersForBiomeQuery](&v20, sel_filterParametersForBiomeQuery);
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
  objc_msgSend(v10, "TPSSafeObjectForKey:", CFSTR("launchReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "TPSSafeStringForKey:", CFSTR("launchReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("launchReason"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "TPSSafeUIntegerForKey:", CFSTR("launchType"));

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "TPSSafeIntForKey:", CFSTR("launchType")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("launchType"));

  }
  v19 = (void *)objc_msgSend(v9, "copy");

  return v19;
}

- (id)_filteringPredicate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  int v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  char v39;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "TPSSafeObjectForKey:", CFSTR("isStarting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "TPSSafeBoolForKey:", CFSTR("isStarting"));

    v38[0] = v7;
    v38[1] = 3221225472;
    v38[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke;
    v38[3] = &__block_descriptor_33_e39_B24__0__BMAppInFocus_8__NSDictionary_16l;
    v39 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "TPSSafeObjectForKey:", CFSTR("bundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "TPSSafeStringForKey:", CFSTR("bundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3880];
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_2;
    v36[3] = &unk_1E395BAD0;
    v37 = v14;
    v16 = v14;
    objc_msgSend(v15, "predicateWithBlock:", v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "TPSSafeObjectForKey:", CFSTR("launchReason"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "TPSSafeStringForKey:", CFSTR("launchReason"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3880];
    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_3;
    v34[3] = &unk_1E395BAD0;
    v35 = v21;
    v23 = v21;
    objc_msgSend(v22, "predicateWithBlock:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "TPSSafeObjectForKey:", CFSTR("launchType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "TPSSafeIntForKey:", CFSTR("launchType"));

    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_4;
    v32[3] = &__block_descriptor_36_e39_B24__0__BMAppInFocus_8__NSDictionary_16l;
    v33 = v28;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

BOOL __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "starting");
}

uint64_t __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "launchReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_DWORD *)(a1 + 32);
}

@end
