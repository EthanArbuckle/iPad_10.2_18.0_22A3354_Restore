@implementation WFVariable

- (void)wf_getContentItemsWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__WFVariable_WFVariableStringContent__wf_getContentItemsWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E7AF7128;
  v9 = v6;
  v7 = v6;
  -[WFVariable getContentWithContext:completionHandler:](self, "getContentWithContext:completionHandler:", a3, v8);

}

- (unint64_t)wf_lengthInVariableString
{
  return 1;
}

void __87__WFVariable_WFVariableStringContent__wf_getContentItemsWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(a2, "items");
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v4;
    if (v4)
      v5 = v4;
    else
      v5 = MEMORY[0x1E0C9AA60];
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v5, 0);

  }
}

- (NSString)propertyName
{
  WFVariable *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  WFVariable *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v2 = self;
  v42 = *MEMORY[0x1E0C80C00];
  -[WFVariable possibleContentClasses](self, "possibleContentClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[WFVariable aggrandizements](v2, "aggrandizements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v23 = v2;
    v24 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      v9 = v3;
      v25 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = v10;
          objc_msgSend(v26, "propertyName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v3 = v9;
          v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v32;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v32 != v14)
                  objc_enumerationMutation(v3);
                objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "propertyForName:", v11, v23);
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v21 = (void *)v16;
                  if ((objc_msgSend(v26, "negativeProperty") & 1) != 0)
                    objc_msgSend(v21, "localizedNegativeName");
                  else
                    objc_msgSend(v21, "localizedName");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_32;
                }
              }
              v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              if (v13)
                continue;
              break;
            }
          }

          v7 = v24;
          v6 = v25;
        }
        objc_msgSend(v10, "processedContentClasses:", v9, v23);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      v2 = v23;
    }
    while (v6);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[WFVariable aggrandizements](v2, "aggrandizements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v28;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v4);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "dictionaryKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
      }
      v17 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_32:

  return (NSString *)v17;
}

- (NSString)nameIncludingPropertyName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFVariable propertyName](self, "propertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[WFVariable name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariable propertyName](self, "propertyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFVariable name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (WFVariable)init
{
  return -[WFVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", MEMORY[0x1E0C9AA70], 0);
}

- (WFVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  WFVariable *v15;
  WFVariable *v16;
  WFVariable *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *dictionary;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = (id)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    WFVariableClassesByType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_msgSend(v12, "objectForKey:", v10);

    if (-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", objc_opt_class()))
    {
      v14 = objc_msgSend([v13 alloc], "initWithDictionary:variableProvider:", v6, v7);
      if (v14)
      {
        v15 = (WFVariable *)v14;
LABEL_17:

        goto LABEL_18;
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)WFVariable;
  v16 = -[WFVariable init](&v32, sel_init);
  if (v16)
  {
    v17 = v16;
    if (!v10)
    {
      v18 = objc_opt_class();
      if (v18 == objc_opt_class())
      {
        v10 = 0;
      }
      else
      {
        v19 = (void *)objc_msgSend(v6, "mutableCopy");
        WFVariableClassesByType();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allKeysForObject:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "setValue:forKey:", v10, CFSTR("Type"));
        v6 = v19;
      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("Aggrandizements"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    WFEnforceClass(v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "if_map:", &__block_literal_global_128_42719);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v17->_aggrandizements, v28);

    v29 = objc_msgSend(v6, "copy");
    dictionary = v17->_dictionary;
    v17->_dictionary = (NSDictionary *)v29;

    self = v17;
    v15 = self;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[WFVariable dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WFIcon)icon
{
  return 0;
}

- (NSString)name
{
  return (NSString *)WFLocalizedString(CFSTR("Unknown Variable"));
}

- (BOOL)isRenamed
{
  return 0;
}

- (NSString)UUID
{
  return 0;
}

- (BOOL)isAvailable
{
  return 0;
}

- (BOOL)supportsAggrandizements
{
  return 1;
}

- (BOOL)requiresModernVariableSupport
{
  return 1;
}

- (WFVariableProvider)variableProvider
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFVariable;
  -[WFVariable description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariable nameIncludingPropertyName](self, "nameIncludingPropertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSSet)requiredAccessResources
{
  return 0;
}

- (NSHashTable)delegates
{
  NSHashTable *delegates;
  NSHashTable *v4;
  NSHashTable *v5;

  delegates = self->_delegates;
  if (!delegates)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_delegates;
    self->_delegates = v4;

    delegates = self->_delegates;
  }
  return delegates;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFVariable delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFVariable delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)variableUpdated
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFVariable delegates](self, "delegates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "variableDidChange:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSOrderedSet)possibleContentClasses
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[WFVariable possibleContentClassesWithContext:](self, "possibleContentClassesWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (NSOrderedSet)possibleAggrandizedContentClasses
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[WFVariable possibleAggrandizedContentClassesWithContext:](self, "possibleAggrandizedContentClassesWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  return (id)objc_opt_new();
}

- (id)possibleAggrandizedContentClassesWithContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFVariable possibleContentClassesWithContext:](self, "possibleContentClassesWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFVariable aggrandizements](self, "aggrandizements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "processedContentClasses:", v10);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)getContentWithContext:(id)a3 trackContentAttribution:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF41B8;
  aBlock[4] = self;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v22 = a4;
  v13 = _Block_copy(aBlock);
  v14 = v13;
  if (v11)
  {
    -[WFVariable requiredAccessResources](self, "requiredAccessResources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_4;
    v17[3] = &unk_1E7AF64E8;
    v18 = v14;
    objc_msgSend(v16, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v15, v17);

  }
  else
  {
    (*((void (**)(void *))v13 + 2))(v13);
  }

}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  -[WFVariable getContentWithContext:trackContentAttribution:completionHandler:](self, "getContentWithContext:trackContentAttribution:completionHandler:", a3, 1, a4);
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)getObjectRepresentationForClass:(Class)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  Class v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke;
  v12[3] = &unk_1E7AF4208;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v8;
  v11 = v9;
  -[WFVariable getContentWithContext:trackContentAttribution:completionHandler:](self, "getContentWithContext:trackContentAttribution:completionHandler:", v10, 0, v12);

}

- (void)getFileRepresentationWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF6F98;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[WFVariable getContentWithContext:trackContentAttribution:completionHandler:](self, "getContentWithContext:trackContentAttribution:completionHandler:", v8, 0, v10);

}

- (BOOL)isEqual:(id)a3
{
  WFVariable *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (WFVariable *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariable dictionary](v4, "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariable dictionary](self, "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[WFVariable variableProvider](self, "variableProvider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFVariable variableProvider](v4, "variableProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7 == v8;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFVariable dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFVariable variableProvider](self, "variableProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash") ^ 0x4620840A;

  return v6;
}

- (id)variableBySettingAggrandizements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFVariable dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  WFVariableDictionaryWithAggrandizements(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);
  else
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("Aggrandizements"));
  v10 = objc_alloc((Class)objc_opt_class());
  -[WFVariable variableProvider](self, "variableProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithDictionary:variableProvider:", v6, v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFVariable dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariable variableProvider](self, "variableProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDictionary:variableProvider:", v5, v6);

  return v7;
}

- (NSArray)aggrandizements
{
  return self->_aggrandizements;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_aggrandizements, 0);
}

