@implementation WFWorkflowDataRunDescriptor

- (WFWorkflowDataRunDescriptor)initWithWorkflowData:(id)a3
{
  id v5;
  WFWorkflowDataRunDescriptor *v6;
  uint64_t v7;
  NSData *workflowData;
  WFWorkflowDataRunDescriptor *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowData"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowDataRunDescriptor;
  v6 = -[WFWorkflowDataRunDescriptor init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    workflowData = v6->_workflowData;
    v6->_workflowData = (NSData *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFWorkflowDataRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFWorkflowDataRunDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFWorkflowDataRunDescriptor initWithWorkflowData:](self, "initWithWorkflowData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowDataRunDescriptor workflowData](self, "workflowData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, data: %lu bytes>"), v5, self, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowDataRunDescriptor workflowData](self, "workflowData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("workflowData"));

}

- (id)kind
{
  return CFSTR("WorkflowFromData");
}

- (NSData)workflowData
{
  return self->_workflowData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
