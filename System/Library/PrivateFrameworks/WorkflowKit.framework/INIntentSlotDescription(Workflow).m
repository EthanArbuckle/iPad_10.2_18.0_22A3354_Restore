@implementation INIntentSlotDescription(Workflow)

- (id)wf_objectClass
{
  uint64_t v1;
  id v2;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(a1, "valueType");
  v2 = 0;
  switch(v1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 18:
    case 21:
    case 22:
    case 24:
    case 25:
    case 30:
    case 31:
    case 53:
    case 54:
    case 57:
    case 58:
    case 63:
    case 64:
    case 68:
    case 70:
    case 72:
    case 84:
    case 85:
      goto LABEL_4;
    case 14:
    case 15:
    case 17:
    case 19:
    case 20:
    case 23:
    case 26:
    case 29:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 55:
    case 56:
    case 59:
    case 60:
    case 61:
    case 62:
    case 65:
    case 66:
    case 67:
    case 69:
    case 71:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
      return v2;
    case 27:
    case 28:
      v6 = 0;
      v7 = &v6;
      v8 = 0x2050000000;
      v4 = (void *)getCLPlacemarkClass_softClass_53539;
      v9 = getCLPlacemarkClass_softClass_53539;
      if (!getCLPlacemarkClass_softClass_53539)
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __getCLPlacemarkClass_block_invoke_53540;
        v5[3] = &unk_1E7AF9520;
        v5[4] = &v6;
        __getCLPlacemarkClass_block_invoke_53540((uint64_t)v5);
        v4 = (void *)v7[3];
      }
      v2 = v4;
      _Block_object_dispose(&v6, 8);
      break;
    default:
      if ((unint64_t)(v1 - 98) <= 0x33 && ((1 << (v1 - 98)) & 0x82000DFC70001) != 0)
      {
LABEL_4:
        objc_opt_class();
        v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v2;
}

- (id)wf_facadeClass
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "valueType");
  if ((v2 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    goto LABEL_8;
  if (v2 > 17)
  {
    if (v2 == 53 || v2 == 18)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(a1, "wf_objectClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((unint64_t)(v2 - 10) >= 2 && v2 != 16)
    goto LABEL_10;
LABEL_8:
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (uint64_t)wf_multipleValues
{
  unint64_t v3;

  if (objc_msgSend(a1, "valueStyle") == 3)
    return 1;
  v3 = objc_msgSend(a1, "valueType");
  if (v3 <= 0x1F)
    return (0x92402800 >> v3) & 1;
  else
    return 0;
}

- (id)wf_parameterClass
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "valueType");
  v2 = 0;
  switch(v1)
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 16:
    case 18:
    case 21:
    case 24:
    case 27:
    case 28:
    case 30:
      goto LABEL_9;
    case 2:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 19:
    case 20:
    case 22:
    case 23:
    case 25:
    case 26:
    case 29:
      return v2;
    default:
      if ((unint64_t)off_1E7AC4A70 + 3 <= 0x3F
        && (((1 << ((char)off_1E7AC4A70 + 3)) & 0xE0002001800A8C30) != 0 || &off_1E7AC4AA8 == (__objc2_class **)53)
        || (unint64_t)off_1E7AC4A30 <= 0x1D && ((1 << (char)off_1E7AC4A30) & 0x2080037F) != 0)
      {
LABEL_9:
        objc_opt_class();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v2;
}

- (uint64_t)wf_outputDisplayNameWithLocalizer:()Workflow
{
  return 0;
}

- (uint64_t)wf_contentItemClass
{
  return 0;
}

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return 0;
}

- (uint64_t)wf_processedParameterValueForValue:()Workflow
{
  return 0;
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  id v8;
  id v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "resolveSelectorStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

    goto LABEL_11;
  }
  v11 = objc_msgSend(a1, "isPrivate");

  if ((v11 & 1) != 0)
  {
LABEL_11:
    v32 = v8;
    goto LABEL_12;
  }
  v12 = objc_msgSend(a1, "valueType");
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__53537;
  v39 = __Block_byref_object_dispose__53538;
  v40 = v8;
  v45[0] = CFSTR("Class");
  NSStringFromClass(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v13;
  v45[1] = CFSTR("Key");
  objc_msgSend(a1, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v14;
  v45[2] = CFSTR("Label");
  objc_msgSend(a1, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddSpacesToCamelCaseName(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WFCapitalizeFirstLetter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __92__INIntentSlotDescription_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke;
  v34[3] = &unk_1E7AF6998;
  v34[4] = &v35;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v34);
  if (-[objc_class isEqual:](a4, "isEqual:", objc_opt_class()))
  {
    v19 = (void *)v36[5];
    v43 = CFSTR("AllowsDecimalNumbers");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v12 < 0x36) & (0x20000000200018uLL >> v12));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "definitionByAddingEntriesInDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v36[5];
    v36[5] = v22;

  }
  if (-[objc_class isEqual:](a4, "isEqual:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", CFSTR("Variable"), CFSTR("ExtensionInput"), CFSTR("ActionOutput"), CFSTR("CurrentDate"), CFSTR("Clipboard"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v36[5], "objectForKey:", CFSTR("DisallowedVariableTypes"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v24, "orderedSetByAddingObjectsFromArray:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v26;
    }
    v27 = (void *)v36[5];
    v41 = CFSTR("DisallowedVariableTypes");
    objc_msgSend(v24, "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "definitionByAddingEntriesInDictionary:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v36[5];
    v36[5] = v30;

  }
  v32 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
LABEL_12:

  return v32;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  WFTransformValueForParameterDescription(a3, a1, a6);
}

- (uint64_t)wf_outputContentItemForOutput:()Workflow
{
  return 0;
}

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

@end
