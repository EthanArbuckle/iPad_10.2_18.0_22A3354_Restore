@implementation PBFPosterSnapshotter

- (PBFPosterSnapshotter)initWithRequest:(id)a3 extensionProvider:(id)a4 runtimeAssertionProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PBFPosterSnapshotter *v19;
  void *v21;
  id obj;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("PBFPosterSnapshotRequest"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithRequest:extensionProvider:runtimeAssertionProvider:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4014);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithRequest:extensionProvider:runtimeAssertionProvider:].cold.1();
    goto LABEL_11;
  }
  obj = a3;

  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "definitions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuredProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "intention");
  objc_msgSend(v12, "previewIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:](self, "initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:", v10, v13, v14, v15, v16, v17, v18, objc_msgSend(v12, "significantEventsCounter"), v11);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_request, obj);
    -[PBFPosterSnapshotter setReadFromPosterPathCacheIfAvailable:](v19, "setReadFromPosterPathCacheIfAvailable:", objc_msgSend(v12, "loadFromCacheIfAvailable"));
  }

  return v19;
}

- (PBFPosterSnapshotter)initWithExtensionProvider:(id)a3 contents:(id)a4 definitions:(id)a5 configuredProperties:(id)a6 context:(id)a7 intention:(unint64_t)a8 previewIdentifier:(id)a9 significantEventsCounter:(unint64_t)a10 runtimeAssertionProvider:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  PBFPosterSnapshotter *v32;
  PBFPosterSnapshotter *v33;
  void *v34;
  uint64_t v35;
  NSString *providerIdentifier;
  uint64_t v37;
  PFPosterExtension *extension;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSString *identifier;
  void *v50;
  NSString *v51;
  void *v52;
  uint64_t v53;
  NSString *v54;
  uint64_t v55;
  NSArray *definitions;
  uint64_t v57;
  NSString *previewIdentifier;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  OS_dispatch_queue *backgroundQueue;
  uint64_t v64;
  NSMutableDictionary *lock_snapshotsByDefinition;
  uint64_t v66;
  NSMapTable *lock_snapshotImagesByDefinition;
  uint64_t v68;
  NSMutableArray *outstandingDefinitionsNeedingSnapshots;
  uint64_t v70;
  PRPosterConfiguredProperties *configuredProperties;
  uint64_t v72;
  NSHashTable *lock_observers;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v92;
  id v93;
  objc_super v95;

  v16 = a3;
  v92 = a4;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v93 = a7;
  v20 = a7;
  v21 = a9;
  v22 = a11;
  v23 = v17;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.1();
LABEL_50:
    objc_msgSend(objc_retainAutorelease(v75), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4590);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB45F4);
  }

  v24 = v19;
  if (v24)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.10();
      goto LABEL_50;
    }
  }

  v25 = v18;
  NSClassFromString(CFSTR("NSArray"));
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v77), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4658);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB46BCLL);
  }

  v26 = v22;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.3();
    objc_msgSend(objc_retainAutorelease(v79), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4720);
  }
  v27 = v26;
  if ((objc_msgSend(v26, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.3();
    objc_msgSend(objc_retainAutorelease(v80), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4784);
  }

  v28 = v16;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.4();
    objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB47E8);
  }
  v29 = v28;
  if ((objc_msgSend(v28, "conformsToProtocol:", &unk_1EF9CE9A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFExtensionProviding)]"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.4();
    objc_msgSend(objc_retainAutorelease(v82), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB484CLL);
  }

  v30 = v20;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.5();
    objc_msgSend(objc_retainAutorelease(v83), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB48B0);
  }
  v31 = v30;
  if ((objc_msgSend(v30, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.5();
    objc_msgSend(objc_retainAutorelease(v84), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB4914);
  }

  v95.receiver = self;
  v95.super_class = (Class)PBFPosterSnapshotter;
  v32 = -[PBFPosterSnapshotter init](&v95, sel_init);
  v33 = v32;
  if (v32)
  {
    v85 = v31;
    v87 = v27;
    v89 = v24;
    v90 = v21;
    v32->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v23, "identity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "provider");
    v35 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v33->_providerIdentifier;
    v33->_providerIdentifier = (NSString *)v35;

    v86 = v29;
    objc_msgSend(v29, "providerForExtensionIdentifier:", v33->_providerIdentifier);
    v37 = objc_claimAutoreleasedReturnValue();
    extension = v33->_extension;
    v33->_extension = (PFPosterExtension *)v37;

    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "UUIDString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "substringToIndex:", 7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v25;
    objc_msgSend(v25, "valueForKey:", CFSTR("uniqueIdentifier"));
    v43 = v23;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "componentsJoinedByString:", CFSTR(","));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SNAPSHOT_"), &stru_1E86FC5B8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString pathExtension](v33->_providerIdentifier, "pathExtension");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@-%@-(%@)"), v42, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v48;

    v23 = v43;
    objc_msgSend(v43, "descriptorIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = v33->_identifier;
      objc_msgSend(v43, "descriptorIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingFormat:](v51, "stringByAppendingFormat:", CFSTR("-(%@)"), v52);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v33->_identifier;
      v33->_identifier = (NSString *)v53;

    }
    objc_storeStrong((id *)&v33->_extensionProvider, a3);
    objc_storeStrong((id *)&v33->_serverPosterPath, v92);
    v25 = v88;
    v55 = objc_msgSend(v88, "copy");
    definitions = v33->_definitions;
    v33->_definitions = (NSArray *)v55;

    v21 = v90;
    v57 = objc_msgSend(v90, "copy");
    previewIdentifier = v33->_previewIdentifier;
    v33->_previewIdentifier = (NSString *)v57;

    objc_storeStrong((id *)&v33->_runtimeAssertionProvider, a11);
    objc_storeStrong((id *)&v33->_context, v93);
    v33->_significantEventsCounter = a10;
    v33->_readFromPosterPathCacheIfAvailable = 1;
    v59 = PBFDispatchQualityOfServiceFromPBFPosterSnapshotRequestIntention(a8);
    v60 = (void *)MEMORY[0x1E0D7F8F0];
    objc_msgSend(MEMORY[0x1E0D7F8F0], "snapshotWorkloop");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "concurrentQueueTargetingWorkloop:label:withQoS:", v61, v33->_identifier, v59);
    v62 = objc_claimAutoreleasedReturnValue();
    backgroundQueue = v33->_backgroundQueue;
    v33->_backgroundQueue = (OS_dispatch_queue *)v62;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v64 = objc_claimAutoreleasedReturnValue();
    lock_snapshotsByDefinition = v33->_lock_snapshotsByDefinition;
    v33->_lock_snapshotsByDefinition = (NSMutableDictionary *)v64;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v66 = objc_claimAutoreleasedReturnValue();
    lock_snapshotImagesByDefinition = v33->_lock_snapshotImagesByDefinition;
    v33->_lock_snapshotImagesByDefinition = (NSMapTable *)v66;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v68 = objc_claimAutoreleasedReturnValue();
    outstandingDefinitionsNeedingSnapshots = v33->_outstandingDefinitionsNeedingSnapshots;
    v33->_outstandingDefinitionsNeedingSnapshots = (NSMutableArray *)v68;

    v24 = v89;
    v70 = objc_msgSend(v89, "copy");
    configuredProperties = v33->_configuredProperties;
    v33->_configuredProperties = (PRPosterConfiguredProperties *)v70;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v72 = objc_claimAutoreleasedReturnValue();
    lock_observers = v33->_lock_observers;
    v33->_lock_observers = (NSHashTable *)v72;

    v29 = v86;
    v27 = v87;
    v31 = v85;
  }

  return v33;
}

