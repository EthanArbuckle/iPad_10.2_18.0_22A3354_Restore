@implementation WFLinkContentItemFilterAction

- (LNPropertyQuery)propertyQuery
{
  WFLinkContentItemFilterAction *v2;
  id v3;

  v2 = self;
  v3 = WFLinkContentItemFilterAction.propertyQuery.getter();

  return (LNPropertyQuery *)v3;
}

- (WFLinkContentItemFilterAction)initWithIdentifier:(id)a3 queryMetadata:(id)a4 entityMetadata:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  id v16;
  id v17;
  WFLinkContentItemFilterAction *v18;
  WFLinkContentItemFilterAction *v19;
  void *v20;
  void *v21;
  void *v22;
  WFLinkContentItemFilterAction *v23;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)WFLinkContentItemFilterAction;
  v18 = -[WFContentItemAction initWithIdentifier:definition:serializedParameters:](&v27, sel_initWithIdentifier_definition_serializedParameters_, a3, a6, a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queryMetadata, a4);
    objc_storeStrong((id *)&v19->_entityMetadata, a5);
    objc_storeStrong((id *)&v19->_appIntentDescriptor, a8);
    objc_storeStrong((id *)&v19->_fullyQualifiedLinkActionIdentifier, a9);
    -[WFLinkContentItemFilterAction entityMetadata](v19, "entityMetadata", v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "systemProtocolMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D43A00]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_fetchingUniqueEntity = v22 != 0;

    v23 = v19;
  }

  return v19;
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction appIntentDescriptor](self, "appIntentDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithIdentifier:queryMetadata:entityMetadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v6, v7, v8, v9, v4, v10, v11);

  return v12;
}

- (id)serializedParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8.receiver = self;
  v8.super_class = (Class)WFLinkContentItemFilterAction;
  -[WFAction serializedParameters](&v8, sel_serializedParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  -[WFAction appDefinition](self, "appDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AppIntentDescriptor"));

  return v5;
}

- (id)propertiesByPropertyIdentifier
{
  NSDictionary *propertiesByPropertyIdentifier;
  NSDictionary *v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  _QWORD v12[4];
  id v13;

  propertiesByPropertyIdentifier = self->_propertiesByPropertyIdentifier;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (propertiesByPropertyIdentifier == v4)
  {
    v5 = 0;
  }
  else if (propertiesByPropertyIdentifier)
  {
    propertiesByPropertyIdentifier = propertiesByPropertyIdentifier;
    v5 = propertiesByPropertyIdentifier;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__WFLinkContentItemFilterAction_propertiesByPropertyIdentifier__block_invoke;
    v12[3] = &unk_1E7AF69F8;
    v13 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    v5 = (NSDictionary *)objc_msgSend(v9, "copy");
    if (v5)
    {
      v10 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    propertiesByPropertyIdentifier = self->_propertiesByPropertyIdentifier;
    self->_propertiesByPropertyIdentifier = v10;
  }

  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[5];
  uint8_t v31;
  id v32;
  _QWORD aBlock[5];
  id v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFContentItemFilterAction mode](self, "mode") == 1)
  {
    v35.receiver = self;
    v35.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFContentItemFilterAction runAsynchronouslyWithInput:](&v35, sel_runAsynchronouslyWithInput_, v4);
  }
  else
  {
    if (-[WFLinkContentItemFilterAction isInMemoryFindAction](self, "isInMemoryFindAction"))
    {
      v5 = (void *)MEMORY[0x1E0D44188];
      -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "policyWithEntityMetadata:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0;
      objc_msgSend(v7, "connectionWithError:", &v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      if (v8)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke;
        aBlock[3] = &unk_1E7AF6A20;
        aBlock[4] = self;
        v10 = _Block_copy(aBlock);
        -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "capabilities");

        objc_msgSend(v7, "appEntityMangledTypeName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 & 1) != 0)
          objc_msgSend(v8, "performAllEntitiesQueryWithEntityMangledTypeName:completionHandler:", v13, v10);
        else
          objc_msgSend(v8, "performSuggestedEntitiesQueryWithEntityMangledTypeName:completionHandler:", v13, v10);

      }
      else
      {
        getWFGeneralLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFLinkContentItemFilterAction runAsynchronouslyWithInput:]";
          v38 = 2112;
          v39 = v9;
          _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
        }

        -[WFLinkContentItemFilterAction finishRunningWithError:](self, "finishRunningWithError:", v9);
      }

    }
    else
    {
      -[WFContentItemFilterAction slice](self, "slice");
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 0;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB37E8];
        -[WFContentItemFilterAction slice](self, "slice");
        if (v16 <= 1)
          v17 = 1;
        else
          v17 = v16;
        objc_msgSend(v15, "numberWithUnsignedInteger:", v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)MEMORY[0x1E0D44188];
      -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "policyWithEntityQueryMetadata:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0;
      objc_msgSend(v20, "connectionWithError:", &v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;
      if (v21)
      {
        buf[0] = 0;
        -[WFLinkContentItemFilterAction sortingOptionsWithRandomSortOrder:](self, "sortingOptionsWithRandomSortOrder:", buf);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x1E0D44218]);
        -[WFLinkContentItemFilterAction propertyQuery](self, "propertyQuery");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "entityQueryMangledTypeName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v24, "initWithPropertyQuery:maximumResultCount:queryMangledTypeName:sortingOptions:", v25, v7, v26, v23);

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke_121;
        v30[3] = &unk_1E7AF6A48;
        v30[4] = self;
        v31 = buf[0];
        objc_msgSend(v21, "performQuery:completionHandler:", v27, v30);

      }
      else
      {
        getWFGeneralLogObject();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFLinkContentItemFilterAction runAsynchronouslyWithInput:]";
          v38 = 2112;
          v39 = v22;
          _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
        }

        -[WFLinkContentItemFilterAction finishRunningWithError:](self, "finishRunningWithError:", v22);
      }

    }
  }

}

