@implementation WFStaccatoWorkflowRunnerClient

- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3
{
  id v4;
  void *v5;
  WFStaccatoWorkflowRunnerClient *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[WFStaccatoWorkflowRunnerClient initWithStaccatoAction:interactionType:preciseTimeStamp:](self, "initWithStaccatoAction:interactionType:preciseTimeStamp:", v4, CFSTR("WFStaccatoActionInteractionTypeUnknown"), v5);

  return v6;
}

- (WFStaccatoWorkflowRunnerClient)initWithStaccatoAction:(id)a3 interactionType:(id)a4 preciseTimeStamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  WFStaccatoWorkflowRunnerClient *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoWorkflowRunnerClient.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionType"));

    if (v11)
      goto LABEL_4;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoWorkflowRunnerClient.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v10)
    goto LABEL_15;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStaccatoWorkflowRunnerClient.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preciseTimestamp"));

LABEL_4:
  getWFStaccatoLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[WFStaccatoWorkflowRunnerClient initWithStaccatoAction:interactionType:preciseTimeStamp:]";
    v33 = 2112;
    v34 = v10;
    v35 = 2048;
    v36 = v11;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_DEFAULT, "%s Initializing Staccato runner interaction type: %@, preciseTimestamp: %p, action: %@", buf, 0x2Au);
  }

  v13 = v9;
  if (v9)
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

  v30.receiver = self;
  v30.super_class = (Class)WFStaccatoWorkflowRunnerClient;
  v16 = -[WFSystemActionRunnerClient initWithSystemAction:](&v30, sel_initWithSystemAction_, v15);
  objc_msgSend(v13, "sectionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = objc_msgSend(v17, "isEqualToString:", CFSTR("Shortcuts"));
  if ((v15 & 1) == 0)
  {
    -[WFWorkflowRunnerClient runRequest](v16, "runRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPresentationMode:", 3);

  }
  -[WFWorkflowRunnerClient runRequest](v16, "runRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRunSource:", CFSTR("action-button"));

  -[WFSystemActionRunnerClient actionContext](v16, "actionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStaccatoInteractionType:", v10);

  -[WFSystemActionRunnerClient actionContext](v16, "actionContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSurface:", 12);

  -[WFSystemActionRunnerClient actionContext](v16, "actionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPreciseTimestamp:", v11);

  -[WFWorkflowRunnerClient runRequest](v16, "runRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient descriptor](v16, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](v16, "createRunningContextFromRequestIfNecessary:descriptor:", v23, v24);

  return v16;
}

- (NSString)presentableIdentifier
{
  void *v2;
  void *v3;

  -[WFWorkflowRunnerClient context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFApertureStatusViewControllerIdentityFromRunningContext(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)presentableRequester
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  -[WFSystemActionRunnerClient action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.actions.openapp"));

  if (v5)
  {
    -[WFSystemActionRunnerClient action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedBundleIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("com.apple.ShortcutsUI");
    v8 = CFSTR("com.apple.ShortcutsUI");
  }
  return (NSString *)v7;
}

- (void)startWithInteractionType:(id)a3 preciseTimeStamp:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFSystemActionRunnerClient actionContext](self, "actionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSystemActionRunnerClient actionContext](self, "actionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStaccatoInteractionType:", v10);

    -[WFSystemActionRunnerClient actionContext](self, "actionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreciseTimestamp:", v6);

  }
  if (!-[WFStaccatoWorkflowRunnerClient hasStartedRun](self, "hasStartedRun"))
    -[WFStaccatoWorkflowRunnerClient start](self, "start");

}

- (void)start
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[WFSystemActionRunnerClient actionContext](self, "actionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  getWFStaccatoLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[WFSystemActionRunnerClient actionContext](self, "actionContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "staccatoInteractionType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSystemActionRunnerClient actionContext](self, "actionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preciseTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSystemActionRunnerClient action](self, "action");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v13 = "-[WFStaccatoWorkflowRunnerClient start]";
      v14 = 2112;
      v15 = v7;
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_DEFAULT, "%s Running from staccato interaction type: %@, preciseTimestamp: %p, action: %@", buf, 0x2Au);

LABEL_6:
    }
  }
  else if (v5)
  {
    -[WFSystemActionRunnerClient action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFStaccatoWorkflowRunnerClient start]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_DEFAULT, "%s Running from staccato action: %@", buf, 0x16u);
    goto LABEL_6;
  }

  v11.receiver = self;
  v11.super_class = (Class)WFStaccatoWorkflowRunnerClient;
  -[WFSystemActionRunnerClient start](&v11, sel_start);
  -[WFStaccatoWorkflowRunnerClient setHasStartedRun:](self, "setHasStartedRun:", 1);
}

- (BOOL)hasCompletedRun
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[WFStaccatoWorkflowRunnerClient hasStartedRun](self, "hasStartedRun");
  if (v3)
  {
    -[WFSystemActionRunnerClient action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.VoiceMemos.ToggleRecording"));

    if ((v6 & 1) != 0)
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = !-[WFWorkflowRunnerClient isRunning](self, "isRunning");
  }
  return v3;
}

- (BOOL)hasStartedRun
{
  return self->_hasStartedRun;
}

- (void)setHasStartedRun:(BOOL)a3
{
  self->_hasStartedRun = a3;
}

+ (id)defaultContextualActionContext
{
  return -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 12);
}

@end
