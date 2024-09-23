@implementation WFDialogTransformer

- (WFDialogTransformer)initWithWorkflow:(id)a3 userInterfacePresenter:(id)a4 runSource:(id)a5 runningContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFDialogTransformer *v15;
  WFDialogTransformer *v16;
  WFChooseFromListDataStore *v17;
  WFChooseFromListDataStore *chooseFromListDataStore;
  WFDialogTransformer *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDialogTransformer;
  v15 = -[WFDialogTransformer init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workflow, a3);
    objc_storeStrong((id *)&v16->_userInterfacePresenter, a4);
    objc_storeStrong((id *)&v16->_runSource, a5);
    objc_storeStrong((id *)&v16->_runningContext, a6);
    v16->_allowsHandoff = 0;
    v16->_presentationMode = 0;
    v16->_numberOfDialogsPresented = 0;
    v17 = objc_alloc_init(WFChooseFromListDataStore);
    chooseFromListDataStore = v16->_chooseFromListDataStore;
    v16->_chooseFromListDataStore = v17;

    v16->_hasPresentedFirstDialog = 0;
    v19 = v16;
  }

  return v16;
}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E0D14320];
}

- (void)workflowWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer setWorkflowStartTime:](self, "setWorkflowStartTime:", v3);

  if (-[WFDialogTransformer isRunningWithExternalUI](self, "isRunningWithExternalUI"))
  {
    -[WFDialogTransformer externalUIPresenter](self, "externalUIPresenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[WFWorkflow actions](self->_workflow, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willBeginExecutingShortcutWithActionCount:", v6);

  }
}

- (void)cancel
{
  -[WFDialogTransformer stopWithError:](self, "stopWithError:", 0);
}

- (void)stopWithError:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "wf_isUnsupportedUserInterfaceError")
    && (-[WFDialogTransformer currentAction](self, "currentAction"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isRunning"),
        v4,
        v5))
  {
    -[WFDialogTransformer currentAction](self, "currentAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishRunningWithError:", v7);
  }
  else
  {
    -[WFDialogTransformer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dialogTransformer:stopRunningWithError:", self, v7);
  }

}

- (WFDialogAttribution)attribution
{
  return (WFDialogAttribution *)-[WFDialogTransformer attributionAllowingAction:](self, "attributionAllowingAction:", 1);
}

- (id)attributionAllowingAction:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v4 = a3;
  -[WFDialogTransformer workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)*MEMORY[0x1E0DC7FD8];
  -[WFDialogTransformer currentAction](self, "currentAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 && v9 && objc_msgSend(v9, "prefersActionAttribution"))
  {
    objc_msgSend(v10, "localizedAttribution");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appBundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v52 = (id)v13;

    goto LABEL_9;
  }
  if (v6)
  {
    objc_msgSend(v6, "attributionTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionIcon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedAssociatedAppBundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = 0;
  v11 = 0;
  v52 = v8;
LABEL_9:
  objc_msgSend(v6, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10;
  if (objc_msgSend(v14, "length"))
    goto LABEL_15;
  objc_msgSend(v6, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 1)
  {
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v6, "associatedAppBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "length");

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(v6, "associatedAppBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v17, "initWithBundleIdentifier:allowPlaceholder:error:", v18, 0, 0);

    if (v14)
    {
      objc_msgSend(v14, "localizedName");
      v15 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_15:

  }
  -[WFDialogTransformer runSource](self, "runSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0DC8468]);

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hasSystemAperture");

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("%@ │ Shortcuts"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v11);
      v25 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v25;
    }
  }
  if (objc_msgSend(v6, "hiddenFromLibraryAndSync"))
  {
    WFLocalizedString(CFSTR("Shortcuts"));
    v26 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v26;
  }
  if (!v52)
    v52 = v8;
  objc_msgSend(v6, "workflowID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    || (objc_msgSend(v6, "actions"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "count") != 1))
  {
    -[WFDialogTransformer currentAction](self, "currentAction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_28;
  }
  else
  {
    objc_msgSend(v6, "actions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_28:

  objc_msgSend(MEMORY[0x1E0DC7DB0], "symbolIconForActionIdentifier:bundleIdentifier:", v30, v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = v32;

    v12 = v34;
  }
  -[WFDialogTransformer runningContext](self, "runningContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "runSource");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0DC8440]))
  {
    v50 = v7;
    objc_msgSend(v6, "icon");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "symbolOverride");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v7 = v50;
      v42 = v51;
      if (v12)
        goto LABEL_39;
LABEL_41:
      -[WFDialogTransformer shortcutsAppAttribution](self, "shortcutsAppAttribution");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "icon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_40;
LABEL_42:
      -[WFDialogTransformer shortcutsAppAttribution](self, "shortcutsAppAttribution");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x1E0DC79F8], "tintColorForBundleIdentifier:", v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC79F8], "whiteColor");
      v41 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v41;

    v43 = objc_alloc(MEMORY[0x1E0DC7DB0]);
    objc_msgSend(v6, "icon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "symbolOverride");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "initWithSymbolName:symbolColor:", v44, v35);

    v12 = (void *)v45;
    v7 = v50;
  }
  v42 = v51;

  if (!v12)
    goto LABEL_41;
LABEL_39:
  if (!v11)
    goto LABEL_42;
LABEL_40:
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:workflowIcon:appBundleIdentifier:", v11, v12, v7, v52);

  return v46;
}

- (id)shortcutsAppAttribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC7AD0], "attributionWithAppBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0DC7B70];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Shortcuts"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B78]), "initWithImage:", v5);
    v7 = objc_alloc(MEMORY[0x1E0DC7AD0]);
    WFLocalizedString(CFSTR("Shortcuts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v7, "initWithTitle:icon:", v8, v6);

  }
  return v2;
}

- (id)privacyAttribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WFLocalizedString(CFSTR("Privacy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Privacy"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC7AD0];
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B78]), "initWithImage:", v5);
    objc_msgSend(v6, "attributionWithTitle:icon:", v2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC7AD0], "attributionWithTitle:icon:", v2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)workflowName
{
  void *v2;
  void *v3;

  -[WFDialogTransformer workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributionTitle
{
  void *v2;
  void *v3;

  -[WFDialogTransformer workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributionIcon
{
  void *v2;
  void *v3;

  -[WFDialogTransformer workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFDialogTransformer setNumberOfDialogsPresented:](self, "setNumberOfDialogsPresented:", -[WFDialogTransformer numberOfDialogsPresented](self, "numberOfDialogsPresented") + 1);
  if (!-[WFDialogTransformer hasPresentedFirstDialog](self, "hasPresentedFirstDialog"))
  {
    -[WFDialogTransformer setHasPresentedFirstDialog:](self, "setHasPresentedFirstDialog:", 1);
    -[WFDialogTransformer workflowStartTime](self, "workflowStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = v9;

    if (v10 < -15.0)
    {
      v6 = v6;
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "textFieldConfiguration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");

          objc_msgSend(v12, "setFocusImmediatelyWhenPresented:", 0);
          v13 = objc_alloc(MEMORY[0x1E0DC7B98]);
          objc_msgSend(v6, "message");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "attribution");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "prompt");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "parameterKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v13, "initWithTextFieldConfiguration:message:attribution:prompt:parameterKey:", v12, v14, v15, v16, v17);

          v19 = v18;
          v20 = v19;
          v21 = v20;
          if (!v20)
          {
            v6 = 0;
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {

          v20 = v6;
          v21 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "requestBySettingFocusImmediatelyWhenPresented:", 0);
          v6 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v6 = v20;
        }
        goto LABEL_12;
      }
      v20 = 0;
      v21 = 0;
      goto LABEL_12;
    }
  }
LABEL_13:
  -[WFDialogTransformer delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dialogTransformerWillDisplayDialog:", self);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[WFDialogTransformer runningContext](self, "runningContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "shouldForwardDialogRequests") & 1) != 0)
  {

LABEL_16:
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke;
    v40[3] = &unk_1E7AEF108;
    v40[4] = self;
    v41 = v7;
    -[WFDialogTransformer prepareListDialogRequestIfNeeded:completionHandler:](self, "prepareListDialogRequestIfNeeded:completionHandler:", v6, v40);
    v26 = v41;
LABEL_17:

    goto LABEL_18;
  }
  v25 = -[WFDialogTransformer isRunningWithToolKitClient](self, "isRunningWithToolKitClient");

  if (v25)
    goto LABEL_16;
  if ((isKindOfClass & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithCancelled:", 0);
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v27, 0);

    goto LABEL_18;
  }
  if (!-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    -[WFDialogTransformer showDialogRequest:completionHandler:](self, "showDialogRequest:completionHandler:", v6, v7);
    goto LABEL_18;
  }
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend(v34, "containsObject:", objc_opt_class());

  if ((v29 & 1) != 0)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_151;
    v38[3] = &unk_1E7AEF108;
    v38[4] = self;
    v39 = v7;
    -[WFDialogTransformer prepareListDialogRequestIfNeeded:completionHandler:](self, "prepareListDialogRequestIfNeeded:completionHandler:", v6, v38);
    v26 = v39;
    goto LABEL_17;
  }
  getWFDialogLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[WFDialogTransformer handleDialogRequest:completionHandler:]";
    v44 = 2112;
    v45 = (id)objc_opt_class();
    v36 = v45;
    _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Unsupported dialog request of type %@ sent to Siri, punching to Shortcuts Jr", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer stopWithError:](self, "stopWithError:", v37);