- (PBFPosterSnapshotter)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFPosterSnapshotter *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PBFPosterSnapshotter *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please use a designated initializer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PBFPosterSnapshotter.m");
    v17 = 1024;
    v18 = 188;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFPosterSnapshotter *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (PBFPosterSnapshotter)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFPosterSnapshotter *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please use a designated initializer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("PBFPosterSnapshotter.m");
    v17 = 1024;
    v18 = 193;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFPosterSnapshotter *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  -[PBFPosterSnapshotRequest path](self->_request, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("extension"));

  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_request, CFSTR("request"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)dealloc
{
  RBSAssertion *extensionPrewarmRuntimeAssertion;
  objc_super v4;

  -[PBFPosterSnapshotter _cleanupWithCompletion:](self, "_cleanupWithCompletion:", 0);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeAllObjects](self->_lock_observers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  -[RBSAssertion invalidate](self->_extensionPrewarmRuntimeAssertion, "invalidate");
  extensionPrewarmRuntimeAssertion = self->_extensionPrewarmRuntimeAssertion;
  self->_extensionPrewarmRuntimeAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSnapshotter;
  -[PBFPosterSnapshotter dealloc](&v4, sel_dealloc);
}

- (BOOL)start
{
  const __CFString *providerIdentifier;
  void *v4;
  void *v5;
  void *v7;
  char v8;
  PFServerPosterPath *v9;
  dispatch_qos_class_t qos_class;
  NSObject *v11;
  NSString *v12;
  NSString *v13;
  PFServerPosterPath *v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  NSString *v18;
  NSString *v19;
  PFServerPosterPath *v20;
  const char *v21;
  NSObject *v22;
  NSString *v23;
  NSString *v24;
  PFServerPosterPath *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  NSString *v29;
  NSString *v30;
  PFServerPosterPath *v31;
  NSString *v32;
  NSString *v33;
  PFServerPosterPath *v34;
  NSObject *v35;
  NSString *v36;
  NSObject *v37;
  NSString *v38;
  NSString *identifier;
  PFServerPosterPath *serverPosterPath;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  NSString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  PFServerPosterPath *v48;
  __int16 v49;
  dispatch_qos_class_t v50;
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (!self->_extension)
  {
    providerIdentifier = CFSTR("(NULL)");
    if (self->_providerIdentifier)
      providerIdentifier = (const __CFString *)self->_providerIdentifier;
    v51 = CFSTR("providerIdentifier");
    v52[0] = providerIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2220, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v5);

    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (*(_WORD *)&self->_lock_started)
  {
    os_unfair_lock_unlock(&self->_lock);
    return 0;
  }
  self->_lock_started = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&_activeSnapshottersLock);
  ++_numberOfActiveSnapshotters;
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeSnapshottersLock);
  self->_lock_startTime = CFAbsoluteTimeGetCurrent();
  -[PFServerPosterPath supplementURL](self->_serverPosterPath, "supplementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v8 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", &v42);
  v9 = (PFServerPosterPath *)v42;

  if ((v8 & 1) == 0)
  {
    PBFLogSnapshotter();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      serverPosterPath = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = identifier;
      v45 = 2114;
      v46 = serverPosterPath;
      v47 = 2114;
      v48 = v9;
      _os_log_error_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_ERROR, "(%{public}@) Path does not exist; snapshotting cannot proceed; path %{public}@, error: %{public}@",
        buf,
        0x20u);
    }

    goto LABEL_36;
  }
  qos_class = dispatch_queue_get_qos_class((dispatch_queue_t)self->_backgroundQueue, 0);
  PBFLogSnapshotter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_identifier;
    v13 = self->_providerIdentifier;
    v14 = self->_serverPosterPath;
    *(_DWORD *)buf = 138544130;
    v44 = v12;
    v45 = 2112;
    v46 = v13;
    v47 = 2112;
    v48 = v14;
    v49 = 1024;
    v50 = qos_class;
    _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting snapshots for provider '%@' of path '%@' with QOS '%u'", buf, 0x26u);
  }

  v15 = -[PBFPosterSnapshotter _lock_populateSnapshotsFromAssetCatalogIfPossible](self, "_lock_populateSnapshotsFromAssetCatalogIfPossible");
  PBFLogSnapshotter();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      v18 = self->_identifier;
      v19 = self->_providerIdentifier;
      v20 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v18;
      v45 = 2112;
      v46 = v19;
      v47 = 2112;
      v48 = v20;
      v21 = "(%{public}@) Loaded snapshots for provider '%@' of path '%@' from asset catalog";
LABEL_19:
      _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 0x20u);
    }
  }
  else if (v17)
  {
    v23 = self->_identifier;
    v24 = self->_providerIdentifier;
    v25 = self->_serverPosterPath;
    *(_DWORD *)buf = 138543874;
    v44 = v23;
    v45 = 2112;
    v46 = v24;
    v47 = 2112;
    v48 = v25;
    v21 = "(%{public}@) No snapshots for provider '%@' of path '%@' were loaded from asset catalog";
    goto LABEL_19;
  }

  v26 = -[PBFPosterSnapshotter _lock_populateSnapshotsFromDiskIfPossible](self, "_lock_populateSnapshotsFromDiskIfPossible");
  PBFLogSnapshotter();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      v29 = self->_identifier;
      v30 = self->_providerIdentifier;
      v31 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v29;
      v45 = 2112;
      v46 = v30;
      v47 = 2112;
      v48 = v31;
      _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@) Loaded snapshots for provider '%@' of path '%@' from disk", buf, 0x20u);
    }

    self->_lock_didLoadAllFromDisk = -[PBFPosterSnapshotter _lock_didAccumulateAllSnapshots](self, "_lock_didAccumulateAllSnapshots");
  }
  else
  {
    if (v28)
    {
      v32 = self->_identifier;
      v33 = self->_providerIdentifier;
      v34 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v32;
      v45 = 2112;
      v46 = v33;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@) No snapshots for provider '%@' of path '%@' were loaded from disk", buf, 0x20u);
    }

  }
  if (-[PBFPosterSnapshotter _lock_didAccumulateAllSnapshots](self, "_lock_didAccumulateAllSnapshots"))
  {
    if (self->_lock_snapshotsRequestedTime == 0.0)
      self->_lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    PBFLogSnapshotter();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v44 = v36;
      _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "(%{public}@) All requested snapshot definitions were loaded.  Good to go.", buf, 0xCu);
    }

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_37;
  }
  PBFLogSnapshotter();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v44 = v38;
    _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshotter started.", buf, 0xCu);
  }

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __29__PBFPosterSnapshotter_start__block_invoke;
  v41[3] = &unk_1E86F2518;
  v41[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v41);
LABEL_36:
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
LABEL_37:
    -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v9);

  }
  return 1;
}

uint64_t __29__PBFPosterSnapshotter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_start");
}

