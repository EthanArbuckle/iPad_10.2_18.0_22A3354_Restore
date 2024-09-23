@implementation TPSAppStoreRegionValidation

- (BOOL)hasStoreFrontRegionPrefix:(id)a3 fromRegions:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__TPSAppStoreRegionValidation_hasStoreFrontRegionPrefix_fromRegions___block_invoke;
  v10[3] = &unk_1EA1E0700;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __69__TPSAppStoreRegionValidation_hasStoreFrontRegionPrefix_fromRegions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSRegionsValidation targetRegions](self, "targetRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

LABEL_4:
    -[TPSAppStoreRegionValidation getCurrentState](self, "getCurrentState");
    v8 = objc_claimAutoreleasedReturnValue();
    -[TPSRegionsValidation targetRegions](self, "targetRegions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[TPSRegionsValidation targetRegions](self, "targetRegions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[TPSAppStoreRegionValidation hasStoreFrontRegionPrefix:fromRegions:](self, "hasStoreFrontRegionPrefix:fromRegions:", v8, v11);

    }
    else
    {
      v12 = 1;
    }
    -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TPSAppStoreRegionValidation hasStoreFrontRegionPrefix:fromRegions:](self, "hasStoreFrontRegionPrefix:fromRegions:", v8, v15);

      v17 = !v16;
    }
    else
    {
      v17 = 1;
    }
    v18 = v12 & v17;
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      -[TPSRegionsValidation targetRegions](self, "targetRegions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138413314;
      v27 = v20;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v25;
      v34 = 1024;
      v35 = v18;
      _os_log_debug_impl(&dword_1DAC2F000, v19, OS_LOG_TYPE_DEBUG, "%@ - checking appstore region: %@, target regions: %@, exclude regions: %@. Valid: %d", (uint8_t *)&v26, 0x30u);

    }
    goto LABEL_13;
  }
  -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TPSAppStoreRegionValidation validateWithCompletion:].cold.1((uint64_t)self, v8);
  v18 = 1;
LABEL_13:

  v4[2](v4, v18, 0);
}

- (id)getCurrentState
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_storefront");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[TPSAppStoreRegionValidation getCurrentState](self, "getCurrentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v4[2](v4, v8, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude appstore region(s) is specified.", (uint8_t *)&v4, 0xCu);

}

@end
