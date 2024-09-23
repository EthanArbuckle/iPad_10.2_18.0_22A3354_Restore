@implementation WFInterchangeAction

- (WFInterchangeAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  char v40;
  id v41;
  WFInterchangeAction *v42;
  WFInterchangeAction *v43;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v7 = a4;
  v51 = a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("AppDefinition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v10;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC7920]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v52 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("ICActionIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v17 = v16 == 0;
  else
    v17 = 1;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Interchange actions created from the bundled action must include an app identifier and Interchange action identifier"), 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v45);
  }
  +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v13;
  objc_msgSend(v18, "appWithIdentifier:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  v21 = v16;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v20, "schemes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v47)
  {
    v23 = *(_QWORD *)v64;
    v48 = v20;
    v46 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v64 != v23)
          objc_enumerationMutation(v22);
        v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v25, "actions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v60;
          while (2)
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v60 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
              objc_msgSend(v31, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqualToString:", v21);

              if ((v33 & 1) != 0)
              {
                v41 = v31;

                v20 = v48;
                goto LABEL_31;
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
            if (v28)
              continue;
            break;
          }
        }

        v20 = v48;
        v23 = v46;
      }
      v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v47);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v20, "documentActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v56;
    while (2)
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(v22);
        v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v38, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", v21);

        if ((v40 & 1) != 0)
        {
          v41 = v38;
          goto LABEL_31;
        }
      }
      v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v35)
        continue;
      break;
    }
  }
  v41 = 0;
LABEL_31:

  v42 = self;
  if (v41)
  {
    v42 = -[WFInterchangeAction initWithInterchangeAction:identifier:definition:serializedParameters:](self, "initWithInterchangeAction:identifier:definition:serializedParameters:", v41, v54, v52, v51);
    v43 = v42;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (WFInterchangeAction)initWithInterchangeAction:(id)a3 identifier:(id)a4 definition:(id)a5 serializedParameters:(id)a6
{
  id v11;
  id v12;
  WFActionDefinition *v13;
  id v14;
  WFActionDefinition *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  WFInterchangeAction *v33;
  WFInterchangeAction *v34;
  WFInterchangeAction *v35;
  void *v37;
  id v39;
  void *v40;
  objc_super v41;
  const __CFString *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (WFActionDefinition *)a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInterchangeAction.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v39 = v14;
  v40 = v12;
  if (!v13)
  {
    v15 = [WFActionDefinition alloc];
    v13 = -[WFActionDefinition initWithDictionary:](v15, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  v46[0] = CFSTR("AppDefinition");
  v44 = *MEMORY[0x1E0DC7920];
  objc_msgSend(v11, "app");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = CFSTR("ICActionIdentifier");
  v47[0] = v18;
  objc_msgSend(v11, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionDefinition definitionByAddingEntriesInDictionary:](v13, "definitionByAddingEntriesInDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectForKey:", CFSTR("Parameters"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = v39;
  }
  else
  {
    objc_msgSend(v11, "inputMapping");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sourceType = %@"), CFSTR("Parameter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "if_compactMap:", &__block_literal_global_58306);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("Parameters");
      v43 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "definitionByAddingEntriesInDictionary:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v29;
    }
    v23 = v39;

  }
  objc_msgSend(v11, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInterchangeAction disabledPlatformsForInterchangeActionWithIdentifier:](self, "disabledPlatformsForInterchangeActionWithIdentifier:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  WFInjectDisabledPlatformsInActionDefinition(v31, v21);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v41.receiver = self;
  v41.super_class = (Class)WFInterchangeAction;
  v33 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v41, sel_initWithIdentifier_definition_serializedParameters_, v40, v32, v23);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_interchangeAction, a3);
    v35 = v34;
  }

  return v34;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFInterchangeAction;
  -[WFAction description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInterchangeAction app](self, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedNameWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("Unknown Action"), CFSTR("Unknown Action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)parameterSummary
{
  void *v2;
  void *v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameterSummaryDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedSubcategoryWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionDefinition
{
  void *v2;
  void *v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keywords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("|"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (BOOL)isDiscontinued
{
  void *v2;
  char v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiscontinued");

  return v3;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  void *v4;
  char v5;
  objc_super v7;

  if (a3)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)WFInterchangeAction;
  if (!-[WFAction visibleForUse:](&v7, sel_visibleForUse_))
    return 0;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDiscoverable");

  return v5;
}

- (id)appDescriptorFromICApp:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CBD728];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v6, v7, 0, 0, 0, 0, 0, 0);
  return v8;
}

- (id)appDescriptor
{
  INAppDescriptor *appDescriptor;
  void *v4;
  void *v5;
  INAppDescriptor *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INAppDescriptor *v13;
  INAppDescriptor *v14;

  appDescriptor = self->_appDescriptor;
  if (appDescriptor)
    goto LABEL_4;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInterchangeAction appDescriptorFromICApp:](self, "appDescriptorFromICApp:", v5);
  v6 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "app");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resolvedAppMatchingDescriptor:", v6);
    v13 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();
    v14 = self->_appDescriptor;
    self->_appDescriptor = v13;

    appDescriptor = self->_appDescriptor;
LABEL_4:
    v6 = appDescriptor;
  }
  return v6;
}