LABEL_18:
}

- (void)showDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[WFDialogTransformer userInterfacePresenter](self, "userInterfacePresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFDialogTransformer runViewSource](self, "runViewSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRunViewSource:", v9);

    -[WFDialogTransformer currentAction](self, "currentAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsLastAction:", objc_msgSend(v10, "isLastAction"));

    -[WFDialogTransformer userInterfacePresenter](self, "userInterfacePresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogTransformer runningContext](self, "runningContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__WFDialogTransformer_showDialogRequest_completionHandler___block_invoke;
    v15[3] = &unk_1E7AEF398;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    objc_msgSend(v11, "showDialogRequest:runningContext:completionHandler:", v16, v12, v15);

  }
  else
  {
    if (-[WFDialogTransformer allowsHandoff](self, "allowsHandoff")
      || -[WFDialogTransformer presentationMode](self, "presentationMode") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    -[WFDialogTransformer stopWithError:](self, "stopWithError:", v13);

  }
}

- (void)handleUIRequestResponse:(id)a3 error:(id)a4 forRequest:(id)a5 shouldFailoverToLocalUI:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a6;
  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, id))a7;
  if (!v21)
  {
    v14[2](v14, 0, v12);
    goto LABEL_18;
  }
  v15 = objc_msgSend(v21, "responseCode");
  if (v15 == 4)
  {
    if (v8)
    {
      -[WFDialogTransformer showDialogRequest:completionHandler:](self, "showDialogRequest:completionHandler:", v13, v14);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v15 == 2)
  {
    if (-[WFDialogTransformer isRunningWithToolKitClient](self, "isRunningWithToolKitClient"))
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfCancelledStepError");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v17 = (void *)v16;
    -[WFDialogTransformer stopWithError:](self, "stopWithError:", v16);
    goto LABEL_17;
  }
  if (v15 != 1)
  {
    ((void (**)(id, id, id))v14)[2](v14, v21, 0);
    -[WFDialogTransformer delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dialogTransformerDidDisplayDialog:", self);
LABEL_17:

    goto LABEL_18;
  }
  if (!v12)
  {
    -[WFDialogTransformer currentAction](self, "currentAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      -[WFDialogTransformer workflowName](self, "workflowName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    WFRunnerFailureErrorMessage(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogTransformer stopWithError:](self, "stopWithError:", v20);

    if (!v18)
    goto LABEL_17;
  }
  -[WFDialogTransformer stopWithError:](self, "stopWithError:", v12);
LABEL_18:

}

- (void)prepareListDialogRequestIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WFDialogTransformer *v15;
  void (**v16)(id, id);
  _QWORD v17[5];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = v6;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v11 = 0;
LABEL_7:
    v7[2](v7, v8);
    goto LABEL_8;
  }
  if (!-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    -[WFDialogTransformer runningContext](self, "runningContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldForwardDialogRequests");

    v11 = v8;
    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(v8, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke;
  v17[3] = &unk_1E7AEF180;
  v17[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_3;
  v13[3] = &unk_1E7AF7FC8;
  v11 = v8;
  v14 = v11;
  v15 = self;
  v16 = v7;
  objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v17, v13);

LABEL_8:
}

- (void)cleanupListDialogRequestIfNeeded:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = -[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI");
    v5 = v7;
    if (v4)
    {
      objc_msgSend(v7, "items");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__WFDialogTransformer_cleanupListDialogRequestIfNeeded___block_invoke;
      v8[3] = &unk_1E7AEF1A8;
      v8[4] = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

      v5 = v7;
    }
  }
  else
  {

    v5 = 0;
  }

}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    -[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:](self, "executeSmartPromptIntentWithConfiguration:completionHandler:", v11, v7);
  }
  else
  {
    -[WFDialogTransformer privacyAttribution](self, "privacyAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizationDialogRequestWithAttribution:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__WFDialogTransformer_requestAuthorizationWithConfiguration_completionHandler___block_invoke;
    v12[3] = &unk_1E7AEF410;
    v12[4] = self;
    v13 = v7;
    -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v11, v12);

  }
}

- (void)executeSmartPromptIntentWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DC7D58]);
  -[WFDialogTransformer configureSmartPromptIntent:withConfiguration:](self, "configureSmartPromptIntent:withConfiguration:", v8, v6);
  -[WFDialogTransformer configureIntent:](self, "configureIntent:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CD0]), "initWithIntent:", v8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__WFDialogTransformer_executeSmartPromptIntentWithConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_1E7AEF1D0;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  -[WFDialogTransformer performSiriRequest:completionHandler:](self, "performSiriRequest:completionHandler:", v9, v12);

}

- (void)updateSmartPromptsWithConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  +[WFSmartPromptDialogResponse prepareSmartPromptsDatabaseDataFromConfiguration:resultCode:error:](WFSmartPromptDialogResponse, "prepareSmartPromptsDatabaseDataFromConfiguration:resultCode:error:", v7, a4, a5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
          +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "actionUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFDialogTransformer workflow](self, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "reference");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "saveSmartPromptStateData:actionUUID:reference:error:", v12, v14, v16, a5);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }
  }
  +[WFSmartPromptDialogResponse prepareDeletionAuthorizationDatabaseDataFromConfiguration:resultCode:error:](WFSmartPromptDialogResponse, "prepareDeletionAuthorizationDatabaseDataFromConfiguration:resultCode:error:", v7, v23, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionUUID");
    v19 = a5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogTransformer workflow](self, "workflow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reference");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "saveSmartPromptStateData:actionUUID:reference:error:", v17, v20, v22, v19);

  }
}

- (void)configureSmartPromptIntent:(id)a3 withConfiguration:(id)a4
{
  uint64_t v5;
  id v6;
  WFSmartPromptDialogRequest *v7;
  void *v8;
  WFSmartPromptDialogRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v5 = *MEMORY[0x1E0DC7F60];
  v6 = a4;
  objc_msgSend(v31, "_setLaunchId:", v5);
  objc_msgSend(v31, "_setExtensionBundleId:", v5);
  v7 = [WFSmartPromptDialogRequest alloc];
  objc_msgSend(MEMORY[0x1E0DC7AD0], "attributionWithAppBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFSmartPromptDialogRequest initWithConfiguration:attribution:](v7, "initWithConfiguration:attribution:", v6, v8);

  objc_msgSend(v6, "localizedPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setPromptMessage:", v10);
  WFLocalizedString(CFSTR("Privacy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPrivacyTitle:", v11);

  v12 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("Privacy"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CBD8A8];
  objc_msgSend(v14, "PNGRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileWithData:filename:typeIdentifier:", v16, CFSTR("PrivacyIcon"), CFSTR("public.png"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setPrivacyIcon:", v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptDialogRequest previewButton](v9, "previewButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[WFSmartPromptDialogRequest previewButton](v9, "previewButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "smartPromptIntentButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

  }
  -[WFSmartPromptDialogRequest allowOnceButton](v9, "allowOnceButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[WFSmartPromptDialogRequest allowOnceButton](v9, "allowOnceButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "smartPromptIntentButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

  }
  -[WFSmartPromptDialogRequest allowAlwaysButton](v9, "allowAlwaysButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[WFSmartPromptDialogRequest allowAlwaysButton](v9, "allowAlwaysButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "smartPromptIntentButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

  }
  -[WFSmartPromptDialogRequest denyButton](v9, "denyButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[WFSmartPromptDialogRequest denyButton](v9, "denyButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "smartPromptIntentButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v30);

  }
  objc_msgSend(v31, "setButtons:", v18);

}

- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFFileAccessDialogRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  WFFileAccessDialogRequest *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v29 = a6;
  v11 = a5;
  getWFFilesLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFDialogTransformer requestFileAccessForURLs:workflowName:workflowID:completionHandler:]";
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEBUG, "%s Requesting File access for urls: %@", buf, 0x16u);
  }

  objc_msgSend(v9, "if_map:", &__block_literal_global_21960);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasDirectoryPath");

    v16 = (void *)MEMORY[0x1E0CB3940];
    if (v15)
      v17 = CFSTR("Allow “%1$@” to access your “%2$@” folder?");
    else
      v17 = CFSTR("Allow “%1$@” to access your file “%2$@”?");
    WFLocalizedString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v10, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "if_map:", &__block_literal_global_189_21965);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Allow “%1$@” to access %2$@?"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, v10, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v23 = [WFFileAccessDialogRequest alloc];
  objc_msgSend(MEMORY[0x1E0DC7AD8], "okButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7AD8], "cancelButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer privacyAttribution](self, "privacyAttribution");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[WFFileAccessDialogRequest initWithPrompt:message:okButton:cancelButton:attribution:workflowID:URLs:](v23, "initWithPrompt:message:okButton:cancelButton:attribution:workflowID:URLs:", v22, 0, v24, v25, v26, v11, v9);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_3;
  v31[3] = &unk_1E7AEF258;
  v32 = v29;
  v28 = v29;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v27, v31);

}

