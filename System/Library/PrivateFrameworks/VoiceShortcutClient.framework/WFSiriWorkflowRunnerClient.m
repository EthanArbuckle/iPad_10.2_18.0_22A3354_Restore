@implementation WFSiriWorkflowRunnerClient

- (WFSiriWorkflowRunnerClient)initWithWorkflowName:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  WFWorkflowDatabaseRunDescriptor *v10;
  WFSiriWorkflowRunnerClient *v11;

  v8 = a5;
  v9 = a3;
  v10 = -[WFWorkflowDatabaseRunDescriptor initWithName:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithName:", v9);

  v11 = -[WFSiriWorkflowRunnerClient initWithRunDescriptor:runSource:options:](self, "initWithRunDescriptor:runSource:options:", v10, a4, v8);
  return v11;
}

- (WFSiriWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  WFWorkflowDatabaseRunDescriptor *v10;
  WFSiriWorkflowRunnerClient *v11;

  v8 = a5;
  v9 = a3;
  v10 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v9);

  v11 = -[WFSiriWorkflowRunnerClient initWithRunDescriptor:runSource:options:](self, "initWithRunDescriptor:runSource:options:", v10, a4, v8);
  return v11;
}

- (WFSiriWorkflowRunnerClient)initWithRunDescriptor:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  void *v8;
  id v9;
  id v10;
  NSXPCListener *v11;
  NSXPCListener *dialogRequestListener;
  NSXPCListener *v13;
  WFSiriWorkflowRunRequest *v14;
  void *v15;
  void *v16;
  WFSiriExecutionMetrics *v17;
  WFSiriExecutionMetrics *siriExecutionMetrics;
  WFSiriWorkflowRunnerClient *v19;
  objc_super v21;

  v8 = (void *)MEMORY[0x1E0CB3B58];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "anonymousListener");
  v11 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  -[NSXPCListener setDelegate:](v11, "setDelegate:", self);
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v11;
  v13 = v11;

  objc_msgSend(v9, "setCurrentDeviceIdiom:", -[WFSiriWorkflowRunnerClient deviceIdiomFromRunSource:](self, "deviceIdiomFromRunSource:", a4));
  v14 = -[WFSiriWorkflowRunRequest initWithOptions:]([WFSiriWorkflowRunRequest alloc], "initWithOptions:", v9);

  -[WFSiriWorkflowRunnerClient workflowRunSourceForSiriRunSource:](self, "workflowRunSourceForSiriRunSource:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRunSource:](v14, "setRunSource:", v15);

  -[NSXPCListener endpoint](v13, "endpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRemoteDialogPresenterEndpoint:](v14, "setRemoteDialogPresenterEndpoint:", v16);

  -[WFWorkflowRunRequest setAllowsDialogNotifications:](v14, "setAllowsDialogNotifications:", 0);
  v17 = objc_alloc_init(WFSiriExecutionMetrics);
  siriExecutionMetrics = self->_siriExecutionMetrics;
  self->_siriExecutionMetrics = v17;

  v21.receiver = self;
  v21.super_class = (Class)WFSiriWorkflowRunnerClient;
  v19 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v21, sel_initWithDescriptor_runRequest_, v10, v14);

  return v19;
}

