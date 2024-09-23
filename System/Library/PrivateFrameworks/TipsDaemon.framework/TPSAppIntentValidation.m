@implementation TPSAppIntentValidation

- (TPSAppIntentValidation)initWithAppIntent:(id)a3
{
  id v5;
  TPSAppIntentValidation *v6;
  TPSAppIntentValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppIntentValidation;
  v6 = -[TPSAppIntentValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appIntent, a3);

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  TPSAppIntentsHelper *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  TPSAppIntentValidation *v13;
  id v14;

  v4 = a3;
  -[TPSAppIntent value](self->_appIntent, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(TPSAppIntentsHelper);
  -[TPSAppIntent name](self->_appIntent, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAppIntent bundleId](self->_appIntent, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__TPSAppIntentValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E0790;
  v13 = self;
  v14 = v4;
  v12 = v5;
  v9 = v5;
  v10 = v4;
  -[TPSAppIntentsHelper fetchReturnValueFromIntentNamed:inBundleId:withParameters:completionHandler:](v6, "fetchReturnValueFromIntentNamed:inBundleId:withParameters:completionHandler:", v7, v8, 0, v11);

}

uint64_t __49__TPSAppIntentValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  NSObject *v6;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __49__TPSAppIntentValidation_validateWithCompletion___block_invoke_cold_1(a1, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (TPSAppIntent)appIntent
{
  return self->_appIntent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntent, 0);
}

void __49__TPSAppIntentValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

}

@end
