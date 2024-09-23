@implementation INCodableEnumAttribute(Workflow)

- (id)wf_objectClass
{
  void *v1;
  unint64_t v2;
  void *v3;

  objc_msgSend(a1, "codableEnum");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "type");

  if (v2 > 1)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)wf_outputDisplayNameWithLocalizer:()Workflow
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "codableEnum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDisplayNameWithLocalizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wf_parameterClass
{
  void *v1;

  objc_msgSend(a1, "codableEnum");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "type");

  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  void *v69;
  _BYTE v70[128];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];
  _QWORD v74[5];

  v74[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v65.receiver = a1;
  v65.super_class = (Class)&off_1EF773638;
  objc_msgSendSuper2(&v65, sel_wf_updatedParameterDefinition_parameterClass_localizer_, a3, a4, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "supportsDynamicEnumeration"))
  {
    v9 = v9;
    v10 = v9;
  }
  else
  {
    objc_msgSend(a1, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "defaultValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a4, "isEqual:", objc_opt_class()))
    {
      v73[0] = CFSTR("DefaultValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "index") == 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v55;
      v73[1] = CFSTR("OnDisplayName");
      objc_msgSend(a1, "codableEnum");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "values");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "if_firstObjectPassingTest:", &__block_literal_global_11980);
      v59 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedDisplayNameWithLocalizer:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v16;
      v73[2] = CFSTR("OffDisplayName");
      objc_msgSend(a1, "codableEnum");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "values");
      v57 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "if_firstObjectPassingTest:", &__block_literal_global_108);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDisplayNameWithLocalizer:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v57;
      v14 = v59;

    }
    else
    {
      if (objc_msgSend(a4, "isEqual:", objc_opt_class()))
      {
        v58 = v13;
        v60 = v14;
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", CFSTR("Variable"), CFSTR("ExtensionInput"), CFSTR("ActionOutput"), CFSTR("CurrentDate"), CFSTR("Clipboard"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("DisallowedVariableTypes"));
        v23 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)v23;
        if (v23)
        {
          objc_msgSend(v22, "orderedSetByAddingObjectsFromArray:", v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v24;
        }
        v71[0] = CFSTR("DisallowedVariableTypes");
        v56 = v22;
        objc_msgSend(v22, "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v71[1] = CFSTR("EnumAttribute");
        v72[0] = v25;
        v72[1] = a1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v26);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)objc_opt_new();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(a1, "codableEnum");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "values");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v62 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              if (objc_msgSend(v34, "index"))
              {
                objc_msgSend(v34, "localizedName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v35;
                if (v35)
                {
                  v37 = v35;
                }
                else
                {
                  objc_msgSend(v34, "localizedDisplayNameWithLocalizer:", v8);
                  v37 = (id)objc_claimAutoreleasedReturnValue();
                }
                v38 = v37;

                objc_msgSend(v34, "name");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, v39);

              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          }
          while (v31);
        }

        v68 = CFSTR("EnumNamesToLabel");
        v69 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "definitionByAddingEntriesInDictionary:", v40);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        v14 = v60;
        if (v60)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("IntentEnumOverrides"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_opt_class();
          WFEnforceClass(v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = CFSTR("DefaultValue");
          objc_msgSend(v43, "objectForKeyedSubscript:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v45;
          if (v45)
            v47 = v45;
          else
            v47 = (uint64_t)v44;
          v67 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v48);
          v49 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v49;
          v14 = v60;
        }
        v13 = v58;

      }
      v9 = v9;
      v10 = v9;
    }

  }
  return v10;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "codableEnum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type");

  if (v15 == 1)
  {
    v16 = objc_opt_class();
    WFEnforceClass(v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "BOOLValue"))
      v18 = &unk_1E7B8B218;
    else
      v18 = &unk_1E7B8B230;
    v13[2](v13, v18, 0);

  }
  else
  {
    objc_msgSend(a1, "codableEnum");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "type");

    if (!v20)
    {
      v21 = objc_opt_class();
      WFEnforceClass(v11, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      WFEnforceClass(v10, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keysToEnumNames");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v24);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
        v28 = (void *)v26;
      else
        v28 = v24;
      v29 = v28;

      if (v29)
      {
        objc_msgSend(a1, "valueWithName:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "index"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v31, 0);

        goto LABEL_13;
      }

    }
    v32.receiver = a1;
    v32.super_class = (Class)&off_1EF773638;
    objc_msgSendSuper2(&v32, sel_wf_getProcessedIntentValueForParameterValue_parameter_parameterState_completionHandler_, v10, v11, v12, v13);
  }
LABEL_13:

}

- (WFStringSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  WFBooleanSubstitutableState *v11;
  void *v12;
  WFStringSubstitutableState *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v24;
  objc_super v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "codableEnum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v6, "index");
LABEL_5:
    v10 = v9;
    if (objc_msgSend(v8, "type") == 1)
    {
      v11 = [WFBooleanSubstitutableState alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WFNumberSubstitutableState initWithNumber:](v11, "initWithNumber:", v12);
LABEL_7:

      goto LABEL_19;
    }
    if (!objc_msgSend(v8, "type"))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("IntentEnumOverrides"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      WFEnforceClass(v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "values");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectMatchingKey:intValue:", CFSTR("index"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = v19;
        }
        else
        {
          objc_msgSend(v17, "name");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v21;

        v13 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v24);
        goto LABEL_7;
      }

    }
    objc_msgSendSuper2(&v25, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7, a1, &off_1EF773638, v26.receiver, v26.super_class);
LABEL_12:
    v13 = (WFStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v6, "integerValue");
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSendSuper2(&v26, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7, v25.receiver, v25.super_class, a1, &off_1EF773638);
    goto LABEL_12;
  }
  getWFGeneralLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[INCodableEnumAttribute(Workflow) wf_parameterStateForIntentValue:parameterDefinition:]";
    v29 = 2114;
    v30 = v6;
    _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Unsupported value: %{public}@", buf, 0x16u);
  }

  v13 = 0;
LABEL_19:

  return v13;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "valueWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11.receiver = a1;
      v11.super_class = (Class)&off_1EF773638;
      objc_msgSendSuper2(&v11, sel_wf_contentItemForValue_, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(a1, "valueForIndex:", objc_msgSend(v4, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0D13EC0];
  objc_msgSend(v5, "localizedDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

@end
