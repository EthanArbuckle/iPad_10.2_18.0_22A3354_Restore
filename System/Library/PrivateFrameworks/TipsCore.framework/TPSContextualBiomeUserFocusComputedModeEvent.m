@implementation TPSContextualBiomeUserFocusComputedModeEvent

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D027B8], "userFocusComputedMode");
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

  -[TPSContextualBiomeUserFocusComputedModeEvent _filteringPredicate](self, "_filteringPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__TPSContextualBiomeUserFocusComputedModeEvent_filterHandler__block_invoke;
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

uint64_t __61__TPSContextualBiomeUserFocusComputedModeEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
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
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v30.receiver = self;
  v30.super_class = (Class)TPSContextualBiomeUserFocusComputedModeEvent;
  -[TPSContextualBiomeEvent filterParametersForBiomeQuery](&v30, sel_filterParametersForBiomeQuery);
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
  objc_msgSend(v10, "TPSSafeObjectForKey:", CFSTR("modeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "TPSSafeStringForKey:", CFSTR("modeIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("modeIdentifier"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "TPSSafeObjectForKey:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "TPSSafeIntForKey:", CFSTR("type")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("type"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "TPSSafeObjectForKey:", CFSTR("updateReason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "TPSSafeUIntegerForKey:", CFSTR("updateReason")));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("type"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "TPSSafeObjectForKey:", CFSTR("updateSource"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithInteger:", (int)objc_msgSend(v27, "TPSSafeIntForKey:", CFSTR("updateSource")));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("updateSource"));

  }
  v29 = (void *)objc_msgSend(v9, "copy");

  return v29;
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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  char v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "TPSSafeStringForKey:", CFSTR("modeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke;
    v37[3] = &unk_1E395BFE0;
    v38 = v6;
    objc_msgSend(v8, "predicateWithBlock:", v37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "TPSSafeObjectForKey:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "TPSSafeIntegerForKey:", CFSTR("type"));

    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_2;
    v36[3] = &__block_descriptor_40_e55_B24__0__BMUserFocusComputedModeEvent_8__NSDictionary_16l;
    v36[4] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "TPSSafeObjectForKey:", CFSTR("updateReason"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "TPSSafeUIntegerForKey:", CFSTR("updateReason"));

    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_3;
    v35[3] = &__block_descriptor_40_e55_B24__0__BMUserFocusComputedModeEvent_8__NSDictionary_16l;
    v35[4] = v18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "TPSSafeObjectForKey:", CFSTR("updateSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "TPSSafeIntegerForKey:", CFSTR("updateSource"));

    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_4;
    v34[3] = &__block_descriptor_40_e55_B24__0__BMUserFocusComputedModeEvent_8__NSDictionary_16l;
    v34[4] = v23;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "TPSSafeObjectForKey:", CFSTR("isStarting"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "TPSSafeBoolForKey:", CFSTR("isStarting"));

    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_5;
    v32[3] = &__block_descriptor_33_e55_B24__0__BMUserFocusComputedModeEvent_8__NSDictionary_16l;
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

uint64_t __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "semanticModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeSemanticType") == *(_QWORD *)(a1 + 32);
}

BOOL __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeUpdateReason") == *(_QWORD *)(a1 + 32);
}

BOOL __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeUpdateSource") == *(_QWORD *)(a1 + 32);
}

BOOL __67__TPSContextualBiomeUserFocusComputedModeEvent__filteringPredicate__block_invoke_5(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "isStarting");
}

@end
