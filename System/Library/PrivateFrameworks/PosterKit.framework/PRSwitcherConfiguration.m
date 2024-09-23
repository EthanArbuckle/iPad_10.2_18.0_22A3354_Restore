@implementation PRSwitcherConfiguration

- (id)_initWithConfigurations:(id)a3 selectedConfiguration:(id)a4 activeConfiguration:(id)a5 associatedHomeScreenConfigurations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PRSwitcherConfiguration *v18;
  PRSwitcherConfiguration *v19;
  uint64_t v20;
  NSArray *configurations;
  uint64_t v22;
  NSMapTable *associatedHomeScreenConfigurationsForServerIdentity;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  NSClassFromString(CFSTR("NSArray"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.1();
LABEL_29:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D69D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D6A30);
  }

  v15 = v11;
  if (v15)
  {
    NSClassFromString(CFSTR("PRPosterConfiguration"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.5();
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6D6B44);
    }
  }

  v16 = v12;
  if (v16)
  {
    NSClassFromString(CFSTR("PRPosterConfiguration"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.4();
      goto LABEL_29;
    }
  }

  v17 = v13;
  NSClassFromString(CFSTR("NSMapTable"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D6A8CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSMapTableClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D6AE8);
  }

  v30.receiver = self;
  v30.super_class = (Class)PRSwitcherConfiguration;
  v18 = -[PRSwitcherConfiguration init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_activeConfiguration, a5);
    objc_storeStrong((id *)&v19->_selectedConfiguration, a4);
    v20 = objc_msgSend(v14, "copy");
    configurations = v19->_configurations;
    v19->_configurations = (NSArray *)v20;

    v22 = objc_msgSend(v17, "copy");
    associatedHomeScreenConfigurationsForServerIdentity = v19->_associatedHomeScreenConfigurationsForServerIdentity;
    v19->_associatedHomeScreenConfigurationsForServerIdentity = (NSMapTable *)v22;

  }
  return v19;
}

- (id)_initWithCollection:(id)a3 activeConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PRSwitcherConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "selectedPoster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
  {
    objc_msgSend(v6, "orderedPosters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedPoster");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedHomeScreenConfigurationsMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:](self, "_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:", v11, v12, v7, v13);

    if (v14)
      objc_msgSend(v14, "setCollection:", v6);
    self = (PRSwitcherConfiguration *)v14;
    v9 = self;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRMutableSwitcherConfiguration *v4;
  void *v5;
  PRPosterConfiguration *activeConfiguration;
  PRPosterConfiguration *selectedConfiguration;
  void *v8;
  id v9;

  v4 = +[PRMutableSwitcherConfiguration allocWithZone:](PRMutableSwitcherConfiguration, "allocWithZone:", a3);
  v5 = (void *)-[NSArray copy](self->_configurations, "copy");
  selectedConfiguration = self->_selectedConfiguration;
  activeConfiguration = self->_activeConfiguration;
  v8 = (void *)-[NSMapTable copy](self->_associatedHomeScreenConfigurationsForServerIdentity, "copy");
  v9 = -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:](v4, "_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:", v5, selectedConfiguration, activeConfiguration, v8);

  objc_msgSend(v9, "setCollection:", self->_collection);
  return v9;
}

