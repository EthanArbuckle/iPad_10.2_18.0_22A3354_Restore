@implementation WFSystemActionRunnerClient

- (WFSystemActionRunnerClient)initWithSystemAction:(id)a3
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  WFSystemActionRunnerClient *v19;
  void *v21;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSystemActionRunnerClient.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    self = -[WFSystemActionRunnerClient initWithSystemIntentAction:](self, "initWithSystemIntentAction:", v9);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    if (v6)
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
    v12 = v11;

    self = -[WFSystemActionRunnerClient initWithSystemContextualAction:](self, "initWithSystemContextualAction:", v12);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v6;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    self = -[WFSystemActionRunnerClient initWithSystemWorkflowAction:](self, "initWithSystemWorkflowAction:", v15);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v6;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    self = -[WFSystemActionRunnerClient initWithSystemNothingAction:](self, "initWithSystemNothingAction:", v18);
  }
  if (self)
  {
    objc_storeStrong((id *)&self->_action, a3);
    v19 = self;
  }

  return self;
}

- (WFSystemActionRunnerClient)initWithSystemIntentAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFLinkContextualAction *v10;
  void *v11;
  void *v12;
  WFLinkContextualAction *v13;
  void *v14;
  WFContextualActionRunDescriptor *v15;
  WFContextualActionRunRequest *v16;
  WFSystemActionRunnerClient *v17;
  WFSystemActionRunnerClient *v18;
  WFSystemActionRunnerClient *v19;

  v4 = a3;
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "previewIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "symbolName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
      v8 = v7;
      v7 = 0;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v10 = [WFLinkContextualAction alloc];
  objc_msgSend(v4, "associatedBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFLinkContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:contextualParameters:authenticationPolicy:icon:](v10, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:contextualParameters:authenticationPolicy:icon:", v6, v11, 0, v12, 0, v9);

  objc_msgSend((id)objc_opt_class(), "defaultContextualActionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v13, v14);
  v16 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v13, v14);
  -[WFWorkflowRunRequest setPresentationMode:](v16, "setPresentationMode:", 1);
  v17 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v15, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionContext, v14);
    v19 = v18;
  }

  return v18;
}

- (WFSystemActionRunnerClient)initWithSystemContextualAction:(id)a3
{
  id v4;
  void *v5;
  WFContextualActionRunDescriptor *v6;
  void *v7;
  WFContextualActionRunDescriptor *v8;
  WFContextualActionRunRequest *v9;
  void *v10;
  WFContextualActionRunRequest *v11;
  WFSystemActionRunnerClient *v12;
  WFSystemActionRunnerClient *v13;
  WFSystemActionRunnerClient *v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultContextualActionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [WFContextualActionRunDescriptor alloc];
  objc_msgSend(v4, "contextualAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFContextualActionRunDescriptor initWithAction:context:](v6, "initWithAction:context:", v7, v5);

  v9 = [WFContextualActionRunRequest alloc];
  objc_msgSend(v4, "contextualAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFContextualActionRunRequest initWithAction:actionContext:](v9, "initWithAction:actionContext:", v10, v5);
  -[WFWorkflowRunRequest setPresentationMode:](v11, "setPresentationMode:", 1);
  v12 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v8, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionContext, v5);
    v14 = v13;
  }

  return v13;
}

- (WFSystemActionRunnerClient)initWithSystemWorkflowAction:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  void *v6;
  WFWorkflowDatabaseRunDescriptor *v7;
  WFWorkflowRunRequest *v8;
  WFSystemActionRunnerClient *v9;

  v4 = a3;
  v5 = [WFWorkflowDatabaseRunDescriptor alloc];
  objc_msgSend(v4, "workflowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:](v5, "initWithIdentifier:", v6);
  v8 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  v9 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v7, v8);

  return v9;
}

- (void)start
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isChineseRegionCelluarDevice") & 1) == 0)
    goto LABEL_18;
  -[WFSystemActionRunnerClient action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_19:
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v3 = v29;

    objc_msgSend(v3, "action");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    v32 = v31;

    objc_msgSend(v3, "actionContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "wf_launchAppIfNeededUsingSurface:", objc_msgSend(v33, "surface"));

    v36.receiver = self;
    v36.super_class = (Class)WFSystemActionRunnerClient;
    -[WFWorkflowRunnerClient start](&v36, sel_start);
    goto LABEL_30;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v6 = (void *)getPDCPreflightManagerClass_softClass;
  v45 = getPDCPreflightManagerClass_softClass;
  if (!getPDCPreflightManagerClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getPDCPreflightManagerClass_block_invoke;
    v40 = &unk_1E5FC8858;
    v41 = &v42;
    __getPDCPreflightManagerClass_block_invoke((uint64_t)&v37);
    v6 = (void *)v43[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v42, 8);
  v8 = [v7 alloc];
  dispatch_get_global_queue(0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v8, "initWithTargetQueue:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[WFSystemActionRunnerClient action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "associatedBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);

  if ((objc_msgSend(v3, "requiresPreflightForApplicationRecord:", v13) & 1) == 0)
  {

LABEL_18:
    goto LABEL_19;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v14 = (void *)getFBSOpenApplicationServiceClass_softClass;
  v45 = getFBSOpenApplicationServiceClass_softClass;
  if (!getFBSOpenApplicationServiceClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getFBSOpenApplicationServiceClass_block_invoke;
    v40 = &unk_1E5FC8858;
    v41 = &v42;
    __getFBSOpenApplicationServiceClass_block_invoke((uint64_t)&v37);
    v14 = (void *)v43[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v15, "serviceWithDefaultShellEndpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99D80];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v18 = (id *)getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
  v45 = getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
  if (!getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = (uint64_t)__getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_block_invoke;
    v40 = &unk_1E5FC8858;
    v41 = &v42;
    __getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_block_invoke(&v37);
    v18 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (v18)
  {
    v19 = *v18;
    v37 = 0;
    v38 = (uint64_t)&v37;
    v39 = 0x2020000000;
    v20 = (_QWORD *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
    v40 = (void *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
    if (!getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr)
    {
      v21 = FrontBoardServicesLibrary();
      v20 = dlsym(v21, "FBSOpenApplicationOptionKeyLaunchOrigin");
      *(_QWORD *)(v38 + 24) = v20;
      getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = (uint64_t)v20;
    }
    _Block_object_dispose(&v37, 8);
    if (v20)
    {
      objc_msgSend(v17, "dictionaryWithObject:forKey:", v19, *v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v23 = (void *)getFBSOpenApplicationOptionsClass_softClass;
      v45 = getFBSOpenApplicationOptionsClass_softClass;
      if (!getFBSOpenApplicationOptionsClass_softClass)
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = (uint64_t)__getFBSOpenApplicationOptionsClass_block_invoke;
        v40 = &unk_1E5FC8858;
        v41 = &v42;
        __getFBSOpenApplicationOptionsClass_block_invoke((uint64_t)&v37);
        v23 = (void *)v43[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v42, 8);
      objc_msgSend(v24, "optionsWithDictionary:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSystemActionRunnerClient action](self, "action");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "associatedBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "openApplication:withOptions:completion:", v27, v25, 0);

LABEL_30:
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyLaunchOrigin(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFSystemActionRunnerClient.m"), 29, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLaunchOriginActionButton(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFSystemActionRunnerClient.m"), 32, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

- (WFConfiguredSystemAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (WFContextualActionContext)actionContext
{
  return self->_actionContext;
}

- (void)setActionContext:(id)a3
{
  objc_storeStrong((id *)&self->_actionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (id)defaultContextualActionContext
{
  return -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 17);
}

@end