- (void)finishRunningWithError:(id)a3
{
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  -[WFAction localizedErrorWithLinkError:](self, "localizedErrorWithLinkError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFAction finishRunningWithError:](&v6, sel_finishRunningWithError_, v5);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__WFLinkContentItemFilterAction_finishRunningWithError___block_invoke;
    v7[3] = &unk_1E7AF7B78;
    v7[4] = self;
    -[WFLinkContentItemFilterAction showChronoControlIfPossibleWithCompletionHandler:](self, "showChronoControlIfPossibleWithCompletionHandler:", v7);
  }

}

- (BOOL)isInMemoryFindAction
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  WFForcedLinkEntityFindActionIdentifiers();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "capabilities") & 1;

  }
  return v5;
}

- (id)metadataProvider
{
  LNMetadataProvider *metadataProvider;
  LNMetadataProvider *v4;
  LNMetadataProvider *v5;
  LNMetadataProvider *v6;
  LNMetadataProvider *v7;

  metadataProvider = self->_metadataProvider;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (LNMetadataProvider *)objc_claimAutoreleasedReturnValue();

  if (metadataProvider == v4)
  {
    v5 = 0;
  }
  else if (metadataProvider)
  {
    metadataProvider = metadataProvider;
    v5 = metadataProvider;
  }
  else
  {
    v6 = (LNMetadataProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44200]), "initWithOptions:", 2);
    v5 = v6;
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (LNMetadataProvider *)objc_claimAutoreleasedReturnValue();
    }
    metadataProvider = self->_metadataProvider;
    self->_metadataProvider = v7;
  }

  return v5;
}

- (void)finishRunningWithOutput:(id)a3 randomSortOrder:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  WFLinkContentItemFilterAction *v23;
  _BOOL4 v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  _QWORD v30[2];

  v6 = a4;
  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v23 = self;
LABEL_6:
    -[WFLinkContentItemFilterAction finishRunningWithError:](v23, "finishRunningWithError:", v10);
    goto LABEL_7;
  }
  v24 = v6;
  v25 = v9;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction displayableAppDescriptor](self, "displayableAppDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction setOutput:](self, "setOutput:", v18);

  if (!v24)
  {
    v23 = self;
    v10 = v25;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  -[WFAction output](self, "output");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "items");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13F08], "randomSortDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __79__WFLinkContentItemFilterAction_finishRunningWithOutput_randomSortOrder_error___block_invoke;
  v26[3] = &unk_1E7AF6A70;
  objc_copyWeak(&v28, &location);
  v27 = v25;
  objc_msgSend(v20, "sortedArrayUsingContentSortDescriptors:completionHandler:", v22, v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  v10 = v25;
LABEL_7:

}