void __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke_2;
    v5[3] = &unk_1E7AF4230;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getFileRepresentationAndAttributionSet:forType:", v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v7 && *(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addContentAttributionSet:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke_2;
    v5[3] = &unk_1E7AF41E0;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "getObjectRepresentationAndAttributionSet:forClass:", v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10 && *(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addContentAttributionSet:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "variableSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2;
  v7[3] = &unk_1E7AF4190;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v7[4] = v5;
  v10 = *(_BYTE *)(a1 + 56);
  v8 = v6;
  objc_msgSend(v2, "retrieveContentCollectionWithVariableSource:completionHandler:", v3, v7);

}

uint64_t __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  char v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__42700;
    v17[4] = __Block_byref_object_dispose__42701;
    v18 = v5;
    objc_msgSend(*(id *)(a1 + 32), "aggrandizements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_141;
    v16[3] = &unk_1E7AF4140;
    v16[4] = v17;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_3;
    v11[3] = &unk_1E7AF4168;
    v14 = v17;
    v15 = *(_BYTE *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v8, "if_enumerateAsynchronouslyInSequence:completionHandler:", v16, v11);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
    }
    else
    {
      v10 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
  }

}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_141(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2_142;
  v12[3] = &unk_1E7AF4118;
  v14 = v9;
  v15 = a5;
  v13 = v8;
  v11 = v8;
  objc_msgSend(a2, "applyToContentCollection:completionHandler:", v10, v12);

}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v11 = (id)v4;
  if (v5)
  {
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_6;
    v6 = *(void **)(a1 + 32);
    objc_msgSend((id)v5, "attributionSet", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addContentAttributionSet:", v7);

    v4 = (unint64_t)v11;
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  if (!(v4 | v5))
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2_142(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (!v10 || v6)
  {
    **(_BYTE **)(a1 + 48) = 1;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

WFVariableAggrandizement *__50__WFVariable_initWithDictionary_variableProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFVariableAggrandizement *v3;

  v2 = a2;
  v3 = -[WFVariableAggrandizement initWithDictionary:]([WFVariableAggrandizement alloc], "initWithDictionary:", v2);

  return v3;
}

@end
