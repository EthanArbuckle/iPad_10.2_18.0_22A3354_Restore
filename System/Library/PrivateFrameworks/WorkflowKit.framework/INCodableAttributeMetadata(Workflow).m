@implementation INCodableAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return 0;
}

- (uint64_t)wf_parameterClass
{
  return 0;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "placeholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10 = CFSTR("Placeholder");
    objc_msgSend(a1, "placeholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  return 0;
}

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return 0;
}

@end
