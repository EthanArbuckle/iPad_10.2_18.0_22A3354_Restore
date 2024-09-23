@implementation INFile(Workflow)

- (id)wf_initWithData:()Workflow filename:fileURL:typeIdentifier:removedOnCompletion:
{
  return (id)objc_msgSend(a1, "_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", a3, a4, a5, a6, a7);
}

- (id)wf_initWithBookmarkData:()Workflow filename:typeIdentifier:removedOnCompletion:
{
  return (id)objc_msgSend(a1, "_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", a3, a4, a5, a6);
}

- (id)wf_contentItemWithCodableAttribute:()Workflow
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D13EC0];
  objc_msgSend(a1, "wf_fileRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itemWithFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("INFile+Workflow.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    v6 = 0;
  }
  (*((void (**)(id, uint64_t))v6 + 2))(v6, a1);

}

- (id)wf_fileRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  _BYTE v28[32];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC7B30];
  objc_msgSend(a1, "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(a1, "_hasAssociatedAuditToken"))
    {
      objc_msgSend(a1, "fileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_associatedAuditToken");
      v7 = objc_msgSend(v6, "wf_sandboxAllowsReadingFileWithAuditToken:", v28);

      if (!v7)
      {
        v12 = 0;
        goto LABEL_18;
      }
    }
    if (objc_msgSend(a1, "removedOnCompletion"))
      v8 = 9;
    else
      v8 = 8;
    v9 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(a1, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWithURL:options:ofType:proposedFilename:", v10, v8, v4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(a1, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileWithData:ofType:proposedFilename:", v14, v4, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = a1;
  objc_msgSend(v16, "_itemProviderRequestMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3710];
    v20 = objc_opt_class();
    objc_msgSend(v16, "_itemProviderRequestMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v19, "unarchivedObjectOfClass:fromData:error:", v20, v22, &v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v29;

    if (v23)
    {
      v25 = v23;
    }
    else
    {
      getWFGeneralLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "WFItemProviderRequestMetadataWithINFile";
        v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Could not unarchive item provider metadata with error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v23 = 0;
  }

  objc_msgSend(v12, "setMetadata:", v23);
LABEL_18:

  return v12;
}

+ (id)wf_fileWithFileRepresentation:()Workflow displayName:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "filename");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_msgSend(v5, "initialRepresentationType");
  v11 = objc_alloc(MEMORY[0x1E0CBD8A8]);
  if (v10)
  {
    objc_msgSend(v5, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wfType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v16 = 0;
    v17 = v9;
    v18 = v12;
  }
  else
  {
    objc_msgSend(v5, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wfType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v16 = v12;
    v17 = v9;
    v18 = 0;
  }
  objc_msgSend(v15, "wf_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", v16, v17, v18, v14, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  WFINItemProviderRequestMetadataWithFileRepresentation(v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setItemProviderRequestMetadata:", v20);

  if (objc_msgSend(v5, "deletesFileOnDeallocation"))
    objc_msgSend(v19, "_setMarkedForDeletionOnDeallocation:", 1);

  return v19;
}

+ (id)wf_fileWithFileRepresentation:()Workflow bookmarkData:displayName:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0CBD8A8];
  v9 = a5;
  v10 = a4;
  v11 = [v8 alloc];
  v12 = v9;
  if (!v9)
  {
    objc_msgSend(v7, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "wfType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "deletesFileOnDeallocation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wf_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  WFINItemProviderRequestMetadataWithFileRepresentation(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setItemProviderRequestMetadata:", v17);

  if (objc_msgSend(v7, "deletesFileOnDeallocation"))
    objc_msgSend(v16, "_setMarkedForDeletionOnDeallocation:", 1);

  return v16;
}

+ (id)wf_fileWithBookmarkData:()Workflow filename:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CBD8A8];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v8, "wf_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v7, v6, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)wf_contentItemClass
{
  return objc_opt_class();
}

+ (uint64_t)wf_processParameterValue:()Workflow parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[4];
  id v50;
  char v51;
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF77E8;
  v18 = v17;
  v50 = v18;
  v51 = a6;
  v19 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)MEMORY[0x1E0D13EA8];
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", v14);
    v43 = v14;
    v21 = v18;
    v22 = a7;
    v23 = v19;
    v24 = v16;
    v25 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v26;
    v27 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collectionWithItems:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v25;
    v16 = v24;
    v19 = v23;
    v30 = v22;
    v18 = v21;
    v14 = v43;
    objc_msgSend(a1, "getINFileRepresentationsFromContent:byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:", v29, v16, v15, v30, v23);

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v33 = (void *)MEMORY[0x1E0D13EA8];
      objc_msgSend(v14, "if_map:", &__block_literal_global_57754);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "collectionWithItems:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "getINFileRepresentationsFromContent:byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:", v35, v16, v15, a7, v19);
LABEL_10:
      v27 = 1;
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "getINFileRepresentationsFromContent:byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:", v14, v16, v15, a7, v19);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*((void (**)(id, id, _QWORD))v18 + 2))(v18, v14, 0);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v15;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v14;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v46;
      while (2)
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v46 != v40)
            objc_enumerationMutation(v37);
          v42 = objc_opt_class();
          if (v42 == objc_opt_class())
          {
            (*((void (**)(id, id, _QWORD))v18 + 2))(v18, v37, 0);

            v27 = 1;
            goto LABEL_24;
          }
          ++v41;
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        if (v39)
          continue;
        break;
      }
    }

    v27 = 0;
