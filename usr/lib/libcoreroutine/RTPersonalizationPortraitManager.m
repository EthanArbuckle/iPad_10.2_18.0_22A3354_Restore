@implementation RTPersonalizationPortraitManager

- (RTPersonalizationPortraitManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTPersonalizationPortraitManager;
  return -[RTNotifier init](&v3, sel_init);
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, id, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id, id))a4;
  if (v6)
  {
    if (v5)
    {
      v7 = (void *)objc_opt_new();
      v8 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __79__RTPersonalizationPortraitManager__fetchRecentLocationDonationsSince_handler___block_invoke;
      v15[3] = &unk_1E929D780;
      v11 = v7;
      objc_msgSend(v8, "iterRecentLocationDonationsSinceDate:client:error:block:", v5, v10, &v17, v15);
      v12 = v17;

      v6[2](v6, v11, v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("requires a valid date.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v8);
    }

  }
}

void __79__RTPersonalizationPortraitManager__fetchRecentLocationDonationsSince_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  RTConnectionsLocation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RTConnectionsLocation *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "createdAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v21, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v21, "longitude");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v21, "latitude");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
      objc_msgSend(v21, "longitude");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v7 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:horizontalUncertainty:date:", v6, v12, v14, 1.0);

    }
    else
    {
      v7 = 0;
    }
  }
  v15 = [RTConnectionsLocation alloc];
  objc_msgSend(v21, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "originatingBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fullFormattedAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mapItemURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[RTConnectionsLocation initWithLocation:name:originatingBundleID:fullFormattedAddress:mapItemURL:createdAt:](v15, "initWithLocation:name:originatingBundleID:fullFormattedAddress:mapItemURL:createdAt:", v7, v16, v17, v18, v19, v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);
}

- (void)fetchRecentLocationDonationsSince:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTPersonalizationPortraitManager_fetchRecentLocationDonationsSince_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __78__RTPersonalizationPortraitManager_fetchRecentLocationDonationsSince_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRecentLocationDonationsSince:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchLocationNamesStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(v11, block);

    v12 = v14;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPersonalizationPortraitManager fetchLocationNamesStartDate:endDate:handler:]";
      v19 = 1024;
      v20 = 116;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  _RTMap *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v4, CFSTR("com.apple.Maps"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(&unk_1E932C760, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = objc_msgSend(&unk_1E932C760, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(&unk_1E932C760);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setLimit:", -1);
        objc_msgSend(v10, "setMatchCategory:", 1);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMatchingCategories:", v11);

        objc_msgSend(v10, "setExcludingSourceBundleIds:", v30);
        objc_msgSend(v10, "setFromDate:", a1[4]);
        objc_msgSend(v10, "setToDate:", a1[5]);
        v12 = (void *)objc_opt_new();
        v31 = 0;
        objc_msgSend(v12, "rankedNamedEntitiesWithQuery:error:", v10, &v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v31;

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filteredArrayUsingPredicate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "count");
        if (v20 >= 3)
          v21 = 3;
        else
          v21 = v20;
        objc_msgSend(v19, "subarrayWithRange:", 0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v22);
        -[_RTMap withBlock:](v23, "withBlock:", &__block_literal_global_25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "addObjectsFromArray:", v24);
        if (v14)
          objc_msgSend(v28, "addObject:", v14);

      }
      v6 = objc_msgSend(&unk_1E932C760, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }
  v25 = a1[6];
  _RTSafeArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v29, v27);

}

BOOL __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id __80__RTPersonalizationPortraitManager_fetchLocationNamesStartDate_endDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v2, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)feedbackUsedNamedEntities:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke;
    block[3] = &unk_1E92977B8;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__67;
  v9 = __Block_byref_object_dispose__67;
  v10 = (id)objc_opt_new();
  objc_msgSend((id)v6[5], "setClientIdentifier:", CFSTR("rt-lbl"));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B58]), "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:", *(_QWORD *)(a1 + 32), 0, 0, 0);
  v3 = (void *)v6[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke_29;
  v4[3] = &unk_1E929D828;
  v4[4] = &v5;
  objc_msgSend(v3, "registerFeedback:completion:", v2, v4);

  _Block_object_dispose(&v5, 8);
}

void __62__RTPersonalizationPortraitManager_feedbackUsedNamedEntities___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