- (void)setWorkflow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_workflow, a3);
  -[WFDialogTransformer userInterfacePresenter](self, "userInterfacePresenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer attribution](self, "attribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer runningContext](self, "runningContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAttribution:runningContext:", v4, v5);

}

- (void)setSiriOptions:(id)a3
{
  objc_storeStrong((id *)&self->_siriOptions, a3);
}

- (void)swapExternalUIPresenterWithPresenter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFExternalUIPresenter *externalUIPresenter;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    -[WFDialogTransformer parameterInputProvider](self, "parameterInputProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFDialogTransformer parameterInputProvider](self, "parameterInputProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistInFlightParameters");

    }
    externalUIPresenter = self->_externalUIPresenter;
    self->_externalUIPresenter = 0;

    objc_storeStrong((id *)&self->_userInterfacePresenter, a3);
  }
  else
  {
    getWFRunningLifecycleLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "-[WFDialogTransformer swapExternalUIPresenterWithPresenter:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Attempted to perform handoff when not running in Siri", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)presentAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFDialogLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[WFDialogTransformer presentAlert:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Transforming alert %@ into WFDialogRequest", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v4, "textFieldConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFDialogTransformer handleAlertWithTextField:](self, "handleAlertWithTextField:", v4);
    goto LABEL_13;
  }
  objc_msgSend(v4, "datePickerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFDialogTransformer handleAlertWithDatePicker:](self, "handleAlertWithDatePicker:", v4);
    goto LABEL_13;
  }
  objc_msgSend(v4, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 3)
  {

    goto LABEL_12;
  }
  objc_msgSend(v4, "buttons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_objectsOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
LABEL_12:
    -[WFDialogTransformer handleAlertWithMultipleButtons:](self, "handleAlertWithMultipleButtons:", v4);
    goto LABEL_13;
  }
  if (-[WFDialogTransformer shouldHandleAlertAsSiriDialog:](self, "shouldHandleAlertAsSiriDialog:", v4))
    -[WFDialogTransformer handleAlertAsSiriDialog:](self, "handleAlertAsSiriDialog:", v4);
  else
    -[WFDialogTransformer handleSimpleAlert:](self, "handleSimpleAlert:", v4);
LABEL_13:

}

- (void)handleSimpleAlert:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  WFDialogTransformer *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;
  WFDialogTransformer *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  WFDialogTransformer *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v7 = 0x1E0DC7000;
  if (!v6)
  {
    v38 = 0;
    v10 = 0;
    v11 = 0;
LABEL_16:

    goto LABEL_18;
  }
  v8 = v6;
  v36 = v4;
  v9 = self;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(v5);
      v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      if (objc_msgSend(v14, "style") == 1)
      {
        v15 = v14;
        v16 = v11;
        if (v10)
          continue;
      }
      else
      {
        v15 = v10;
        v16 = v14;
        if (v11)
          continue;
      }
      v17 = v14;
      v10 = v15;
      v11 = v16;
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v8);

  if (v10)
  {
    v7 = 0x1E0DC7000uLL;
    v18 = objc_alloc(MEMORY[0x1E0DC7AD8]);
    objc_msgSend(v10, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v18, "initWithTitle:style:", v5, 1);
    self = v9;
    v4 = v36;
    goto LABEL_16;
  }
  v38 = 0;
  self = v9;
  v4 = v36;
  v7 = 0x1E0DC7000uLL;
LABEL_18:
  v19 = *(objc_class **)(v7 + 2776);
  if (v11)
  {
    v20 = [v19 alloc];
    objc_msgSend(v11, "title");
    v21 = self;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithTitle:style:", v22, 2 * (objc_msgSend(v11, "style") != 0));

    self = v21;
  }
  else
  {
    -[objc_class okButton](v19, "okButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  objc_opt_isKindOfClass();
  v24 = (objc_class *)objc_opt_class();
  v25 = v4;
  if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v27 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v25, "attribution");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v25;
  if (!v26)
  {
LABEL_26:
    v37 = v27;
    -[WFDialogTransformer attribution](self, "attribution");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v28 = (void *)v26;
  objc_msgSend(v25, "attribution");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v25;
LABEL_27:
  v30 = [v24 alloc];
  objc_msgSend(v25, "title");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "message");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v30, "initWithPrompt:message:okButton:cancelButton:attribution:", v31, v32, v23, v38, v29);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __41__WFDialogTransformer_handleSimpleAlert___block_invoke;
  v39[3] = &unk_1E7AEF280;
  v40 = v10;
  v41 = self;
  v42 = v11;
  v34 = v11;
  v35 = v10;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v33, v39);

}

- (void)handleAlertWithTextField:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  WFDialogTransformer *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v11, "style") == 1)
        {
          v12 = v11;
          v13 = v8;
          if (v7)
            continue;
        }
        else
        {
          v12 = v7;
          v13 = v11;
          if (v8)
            continue;
        }
        v14 = v11;
        v7 = v12;
        v8 = v13;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v6)
        goto LABEL_15;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_15:

  v15 = objc_alloc(MEMORY[0x1E0DC7B98]);
  objc_msgSend(v3, "textFieldConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer attribution](self, "attribution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedParameterKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v15, "initWithTextFieldConfiguration:message:attribution:prompt:parameterKey:", v16, v17, v18, v19, v20);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__WFDialogTransformer_handleAlertWithTextField___block_invoke;
  v26[3] = &unk_1E7AEF2A8;
  v27 = v7;
  v28 = self;
  v29 = v3;
  v30 = v8;
  v22 = v8;
  v23 = v3;
  v24 = v7;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v21, v26);

}

- (void)handleAlertWithDatePicker:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  WFDialogTransformer *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v3, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v11, "style") == 1)
        {
          v12 = v11;
          v13 = v8;
          if (v7)
            continue;
        }
        else
        {
          v12 = v7;
          v13 = v11;
          if (v8)
            continue;
        }
        v14 = v11;
        v7 = v12;
        v8 = v13;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v6)
        goto LABEL_15;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_15:

  v15 = objc_alloc(MEMORY[0x1E0DC7B88]);
  objc_msgSend(v3, "datePickerConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer attribution](self, "attribution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithDatePickerConfiguration:message:attribution:prompt:", v16, v17, v18, v19);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__WFDialogTransformer_handleAlertWithDatePicker___block_invoke;
  v25[3] = &unk_1E7AEF2D0;
  v26 = v7;
  v27 = self;
  v28 = v3;
  v29 = v8;
  v21 = v8;
  v22 = v3;
  v23 = v7;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v20, v25);

}

- (void)handleAlertWithMultipleButtons:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t *v12;
  id v13;
  id v14;
  id v15;
  char isKindOfClass;
  id v17;
  void *v18;
  WFDialogContentListItem *v19;
  void *v20;
  WFDialogContentListItem *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WFDialogContentListItem *v28;
  void *v29;
  WFDialogContentListItem *v30;
  uint64_t *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  WFDialogContentListItem *v36;
  void *v37;
  WFDialogContentListItem *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  NSObject *group;
  void *v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  WFDialogTransformer *v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1E0D13E90];
  v45 = v3;
  objc_msgSend(v3, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processContentAlertButtonSubtitles:", v6);

  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__21943;
  v69 = __Block_byref_object_dispose__21944;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__21943;
  v63 = __Block_byref_object_dispose__21944;
  v64 = 0;
  group = dispatch_group_create();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v3, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v11, "style") == 1)
        {
          v12 = v66;
          v13 = v11;
          v14 = (id)v12[5];
          v12[5] = (uint64_t)v13;
        }
        else
        {
          v15 = v11;
          if (v15)
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v17 = v15;
            v14 = v17;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v17, "contentItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "stickySelection"))
                *((_BYTE *)v72 + 24) = 1;
              v19 = [WFDialogContentListItem alloc];
              objc_msgSend(v18, "blockingEncodedTypedValue");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:hideSubtitle:](v19, "initWithContentItem:encodedTypedValue:selected:hideSubtitle:", v18, v20, objc_msgSend(v14, "isSelected"), objc_msgSend(v14, "hideSubtitle"));

              objc_msgSend(v4, "addObject:", v21);
              objc_msgSend(v46, "setObject:forKey:", v14, v21);

              goto LABEL_22;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              v14 = v14;
              if (objc_msgSend(v14, "stickySelection"))
                *((_BYTE *)v72 + 24) = 1;
              v22 = objc_alloc(MEMORY[0x1E0D13FD0]);
              objc_msgSend(v14, "title");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "subtitle");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "image");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend(v22, "initWithTitle:subtitle:image:", v23, v24, v25);

              objc_msgSend(MEMORY[0x1E0D13FC8], "itemWithObject:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = [WFDialogContentListItem alloc];
              objc_msgSend(v27, "blockingEncodedTypedValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:serializedPossibleState:](v28, "initWithContentItem:encodedTypedValue:selected:serializedPossibleState:", v27, v29, objc_msgSend(v14, "isSelected"), 0);

              objc_msgSend(v4, "addObject:", v30);
              objc_msgSend(v46, "setObject:forKey:", v14, v30);

              goto LABEL_22;
            }
          }

          if (objc_msgSend(v15, "style"))
            continue;
          if ((objc_msgSend(v15, "isPreferred") & 1) != 0)
          {
            v31 = v60;
            v32 = v15;
            v14 = (id)v31[5];
            v31[5] = (uint64_t)v32;
          }
          else
          {
            v33 = objc_alloc(MEMORY[0x1E0D13FD0]);
            objc_msgSend(v15, "title");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (id)objc_msgSend(v33, "initWithTitle:subtitle:image:", v34, 0, 0);

            objc_msgSend(MEMORY[0x1E0D13FC8], "itemWithObject:", v14);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = [WFDialogContentListItem alloc];
            objc_msgSend(v35, "blockingEncodedTypedValue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:hideSubtitle:](v36, "initWithContentItem:encodedTypedValue:selected:hideSubtitle:", v35, v37, 0, 0);

            objc_msgSend(v4, "addObject:", v38);
            objc_msgSend(v46, "setObject:forKey:", v15, v38);

          }
        }
