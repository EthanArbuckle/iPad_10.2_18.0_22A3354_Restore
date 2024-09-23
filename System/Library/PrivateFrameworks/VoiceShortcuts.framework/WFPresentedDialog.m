@implementation WFPresentedDialog

- (WFPresentedDialog)initWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFPresentedDialog *v14;
  WFPresentedDialog *v15;
  uint64_t v16;
  id completionHandler;
  WFPresentedDialog *v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFPresentedDialog;
  v14 = -[WFPresentedDialog init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_presentationMode = a4;
    objc_storeStrong((id *)&v15->_context, a5);
    v16 = objc_msgSend(v13, "copy");
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = (id)v16;

    v18 = v15;
  }

  return v15;
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (WFDialogResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
