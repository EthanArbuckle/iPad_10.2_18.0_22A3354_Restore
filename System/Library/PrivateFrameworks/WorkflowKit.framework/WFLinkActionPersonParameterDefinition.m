@implementation WFLinkActionPersonParameterDefinition

- (WFLinkActionPersonParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionPersonParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D10];
  v5 = a3;
  objc_msgSend(v4, "personValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPersonParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeSpecificMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43B38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length")
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("contact")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("email")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("phone")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("emailOrPhone")) & 1) == 0)
  {
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("username"));
    getWFAppIntentsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v9)
      {
        v13 = 136315138;
        v14 = "-[WFLinkActionPersonParameterDefinition parameterClass]";
        v10 = "%s username parameterMode is not implemented yet.";
        v11 = v8;
        v12 = 12;
LABEL_12:
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v13, v12);
      }
    }
    else if (v9)
    {
      v13 = 136315394;
      v14 = "-[WFLinkActionPersonParameterDefinition parameterClass]";
      v15 = 2112;
      v16 = v4;
      v10 = "%s Unhandled parameterMode %@ for Person parameter definition.";
      v11 = v8;
      v12 = 22;
      goto LABEL_12;
    }

  }
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;

    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parameterState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v18 = 0;
    goto LABEL_22;
  }
  v9 = v15;

LABEL_10:
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      objc_msgSend(v9, "contact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "INPersonRepresentation");
      v17 = objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    case 1:
      v26 = objc_alloc(MEMORY[0x1E0CBDA60]);
      objc_msgSend(v9, "phoneNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v26;
      v23 = v21;
      v24 = 2;
      goto LABEL_19;
    case 2:
      v19 = objc_alloc(MEMORY[0x1E0CBDA60]);
      objc_msgSend(v9, "emailAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "address");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v23 = v21;
      v24 = 1;
LABEL_19:
      v27 = (void *)objc_msgSend(v22, "initWithValue:type:", v23, v24);

      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v27, 0, 0, 0, 0, 0);
      goto LABEL_20;
    case 3:
      getWFAppIntentsLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v29 = 136315138;
        v30 = "-[WFLinkActionPersonParameterDefinition linkValueFromParameterState:action:]";
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_FAULT, "%s Custom handles are not supported", (uint8_t *)&v29, 0xCu);
      }
      v18 = 0;
      goto LABEL_21;
    case 4:
      getWFAppIntentsLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        v29 = 136315138;
        v30 = "-[WFLinkActionPersonParameterDefinition linkValueFromParameterState:action:]";
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s Message groups are not supported", (uint8_t *)&v29, 0xCu);
      }

      goto LABEL_17;
    default:
LABEL_17:
      v17 = 0;
LABEL_20:
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      break;
  }
LABEL_22:

  return v18;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v11 = a7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __153__WFLinkActionPersonParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
  v13[3] = &unk_1E7AF8790;
  v13[4] = self;
  v14 = v11;
  v12 = v11;
  -[WFLinkActionPersonParameterDefinition getPeopleFromProcessedParameterValue:parameterState:permissionRequestor:completionHandler:](self, "getPeopleFromProcessedParameterValue:parameterState:permissionRequestor:completionHandler:", a3, a4, a5, v13);

}

- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke;
  v12[3] = &unk_1E7AF8790;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[WFLinkActionPersonParameterDefinition getPeopleFromProcessedParameterValue:parameterState:permissionRequestor:completionHandler:](self, "getPeopleFromProcessedParameterValue:parameterState:permissionRequestor:completionHandler:", a3, a4, a5, v12);

}

- (void)getPeopleFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  char isKindOfClass;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v13 = v8;
    else
      v13 = 0;
    v14 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x1E0D14060]);
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v8);
      v28[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v15, "initWithEntries:", v17);

    }
    else
    {
      v16 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v16;
      else
        v19 = 0;
      v18 = v19;
    }

    if (v18)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __131__WFLinkActionPersonParameterDefinition_getPeopleFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke;
      v22[3] = &unk_1E7AEE488;
      v23 = v11;
      objc_msgSend(v18, "getRecipientsWithPermissionRequestor:completionHandler:", v9, v22);

    }
    else
    {
      getWFActionsLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFLinkActionPersonParameterDefinition getPeopleFromProcessedParameterValue:parameterState:permissionRequ"
              "estor:completionHandler:]";
        v26 = 2112;
        v27 = (id)objc_opt_class();
        v21 = v27;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Expected WFProcessedContacts as processed parameter type for Person, but got %@ instead", buf, 0x16u);

      }
      v11[2](v11, 0, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  WFContactSubstitutableState *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_17515);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFMultipleValueParameterState initWithParameterStates:]([WFContactSubstitutableState alloc], "initWithParameterStates:", v6);
    -[WFContactSubstitutableState serializedRepresentation](v7, "serializedRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  WFContactSubstitutableState *v14;
  void *v15;
  void *v16;
  WFContactSubstitutableState *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D13E68], "cnContactWithINPerson:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v15);
      v17 = [WFContactSubstitutableState alloc];
      v20[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[WFMultipleValueParameterState initWithParameterStates:](v17, "initWithParameterStates:", v18);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __107__WFLinkActionPersonParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValues___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D13E68], "cnContactWithINPerson:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v5 = 0;
        goto LABEL_8;
      }
      v4 = (void *)v3;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v3);
    }
    else
    {
      v5 = 0;
      v4 = v2;
      v2 = 0;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }

LABEL_8:
  return v5;
}

uint64_t __131__WFLinkActionPersonParameterDefinition_getPeopleFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke_129;
    v8[3] = &unk_1E7AEE460;
    v8[4] = *(_QWORD *)(a1 + 32);
    v5 = a3;
    objc_msgSend(a2, "if_map:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v6 = a3;
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFLinkActionPersonParameterDefinition getLinkArrayValuesFromProcessedParameterValue:parameterState:permiss"
            "ionRequestor:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not make INPerson from processedContacts.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __140__WFLinkActionPersonParameterDefinition_getLinkArrayValuesFromProcessedParameterValue_parameterState_permissionRequestor_completionHandler___block_invoke_129(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D43E38];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithValue:valueType:", v4, v6);

  return v7;
}

void __153__WFLinkActionPersonParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_alloc(MEMORY[0x1E0D43E38]);
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithValue:valueType:", v9, v10);
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);

  }
  else
  {
    getWFAppIntentsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[WFLinkActionPersonParameterDefinition getLinkValueFromProcessedParameterValue:parameterState:permissionReq"
            "uestor:runningFromToolKit:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Could not make INPerson from processedContacts.", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
