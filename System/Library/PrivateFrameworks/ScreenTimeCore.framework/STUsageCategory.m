@implementation STUsageCategory

+ (id)categoryItemsExcludingSystemCategories:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  STUsageDetailItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(v20, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    v8 = *MEMORY[0x1E0D0D4C8];
    v9 = *MEMORY[0x1E0D0D4B8];
    v10 = *MEMORY[0x1E0D0D4D8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", v8) & 1) == 0
          && (objc_msgSend(v12, "isEqualToString:", v9) & 1) == 0
          && (objc_msgSend(v12, "isEqualToString:", v10) & 1) == 0)
        {
          v13 = -[STUsageDetailItem initWithType:identifier:usageTrusted:]([STUsageDetailItem alloc], "initWithType:identifier:usageTrusted:", 3, v12, 1);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "filteredArrayUsingPredicate:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "valueForKeyPath:", CFSTR("@sum.totalTimeInSeconds"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          -[STUsageDetailItem setQuantity:](v13, "setQuantity:");

          objc_msgSend(v19, "addObject:", v13);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(v19, "copy");
  return v17;
}

+ (id)applicationAndWebItemsExcludingSystemHiddenApplications:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  id v17;
  STUsageDetailItem *v18;
  STUsageDetailItem *v19;
  STUsageDetailItem *v20;
  float v21;
  double v22;
  void *v23;
  float v24;
  id v25;
  STUsageDetailItem *v26;
  float v27;
  double v28;
  STUsageDetailItem *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  STUsageDetailItem *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v48 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D0D510], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v3;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v56;
    v6 = 0x1E936F000uLL;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(obj);
        v46 = v7;
        v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v8, "timedItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v50)
        {
          v49 = *(_QWORD *)v52;
          v47 = v9;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v52 != v49)
                objc_enumerationMutation(v9);
              v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(v11, "bundleIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v11, "usageTrusted");
              if (v12 && (objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
              {
                v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 3504)), "initWithIdentifier:usageTrusted:", v12, v13);
                v24 = (float)objc_msgSend(v11, "totalTimeInSeconds");
                v25 = v23;
                v17 = v48;
                objc_msgSend(v17, "objectForKeyedSubscript:", v25);
                v26 = (STUsageDetailItem *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v18 = v26;
                  -[STUsageDetailItem quantity](v26, "quantity");
                  *(float *)&v28 = v27 + v24;
                  -[STUsageDetailItem setQuantity:](v18, "setQuantity:", v28);
                }
                else
                {
                  v35 = [STUsageDetailItem alloc];
                  objc_msgSend(v25, "identifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v35, "initWithType:identifier:usageTrusted:", 1, v36, objc_msgSend(v25, "usageTrusted"));

                  *(float *)&v37 = v24;
                  -[STUsageDetailItem setQuantity:](v18, "setQuantity:", v37);
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v25);
                }
                v14 = v25;
              }
              else
              {
                objc_msgSend(v11, "domain");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v14)
                  goto LABEL_23;
                v15 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 3504)), "initWithIdentifier:usageTrusted:", v14, v13);
                v16 = (float)objc_msgSend(v11, "totalTimeInSeconds");
                v17 = v15;
                v18 = v4;
                -[STUsageDetailItem objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v17);
                v19 = (STUsageDetailItem *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v20 = v19;
                  -[STUsageDetailItem quantity](v19, "quantity");
                  *(float *)&v22 = v21 + v16;
                  -[STUsageDetailItem setQuantity:](v20, "setQuantity:", v22);
                }
                else
                {
                  v29 = [STUsageDetailItem alloc];
                  objc_msgSend(v17, "identifier");
                  v30 = v6;
                  v31 = v5;
                  v32 = v4;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v29, "initWithType:identifier:usageTrusted:", 2, v33, objc_msgSend(v17, "usageTrusted"));

                  v4 = v32;
                  v5 = v31;
                  v6 = v30;
                  v9 = v47;
                  *(float *)&v34 = v16;
                  -[STUsageDetailItem setQuantity:](v20, "setQuantity:", v34);
                  -[STUsageDetailItem setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, v17);
                }

                v25 = v17;
              }

LABEL_23:
            }
            v50 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v50);
        }

        v7 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v45);
  }

  objc_msgSend(v48, "allValues");
  v38 = v4;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

@end
