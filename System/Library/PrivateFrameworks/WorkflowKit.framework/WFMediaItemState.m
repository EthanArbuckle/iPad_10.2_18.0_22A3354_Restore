@implementation WFMediaItemState

- (WFMediaItemState)initWithMediaType:(id)a3 persistentID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  WFMediaItemDescriptor *v26;
  WFMediaItemState *v27;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v8 = (void *)getMPMediaPropertyPredicateClass_softClass_46473;
  v38 = getMPMediaPropertyPredicateClass_softClass_46473;
  if (!getMPMediaPropertyPredicateClass_softClass_46473)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __getMPMediaPropertyPredicateClass_block_invoke_46474;
    v33 = &unk_1E7AF9520;
    v34 = &v35;
    __getMPMediaPropertyPredicateClass_block_invoke_46474((uint64_t)&v30);
    v8 = (void *)v36[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v35, 8);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v10 = (void *)getMPMediaItemClass_softClass_46475;
  v38 = getMPMediaItemClass_softClass_46475;
  if (!getMPMediaItemClass_softClass_46475)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __getMPMediaItemClass_block_invoke_46476;
    v33 = &unk_1E7AF9520;
    v34 = &v35;
    __getMPMediaItemClass_block_invoke_46476((uint64_t)&v30);
    v10 = (void *)v36[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v11, "persistentIDPropertyForGroupingType:", WFGroupingPropertyForMediaType_46477(v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithValue:forProperty:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v14 = (void *)getMPMediaQueryClass_softClass_46478;
  v38 = getMPMediaQueryClass_softClass_46478;
  if (!getMPMediaQueryClass_softClass_46478)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __getMPMediaQueryClass_block_invoke_46479;
    v33 = &unk_1E7AF9520;
    v34 = &v35;
    __getMPMediaQueryClass_block_invoke_46479((uint64_t)&v30);
    v14 = (void *)v36[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v35, 8);
  v16 = [v15 alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFilterPredicates:", v17);

  objc_msgSend(v18, "setGroupingType:", WFGroupingPropertyForMediaType_46477(v6));
  objc_msgSend(v18, "collections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
    goto LABEL_23;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Playlist")))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Album")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("Compilation")))
    {
      objc_msgSend(v18, "collections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "representativeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "albumTitle");
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v23 = (void *)v25;

      goto LABEL_14;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Song")))
    {
      objc_msgSend(v18, "collections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "representativeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "title");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Artist")))
    {
      objc_msgSend(v18, "collections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "representativeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "artist");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Genre")))
    {
      objc_msgSend(v18, "collections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "representativeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "genre");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Composer")))
    {
      objc_msgSend(v18, "collections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "representativeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "composer");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v18, "collections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_24:
  v26 = -[WFMediaItemDescriptor initWithMediaItemName:persistentIdentifier:mediaType:]([WFMediaItemDescriptor alloc], "initWithMediaItemName:persistentIdentifier:mediaType:", v23, v7, v6);
  v29.receiver = self;
  v29.super_class = (Class)WFMediaItemState;
  v27 = -[WFVariableSubstitutableParameterState initWithValue:](&v29, sel_initWithValue_, v26);

  return v27;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "prompt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getContentWithContext:completionHandler:", v13, v9);
    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11, 0);
  }

}

+ (id)processingValueClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
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
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315906;
      v14 = "WFEnforceClass";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v10 = v18;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  if (objc_msgSend(v8, "count"))
  {
    +[MTLJSONAdapter modelOfClass:fromJSONDictionary:error:](WFPropertyListJSONAdapter, "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFMediaItemState.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFMediaItemDescriptor class]]"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  +[MTLJSONAdapter JSONDictionaryFromModel:error:](WFPropertyListJSONAdapter, "JSONDictionaryFromModel:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

@end
