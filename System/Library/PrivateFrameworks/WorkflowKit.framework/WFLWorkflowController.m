@implementation WFLWorkflowController

- (WFLWorkflowController)initWithWorkflow:(id)a3
{
  id v4;
  WFLWorkflowController *v5;
  WFWorkflowController *v6;
  WFWorkflowController *controller;
  WFLWorkflowController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLWorkflowController;
  v5 = -[WFLWorkflowController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(WFWorkflowController);
    controller = v5->_controller;
    v5->_controller = v6;

    -[WFWorkflowController setWorkflow:](v5->_controller, "setWorkflow:", v4);
    -[WFWorkflowController setDelegate:](v5->_controller, "setDelegate:", v5);
    v8 = v5;
  }

  return v5;
}

- (BOOL)isRunning
{
  void *v2;
  char v3;

  -[WFLWorkflowController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (NSProgress)progress
{
  void *v2;
  void *v3;

  -[WFLWorkflowController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v3;
}

- (WFWorkflow)workflow
{
  void *v2;
  void *v3;

  -[WFLWorkflowController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFWorkflow *)v3;
}

- (void)runWithInput:(id)a3
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
  id v13;

  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInput:", v4);

  -[WFLWorkflowController runSource](self, "runSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRunSource:", v13);

  -[WFLWorkflowController workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logRunOfWorkflow:withSource:triggerID:", v10, v13, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController setRunEvent:](self, "setRunEvent:", v11);

  -[WFLWorkflowController controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "run");

}

- (id)runSource
{
  int64_t v2;
  id *v3;

  v2 = -[WFLWorkflowController executionContext](self, "executionContext");
  if ((unint64_t)(v2 - 1) > 9)
    v3 = (id *)MEMORY[0x1E0DC84D8];
  else
    v3 = (id *)qword_1E7AEBD50[v2 - 1];
  return *v3;
}

- (void)stop
{
  id v2;

  -[WFLWorkflowController controller](self, "controller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)launchAppWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  -[WFLWorkflowController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if ((v6 & 1) != 0)
  {
    -[WFLWorkflowController controller](self, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLWorkflowController workflow](self, "workflow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v8, "connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke;
      v24[3] = &unk_1E7AF8548;
      v24[4] = self;
      v25 = v4;
      objc_msgSend(v11, "launchAppInBackground:completionHandler:", 0, v24);

      v12 = v25;
    }
    else
    {
      -[WFLWorkflowController lastInteraction](self, "lastInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intentResponse");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userActivity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      INUserActivitySerializeToData();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      INUserActivityDeserializeFromData();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0D13E10]);
      -[WFLWorkflowController lastInteraction](self, "lastInteraction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v20 = (void *)objc_msgSend(v18, "initWithInteraction:userActivity:inBackground:error:", v19, v17, 0, &v23);
      v12 = v23;

      if (v12)
      {
        if (v4)
          (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v12);
      }
      else
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke_2;
        v21[3] = &unk_1E7AF8860;
        v22 = v4;
        objc_msgSend(v20, "performWithCompletionHandler:", v21);

      }
    }

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)workflowControllerWillRun:(id)a3
{
  id v4;

  -[WFLWorkflowController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "workflowControllerWillRun:", self);

}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v5 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[WFLWorkflowController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = 2;
  else
    v9 = 1;
  -[WFLWorkflowController workflow](self, "workflow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController runEvent](self, "runEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOutcome:forRunEvent:", v9, v12);

  -[WFLWorkflowController setRunEvent:](self, "setRunEvent:", 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v13;
  }
  if (v7)
  {
    objc_msgSend(v7, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFIntentExecutorIntentResponseErrorKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("WFLUnderlyingIntentResponse"));
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("WFIntentExecutorIntentResponseErrorKey"));
      v18 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v7, "code"), v17);
      v20 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "workflowControllerDidStop:withError:", self, v7);

  }
  else
  {
    -[WFLWorkflowController lastInteraction](self, "lastInteraction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "intentResponse");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[WFLWorkflowController lastInteraction](self, "lastInteraction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "intentResponse");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "workflowControllerDidFinishRunning:withOutput:", self, v7);
  }

}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(_QWORD))a6;
  -[WFLWorkflowController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "workflowController:willRunAction:withInput:proceedHandler:", self, v10, 0, v8);
  else
    v8[2](v8);

}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  -[WFLWorkflowController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "workflowController:didRunAction:", self, v7);

}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E0D14328];
}

