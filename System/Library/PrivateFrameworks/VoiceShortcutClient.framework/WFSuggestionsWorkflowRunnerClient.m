@implementation WFSuggestionsWorkflowRunnerClient

- (WFSuggestionsWorkflowRunnerClient)initWithINShortcut:(id)a3 executionContext:(int64_t)a4
{
  return -[WFSuggestionsWorkflowRunnerClient initWithINShortcut:executionContext:remoteDialogPresenterEndpoint:](self, "initWithINShortcut:executionContext:remoteDialogPresenterEndpoint:", a3, a4, 0);
}

- (WFSuggestionsWorkflowRunnerClient)initWithLinkAction:(id)a3 bundleIdentifier:(id)a4 resultSurface:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  WFLinkContextualAction *v12;
  WFContextualActionContext *v13;
  WFContextualActionRunDescriptor *v14;
  WFContextualActionRunRequest *v15;
  __CFString **v16;
  WFSuggestionsWorkflowRunnerClient *v17;
  WFSuggestionsWorkflowRunnerClient *v18;
  WFSuggestionsWorkflowRunnerClient *v19;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSuggestionsWorkflowRunnerClient.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSuggestionsWorkflowRunnerClient.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  v12 = -[WFLinkContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:]([WFLinkContextualAction alloc], "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:", v9, v11, 0, 0);
  v13 = -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 8);
  v14 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v12, v13);
  v15 = -[WFContextualActionRunRequest initWithAction:actionContext:]([WFContextualActionRunRequest alloc], "initWithAction:actionContext:", v12, v13);
  -[WFWorkflowRunRequest setPresentationMode:](v15, "setPresentationMode:", 1);
  if (a5 - 1 > 2)
    v16 = WFWorkflowRunSourceUnknown;
  else
    v16 = off_1E5FC4778[a5 - 1];
  -[WFWorkflowRunRequest setRunSource:](v15, "setRunSource:", *v16);
  v17 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](self, "initWithDescriptor:runRequest:", v14, v15);
  v18 = v17;
  if (v17)
    v19 = v17;

  return v18;
}

- (WFSuggestionsWorkflowRunnerClient)initWithINShortcut:(id)a3 executionContext:(int64_t)a4 remoteDialogPresenterEndpoint:(id)a5
{
  id v8;
  id v9;
  void *v10;
  WFWorkflowDatabaseRunDescriptor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFINShortcutRunDescriptor *v16;
  uint64_t v17;
  WFWorkflowRunRequest *v18;
  __CFString *v19;
  __CFString *v20;
  WFSuggestionsWorkflowRunnerClient *v21;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = [WFWorkflowDatabaseRunDescriptor alloc];
    objc_msgSend(v10, "workflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vocabularyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workflow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spokenPhrase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:name:](v11, "initWithIdentifier:name:", v13, v15);

    v17 = 1;
  }
  else
  {

    v16 = -[WFINShortcutRunDescriptor initWithShortcut:]([WFINShortcutRunDescriptor alloc], "initWithShortcut:", v8);
    v17 = 0;
  }
  v18 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, v17);
  if ((unint64_t)a4 > 0xA)
    v19 = CFSTR("unknown");
  else
    v19 = off_1E5FC4E68[a4];
  v20 = v19;
  -[WFWorkflowRunRequest setRunSource:](v18, "setRunSource:", v20);

  -[WFWorkflowRunRequest setRemoteDialogPresenterEndpoint:](v18, "setRemoteDialogPresenterEndpoint:", v9);
  v23.receiver = self;
  v23.super_class = (Class)WFSuggestionsWorkflowRunnerClient;
  v21 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v23, sel_initWithDescriptor_runRequest_, v16, v18);

  return v21;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
