@implementation TPSContextualBiomeAppLaunchEvent

+ (id)observationDateFromEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D027B8], "appLaunch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisherFromStartTime:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filterHandler
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[TPSContextualBiomeAppLaunchEvent _filteringPredicate](self, "_filteringPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__TPSContextualBiomeAppLaunchEvent_filterHandler__block_invoke;
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

uint64_t __49__TPSContextualBiomeAppLaunchEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
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
  v20.super_class = (Class)TPSContextualBiomeAppLaunchEvent;
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
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  char v38;

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

    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke;
    v37[3] = &__block_descriptor_33_e43_B24__0__BMAppLaunchEvent_8__NSDictionary_16l;
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v37);
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
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_2;
    v35[3] = &unk_1E395D538;
    v36 = v14;
    v16 = v14;
    objc_msgSend(v15, "predicateWithBlock:", v35);
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
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_3;
    v33[3] = &unk_1E395D538;
    v34 = v21;
    v23 = v21;
    objc_msgSend(v22, "predicateWithBlock:", v33);
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
    v28 = objc_msgSend(v27, "TPSSafeUIntegerForKey:", CFSTR("launchType"));

    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_4;
    v32[3] = &__block_descriptor_40_e43_B24__0__BMAppLaunchEvent_8__NSDictionary_16l;
    v32[4] = v28;
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

BOOL __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "isStarting");
}

uint64_t __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "launchReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __55__TPSContextualBiomeAppLaunchEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "launchType") == *(_QWORD *)(a1 + 32);
}

@end
