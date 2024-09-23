@implementation PKAnalyticsReporter(PKIdentity)

+ (id)identityViewDidAppearReportEvent:()PKIdentity
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "releasedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v41 = 0;
  v39 = 0;
  PKISO180135AcceptedFieldsFromElements(v6, 0, &v41, &v40, &v39);
  v7 = v41;
  v8 = v40;
  v9 = v39;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "addObjectsFromArray:", v7);
  objc_msgSend(v10, "addObjectsFromArray:", v8);
  objc_msgSend(v10, "addObjectsFromArray:", v9);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "addObjectsFromArray:", v8);
  objc_msgSend(v11, "addObjectsFromArray:", v9);
  v12 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = *MEMORY[0x1E0D68C50];
  v14 = *MEMORY[0x1E0D68F50];
  v42[0] = *MEMORY[0x1E0D68AA0];
  v42[1] = v14;
  v15 = *MEMORY[0x1E0D68DF0];
  v43[0] = v13;
  v43[1] = v15;
  v42[2] = *MEMORY[0x1E0D69028];
  v43[2] = *MEMORY[0x1E0D68D28];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithDictionary:", v16);

  __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D68A10]);

  __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D68A18]);
  __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D68A08]);

  v21 = objc_msgSend(a1, "_maximumRetentionPeriodForElements:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D68A20]);

  objc_msgSend(v4, "releasedData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "application");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "client");

  v27 = (_QWORD *)MEMORY[0x1E0D68D20];
  v28 = (_QWORD *)MEMORY[0x1E0D68D30];
  if (v26 != 2)
    v28 = (_QWORD *)MEMORY[0x1E0D69618];
  if (v26 != 1)
    v27 = v28;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", *v27, *MEMORY[0x1E0D68D38]);
  objc_msgSend(v4, "transactionDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateIgnoringTime();
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v30, "timeIntervalSince1970");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%f"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D696A8]);

  objc_msgSend(v4, "merchant");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "displayName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D68E00]);

  objc_msgSend(v4, "merchant");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "merchantIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D68E20]);

  return v17;
}

+ (uint64_t)_maximumRetentionPeriodForElements:()PKIdentity
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "retentionPeriod") > v6)
          v6 = objc_msgSend(v9, "retentionPeriod");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
