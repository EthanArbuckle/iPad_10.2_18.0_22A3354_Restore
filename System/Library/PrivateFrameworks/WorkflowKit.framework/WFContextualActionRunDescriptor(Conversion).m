@implementation WFContextualActionRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a5;
  objc_msgSend(a1, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "files");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") != 0;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__WFContextualActionRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke;
  v15[3] = &unk_1E7AF9478;
  v18 = v7;
  v19 = a3;
  v16 = v9;
  v17 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v7;
  objc_msgSend(v13, "getActionRepresentationTakingInput:context:completionHandler:", v11, v12, v15);

}

@end
