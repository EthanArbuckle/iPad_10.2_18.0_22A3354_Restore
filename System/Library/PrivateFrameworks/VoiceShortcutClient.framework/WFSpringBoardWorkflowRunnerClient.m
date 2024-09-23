@implementation WFSpringBoardWorkflowRunnerClient

- (WFSpringBoardWorkflowRunnerClient)initWithWebClipMetadata:(id)a3
{
  id v4;
  void *v5;
  WFSpringBoardWorkflowRunnerClient *v6;

  v4 = a3;
  objc_msgSend(v4, "shortcutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFSpringBoardWorkflowRunnerClient initWithWorkflowIdentifier:](self, "initWithWorkflowIdentifier:", v5);

  -[WFSpringBoardWorkflowRunnerClient setMetadata:](v6, "setMetadata:", v4);
  -[WFWorkflowRunnerClient setDelegate:](v6, "setDelegate:", v6);

  return v6;
}

- (WFSpringBoardWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  WFAutoShortcutContextualAction *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  WFContextualActionContext *v18;
  WFContextualActionRunDescriptor *v19;
  WFWorkflowRunRequest *v20;
  WFSpringBoardWorkflowRunnerClient *v21;
  void *v23;
  objc_super v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("app-shortcut:")))
  {
    getWFVoiceShortcutClientLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFSpringBoardWorkflowRunnerClient initWithWorkflowIdentifier:]";
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEBUG, "%s Will run App Shortcut from base64 encoding.", buf, 0xCu);
    }

    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("app-shortcut:"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (v8)
    {
      v10 = [WFAutoShortcutContextualAction alloc];
      objc_msgSend(v8, "underlyingAutoShortcut");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "phrase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "underlyingAutoShortcut");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v23 = v7;
      v14 = v6;
      v15 = v9;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFAutoShortcutContextualAction initWithAutoShortcut:phrase:alternativePhrases:bundleIdentifier:](v10, "initWithAutoShortcut:phrase:alternativePhrases:bundleIdentifier:", v11, v12, 0, v16);

      v18 = -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 5);
      v19 = -[WFContextualActionRunDescriptor initWithAction:context:]([WFContextualActionRunDescriptor alloc], "initWithAction:context:", v17, v18);

      v9 = v15;
      v6 = v14;
      v7 = v23;
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[WFSpringBoardWorkflowRunnerClient initWithWorkflowIdentifier:]";
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_ERROR, "%s Failed to decode app shortcut with error: %@", buf, 0x16u);
      }
      v19 = 0;
    }

    if (!v8)
    {
      v21 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v19 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v4);

  }
  v20 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  -[WFWorkflowRunRequest setRunSource:](v20, "setRunSource:", CFSTR("homescreen"));
  v24.receiver = self;
  v24.super_class = (Class)WFSpringBoardWorkflowRunnerClient;
  self = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v24, sel_initWithDescriptor_runRequest_, v19, v20);

  v21 = self;
LABEL_12:

  return v21;
}

- (void)showSingleStepCompletionWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  -[WFSpringBoardWorkflowRunnerClient metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpringBoardWorkflowRunnerClient.m"), 106, CFSTR("Class must be initialized with web clip metadata before showing single step completion"));

  }
  +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSpringBoardWorkflowRunnerClient metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showSingleStepCompletionForWebClip:completion:", v7, v5);

}

- (void)start
{
  objc_super v3;

  objc_storeStrong((id *)&self->_retainedSelf, self);
  v3.receiver = self;
  v3.super_class = (Class)WFSpringBoardWorkflowRunnerClient;
  -[WFWorkflowRunnerClient start](&v3, sel_start);
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  WFSpringBoardWorkflowRunnerClient *retainedSelf;

  retainedSelf = self->_retainedSelf;
  self->_retainedSelf = 0;

}

- (WFSpringBoardWebClipMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (WFSpringBoardWorkflowRunnerClient)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSelf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
