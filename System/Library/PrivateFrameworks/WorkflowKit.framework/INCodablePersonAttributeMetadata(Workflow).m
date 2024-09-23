@implementation INCodablePersonAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (id)wf_parameterClass
{
  void *v1;

  if ((unint64_t)objc_msgSend(a1, "type") > 3)
  {
    v1 = 0;
  }
  else
  {
    objc_opt_class();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  WFEmailAddressSubstitutableState *v20;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  id v25;
  char IsAuthorizedToAccessContact;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
LABEL_17:
      v22.receiver = a1;
      v22.super_class = (Class)&off_1EF78A388;
      objc_msgSendSuper2(&v22, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(v6, "if_compactMap:", &__block_literal_global_58004);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (!v8)
    goto LABEL_17;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v10 = (void *)getCNContactStoreClass_softClass_58005;
  v31 = getCNContactStoreClass_softClass_58005;
  v11 = MEMORY[0x1E0C809B0];
  if (!getCNContactStoreClass_softClass_58005)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getCNContactStoreClass_block_invoke_58006;
    v27[3] = &unk_1E7AF9520;
    v27[4] = &v28;
    __getCNContactStoreClass_block_invoke_58006((uint64_t)v27);
    v10 = (void *)v29[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v28, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(MEMORY[0x1E0D13E30], "requiredKeysToFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_2;
  v23[3] = &unk_1E7AF7A38;
  IsAuthorizedToAccessContact = WFCNContactIsAuthorizedToAccessContact();
  v15 = v13;
  v24 = v15;
  v16 = v14;
  v25 = v16;
  objc_msgSend(v9, "if_map:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 0;
  switch(objc_msgSend(a1, "type"))
  {
    case 0:
      v20 = -[WFMultipleValueParameterState initWithParameterStates:]([WFContactSubstitutableState alloc], "initWithParameterStates:", v17);
      goto LABEL_15;
    case 1:
      v20 = -[WFMultipleValueParameterState initWithParameterStates:]([WFEmailAddressSubstitutableState alloc], "initWithParameterStates:", v17);
      goto LABEL_15;
    case 2:
      v20 = -[WFMultipleValueParameterState initWithParameterStates:]([WFPhoneNumberSubstitutableState alloc], "initWithParameterStates:", v17);
      goto LABEL_15;
    case 3:
      v20 = -[WFMultipleValueParameterState initWithParameterStates:]([WFContactHandleSubstitutableState alloc], "initWithParameterStates:", v17);
LABEL_15:
      v18 = v20;
      v19 = 0;
      break;
    case 4:
      break;
    default:
      v19 = 1;
      break;
  }

  if (v19)
    goto LABEL_17;
LABEL_18:

  return v18;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(MEMORY[0x1E0D13E68], "cnContactWithINPerson:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "itemWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EF78A388;
    objc_msgSendSuper2(&v10, sel_wf_contentItemForValue_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

@end
