@implementation TPSAppIntentCondition

- (TPSAppIntentCondition)init
{
  TPSAppIntentCondition *v2;
  TPSAppIntentCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAppIntentCondition;
  v2 = -[TPSAppIntentCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 12);
  return v3;
}

- (id)_valuesFromValuesArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1EA1E05B0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSAppIntent *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TPSAppIntent initWithDictionary:]([TPSAppIntent alloc], "initWithDictionary:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

- (id)targetingValidations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSCondition values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCondition values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__TPSAppIntentCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1EA1E1300;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __45__TPSAppIntentCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSAppIntentValidation *v4;

  v3 = a2;
  v4 = -[TPSAppIntentValidation initWithAppIntent:]([TPSAppIntentValidation alloc], "initWithAppIntent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __48__TPSAppIntentCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for app intent condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
