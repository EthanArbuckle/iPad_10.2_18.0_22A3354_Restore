@implementation WFWorkflowEnvironmentResource

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
  -[WFResource invalidateAvailability](self, "invalidateAvailability");
}

- (BOOL)workflowEnvironmentIsValid
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;

  -[WFWorkflowEnvironmentResource workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowEnvironmentResource workflow](self, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "environment");

    -[WFResource definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("WFWorkflowEnvironment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Default")) & 1) != 0)
      {
        v10 = 0;
LABEL_8:
        -[WFResource definition](self, "definition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("WFRelation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        WFEnforceClass(v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("!="));
          if (v5 == v10)
            v11 = 0;
          else
            v11 = v16;
        }
        else
        {
          v11 = v5 == v10;
        }

        goto LABEL_15;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("HomeResident")))
      {
        v10 = 1;
        goto LABEL_8;
      }
    }
    v11 = 0;
LABEL_15:

    return v11;
  }
  return 0;
}

- (void)refreshAvailability
{
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", -[WFWorkflowEnvironmentResource workflowEnvironmentIsValid](self, "workflowEnvironmentIsValid"), 0);
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workflow);
}

@end