LABEL_22:

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke;
  block[3] = &unk_1E7AEF320;
  v39 = v4;
  v48 = v4;
  v49 = v45;
  v52 = &v71;
  v53 = &v65;
  v50 = self;
  v51 = v46;
  v54 = &v59;
  v40 = v46;
  v41 = v45;
  v42 = v39;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
}

- (BOOL)shouldHandleAlertAsSiriDialog:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    objc_msgSend(v4, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_opt_class();
      v6 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (void)handleAlertAsSiriDialog:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = v8;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "length"))
  {
    v8 = v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:
  if (!self->_externalUIPresenter)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDialogTransformer.m"), 872, CFSTR("Siri UI presenter must be non-nil"));

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D28]), "initWithUtterance:", v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__WFDialogTransformer_handleAlertAsSiriDialog___block_invoke;
  v13[3] = &unk_1E7AEF348;
  v14 = v5;
  v11 = v5;
  -[WFDialogTransformer performSiriRequest:completionHandler:](self, "performSiriRequest:completionHandler:", v10, v13);

}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 1;
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, _QWORD);
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  WFSiriAskEachTimeParameterState *v25;
  void *v26;
  WFSequentialParameterInputProvider *v27;
  WFSequentialParameterInputProvider *parameterInputProvider;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id, _QWORD))a7;
  if (!-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
    goto LABEL_15;
  v17 = v12;
  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v17 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v17, "isHandledBySiri"))
  {
LABEL_14:

LABEL_15:
    -[WFDialogTransformer setParameterInputCompletionHandler:](self, "setParameterInputCompletionHandler:", v16);
    v27 = -[WFSequentialParameterInputProvider initWithDelegate:]([WFSequentialParameterInputProvider alloc], "initWithDelegate:", self);
    -[WFSequentialParameterInputProvider startWithAction:parameters:defaultStates:prompts:](v27, "startWithAction:parameters:defaultStates:prompts:", v12, v13, v14, v15);
    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = v27;

    goto LABEL_16;
  }
  v29 = v14;
  v31 = v12;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = v13;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v25 = objc_alloc_init(WFSiriAskEachTimeParameterState);
        objc_msgSend(v24, "key");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  v16[2](v16, v18, 0);
  v13 = v30;
  v12 = v31;
  v14 = v29;
LABEL_16:

}

- (void)sequentialParameterInputProvider:(id)a3 didAdvanceToParameter:(id)a4 action:(id)a5 defaultState:(id)a6 prompt:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD);
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  WFDialogTransformer *v42;
  void (**v43)(_QWORD);
  id v44;
  _QWORD aBlock[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  -[WFDialogTransformer runningContext](self, "runningContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "workflowIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    goto LABEL_3;
  }
  objc_msgSend(v14, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent")))
  {

LABEL_8:
    v20 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v14, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("is.workflow.actions.timer.start"));

  if ((v24 & 1) != 0)
    goto LABEL_8;
LABEL_3:
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(v13, "localizedPrompt");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_9:
  v21 = v20;
LABEL_10:
  v25 = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke;
  aBlock[3] = &unk_1E7AF1F18;
  aBlock[4] = self;
  v26 = v13;
  v46 = v26;
  v27 = v25;
  v47 = v27;
  v28 = v17;
  v50 = v28;
  v29 = v14;
  v48 = v29;
  v30 = v15;
  v49 = v30;
  v31 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v26, "key");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v29, "canOfferSuggestionsForParameterWithKey:", v32);

  if (v33)
  {
    v38 = v16;
    getWFDialogLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v29, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "key");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v52 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:completion:]";
      v53 = 2112;
      v54 = v35;
      v55 = 2112;
      v56 = v36;
      _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_DEFAULT, "%s Consulting top hits for entity items for action: %@, parameter: %@", buf, 0x20u);

    }
    objc_msgSend(v26, "key");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_291;
    v39[3] = &unk_1E7AEF488;
    v40 = v29;
    v41 = v26;
    v42 = self;
    v43 = v31;
    v44 = v28;
    objc_msgSend(v40, "fetchSuggestedEntititiesForParameterWithKey:completionHandler:", v37, v39);

    v16 = v38;
  }
  else
  {
    v31[2](v31);
  }

}

- (void)showAskParameterDialogForParameter:(id)a3 action:(id)a4 defaultState:(id)a5 prompt:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  void *v17;
  void *v18;
  char v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void (**v56)(id, uint64_t, _QWORD);
  id v57;
  id v58;
  WFDialogTransformer *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  void (**v64)(id, uint64_t, _QWORD);
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  -[WFDialogTransformer allowedParameterClasses](self, "allowedParameterClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    -[WFDialogTransformer allowedParameterClasses](self, "allowedParameterClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", objc_opt_class());

    if ((v19 & 1) == 0)
    {
      -[WFDialogTransformer parameterInputCompletionHandler](self, "parameterInputCompletionHandler");
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[WFDialogTransformer setParameterInputCompletionHandler:](self, "setParameterInputCompletionHandler:", 0);
      if (v20)
      {
        v21 = v15;
        v22 = v13;
        v23 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v12, "localizedLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "wf_unsupportedParameterErrorWithParameterName:errorType:platformIdiom:", v24, CFSTR("NotAvailableOnSpecifiedPlatform"), objc_msgSend(v25, "idiom"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v26);

        v13 = v22;
        v15 = v21;

      }
      v16[2](v16, 1, 0);

      goto LABEL_23;
    }
  }
  else
  {

  }
  v59 = self;
  v56 = v16;
  v57 = v15;
  v27 = (void *)objc_opt_new();
  v58 = v14;
  objc_msgSend(v14, "serializedRepresentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "key");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v27;
  objc_msgSend(v27, "if_setObjectIfNonNil:forKey:", v28, v29);

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v30 = v13;
  objc_msgSend(v13, "parameters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v66 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v36, "key");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "key");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqualToString:", v38);

        if ((v39 & 1) == 0)
        {
          objc_msgSend(v36, "key");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "parameterStateForKey:fallingBackToDefaultValue:", v40, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "serializedRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "key");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "if_setObjectIfNonNil:forKey:", v42, v43);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v33);
  }

  v44 = objc_msgSend(MEMORY[0x1E0DC79B0], "dialogComponentStyleForParameter:", v12);
  objc_msgSend(MEMORY[0x1E0DC7AD8], "doneButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  objc_msgSend(v30, "identifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v46, "isEqualToString:", CFSTR("is.workflow.actions.timer.start")))
    goto LABEL_19;
  -[WFDialogTransformer runningContext](v59, "runningContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "workflowIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0DC7AD8], "startButton");
    v46 = v45;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  }
  v49 = objc_alloc(MEMORY[0x1E0DC79B0]);
  objc_msgSend(v30, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "key");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer attribution](v59, "attribution");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v55) = 1;
  v15 = v57;
  v53 = (void *)objc_msgSend(v49, "initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:doneButton:focusImmediatelyWhenPresented:", v50, v51, v60, v44, v52, v57, v45, v55);

  getWFDialogLogObject();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v70 = "-[WFDialogTransformer showAskParameterDialogForParameter:action:defaultState:prompt:completion:]";
    v71 = 2112;
    v72 = v12;
    v73 = 2112;
    v74 = v53;
    _os_log_impl(&dword_1C15B3000, v54, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", buf, 0x20u);
  }

  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __96__WFDialogTransformer_showAskParameterDialogForParameter_action_defaultState_prompt_completion___block_invoke;
  v61[3] = &unk_1E7AEF4B8;
  v16 = v56;
  v64 = v56;
  v62 = v30;
  v63 = v12;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](v59, "handleDialogRequest:completionHandler:", v53, v61);

  v14 = v58;
