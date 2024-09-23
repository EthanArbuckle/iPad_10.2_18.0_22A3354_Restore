@implementation PBFPosterSnapshotRequest

+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotRequestForPreview:context:definition:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)snapshotRequestForPreview:(id)a3 context:(id)a4 definition:(id)a5
{
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
  void *v17;
  void *v18;
  void *v19;
  PBFPosterSnapshotRequest *v20;
  uint64_t v21;
  NSString *previewIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA677A8);
  }
  v11 = v10;
  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF9E9988) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterPreview)]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6780CLL);
  }

  v12 = v9;
  NSClassFromString(CFSTR("PBFPosterSnapshotDefinition"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA67870);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA678D4);
  }

  objc_msgSend(v11, "posterDescriptorLookupInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "posterDescriptorPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "posterDescriptorLookupInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "posterDescriptorExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "posterExtensionBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FAE0], "pbf_configuredPropertiesForPreview:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:]([PBFPosterSnapshotRequest alloc], "initWithPath:provider:configuredProperties:definitions:context:", v14, v17, v18, v19, v8);
  objc_msgSend(v11, "previewUniqueIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  previewIdentifier = v20->_previewIdentifier;
  v20->_previewIdentifier = (NSString *)v21;

  return v20;
}

+ (id)snapshotRequestForConfiguration:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PBFPosterSnapshotRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  PBFPosterSnapshotRequest *v16;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA67A8CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA67AF0);
  }

  objc_msgSend(v7, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:].cold.3();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA67B54);
  }
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path identity] type] == PFServerPosterTypeConfiguration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:context:].cold.2();
    goto LABEL_17;
  }
  objc_msgSend(v7, "loadConfiguredPropertiesWithError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [PBFPosterSnapshotRequest alloc];
  objc_msgSend(v8, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](v12, "initWithPath:provider:configuredProperties:definitions:context:", v8, v14, v11, v15, v6);

  return v16;
}

+ (BOOL)isRequestFulfilled:(id)a3 modelCoordinatorProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "loadFromCacheIfAvailable"))
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbf_posterSnapshotCoordinatorForIdentity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "configuredProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "definitions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v20 = v7;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v5, "displayContext");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v9, "snapshotExistsForDefinition:configuredProperties:context:", v16, v10, v17);

          if (!(_DWORD)v16)
          {
            v18 = 0;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
      v18 = 1;
LABEL_13:
      v7 = v20;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)areRequestsFulfilled:(id)a3 modelCoordinatorProvider:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (**v27)(id, void *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v26 = v7;
    v27 = v6;
    v24 = *(_QWORD *)v33;
    while (2)
    {
      v11 = 0;
      v25 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "loadFromCacheIfAvailable", v24))
        {
          v22 = 0;
          goto LABEL_20;
        }
        v6[2](v6, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "configuredProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v12, "definitions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v12, "displayContext");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v20) = objc_msgSend(v13, "snapshotExistsForDefinition:configuredProperties:context:", v20, v14, v21);

              if (!(_DWORD)v20)
              {

                v22 = 0;
                v7 = v26;
                v6 = v27;
                goto LABEL_20;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v17)
              continue;
            break;
          }
        }

        ++v11;
        v7 = v26;
        v6 = v27;
        v10 = v24;
      }
      while (v11 != v25);
      v9 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v22 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v22 = 1;
  }
LABEL_20:

  return v22;
}

- (PBFPosterSnapshotRequest)initWithConfiguration:(id)a3 definitions:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PBFPosterSnapshotRequest *v17;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6813CLL);
  }
  objc_msgSend(v11, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path identity] type] == PFServerPosterTypeConfiguration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v8, "loadConfiguredPropertiesWithError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](self, "initWithPath:provider:configuredProperties:definitions:context:", v11, v16, v14, v9, v10);

  return v17;
}

