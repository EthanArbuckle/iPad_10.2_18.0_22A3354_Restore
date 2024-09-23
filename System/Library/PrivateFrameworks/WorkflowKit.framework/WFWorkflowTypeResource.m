@implementation WFWorkflowTypeResource

- (void)setWorkflow:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFWorkflowTypeResource workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("workflowTypes"), 0);

  objc_storeWeak((id *)&self->_workflow, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("workflowTypes"), 0, 0);

  -[WFResource invalidateAvailability](self, "invalidateAvailability");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFWorkflowTypeResource workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("workflowTypes"), 0);

  v4.receiver = self;
  v4.super_class = (Class)WFWorkflowTypeResource;
  -[WFResource dealloc](&v4, sel_dealloc);
}

- (BOOL)workflowTypesAreValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  -[WFWorkflowTypeResource workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFResource definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFWorkflowTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D20];
    -[WFResource definition](self, "definition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("WFWorkflowType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObjects:", v11, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[WFWorkflowTypeResource workflow](self, "workflow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isSubsetOfSet:", v14);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)refreshAvailability
{
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", -[WFWorkflowTypeResource workflowTypesAreValid](self, "workflowTypesAreValid"), 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("workflowTypes"), a4, a5, a6))
    -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workflow);
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end