LABEL_23:

}

- (void)sequentialParameterInputProvider:(id)a3 didFinishWithInputtedStates:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  WFSequentialParameterInputProvider *parameterInputProvider;
  id parameterInputCompletionHandler;
  id v9;

  v9 = a4;
  -[WFDialogTransformer parameterInputCompletionHandler](self, "parameterInputCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDialogTransformer parameterInputCompletionHandler](self, "parameterInputCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v6)[2](v6, v9, 0);

    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = 0;

    parameterInputCompletionHandler = self->_parameterInputCompletionHandler;
    self->_parameterInputCompletionHandler = 0;

  }
}

- (void)sequentialParameterInputProviderDidCancel:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  WFSequentialParameterInputProvider *parameterInputProvider;
  id parameterInputCompletionHandler;

  -[WFDialogTransformer parameterInputCompletionHandler](self, "parameterInputCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDialogTransformer parameterInputCompletionHandler](self, "parameterInputCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);

    parameterInputProvider = self->_parameterInputProvider;
    self->_parameterInputProvider = 0;

    parameterInputCompletionHandler = self->_parameterInputCompletionHandler;
    self->_parameterInputCompletionHandler = 0;

  }
}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0DC7A38];
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithInteraction:prompt:", v12, v11);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__WFDialogTransformer_showConfirmInteraction_prompt_requireAuthentication_completionHandler___block_invoke;
  v15[3] = &unk_1E7AEF4E0;
  v16 = v9;
  v14 = v9;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v13, v15);

}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DC7B48];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithInteraction:prompt:", v11, v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__WFDialogTransformer_showHandleInteraction_prompt_completionHandler___block_invoke;
  v14[3] = &unk_1E7AEF4E0;
  v15 = v8;
  v13 = v8;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v12, v14);

}

- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFShowContentDialogRequest *v8;
  void *v9;
  WFShowContentDialogRequest *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = [WFShowContentDialogRequest alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFShowContentDialogRequest initWithContentCollection:attribution:prompt:](v8, "initWithContentCollection:attribution:prompt:", v7, v9, 0);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__WFDialogTransformer_showPreviewForContentCollection_completionHandler___block_invoke;
  v12[3] = &unk_1E7AEF4E0;
  v13 = v6;
  v11 = v6;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v10, v12);

}

- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  _BOOL4 v31;
  _QWORD v32[4];
  id v33;

  v31 = a4;
  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  objc_msgSend(v17, "acceptLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForLocaleIdentifier:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "denyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "localizedStringForLocaleIdentifier:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x1E0DC7BC0]);
  -[WFDialogTransformer attribution](self, "attribution");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = a9;
  v28 = (void *)objc_msgSend(v26, "initWithActionMetadata:showPrompt:dialogString:viewSnippet:yesText:noText:attribution:parameterInfo:isContinueInAppRequest:", v21, v31, v19, v18, v23, v25, v27, 0, v30);

  objc_msgSend(v28, "setLinkDialog:", v20);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __175__WFDialogTransformer_showLinkActionConfirmationWithActionMetadata_showPrompt_dialog_dialogString_viewSnippet_confirmationActionName_isContinueInAppRequest_completionHandler___block_invoke;
  v32[3] = &unk_1E7AEF4E0;
  v33 = v16;
  v29 = v16;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v28, v32);

}

- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  WFDialogTransformer *v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke;
  block[3] = &unk_1E7AEF530;
  v27 = v18;
  v28 = v14;
  v29 = v16;
  v30 = v17;
  v31 = self;
  v32 = v15;
  v33 = v19;
  v20 = v19;
  v21 = v15;
  v22 = v17;
  v23 = v16;
  v24 = v14;
  v25 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFLinkResultDialogRequest *v11;
  void *v12;
  WFLinkResultDialogRequest *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [WFLinkResultDialogRequest alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFLinkResultDialogRequest initWithSuccessResult:attribution:](v11, "initWithSuccessResult:attribution:", v10, v12);

  -[WFDialogRequest setLinkDialog:](v13, "setLinkDialog:", v9);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__WFDialogTransformer_showLinkResult_dialog_completionHandler___block_invoke;
  v15[3] = &unk_1E7AEF4E0;
  v16 = v8;
  v14 = v8;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v13, v15);

}

- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DC79F0];
  v10 = a4;
  v11 = [v9 alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithControlType:identity:attribution:", a3, v10, v12);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__WFDialogTransformer_showChronoControlOfType_identity_completionHandler___block_invoke;
  v15[3] = &unk_1E7AEF4E0;
  v16 = v8;
  v14 = v8;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v13, v15);

}

- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFDialogTransformer privacyAttribution](self, "privacyAttribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authorizationDialogRequestWithAttribution:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__WFDialogTransformer_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke;
  v11[3] = &unk_1E7AEF4E0;
  v12 = v6;
  v10 = v6;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v9, v11);

}

- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3
{
  id v4;
  WFLinkSnippetEnvironmentDialogRequest *v5;
  void *v6;
  WFLinkSnippetEnvironmentDialogRequest *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [WFLinkSnippetEnvironmentDialogRequest alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFLinkSnippetEnvironmentDialogRequest initWithAttribution:prompt:](v5, "initWithAttribution:prompt:", v6, 0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__WFDialogTransformer_getEnvironmentForLinkViewSnippetWithCompletion___block_invoke;
  v9[3] = &unk_1E7AEF558;
  v10 = v4;
  v8 = v4;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v7, v9);

}

- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3
{
  id v4;
  WFLinkSnippetEnvironmentDialogRequest *v5;
  void *v6;
  WFLinkSnippetEnvironmentDialogRequest *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [WFLinkSnippetEnvironmentDialogRequest alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFLinkSnippetEnvironmentDialogRequest initWithAttribution:prompt:](v5, "initWithAttribution:prompt:", v6, 0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__WFDialogTransformer_getPreferredSizeForLinkViewSnippetWithCompletion___block_invoke;
  v9[3] = &unk_1E7AEF558;
  v10 = v4;
  v8 = v4;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v7, v9);

}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFShowActionInterfaceDialogRequest *v11;
  void *v12;
  WFShowActionInterfaceDialogRequest *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  WFDialogTransformer *v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [WFShowActionInterfaceDialogRequest alloc];
  -[WFDialogTransformer attribution](self, "attribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFShowActionInterfaceDialogRequest initWithActionClassName:classNamesByType:attribution:](v11, "initWithActionClassName:classNamesByType:attribution:", v8, v10, v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke;
  v16[3] = &unk_1E7AEF398;
  v18 = self;
  v19 = v9;
  v17 = v8;
  v14 = v8;
  v15 = v9;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v13, v16);

}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[WFDialogTransformer userInterfacePresenter](self, "userInterfacePresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFDialogTransformer userInterfacePresenter](self, "userInterfacePresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogTransformer runningContext](self, "runningContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__WFDialogTransformer_dismissPresentedContentWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E7AF4FB0;
    v9 = v4;
    objc_msgSend(v6, "dismissPresentedContentForRunningContext:completionHandler:", v7, v8);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4
{
  id v5;
  WFAppPickerParameter *v6;
  WFParameterDefinition *v7;
  void *v8;
  WFParameterDefinition *v9;
  WFAppPickerParameter *v10;
  void *v11;
  void *v12;
  id v13;
  WFAppPickerParameter *v14;
  _QWORD v15[5];
  WFAppPickerParameter *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = [WFAppPickerParameter alloc];
  v7 = [WFParameterDefinition alloc];
  v18 = CFSTR("AppSearchType");
  v19[0] = CFSTR("OpenApp");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFParameterDefinition initWithDictionary:](v7, "initWithDictionary:", v8);
  v10 = -[WFAppPickerParameter initWithDefinition:](v6, "initWithDefinition:", v9);

  -[WFDialogTransformer attribution](self, "attribution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameter localizedPrompt](v10, "localizedPrompt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E7AEF580;
  v15[4] = self;
  v16 = v10;
  v17 = v5;
  v13 = v5;
  v14 = v10;
  -[WFDynamicEnumerationParameter createDialogRequestWithAttribution:defaultState:prompt:completionHandler:](v14, "createDialogRequestWithAttribution:defaultState:prompt:completionHandler:", v11, 0, v12, v15);

}

- (BOOL)shouldNotHandoff
{
  return 1;
}

- (void)openAppWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v6)
    v6 = (id)*MEMORY[0x1E0DC7FA0];
  -[WFDialogTransformer currentAction](self, "currentAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationWillLaunchInForeground");

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKey:", &unk_1E7B8B4B8, *MEMORY[0x1E0D22D50]);
  -[WFDialogTransformer currentAction](self, "currentAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "progressIsPersistentInSystemAperture");

  if (v13)
    objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x1E0DAB800], *MEMORY[0x1E0D22D58]);
  if (+[WFAssistantServicesWrapper deviceSupportsSystemAssistantExperience](WFAssistantServicesWrapper, "deviceSupportsSystemAssistantExperience"))
  {
    v14 = _os_feature_enabled_impl();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_alloc(MEMORY[0x1E0D13E10]);
  v16 = (void *)objc_msgSend(v10, "copy");
  v17 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v6, v16, 0, 0, v14);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__WFDialogTransformer_openAppWithBundleIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E7AF8860;
  v20 = v7;
  v18 = v7;
  objc_msgSend(v17, "performWithCompletionHandler:", v19);

}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[WFDialogTransformer isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    if (v9)
    {
      getWFDialogLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v14 = "%s Dialog transformer only supports showing web pages -- but it was asked to open a URL (%@) with an app (bundle ID %@)";
        v15 = v13;
        v16 = 32;
LABEL_11:
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if ((WFURLIsWebPage() & 1) != 0)
      {
LABEL_13:
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
        goto LABEL_14;
      }
      getWFDialogLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
        v21 = 2112;
        v22 = v8;
        v14 = "%s Dialog transformer only supports opening web pages -- but it was asked to open a non-webpage URL %@";
        v15 = v13;
        v16 = 22;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  getWFDialogLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]";
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Sending open URL interaction to Siri", buf, 0xCu);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D08]), "initWithURL:andBundleIdentifier:", v8, v9);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__WFDialogTransformer_openURL_withBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E7AEF5A8;
  v18 = v10;
  -[WFDialogTransformer performSiriRequest:completionHandler:](self, "performSiriRequest:completionHandler:", v12, v17);

LABEL_14:
}

