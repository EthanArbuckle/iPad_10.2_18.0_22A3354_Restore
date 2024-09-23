@implementation WFSmartPromptDialogResponse

- (WFSmartPromptDialogResponse)initWithResult:(unint64_t)a3 promptedStatesData:(id)a4
{
  id v6;
  WFSmartPromptDialogResponse *v7;
  uint64_t v8;
  NSArray *promptedStatesData;
  WFSmartPromptDialogResponse *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFSmartPromptDialogResponse;
  v7 = -[WFRequestAuthorizationDialogResponse initWithResult:cancelled:](&v12, sel_initWithResult_cancelled_, a3, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    promptedStatesData = v7->_promptedStatesData;
    v7->_promptedStatesData = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (WFSmartPromptDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFSmartPromptDialogResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *promptedStatesData;
  WFSmartPromptDialogResponse *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSmartPromptDialogResponse;
  v5 = -[WFRequestAuthorizationDialogResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("promptedStatesData"));
    v9 = objc_claimAutoreleasedReturnValue();
    promptedStatesData = v5->_promptedStatesData;
    v5->_promptedStatesData = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSmartPromptDialogResponse;
  v4 = a3;
  -[WFRequestAuthorizationDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSmartPromptDialogResponse promptedStatesData](self, "promptedStatesData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("promptedStatesData"));

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSmartPromptDialogResponse;
  v4 = a3;
  -[WFRequestAuthorizationDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFSmartPromptDialogResponse promptedStatesData](self, "promptedStatesData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("promptedStatesData"));

}

- (WFSmartPromptDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFSmartPromptDialogResponse *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *promptedStatesData;
  WFSmartPromptDialogResponse *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFSmartPromptDialogResponse;
  v5 = -[WFRequestAuthorizationDialogResponse initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("promptedStatesData"));
    v7 = objc_claimAutoreleasedReturnValue();
    promptedStatesData = v5->_promptedStatesData;
    v5->_promptedStatesData = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSArray)promptedStatesData
{
  return self->_promptedStatesData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptedStatesData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (id)updatedStatusFromResultCode:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("Allow");
  else
    return CFSTR("Undefined");
}

+ (id)prepareSmartPromptsDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  objc_msgSend(v8, "actionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updatedStatusFromResultCode:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__52572;
  v26 = __Block_byref_object_dispose__52573;
  v27 = 0;
  objc_msgSend(v8, "smartPromptStates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__WFSmartPromptDialogResponse_prepareSmartPromptsDatabaseDataFromConfiguration_resultCode_error___block_invoke;
  v18[3] = &unk_1E7AF63F8;
  v12 = v10;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v21 = &v22;
  objc_msgSend(v11, "if_compactMap:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)v23[5];
  if (v15)
  {
    v16 = 0;
    *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    v16 = v14;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

+ (id)prepareDeletionAuthorizationDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(a1, "updatedStatusFromResultCode:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deletionAuthorizationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stateWithStatus:count:", v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseDataWithError:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __97__WFSmartPromptDialogResponse_prepareSmartPromptsDatabaseDataFromConfiguration_resultCode_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id obj;

  objc_msgSend(a2, "stateWithStatus:actionUUID:", a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "databaseDataWithError:", &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

@end
