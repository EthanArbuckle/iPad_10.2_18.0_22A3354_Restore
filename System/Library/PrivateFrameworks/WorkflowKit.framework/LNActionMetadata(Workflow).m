@implementation LNActionMetadata(Workflow)

- (id)wf_parameterDefinitions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "parameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_compactMap:", &__block_literal_global_48065);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)wf_validateParametersForAction:()Workflow error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_map:", &__block_literal_global_105);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v6, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v23 = v8;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v17, "wf_validateParameterValue:error:", v20, a4);

        if (!(_DWORD)v17)
        {
          v21 = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
    v21 = 1;
LABEL_11:
    v8 = v23;
  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (id)wf_actionMetadataWithOutputType:()Workflow
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = (objc_class *)MEMORY[0x1E0D43BA0];
  v23 = a3;
  v26 = [v4 alloc];
  objc_msgSend(a1, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mangledTypeName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mangledTypeNameByBundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectiveBundleIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(a1, "bundleMetadataVersion");
  objc_msgSend(a1, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deprecationMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1, "openAppWhenRun");
  v19 = objc_msgSend(a1, "isDiscoverable");
  v18 = objc_msgSend(a1, "authenticationPolicy");
  v17 = objc_msgSend(a1, "outputFlags");
  objc_msgSend(a1, "parameters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemProtocolMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeSpecificMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customIntentClassName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "availabilityAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shortcutsMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requiredCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sideEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assistantDefinedSchemas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v11) = v19;
  LOBYTE(v11) = v20;
  v27 = (void *)objc_msgSend(v26, "initWithIdentifier:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:bundleMetadataVersion:title:descriptionMetadata:deprecationMetadata:openAppWhenRun:discoverable:authenticationPolicy:outputType:outputFlags:parameters:systemProtocolMetadata:actionConfiguration:typeSpecificMetadata:customIntentClassName:availabilityAnnotations:shortcutsMetadata:requiredCapabilities:attributionBundleIdentifier:sideEffect:assistantDefinedSchemas:", v32, v28, v25, v24, v22, v21, v31, v30, v11, v18, v23, v17, v29,
                  v16,
                  v15,
                  v14,
                  v13,
                  v5,
                  v6,
                  v12,
                  v7,
                  v8,
                  v9);

  return v27;
}

@end
