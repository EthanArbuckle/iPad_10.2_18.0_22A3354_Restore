@implementation PRIncomingPosterConfiguration

- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PRIncomingPosterConfiguration *v18;
  PRIncomingPosterConfiguration *v19;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v13;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63C628);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
    goto LABEL_11;
  }

  v18 = -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:](self, "initWithType:path:sourceIdentity:configuredProperties:attributes:", 2, v12, v14, v15, v16);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationUUID, a4);
    objc_storeStrong((id *)&v19->_originalPosterUUID, a4);
  }

  return v19;
}

- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PRIncomingPosterConfiguration *v22;
  PRIncomingPosterConfiguration *v23;
  void *v25;
  void *v26;
  void *v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v15;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63C82CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63C890);
  }

  v21 = v16;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63C8F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.2(a2);
    goto LABEL_19;
  }

  v22 = -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:](self, "initWithType:path:sourceIdentity:configuredProperties:attributes:", 5, v14, v17, v18, v19);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_destinationUUID, a4);
    objc_storeStrong((id *)&v23->_parentPosterUUID, a5);
  }

  return v23;
}

- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PRIncomingPosterConfiguration *v22;
  NSUUID *v23;
  NSUUID *destinationUUID;
  void *v26;
  void *v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v15;
  if (v20)
  {
    NSClassFromString(CFSTR("NSUUID"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.3();
LABEL_19:
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B63CB14);
    }
  }

  v21 = v16;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63CB78);
  }

  v22 = -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:](self, "initWithType:path:sourceIdentity:configuredProperties:attributes:", 4, v14, v17, v18, v19);
  if (v22)
  {
    if (v20)
    {
      v23 = (NSUUID *)v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v23 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    destinationUUID = v22->_destinationUUID;
    v22->_destinationUUID = v23;

    objc_storeStrong((id *)&v22->_parentPosterUUID, a5);
  }

  return v22;
}

- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PRIncomingPosterConfiguration *v18;
  NSUUID *v19;
  NSUUID *destinationUUID;
  PRIncomingPosterConfiguration *result;
  void *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v13;
  if (v17 && (NSClassFromString(CFSTR("NSUUID")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    result = (PRIncomingPosterConfiguration *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v18 = -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:](self, "initWithType:path:sourceIdentity:configuredProperties:attributes:", 1, v12, v14, v15, v16);
    if (v18)
    {
      if (v17)
      {
        v19 = (NSUUID *)v17;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      destinationUUID = v18->_destinationUUID;
      v18->_destinationUUID = v19;

    }
    return v18;
  }
  return result;
}

- (PRIncomingPosterConfiguration)initWithConfigurationToDuplicate:(id)a3 destinationPosterUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PRIncomingPosterConfiguration *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSUUID *originalPosterUUID;
  NSUUID *v19;
  NSUUID *destinationUUID;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63CF38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63CF9CLL);
  }

  v9 = v7;
  if (v9)
  {
    NSClassFromString(CFSTR("NSUUID"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:].cold.2();
      goto LABEL_19;
    }
  }

  objc_msgSend(v8, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadConfiguredPropertiesWithError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:](self, "initWithType:path:sourceIdentity:configuredProperties:attributes:", 3, v10, v12, v13, 0);

  if (v14)
  {
    objc_msgSend(v8, "_path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterUUID");
    v17 = objc_claimAutoreleasedReturnValue();
    originalPosterUUID = v14->_originalPosterUUID;
    v14->_originalPosterUUID = (NSUUID *)v17;

    if (v9)
    {
      v19 = (NSUUID *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    destinationUUID = v14->_destinationUUID;
    v14->_destinationUUID = v19;

  }
  return v14;
}

- (PRIncomingPosterConfiguration)initWithType:(unint64_t)a3 path:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PRIncomingPosterConfiguration *v20;
  PRIncomingPosterConfiguration *v21;
  uint64_t v22;
  NSUUID *destinationUUID;
  uint64_t v24;
  NSDictionary *attributes;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v13;
  NSClassFromString(CFSTR("PFPosterPath"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D1F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D258);
  }

  v18 = v14;
  NSClassFromString(CFSTR("PFServerPosterIdentity"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D2BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterIdentityClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D320);
  }

  v19 = v15;
  NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D384);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:].cold.3();
    goto LABEL_27;
  }

  v32.receiver = self;
  v32.super_class = (Class)PRIncomingPosterConfiguration;
  v20 = -[PRIncomingPosterConfiguration init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_path, a4);
    objc_storeStrong((id *)&v21->_sourceIdentity, a5);
    objc_storeStrong((id *)&v21->_configuredProperties, a6);
    v21->_incomingPosterType = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = objc_claimAutoreleasedReturnValue();
    destinationUUID = v21->_destinationUUID;
    v21->_destinationUUID = (NSUUID *)v22;

    v24 = objc_msgSend(v16, "copy");
    attributes = v21->_attributes;
    v21->_attributes = (NSDictionary *)v24;

  }
  return v21;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableSet *temporaryState;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_temporaryState;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "invalidate");
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  temporaryState = self->_temporaryState;
  self->_temporaryState = 0;

  v10.receiver = self;
  v10.super_class = (Class)PRIncomingPosterConfiguration;
  -[PRIncomingPosterConfiguration dealloc](&v10, sel_dealloc);
}

