@implementation WFWorkflowDatabaseRunDescriptor

- (WFWorkflowDatabaseRunDescriptor)initWithName:(id)a3
{
  id v5;
  WFWorkflowDatabaseRunDescriptor *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v6 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:name:](self, "initWithIdentifier:name:", 0, v5);

  return v6;
}

- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3
{
  id v5;
  WFWorkflowDatabaseRunDescriptor *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v6 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:name:](self, "initWithIdentifier:name:", v5, 0);

  return v6;
}

- (WFWorkflowDatabaseRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  WFWorkflowDatabaseRunDescriptor *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *name;
  WFWorkflowDatabaseRunDescriptor *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowDatabaseRunDescriptor;
  v8 = -[WFWorkflowDatabaseRunDescriptor init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFWorkflowDatabaseRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFWorkflowDatabaseRunDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:name:](self, "initWithIdentifier:name:", v5, v6);
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowDatabaseRunDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowDatabaseRunDescriptor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, name: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFWorkflowDatabaseRunDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFWorkflowDatabaseRunDescriptor name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

- (id)kind
{
  return CFSTR("WorkflowInDatabase");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