- (NSDictionary)snapshotImagesByDefinition
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMapTable copy](self->_lock_snapshotImagesByDefinition, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSDictionary)snapshotsByDefinition
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_lock_snapshotsByDefinition, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (BOOL)checkIfSnapshotterIsPreparedToExecute:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;
  id v13;

  if (-[PBFPosterSnapshotter necessitatesExtensionInstance](self, "necessitatesExtensionInstance"))
  {
    v13 = 0;
    -[PBFPosterSnapshotter extensionInstanceWithError:](self, "extensionInstanceWithError:", &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = v6;
    if (v5)
    {
      v12 = 0;
      -[PBFPosterSnapshotter _fetchExtensionInstanceWithError:](self, "_fetchExtensionInstanceWithError:", &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;

      if (v8 && (objc_msgSend(v8, "isEqual:", v5) & 1) != 0)
      {
        v10 = 1;
LABEL_15:

        v7 = v9;
        goto LABEL_16;
      }
      if (v9)
      {
        if (a3)
        {
LABEL_9:
          v9 = objc_retainAutorelease(v9);
          v10 = 0;
          *a3 = v9;
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (a3)
          goto LABEL_9;
      }
      v10 = 0;
      goto LABEL_15;
    }
    if (v6)
    {
      if (a3)
      {
LABEL_12:
        v7 = objc_retainAutorelease(v7);
        v10 = 0;
        *a3 = v7;
LABEL_16:

        return v10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (a3)
        goto LABEL_12;
    }
    v10 = 0;
    goto LABEL_16;
  }
  return 1;
}

- (void)cancelWithReason:(id)a3
{
  -[PBFPosterSnapshotter _cancelWithErrorCode:reason:](self, "_cancelWithErrorCode:reason:", 4, a3);
}

- (void)_cancelWithErrorCode:(int64_t)a3 reason:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  PFPosterExtensionInstance *v34;
  _QWORD v35[6];
  _QWORD v36[7];

  v36[6] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (!-[PBFPosterSnapshotter isFinished](self, "isFinished")
    && !-[PBFPosterSnapshotter _wasCleanedUp](self, "_wasCleanedUp"))
  {
    v34 = self->_extensionInstance;
    -[PFPosterExtensionInstance extension](v34, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterExtensionInstance processIdentity](v34, "processIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E86FC5B8;
    v12 = v11;
    v33 = v12;

    -[PFServerPosterPath description](self->_serverPosterPath, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E86FC5B8;
    v16 = v15;

    v17 = -[NSString copy](self->_identifier, "copy");
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E86FC5B8;
    v20 = v19;

    -[NSArray description](self->_definitions, "description");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_1E86FC5B8;
    v24 = v23;

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v35[0] = CFSTR("cancelReason");
    v35[1] = CFSTR("processIdentityDescription");
    v26 = CFSTR("(No reason)");
    if (v6)
      v26 = v6;
    v36[0] = v26;
    v36[1] = v12;
    v35[2] = CFSTR("pathDescription");
    v35[3] = CFSTR("identifier");
    v36[2] = v16;
    v36[3] = v20;
    v36[4] = v24;
    v35[4] = CFSTR("definitionsDescription");
    v35[5] = CFSTR("extension");
    v27 = v7;
    objc_msgSend(v7, "description");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = CFSTR("unknown extension");
    if (v28)
      v30 = (const __CFString *)v28;
    v36[5] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pbf_generalErrorWithCode:userInfo:", a3, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v32);
  }

}

- (void)invalidate
{
  -[PBFPosterSnapshotter _cancelWithErrorCode:reason:](self, "_cancelWithErrorCode:reason:", 3, CFSTR("invalidated"));
}

- (int64_t)_snapshotSettingsInterfaceOrientation
{
  if ((MEMORY[0x1D17A2F74](self, a2) & 1) != 0)
    return 1;
  else
    return -[PBFDisplayContext pbf_interfaceOrientation](self->_context, "pbf_interfaceOrientation");
}

- (int64_t)_snapshotSettingsDeviceOrientation
{
  return -[PBFDisplayContext pbf_interfaceOrientation](self->_context, "pbf_interfaceOrientation");
}

- (void)_main_start
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) PrewarmRuntimeAssertion could not be acquired because there is no extension instance.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_7();
}

uint64_t __35__PBFPosterSnapshotter__main_start__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "includesComplications");
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogSnapshotter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __35__PBFPosterSnapshotter__main_start__block_invoke_178(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  __int16 v14;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PBFPosterSnapshotter__main_start__block_invoke_2;
  v5[3] = &unk_1E86F6C50;
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v13 = *(_DWORD *)(a1 + 136);
  v14 = *(_WORD *)(a1 + 140);
  v9 = *(_OWORD *)(a1 + 72);
  v6 = v4;
  v10 = *(_OWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 104);
  v12 = *(_OWORD *)(a1 + 120);
  objc_msgSend(a2, "updateSettingsWithBlock:", v5);

}

void __35__PBFPosterSnapshotter__main_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = 1;
  objc_msgSend(v6, "pui_setSnapshot:", 1);
  objc_msgSend(v6, "pui_setMode:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "pui_setContent:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "pr_setUnlockProgress:", *(double *)(a1 + 64));
  objc_msgSend(v6, "pui_setPreviewIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "titleStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pr_setPosterTitleStyleConfiguration:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "ambientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pr_setPosterAmbientConfiguration:", v5);

  objc_msgSend(v6, "pui_setInlineComplicationConfigured:", *(unsigned __int8 *)(a1 + 136));
  objc_msgSend(v6, "pui_setComplicationRowConfigured:", *(unsigned __int8 *)(a1 + 137));
  objc_msgSend(v6, "pui_setComplicationSidebarConfigured:", *(unsigned __int8 *)(a1 + 138));
  objc_msgSend(v6, "pui_setShowsComplications:", *(unsigned __int8 *)(a1 + 139));
  objc_msgSend(v6, "pui_setShowsHeaderElements:", *(unsigned __int8 *)(a1 + 140));
  objc_msgSend(v6, "pui_setSignificantEventsCounter:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v6, "pui_setUserInterfaceStyle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v6, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 141));
  objc_msgSend(v6, "setForeground:", 1);
  objc_msgSend(v6, "setDisplayConfiguration:", *(_QWORD *)(a1 + 40));
  if (MEMORY[0x1D17A2F74](objc_msgSend(v6, "setInterfaceOrientation:", *(_QWORD *)(a1 + 88))))
    v3 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v6, "pui_setDeviceOrientation:", v3);
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));

}

void __35__PBFPosterSnapshotter__main_start__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PBFPosterSnapshotter__main_start__block_invoke_4;
  block[3] = &unk_1E86F3C90;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_requestTimedOut");

}

- (void)_main_requestTimedOut
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (!-[PBFPosterSnapshotter isFinished](self, "isFinished")
    && !-[PBFPosterSnapshotter _wasCleanedUp](self, "_wasCleanedUp")
    && !-[PBFPosterSnapshotter _isProcessingReceivedSnapshots](self, "_isProcessingReceivedSnapshots")
    && !-[PBFPosterSnapshotter _isSceneReady](self, "_isSceneReady"))
  {
    -[PBFPosterSnapshotter extensionInstanceWithError:](self, "extensionInstanceWithError:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_1E86FC5B8;
    v8 = v7;

    -[PFServerPosterPath description](self->_serverPosterPath, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E86FC5B8;
    v12 = v11;

    v13 = -[NSString copy](self->_identifier, "copy");
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E86FC5B8;
    v16 = v15;

    -[NSArray description](self->_definitions, "description");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E86FC5B8;
    v20 = v19;

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v24[0] = CFSTR("processIdentityDescription");
    v24[1] = CFSTR("pathDescription");
    v25[0] = v8;
    v25[1] = v12;
    v24[2] = CFSTR("identifier");
    v24[3] = CFSTR("definitionsDescription");
    v25[2] = v16;
    v25[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pbf_generalErrorWithCode:userInfo:", 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v23);
  }
}

- (void)_finishWithError:(id)a3
{
  id v5;
  uint64_t v6;
  CFAbsoluteTime Current;
  double lock_snapshotsRequestedTime;
  NSObject *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSString *identifier;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_finished)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_activeSnapshottersLock);
  v6 = _numberOfActiveSnapshotters--;
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeSnapshottersLock);
  Current = CFAbsoluteTimeGetCurrent();
  self->_lock_endTime = Current;
  lock_snapshotsRequestedTime = self->_lock_snapshotsRequestedTime;
  PBFLogTelemetrySignposts();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER", " enableTelemetry=YES ", buf, 2u);
  }
  v10 = Current - lock_snapshotsRequestedTime;

  kdebug_trace();
  v11 = self->_lock_endTime - self->_lock_startTime;
  PBFLogSnapshotter();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "provider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v29 = identifier;
      v30 = 2112;
      v31 = v5;
      v32 = 2114;
      v33 = *(double *)&v25;
      v34 = 2048;
      v35 = *(double *)&v6;
      v36 = 2048;
      v37 = v11;
      _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "(%{public}@) Finished with error: %@ -- extension %{public}@ -- activeSnapshotters: %lu - elapsed time: %f", buf, 0x34u);

    }
    if (!self->_lock_didLoadAllFromDisk)
    {
      PBFLogSnapshotterBench();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "provider");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "descriptorIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v29 = v16;
        v30 = 2114;
        v31 = v18;
        v32 = 2048;
        v33 = v10;
        v34 = 2048;
        v35 = v11;
        v36 = 2114;
        v37 = *(double *)&v5;
        _os_log_error_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_ERROR, "%{public}@:%{public}@\tsnapshot time:%f\telapsed time:%f\terror:%{public}@", buf, 0x34u);
