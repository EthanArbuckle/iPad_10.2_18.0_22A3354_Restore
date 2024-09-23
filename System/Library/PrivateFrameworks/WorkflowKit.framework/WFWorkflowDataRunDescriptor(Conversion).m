@implementation WFWorkflowDataRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  void (**v7)(id, WFWorkflow *, id);
  WFWorkflowFile *v8;
  void *v9;
  WFWorkflowFile *v10;
  id v11;
  void *v12;
  id v13;
  WFWorkflow *v14;
  WFWorkflow *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a5;
  v8 = [WFWorkflowFile alloc];
  objc_msgSend(a1, "workflowData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = -[WFWorkflowFile initWithFileData:name:error:](v8, "initWithFileData:name:error:", v9, 0, &v19);
  v11 = v19;

  if (v10)
  {
    v18 = v11;
    -[WFWorkflowFile recordRepresentationWithError:](v10, "recordRepresentationWithError:", &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (v12)
    {
      v17 = v13;
      v14 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v12, 0, 0, 1, a3, &v17);
      v11 = v17;

      if (v14)
      {
        v15 = v14;
        v16 = 0;
      }
      else
      {
        v15 = 0;
        v16 = v11;
      }
      v7[2](v7, v15, v16);

    }
    else
    {
      v7[2](v7, 0, v13);
      v11 = v13;
    }

  }
  else
  {
    v7[2](v7, 0, v11);
  }

}

@end
