@implementation TPSCloudDeviceValidation

+ (id)idsService
{
  if (idsService_predicate[0] != -1)
    dispatch_once(idsService_predicate, &__block_literal_global_2);
  return (id)idsService_service;
}

void __38__TPSCloudDeviceValidation_idsService__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D34358]);
  v1 = objc_msgSend(v0, "initWithService:", *MEMORY[0x1E0DBF460]);
  v2 = (void *)idsService_service;
  idsService_service = v1;

}

+ (NSArray)idsDevices
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)normalizedVersion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "count");
  v6 = v5 - 4;
  if (v5 <= 4)
  {
    if (v5 != 4)
    {
      v7 = 4 - v5;
      do
      {
        objc_msgSend(v4, "addObject:", CFSTR("0"), v6);
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(v4, "removeObjectsInRange:", 3, v6);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)deviceInfoForIdentifier:(id)a3 preferredModels:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  TPSCloudDeviceInfo *v36;
  void *v37;
  void *v38;
  int v39;
  id v41;
  uint64_t v42;
  void *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "registeredDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  v45 = objc_msgSend(v8, "count");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  v46 = v11;
  if (!v12)
  {

    goto LABEL_28;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v48;
  v41 = v9;
  v42 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v48 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v17, "modelIdentifier", v41);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "containsString:", v7))
      {
        if (!v14)
        {
          v14 = v17;
          goto LABEL_21;
        }
        if (v45)
        {
          v20 = v14;
          objc_msgSend(v14, "modelIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lowercaseString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v44, "containsObject:", v22);
          v24 = objc_msgSend(v44, "containsObject:", v19);
          if ((v24 & 1) == 0 && v23)
            goto LABEL_20;
          if (((v24 ^ 1 | v23) & 1) == 0)
          {
            v14 = v17;

LABEL_20:
            v11 = v46;
            goto LABEL_21;
          }

        }
        objc_msgSend(v17, "productVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "normalizedVersion:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "productVersion");
        v27 = v14;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "normalizedVersion:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "compare:options:", v26, 64) == -1)
        {
          v14 = v17;

        }
        else
        {
          v14 = v27;
        }

        v11 = v46;
        v15 = v42;
      }
LABEL_21:

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v13);

  v9 = v41;
  if (v14)
  {
    objc_msgSend(v14, "modelIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowercaseString");
    v31 = v14;
    v32 = (id)objc_claimAutoreleasedReturnValue();

    v33 = v31;
    objc_msgSend(v31, "productVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v44, "containsObject:", v32);
    if (!v32)
      goto LABEL_25;
LABEL_31:
    v36 = -[TPSCloudDeviceInfo initWithModel:]([TPSCloudDeviceInfo alloc], "initWithModel:", v32);
    -[TPSCloudDeviceInfo setMaxOSVersion:](v36, "setMaxOSVersion:", v34);
    -[TPSCloudDeviceInfo setPreferred:](v36, "setPreferred:", v35);
    goto LABEL_33;
  }
LABEL_28:
  v37 = (void *)MGCopyAnswer();
  objc_msgSend(v37, "lowercaseString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "containsString:", v7);

  v32 = 0;
  v34 = 0;
  if (v39)
  {
    v32 = v37;
    objc_msgSend(MEMORY[0x1E0DBF348], "productVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v33 = 0;
  v35 = 0;
  if (v32)
    goto LABEL_31;
LABEL_25:
  if (objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator"))
    v36 = -[TPSCloudDeviceInfo initWithModel:]([TPSCloudDeviceInfo alloc], "initWithModel:", v7);
  else
    v36 = 0;
LABEL_33:

  return v36;
}

+ (id)iPadDeviceInfoUsingDataSource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceInfoForIdentifier:preferredModels:dataSource:", CFSTR("ipad"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setModel:", CFSTR("ipad"));
    objc_msgSend(v4, "setDisplayName:", CFSTR("iPad"));
    objc_msgSend(v4, "setSymbolIdentifier:", CFSTR("ipad"));
  }
  return v4;
}

+ (id)iPhoneDeviceInfoUsingDataSource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceInfoForIdentifier:preferredModels:dataSource:", CFSTR("iphone"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setModel:", CFSTR("iphone"));
    objc_msgSend(v4, "setDisplayName:", CFSTR("iPhone"));
    objc_msgSend(v4, "setSymbolIdentifier:", CFSTR("iphone"));
  }
  return v4;
}

+ (id)tvDeviceInfoUsingDataSource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceInfoForIdentifier:preferredModels:dataSource:", CFSTR("tv"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setModel:", CFSTR("tv"));
    objc_msgSend(v4, "setDisplayName:", CFSTR("Apple TV"));
    objc_msgSend(v4, "setSymbolIdentifier:", CFSTR("appletv"));
  }
  return v4;
}

+ (id)visionProDeviceInfoUsingDataSource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceInfoForIdentifier:preferredModels:dataSource:", CFSTR("realitydevice"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setModel:", CFSTR("apple-vision-pro"));
    objc_msgSend(v4, "setDisplayName:", CFSTR("Apple Vision Pro"));
    objc_msgSend(v4, "setSymbolIdentifier:", CFSTR("visionpro"));
  }
  return v4;
}

+ (id)watchDeviceInfoUsingDataSource:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceInfoForIdentifier:preferredModels:dataSource:", CFSTR("watch"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setModel:", CFSTR("watch"));
    objc_msgSend(v4, "setDisplayName:", CFSTR("Apple Watch"));
    objc_msgSend(v4, "setSymbolIdentifier:", CFSTR("applewatch"));
  }
  return v4;
}

- (TPSCloudDeviceValidation)initWithDeviceInfo:(id)a3
{
  id v5;
  TPSCloudDeviceValidation *v6;
  TPSCloudDeviceValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudDeviceValidation;
  v6 = -[TPSCloudDeviceValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceInfo, a3);

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, _BYTE *);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[TPSCloudDeviceValidation dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registeredDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCloudDeviceValidation deviceInfo](self, "deviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCloudDeviceValidation deviceInfo](self, "deviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minOSVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCloudDeviceValidation deviceInfo](self, "deviceInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maxOSVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __51__TPSCloudDeviceValidation_validateWithCompletion___block_invoke;
    v21 = &unk_1EA1E0560;
    v22 = v8;
    v25 = &v26;
    v23 = v10;
    v24 = v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v18);

  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting", v18, v19, v20, v21);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[TPSTargetingValidation name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCloudDeviceValidation deviceInfo](self, "deviceInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *((unsigned __int8 *)v27 + 24);
    *(_DWORD *)buf = 138412802;
    v31 = v14;
    v32 = 2112;
    v33 = v16;
    v34 = 1024;
    v35 = v17;
    _os_log_debug_impl(&dword_1DAC2F000, v13, OS_LOG_TYPE_DEBUG, "%@ - device info: %@. Valid: %d", buf, 0x1Cu);

  }
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v27 + 24), 0);

  _Block_object_dispose(&v26, 8);
}

void __51__TPSCloudDeviceValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
    {
      objc_msgSend(v10, "productVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "compare:options:", *(_QWORD *)(a1 + 40), 64) != -1;

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      objc_msgSend(v10, "productVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "compare:options:", *(_QWORD *)(a1 + 48), 64) != 1;

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a4 = 1;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudDeviceValidation deviceInfo](self, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; deviceInfo = %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TPSCloudDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (TPSCloudDeviceDataSource)dataSource
{
  return (TPSCloudDeviceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