- (BOOL)appResourceRequiresAppInstall
{
  return 1;
}

- (id)requiredResources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredResourceNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "definition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RequiredResources"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (!v8)
  {
    if (v5)
    {
      v29 = v5;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v5;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v14, "isEqualToString:", CFSTR("WFAppInstalledResource")) & 1) == 0)
            {
              v15 = v3;
              v16 = (void *)objc_opt_new();
              objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("WFResourceClass"));
              -[WFInterchangeAction interchangeAction](self, "interchangeAction");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "app");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("AppIdentifier"));

              -[WFInterchangeAction interchangeAction](self, "interchangeAction");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              LOBYTE(v19) = objc_opt_isKindOfClass();

              if ((v19 & 1) != 0)
              {
                -[WFInterchangeAction interchangeAction](self, "interchangeAction");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "scheme");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "scheme");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKey:", v23, CFSTR("UtilizedScheme"));

              }
              v3 = v15;
              objc_msgSend(v15, "addObject:", v16);

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v11);
      }

      v8 = 0;
      v5 = v29;
    }
    -[WFInterchangeAction interchangeAction](self, "interchangeAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_isKindOfClass();

    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    v9 = v3;
  }
  v27 = v9;

  return v27;
}

- (id)userInterfaceTypes
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8[0] = *MEMORY[0x1E0D14330];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFInterchangeAction;
    -[WFAction userInterfaceTypes](&v7, sel_userInterfaceTypes);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)app
{
  void *v2;
  void *v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)inputRequired
{
  void *v2;
  char v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputRequired");

  return v3;
}

- (BOOL)inputPassthrough
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContentClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)inputParameterKey
{
  void *v2;
  void *v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputParameterSourceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)specifiedInputContentClasses
{
  void *v2;
  void *v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputContentClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputContentClasses
{
  uint64_t v3;
  NSArray *contentClasses;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = 352;
  contentClasses = self->_contentClasses;
  if (!contentClasses)
  {
    -[WFInterchangeAction interchangeAction](self, "interchangeAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "skipItemClassesSupportingInput");

    if (v6)
    {
      -[WFInterchangeAction interchangeAction](self, "interchangeAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputContentClasses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSArray *)objc_msgSend(v8, "copy");
      v10 = self->_contentClasses;
      self->_contentClasses = v9;

    }
    else
    {
      v29 = 352;
      v7 = (void *)objc_opt_new();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[WFInterchangeAction interchangeAction](self, "interchangeAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inputContentClasses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v37;
        v30 = *(_QWORD *)v37;
        v31 = v12;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v37 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (v17 == (void *)objc_opt_class()
              || v17 == (void *)objc_opt_class()
              || v17 == (void *)objc_opt_class()
              || v17 == (void *)objc_opt_class())
            {
              objc_msgSend(v7, "addObject:", v17, v29);
            }
            else
            {
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v17, "ownedTypes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v33;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v33 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                    objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry", v29);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "contentItemClassesSupportingType:", v23);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "unionSet:", v25);

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                }
                while (v20);
              }

              v15 = v30;
              v12 = v31;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v14);
      }

      objc_msgSend(v7, "array");
      v26 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v3 = v29;
      v27 = *(Class *)((char *)&self->super.super.isa + v29);
      *(Class *)((char *)&self->super.super.isa + v29) = v26;

    }
    contentClasses = *(NSArray **)((char *)&self->super.super.isa + v3);
  }
  return contentClasses;
}

- (id)specifiedOutputContentClasses
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputContentClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    -[WFInterchangeAction specifiedInputContentClasses](self, "specifiedInputContentClasses");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputContentClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    -[WFInterchangeAction inputContentClasses](self, "inputContentClasses");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)inputsMultipleItems
{
  void *v2;
  char v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputsMultipleItems");

  return v3;
}