- (WFSiriWorkflowRunnerClient)initWithAutoShortcutIdentifier:(id)a3 phrase:(id)a4 runSource:(int64_t)a5 action:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFLinkActionRunDescriptor *v16;
  NSXPCListener *v17;
  NSXPCListener *dialogRequestListener;
  NSXPCListener *v19;
  WFSiriWorkflowRunnerClientOptions *v20;
  WFSiriWorkflowRunRequest *v21;
  void *v22;
  void *v23;
  WFSiriExecutionMetrics *v24;
  WFSiriExecutionMetrics *siriExecutionMetrics;
  WFSiriWorkflowRunnerClient *v26;
  objc_super v28;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = -[WFLinkActionRunDescriptor initWithIdentifier:name:action:metadata:isAutoShortcut:]([WFLinkActionRunDescriptor alloc], "initWithIdentifier:name:action:metadata:isAutoShortcut:", v15, v14, v13, v12, 1);

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v17 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  -[NSXPCListener setDelegate:](v17, "setDelegate:", self);
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v17;
  v19 = v17;

  v20 = -[WFSiriWorkflowRunnerClientOptions initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:]([WFSiriWorkflowRunnerClientOptions alloc], "initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:", 0, 2, 0, 0, 0, 0);
  -[WFSiriWorkflowRunnerClientOptions setCurrentDeviceIdiom:](v20, "setCurrentDeviceIdiom:", -[WFSiriWorkflowRunnerClient deviceIdiomFromRunSource:](self, "deviceIdiomFromRunSource:", a5));
  v21 = -[WFSiriWorkflowRunRequest initWithOptions:]([WFSiriWorkflowRunRequest alloc], "initWithOptions:", v20);
  -[WFSiriWorkflowRunnerClient workflowRunSourceForSiriRunSource:](self, "workflowRunSourceForSiriRunSource:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRunSource:](v21, "setRunSource:", v22);

  -[NSXPCListener endpoint](v19, "endpoint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRemoteDialogPresenterEndpoint:](v21, "setRemoteDialogPresenterEndpoint:", v23);

  -[WFWorkflowRunRequest setAllowsDialogNotifications:](v21, "setAllowsDialogNotifications:", 0);
  v24 = objc_alloc_init(WFSiriExecutionMetrics);
  siriExecutionMetrics = self->_siriExecutionMetrics;
  self->_siriExecutionMetrics = v24;

  v28.receiver = self;
  v28.super_class = (Class)WFSiriWorkflowRunnerClient;
  v26 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v28, sel_initWithDescriptor_runRequest_, v16, v21);

  return v26;
}

- (WFSiriWorkflowRunnerClient)initWithPausedShortcutData:(id)a3 runSource:(int64_t)a4 options:(id)a5
{
  WFPausedShortcutData *v8;
  void *v9;
  id v10;
  NSXPCListener *v11;
  NSXPCListener *dialogRequestListener;
  NSXPCListener *v13;
  WFPausedShortcutData *pausedData;
  WFPausedShortcutData *v15;
  void *v16;
  WFSiriWorkflowRunRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  WFSiriWorkflowRunnerClient *v21;
  objc_super v23;

  v8 = (WFPausedShortcutData *)a3;
  v9 = (void *)MEMORY[0x1E0CB3B58];
  v10 = a5;
  objc_msgSend(v9, "anonymousListener");
  v11 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  -[NSXPCListener setDelegate:](v11, "setDelegate:", self);
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v11;
  v13 = v11;

  pausedData = self->_pausedData;
  self->_pausedData = v8;
  v15 = v8;

  -[WFPausedShortcutData context](v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient setContext:](self, "setContext:", v16);

  v17 = -[WFSiriWorkflowRunRequest initWithOptions:]([WFSiriWorkflowRunRequest alloc], "initWithOptions:", v10);
  -[WFSiriWorkflowRunnerClient workflowRunSourceForSiriRunSource:](self, "workflowRunSourceForSiriRunSource:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRunSource:](v17, "setRunSource:", v18);

  -[NSXPCListener endpoint](v13, "endpoint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRemoteDialogPresenterEndpoint:](v17, "setRemoteDialogPresenterEndpoint:", v19);

  -[WFPausedShortcutData descriptor](v15, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)WFSiriWorkflowRunnerClient;
  v21 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v23, sel_initWithDescriptor_runRequest_, v20, v17);

  return v21;
}

- (void)start
{
  void *v3;
  void *v4;
  char **v5;
  WFSiriWorkflowRunnerClient **v6;
  WFSiriWorkflowRunnerClient *v7;
  WFSiriWorkflowRunnerClient *v8;

  -[WFSiriWorkflowRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  -[WFSiriWorkflowRunnerClient pausedData](self, "pausedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = self;
    v5 = &selRef_resume;
    v6 = &v8;
  }
  else
  {
    v7 = self;
    v5 = &selRef_start;
    v6 = &v7;
  }
  v6[1] = (WFSiriWorkflowRunnerClient *)WFSiriWorkflowRunnerClient;
  objc_msgSendSuper2((objc_super *)v6, *v5, v7);
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSiriWorkflowRunnerClient;
  -[WFWorkflowRunnerClient stop](&v4, sel_stop);
  -[WFSiriWorkflowRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (id)pauseRunningShortcut
{
  WFPausedShortcutData *v3;
  void *v4;
  void *v5;
  WFPausedShortcutData *v6;

  -[WFWorkflowRunnerClient pause](self, "pause");
  v3 = [WFPausedShortcutData alloc];
  -[WFWorkflowRunnerClient context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFPausedShortcutData initWithContext:descriptor:](v3, "initWithContext:descriptor:", v4, v5);

  return v6;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSiriWorkflowRunnerClient;
  -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v4, sel_handleWorkflowRunResult_completion_, a3, a4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  WFExternalUIPresenterXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)willBeginExecutingShortcutWithActionCount:(id)a3
{
  -[WFSiriExecutionMetrics setShortcutActionCount:](self->_siriExecutionMetrics, "setShortcutActionCount:", objc_msgSend(a3, "unsignedIntValue"));
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  -[WFSiriExecutionMetrics setCurrentShortcutStep:](self->_siriExecutionMetrics, "setCurrentShortcutStep:", objc_msgSend(a3, "unsignedIntValue"));
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  WFSiriActionResponse *v14;
  void *v15;
  WFSiriActionResponse *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[WFWorkflowRunnerClient delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "workflowRunnerClient:performSiriRequest:completionHandler:", self, v6, v7);

    -[WFSiriExecutionMetrics setSiriInteractionCount:](self->_siriExecutionMetrics, "setSiriInteractionCount:", -[WFSiriExecutionMetrics siriInteractionCount](self->_siriExecutionMetrics, "siriInteractionCount") + 1);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315138;
      v18 = "-[WFSiriWorkflowRunnerClient performSiriRequest:completionHandler:]";
      _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_FAULT, "%s Siri delegate not present, attempting to punch out", (uint8_t *)&v17, 0xCu);
    }

    v14 = [WFSiriActionResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfSiriExecutionRequiresShortcutsJrError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFSiriActionResponse initWithError:](v14, "initWithError:", v15);

    v7[2](v7, v16);
  }

}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, WFDialogResponse *);
  NSObject *v5;
  WFDialogResponse *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, WFDialogResponse *))a4;
  getWFVoiceShortcutClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v7 = 136315138;
    v8 = "-[WFSiriWorkflowRunnerClient performDialogRequest:completionHandler:]";
    _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_FAULT, "%s Siri workflow runner client should not present, attempting to punch out", (uint8_t *)&v7, 0xCu);
  }

  v6 = -[WFDialogResponse initWithResponseCode:]([WFDialogResponse alloc], "initWithResponseCode:", 4);
  v4[2](v4, v6);

}

