@implementation INCodableObjectAttribute(Workflow)

- (id)wf_facadeClass
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "valueTransformer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_objectClass
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "wf_objectClass");
  if (!v3)
    v3 = (void *)objc_msgSend(a1, "wf_facadeClass");
  v4 = v3;

  return v4;
}

- (id)wf_parameterClass
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wf_parameterClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = a1;
  v14.super_class = (Class)&off_1EF77B050;
  objc_msgSendSuper2(&v14, sel_wf_updatedParameterDefinition_parameterClass_localizer_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "supportsDynamicEnumeration")
    || (objc_msgSend(a1, "metadata"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(a1, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_updatedParameterDefinition:forCodableAttribute:localizer:", v9, a1, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD);
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_opt_class();
  if (v14 == objc_opt_class())
  {
    v13[2](v13, v10, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = a1;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        while (2)
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = objc_opt_class();
            if (v20 == objc_opt_class())
            {
              v13[2](v13, v15, 0);

              goto LABEL_16;
            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v17)
            continue;
          break;
        }
      }

      a1 = v23;
    }
    objc_msgSend(a1, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "wf_processParameterValue:forParameter:parameterState:codableAttribute:completionHandler:", v10, v11, v12, a1, v13);

    if ((v22 & 1) == 0)
    {
      v24.receiver = a1;
      v24.super_class = (Class)&off_1EF77B050;
      objc_msgSendSuper2(&v24, sel_wf_getProcessedIntentValueForParameterValue_parameter_parameterState_completionHandler_, v10, v11, v12, v13);
    }
  }
LABEL_16:

}

- (WFPodcastSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFPodcastSubstitutableState *v10;
  id v11;
  WFMultipleValueParameterState *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFiTunesPodcastObject *v21;
  void *v22;
  void *v23;
  WFiTunesPodcastObject *v24;
  void *v25;
  WFMediaItemState *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  _QWORD v32[5];
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_parameterStateForIntentValue:parameterDefinition:", v6, v7);
    v10 = (WFPodcastSubstitutableState *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (!objc_msgSend(a1, "wf_multipleValues"))
        goto LABEL_17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_17;
      v11 = v6;
      v12 = [WFMultipleValueParameterState alloc];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __90__INCodableObjectAttribute_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke;
      v32[3] = &unk_1E7AF4498;
      v32[4] = a1;
      v33 = v7;
      objc_msgSend(v11, "if_compactMap:", v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[WFMultipleValueParameterState initWithParameterStates:](v12, "initWithParameterStates:", v13);
      if (!v10)
      {
LABEL_17:
        v31.receiver = a1;
        v31.super_class = (Class)&off_1EF77B050;
        objc_msgSendSuper2(&v31, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
        v10 = (WFPodcastSubstitutableState *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v14 = v6;
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3998];
      objc_msgSend(v14, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "type") == 6)
      {
        objc_msgSend(v18, "queryItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectMatchingKey:value:", CFSTR("name"), CFSTR("storeCollectionId"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = [WFiTunesPodcastObject alloc];
        objc_msgSend(v14, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[WFiTunesPodcastObject initWithName:identifier:podcastUUID:feedURL:kind:](v21, "initWithName:identifier:podcastUUID:feedURL:kind:", v22, v23, 0, 0, CFSTR("podcast"));

        v10 = -[WFVariableSubstitutableParameterState initWithValue:]([WFPodcastSubstitutableState alloc], "initWithValue:", v24);
      }
      else
      {
        if (objc_msgSend(v14, "type") == 8
          || (objc_msgSend(v18, "queryItems"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v25, "objectMatchingKey:value:", CFSTR("name"), CFSTR("deviceLibraryPersistentID")),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v25,
              !v20))
        {

          v10 = 0;
          goto LABEL_18;
        }
        v26 = [WFMediaItemState alloc];
        objc_msgSend(a1, "mediaTypeFromIntentMediaType:", objc_msgSend(v14, "type"));
        v24 = (WFiTunesPodcastObject *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[WFMediaItemState initWithMediaType:persistentID:](v26, "initWithMediaType:persistentID:", v24, v29);

      }
    }
    else
    {
      v10 = 0;
    }

    if (!v10)
      goto LABEL_17;
  }
LABEL_18:

  return v10;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_contentItemForValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EF786DD8)
      || (objc_msgSend(v4, "wf_contentItemWithCodableAttribute:", a1),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)wf_processedParameterValueForValue:()Workflow
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    v7 = v4;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EF77B050;
    objc_msgSendSuper2(&v10, sel_wf_processedParameterValueForValue_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (__CFString)mediaTypeFromIntentMediaType:()Workflow
{
  __CFString **v3;

  if ((unint64_t)(a3 - 1) > 4)
    v3 = WFMediaTypeSong;
  else
    v3 = off_1E7AEF010[a3 - 1];
  return *v3;
}

@end