- (BOOL)outputsMultipleItems
{
  void *v4;
  char v5;

  if (-[WFInterchangeAction inputPassthrough](self, "inputPassthrough"))
    return -[WFInterchangeAction inputsMultipleItems](self, "inputsMultipleItems");
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "outputsMultipleItems");

  return v5;
}

- (BOOL)neverSuggested
{
  void *v2;
  char v3;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "neverSuggested");

  return v3;
}

- (BOOL)requiresCallback
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFInterchangeAction interchangeAction](self, "interchangeAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCallbackAction"))
      v5 = !-[WFInterchangeAction callbackIsCurrentlyDisabled](self, "callbackIsCurrentlyDisabled");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldSuppressCallback
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[WFAction workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "indexOfObject:", self);
  v9 = v8 == objc_msgSend(v7, "count") - 1;

  return v9;
}

- (BOOL)callbackIsCurrentlyDisabled
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[WFInterchangeAction shouldSuppressCallback](self, "shouldSuppressCallback"))
    return 1;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      objc_msgSend(v10, "destinationType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("DisableCallback")))
        goto LABEL_12;
      objc_msgSend(v10, "sourceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Parameter"));

      if (v13)
        break;
LABEL_13:
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_15;
      }
    }
    -[WFAction processedParameters](self, "processedParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[WFAction processedParameters](self, "processedParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sourceKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[WFInterchangeAction mappedValueIsTrue:forContentMapping:](self, "mappedValueIsTrue:forContentMapping:", v20, v10);

LABEL_18:
      goto LABEL_19;
    }
    objc_msgSend(v10, "sourceKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v11, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[WFInterchangeAction mappedValueIsTrue:forContentMapping:](self, "mappedValueIsTrue:forContentMapping:", v19, v10);
      goto LABEL_18;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:
  v3 = 0;
LABEL_19:

  return v3;
}

- (BOOL)mappedValueIsTrue:(id)a3 forContentMapping:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  objc_msgSend(v6, "valueMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v5;
  v13 = v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v13, "BOOLValue");
  else
    v14 = 0;

  return v14;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a3;
  if (-[WFInterchangeAction requiresCallback](self, "requiresCallback"))
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[WFAction runningDelegate](self, "runningDelegate");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "currentRunningContextForAction:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v7) = objc_msgSend(v8, "isShortcutsApp");
      if ((v7 & 1) == 0)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 2, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v9);
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applicationOrNil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_4;
    }
  }
  -[WFAction processedParameters](self, "processedParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v12, "mutableCopy");

  if (-[WFInterchangeAction shouldSuppressCallback](self, "shouldSuppressCallback"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DisableCallback"));
  -[WFAction userInterface](self, "userInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_1E7AF7B50;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke_2;
  v14[3] = &unk_1E7AF7B78;
  -[WFInterchangeAction performActionWithInput:parameters:userInterface:successHandler:errorHandler:](self, "performActionWithInput:parameters:userInterface:successHandler:errorHandler:", v4, v9, v13, v15, v14);

LABEL_9:
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[WFInterchangeAction interchangeAction](self, "interchangeAction");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performActionWithInput:parameters:userInterface:successHandler:errorHandler:", v16, v15, v14, v13, v12);

}

- (id)disabledPlatformsForInterchangeActionWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInterchangeAction.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_6:
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_7;
  }
  v7 = (__CFString *)v5;
  if (v7 != CFSTR("com.apple.iBooks.openin"))
  {
    v8 = v7;
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.iBooks.openin"));

    if (!v9)
      goto LABEL_6;
  }
  v13[0] = CFSTR("Watch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (void)setAppDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptor, a3);
}

- (ICAction)interchangeAction
{
  return self->_interchangeAction;
}

- (NSArray)contentClasses
{
  return self->_contentClasses;
}

- (void)setContentClasses:(id)a3
{
  objc_storeStrong((id *)&self->_contentClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClasses, 0);
  objc_storeStrong((id *)&self->_interchangeAction, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
}

void __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = v5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if (v5)
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setOutput:", v7);
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

id __92__WFInterchangeAction_initWithInterchangeAction_identifier_definition_serializedParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "parameterUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("Key");
  objc_msgSend(v2, "sourceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "definitionByAddingEntriesInDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "parameterDefault");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12 = CFSTR("DefaultValue");
    objc_msgSend(v2, "parameterDefault");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "definitionByAddingEntriesInDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

@end
