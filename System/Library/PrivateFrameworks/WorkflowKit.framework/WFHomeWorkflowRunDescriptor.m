@implementation WFHomeWorkflowRunDescriptor

- (WFHomeWorkflowRunDescriptor)initWithHomeWorkflow:(id)a3
{
  id v5;
  WFHomeWorkflowRunDescriptor *v6;
  WFHomeWorkflowRunDescriptor *v7;
  WFHomeWorkflowRunDescriptor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFHomeWorkflowRunDescriptor;
  v6 = -[WFHomeWorkflowRunDescriptor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_homeWorkflow, a3);
    v8 = v7;
  }

  return v7;
}

- (WFHomeWorkflowRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFHomeWorkflowRunDescriptor *v5;
  void *v6;
  WFHomeWorkflow *v7;
  WFHomeWorkflow *homeWorkflow;
  WFHomeWorkflowRunDescriptor *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFHomeWorkflowRunDescriptor;
  v5 = -[WFHomeWorkflowRunDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeWorkflow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFHomeWorkflow initWithData:]([WFHomeWorkflow alloc], "initWithData:", v6);
    homeWorkflow = v5->_homeWorkflow;
    v5->_homeWorkflow = v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHomeWorkflowRunDescriptor;
  v4 = a3;
  -[WFHomeWorkflowRunDescriptor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFHomeWorkflowRunDescriptor homeWorkflow](self, "homeWorkflow", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("homeWorkflow"));

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
  -[WFHomeWorkflowRunDescriptor homeWorkflow](self, "homeWorkflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFHomeWorkflow)homeWorkflow
{
  return self->_homeWorkflow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeWorkflow, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)createWorkflowWithEnvironment:(int64_t)a3 database:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, WFWorkflow *, id);
  WFWorkflowFile *v8;
  void *v9;
  void *v10;
  WFWorkflowFile *v11;
  id v12;
  void *v13;
  id v14;
  WFWorkflow *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = (void (**)(id, WFWorkflow *, id))a5;
  v8 = [WFWorkflowFile alloc];
  -[WFHomeWorkflowRunDescriptor homeWorkflow](self, "homeWorkflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = -[WFWorkflowFile initWithFileData:name:error:](v8, "initWithFileData:name:error:", v10, 0, &v19);
  v12 = v19;

  if (v11)
  {
    v18 = v12;
    -[WFWorkflowFile recordRepresentationWithError:](v11, "recordRepresentationWithError:", &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;

    if (v13)
    {
      v17 = v14;
      v15 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v13, 0, 0, 1, a3, &v17);
      v16 = v17;

      v7[2](v7, v15, v16);
      v14 = v16;
    }
    else
    {
      v7[2](v7, 0, v14);
    }

    v12 = v14;
  }
  else
  {
    v7[2](v7, 0, v12);
  }

}

- (id)workflowFileDataWithDatabase:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[WFHomeWorkflowRunDescriptor homeWorkflow](self, "homeWorkflow", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
