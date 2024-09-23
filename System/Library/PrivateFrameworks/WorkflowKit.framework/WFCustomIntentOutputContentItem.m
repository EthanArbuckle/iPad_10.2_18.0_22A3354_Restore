@implementation WFCustomIntentOutputContentItem

+ (INCodableDescription)codableDescription
{
  return 0;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "codableDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wf_outputDisplayNameWithLocalizer:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(0, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayOrderedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_61335);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFCustomIntentOutputContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v2 = a2;
  if ((objc_msgSend(v2, "isDefaultAttribute") & 1) != 0)
    goto LABEL_13;
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    goto LABEL_13;
  v5 = (void *)objc_msgSend(v2, "wf_objectClass");
  if (!v5)
    goto LABEL_14;
  if ((objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v2, "wf_contentItemClass");
    if (!v5)
      goto LABEL_14;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "contentItemClassForType:", v7);

  if (!v8)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
LABEL_9:
  v9 = objc_msgSend(v2, "wf_multipleValues");
  objc_msgSend(v2, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v13 = v11;

  v14 = (void *)MEMORY[0x1E0D13EF8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke_2;
  v22[3] = &unk_1E7AF8A10;
  v15 = v2;
  v23 = v15;
  objc_msgSend(v15, "propertyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "block:name:class:", v22, v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "multipleValues:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wf_measurementType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "measurementUnitType:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedDisplayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayName:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v5;
}

void __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a2, "customObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "propertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(a1 + 32), "wf_contentItemForValue:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v10, "copy");
  }
  else if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "wf_contentItemForValue:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v6[2](v6, v17);

}

- (INCustomObject)customObject
{
  return (INCustomObject *)-[WFCustomIntentOutputContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() != a3)
    return 0;
  v7 = (void *)MEMORY[0x1E0D14018];
  -[WFCustomIntentOutputContentItem customObject](self, "customObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (WFCustomIntentOutputContentItem)initWithCoder:(id)a3
{
  id v4;
  WFCustomIntentOutputContentItem *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  WFCustomIntentOutputContentItem *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  __CFString *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WFCustomIntentOutputContentItem;
  v5 = -[WFCustomIntentOutputContentItem init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.Bridge"));
    v8 = CFSTR("com.apple.PBBridgeSupport.BridgeIntents");
    if (!v7)
      v8 = v6;
    v9 = v8;

    if (-[__CFString length](v9, "length"))
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__61398;
      v39 = __Block_byref_object_dispose__61399;
      v40 = 0;
      objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __49__WFCustomIntentOutputContentItem_initWithCoder___block_invoke;
      v32[3] = &unk_1E7AF92E8;
      v33 = v9;
      v34 = &v35;
      objc_msgSend(v10, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v11, v32);

      if (v36[5])
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableDescriptionTypeName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDefinitionNamespace"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentDefinitionNamespacedName();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v36[5], "_types");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v28 = v13;
          v29 = (void *)objc_msgSend(v15, "wf_contentItemClassForCustomObjectWithNamespace:", v13);
          v30 = (void *)MEMORY[0x1E0C99E60];
          v16 = objc_opt_class();
          v17 = objc_opt_class();
          v18 = objc_opt_class();
          v19 = objc_opt_class();
          v20 = objc_opt_class();
          objc_msgSend(v30, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("customObject"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_alloc_init(MEMORY[0x1E0CBD9B8]);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD850]), "initWithObject:codableDescription:", 0, v15);
          objc_msgSend(v23, "decodeObject:withCodableDescription:from:", v24, v15, v22);
          objc_msgSend(v29, "itemWithObject:", v24);
          v25 = (WFCustomIntentOutputContentItem *)objc_claimAutoreleasedReturnValue();

          v13 = v28;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCustomIntentOutputContentItemErrorDomain"), 1, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v22);
          v25 = 0;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCustomIntentOutputContentItemErrorDomain"), 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v12);
        v25 = 0;
      }

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCustomIntentOutputContentItemErrorDomain"), 2, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v26);

      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[WFCustomIntentOutputContentItem customObject](self, "customObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:", sel_mainBundleIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  }
  objc_msgSend(v5, "typeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("codableDescriptionTypeName"));

  objc_msgSend(v5, "intentDefinitionNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("intentDefinitionNamespace"));

  v9 = objc_alloc_init(MEMORY[0x1E0CBD9C0]);
  -[WFCustomIntentOutputContentItem customObject](self, "customObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:withCodableDescription:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("customObject"));
}

void __49__WFCustomIntentOutputContentItem_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(a1 + 32), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v2;
  if (v2)
    objc_msgSend(MEMORY[0x1E0CBDB38], "schemaWithBundleRecord:fallbackToSystemSchema:", v2, 0);
  else
    INSyncedSchemaWithBundleID();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  -[WFCustomIntentOutputContentItem customObject](self, "customObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_readableSubtitleWithLocalizer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v7)
    v4[2](v4, v7);

  return v7 != 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFCustomIntentOutputContentItem customObject](self, "customObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_displayImageWithLocalizer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "wf_image");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v9)
    v5[2](v5, v9, 0);

  return v10 != 0;
}

@end