LABEL_16:

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_identifier;
      -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "provider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v29 = v19;
      v30 = 2114;
      v31 = v21;
      v32 = 2048;
      v33 = *(double *)&v6;
      v34 = 2048;
      v35 = v11;
      v36 = 2048;
      v37 = v10;
      _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully finished snapshotting extension %{public}@!  ActiveSnapshotters: %lu - elapsed time: %f  - snapshot time: %f", buf, 0x34u);

    }
    if (!self->_lock_didLoadAllFromDisk)
    {
      PBFLogSnapshotterBench();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "provider");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "descriptorIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v16;
        v30 = 2114;
        v31 = v18;
        v32 = 2048;
        v33 = v10;
        v34 = 2048;
        v35 = v11;
        _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@\tsnapshot time:%f\telapsed time:%f", buf, 0x2Au);
        goto LABEL_16;
      }
LABEL_17:

    }
  }
  if (v10 >= 5.0)
  {
    PBFLogSnapshotter();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter _finishWithError:].cold.2((uint64_t)self, v22);
    goto LABEL_24;
  }
  if (v10 >= 10.0)
  {
    PBFLogSnapshotter();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotter _finishWithError:].cold.1((uint64_t)self, v22);
LABEL_24:

  }
  if (!self->_lock_finished)
  {
    self->_lock_finished = 1;
    objc_storeStrong((id *)&self->_error, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke;
  v26[3] = &unk_1E86F2540;
  v26[4] = self;
  v27 = v5;
  -[PBFPosterSnapshotter _cleanupWithCompletion:](self, "_cleanupWithCompletion:", v26);

LABEL_28:
}

void __41__PBFPosterSnapshotter__finishWithError___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke_2;
  v2[3] = &unk_1E86F6CA0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_enumerateObservers:", v2);

}

void __41__PBFPosterSnapshotter__finishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D7F8F0], "snapshotWorkloop");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke_3;
  block[3] = &unk_1E86F3130;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __41__PBFPosterSnapshotter__finishWithError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotter:didFinishWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (double)elapsedTime
{
  os_unfair_lock_s *p_lock;
  double lock_endTime;
  double v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_started)
  {
    if (self->_lock_finished)
      lock_endTime = self->_lock_endTime;
    else
      lock_endTime = CFAbsoluteTimeGetCurrent();
    v5 = lock_endTime - self->_lock_startTime;
  }
  else
  {
    v5 = -1.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_enumerateObservers:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PBFPosterSnapshotter _lock_enumerateObservers:](self, "_lock_enumerateObservers:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_enumerateObservers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PBFPosterSnapshotter__lock_enumerateObservers___block_invoke;
  v7[3] = &unk_1E86F6CC8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __49__PBFPosterSnapshotter__lock_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_lock_populateSnapshotsFromAssetCatalogIfPossible
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSArray *obj;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[8];
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[PFServerPosterPath identity](self->_serverPosterPath, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    if (-[PBFPosterSnapshotter necessitatesExtensionInstance](self, "necessitatesExtensionInstance"))
    {
      v52 = 0;
      -[PBFPosterSnapshotter extensionInstanceWithError:](self, "extensionInstanceWithError:", &v52);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v52);
        return 0;
      }

    }
    PBFLogTelemetrySignposts();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_ASSET_CATALOG", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    -[PBFPosterSnapshotter extension](self, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterExtensionInfoPlist");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFServerPosterPath descriptorIdentifier](self->_serverPosterPath, "descriptorIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterExtensionBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterSnapshotRequest displayContext](self->_request, "displayContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "pbf_traitCollectionForDisplayContext:", v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLsForResourcesWithExtension:subdirectory:", CFSTR("car"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
    {
      v30 = v9;
      v31 = v8;
      v32 = v7;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = self->_definitions;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v48;
        v33 = *(_QWORD *)v48;
        v34 = v4;
        do
        {
          v14 = 0;
          v36 = v11;
          do
          {
            if (*(_QWORD *)v48 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v14);
            if (!-[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v15)&& v4 == 2)
            {
              objc_msgSend(v38, "pbf_staticSnapshotKeyForIdentifier:definition:", v37, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v40 = v14;
                if (_lock_populateSnapshotsFromAssetCatalogIfPossible_onceToken != -1)
                  dispatch_once(&_lock_populateSnapshotsFromAssetCatalogIfPossible_onceToken, &__block_literal_global_189_0);
                v45 = 0u;
                v46 = 0u;
                v43 = 0u;
                v44 = 0u;
                v41 = v35;
                v17 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v44;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v44 != v19)
                        objc_enumerationMutation(v41);
                      v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                      objc_msgSend(v12, "objectForKey:", v21);
                      v22 = objc_claimAutoreleasedReturnValue();
                      if (v22)
                      {
                        v23 = (void *)v22;
                      }
                      else
                      {
                        v24 = objc_alloc(MEMORY[0x1E0DC4020]);
                        v23 = (void *)objc_msgSend(v24, "initWithURL:idiom:error:", v21, _lock_populateSnapshotsFromAssetCatalogIfPossible_idiom, 0);
                        if (!v12)
                          v12 = (void *)objc_opt_new();
                        objc_msgSend(v12, "setObject:forKey:", v23, v21);
                      }
                      objc_msgSend(v23, "imageNamed:withTrait:", v16, v42);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v25)
                      {
                        PBFLogTelemetrySignposts();
                        v26 = objc_claimAutoreleasedReturnValue();
                        if (os_signpost_enabled(v26))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
                        }

                        kdebug_trace();
                        -[PBFPosterSnapshotter _lock_storeImage:definition:error:](self, "_lock_storeImage:definition:error:", v25, v15, 0);
                        PBFLogTelemetrySignposts();
                        v27 = objc_claimAutoreleasedReturnValue();
                        if (os_signpost_enabled(v27))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
                        }

                        kdebug_trace();
                      }

                    }
                    v18 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
                  }
                  while (v18);
                }

                v13 = v33;
                v4 = v34;
                v11 = v36;
                v14 = v40;
              }

            }
            ++v14;
          }
          while (v14 != v11);
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v8 = v31;
      v7 = v32;
      v9 = v30;
    }
    PBFLogTelemetrySignposts();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_ASSET_CATALOG", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  return 0;
}

