@implementation TPSRegionsValidation

- (TPSRegionsValidation)initWithTargetRegions:(id)a3 excludeRegions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TPSRegionsValidation *v9;
  objc_super v11;

  v6 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("lowercaseString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("lowercaseString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)TPSRegionsValidation;
  v9 = -[TPSInclusivityValidation initWithTargetValues:excludeValues:](&v11, sel_initWithTargetValues_excludeValues_, v7, v8);

  return v9;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSRegionsValidation targetRegions](self, "targetRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = objc_claimAutoreleasedReturnValue();

    -[TPSRegionsValidation targetRegions](self, "targetRegions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[TPSRegionsValidation targetRegions](self, "targetRegions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v10);

    }
    else
    {
      v13 = 1;
    }

    -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v10);

    v16 = v13 & (v15 ^ 1u);
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      -[TPSRegionsValidation targetRegions](self, "targetRegions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413314;
      v25 = v18;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v23;
      v32 = 1024;
      v33 = v16;
      _os_log_debug_impl(&dword_1DAC2F000, v17, OS_LOG_TYPE_DEBUG, "%@ - checking device region: %@, target regions: %@, exclude regions: %@. Valid: %d", (uint8_t *)&v24, 0x30u);

    }
    goto LABEL_10;
  }
  -[TPSRegionsValidation excludeRegions](self, "excludeRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSRegionsValidation validateWithCompletion:].cold.1((uint64_t)self, v10);
  v16 = 1;
LABEL_10:

  v4[2](v4, v16, 0);
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
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude region(s) is specified.", (uint8_t *)&v4, 0xCu);

}

@end
