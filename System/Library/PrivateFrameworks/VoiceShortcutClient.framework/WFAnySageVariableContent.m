@implementation WFAnySageVariableContent

- (WFAnySageVariableContent)initWithVariableContent:(id)a3
{
  id v6;
  WFAnySageVariableContent *v7;
  WFAnySageVariableContent *v8;
  WFAnySageVariableContent *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variableContent"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnySageVariableContent;
  v7 = -[WFAnySageVariableContent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variableContent, a3);
    v9 = v8;
  }

  return v8;
}

- (WFAnySageVariableContent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFAnySageVariableContent *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("variableContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[WFAnySageVariableContent initWithVariableContent:](self, "initWithVariableContent:", v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAnySageVariableContent variableContent](self, "variableContent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("variableContent"));

}

- (WFSageVariableContent)variableContent
{
  return self->_variableContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableContent, 0);
}

+ (id)objectWithVariableContent:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVariableContent:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