void __73__PBFPosterSnapshotter__lock_populateSnapshotsFromAssetCatalogIfPossible__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  _lock_populateSnapshotsFromAssetCatalogIfPossible_idiom = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)_lock_populateSnapshotsFromDiskIfPossible
{
  NSObject *v3;
  NSString *identifier;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  NSString *v27;
  NSObject *v29;
  __int128 v31;
  NSString *v32;
  BOOL v33;
  NSArray *obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  NSString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const __CFString *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  PBFLogSnapshotter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v41 = identifier;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) _populateSnapshotsFromDiskIfPossible", buf, 0xCu);
  }

  v5 = -[PBFPosterSnapshotter readFromPosterPathCacheIfAvailable](self, "readFromPosterPathCacheIfAvailable");
  PBFLogSnapshotter();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attempting _populateSnapshotsFromDiskIfPossible; requested to read from disk",
        buf,
        0xCu);
    }

    PBFLogTelemetrySignposts();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_DISK", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = self->_definitions;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v10)
    {
      v12 = v10;
      v33 = 0;
      v13 = *(_QWORD *)v37;
      *(_QWORD *)&v11 = 138544130;
      v31 = v11;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14);
          if (!-[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v15, v31))
          {
            -[PBFPosterSnapshotter _encoderForDefinition:](self, "_encoderForDefinition:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0;
            objc_msgSend(v16, "createUIImageWithError:", &v35);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v35;

            objc_msgSend(v16, "url");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            PBFLogSnapshotter();
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v17)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v22 = self->_identifier;
                *(_DWORD *)buf = 138543874;
                v41 = v22;
                v42 = 2112;
                v43 = v15;
                v44 = 2112;
                v45 = v19;
                _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) _populateSnapshotsFromDiskIfPossible; loading image for defintion '%@'/%@",
                  buf,
                  0x20u);
              }

              -[NSMutableDictionary setObject:forKey:](self->_lock_snapshotsByDefinition, "setObject:forKey:", v19, v15);
              v33 = 1;
            }
            else
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v32 = self->_identifier;
                objc_msgSend(v18, "debugDescription");
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = (void *)v23;
                *(_DWORD *)buf = v31;
                v25 = CFSTR("no error");
                if (v23)
                  v25 = (const __CFString *)v23;
                v41 = v32;
                v42 = 2112;
                v43 = v15;
                v44 = 2112;
                v45 = v19;
                v46 = 2112;
                v47 = v25;
                _os_log_error_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_ERROR, "(%{public}@) _populateSnapshotsFromDiskIfPossible; file doesn't exist for definition '%@'/ %@. error=%@",
                  buf,
                  0x2Au);

              }
            }

          }
          ++v14;
        }
        while (v12 != v14);
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        v12 = v26;
      }
      while (v26);
    }
    else
    {
      v33 = 0;
    }

    if (-[PBFPosterSnapshotter _lock_didAccumulateAllSnapshots](self, "_lock_didAccumulateAllSnapshots"))
      self->_lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    PBFLogTelemetrySignposts();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_DISK", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    return v33;
  }
  else
  {
    if (v7)
    {
      v27 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Aborting _populateSnapshotsFromDiskIfPossible; requested to not read from disk",
        buf,
        0xCu);
    }

    return 0;
  }
}

- (BOOL)_lock_didAccumulateAllSnapshots
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[NSMutableDictionary count](self->_lock_snapshotsByDefinition, "count");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](self->_lock_snapshotsByDefinition, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_definitions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v6, "isEqualToSet:", v7);

    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (BOOL)_lock_isSnapshotPopulatedForDefinition:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_lock_snapshotsByDefinition, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)necessitatesExtensionInstance
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PBFPosterSnapshotter extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v28 = v3;
    objc_msgSend(v3, "posterExtensionInfoPlist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pbf_hasStaticSnapshotMapping");
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_definitions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    if (v5)
    {
      -[PFServerPosterPath descriptorIdentifier](self->_serverPosterPath, "descriptorIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v9 = self->_definitions;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v4, "pbf_staticSnapshotKeyForIdentifier:definition:", v8, v14, v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              objc_msgSend(v6, "addObject:", v14);
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v11);
      }

      v7 = v26;
    }
    if (-[PBFPosterSnapshotter readFromPosterPathCacheIfAvailable](self, "readFromPosterPathCacheIfAvailable", v26))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v7;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            if ((objc_msgSend(v6, "containsObject:", v21) & 1) == 0)
            {
              -[PBFPosterSnapshotter _encoderForDefinition:](self, "_encoderForDefinition:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "createUIImageWithError:", 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
                objc_msgSend(v6, "addObject:", v21);
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v18);
      }

      v7 = v27;
    }
    v24 = objc_msgSend(v6, "isEqualToSet:", v7) ^ 1;

    v3 = v28;
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (id)extensionInstanceWithError:(id *)a3
{
  PBFPosterSnapshotter *v4;
  PFPosterExtensionInstance *extensionInstance;
  uint64_t v6;
  id v7;
  PFPosterExtensionInstance *v8;
  PFPosterExtensionInstance *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  extensionInstance = v4->_extensionInstance;
  if (extensionInstance)
  {
    a3 = extensionInstance;
  }
  else if (-[PBFPosterSnapshotter necessitatesExtensionInstance](v4, "necessitatesExtensionInstance"))
  {
    v17 = 0;
    -[PBFPosterSnapshotter _fetchExtensionInstanceWithError:](v4, "_fetchExtensionInstanceWithError:", &v17);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = v4->_extensionInstance;
    v4->_extensionInstance = (PFPosterExtensionInstance *)v6;

    v9 = v4->_extensionInstance;
    if (a3 && !v9)
    {
      -[PFServerPosterPath identity](v4->_serverPosterPath, "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "provider");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = v11;
      else
        v12 = CFSTR("(NULL)");
      v18 = CFSTR("providerIdentifier");
      v19 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2220, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v4->_extensionInstance;
    }
    a3 = v9;

  }
  else if (a3)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("extension instance isn't needed for this; we can return;");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }
  objc_sync_exit(v4);

  return a3;
}

