@implementation WFActionOutputVariable

- (WFActionOutputVariable)initWithAction:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WFActionOutputVariable *v14;
  WFActionOutputVariable *v15;
  WFActionOutputVariable *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionOutputVariable.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variableProvider"));

  }
  objc_msgSend(v9, "outputName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFActionOutputVariable initWithOutputUUID:outputName:variableProvider:aggrandizements:](self, "initWithOutputUUID:outputName:variableProvider:aggrandizements:", v13, v12, v10, v11);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_action, v9);
    v16 = v15;
  }

  return v15;
}

- (WFActionOutputVariable)initWithOutputUUID:(id)a3 outputName:(id)a4 variableProvider:(id)a5 aggrandizements:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  WFActionOutputVariable *v17;
  void *v19;
  void *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionOutputVariable.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputUUID"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionOutputVariable.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputName"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  WFVariableDictionaryWithAggrandizements(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("OutputUUID"));
  objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("OutputName"));
  v17 = -[WFActionOutputVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v16, v13);

  return v17;
}

- (WFActionOutputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  WFActionOutputVariable *v14;
  WFActionOutputVariable *v15;
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
  objc_msgSend(v6, "objectForKey:", CFSTR("OutputUUID"));
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
        v17.super_class = (Class)WFActionOutputVariable,
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
  char v5;

  -[WFActionOutputVariable variableProvider](self, "variableProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionOutputVariable outputUUID](self, "outputUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isVariableWithOutputUUIDAvailable:", v4);

  return v5;
}

- (NSString)outputUUID
{
  void *v2;
  void *v3;

  -[WFVariable dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("OutputUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)icon
{
  void *v2;
  void *v3;

  -[WFActionOutputVariable action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFAction)action
{
  void *WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  if (!WeakRetained)
  {
    -[WFActionOutputVariable variableProvider](self, "variableProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFActionOutputVariable outputUUID](self, "outputUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionProvidingVariableWithOutputUUID:", v5);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    if (!WeakRetained)
    {
      getWFGeneralLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[WFActionOutputVariable action]";
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s No associated action found for WFActionOutputVariable", (uint8_t *)&v8, 0xCu);
      }

      WeakRetained = 0;
    }
  }
  return (WFAction *)WeakRetained;
}

- (id)defaultName
{
  void *v2;
  void *v3;

  -[WFActionOutputVariable action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDefaultOutputName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFActionOutputVariable action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFVariable dictionary](self, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("OutputName"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (BOOL)isRenamed
{
  void *v2;
  char v3;

  -[WFActionOutputVariable action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputIsRenamed");

  return v3;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFActionOutputVariable action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v5, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inheritedOutputContentClassesInWorkflow:context:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);
  return v9;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  -[WFActionOutputVariable outputUUID](self, "outputUUID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR("-output"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentForVariableWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, _QWORD))a4 + 2))(v7, v10, 0);
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
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("OutputName"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("OutputName"));
  }
  -[WFVariable setDictionary:](self, "setDictionary:", v9);
  v11.receiver = self;
  v11.super_class = (Class)WFActionOutputVariable;
  -[WFVariable variableProvider:variableNameDidChangeTo:](&v11, sel_variableProvider_variableNameDidChangeTo_, v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFActionOutputVariable;
  v4 = -[WFVariable copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_action);
    objc_storeWeak(v4 + 5, WeakRetained);

  }
  return v4;
}

- (id)variableBySettingAggrandizements:(id)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFActionOutputVariable;
  -[WFVariable variableBySettingAggrandizements:](&v7, sel_variableBySettingAggrandizements_, a3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_action);
      objc_storeWeak(v4 + 5, WeakRetained);
    }
    else
    {
      WeakRetained = v4;
      v4 = 0;
    }
  }
  else
  {
    WeakRetained = 0;
  }

  return v4;
}

- (id)variableProvider
{
  return objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_destroyWeak((id *)&self->_variableProvider);
}

@end