- (id)sortingOptionsWithRandomSortOrder:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
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
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[6];

  v38[5] = *MEMORY[0x1E0C80C00];
  -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemSortProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v9)
      {

LABEL_10:
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Z to A"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v13;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Biggest First"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v14;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Latest First"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v15;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Longest First"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38[3] = v16;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Descending"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38[4] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemSortOrder"), objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v18, "containsObject:", v19);

        -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectMatchingKey:value:", CFSTR("name"), v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sortingOptions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __67__WFLinkContentItemFilterAction_sortingOptionsWithRandomSortOrder___block_invoke;
        v30[3] = &unk_1E7AF6A98;
        v25 = v22;
        v31 = v25;
        v32 = &v33;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v30);

        v26 = objc_alloc(MEMORY[0x1E0D44210]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34[3]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithOrder:sortParameterIndex:", v13, v27);
        v37 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(&v33, 8);
        goto LABEL_11;
      }
      v11 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v11)
        goto LABEL_10;
    }
    *a3 = 1;
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_11:

  return v12;
}

- (id)parameterDefinitions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)WFLinkContentItemFilterAction;
  -[WFContentItemFilterAction parameterDefinitions](&v16, sel_parameterDefinitions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
  {
    v4 = (id)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "definitionByRemovingKey:", CFSTR("Description"), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)configureParameter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
    objc_msgSend(v4, "setHidden:", 1);
  v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFLinkContentItemFilterAction linkValueTypes](self, "linkValueTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLinkValueTypes:", v5);

    }
  }

}

- (id)linkValueTypes
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  void *v22;
  id v23;

  -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[WFAction identifier](self, "identifier");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("is.workflow.actions.filter.notes");
  if (v5 == CFSTR("is.workflow.actions.filter.notes"))
  {

  }
  else
  {
    if (!v5)
    {

LABEL_8:
      objc_msgSend(v3, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke_139;
      v18 = &unk_1E7AF6AC0;
      v9 = &v19;
      v19 = v3;
      v10 = &v20;
      v20 = v4;
      v13 = v3;
      v12 = &v15;
      goto LABEL_9;
    }
    v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("is.workflow.actions.filter.notes"));

    if (!v7)
      goto LABEL_8;
  }
  objc_msgSend(v3, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke;
  v21[3] = &unk_1E7AF6AC0;
  v9 = &v22;
  v22 = v3;
  v10 = &v23;
  v23 = v4;
  v11 = v3;
  v12 = v21;
LABEL_9:
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12, v15, v16, v17, v18);

  return v4;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFLinkContentItemFilterAction;
  v5 = -[WFAction visibleForUse:](&v17, sel_visibleForUse_);
  if (v5)
  {
    -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WFISEligibleForSettingsUpdaterAction(v6, v8);

    if (a3 || (v9 & 1) == 0)
    {
      -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:](WFLinkActionProvider, "isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:", v10, v11, a3);

      -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:](WFLinkActionProvider, "isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:", v13, v14, a3);

      LOBYTE(v5) = v12 && v15;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
    v5 = CFSTR("Get %@");
  else
    v5 = CFSTR("Find %@");
  WFLocalizedStringResourceWithKey(v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8BDA0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "localize:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)parameterSummary
{
  objc_super v4;

  if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)WFLinkContentItemFilterAction;
  -[WFContentItemFilterAction parameterSummary](&v4, sel_parameterSummary);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayableAppDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LinkActionDisableDisplayedAppDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  if ((v7 & 1) != 0)
    return 0;
  -[WFAction definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("LinkActionDisplayedAppDescriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithSerializedRepresentation:", v10);
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      getWFAppIntentsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[WFLinkContentItemFilterAction displayableAppDescriptor]";
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Found a serialized representation for displayedAppDescriptor, but failed to deserialize it.", buf, 0xCu);
      }

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFAction displayableAppDescriptor](&v15, sel_displayableAppDescriptor);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)outputDictionary
{
  NSDictionary *outputDictionary;
  NSDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *v26;
  objc_super v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  outputDictionary = self->_outputDictionary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (outputDictionary == v4)
  {
    v5 = 0;
  }
  else if (outputDictionary)
  {
    outputDictionary = outputDictionary;
    v5 = outputDictionary;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFAction outputDictionary](&v27, sel_outputDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D43CB0]);
    -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithIdentifier:", v8);

    if (!v9)
      goto LABEL_7;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Types"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_7;
    -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_msgSend(v9, "wf_contentItemClassWithAppBundleIdentifier:", v13);

    if (v14)
    {
      v15 = (void *)objc_msgSend(v5, "mutableCopy");
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (id)objc_opt_new();
      v18 = v17;

      v29[0] = CFSTR("Multiple");
      v19 = (void *)MEMORY[0x1E0CB37E8];
      if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
      {
        v20 = 0;
      }
      else
      {
        objc_opt_class();
        v20 = objc_opt_isKindOfClass() & 1;
      }
      objc_msgSend(v19, "numberWithInt:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = CFSTR("Types");
      v30[0] = v21;
      NSStringFromClass(v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addEntriesFromDictionary:", v24);

      v25 = (void *)objc_msgSend(v18, "copy");
      if (v25)
      {
        v26 = v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v26;
      v5 = v25;
    }
    else
    {
LABEL_7:

      outputDictionary = 0;
    }
  }

  return v5;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (-[WFLinkContentItemFilterAction isFetchingUniqueEntity](self, "isFetchingUniqueEntity"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFContentItemFilterAction localizedDescriptionResultWithContext:](&v7, sel_localizedDescriptionResultWithContext_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultValueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "resultValueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFContentItemFilterAction localizedDefaultOutputNameWithContext:](&v13, sel_localizedDefaultOutputNameWithContext_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v4, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchKeywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__WFLinkContentItemFilterAction_localizedKeywordsWithContext___block_invoke;
  v11[3] = &unk_1E7AF6B00;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "if_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[WFLinkContentItemFilterAction queryMetadata](self, "queryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFLinkContentItemFilterAction;
    -[WFAction localizedCategoryWithContext:](&v13, sel_localizedCategoryWithContext_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)showChronoControlIfPossibleWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[WFLinkContentItemFilterAction entityMetadata](self, "entityMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentIfPossibleInUserInterface:completionBlock:", v6, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (id)entityMetadataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContentItemFilterAction fullyQualifiedLinkActionIdentifier](self, "fullyQualifiedLinkActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)backingActionIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[WFAction identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (LNQueryMetadata)queryMetadata
{
  return self->_queryMetadata;
}

- (LNEntityMetadata)entityMetadata
{
  return self->_entityMetadata;
}

- (BOOL)isFetchingUniqueEntity
{
  return self->_fetchingUniqueEntity;
}

- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier
{
  return self->_fullyQualifiedLinkActionIdentifier;
}

- (INAppIntentDescriptor)appIntentDescriptor
{
  return self->_appIntentDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntentDescriptor, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedLinkActionIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMetadata, 0);
  objc_storeStrong((id *)&self->_queryMetadata, 0);
  objc_storeStrong((id *)&self->_propertiesByPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
}

id __62__WFLinkContentItemFilterAction_localizedKeywordsWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "valueType");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v7);
  }
  else
  {
    getWFAppIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "effectiveBundleIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316162;
      v13 = "-[WFLinkContentItemFilterAction linkValueTypes]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s LNPropertyMetadata title has no key: entity %@ from bundles %@, property %@ at %ld", (uint8_t *)&v12, 0x34u);

    }
  }

}

