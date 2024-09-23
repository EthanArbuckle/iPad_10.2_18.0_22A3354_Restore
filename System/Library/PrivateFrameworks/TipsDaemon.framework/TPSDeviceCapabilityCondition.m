@implementation TPSDeviceCapabilityCondition

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
  v9[2] = __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1EA1E05B0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)targetingValidations
{
  return -[TPSDeviceCapabilityCondition targetingValidationsForType:](self, "targetingValidationsForType:", 0);
}

void __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSDeviceCapability *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TPSDeviceCapability initWithDictionary:]([TPSDeviceCapability alloc], "initWithDictionary:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

- (TPSDeviceCapabilityCondition)init
{
  TPSDeviceCapabilityCondition *v2;
  TPSDeviceCapabilityCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSDeviceCapabilityCondition;
  v2 = -[TPSDeviceCapabilityCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 1);
  return v3;
}

- (id)targetingValidationsForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  TPSGestaltValidation *v15;
  TPSTargetingValidation *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSCondition values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v8 = (void *)MEMORY[0x1E0C99E08];
  -[TPSCondition values](self, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCondition values](self, "values");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a3 == 1;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke;
  v23 = &unk_1EA1E0F00;
  v27 = a3 == 0;
  v13 = v10;
  v24 = v13;
  v26 = &v29;
  v28 = v12;
  v14 = v7;
  v25 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v20);

  if (objc_msgSend(v13, "count", v20, v21, v22, v23))
  {
    v15 = -[TPSDeviceCapabilityValidation initWithQueries:]([TPSGestaltValidation alloc], "initWithQueries:", v13);
    -[TPSTargetingValidation setJoinType:](v15, "setJoinType:", -[TPSCondition joinType](self, "joinType"));
    objc_msgSend(v14, "insertObject:atIndex:", v15, 0);

  }
  if (*((_BYTE *)v30 + 24))
  {
    v16 = objc_alloc_init(TPSTargetingValidation);
    objc_msgSend(v14, "insertObject:atIndex:", v16, 0);

  }
  v17 = v25;
  v18 = v14;

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  if (v4 == 2)
  {
    +[TPSCustomCapabilityValidationBuilder targetValidationForCapability:](TPSCustomCapabilityValidationBuilder, "targetValidationForCapability:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56)
      || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v11 = 0) : (v11 = v8),
          *(unsigned __int8 *)(a1 + 57) == objc_msgSend(v11, "isRegistrable")))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    }
    goto LABEL_13;
  }
  if (v4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_1(v3);
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "key");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v3, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v3, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

LABEL_13:
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_2(v3);
LABEL_18:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_19:

}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Unknown Device Capability Type: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __60__TPSDeviceCapabilityCondition_targetingValidationsForType___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0_1(&dword_1DAC2F000, v2, v3, "Invalid Device Capability: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __55__TPSDeviceCapabilityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for device capability condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
