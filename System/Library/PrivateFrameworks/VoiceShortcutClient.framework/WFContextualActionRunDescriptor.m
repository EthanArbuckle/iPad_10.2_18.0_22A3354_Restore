@implementation WFContextualActionRunDescriptor

- (WFContextualActionRunDescriptor)initWithAction:(id)a3 context:(id)a4
{
  id v8;
  id v9;
  WFContextualActionRunDescriptor *v10;
  WFContextualActionRunDescriptor *v11;
  WFContextualActionRunDescriptor *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFContextualActionRunDescriptor;
  v10 = -[WFContextualActionRunDescriptor init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_action, a3);
    objc_storeStrong((id *)&v11->_context, a4);
    v12 = v11;
  }

  return v11;
}

- (WFContextualActionRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  WFContextualActionRunDescriptor *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[WFContextualActionRunDescriptor initWithAction:context:](self, "initWithAction:context:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFContextualActionRunDescriptor action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[WFContextualActionRunDescriptor context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("context"));

}

- (id)kind
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[WFContextualActionRunDescriptor action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowRunKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContextualActionRunDescriptor action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workflowRunKind");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("ContextualAction");
  }
  return v6;
}

- (WFContextualAction)action
{
  return self->_action;
}

- (WFContextualActionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
