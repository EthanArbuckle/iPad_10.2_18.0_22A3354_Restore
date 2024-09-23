@implementation STUsageCountedItem

+ (id)notificationItemsExcludingSystemHiddenApplications:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  int v16;
  float v17;
  STUsageTrustIdentifier *v18;
  id v19;
  STUsageDetailItem *v20;
  STUsageDetailItem *v21;
  float v22;
  double v23;
  STUsageDetailItem *v24;
  void *v25;
  double v26;
  void *v27;
  void *v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0D0D510], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v29 = v4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "numberOfNotifications", v29);
        objc_msgSend(v11, "bundleIdentifier");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v12 >= 1
          && (objc_msgSend(v5, "containsObject:", v13) & 1) == 0
          && (-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("_SYSTEM_CENTER_:")) & 1) == 0
          && (-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("_SOCIAL_CENTER_:")) & 1) == 0)
        {
          v14 = -[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("_WEB_CENTER_:"));
          v15 = CFSTR("com.apple.mobilesafari");
          if ((v14 & 1) == 0)
          {
            v16 = -[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("_WALLET_CENTER_:"));
            v15 = CFSTR("com.apple.Passbook");
            if (!v16)
              v15 = v13;
          }
          v17 = (float)v12;
          v30 = v15;
          v18 = -[STUsageTrustIdentifier initWithIdentifier:usageTrusted:]([STUsageTrustIdentifier alloc], "initWithIdentifier:usageTrusted:", v30, objc_msgSend(v11, "usageTrusted"));
          v19 = v4;
          objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          v20 = (STUsageDetailItem *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = v20;
            -[STUsageDetailItem quantity](v20, "quantity");
            *(float *)&v23 = v22 + v17;
            -[STUsageDetailItem setQuantity:](v21, "setQuantity:", v23);
          }
          else
          {
            v24 = [STUsageDetailItem alloc];
            -[STUsageTrustIdentifier identifier](v18, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v24, "initWithType:identifier:usageTrusted:", 1, v25, -[STUsageTrustIdentifier usageTrusted](v18, "usageTrusted"));

            v4 = v29;
            *(float *)&v26 = v17;
            -[STUsageDetailItem setQuantity:](v21, "setQuantity:", v26);
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, v18);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)pickupItemsExcludingSystemHiddenApplications:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  id v16;
  id v17;
  STUsageDetailItem *v18;
  STUsageDetailItem *v19;
  float v20;
  double v21;
  STUsageDetailItem *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0D0D510], "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v10 = 0x1E936F000uLL;
    do
    {
      v11 = 0;
      v31 = v8;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "numberOfPickups");
        objc_msgSend(v12, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 >= 1 && (objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
        {
          v15 = (float)v13;
          v16 = (id)objc_msgSend(objc_alloc(*(Class *)(v10 + 3504)), "initWithIdentifier:usageTrusted:", v14, objc_msgSend(v12, "usageTrusted"));
          v17 = v4;
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (STUsageDetailItem *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            -[STUsageDetailItem quantity](v18, "quantity");
            *(float *)&v21 = v20 + v15;
            -[STUsageDetailItem setQuantity:](v19, "setQuantity:", v21);
          }
          else
          {
            v22 = [STUsageDetailItem alloc];
            objc_msgSend(v16, "identifier");
            v23 = v9;
            v24 = v5;
            v25 = v6;
            v26 = v4;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v22, "initWithType:identifier:usageTrusted:", 1, v27, objc_msgSend(v16, "usageTrusted"));

            v4 = v26;
            v6 = v25;
            v5 = v24;
            v9 = v23;
            v10 = 0x1E936F000;
            *(float *)&v28 = v15;
            -[STUsageDetailItem setQuantity:](v19, "setQuantity:", v28);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v16);
          }

          v8 = v31;
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

@end
