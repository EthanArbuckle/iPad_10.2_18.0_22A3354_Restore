@implementation WFCoercionVariableAggrandizement

- (WFCoercionVariableAggrandizement)initWithCoercionItemClass:(Class)a3
{
  void *v4;
  void *v5;
  WFCoercionVariableAggrandizement *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("CoercionItemClass");
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFCoercionVariableAggrandizement initWithDictionary:](self, "initWithDictionary:", v5);
  return v6;
}

- (WFCoercionVariableAggrandizement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSString *v8;
  NSObject *v9;
  id v10;
  WFCoercionVariableAggrandizement *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("CoercionItemClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "WFEnforceClass";
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v6;
      v10 = v19;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = (NSString *)v7;
  }

  if (v8 && NSClassFromString(v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)WFCoercionVariableAggrandizement;
    self = -[WFVariableAggrandizement initWithDictionary:](&v13, sel_initWithDictionary_, v4);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (Class)coercionItemClass
{
  void *v2;
  NSString *v3;
  void *v4;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CoercionItemClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)coercionItemClasses
{
  objc_class *v2;

  v2 = -[WFCoercionVariableAggrandizement coercionItemClass](self, "coercionItemClass");
  if (-[objc_class isSubclassOfClass:](v2, "isSubclassOfClass:", objc_opt_class()))
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", objc_opt_class(), v2, 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFCoercionVariableAggrandizement coercionItemClasses](self, "coercionItemClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__WFCoercionVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v11[3] = &unk_1E7AF7100;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClasses:completionHandler:", v9, v11);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  BOOL v8;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = (objc_class *)objc_msgSend(v6, "coercionItemClass");

  v8 = v7 == -[WFCoercionVariableAggrandizement coercionItemClass](self, "coercionItemClass");
  return v8;
}

uint64_t __79__WFCoercionVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
