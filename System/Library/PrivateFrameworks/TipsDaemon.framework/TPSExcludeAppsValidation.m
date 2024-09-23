@implementation TPSExcludeAppsValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[TPSTargetingValidation arrayValue](self, "arrayValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke;
  v16[3] = &unk_1EA1E05B0;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_5;
  aBlock[3] = &unk_1EA1E09B0;
  aBlock[4] = self;
  v9 = v4;
  v15 = v9;
  v10 = _Block_copy(aBlock);
  if (objc_msgSend(v8, "count"))
  {
    -[TPSTargetingValidation name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_8;
    v12[3] = &unk_1EA1DFD18;
    v13 = v10;
    +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v8, 1, v11, 0, 0, v12);

  }
  else
  {
    (*((void (**)(void *, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

void __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSInstalledAppInfo *v4;
  TPSInstalledAppsValidation *v5;
  NSObject *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TPSInstalledAppInfo initWithDictionary:]([TPSInstalledAppInfo alloc], "initWithDictionary:", v3);
    v5 = -[TPSInstalledAppsValidation initWithInstalledAppInfo:]([TPSInstalledAppsValidation alloc], "initWithInstalledAppInfo:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1((uint64_t)v3, v6);

  }
}

uint64_t __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_5(uint64_t a1, char a2)
{
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(a1, a2, v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Unexpected value for exclude app condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
