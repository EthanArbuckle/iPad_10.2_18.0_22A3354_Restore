@implementation WFUserDefinedVariable

- (WFUserDefinedVariable)initWithName:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WFUserDefinedVariable *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUserDefinedVariable.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  WFVariableDictionaryWithAggrandizements(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("VariableName"));
  v14 = -[WFUserDefinedVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v13, v10);

  return v14;
}

- (WFUserDefinedVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  WFUserDefinedVariable *v14;
  WFUserDefinedVariable *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("VariableName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "WFEnforceClass";
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v9;
      v13 = v23;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  if (v11
    && (v17.receiver = self,
        v17.super_class = (Class)WFUserDefinedVariable,
        v14 = -[WFVariable initWithDictionary:variableProvider:](&v17, sel_initWithDictionary_variableProvider_, v6, v7),
        (self = v14) != 0))
  {
    objc_storeWeak((id *)&v14->_variableProvider, v7);
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isAvailable
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WFUserDefinedVariable variableProvider](self, "variableProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariable dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VariableName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isVariableWithNameAvailable:", v5);

  return v6;
}

- (BOOL)requiresModernVariableSupport
{
  void *v2;
  BOOL v3;

  -[WFVariable aggrandizements](self, "aggrandizements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC7B78]);
  objc_msgSend(MEMORY[0x1E0DC7B70], "workflowKitImageNamed:", CFSTR("Variable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  return v4;
}

- (NSString)name
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;

  -[WFVariable dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VariableName"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E7AFA810;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  if (-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("Repeat Item")))
  {
    WFLocalizedString(CFSTR("Repeat Item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("Repeat Item %d");
LABEL_7:
    WFLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedRepeatActionVariableName(v6, v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v10;
    return (NSString *)v6;
  }
  if (-[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("Repeat Index")))
  {
    WFLocalizedString(CFSTR("Repeat Index"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("Repeat Index %d");
    goto LABEL_7;
  }
  return (NSString *)v6;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFUserDefinedVariable variableProvider](self, "variableProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariable dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("VariableName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleContentClassesForVariableNamed:context:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, id, _QWORD);

  v10 = (void (**)(id, id, _QWORD))a4;
  v6 = a3;
  -[WFVariable dictionary](self, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("VariableName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentForVariableWithName:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0D13EA8]);
  v10[2](v10, v9, 0);

}

- (void)variableProvider:(id)a3 variableNameDidChangeTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[WFVariable dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v6)
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("VariableName"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("VariableName"));
  }
  -[WFVariable setDictionary:](self, "setDictionary:", v9);
  v11.receiver = self;
  v11.super_class = (Class)WFUserDefinedVariable;
  -[WFVariable variableProvider:variableNameDidChangeTo:](&v11, sel_variableProvider_variableNameDidChangeTo_, v7, v6);

}

- (id)variableProvider
{
  return objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_variableProvider);
}

@end