- (void)configureIntent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  -[WFDialogTransformer siriOptions](self, "siriOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v14, "_setExecutionContext:", objc_msgSend(v4, "executionContext"));
    objc_msgSend(v14, "wf_updateIdiomIfNeeded:", objc_msgSend(v5, "currentDeviceIdiom"));
    objc_msgSend(v5, "originatingDeviceIDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setOriginatingDeviceIdsIdentifier:", v6);

    objc_msgSend(v5, "originatingDeviceRapportEffectiveIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setOriginatingDeviceRapportEffectiveIdentifier:", v7);

    objc_msgSend(v5, "originatingDeviceRapportMediaSystemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setOriginatingDeviceRapportMediaSystemIdentifier:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isOwnedByCurrentUser"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setIsOwnedByCurrentUser:", v9);

    -[WFDialogTransformer airPlayRouteIDs](self, "airPlayRouteIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v14, "launchId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.")))
      {
        objc_msgSend(v14, "extensionBundleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple."));

        if ((v13 & 1) == 0)
          goto LABEL_9;
        goto LABEL_7;
      }

    }
LABEL_7:
    -[WFDialogTransformer airPlayRouteIDs](self, "airPlayRouteIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setAirPlayRouteIds:", v10);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  WFExternalUIPresenter *externalUIPresenter;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFWorkflowExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[WFDialogTransformer performSiriRequest:completionHandler:]";
    v15 = 2112;
    v16 = (id)objc_opt_class();
    v9 = v16;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Sending interaction of type %@ to Siri", (uint8_t *)&v13, 0x16u);

  }
  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    -[WFExternalUIPresenter performSiriRequest:completionHandler:](externalUIPresenter, "performSiriRequest:completionHandler:", v6, v7);
  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[WFDialogTransformer performSiriRequest:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v13, 0xCu);
    }

  }
  return externalUIPresenter != 0;
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  WFExternalUIPresenter *externalUIPresenter;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[WFDialogTransformer didStartActionWithIdentifier:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending action identifier to Siri", (uint8_t *)&v8, 0xCu);
  }

  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    -[WFExternalUIPresenter didStartActionWithIdentifier:](externalUIPresenter, "didStartActionWithIdentifier:", v4);
  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[WFDialogTransformer didStartActionWithIdentifier:]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  WFExternalUIPresenter *externalUIPresenter;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[WFDialogTransformer didFinishActionWithIdentifier:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending action identifier to Siri", (uint8_t *)&v8, 0xCu);
  }

  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
  {
    -[WFExternalUIPresenter didFinishActionWithIdentifier:](externalUIPresenter, "didFinishActionWithIdentifier:", v4);
  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[WFDialogTransformer didFinishActionWithIdentifier:]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Siri UI presenter not set", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (BOOL)isRunningWithExternalUI
{
  void *v2;
  BOOL v3;

  -[WFDialogTransformer externalUIPresenter](self, "externalUIPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isRunningWithToolKitClient
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[WFDialogTransformer isRunningWithExternalUI](self, "isRunningWithExternalUI");
  if (v3)
  {
    -[WFDialogTransformer runningContext](self, "runningContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isStepwise");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isRunningWithSiriUI
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[WFDialogTransformer isRunningWithExternalUI](self, "isRunningWithExternalUI");
  if (v3)
  {
    -[WFDialogTransformer runningContext](self, "runningContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldForwardSiriActionRequests");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  WFExternalUIPresenter *externalUIPresenter;

  externalUIPresenter = self->_externalUIPresenter;
  if (externalUIPresenter)
    -[WFExternalUIPresenter willBeginExecutingShortcutStep:](externalUIPresenter, "willBeginExecutingShortcutStep:", a3);
}

- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0DC7988];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithAppBundleIdentifier:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__WFDialogTransformer_handleAppProtectionRequestWithBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E7AEF4E0;
  v12 = v6;
  v10 = v6;
  -[WFDialogTransformer handleDialogRequest:completionHandler:](self, "handleDialogRequest:completionHandler:", v9, v11);

}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (WFDialogTransformerDelegate)delegate
{
  return (WFDialogTransformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFAction)currentAction
{
  return self->_currentAction;
}

- (void)setCurrentAction:(id)a3
{
  objc_storeStrong((id *)&self->_currentAction, a3);
}

- (NSString)runSource
{
  return self->_runSource;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_runViewSource, a3);
}

- (WFUIPresenter)userInterfacePresenter
{
  return self->_userInterfacePresenter;
}

- (void)setUserInterfacePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfacePresenter, a3);
}

- (WFExternalUIPresenter)externalUIPresenter
{
  return self->_externalUIPresenter;
}

- (void)setExternalUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_externalUIPresenter, a3);
}

- (NSArray)allowedParameterClasses
{
  return self->_allowedParameterClasses;
}

- (void)setAllowedParameterClasses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedParameterClasses, a3);
}

- (BOOL)allowsHandoff
{
  return self->_allowsHandoff;
}

- (void)setAllowsHandoff:(BOOL)a3
{
  self->_allowsHandoff = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (int64_t)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (void)setNumberOfDialogsPresented:(int64_t)a3
{
  self->_numberOfDialogsPresented = a3;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFSequentialParameterInputProvider)parameterInputProvider
{
  return self->_parameterInputProvider;
}

- (void)setParameterInputProvider:(id)a3
{
  objc_storeStrong((id *)&self->_parameterInputProvider, a3);
}

- (id)parameterInputCompletionHandler
{
  return self->_parameterInputCompletionHandler;
}

- (void)setParameterInputCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)workflowStartTime
{
  return self->_workflowStartTime;
}

- (void)setWorkflowStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_workflowStartTime, a3);
}

- (WFChooseFromListDataStore)chooseFromListDataStore
{
  return self->_chooseFromListDataStore;
}

- (void)setChooseFromListDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_chooseFromListDataStore, a3);
}

- (WFSiriWorkflowRunnerClientOptions)siriOptions
{
  return self->_siriOptions;
}

- (BOOL)hasPresentedFirstDialog
{
  return self->_hasPresentedFirstDialog;
}

- (void)setHasPresentedFirstDialog:(BOOL)a3
{
  self->_hasPresentedFirstDialog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriOptions, 0);
  objc_storeStrong((id *)&self->_chooseFromListDataStore, 0);
  objc_storeStrong((id *)&self->_workflowStartTime, 0);
  objc_storeStrong(&self->_parameterInputCompletionHandler, 0);
  objc_storeStrong((id *)&self->_parameterInputProvider, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_allowedParameterClasses, 0);
  objc_storeStrong((id *)&self->_externalUIPresenter, 0);
  objc_storeStrong((id *)&self->_userInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

void __88__WFDialogTransformer_handleAppProtectionRequestWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_msgSend(v7, "requestResponseCode");
    if (!v8)
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfCancelledStepError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

LABEL_13:
      v9 = v7;
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_12;
    }
    v9 = v7;
    if (v8 == 1)
    {
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_12:
      v10();
      goto LABEL_13;
    }
  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v16 = 136315394;
      v17 = "-[WFDialogTransformer handleAppProtectionRequestWithBundleIdentifier:completionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Error in app protection request: %@", (uint8_t *)&v16, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfCancelledStepError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    v9 = 0;
  }
LABEL_14:

}

void __70__WFDialogTransformer_openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      getWFDialogLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]_block_invoke";
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Error handling open URL interaction in Siri: %@", (uint8_t *)&v13, 0x16u);

      }
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    v12 = v3;
  }
  else
  {

    getWFDialogLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315394;
      v14 = "-[WFDialogTransformer openURL:withBundleIdentifier:completionHandler:]_block_invoke";
      v15 = 2112;
      v16 = (id)objc_opt_class();
      v10 = v16;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v13, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 1, v12);
  }

}

