@implementation WFVariableAggrandizement

- (WFVariableAggrandizement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSString *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
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
      v22 = "WFEnforceClass";
      v23 = 2114;
      v24 = v7;
      v25 = 2114;
      v26 = (id)objc_opt_class();
      v27 = 2114;
      v28 = v6;
      v10 = v26;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = (NSString *)v7;
  }

  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v12 = NSClassFromString(v8);
    if (-[objc_class isSubclassOfClass:](v12, "isSubclassOfClass:", objc_opt_class()))
    {
      v13 = objc_msgSend([v12 alloc], "initWithDictionary:", v4);
      if (v13)
      {
        v14 = v13;
LABEL_15:

        goto LABEL_16;
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)WFVariableAggrandizement;
  v14 = -[WFVariableAggrandizement init](&v20, sel_init);
  if (v14)
  {
    if (!v8)
    {
      v15 = (void *)objc_msgSend(v4, "mutableCopy");
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("Type"));

      v4 = v15;
    }
    v18 = objc_msgSend(v4, "copy");
    self = *(WFVariableAggrandizement **)(v14 + 8);
    *(_QWORD *)(v14 + 8) = v18;
    goto LABEL_15;
  }
LABEL_16:

  return (WFVariableAggrandizement *)v14;
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, id, _QWORD))a4 + 2))(a4, a3, 0);
}

- (id)processedContentClasses:(id)a3
{
  return a3;
}

- (BOOL)isEqual:(id)a3
{
  WFVariableAggrandizement *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFVariableAggrandizement *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableAggrandizement dictionary](v4, "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableAggrandizement dictionary](self, "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0x5620140A;

  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
