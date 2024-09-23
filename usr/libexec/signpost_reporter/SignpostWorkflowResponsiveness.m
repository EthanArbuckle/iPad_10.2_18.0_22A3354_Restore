@implementation SignpostWorkflowResponsiveness

- (SignpostWorkflowResponsiveness)initWithWorkflowEventTracker:(id)a3
{
  id v5;
  SignpostWorkflowResponsiveness *v6;
  SignpostWorkflowResponsiveness *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SignpostWorkflowResponsiveness;
  v6 = -[SignpostWorkflowResponsiveness init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workflowEventTracker, a3);

  return v7;
}

+ (id)allWorkflows
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  SignpostWorkflowResponsiveness *v10;
  id v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WRWorkflow allWorkflows](WRWorkflow, "allWorkflows"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_msgSend(objc_alloc((Class)WRWorkflowEventTracker), "initForReadbackWithWorkflow:eventCompletionCallback:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), &stru_1000103C8);
          v10 = -[SignpostWorkflowResponsiveness initWithWorkflowEventTracker:]([SignpostWorkflowResponsiveness alloc], "initWithWorkflowEventTracker:", v9);
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v11 = objc_msgSend(v3, "copy");
    v2 = v13;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)workflowWithName:(id)a3
{
  void *v3;
  id v4;
  SignpostWorkflowResponsiveness *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WRWorkflow workflowWithName:](WRWorkflow, "workflowWithName:", a3));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)WRWorkflowEventTracker), "initForReadbackWithWorkflow:eventCompletionCallback:", v3, &stru_1000103E8);
    v5 = -[SignpostWorkflowResponsiveness initWithWorkflowEventTracker:]([SignpostWorkflowResponsiveness alloc], "initWithWorkflowEventTracker:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workflow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allowListForAllSignposts"));
  objc_msgSend(v4, "addAllowlist:", v6);

}

- (BOOL)signpostInAllowList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workflow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allowListForAllSignposts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));

  LOBYTE(v4) = objc_msgSend(v7, "passesSubsystem:category:", v8, v9);
  return (char)v4;
}

- (void)handleDeviceReboot
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  objc_msgSend(v2, "reset");

}

- (void)handleSignpostIntervalBegin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    objc_msgSend(v4, "handleSignpost:", v5);

  }
}

- (void)handleSignpostEmitEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    objc_msgSend(v4, "handleSignpost:", v5);

  }
}

- (void)handleSignpostInterval:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    objc_msgSend(v4, "handleSignpost:", v5);

  }
}

- (id)newConfiguredExtractor
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = objc_alloc_init((Class)SignpostSupportObjectExtractor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workflow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allowListForAllSignposts"));
  objc_msgSend(v3, "setSubsystemCategoryFilter:", v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000294C;
  v11[3] = &unk_100010410;
  v11[4] = self;
  objc_msgSend(v3, "setIntervalCompletionProcessingBlock:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000296C;
  v10[3] = &unk_100010438;
  v10[4] = self;
  objc_msgSend(v3, "setBeginEventProcessingBlock:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000298C;
  v9[3] = &unk_100010438;
  v9[4] = self;
  objc_msgSend(v3, "setEmitEventProcessingBlock:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000029AC;
  v8[3] = &unk_100010460;
  v8[4] = self;
  objc_msgSend(v3, "setDeviceRebootProcessingBlock:", v8);
  return v3;
}

- (WRWorkflowEventTracker)workflowEventTracker
{
  return self->_workflowEventTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowEventTracker, 0);
}

@end
