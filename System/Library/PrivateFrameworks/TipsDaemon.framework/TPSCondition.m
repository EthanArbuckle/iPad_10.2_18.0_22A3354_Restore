@implementation TPSCondition

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)conditionFromDictionary:(id)a3
{
  id v4;
  __objc2_class *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  switch(objc_msgSend(a1, "typeFromConditionDictionary:", v4))
  {
    case 1:
      v5 = TPSDeviceCapabilityCondition;
      break;
    case 2:
      v5 = TPSUserTypeCondition;
      break;
    case 3:
      v5 = TPSRegionsCondition;
      break;
    case 4:
      v5 = TPSInstalledAppsCondition;
      break;
    case 5:
      v5 = TPSDevicesCondition;
      break;
    case 6:
      v5 = TPSPairedDevicesCondition;
      break;
    case 7:
      v5 = TPSCloudDevicesCondition;
      break;
    case 8:
      v5 = TPSNRDeviceCapabilityCondition;
      break;
    case 9:
      v5 = TPSAppStoreRegionsCondition;
      break;
    case 10:
      v5 = TPSSiriLanguagesCondition;
      break;
    case 11:
      v5 = TPSContentStatusCondition;
      break;
    case 12:
      v5 = TPSAppIntentCondition;
      break;
    case 13:
      v5 = TPSAppEntityCondition;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[TPSCondition conditionFromDictionary:].cold.1(v4, v6);

      v5 = (__objc2_class *)objc_opt_class();
      break;
  }
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDictionary:", v4);

  return v7;
}

- (TPSCondition)initWithDictionary:(id)a3
{
  id v4;
  TPSCondition *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *valueType;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *values;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSCondition;
  v5 = -[TPSCondition init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("unknown");
    objc_storeStrong((id *)&v5->_identifier, v8);

    v5->_type = objc_msgSend((id)objc_opt_class(), "typeFromConditionDictionary:", v4);
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("joinType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AND")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("OR")) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v10 = -[TPSCondition defaultJoinType](v5, "defaultJoinType");
    }
    v5->_joinType = v10;
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("valueType"));
    v11 = objc_claimAutoreleasedReturnValue();
    valueType = v5->_valueType;
    v5->_valueType = (NSString *)v11;

    objc_msgSend(v4, "TPSSafeObjectForKey:", CFSTR("values"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
    }
    -[TPSCondition _valuesFromValuesArray:](v5, "_valuesFromValuesArray:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSArray *)v15;

  }
  return v5;
}

+ (int64_t)typeFromConditionDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("deviceCapability")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("userType")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("regions")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("installedApps")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("devices")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pairedDevices")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudDevices")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("watchCapability")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appStoreRegions")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("siriLanguages")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("contentStatus")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appIntent")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("appEntity")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)defaultJoinType
{
  return 0;
}

- (NSString)valueType
{
  return self->_valueType;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TPSCondition targetingValidations](self, "targetingValidations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSCondition validateWithValidations:completion:](self, "validateWithValidations:completion:", v5, v4);

}

- (int64_t)joinType
{
  return self->_joinType;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_validations, 0);
}

- (NSArray)targetingValidations
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)validateWithValidations:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSArray *validations;
  int64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (self->_type)
  {
    objc_storeStrong((id *)&self->_validations, a3);
    validations = self->_validations;
    v11 = -[TPSCondition joinType](self, "joinType");
    -[TPSCondition identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__TPSCondition_validateWithValidations_completion___block_invoke;
    v13[3] = &unk_1EA1DFD18;
    v14 = v9;
    +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", validations, v11, v12, 0, 0, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

uint64_t __51__TPSCondition_validateWithValidations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (id)_valuesFromValuesArray:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TPSCondition identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TPSCondition joinType](self, "joinType"))
    v6 = CFSTR("OR");
  else
    v6 = CFSTR("AND");
  -[TPSCondition values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("debugDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%@] Values(%@): %@ "), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setValueType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

+ (void)conditionFromDictionary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "TPSSafeStringForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unsupported condition type: %@", (uint8_t *)&v4, 0xCu);

}

@end
