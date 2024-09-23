@implementation WCDeviceLookup

- (WCDeviceLookup)init
{
  WCDeviceLookup *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCDeviceLookup;
  v2 = -[WCDeviceLookup init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  return v2;
}

- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6
{
  int64_t var0;
  int64_t v8;
  int64_t v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int64_t var1;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3.var1;
  v9 = a3.var0;
  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[WCDeviceLookup accountStore](self, "accountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = *MEMORY[0x1E0C8F030];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v12, "accountsWithAccountTypeIdentifiers:error:", v13, &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v30;
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D001E0]);
    objc_msgSend(v16, "aa_altDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAltDSID:", v18);

    objc_msgSend(v17, "setIncludeUntrustedDevices:", 1);
    v31 = *MEMORY[0x1E0D000A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setServices:", v19);

    objc_msgSend(v17, "setOperatingSystems:", &unk_1E60C9B98);
    v20 = objc_alloc_init(MEMORY[0x1E0D00130]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke;
    v22[3] = &unk_1E60A6EE8;
    v23 = v15;
    v24 = v11;
    v25 = a5;
    v26 = v9;
    v27 = v8;
    v28 = var0;
    v29 = var1;
    objc_msgSend(v20, "fetchDeviceListWithContext:completion:", v17, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
  }

}

void __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v17 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "serialNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11
              || (objc_msgSend(v9, "lastUpdatedDate"),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v11, "lastUpdatedDate"),
                  v13 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14 = objc_msgSend(v12, "compare:", v13),
                  v13,
                  v12,
                  v14 == 1))
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);
            }

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_2;
    v20[3] = &__block_descriptor_72_e24_B16__0__AKRemoteDevice_8l;
    v20[4] = *(_QWORD *)(v17 + 48);
    v16 = *(_OWORD *)(v17 + 72);
    v21 = *(_OWORD *)(v17 + 56);
    v22 = v16;
    objc_msgSend(v15, "wc_allObjectsPassTest:", v20);

    (*(void (**)(void))(*(_QWORD *)(v17 + 40) + 16))();
    v3 = v18;
  }

}

BOOL __115__WCDeviceLookup_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  int v16;
  uint64_t *v17;
  void *v18;
  int v19;

  v3 = a2;
  objc_msgSend(v3, "operatingSystemVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  objc_msgSend(v3, "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wc_timeIntervalUntilNow");
  v12 = v11;
  v13 = *(double *)(a1 + 32);

  if (v12 <= v13)
  {
    objc_msgSend(v3, "operatingSystemName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("iOS"));

    if (v16)
    {
      if (v7 >= *(_QWORD *)(a1 + 40))
      {
        v17 = (uint64_t *)(a1 + 48);
LABEL_13:
        v14 = v9 >= *v17;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v3, "operatingSystemName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("macOS"));

      if (v19 && v7 >= *(_QWORD *)(a1 + 56))
      {
        v17 = (uint64_t *)(a1 + 64);
        goto LABEL_13;
      }
    }
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 1;
LABEL_14:

  return v14;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
