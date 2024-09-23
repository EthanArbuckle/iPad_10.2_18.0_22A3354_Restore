@implementation WFResizeToCropActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if (WFCompareBundleVersions(a4, CFSTR("128")) == 3)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.image.resize"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  void *v3;
  void *v4;
  void *v5;
  WFResizeToCropActionMigration *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WFResizeToCropActionMigration *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayForKey:value:", v4, CFSTR("is.workflow.actions.image.resize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v5;
  v40 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v40)
  {
    v38 = v7;
    v39 = *(_QWORD *)v45;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v7);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        -[WFWorkflowMigration actionParametersKey](v6, "actionParametersKey", v38);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v9;
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageResizeCropEnabled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageResizeWidth"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = &unk_1E7B8B878;
        if (v13)
          v15 = (void *)v13;
        v43 = v15;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageResizeHeight"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = &unk_1E7B8B890;
        if (v16)
          v18 = (void *)v16;
        v42 = v18;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageResizeCropX"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (void *)v19;
        else
          v21 = &unk_1E7B8B8A8;
        v22 = v21;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageResizeCropY"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (void *)v23;
        else
          v25 = &unk_1E7B8B8A8;
        v26 = v25;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "BOOLValue"))
        {
          v27 = (void *)objc_opt_new();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v43, CFSTR("WFImageCropWidth"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, CFSTR("WFImageCropHeight"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && !objc_msgSend(v22, "integerValue")
            && !objc_msgSend(v26, "integerValue"))
          {
            v28 = CFSTR("Top Left");
            v30 = &unk_1E7B8B8A8;
            v29 = &unk_1E7B8B8A8;
          }
          else
          {
            v28 = CFSTR("Custom");
            v29 = v22;
            v30 = v26;
          }
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("WFImageCropPosition"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("WFImageCropX"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("WFImageCropY"));
          v31 = (void *)objc_opt_new();
          -[WFWorkflowMigration actionIdentifierKey](v6, "actionIdentifierKey");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("is.workflow.actions.image.crop"), v32);

          -[WFWorkflowMigration actionParametersKey](v6, "actionParametersKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v27, v33);

          -[WFWorkflowMigration actions](v6, "actions");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowMigration actions](v6, "actions");
          v35 = v6;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "insertObject:atIndex:", v31, objc_msgSend(v36, "indexOfObject:", v41) + 1);

          v6 = v35;
          v7 = v38;
        }
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("WFImageResizeCropEnabled"));
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("WFImageResizeCropX"));
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("WFImageResizeCropY"));

        ++v8;
      }
      while (v40 != v8);
      v37 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v40 = v37;
    }
    while (v37);
  }

  -[WFWorkflowMigration finish](v6, "finish");
}

@end
