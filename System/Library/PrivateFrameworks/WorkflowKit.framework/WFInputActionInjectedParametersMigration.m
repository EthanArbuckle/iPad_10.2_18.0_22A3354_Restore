@implementation WFInputActionInjectedParametersMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, CFSTR("1158")) == 3;
}

- (void)migrateWorkflow
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  id v27;

  -[WFWorkflowMigration workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFWorkflowNoInputBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v6, "mutableCopy");

  if (v27)
  {
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("WFWorkflowNoInputBehaviorAskForInput")) & 1) == 0)
    {
      -[WFWorkflowMigration finish](self, "finish");
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Parameters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_opt_new();
    v16 = v15;

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ItemClass"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    WFEnforceClass(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_opt_new();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("WFFolderContentItem")))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("WFGenericFileContentItem"), CFSTR("ItemClass"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("Folders"), CFSTR("WFPickingMode"));
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AllowMultipleSelection"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    WFEnforceClass(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
    {
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("WFGenericFileContentItem")) & 1) != 0
        || (objc_msgSend(v19, "isEqualToString:", CFSTR("WFFolderContentItem")) & 1) != 0)
      {
        v25 = CFSTR("SelectMultiple");
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("WFPhotoMediaContentItem")) & 1) != 0)
      {
        v25 = CFSTR("WFSelectMultiplePhotos");
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("WFContactContentItem")) & 1) != 0)
      {
        v25 = CFSTR("WFSelectMultiple");
      }
      else
      {
        if (!objc_msgSend(v19, "isEqualToString:", CFSTR("WFMPMediaContentItem")))
          goto LABEL_15;
        v25 = CFSTR("WFExportSongActionSelectMultiple");
      }
      objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v25);
    }
LABEL_15:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("SerializedParameters"));
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v16, CFSTR("Parameters"));
    -[WFWorkflowMigration workflow](self, "workflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("WFWorkflowNoInputBehavior"));

    -[WFWorkflowMigration finish](self, "finish");
    goto LABEL_16;
  }
  -[WFWorkflowMigration finish](self, "finish");
LABEL_17:

}

@end
