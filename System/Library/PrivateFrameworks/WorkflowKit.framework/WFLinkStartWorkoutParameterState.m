@implementation WFLinkStartWorkoutParameterState

- (WFLinkStartWorkoutParameterState)initWithLinkAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLinkStartWorkoutParameterState;
  return -[WFVariableSubstitutableParameterState initWithValue:](&v4, sel_initWithValue_, a3);
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_623);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

uint64_t __50__WFLinkStartWorkoutParameterState_localizedTitle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("workoutStyle"));

  return v3;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v5 = a3;
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MangledTypeName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PresentationStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Parameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  WFEnforceClass(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __WFLinkActionFromSerializedRepresentation_block_invoke;
  v24[3] = &unk_1E7AEA3D8;
  v25 = v20;
  v21 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43B88]), "initWithIdentifier:mangledTypeName:presentationStyle:parameters:", v10, v13, objc_msgSend(v16, "integerValue"), v21);

  return v22;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFLinkStartWorkoutParameterState.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[LNAction class]]"));

  }
  v6 = v5;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("Identifier"));

  objc_msgSend(v6, "mangledTypeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "mangledTypeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("MangledTypeName"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "presentationStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("PresentationStyle"));

  v12 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  objc_msgSend(v6, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E0CB36F8];
        objc_msgSend(v18, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v19, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v28;

        if (v22)
        {
          getWFAppIntentsLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "WFSerializedRepresentationFromLinkAction";
            v35 = 2112;
            v36 = v22;
            _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s Could not archive LNValue into data: %@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v18, "identifier");
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v23);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v15);
  }

  objc_msgSend(v27, "setObject:forKey:", v12, CFSTR("Parameters"));
  return v27;
}

@end
