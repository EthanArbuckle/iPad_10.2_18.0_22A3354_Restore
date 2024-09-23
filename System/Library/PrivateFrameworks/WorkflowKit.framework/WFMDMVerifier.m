@implementation WFMDMVerifier

- (WFMDMVerifier)initWithContentAttributionSets:(id)a3 actionName:(id)a4
{
  id v7;
  id v8;
  WFMDMVerifier *v9;
  uint64_t v10;
  NSArray *contentAttributionSets;
  uint64_t v12;
  NSString *actionName;
  WFMDMVerifier *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMDMVerifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentAttributionSets"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFMDMVerifier;
  v9 = -[WFMDMVerifier init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    contentAttributionSets = v9->_contentAttributionSets;
    v9->_contentAttributionSets = (NSArray *)v10;

    v12 = objc_msgSend(v8, "copy");
    actionName = v9->_actionName;
    v9->_actionName = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (WFMDMVerifier)initWithAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  WFMDMVerifier *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__WFMDMVerifier_initWithAction___block_invoke;
  v11[3] = &unk_1E7AF6D18;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_flatMap:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFMDMVerifier initWithContentAttributionSets:actionName:](self, "initWithContentAttributionSets:actionName:", v7, v8);

  return v9;
}

- (BOOL)canSendDataToContentDestination:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "managedLevel");
  if (v7)
  {
    v8 = v7;
    if (v7 == 3)
    {
      getWFWorkflowExecutionLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[WFMDMVerifier canSendDataToContentDestination:error:]";
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s The content destination of an action should never be mixed", buf, 0xCu);
      }
      v10 = 0;
    }
    else
    {
      -[WFMDMVerifier contentAttributionSets](self, "contentAttributionSets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__WFMDMVerifier_canSendDataToContentDestination_error___block_invoke;
      v14[3] = &__block_descriptor_40_e33_B16__0__WFContentAttributionSet_8l;
      v14[4] = v8;
      objc_msgSend(v11, "if_objectsPassingTest:", v14);
      v9 = objc_claimAutoreleasedReturnValue();

      v12 = -[NSObject count](v9, "count");
      v10 = v12 == 0;
      if (a4 && v12)
      {
        -[WFMDMVerifier errorFromFailedVerificationContentAttributionSets:contentDestination:destinationManagedLevel:](self, "errorFromFailedVerificationContentAttributionSets:contentDestination:destinationManagedLevel:", v9, v6, v8);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)errorFromFailedVerificationContentAttributionSets:(id)a3 contentDestination:(id)a4 destinationManagedLevel:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v8, "managedLevel") == 2)
      v9 = 1;
    else
      v9 = 2;
    +[WFMDMVerifier contentAttributionsFromContentAttributionSets:withManagedLevel:](WFMDMVerifier, "contentAttributionsFromContentAttributionSets:withManagedLevel:", v7, v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sortedArrayUsingComparator:", &__block_literal_global_54990);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99E40]);
    v32 = v10;
    objc_msgSend(v10, "if_compactMap:", &__block_literal_global_123_54992);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

    objc_msgSend(v8, "localizedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "count");
    v16 = (void *)MEMORY[0x1E0CB3940];
    if (v15)
      v17 = v14 == 0;
    else
      v17 = 1;
    if (v17)
    {
      if (v14)
      {
        WFLocalizedString(CFSTR("Your administrator doesn’t allow sending data to %@."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v19, v14, 0);
      }
      else
      {
        WFLocalizedString(CFSTR("Your administrator doesn’t allow sending data to this action."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v19, 0, 0);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WFLocalizedString(CFSTR("Your administrator doesn’t allow sending data from %1$@ to %2$@."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3738];
      objc_msgSend(v13, "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringByJoiningStrings:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v19, v22, v14, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[WFMDMVerifier actionName](self, "actionName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Couldn’t Run “%@”"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v26, v24, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("Couldn’t Run Action"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v34[0] = *MEMORY[0x1E0CB2D68];
    v34[1] = v29;
    v35[0] = v27;
    v35[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 8, v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSArray)contentAttributionSets
{
  return self->_contentAttributionSets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAttributionSets, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

id __110__WFMDMVerifier_errorFromFailedVerificationContentAttributionSets_contentDestination_destinationManagedLevel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedMDMDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __110__WFMDMVerifier_errorFromFailedVerificationContentAttributionSets_contentDestination_destinationManagedLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class())
  {
    objc_msgSend(v5, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();

    if (v8)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v9 = 1;
  else
    v9 = -1;
LABEL_8:

  return v9;
}

uint64_t __55__WFMDMVerifier_canSendDataToContentDestination_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAllowedToBeSentToDestinationWithManagedLevel:", *(_QWORD *)(a1 + 32)) ^ 1;
}

id __32__WFMDMVerifier_initWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterStateForKey:fallingBackToDefaultValue:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containedVariables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __32__WFMDMVerifier_initWithAction___block_invoke_2;
  v14[3] = &unk_1E7AF6CF0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v6, "if_compactMap:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentAttributionTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributionSetForParameter:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayByAddingObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v10;

  return v12;
}

id __32__WFMDMVerifier_initWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "variableSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFPreferredVariableNameForVariable(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentForVariableWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentAttributionsFromContentAttributionSets:(id)a3 withManagedLevel:(unint64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e42___NSArray_16__0__WFContentAttributionSet_8l;
  v5[4] = a4;
  objc_msgSend(a3, "if_flatMap:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a2, "attributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke_2;
  v6[3] = &__block_descriptor_40_e30_B16__0__WFContentAttribution_8l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "if_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __80__WFMDMVerifier_contentAttributionsFromContentAttributionSets_withManagedLevel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "managedLevel") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end
