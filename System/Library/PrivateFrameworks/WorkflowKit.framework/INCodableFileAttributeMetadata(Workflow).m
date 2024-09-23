@implementation INCodableFileAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v11 = (void *)MEMORY[0x1E0CBD8A8];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(a1, "UTIs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "wf_multipleValues");
  v18 = objc_msgSend(v13, "supportsDynamicEnumeration");

  v19 = objc_msgSend(v11, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v15, v14, v16, v17, v18, v12);
  return v19;
}

- (WFFileParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  WFFileValue *v10;
  void *v11;
  void *v12;
  void *v13;
  WFFileValue *v14;
  void *v15;
  WFFileValue *v16;
  WFFileParameterState *v17;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  objc_msgSend(v8, "_bookmarkData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [WFFileValue alloc];
    objc_msgSend(v8, "_bookmarkData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFFileValue initWithBookmarkData:filename:displayName:](v10, "initWithBookmarkData:filename:displayName:", v11, v12, v13);

  }
  else
  {
    objc_msgSend(v8, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
LABEL_12:
      v17 = 0;
      goto LABEL_13;
    }
    v16 = [WFFileValue alloc];
    objc_msgSend(v8, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFFileValue initWithURL:](v16, "initWithURL:", v11);
  }

  if (!v14)
    goto LABEL_12;
  v17 = -[WFVariableSubstitutableParameterState initWithValue:]([WFFileParameterState alloc], "initWithValue:", v14);

LABEL_13:
  return v17;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EF78C730;
  objc_msgSendSuper2(&v7, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("FilePickerSupportedTypes");
  objc_msgSend(a1, "UTIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
