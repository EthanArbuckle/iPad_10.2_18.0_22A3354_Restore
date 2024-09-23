@implementation WFContextualActionRunDescriptor

void __104__WFContextualActionRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFWorkflow *v4;
  void *v5;
  uint64_t v6;
  WFWorkflow *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  void *v17;
  void *v18;
  void (*v19)(void);
  void *v20;
  char v21;
  id v22;

  v3 = a2;
  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_17;
  }
  v4 = [WFWorkflow alloc];
  v5 = (void *)objc_opt_new();
  v6 = *(_QWORD *)(a1 + 56);
  v22 = 0;
  v7 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:](v4, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v5, 0, 0, 0, v6, &v22);
  v8 = v22;

  objc_msgSend(v3, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow setName:](v7, "setName:", v9);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("is.workflow.actions.runworkflow")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "associatedAppBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DC7EF0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "associatedAppBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC7F18]);

      if ((v21 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }

  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow icon](v7, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSymbolOverride:", v13);

LABEL_7:
  if (v7)
  {
    -[WFWorkflow addAction:](v7, "addAction:", v3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFWorkflow setSource:](v7, "setSource:", CFSTR("ShortcutSourceAppShortcut"));
    v15 = objc_msgSend(*(id *)(a1 + 32), "outputsFiles");
    objc_msgSend(*(id *)(a1 + 40), "surface");
    v16 = WFContextualActionSurfaceSupportsOutput();
    if (v15 && (v16 & 1) == 0)
    {
      +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.showresult"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflow addAction:](v7, "addAction:", v18);
      objc_msgSend(v18, "unlockInputParameter");
      objc_msgSend(v18, "snapInputParameterIfNecessary");

    }
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v19();

LABEL_17:
}

@end