- (id)_fetchExtensionInstanceWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[PBFPosterSnapshotter extensionProvider](self, "extensionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireExtensionInstance:reason:error:", self->_providerIdentifier, CFSTR("Snapshotting"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_cleanupWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSString *identifier;
  PFPosterExtensionInstance *extensionInstance;
  PBFExtensionProviding *extensionProvider;
  void *v9;
  void *v10;
  BOOL v11;
  RBSAssertion *extensionPrewarmRuntimeAssertion;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PBFRuntimeAssertionProviding *runtimeAssertionProvider;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  FBScene *scene;
  RBSAssertion *v24;
  PFPosterExtension *extension;
  char v26;
  _QWORD block[4];
  void (**v28)(_QWORD);
  __int128 *p_buf;
  uint64_t *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  RBSAssertion *v45;
  _QWORD v46[5];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  PFPosterExtensionInstance *v53;
  _QWORD v54[5];
  PBFExtensionProviding *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  FBScene *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  PBFLogSnapshotter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Cleaning up Snapshotter", (uint8_t *)&buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_cleanedUp)
  {
    extensionInstance = self->_extensionInstance;
    if (extensionInstance)
    {
      extensionProvider = self->_extensionProvider;
      -[PFPosterExtensionInstance extension](extensionInstance, "extension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "posterExtensionBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFExtensionProviding relinquishExtensionInstance:reason:](extensionProvider, "relinquishExtensionInstance:reason:", v10, CFSTR("Snapshotting"));

    }
    v11 = 1;
  }
  else
  {
    self->_lock_cleanedUp = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__13;
    v59 = __Block_byref_object_dispose__13;
    v60 = self->_scene;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__13;
    v54[4] = __Block_byref_object_dispose__13;
    v55 = self->_extensionProvider;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__13;
    v52 = __Block_byref_object_dispose__13;
    v53 = self->_extensionInstance;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__13;
    v46[4] = __Block_byref_object_dispose__13;
    -[PFPosterExtensionInstance extension](self->_extensionInstance, "extension");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__13;
    v44 = __Block_byref_object_dispose__13;
    v45 = self->_extensionPrewarmRuntimeAssertion;
    extensionPrewarmRuntimeAssertion = self->_extensionPrewarmRuntimeAssertion;
    self->_extensionPrewarmRuntimeAssertion = 0;

    v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v11 = v13 == 0;
    if (v13)
    {
      v14 = (void *)-[NSString copy](self->_identifier, "copy");
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)v49[5], "processIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("PBFPosterSnapshotter cleanup is running for %@/%@; keep PosterBoard alive until invalidation complete"),
        v14,
        v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy__13;
      v38[4] = __Block_byref_object_dispose__13;
      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke;
      v35[3] = &unk_1E86F3AE8;
      v21 = v14;
      v36 = v21;
      v22 = v17;
      v37 = v22;
      -[PBFRuntimeAssertionProviding acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:](runtimeAssertionProvider, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", v22, v19, v35);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_201;
      block[3] = &unk_1E86F6D38;
      p_buf = &buf;
      v30 = &v40;
      v31 = v38;
      v32 = v54;
      v33 = v46;
      v34 = &v48;
      v28 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      _Block_object_dispose(v38, 8);
    }
    else
    {
      objc_msgSend((id)v41[5], "invalidate");
    }
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(&buf, 8);

  }
  scene = self->_scene;
  self->_scene = 0;

  -[RBSAssertion invalidate](self->_extensionPrewarmRuntimeAssertion, "invalidate");
  v24 = self->_extensionPrewarmRuntimeAssertion;
  self->_extensionPrewarmRuntimeAssertion = 0;

  extension = self->_extension;
  self->_extension = 0;

  os_unfair_lock_unlock(&self->_lock);
  v26 = !v11;
  if (!v4)
    v26 = 1;
  if ((v26 & 1) == 0)
    v4[2](v4);

}

void __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogSnapshotter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ reason: %{public}@;",
      (uint8_t *)&v8,
      0x16u);
  }

  if (v3)
  {
    PBFLogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_cold_1(a1, (uint64_t)v3, v7);

  }
}

void __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_201(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", 0);
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_2;
  v5[3] = &unk_1E86F6D10;
  v8 = v4;
  v9 = *(_QWORD *)(a1 + 80);
  v6 = v2;
  objc_msgSend(v3, "pui_invalidateWithCompletion:", v5);

}

uint64_t __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "invalidate");
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "posterExtensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relinquishExtensionInstance:reason:", v7, CFSTR("Snapshotting"));

  v8 = *(_QWORD *)(a1[9] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isFinished
{
  PBFPosterSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_hasStarted
{
  PBFPosterSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasCleanedUp
{
  PBFPosterSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cleanedUp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isProcessingReceivedSnapshots
{
  PBFPosterSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isProcessingReceivedSnapshots;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isSceneReady
{
  PBFPosterSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_sceneReady;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)createSnapshotUsingIOSurface:(id)a3 snapshotScale:(double)a4 imageEncoder:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  PBFLogSnapshotter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Creating snapshot from IOSurface with encoder '%@'", buf, 0xCu);
  }

  objc_msgSend(v10, "attachmentForKey:", *MEMORY[0x1E0D7FDB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v10, "attachmentForKey:", *MEMORY[0x1E0D7FDB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0DC3870], "pui_imageWithIOSurface:scale:orientation:", v10, PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v9, "writeThenReadBackImage:error:", v14, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v15)
  {
    objc_msgSend(v9, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0C999D8];
    v24 = v16;
    v19 = objc_msgSend(v17, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v18, &v24);
    v20 = v24;

    if ((v19 & 1) == 0)
    {
      PBFLogSnapshotter();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[PBFPosterSnapshotter createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:].cold.2();

    }
  }
  else
  {
    PBFLogSnapshotter();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[PBFPosterSnapshotter createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:].cold.1();

    if (a6)
    {
      v20 = objc_retainAutorelease(v16);
      v17 = 0;
      *a6 = v20;
    }
    else
    {
      v17 = 0;
      v20 = v16;
    }
  }

  return v17;
}

- (void)_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSString *identifier;
  _BOOL4 v16;
  _BOOL4 v17;
  NSString *v18;
  NSString *v19;
  id v20;
  PBFPosterSnapshotter *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  BOOL v29;
  NSObject *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  NSObject *v37;
  NSString *v38;
  NSObject *v39;
  __int128 v40;
  uint64_t v41;
  os_unfair_lock_t lock;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *context;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  NSString *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isProcessingReceivedSnapshots = 1;
  os_unfair_lock_unlock(&self->_lock);
  PBFLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
  }

  kdebug_trace();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[PBFPosterSnapshotter definitions](self, "definitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v51;
    v41 = *MEMORY[0x1E0CB2D68];
    *(_QWORD *)&v9 = 138543874;
    v40 = v9;
    v43 = *(_QWORD *)v51;
    v44 = v7;
    lock = &self->_lock;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (v4)
        {
          PBFLogSnapshotter();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            identifier = self->_identifier;
            *(_DWORD *)buf = v40;
            v57 = identifier;
            v58 = 2114;
            v59 = v13;
            v60 = 2114;
            v61 = v4;
            _os_log_error_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_ERROR, "(%{public}@) Skipping creation of snapshot for definition '%{public}@'; error occured - aborting creating "
              "snapshots: %{public}@",
              buf,
              0x20u);
          }
        }
        else
        {
          os_unfair_lock_lock(p_lock);
          v16 = -[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v13);
          os_unfair_lock_unlock(p_lock);
          PBFLogSnapshotter();
          v14 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v16)
          {
            if (v17)
            {
              v18 = self->_identifier;
              *(_DWORD *)buf = 138543618;
              v57 = v18;
              v58 = 2112;
              v59 = v13;
              _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping creation of snapshot for definition '%@'; already loaded",
                buf,
                0x16u);
            }
            v4 = 0;
          }
          else
          {
            if (v17)
            {
              v19 = self->_identifier;
              *(_DWORD *)buf = 138543618;
              v57 = v19;
              v58 = 2112;
              v59 = v13;
              _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Creating snapshot for definition '%@'", buf, 0x16u);
            }

            os_unfair_lock_lock(p_lock);
            -[NSMapTable objectForKey:](self->_lock_snapshotImagesByDefinition, "objectForKey:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            os_unfair_lock_unlock(p_lock);
            if (v14)
            {
              context = (void *)MEMORY[0x1D17A3580]();
              v20 = objc_alloc_init(MEMORY[0x1E0CB3620]);
              v21 = self;
              -[PBFPosterSnapshotter _encoderForDefinition:](self, "_encoderForDefinition:", v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "url");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "URLByDeletingLastPathComponent");
              v24 = objc_claimAutoreleasedReturnValue();

              PFFileProtectionNoneAttributes();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = 0;
              v45 = (void *)v24;
              v46 = v20;
              LODWORD(v24) = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v24, 1, v25, &v49);
              v26 = v49;

              if ((_DWORD)v24)
              {
                v48 = v26;
                objc_msgSend(v22, "saveUIImage:error:", v14, &v48);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v48;

                v29 = v27 != 0;
                v26 = v28;
              }
              else
              {
                v29 = 0;
              }
              self = v21;
              if (v29 || v26)
              {
                objc_msgSend(v22, "url", v40);
                v37 = objc_claimAutoreleasedReturnValue();
                os_unfair_lock_lock(lock);
                -[NSMutableDictionary setObject:forKey:](v21->_lock_snapshotsByDefinition, "setObject:forKey:", v37, v13);
                -[NSMapTable removeObjectForKey:](v21->_lock_snapshotImagesByDefinition, "removeObjectForKey:", v13);
                os_unfair_lock_unlock(lock);
              }
              else
              {
                PBFLogSnapshotter();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  v38 = v21->_identifier;
                  *(_DWORD *)buf = v40;
                  v57 = v38;
                  v58 = 2112;
                  v59 = v13;
                  v60 = 2112;
                  v61 = 0;
                  _os_log_error_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to write snapshot for definition '%@' due to error: '%@'.", buf, 0x20u);
                }
              }
              v11 = v43;
              v7 = v44;

              objc_autoreleasePoolPop(context);
              v4 = 0;
              p_lock = lock;
            }
            else
            {
              PBFLogSnapshotter();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = self->_identifier;
                *(_DWORD *)buf = 138543618;
                v57 = v31;
                v58 = 2112;
                v59 = v13;
                _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping creation of snapshot for definition '%@'; no image available",
                  buf,
                  0x16u);
              }

              v32 = (void *)MEMORY[0x1E0CB35C8];
              v54[0] = CFSTR("definition");
              objc_msgSend(v13, "uniqueIdentifier");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)v33;
              v35 = CFSTR("(NULL)");
              if (v33)
                v35 = (const __CFString *)v33;
              v54[1] = v41;
              v55[0] = v35;
              v55[1] = CFSTR("No image available for definition.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2, v40);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "pbf_generalErrorWithCode:userInfo:", 7, v36);
              v4 = (id)objc_claimAutoreleasedReturnValue();

              v11 = v43;
              v7 = v44;
            }
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v10);
  }

  PBFLogTelemetrySignposts();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
  }

  kdebug_trace();
  os_unfair_lock_lock(p_lock);
  self->_lock_isProcessingReceivedSnapshots = 0;
  os_unfair_lock_unlock(p_lock);
  -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v4);

}