- (void)didStartActionWithIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "workflowRunnerClient:didStartActionWithIdentifier:", self, v9);

    }
  }

}

- (void)didFinishActionWithIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "workflowRunnerClient:didFinishActionWithIdentifier:", self, v9);

    }
  }

}

- (id)workflowRunSourceForSiriRunSource:(int64_t)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = CFSTR("siri-unknown");
  v5 = CFSTR("siri-unknown");
  if ((unint64_t)(a3 - 1) <= 3)
  {
    v4 = *off_1E5FC5790[a3 - 1];

  }
  return v4;
}

- (int64_t)deviceIdiomFromRunSource:(int64_t)a3
{
  int64_t result;

  switch(a3)
  {
    case 1:
      result = -[WFSiriWorkflowRunnerClient deviceIdiomForCurrentDevice](self, "deviceIdiomForCurrentDevice");
      break;
    case 2:
      result = 4;
      break;
    case 3:
      result = 5;
      break;
    case 4:
      result = 3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)deviceIdiomForCurrentDevice
{
  void *v2;
  unint64_t v3;

  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom");

  if (v3 > 3)
    return 0;
  else
    return qword_1AF780818[v3];
}

- (WFSiriExecutionMetrics)siriExecutionMetrics
{
  return self->_siriExecutionMetrics;
}

- (void)setSiriExecutionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_siriExecutionMetrics, a3);
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (WFPausedShortcutData)pausedData
{
  return self->_pausedData;
}

- (void)setPausedData:(id)a3
{
  objc_storeStrong((id *)&self->_pausedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedData, 0);
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_siriExecutionMetrics, 0);
}

@end
