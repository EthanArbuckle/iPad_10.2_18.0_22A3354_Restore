@implementation NSUserActivity(WorkflowViewing)

- (id)wf_referenceInDatabase:()WorkflowViewing
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(a1, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("is.workflow.my.app.viewworkflow"));

  if (v6)
  {
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("workflowID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("workflowName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    if (!objc_msgSend(v11, "length")
      || (objc_msgSend(v4, "referenceForWorkflowID:", v11), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(v4, "uniqueVisibleReferenceForWorkflowName:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