- (id)_encoderForDefinition:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D7FCD8], "pbf_imageEncoderForPath:definition:configuredProperties:context:", self->_serverPosterPath, a3, self->_configuredProperties, self->_context);
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSString *identifier;
  NSString *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[PBFPosterSnapshotter isFinished](self, "isFinished"))
  {
    PBFLogSnapshotter();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        v12 = 138543874;
        v13 = identifier;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_error_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_ERROR, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v12, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_identifier;
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneWillDeactivate:'%@'", (uint8_t *)&v12, 0x16u);
    }

    -[PBFPosterSnapshotter _finishWithError:](self, "_finishWithError:", v7);
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *identifier;
  int v7;
  NSString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBFLogSnapshotter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v7 = 138543618;
    v8 = identifier;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneContentStateDidChange:'%@'", (uint8_t *)&v7, 0x16u);
  }

  -[PBFPosterSnapshotter _captureSnapshotWithScene:](self, "_captureSnapshotWithScene:", v4);
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a4, "pui_extendedRenderSessionDidChange"))
    -[PBFPosterSnapshotter _captureSnapshotWithScene:](self, "_captureSnapshotWithScene:", v8);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *identifier;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PBFLogSnapshotter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v26 = identifier;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received actions: %{public}@", buf, 0x16u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_self();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = objc_msgSend(v15, "isValid");

          if (v17)
          {
            PBFLogSnapshotter();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = self->_identifier;
              *(_DWORD *)buf = 138543362;
              v26 = v19;
              _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Complication rendering complete", buf, 0xCu);
            }

            self->_complicationRenderingCompleted = 1;
            -[PBFPosterSnapshotter _captureSnapshotWithScene:](self, "_captureSnapshotWithScene:", v6);
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

}

- (void)_captureSnapshotWithScene:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSString *v8;
  const char *v9;
  NSString *identifier;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "contentState") != 2)
  {
    PBFLogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v29 = identifier;
      v9 = "(%{public}@) Aborting capture, Scene content state not ready";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pui_inExtendedRenderSession");

  if (v6)
  {
    PBFLogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      v9 = "(%{public}@) Aborting capture, scene is in extended render session";
LABEL_7:
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!self->_complicationRenderingCompleted && self->_shouldWaitForComplicationRendering)
  {
    PBFLogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v12 = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    v9 = "(%{public}@) Aborting capture, complication rendering not completed";
    goto LABEL_7;
  }
  if (self->_isCapturingSnapshots)
  {
    PBFLogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v11 = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v29 = v11;
    v9 = "(%{public}@) Aborting capture, ~already~ capturing snapshots";
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "contentState") == 2)
  {
    self->_isCapturingSnapshots = 1;
    PBFLogSnapshotter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot is capturing", buf, 0xCu);
    }

    PBFLogTelemetrySignposts();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_SPINUP_SCENE", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    os_unfair_lock_lock(&self->_lock);
    self->_lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    self->_lock_sceneReady = 1;
    os_unfair_lock_unlock(&self->_lock);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = self->_definitions;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          v22 = -[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v21, (_QWORD)v23);
          os_unfair_lock_unlock(&self->_lock);
          if (!v22)
            -[NSMutableArray addObject:](self->_outstandingDefinitionsNeedingSnapshots, "addObject:", v21);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

    -[PBFPosterSnapshotter _processOutstandingSnapshotDefinitionsWithScene:](self, "_processOutstandingSnapshotDefinitionsWithScene:", v4);
  }
LABEL_9:

}

