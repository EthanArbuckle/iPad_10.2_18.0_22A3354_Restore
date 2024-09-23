@implementation INCodableAttribute(Workflow)

- (uint64_t)wf_objectClass
{
  return 0;
}

- (id)wf_contentItemClass
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend((id)objc_msgSend(a1, "wf_objectClass"), "conformsToProtocol:", &unk_1EF786DD8))
  {
    objc_msgSend((id)objc_msgSend(a1, "wf_objectClass"), "wf_contentItemClass");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_msgSend(a1, "wf_objectClass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentItemClassForType:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)wf_multipleValues
{
  return objc_msgSend(a1, "modifier") == 0;
}

- (uint64_t)wf_parameterClass
{
  return 0;
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v47;
  void *v48;
  id v49;
  __CFString *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  _QWORD v66[7];
  _QWORD v67[7];
  _BYTE buf[24];
  void *v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a5;
  objc_msgSend(a1, "localizedDisplayNameWithLocalizer:");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
    objc_msgSend(a1, "displayName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E7AFA810;
    if (v9)
      v11 = (__CFString *)v9;
    v50 = v11;
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "propertyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[INCodableAttribute(Workflow) wf_updatedParameterDefinition:parameterClass:localizer:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v69 = v14;
      LOWORD(v70) = 2112;
      *(_QWORD *)((char *)&v70 + 2) = v10;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s no localized name class=%@, propertyName=%@, displayName=%@", buf, 0x2Au);

    }
  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__23377;
  v58 = __Block_byref_object_dispose__23378;
  v47 = v8;
  v59 = v47;
  v66[0] = CFSTR("Class");
  NSStringFromClass(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v15;
  v66[1] = CFSTR("Key");
  objc_msgSend(a1, "propertyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v16;
  v67[2] = v50;
  v66[2] = CFSTR("Label");
  v66[3] = CFSTR("IntentSlotName");
  objc_msgSend(a1, "propertyName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v17;
  v66[4] = CFSTR("AllowsMultipleValues");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "modifier") == 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v18;
  v67[5] = CFSTR("Right");
  v66[5] = CFSTR("TextAlignment");
  v66[6] = CFSTR("FixedSizeArray");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isFixedSizeArray"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(a1, "isFixedSizeArray");
  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    v23 = *MEMORY[0x1E0CBD3D8];
    *(_QWORD *)buf = *MEMORY[0x1E0CBD3E0];
    *(_QWORD *)&buf[8] = v23;
    v24 = (void *)*MEMORY[0x1E0CBD3C8];
    *(_QWORD *)&buf[16] = *MEMORY[0x1E0CBD3D0];
    v69 = v24;
    v25 = *MEMORY[0x1E0CBD3A8];
    *(_QWORD *)&v70 = *MEMORY[0x1E0CBD3B0];
    *((_QWORD *)&v70 + 1) = v25;
    v26 = *MEMORY[0x1E0CBD3B8];
    v71 = *MEMORY[0x1E0CBD3C0];
    v72 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 8, v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v22;
    v53[1] = 3221225472;
    v53[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke;
    v53[3] = &unk_1E7AF7718;
    v53[4] = a1;
    objc_msgSend(v27, "if_compactMap:", v53);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v22;
    v52[1] = 3221225472;
    v52[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_2;
    v52[3] = &unk_1E7AEF978;
    v52[4] = a1;
    objc_msgSend(v27, "if_objectsPassingTest:", v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = CFSTR("ArraySizesForSizeClass");
    v65 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "if_dictionaryByAddingEntriesFromDictionary:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v32;
  }
  v51[0] = v22;
  v51[1] = 3221225472;
  v51[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_3;
  v51[3] = &unk_1E7AF6998;
  v51[4] = &v54;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v51, v47);
  if ((objc_msgSend(a1, "supportsDynamicEnumeration") & 1) == 0)
  {
    objc_msgSend(a1, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedPlaceholder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)v55[5];
      v62 = CFSTR("Placeholder");
      v63 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "definitionByAddingEntriesInDictionary:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v55[5];
      v55[5] = v37;

    }
  }
  objc_msgSend(a1, "languageCode");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)v55[5];
    v60 = CFSTR("LanguageCodeOverride");
    objc_msgSend(a1, "languageCode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "definitionByAddingEntriesInDictionary:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v55[5];
    v55[5] = v43;

  }
  v45 = (id)v55[5];

  _Block_object_dispose(&v54, 8);
  return v45;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  WFTransformValueForParameterDescription(a3, a1, a6);
}

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "wf_contentItemClass"), "itemWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
