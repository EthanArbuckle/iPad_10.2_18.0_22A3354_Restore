@implementation WFHandoffRunDescriptor

- (WFHandoffRunDescriptor)initWithContext:(id)a3
{
  id v6;
  WFHandoffRunDescriptor *v7;
  WFHandoffRunDescriptor *v8;
  WFHandoffRunDescriptor *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHandoffRunDescriptor.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFHandoffRunDescriptor;
  v7 = -[WFHandoffRunDescriptor init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    v9 = v8;
  }

  return v8;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