LABEL_24:
    v15 = v44;
  }
  else
  {
    v27 = 0;
  }
LABEL_11:

  return v27;
}

+ (void)getINFileRepresentationsFromContent:()Workflow byCoercingToSupportedUTIs:withParameterState:dynamicOptions:completion:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "parameterStates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v19 = v16;
    else
      v19 = 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke;
  v22[3] = &unk_1E7AF8790;
  v23 = v19;
  v24 = v15;
  v20 = v19;
  v21 = v15;
  objc_msgSend(a1, "coerceContentItemsIfAppropriate:toSupportedUTIs:withParameterStates:dynamicOptions:completion:", v12, v13, v20, a6, v22);

}

+ (void)coerceContentItemsIfAppropriate:()Workflow toSupportedUTIs:withParameterStates:dynamicOptions:completion:
{
  id v11;
  id v12;
  id v13;

  v13 = a4;
  v11 = a7;
  v12 = a3;
  if (!objc_msgSend(v13, "count") || a6)
    objc_msgSend(v12, "getFileRepresentations:forType:", v11, 0);
  else
    objc_msgSend(a1, "coerceContentItems:toSupportedUTIs:completion:", v12, v13, v11);

}

+ (void)coerceContentItems:()Workflow toSupportedUTIs:completion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "if_map:", &__block_literal_global_129_57745);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v11, "if_compactMap:", &__block_literal_global_132_57746);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  getWFIntentExecutionLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "+[INFile(Workflow) coerceContentItems:toSupportedUTIs:completion:]";
    v32 = 2114;
    v33 = v8;
    v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEBUG, "%s Mapped UTIs: %{public}@ to content items: %{public}@", buf, 0x20u);
  }

  v16 = (void *)MEMORY[0x1E0D13E58];
  objc_msgSend(v14, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_135;
  v24[3] = &unk_1E7AF7948;
  v26 = v9;
  v27 = a1;
  v25 = v11;
  v18 = v11;
  v19 = v9;
  objc_msgSend(v16, "requestForCoercingToContentClasses:completionHandler:", v17, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D13E50];
  v28 = *MEMORY[0x1E0D14170];
  v29 = *MEMORY[0x1E0D14278];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "optionsWithDictionary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOptions:", v23);

  objc_msgSend(v10, "performCoercion:", v20);
}

+ (id)compatibleFileTypeForContentItem:()Workflow availableTypes:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "preferredFileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToTypes:", v6))
  {
    v8 = v7;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "supportedTypes", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
          }
          else
          {
            v15 = 0;
          }
          v8 = v15;

          if ((objc_msgSend(v8, "conformsToTypes:", v6) & 1) != 0)
          {

            goto LABEL_18;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }

    v8 = 0;
  }
LABEL_18:

  return v8;
}

@end
