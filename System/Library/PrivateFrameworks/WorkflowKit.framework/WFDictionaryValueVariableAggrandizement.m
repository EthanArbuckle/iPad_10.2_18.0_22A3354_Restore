@implementation WFDictionaryValueVariableAggrandizement

- (WFDictionaryValueVariableAggrandizement)initWithDictionaryKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFDictionaryValueVariableAggrandizement *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("DictionaryKey");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFDictionaryValueVariableAggrandizement initWithDictionary:](self, "initWithDictionary:", v6);
  return v7;
}

- (WFDictionaryValueVariableAggrandizement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  WFDictionaryValueVariableAggrandizement *v11;
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
  objc_msgSend(v4, "objectForKey:", CFSTR("DictionaryKey"));
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
    v8 = v7;
  }

  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFDictionaryValueVariableAggrandizement;
    self = -[WFVariableAggrandizement initWithDictionary:](&v13, sel_initWithDictionary_, v4);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)dictionaryKey
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)processedContentClasses:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0C99E40];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (id)objc_msgSend(v3, "orderedSetWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__WFDictionaryValueVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF0CF8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClass:completionHandler:", v8, v10);

}

void __86__WFDictionaryValueVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dictionaryKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0D13FC0];
      objc_msgSend(*(id *)(a1 + 32), "dictionaryKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v13, "evaluateKeyPath:onObject:error:", v14, v15, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;

      if (!v11)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_7;
      }
    }
    v16 = (void *)MEMORY[0x1E0D13F38];
    objc_msgSend(v8, "preferredFileType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributionSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemsWithPropertyListObject:preferredDictionaryType:attributionSet:", v11, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v21, 0);

LABEL_7:
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_8:

}

@end
