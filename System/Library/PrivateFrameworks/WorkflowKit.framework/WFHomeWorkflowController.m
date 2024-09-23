@implementation WFHomeWorkflowController

- (WFHomeWorkflowController)initWithWorkflow:(id)a3
{
  id v6;
  WFHomeWorkflowController *v7;
  WFHomeWorkflowController *v8;
  WFHomeWorkflowController *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeWorkflowController.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFHomeWorkflowController;
  v7 = -[WFHomeWorkflowController init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_workflow, a3);
    v9 = v8;
  }

  return v8;
}

- (WFHomeWorkflowController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not implemented"));

  return 0;
}

- (void)startWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  WFHomeWorkflowRunDescriptor *v5;
  void *v6;
  WFHomeWorkflowRunDescriptor *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = [WFHomeWorkflowRunDescriptor alloc];
  -[WFHomeWorkflowController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFHomeWorkflowRunDescriptor initWithHomeWorkflow:](v5, "initWithHomeWorkflow:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 3);
  objc_msgSend(v8, "setRunSource:", *MEMORY[0x1E0DC8460]);
  -[WFHomeWorkflowController workflowController](self, "workflowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v9, "runWorkflowWithDescriptor:request:error:", v7, v8, &v13);
  v11 = v13;

  if ((v10 & 1) != 0)
  {
    -[WFHomeWorkflowController setCompletionHandler:](self, "setCompletionHandler:", v4);
  }
  else
  {
    WFMakeHomeError(1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, v12, 0);

  }
}

- (void)cancel
{
  -[WFOutOfProcessWorkflowController stop](self->_workflowController, "stop");
}

- (BOOL)isRunning
{
  return -[WFOutOfProcessWorkflowController isRunning](self->_workflowController, "isRunning");
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v13, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFMakeHomeError(2, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v13, "isCancelled");
  -[WFHomeWorkflowController completionHandler](self, "completionHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v9, v10);

  if (v8)
  {

  }
  -[WFHomeWorkflowController setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (WFOutOfProcessWorkflowController)workflowController
{
  WFOutOfProcessWorkflowController *workflowController;
  WFOutOfProcessWorkflowController *v4;
  WFOutOfProcessWorkflowController *v5;

  workflowController = self->_workflowController;
  if (!workflowController)
  {
    v4 = (WFOutOfProcessWorkflowController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C18]), "initWithEnvironment:runningContext:presentationMode:", 1, 0, 0);
    v5 = self->_workflowController;
    self->_workflowController = v4;

    -[WFOutOfProcessWorkflowController setDelegate:](self->_workflowController, "setDelegate:", self);
    workflowController = self->_workflowController;
  }
  return workflowController;
}

- (WFHomeWorkflow)workflow
{
  return self->_workflow;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_workflowController, 0);
}

@end
