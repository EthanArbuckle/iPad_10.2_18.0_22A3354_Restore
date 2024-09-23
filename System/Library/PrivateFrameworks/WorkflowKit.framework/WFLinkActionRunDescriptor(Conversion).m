@implementation WFLinkActionRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t i;
  void *v23;
  WFWorkflow *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  WFWorkflow *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(id, void *, _QWORD);
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v55 = a4;
  v8 = a5;
  objc_msgSend(a1, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = a1;
  objc_msgSend(a1, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "compositeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v11, "shortcutsActionMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v15;
  if (v15)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("IdentifierOverrideKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = a3;
      v47 = v11;
      v48 = v10;
      v50 = v8;
      v46 = v16;

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v49 = v9;
      objc_msgSend(v9, "parameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v59;
        v21 = 0x1E0D43000uLL;
        v53 = v17;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v59 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "value", v45);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "value");
            v24 = (WFWorkflow *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = v21;
                v26 = v13;
                -[WFWorkflow identifier](v24, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "instanceIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = 0;
                objc_msgSend(v55, "serializedParametersForAppEntityIdentifier:error:", v28, &v57);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v57;

                if (v30)
                {
                  v8 = v50;
                  ((void (**)(id, void *, id))v50)[2](v50, 0, v30);

                  v42 = v46;
                  v11 = v47;
                  v10 = v48;
                  v34 = v49;
                  v13 = v26;
                  v44 = v46;
                  v41 = v53;
                  goto LABEL_27;
                }
                v13 = v26;
                if (v29)
                {
                  objc_msgSend(MEMORY[0x1E0CB3710], "unarchiveObjectWithData:", v29);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "addEntriesFromDictionary:", v31);

                }
                v21 = v25;
                v17 = v53;
              }
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v19)
            continue;
          break;
        }
      }

      v12 = v46;
      v9 = v49;
      v8 = v50;
      v11 = v47;
      v10 = v48;
      a3 = v45;
    }
    else
    {

    }
  }
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry", v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "createActionWithIdentifier:serializedParameters:forceLocalActionsOnly:", v12, 0, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v54 = v12;
  v34 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFLinkActionSerializedParametersForWFAction(v33, v9, v11);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = a3;
    v37 = objc_msgSend(v35, "mutableCopy");

    v13 = (void *)v37;
    a3 = v36;
  }
  v38 = objc_msgSend(v33, "copyWithSerializedParameters:", v13);

  v39 = [WFWorkflow alloc];
  v40 = (void *)objc_opt_new();
  v56 = 0;
  v24 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:](v39, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v40, 0, 0, 0, a3, &v56);
  v41 = v56;

  if (v24)
  {
    v42 = (void *)v38;
    -[WFWorkflow addAction:](v24, "addAction:", v38);
    if (objc_msgSend(v51, "isAutoShortcut"))
      -[WFWorkflow setSource:](v24, "setSource:", CFSTR("ShortcutSourceAppShortcut"));
    objc_msgSend(v51, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow setName:](v24, "setName:", v43);

    v8[2](v8, v24, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v41);
    v42 = (void *)v38;
  }
  v44 = v54;
LABEL_27:

}

@end