- (PRPosterCollection)collection
{
  PRPosterCollection *collection;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  PRPosterCollection *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PRPosterCollection *v25;
  PRPosterCollection *v26;
  PRPosterCollection *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  collection = self->_collection;
  if (collection)
    return collection;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[PRSwitcherConfiguration configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        -[PRSwitcherConfiguration associatedHomeScreenConfigurationsForServerIdentity](self, "associatedHomeScreenConfigurationsForServerIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v10, "_path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isServerPosterPath");

          if (v16)
          {
            objc_msgSend(v10, "_path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "serverIdentity");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "posterUUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v14, v19);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  v20 = [PRPosterCollection alloc];
  -[PRSwitcherConfiguration selectedConfiguration](self, "selectedConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C99E40];
  -[PRSwitcherConfiguration configurations](self, "configurations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orderedSetWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:](v20, "initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:", v21, v24, v28, 0);
  v26 = self->_collection;
  self->_collection = v25;

  v27 = self->_collection;
  return v27;
}

- (id)focusConfigurationForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PRSwitcherConfiguration collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForPoster:ofType:", v4, CFSTR("PRPosterRoleAttributeTypeFocusConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)homeConfigurationForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PRSwitcherConfiguration collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForPoster:ofType:", v4, CFSTR("PRPosterRoleAttributeTypeHomeScreenConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)homeScreenPosterConfigurationForPosterConfiguration:(id)a3
{
  NSMapTable *associatedHomeScreenConfigurationsForServerIdentity;
  void *v4;
  void *v5;
  void *v6;

  associatedHomeScreenConfigurationsForServerIdentity = self->_associatedHomeScreenConfigurationsForServerIdentity;
  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](associatedHomeScreenConfigurationsForServerIdentity, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)metadataForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PRSwitcherConfiguration collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForPoster:ofType:", v4, CFSTR("PRPosterRoleAttributeTypeMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)suggestionMetadataForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PRSwitcherConfiguration collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForPoster:ofType:", v4, CFSTR("PRPosterRoleAttributeTypeSuggestionMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastModifiedDateForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PRSwitcherConfiguration collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForPoster:ofType:", v4, CFSTR("PRPosterRoleAttributeTypeUsageMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)configuredPropertiesForPoster:(id)a3
{
  return (id)objc_msgSend(a3, "loadConfiguredPropertiesWithError:", 0);
}

- (id)primaryPosterIdentityForHomeScreenPosterConfiguration:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_associatedHomeScreenConfigurationsForServerIdentity;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_associatedHomeScreenConfigurationsForServerIdentity, "objectForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (NSSet)heldAssociatedConfigurations
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable objectEnumerator](self->_associatedHomeScreenConfigurationsForServerIdentity, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (NSMapTable)associatedHomeScreenConfigurationsForServerIdentity
{
  return (NSMapTable *)(id)-[NSMapTable copy](self->_associatedHomeScreenConfigurationsForServerIdentity, "copy");
}

- (id)_childPosterConfigurationForConfiguration:(id)a3
{
  NSMapTable *associatedHomeScreenConfigurationsForServerIdentity;
  void *v4;
  void *v5;
  void *v6;

  associatedHomeScreenConfigurationsForServerIdentity = self->_associatedHomeScreenConfigurationsForServerIdentity;
  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](associatedHomeScreenConfigurationsForServerIdentity, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_childPosterConfigurationForConfigurationUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable keyEnumerator](self->_associatedHomeScreenConfigurationsForServerIdentity, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "posterUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          -[NSMapTable objectForKey:](self->_associatedHomeScreenConfigurationsForServerIdentity, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_posterConfigurationForUUID:(id)a3
{
  id v4;
  NSArray *configurations;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  configurations = self->_configurations;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PRSwitcherConfiguration__posterConfigurationForUUID___block_invoke;
  v9[3] = &unk_1E2185C08;
  v10 = v4;
  v6 = v4;
  -[NSArray bs_firstObjectPassingTest:](configurations, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__PRSwitcherConfiguration__posterConfigurationForUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)activeConfigurationDueToIncomingFocusModeChange
{
  return self->_activeConfigurationDueToIncomingFocusModeChange;
}

- (void)setActiveConfigurationDueToIncomingFocusModeChange:(BOOL)a3
{
  self->_activeConfigurationDueToIncomingFocusModeChange = a3;
}

- (PRPosterConfiguration)selectedConfiguration
{
  return self->_selectedConfiguration;
}

- (void)setSelectedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_selectedConfiguration, a3);
}

- (PRPosterConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedConfiguration, 0);
  objc_storeStrong((id *)&self->_associatedHomeScreenConfigurationsForServerIdentity, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

@end
