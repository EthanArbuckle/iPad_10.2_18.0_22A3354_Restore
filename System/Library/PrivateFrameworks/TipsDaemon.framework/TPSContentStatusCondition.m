@implementation TPSContentStatusCondition

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
  v9[2] = __49__TPSContentStatusCondition_targetingValidations__block_invoke;
  v9[3] = &unk_1EA1E0280;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

- (id)_valuesFromValuesArray:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  TPSContentStatusCondition *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke;
  v13 = &unk_1EA1DFE28;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_contextualEventFromConditionDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

+ (id)_contextualEventFromConditionDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("contentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "TPSSafeIntegerForKey:", CFSTR("statusType"));
  v6 = objc_msgSend(v3, "TPSSafeIntegerForKey:", CFSTR("status"));

  v7 = objc_alloc(MEMORY[0x1E0DBF388]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithEventIdentifier:contentIdentifier:statusType:status:", v9, v4, v5, v6);

  return v10;
}

void __49__TPSContentStatusCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSContextualEventValidation *v4;

  v3 = a2;
  v4 = -[TPSContextualEventValidation initWithContextualEvent:]([TPSContextualEventValidation alloc], "initWithContextualEvent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (TPSContentStatusCondition)init
{
  TPSContentStatusCondition *v2;
  TPSContentStatusCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContentStatusCondition;
  v2 = -[TPSContentStatusCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 11);
  return v3;
}

void __52__TPSContentStatusCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for content status condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