- (void)_processOutstandingSnapshotDefinitionsWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  NSObject *backgroundQueue;
  _QWORD v16[4];
  NSString *v17;
  id v18;
  PBFPosterSnapshotter *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PBFPosterSnapshotter isFinished](self, "isFinished")
    && !-[PBFPosterSnapshotter _wasCleanedUp](self, "_wasCleanedUp"))
  {
    -[NSMutableArray firstObject](self->_outstandingDefinitionsNeedingSnapshots, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "pbf_traitCollectionForDisplayContext:", self->_context);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[PBFPosterSnapshotDefinition snapshotOptionsForDefinition:](PBFPosterSnapshotDefinition, "snapshotOptionsForDefinition:", v5);
      v8 = objc_msgSend(v6, "userInterfaceStyle");
      v9 = self->_identifier;
      PBFLogSnapshotter();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "identityToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromPRSPosterSnapshotOptions();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v26 = v9;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v12;
        v31 = 2048;
        v32 = v8;
        _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) Taking snapshot for scene '%@' with options '%@' with interface style '%ld'", buf, 0x2Au);

      }
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_211;
      v22[3] = &unk_1E86F6D60;
      v23 = v5;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2;
      v16[3] = &unk_1E86F6DF0;
      v17 = v9;
      v21 = v7;
      v18 = v4;
      v19 = self;
      v20 = v23;
      v14 = v9;
      objc_msgSend(v18, "prui_setupSceneForSnapshottingWithOptions:traitCollection:updater:completion:", v7, v6, v22, v16);

    }
    else
    {
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke;
      block[3] = &unk_1E86F2518;
      block[4] = self;
      dispatch_async(backgroundQueue, block);
    }

  }
}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:", 0);
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_211(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "pui_setPreviewContent:", objc_msgSend(v3, "previewContent"));
  objc_msgSend(v4, "pui_setMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));

}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  void *v34;
  _QWORD block[5];
  id v36;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v29 = 0;
    v30 = (id *)&v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__13;
    v33 = __Block_byref_object_dispose__13;
    v34 = 0;
    objc_msgSend(*(id *)(a1 + 40), "prui_snapshotContextConfiguredWithOptions:", *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (PRSPosterSnapshotOptionsIsFloatingLayerOnly())
    {
      objc_msgSend(*(id *)(a1 + 40), "layerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      objc_msgSend(v6, "layersToExclude");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 == v11)
      {
        if (PBFPosterSnapshotterTimeoutInterval_block_invoke_onceToken != -1)
          dispatch_once(&PBFPosterSnapshotterTimeoutInterval_block_invoke_onceToken, &__block_literal_global_215_0);
        objc_storeStrong(v30 + 5, (id)PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage);
      }
    }
    if (v30[5])
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "prui_createSnapshotWithContext:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "capture");
    v17 = *(void **)(a1 + 56);
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_4;
    v22[3] = &unk_1E86F6DC8;
    v28 = &v29;
    v23 = v12;
    v19 = v17;
    v20 = *(_QWORD *)(a1 + 48);
    v24 = v19;
    v25 = v20;
    v26 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v21 = v12;
    dispatch_async(v18, v22);

    _Block_object_dispose(&v29, 8);
    v16 = v34;
  }
  else
  {
    PBFLogSnapshotter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_cold_1(a1, (uint64_t)v5, v13);

    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(NSObject **)(v14 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_213;
    block[3] = &unk_1E86F2540;
    block[4] = v14;
    v36 = v5;
    dispatch_async(v15, block);
    v16 = v36;
  }

}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:", *(_QWORD *)(a1 + 40));
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_214()
{
  void *v0;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;

  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredRange:", 0x7FFFLL);
  objc_msgSend(v8, "setOpaque:", 0);
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 1.0, 1.0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_3;
  v9[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #1.0 }
  v10 = _Q0;
  objc_msgSend(v0, "imageWithActions:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage;
  PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage = v6;

}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v2, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  BSRectWithSize();
  objc_msgSend(v4, "fillRect:");

}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    || (objc_msgSend(MEMORY[0x1E0DC3870], "pui_imageFromSceneSnapshot:", *(_QWORD *)(a1 + 32)),
        v2 = objc_claimAutoreleasedReturnValue(),
        v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
        v4 = *(void **)(v3 + 40),
        *(_QWORD *)(v3 + 40) = v2,
        v4,
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
  {
    objc_msgSend(*(id *)(a1 + 40), "persistenceScale");
    if ((BSFloatIsOne() & 1) == 0)
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "persistenceScale");
      objc_msgSend(v5, "pui_scaleImage:");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "removeObject:", *(_QWORD *)(a1 + 40));
  PBFLogSnapshotter();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Created snapshot for scene '%@' with definition '%@'", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_221;
  v13[3] = &unk_1E86F2540;
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_221(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processOutstandingSnapshotDefinitionsWithScene:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_lock_storeImage:(id)a3 definition:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  NSString *providerIdentifier;
  PFServerPosterPath *serverPosterPath;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  NSString *identifier;
  NSString *v23;
  NSString *v24;
  PFServerPosterPath *v25;
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  PFServerPosterPath *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[PBFPosterSnapshotter necessitatesExtensionInstance](self, "necessitatesExtensionInstance"))
  {
    -[PBFPosterSnapshotter extensionInstanceWithError:](self, "extensionInstanceWithError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      PBFLogSnapshotter();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543362;
        v28 = identifier;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping store of snapshot; no extension could be found.",
          buf,
          0xCu);
      }

      goto LABEL_17;
    }

  }
  if (!v8)
  {
LABEL_17:
    v17 = 0;
    v19 = 0;
    goto LABEL_18;
  }
  PBFLogSnapshotter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_identifier;
    providerIdentifier = self->_providerIdentifier;
    serverPosterPath = self->_serverPosterPath;
    *(_DWORD *)buf = 138544130;
    v28 = v12;
    v29 = 2114;
    v30 = providerIdentifier;
    v31 = 2114;
    v32 = serverPosterPath;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Loaded snapshots for providerIdentifier '%{public}@' of path '%{public}@' for definition '%{public}@'", buf, 0x2Au);
  }

  -[PBFPosterSnapshotter _encoderForDefinition:](self, "_encoderForDefinition:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v15, "saveUIImage:error:", v8, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (!v16)
  {
    PBFLogSnapshotter();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_identifier;
      v24 = self->_providerIdentifier;
      v25 = self->_serverPosterPath;
      *(_DWORD *)buf = 138544386;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v33 = 2114;
      v34 = v9;
      v35 = 2112;
      v36 = v17;
      _os_log_error_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to write snapshot to disk for providerIdentifier '%{public}@' of path '%{public}@' for definition '%{public}@': %@", buf, 0x34u);
    }

  }
  v19 = 1;
  if (a5 && v17)
  {
    v17 = objc_retainAutorelease(v17);
    *a5 = v17;
  }
LABEL_18:

  return v19;
}

- (PFPosterExtension)extension
{
  return self->_extension;
}

- (BOOL)readFromPosterPathCacheIfAvailable
{
  return self->_readFromPosterPathCacheIfAvailable;
}

- (void)setReadFromPosterPathCacheIfAvailable:(BOOL)a3
{
  self->_readFromPosterPathCacheIfAvailable = a3;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (NSError)error
{
  return self->_error;
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFExtensionProviding)extensionProvider
{
  return self->_extensionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_serverPosterPath, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_extensionPrewarmRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingDefinitionsNeedingSnapshots, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_snapshotImagesByDefinition, 0);
  objc_storeStrong((id *)&self->_lock_snapshotsByDefinition, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)initWithRequest:extensionProvider:runtimeAssertionProvider:.cold.1()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.1()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.2()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.3()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.4()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.5()
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

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.10()
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

- (void)_finishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[72];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 184), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 184), "descriptorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 184), "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_2(&dword_1CB9FA000, a2, v9, "(%{public}@) Execution time exceeded %d seconds (elapsed time: %f) -- extension: %{public}@ / descriptor: %{public}@ / posterUUID:%{public}@ -- Please File a radar because this is really long", v10);

  OUTLINED_FUNCTION_9_1();
}

- (void)_finishWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[72];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 184), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 184), "descriptorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 184), "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_2(&dword_1CB9FA000, a2, v9, "(%{public}@) Execution time exceeded %d seconds (elapsed time: %f) -- extension: %{public}@ / descriptor: %{public}@ / posterUUID:%{public}@ -- Please File a radar because this is really long", v10);

  OUTLINED_FUNCTION_9_1();
}

void __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, a2, a3, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ error: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7();
}

+ (void)createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to write snapshot with encoder '%@' due to error: '%@'.");
  OUTLINED_FUNCTION_7();
}

+ (void)createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to exclude snapshot at url: '%@' from backup due to error: '%@'");
  OUTLINED_FUNCTION_7();
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  NSStringFromPRSPosterSnapshotOptions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v6;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_1CB9FA000, a3, OS_LOG_TYPE_ERROR, "(%@) Failed to create snapshot for scene '%@' with options '%@' due to scene update error: '%@'", (uint8_t *)&v8, 0x2Au);

}

@end