void __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke_139(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v5, "valueType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
  else
  {
    getWFAppIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "effectiveBundleIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316162;
      v13 = "-[WFLinkContentItemFilterAction linkValueTypes]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s LNPropertyMetadata has no identifier: entity %@ from bundles %@, property %@ at %ld", (uint8_t *)&v12, 0x34u);

    }
  }

}

void __67__WFLinkContentItemFilterAction_sortingOptionsWithRandomSortOrder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  objc_msgSend(a2, "propertyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v11 = v7;
  v9 = v8;
  if (v11 == v9)
  {

    goto LABEL_7;
  }
  if (!v11 || !v9)
  {

    return;
  }
  v10 = objc_msgSend(v11, "isEqualToString:", v9);

  if (v10)
  {
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __79__WFLinkContentItemFilterAction_finishRunningWithOutput_randomSortOrder_error___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setOutput:", v5);
  objc_msgSend(WeakRetained, "finishRunningWithError:", *(_QWORD *)(a1 + 32));

}

id __56__WFLinkContentItemFilterAction_finishRunningWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WFLinkContentItemFilterAction;
  return objc_msgSendSuper2(&v3, sel_finishRunningWithError_, a2);
}

void __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v5 = a2;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fullyQualifiedLinkActionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayableAppDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "query");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = v14;
  v16.super_class = (Class)WFLinkContentItemFilterAction;
  objc_msgSendSuper2(&v16, sel_runFilterWithInput_query_, v13, v15);

}

uint64_t __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke_121(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithOutput:randomSortOrder:error:", a2, *(unsigned __int8 *)(a1 + 40), a3);
}

void __63__WFLinkContentItemFilterAction_propertiesByPropertyIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v6);

  }
  else
  {
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[WFLinkContentItemFilterAction propertiesByPropertyIdentifier]_block_invoke";
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s No property identifier found for propertyMetadata metadata: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

@end