uint64_t __69__WFDialogTransformer_openAppWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke_2;
  v5[3] = &unk_1E7AEF410;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleDialogRequest:completionHandler:", a2, v5);

}

void __59__WFDialogTransformer_resolveDescriptor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "parameterStateFromDialogResponse:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v7;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

uint64_t __68__WFDialogTransformer_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFRemoteActionUserInterface *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  if (objc_msgSend(v5, "isCancelled"))
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v10;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v9, 0, v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "responseCode"))
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isUnsupported"))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wf_unsupportedActionErrorWithType:platformIdiom:", CFSTR("NotAvailableOnSpecifiedPlatform"), objc_msgSend(v14, "idiom"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);

    goto LABEL_12;
  }
  if (v6 && !v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(v8, "listenerEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInterfaceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class userInterfaceXPCInterface](NSClassFromString(*(NSString **)(a1 + 32)), "userInterfaceXPCInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFRemoteActionUserInterface initWithUserInterfaceType:listenerEndpoint:interface:]([WFRemoteActionUserInterface alloc], "initWithUserInterfaceType:listenerEndpoint:interface:", v16, v11, v17);
  objc_msgSend(*(id *)(a1 + 40), "currentAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_2;
  v21[3] = &unk_1E7AF94B0;
  v22 = v19;
  v20 = v19;
  -[WFRemoteActionUserInterface setOnInterfaceInterruption:](v18, "setOnInterfaceInterruption:", v21);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_11:
LABEL_12:

}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_3;
      block[3] = &unk_1E7AF94B0;
      v5 = *(id *)(a1 + 32);
      dispatch_async(v3, block);

    }
  }
}

void __111__WFDialogTransformer_requestActionInterfacePresentationForActionClassName_classNamesByType_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0DC8270];
  v8 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v1, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFRunnerFailureErrorMessage(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v7);

}

void __72__WFDialogTransformer_getPreferredSizeForLinkViewSnippetWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v11;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v8, "size");
    objc_msgSend(v9, "wf_valueWithCGSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__WFDialogTransformer_getEnvironmentForLinkViewSnippetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v8;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
}

void __82__WFDialogTransformer_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v7;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v4, "result");

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

uint64_t __74__WFDialogTransformer_showChronoControlOfType_identity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__WFDialogTransformer_showLinkResult_dialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v7;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v4, "snippetResponseCode");

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E7AEF508;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 80);
  objc_msgSend(v2, "encodedTypedValueWithCompletion:", v6);

}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = (objc_class *)MEMORY[0x1E0DC7C20];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithParameterKey:parameterValue:", v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0DC7BC0]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "attribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithActionParameterMetadata:dialogString:viewSnippet:attribution:parameterInfo:", v9, v10, v11, v12, v7);

  objc_msgSend(v13, "setLinkDialog:", *(_QWORD *)(a1 + 64));
  v14 = *(void **)(a1 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_3;
  v15[3] = &unk_1E7AEF4E0;
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v14, "handleDialogRequest:completionHandler:", v13, v15);

}

void __136__WFDialogTransformer_showLinkParameterConfirmationWithActionMetadata_dialog_dialogString_viewSnippet_parameterValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v7;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v4, "requestResponseCode");

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

void __175__WFDialogTransformer_showLinkActionConfirmationWithActionMetadata_showPrompt_dialog_dialogString_viewSnippet_confirmationActionName_isContinueInAppRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v7;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v4, "requestResponseCode");

  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
}

uint64_t __73__WFDialogTransformer_showPreviewForContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled"));
}

void __70__WFDialogTransformer_showHandleInteraction_prompt_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v7, "interactionResponseCode"));

  }
  else
  {

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __93__WFDialogTransformer_showConfirmInteraction_prompt_requireAuthentication_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v8 = v5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "interactionResponseCode"));

  }
  else
  {

    if (objc_msgSend(v8, "responseCode") == 4)
      v7 = 3;
    else
      v7 = 0;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);
  }

}

void __96__WFDialogTransformer_showAskParameterDialogForParameter_action_defaultState_prompt_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void (*v4)(void);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isCancelled"))
  {
    v4 = *(void (**)(void))(a1[6] + 16);
LABEL_8:
    v4();
    goto LABEL_9;
  }
  objc_msgSend(v3, "serializedParameterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v4 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_8;
  }
  v6 = (void *)a1[4];
  v7 = a1[5];
  objc_msgSend(v3, "serializedParameterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createStateForParameter:fromSerializedRepresentation:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  getWFDialogLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[WFDialogTransformer showAskParameterDialogForParameter:action:defaultState:prompt:completion:]_block_invoke";
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
LABEL_9:

}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  if (objc_msgSend(a1[4], "isRunningWithToolKitClient"))
  {
    v2 = objc_alloc(MEMORY[0x1E0DC7DF0]);
    objc_msgSend(a1[5], "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithParameterKey:attribution:prompt:", v3, v4, a1[6]);

    v6 = a1[4];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2;
    v21[3] = &unk_1E7AEF398;
    v24 = a1[9];
    v22 = a1[7];
    v23 = a1[5];
    objc_msgSend(v6, "handleDialogRequest:completionHandler:", v5, v21);

  }
  else if (objc_msgSend(a1[5], "conformsToProtocol:", &unk_1EF71A338))
  {
    v7 = a1[5];
    objc_msgSend(a1[4], "attribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_4;
    v14[3] = &unk_1E7AEF438;
    v10 = a1[5];
    v14[4] = a1[4];
    v11 = a1[6];
    v14[1] = 3221225472;
    v15 = v10;
    v16 = a1[7];
    v17 = a1[8];
    v18 = a1[6];
    v12 = a1[9];
    v19 = v7;
    v20 = v12;
    v13 = v7;
    objc_msgSend(v13, "createDialogRequestWithAttribution:defaultState:prompt:completionHandler:", v8, v9, v11, v14);

  }
  else
  {
    objc_msgSend(a1[4], "showAskParameterDialogForParameter:action:defaultState:prompt:completion:", a1[5], a1[7], a1[8], a1[6], a1[9]);
  }
}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_291(id *a1, void *a2)
{
  id v3;
  WFEntityPickerDialogRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  WFEntityPickerDialogRequest *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = [WFEntityPickerDialogRequest alloc];
  objc_msgSend(a1[4], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "attribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFEntityPickerDialogRequest initWithActionIdentifier:parameterKey:items:attribution:prompt:](v4, "initWithActionIdentifier:parameterKey:items:attribution:prompt:", v5, v6, v3, v7, 0);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2_293;
  v12[3] = &unk_1E7AEF460;
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[6];
  v15 = v10;
  v12[4] = v11;
  v16 = a1[8];
  v13 = a1[4];
  v14 = a1[5];
  objc_msgSend(v9, "handleDialogRequest:completionHandler:", v8, v12);

}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2_293(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "userRequestedAllOptions"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (objc_msgSend(v3, "userRequestedOpenApp"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "attribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_3_294;
    v16[3] = &unk_1E7AF8860;
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v4, "openAppWithBundleIdentifier:completionHandler:", v6, v16);

  }
  else
  {
    getWFDialogLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "selectedEntry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v19 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:comp"
            "letion:]_block_invoke_2";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s User selected entry: %@ for action: %@, parameter: %@; going through default ask path",
        buf,
        0x2Au);

    }
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "selectedEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serializedParameterState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createStateForParameter:fromSerializedRepresentation:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_3_294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  if (!objc_msgSend(v5, "isCancelled") || v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v8, "encodedTypedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "toolInvocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_3;
    v13[3] = &unk_1E7AEF370;
    v12 = *(_QWORD *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v9, "processEncodedValue:withToolKitInvocation:forParameter:completionHandler:", v10, v11, v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "showAskParameterDialogForParameter:action:defaultState:prompt:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent")))goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 32), "runningContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v4 = v9;

    if ((isKindOfClass & 1) != 0)
    {
      WFLocalizedString(CFSTR("Add"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "overrideDoneButtonTitle:", v10);

    }
LABEL_9:

  }
  getWFDialogLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 136315650;
    v18 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:comple"
          "tion:]_block_invoke_4";
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", buf, 0x20u);
  }

  v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_285;
  v14[3] = &unk_1E7AEF410;
  v16 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 72);
  objc_msgSend(v13, "handleDialogRequest:completionHandler:", v3, v14);

