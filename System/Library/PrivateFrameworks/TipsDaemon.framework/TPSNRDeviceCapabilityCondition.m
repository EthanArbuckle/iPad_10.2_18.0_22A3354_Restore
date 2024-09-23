@implementation TPSNRDeviceCapabilityCondition

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
  v9[2] = __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1EA1E05B0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSNRDeviceCapability *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TPSNRDeviceCapability initWithDictionary:]([TPSNRDeviceCapability alloc], "initWithDictionary:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

- (id)targetingValidations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  TPSNRDeviceCapabilityValidation *v12;
  TPSTargetingValidation *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSCondition values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = (void *)MEMORY[0x1E0C99E08];
  -[TPSCondition values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCondition values](self, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke;
  v17[3] = &unk_1EA1E0588;
  v10 = v8;
  v18 = v10;
  v20 = &v21;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);

  if (objc_msgSend(v10, "count"))
  {
    v12 = -[TPSDeviceCapabilityValidation initWithQueries:]([TPSNRDeviceCapabilityValidation alloc], "initWithQueries:", v10);
    -[TPSTargetingValidation setJoinType:](v12, "setJoinType:", -[TPSCondition joinType](self, "joinType"));
    objc_msgSend(v11, "insertObject:atIndex:", v12, 0);

  }
  if (*((_BYTE *)v22 + 24))
  {
    v13 = objc_alloc_init(TPSTargetingValidation);
    objc_msgSend(v11, "insertObject:atIndex:", v13, 0);

  }
  v14 = v19;
  v15 = v11;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  if (v4 == 4)
  {
    +[TPSCustomCapabilityValidationBuilder targetValidationForNRDeviceCapability:](TPSCustomCapabilityValidationBuilder, "targetValidationForNRDeviceCapability:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    goto LABEL_7;
  }
  if (v4 != 3)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_1(v3);
    goto LABEL_12;
  }
  objc_msgSend(v3, "key");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v3, "value"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_2(v3);
LABEL_12:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_13;
  }
  objc_msgSend(v3, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

LABEL_7:
LABEL_13:

}

- (TPSNRDeviceCapabilityCondition)init
{
  TPSNRDeviceCapabilityCondition *v2;
  TPSNRDeviceCapabilityCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSNRDeviceCapabilityCondition;
  v2 = -[TPSNRDeviceCapabilityCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 8);
  return v3;
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Unknown NRDevice Capability Type: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __54__TPSNRDeviceCapabilityCondition_targetingValidations__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Invalid NRDevice Capability: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __57__TPSNRDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for NRDevice capability condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