- (id)_path
{
  return self->_path;
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PFPosterPath contentsURL](self->_path, "contentsURL");
}

- (NSString)descriptorIdentifier
{
  return (NSString *)-[PFPosterPath descriptorIdentifier](self->_path, "descriptorIdentifier");
}

- (NSString)role
{
  return (NSString *)-[PFPosterPath role](self->_path, "role");
}

- (id)objectForUserInfoKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration objectForUserInfoKey:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B63D63CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRIncomingPosterConfiguration objectForUserInfoKey:].cold.1();
    goto LABEL_9;
  }

  -[PRIncomingPosterConfiguration loadUserInfoWithError:](self, "loadUserInfoWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)-[PFPosterPath loadUserInfoWithError:](self->_path, "loadUserInfoWithError:", a3);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[PFPosterPath contentsURL](self->_path, "contentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[PFServerPosterIdentity hash](self->_sourceIdentity, "hash");
  v6 = v5 ^ -[PRPosterConfiguredProperties hash](self->_configuredProperties, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PRIncomingPosterConfiguration *v4;
  uint64_t v5;
  int v6;
  PFPosterPath *path;
  void *v8;
  void *v9;
  char v10;

  v4 = (PRIncomingPosterConfiguration *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualObjects() && BSEqualObjects())
    {
      v6 = -[PFPosterPath isServerPosterPath](self->_path, "isServerPosterPath");
      path = self->_path;
      if (v6)
      {
        -[PFPosterPath contentsURL](path, "contentsURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFPosterPath contentsURL](v4->_path, "contentsURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = BSEqualObjects();

      }
      else
      {
        v10 = -[PFPosterPath isEqual:](path, "isEqual:", v4->_path);
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterIdentity provider](self->_sourceIdentity, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p provider=%@ path=%@>"), v5, self, v6, self->_path);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)trackTemporaryState:(id)a3
{
  id v4;
  NSMutableSet *temporaryState;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  temporaryState = self->_temporaryState;
  v8 = v4;
  if (!temporaryState)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_temporaryState;
    self->_temporaryState = v6;

    v4 = v8;
    temporaryState = self->_temporaryState;
  }
  -[NSMutableSet addObject:](temporaryState, "addObject:", v4);

}

- (unint64_t)incomingPosterType
{
  return self->_incomingPosterType;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSUUID)destinationUUID
{
  return self->_destinationUUID;
}

- (NSUUID)originalPosterUUID
{
  return self->_originalPosterUUID;
}

- (NSUUID)parentPosterUUID
{
  return self->_parentPosterUUID;
}

- (PFServerPosterIdentity)sourceIdentity
{
  return self->_sourceIdentity;
}

- (void)setSourceIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentity, a3);
}

- (PFPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_sourceIdentity, 0);
  objc_storeStrong((id *)&self->_parentPosterUUID, 0);
  objc_storeStrong((id *)&self->_originalPosterUUID, 0);
  objc_storeStrong((id *)&self->_destinationUUID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_temporaryState, 0);
}

- (void)initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatedPath:(const char *)a1 updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.3()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurationToDuplicate:destinationPosterUUID:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfigurationToDuplicate:destinationPosterUUID:.cold.2()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.2()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.3()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)objectForUserInfoKey:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
