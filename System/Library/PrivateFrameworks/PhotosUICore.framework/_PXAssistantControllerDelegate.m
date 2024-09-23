@implementation _PXAssistantControllerDelegate

- (_PXAssistantControllerDelegate)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantUtilities.m"), 27, CFSTR("%s is not available as initializer"), "-[_PXAssistantControllerDelegate init]");

  abort();
}

- (_PXAssistantControllerDelegate)initWithAssistantController:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _PXAssistantControllerDelegate *v11;
  _PXAssistantControllerDelegate *v12;
  void *v13;
  id completionHandler;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantUtilities.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assistantController"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantUtilities.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)_PXAssistantControllerDelegate;
  v11 = -[_PXAssistantControllerDelegate init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assistantController, a3);
    -[PXAssistantController setDelegate:](v12->_assistantController, "setDelegate:", v12);
    v13 = _Block_copy(v10);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = v13;

  }
  return v12;
}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
}

@end
