@implementation WFPropertyVariableAggrandizement

- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4
{
  return -[WFPropertyVariableAggrandizement initWithPropertyName:propertyUserInfo:negativeProperty:negativePropertyName:](self, "initWithPropertyName:propertyUserInfo:negativeProperty:negativePropertyName:", a3, a4, 0, 0);
}

- (WFPropertyVariableAggrandizement)initWithPropertyName:(id)a3 propertyUserInfo:(id)a4 negativeProperty:(BOOL)a5 negativePropertyName:(id)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  WFPropertyVariableAggrandizement *v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("PropertyName"));

  objc_msgSend(v13, "setValue:forKey:", v11, CFSTR("PropertyUserInfo"));
  if (v6)
    v14 = MEMORY[0x1E0C9AAB0];
  else
    v14 = 0;
  if (v6)
    v15 = v10;
  else
    v15 = 0;
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("NegativeProperty"));
  objc_msgSend(v13, "setValue:forKey:", v15, CFSTR("NegativePropertyName"));

  v16 = -[WFPropertyVariableAggrandizement initWithDictionary:](self, "initWithDictionary:", v13);
  return v16;
}

- (WFPropertyVariableAggrandizement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  WFPropertyVariableAggrandizement *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PropertyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFPropertyVariableAggrandizement;
    self = -[WFVariableAggrandizement initWithDictionary:](&v8, sel_initWithDictionary_, v4);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)propertyName
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PropertyName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WFPropertyListObject)propertyUserInfo
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PropertyUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v3;
}

- (BOOL)negativeProperty
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NegativeProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (NSString)negativePropertyName
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NegativePropertyName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)processedContentClasses:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = (objc_class *)MEMORY[0x1E0C99E40];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__WFPropertyVariableAggrandizement_processedContentClasses___block_invoke;
  v11[3] = &unk_1E7AEA5E0;
  v11[4] = self;
  objc_msgSend(v7, "if_compactMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);

  return v9;
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E7AEA630;
  v4[4] = self;
  objc_msgSend(a3, "transformItemsAndFlattenUsingBlock:completionHandler:", v4, a4);
}

void __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "propertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
    v10[3] = &unk_1E7AEA608;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    objc_msgSend(v9, "getValuesForObject:completionHandler:", v5, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_3;
  v4[3] = &unk_1E7AF7718;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "if_map:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __79__WFPropertyVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
LABEL_4:
    v5 = v4;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "localizedValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v5 = v3;
  if (objc_msgSend(*(id *)(a1 + 32), "negativeProperty"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_opt_class();
    v9 = v5;
    if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v13 = 136315906;
        v14 = "WFEnforceClass";
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = (id)objc_opt_class();
        v19 = 2114;
        v20 = v8;
        v12 = v18;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

      }
      v10 = 0;
    }
    else
    {
      v10 = v9;
    }

    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v10, "BOOLValue") ^ 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_5:

  return v5;
}

id __60__WFPropertyVariableAggrandizement_processedContentClasses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "propertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "propertyForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueItemClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