LABEL_14:
}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_285(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (objc_msgSend(v3, "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2_286;
    aBlock[3] = &unk_1E7AEF3C0;
    v13 = *(id *)(a1 + 32);
    v5 = v3;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    v6 = _Block_copy(aBlock);
    v7 = objc_opt_respondsToSelector();
    v8 = *(void **)(a1 + 32);
    if ((v7 & 1) != 0)
    {
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_290;
      v10[3] = &unk_1E7AEF3E8;
      v11 = v6;
      objc_msgSend(v8, "createParameterStateFromDialogResponse:completionHandler:", v5, v10);
      v9 = v11;
    }
    else
    {
      objc_msgSend(v8, "parameterStateFromDialogResponse:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v6 + 2))(v6, v9);
    }

  }
}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_2_286(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "stateClass");
  if (v4 != objc_opt_class())
  {
    getWFDialogLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_msgSend(v7, "stateClass");
      v10 = v9;
      v14 = 136315906;
      v15 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:comp"
            "letion:]_block_invoke_2";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = (id)objc_opt_class();
      v11 = v21;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_FAULT, "%s %@ expected a parameter state of class: %@, but received a different parameter state class: %@", (uint8_t *)&v14, 0x2Au);

    }
  }
  getWFDialogLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 40);
    v14 = 136315650;
    v15 = "-[WFDialogTransformer sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:comple"
          "tion:]_block_invoke";
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ created %@", (uint8_t *)&v14, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__WFDialogTransformer_sequentialParameterInputProvider_didAdvanceToParameter_action_defaultState_prompt_completion___block_invoke_3(uint64_t a1, void *a2)
{
  WFToolKitProcessedValueParameterState *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[WFToolKitProcessedValueParameterState initWithProcessedValue:]([WFToolKitProcessedValueParameterState alloc], "initWithProcessedValue:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __47__WFDialogTransformer_handleAlertAsSiriDialog___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void (**v3)(void);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "buttons");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "handler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = objc_alloc(MEMORY[0x1E0DC79E0]);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "associatedParameterKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithItems:allowsMultipleSelection:message:attribution:prompt:parameterKey:", v4, v3, v5, v6, v7, v8);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke_2;
  v15[3] = &unk_1E7AEF2F8;
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(void **)(a1 + 56);
  v16 = *(id *)(a1 + 48);
  v18 = v10;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 64);
  v17 = v12;
  v14 = *(_QWORD *)(a1 + 80);
  v19 = v13;
  v20 = v14;
  objc_msgSend(v16, "handleDialogRequest:completionHandler:", v9, v15);

}

void __54__WFDialogTransformer_handleAlertWithMultipleButtons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
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
  void (**v20)(void);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (**v30)(void);
  id v31;
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
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v7, "isCancelled"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "handler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "cancel");
        goto LABEL_30;
      }
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_28:
      objc_msgSend(v9, "handler");
      v30 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v30[2]();

LABEL_30:
      v12 = v7;
      goto LABEL_31;
    }
    v31 = v6;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v7, "selectedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "handler");
            v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v20[2]();

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v15);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v7, "selectedItems");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "containsObject:", v26);

              objc_msgSend(v27, "setSelected:", v29);
            }
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v23);
    }

    v12 = v7;
    v6 = v31;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v12 = v7;
      if (v9)
        goto LABEL_28;
    }
  }
  else
  {

    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopWithError:", v11);

    v12 = 0;
  }
LABEL_31:

}

void __49__WFDialogTransformer_handleAlertWithDatePicker___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isCancelled"))
  {
    objc_msgSend(a1[4], "handler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(a1[5], "cancel");
      goto LABEL_10;
    }
    v4 = a1[4];
    goto LABEL_8;
  }
  objc_msgSend(v9, "inputtedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "inputtedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setDatePickerResult:", v6);

  }
  objc_msgSend(a1[7], "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = a1[7];
LABEL_8:
    objc_msgSend(v4, "handler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
LABEL_10:

}

void __48__WFDialogTransformer_handleAlertWithTextField___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  if (objc_msgSend(v5, "isCancelled"))
  {
    objc_msgSend(a1[4], "handler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(a1[5], "cancel");
      goto LABEL_15;
    }
    v10 = a1[4];
    goto LABEL_13;
  }
  objc_msgSend(v8, "inputtedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "inputtedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setTextFieldResults:", v13);

  }
  objc_msgSend(a1[7], "handler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v10 = a1[7];
LABEL_13:
    objc_msgSend(v10, "handler");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();

  }
LABEL_15:

}

void __41__WFDialogTransformer_handleSimpleAlert___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void (**v6)(void);

  if (!objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(a1[6], "handler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    v4 = a1[6];
    goto LABEL_6;
  }
  objc_msgSend(a1[4], "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = a1[4];
LABEL_6:
    objc_msgSend(v4, "handler");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    return;
  }
  objc_msgSend(a1[5], "cancel");
}

void __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "fileResponseCode") == 1)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_11;
  }
  if ((objc_msgSend(v10, "isCancelled") & 1) != 0 || !objc_msgSend(v10, "fileResponseCode"))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "error");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, v8);

LABEL_11:
}

id __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  WFLocalizedString(CFSTR("“%@”"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __90__WFDialogTransformer_requestFileAccessForURLs_workflowName_workflowID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "wf_localizedDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "lastPathComponent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __83__WFDialogTransformer_executeSmartPromptIntentWithConfiguration_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void (*v17)(void);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(v3, "interaction");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "intentResponse");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        INTypedIntentResponseWithIntentResponse();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "authorizationResult");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "unsignedIntegerValue");

            if (v9 == 3)
            {
              getWFSecurityLogObject();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
                _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEBUG, "%s User selected Preview in Siri, handing off to Shortcuts", buf, 0xCu);
              }

              (*(void (**)(void))(a1[6] + 16))();
            }
            else
            {
              v13 = (void *)a1[4];
              v14 = a1[5];
              v18 = 0;
              objc_msgSend(v13, "updateSmartPromptsWithConfiguration:resultCode:error:", v14, v9, &v18);
              v15 = v18;
              if (v15)
              {
                getWFSecurityLogObject();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
                  v21 = 2112;
                  v22 = v15;
                  _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Failed to update smart prompts state in Siri: %@", buf, 0x16u);
                }

                v17 = *(void (**)(void))(a1[6] + 16);
              }
              else
              {
                v17 = *(void (**)(void))(a1[6] + 16);
              }
              v17();

            }
            goto LABEL_15;
          }
        }

      }
      (*(void (**)(void))(a1[6] + 16))();
LABEL_15:

      goto LABEL_16;
    }
  }

  getWFDialogLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFDialogTransformer executeSmartPromptIntentWithConfiguration:completionHandler:]_block_invoke";
    v21 = 2112;
    v22 = (id)objc_opt_class();
    v12 = v22;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_16:

}

void __79__WFDialogTransformer_requestAuthorizationWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v11;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  if (objc_msgSend(v7, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  else
  {
    v8 = v11;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (objc_msgSend(v10, "result") == 5)
      objc_msgSend(*(id *)(a1 + 32), "cancel");
    else
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v7, "result"));

  }
}

void __56__WFDialogTransformer_cleanupListDialogRequestIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "chooseFromListDataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeContentItemWithIdentifier:", v4);
}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "contentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_2;
    v10[3] = &unk_1E7AEF158;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v11;
    v13 = v7;
    objc_msgSend(v9, "encodedTypedValueWithCompletion:", v10);

  }
  else
  {

    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v8, 0);
  }

}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0DC79E0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(*(id *)(a1 + 32), "allowsMultipleSelection");
  objc_msgSend(*(id *)(a1 + 32), "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prompt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v5, "initWithItems:allowsMultipleSelection:message:attribution:prompt:parameterKey:", v4, v6, v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 40), "chooseFromListDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataStoreEndpoint:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__WFDialogTransformer_prepareListDialogRequestIfNeeded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "chooseFromListDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addContentItem:withIdentifier:", v6, v7);

  v8 = objc_alloc(MEMORY[0x1E0DC7AE0]);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 40), "selected");
  v14 = objc_msgSend(*(id *)(a1 + 40), "hideSubtitle");
  objc_msgSend(*(id *)(a1 + 40), "serializedPossibleState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v8, "initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:", v9, v10, v11, v12, v13, v14, v4, v15);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __59__WFDialogTransformer_showDialogRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUIRequestResponse:error:forRequest:shouldFailoverToLocalUI:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "externalUIPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E7AEF0E0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performDialogRequest:completionHandler:", v6, v7);

}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_151(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CB8]), "initWithDialogRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "externalUIPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2_153;
  v9[3] = &unk_1E7AEF130;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v12 = v6;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v5, "performSiriRequest:completionHandler:", v7, v9);

}

void __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2_153(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cleanupListDialogRequestIfNeeded:", *(_QWORD *)(a1 + 40));
  v4 = v3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "dialogResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dialogRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleUIRequestResponse:error:forRequest:shouldFailoverToLocalUI:completionHandler:", v6, 0, v7, 1, *(_QWORD *)(a1 + 56));

    v8 = v4;
  }
  else
  {

    getWFDialogLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315394;
      v13 = "-[WFDialogTransformer handleDialogRequest:completionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = (id)objc_opt_class();
      v10 = v15;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopWithError:", v8);
  }

}

uint64_t __61__WFDialogTransformer_handleDialogRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUIRequestResponse:error:forRequest:shouldFailoverToLocalUI:completionHandler:", a2, 0, *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

@end