- (PBFPosterSnapshotRequest)initWithDescriptor:(id)a3 configuredProperties:(id)a4 definitions:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PBFPosterSnapshotRequest *v19;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "_path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithDescriptor:configuredProperties:definitions:context:].cold.2();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68310);
  }
  objc_msgSend(v14, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");

  if (v16 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path identity] type] == PFServerPosterTypeConfiguration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithDescriptor:configuredProperties:definitions:context:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v14, "serverIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:](self, "initWithPath:provider:configuredProperties:definitions:context:", v14, v18, v11, v12, v13);

  return v19;
}

- (PBFPosterSnapshotRequest)initWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 definitions:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  PBFPosterSnapshotRequest *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  PRPosterConfiguredProperties *configuredProperties;
  uint64_t v30;
  NSArray *definitions;
  uint64_t v32;
  NSString *provider;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  PBFPosterSnapshotRequestIdentifierForPath(v13);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NSString"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.1();
LABEL_48:
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68630);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68694);
  }

  v19 = v14;
  NSClassFromString(CFSTR("NSString"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA686F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA6875CLL);
  }

  v20 = v13;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.3();
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA687C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.3();
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68824);
  }

  v21 = v15;
  if (v21)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.8();
      goto LABEL_48;
    }
  }

  v22 = v16;
  NSClassFromString(CFSTR("NSArray"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.4();
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68888);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.4();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA688ECLL);
  }

  v23 = v17;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.5();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA68950);
  }
  v24 = v23;
  if ((objc_msgSend(v23, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest initWithPath:provider:configuredProperties:definitions:context:].cold.5();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA689B4);
  }

  v45.receiver = self;
  v45.super_class = (Class)PBFPosterSnapshotRequest;
  v25 = -[PBFPosterSnapshotRequest init](&v45, sel_init);
  if (v25)
  {
    PBFPosterSnapshotRequestIdentifierForPath(v20);
    v26 = objc_claimAutoreleasedReturnValue();
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    objc_storeStrong((id *)&v25->_path, a3);
    v28 = objc_msgSend(v21, "copy");
    configuredProperties = v25->_configuredProperties;
    v25->_configuredProperties = (PRPosterConfiguredProperties *)v28;

    v30 = objc_msgSend(v22, "copy");
    definitions = v25->_definitions;
    v25->_definitions = (NSArray *)v30;

    v25->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    v25->_intention = 2;
    v25->_powerLogReason = 0;
    v32 = objc_msgSend(v19, "copy");
    provider = v25->_provider;
    v25->_provider = (NSString *)v32;

    objc_storeStrong((id *)&v25->_displayContext, a7);
    v25->_loadFromCacheIfAvailable = 1;
    v25->_significantEventsCounter = 0;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPath:provider:configuredProperties:definitions:context:", self->_path, self->_provider, self->_configuredProperties, self->_definitions, self->_displayContext);
  *(_QWORD *)(v4 + 72) = self->_intention;
  *(_QWORD *)(v4 + 88) = self->_powerLogReason;
  v5 = -[NSString copy](self->_previewIdentifier, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 32) = self->_loadFromCacheIfAvailable;
  *(_QWORD *)(v4 + 80) = self->_significantEventsCounter;
  return (id)v4;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t significantEventsCounter;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_previewIdentifier, CFSTR("previewIdentifier"), 1);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_path, CFSTR("path"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_definitions, CFSTR("definitions"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_loadFromCacheIfAvailable, CFSTR("loadFromCacheIfAvailable"));
  significantEventsCounter = self->_significantEventsCounter;
  if (significantEventsCounter)
    v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", significantEventsCounter, CFSTR("_significantEventsCounter"));
  NSStringFromPBFPosterSnapshotRequestIntention(self->_intention);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("intention"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PBFPosterSnapshotRequest *v4;
  PBFPosterSnapshotRequest *v5;
  BOOL v6;

  v4 = (PBFPosterSnapshotRequest *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[PBFPosterSnapshotRequest isEqualToRequest:](self, "isEqualToRequest:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  return -[PBFPosterSnapshotRequest _isEqualToRequest:allowingOtherDefinitionsAreSubset:](self, "_isEqualToRequest:allowingOtherDefinitionsAreSubset:", a3, 0);
}

- (BOOL)containsRequest:(id)a3
{
  return -[PBFPosterSnapshotRequest _isEqualToRequest:allowingOtherDefinitionsAreSubset:](self, "_isEqualToRequest:allowingOtherDefinitionsAreSubset:", a3, 1);
}

- (BOOL)_isEqualToRequest:(id)a3 allowingOtherDefinitionsAreSubset:(BOOL)a4
{
  _BOOL4 v4;
  PBFPosterSnapshotRequest *v6;
  PBFPosterSnapshotRequest *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  id v44;

  v4 = a4;
  v6 = (PBFPosterSnapshotRequest *)a3;
  v7 = v6;
  if (v6 == self)
  {
    LOBYTE(v23) = 1;
    goto LABEL_18;
  }
  if (!v6)
    goto LABEL_17;
  -[PBFPosterSnapshotRequest identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotRequest identifier](v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualObjects();

  if (!v10)
    goto LABEL_17;
  -[PBFPosterSnapshotRequest path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isServerPosterPath");
  -[PBFPosterSnapshotRequest path](v7, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isServerPosterPath");

  if (v12 != v14)
    goto LABEL_17;
  -[PBFPosterSnapshotRequest path](self, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isServerPosterPath") & 1) == 0)
  {

LABEL_11:
    -[PBFPosterSnapshotRequest path](self, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotRequest path](v7, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentsURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = BSEqualObjects();

    if (!v28)
    {
LABEL_17:
      LOBYTE(v23) = 0;
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  -[PBFPosterSnapshotRequest path](v7, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isServerPosterPath");

  if (!v17)
    goto LABEL_11;
  -[PBFPosterSnapshotRequest path](self, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotRequest path](v7, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = BSEqualObjects();

  if ((v22 & 1) == 0)
    goto LABEL_17;
LABEL_12:
  -[PBFPosterSnapshotRequest displayContext](self, "displayContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotRequest displayContext](v7, "displayContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = BSEqualObjects();

  if (!v31)
    goto LABEL_17;
  v32 = -[PBFPosterSnapshotRequest significantEventsCounter](self, "significantEventsCounter");
  if (v32 != -[PBFPosterSnapshotRequest significantEventsCounter](v7, "significantEventsCounter"))
    goto LABEL_17;
  -[PBFPosterSnapshotRequest configuredProperties](self, "configuredProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotRequest configuredProperties](v7, "configuredProperties");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToConfiguredProperties:comparingPropertiesAffectingSnapshotsOnly:", v34, 1);

  if (!v35)
    goto LABEL_17;
  v36 = (void *)MEMORY[0x1E0C99E60];
  -[PBFPosterSnapshotRequest definitions](self, "definitions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0C99E60];
  -[PBFPosterSnapshotRequest definitions](v7, "definitions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __80__PBFPosterSnapshotRequest__isEqualToRequest_allowingOtherDefinitionsAreSubset___block_invoke;
    v43[3] = &unk_1E86F4D20;
    v44 = v38;
    v23 = objc_msgSend(v41, "bs_containsObjectPassingTest:", v43) ^ 1;

  }
  else
  {
    v23 = BSEqualObjects();
  }

LABEL_18:
  return v23;
}

uint64_t __80__PBFPosterSnapshotRequest__isEqualToRequest_allowingOtherDefinitionsAreSubset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (unint64_t)hash
{
  uint64_t cachedHash;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  cachedHash = self->_cachedHash;
  if (cachedHash == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "appendString:", self->_identifier);
    v6 = (id)objc_msgSend(v4, "appendString:", self->_previewIdentifier);
    -[PFServerPosterPath contentsURL](self->_path, "contentsURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "appendObject:", v7);

    -[PRPosterConfiguredProperties persistenceIdentifierWithComplications:](self->_configuredProperties, "persistenceIdentifierWithComplications:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v4, "appendObject:", v9);

    v11 = (id)objc_msgSend(v4, "appendObject:", self->_definitions);
    -[PBFPosterSnapshotRequest displayContext](self, "displayContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v4, "appendObject:", v12);

    v14 = (id)objc_msgSend(v4, "appendObject:", self->_provider);
    v15 = (id)objc_msgSend(v4, "appendInteger:", self->_significantEventsCounter);
    cachedHash = objc_msgSend(v4, "hash");
    self->_cachedHash = cachedHash;

  }
  return cachedHash;
}

- (id)snapshotURLForDefinition:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  PFServerPosterPath *path;
  PRPosterConfiguredProperties *configuredProperties;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterSnapshotRequest.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotDefinition"));

  }
  -[PBFPosterSnapshotRequest definitions](self, "definitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7 && -[PFServerPosterPath isServerPosterPath](self->_path, "isServerPosterPath"))
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    path = self->_path;
    configuredProperties = self->_configuredProperties;
    -[PBFPosterSnapshotRequest displayContext](self, "displayContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pbf_snapshotURLForPath:definition:configuredProperties:context:", path, v5, configuredProperties, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PBFPosterSnapshotRequest)requestWithPowerLogReason:(int64_t)a3
{
  PBFPosterSnapshotRequest *v3;

  if (self->_powerLogReason == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v3->_powerLogReason = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithIntention:(unint64_t)a3
{
  PBFPosterSnapshotRequest *v3;

  if (self->_intention == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v3->_intention = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithDisplayContext:(id)a3
{
  id v5;
  PBFPosterSnapshotRequest *v6;

  v5 = a3;
  if (-[PBFDisplayContext isEqualToDisplayContext:](self->_displayContext, "isEqualToDisplayContext:", v5))
  {
    v6 = self;
  }
  else
  {
    v6 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    objc_storeStrong((id *)&v6->_displayContext, a3);
  }

  return v6;
}

- (PBFPosterSnapshotRequest)requestWithDefinitions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  PBFPosterSnapshotRequest *v8;
  uint64_t v9;
  NSArray *definitions;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_definitions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  if (v7)
  {
    v8 = self;
  }
  else
  {
    v8 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v9 = objc_msgSend(v4, "copy");
    definitions = v8->_definitions;
    v8->_definitions = (NSArray *)v9;

  }
  return v8;
}

- (PBFPosterSnapshotRequest)requestWithLoadFromCacheIfAvailable:(BOOL)a3
{
  PBFPosterSnapshotRequest *v3;

  if (self->_loadFromCacheIfAvailable == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v3->_loadFromCacheIfAvailable = a3;
  }
  return v3;
}

- (PBFPosterSnapshotRequest)requestWithPreviewIdentifier:(id)a3
{
  id v4;
  PBFPosterSnapshotRequest *v5;
  uint64_t v6;
  NSString *previewIdentifier;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_previewIdentifier, "isEqualToString:", v4))
  {
    v5 = self;
  }
  else
  {
    v5 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v6 = objc_msgSend(v4, "copy");
    previewIdentifier = v5->_previewIdentifier;
    v5->_previewIdentifier = (NSString *)v6;

  }
  return v5;
}

- (PBFPosterSnapshotRequest)requestWithSignificantEventsCounter:(unint64_t)a3
{
  PBFPosterSnapshotRequest *v3;

  if (self->_significantEventsCounter == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = (PBFPosterSnapshotRequest *)-[PBFPosterSnapshotRequest copy](self, "copy");
    v3->_significantEventsCounter = a3;
  }
  return v3;
}

- (id)buildPUIPosterSnapshotRequestsForOutput:(unint64_t)a3 priority:(int64_t)a4 timeout:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  uint64_t v30;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PBFPosterSnapshotRequest path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotRequest buildPUIPosterSnapshotRequestsForOutput:priority:timeout:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA69848);
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  v9 = (void *)MEMORY[0x1E0D230A8];
  -[PBFPosterSnapshotRequest displayContext](self, "displayContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pbf_displayConfigurationForDisplayContext:", v10);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  if (!v41[5])
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayConfiguration");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v41[5];
      v41[5] = v12;

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke;
      block[3] = &unk_1E86F2990;
      block[4] = &v40;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
  }
  v33 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PBFPosterSnapshotRequest definitions](self, "definitions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v15)
  {
    obj = v14;
    v30 = *(_QWORD *)v36;
    do
    {
      v34 = v15;
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setSnapshotOptions:", objc_msgSend(MEMORY[0x1E0D7FB68], "snapshotOptionsForDefinition:", v17));
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", UIUserInterfaceStyleFromPBFUserInterfaceStyle(-[PBFDisplayContext pbf_userInterfaceStyle](self->_displayContext, "pbf_userInterfaceStyle")));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTraitCollection:", v20);

        objc_msgSend(v19, "setDisplayConfiguration:", v41[5]);
        objc_msgSend(v19, "setInterfaceOrientation:", -[PBFDisplayContext pbf_interfaceOrientation](self->_displayContext, "pbf_interfaceOrientation"));
        objc_msgSend(v19, "buildWithPath:provider:configuredProperties:snapshotDefinition:", v8, self->_provider, self->_configuredProperties, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_new();
        objc_msgSend(v21, "applyToMutableSceneSettings:", v22);
        objc_msgSend(v17, "levelSets");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bs_mapNoNulls:", &__block_literal_global_10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FD20]), "initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:", v8, v18, v22, a3, a4, v24, a5, 0, 0);
        objc_msgSend(v33, "setObject:forKey:", v25, v17);

      }
      v14 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v15);
  }

  v26 = (void *)objc_msgSend(v33, "copy");
  _Block_object_dispose(&v40, 8);

  return v26;
}

void __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __85__PBFPosterSnapshotRequest_buildPUIPosterSnapshotRequestsForOutput_priority_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D7FCF8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "levels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithSet:", v5);
  return v6;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (unint64_t)intention
{
  return self->_intention;
}

- (unint64_t)significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (int64_t)powerLogReason
{
  return self->_powerLogReason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)previewIdentifier
{
  return self->_previewIdentifier;
}

- (NSString)provider
{
  return self->_provider;
}

- (BOOL)loadFromCacheIfAvailable
{
  return self->_loadFromCacheIfAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
}

+ (id)snapshotRequestForConfiguration:(id)a3 withinSwitcherConfiguration:(id)a4 variant:(int64_t)a5 snapshotDefinitions:(id)a6 displayContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  PBFPosterSnapshotRequest *v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if ((unint64_t)(a5 + 1) >= 2)
  {
    if (a5 != 1)
      goto LABEL_13;
    objc_msgSend(v12, "configuredPropertiesForPoster:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homeScreenConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "selectedAppearanceType");
    if (v18 == 3)
    {
      objc_msgSend(v12, "_childPosterConfigurationForConfiguration:", v11);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18)
      {
        v15 = 0;
LABEL_11:

        if (v15)
          goto LABEL_12;
LABEL_13:
        v20 = 0;
        goto LABEL_14;
      }
      v19 = v11;
    }
    v15 = v19;
    goto LABEL_11;
  }
  v15 = v11;
  if (!v15)
    goto LABEL_13;
LABEL_12:
  v20 = -[PBFPosterSnapshotRequest initWithConfiguration:definitions:context:]([PBFPosterSnapshotRequest alloc], "initWithConfiguration:definitions:context:", v15, v13, v14);

LABEL_14:
  return v20;
}

+ (void)snapshotRequestForPreview:context:definition:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)snapshotRequestForPreview:context:definition:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)snapshotRequestForConfiguration:context:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)snapshotRequestForConfiguration:context:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)snapshotRequestForConfiguration:context:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:definitions:context:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:definitions:context:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDescriptor:configuredProperties:definitions:context:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDescriptor:configuredProperties:definitions:context:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPath:provider:configuredProperties:definitions:context:.cold.8()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)buildPUIPosterSnapshotRequestsForOutput:(const char *)a1 priority:timeout:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