- (void)showConfirmInteraction:(id)a3 requireAuthentication:(BOOL)a4 requireConfirmation:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[WFLWorkflowController setLastInteraction:](self, "setLastInteraction:", v10);
  -[WFLWorkflowController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "workflowController:userInterfaceForRunningAction:", self, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_opt_class();
    WFEnforceClass(v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v10, "intentResponse");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __108__WFLWorkflowController_showConfirmInteraction_requireAuthentication_requireConfirmation_completionHandler___block_invoke;
      v19[3] = &unk_1E7AF8F48;
      v20 = v11;
      objc_msgSend(v15, "handleIntentAction:requiresUserConfirmation:requiresUserAuthentication:withIntentResponse:proceedHandler:", v17, v7, v8, v18, v19);

    }
    else
    {
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }

}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "runSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = WFRemoteExecuteActionIfApplicable(v12, v11, self, self, v13, v10);

  return (char)self;
}

- (BOOL)isRunningWithSiriUI
{
  return 0;
}

- (BOOL)isRunningWithExternalUI
{
  return 0;
}

- (BOOL)isRunningWithToolKitClient
{
  return 0;
}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
  -[WFLWorkflowController showConfirmInteraction:requireAuthentication:requireConfirmation:completionHandler:](self, "showConfirmInteraction:requireAuthentication:requireConfirmation:completionHandler:", a3, a5, 1, a6);
}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a5;
  -[WFLWorkflowController setLastInteraction:](self, "setLastInteraction:", a3);
  v7[2](v7, 0);

}

- (BOOL)openInteractionInApp:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(void *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char);
  void *v17;
  id v18;
  id v19;

  v5 = a4;
  -[WFLWorkflowController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLWorkflowController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "workflowController:userInterfaceForRunningAction:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __64__WFLWorkflowController_openInteractionInApp_completionHandler___block_invoke;
  v17 = &unk_1E7AF6BB0;
  v10 = v5;
  v19 = v10;
  v11 = v8;
  v18 = v11;
  v12 = (void (**)(void *, uint64_t))_Block_copy(&v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "action:requiresContinuingInAppWithProceedHandler:", v11, v12, v14, v15, v16, v17);
  else
    v12[2](v12, 1);

  return 1;
}

- (BOOL)speakText:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  return 0;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (BOOL)openUserActivity:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = a5;
    objc_msgSend(v6, "userCancelledError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v8);

  }
  return 1;
}

- (BOOL)executeIntent:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)configureIntent:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_setExecutionContext:", -[WFLWorkflowController executionContext](self, "executionContext"));

}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = a7;
  getWFWorkflowExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v9 = 136315138;
    v10 = "-[WFLWorkflowController action:provideInputForParameters:withDefaultStates:prompts:completionHandler:]";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s provideInputForParameters should not be called", (uint8_t *)&v9, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 0;
}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (WFLWorkflowControllerDelegate)delegate
{
  return (WFLWorkflowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (void)setExecutionContext:(int64_t)a3
{
  self->_executionContext = a3;
}

- (WFWorkflowController)controller
{
  return self->_controller;
}

- (INInteraction)lastInteraction
{
  return self->_lastInteraction;
}

- (void)setLastInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_lastInteraction, a3);
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setRunEvent:(id)a3
{
  objc_storeStrong((id *)&self->_runEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong((id *)&self->_lastInteraction, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

void __64__WFLWorkflowController_openInteractionInApp_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_opt_class();
    WFEnforceClass(v3, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchAppInBackground:completionHandler:", 0, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __108__WFLWorkflowController_showConfirmInteraction_requireAuthentication_requireConfirmation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

uint64_t __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
