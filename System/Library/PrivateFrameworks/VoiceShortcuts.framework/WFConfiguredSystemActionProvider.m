@implementation WFConfiguredSystemActionProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WFConfiguredSystemActionProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken_921 != -1)
    dispatch_once(&sharedProvider_onceToken_921, block);
  return (id)sharedProvider_sharedProvider;
}

void __50__WFConfiguredSystemActionProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v1;

}

- (id)availableActionTypes
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCapability:", *MEMORY[0x1E0DC80B8]);

  if (v4)
    objc_msgSend(v2, "addObject:", *MEMORY[0x1E0DC82F8]);
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x1E0DC80C0]);

  if (v6)
    objc_msgSend(v2, "addObject:", *MEMORY[0x1E0DC8300]);
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (id)configuredSystemActionForActionType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC82F8]))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
    objc_msgSend(v4, "objectForKey:", CFSTR("SBSystemActionConfiguredActionArchive"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (!v6)
    {
      getWFStaccatoLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      goto LABEL_9;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC8300]))
    {
      v6 = 0;
      goto LABEL_12;
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
    objc_msgSend(v4, "objectForKey:", CFSTR("SBPencilSystemShortcutAction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v6)
    {
      getWFStaccatoLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        *(_DWORD *)buf = 136315650;
        v13 = "-[WFConfiguredSystemActionProvider configuredSystemActionForActionType:]";
        v14 = 2112;
        v15 = v3;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to read configured action for type: %@ due to: %@", buf, 0x20u);
      }
LABEL_9:

      v6 = 0;
    }
  }

LABEL_12:
  return v6;
}

- (id)defaultSystemActionForActionType:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC7A28];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC82F8]);

  if (v7)
  {
    v8 = (id)*MEMORY[0x1E0DC82D0];
    -[WFConfiguredSystemActionProvider linkActionWithStaccatoIdentifier:](self, "linkActionWithStaccatoIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D70]), "initWithIdentifier:sectionIdentifier:linkAction:", v8, CFSTR("SilentMode"), v9);
      v17 = 0;
      -[WFConfiguredSystemActionProvider configuredStaccatoActionFromTemplate:valuesByParameterKey:error:](self, "configuredStaccatoActionFromTemplate:valuesByParameterKey:error:", v10, MEMORY[0x1E0C9AA70], &v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        getWFStaccatoLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "-[WFConfiguredSystemActionProvider defaultSystemActionForActionType:]";
          v20 = 2112;
          v21 = v8;
          _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to find link action for default action identifier: %@", buf, 0x16u);
        }

        v12 = v6;
      }
      v14 = v12;

    }
    else
    {
      getWFStaccatoLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFConfiguredSystemActionProvider defaultSystemActionForActionType:]";
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to find link action for default action identifier: %@", buf, 0x16u);
      }

      v14 = v6;
    }

  }
  else
  {
    v14 = v6;
  }

  return v14;
}

- (BOOL)saveUpdatedAction:(id)a3 forActionType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC82F8]))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v7)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v7, CFSTR("SBSystemActionConfiguredActionArchive"));
      getWFStaccatoLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      goto LABEL_9;
    }
    getWFStaccatoLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      *(_DWORD *)buf = 136315906;
      v16 = "-[WFConfiguredSystemActionProvider saveUpdatedAction:forActionType:]";
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to save updated action %@ of type %@ due to: %@", buf, 0x2Au);
    }
LABEL_15:
    v7 = 0;
    v11 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC8300]))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v7, CFSTR("SBPencilSystemShortcutAction"));
      getWFStaccatoLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        *(_DWORD *)buf = 136315650;
        v16 = "-[WFConfiguredSystemActionProvider saveUpdatedAction:forActionType:]";
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Successfuly saved updated action %@ of type %@.", buf, 0x20u);
      }
LABEL_9:

      v11 = 1;
LABEL_16:

      goto LABEL_17;
    }
    getWFStaccatoLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)linkActionWithStaccatoIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DD9C20];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithActionIdentifier:serializedParameters:", v4, MEMORY[0x1E0C9AA70]);

  objc_msgSend(MEMORY[0x1E0DD9D98], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createActionsForRequests:", v8);

  objc_msgSend(v6, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (id)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemActionProvider linkActionWithStaccatoIdentifier:](self, "linkActionWithStaccatoIdentifier:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v11;
  if (v11)
  {
    v47 = v9;
    v48 = v8;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v49, "parameterForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc((Class)objc_msgSend(v18, "stateClass"));
          objc_msgSend(v19, "serializedState");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithSerializedRepresentation:variableProvider:parameter:", v21, 0, v18);

          getWFStaccatoLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v60 = "-[WFConfiguredSystemActionProvider configuredStaccatoActionFromTemplate:valuesByParameterKey:error:]";
            v61 = 2112;
            v62 = v22;
            v63 = 2112;
            v64 = v17;
            _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_INFO, "%s Setting %@ for %@", buf, 0x20u);
          }

          objc_msgSend(v49, "setParameterState:forKey:", v22, v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v14);
    }

    v24 = v49;
    v25 = objc_msgSend(v24, "conformsToProtocol:", &unk_1EF716E70);
    if (v25)
      v26 = v24;
    else
      v26 = 0;
    v27 = v26;

    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "defaultParameterStatesForStaccato");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v51 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            objc_msgSend(v28, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setParameterState:forKey:", v34, v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v30);
      }

    }
    v35 = objc_alloc(MEMORY[0x1E0CBD738]);
    objc_msgSend(v24, "fullyQualifiedLinkActionIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "linkActionWithSerializedParameters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "metadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v35, "initWithAppBundleIdentifier:linkAction:linkActionMetadata:", v37, v38, v39);

    v41 = objc_alloc(MEMORY[0x1E0DC7A08]);
    objc_msgSend(v24, "localizedName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithIntent:named:previewIcon:appShortcutIdentifier:templateParameterValues:contextualParameters:shortcutsMetadata:", v40, v42, 0, 0, v12, 0, 0);

    v9 = v47;
    v8 = v48;
  }
  else
  {
    getWFStaccatoLogObject();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[WFConfiguredSystemActionProvider configuredStaccatoActionFromTemplate:valuesByParameterKey:error:]";
      v61 = 2112;
      v62 = v8;
      _os_log_impl(&dword_1C146A000, v44, OS_LOG_TYPE_ERROR, "%s Failed to find link action for template: %@", buf, 0x16u);
    }

    if (!a5)
    {
      v43 = 0;
      goto LABEL_30;
    }
    v45 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "identifier");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "vc_voiceShortcutErrorWithCode:reason:", 1002, CFSTR("Action template with identifier (%@) does not resolve to valid link action"), v27);
    v43 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_30:
  return v43;
}

@end
