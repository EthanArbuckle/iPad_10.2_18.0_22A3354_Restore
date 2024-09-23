@implementation PRMutableSwitcherConfiguration

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRMutableSwitcherConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = +[PRMutableSwitcherConfiguration allocWithZone:](PRMutableSwitcherConfiguration, "allocWithZone:", a3);
  -[PRSwitcherConfiguration configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[PRSwitcherConfiguration selectedConfiguration](self, "selectedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSwitcherConfiguration activeConfiguration](self, "activeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSwitcherConfiguration associatedHomeScreenConfigurationsForServerIdentity](self, "associatedHomeScreenConfigurationsForServerIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:](v4, "_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:", v6, v7, v8, v10);

  v12 = -[NSMapTable copy](self->_overriddenFocusConfigurationForPosterConfiguration, "copy");
  v13 = *(void **)(v11 + 56);
  *(_QWORD *)(v11 + 56) = v12;

  v14 = -[NSMapTable copy](self->_overriddenHomescreenConfigurationForPosterConfiguration, "copy");
  v15 = *(void **)(v11 + 64);
  *(_QWORD *)(v11 + 64) = v14;

  v16 = -[NSMutableOrderedSet mutableCopy](self->_pathsToIngest, "mutableCopy");
  v17 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v16;

  objc_storeStrong((id *)(v11 + 88), self->_desiredActiveConfiguration);
  v18 = -[NSMapTable copy](self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs, "copy");
  v19 = *(void **)(v11 + 72);
  *(_QWORD *)(v11 + 72) = v18;

  return (id)v11;
}

- (PRPosterConfiguration)desiredActiveConfiguration
{
  PRPosterConfiguration *desiredActiveConfiguration;

  desiredActiveConfiguration = self->_desiredActiveConfiguration;
  if (desiredActiveConfiguration)
    return desiredActiveConfiguration;
  -[PRSwitcherConfiguration activeConfiguration](self, "activeConfiguration");
  return (PRPosterConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)focusConfigurationForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_overriddenFocusConfigurationForPosterConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)PRMutableSwitcherConfiguration;
    -[PRSwitcherConfiguration focusConfigurationForPoster:](&v10, sel_focusConfigurationForPoster_, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)setFocusConfiguration:(id)a3 forPosterConfiguration:(id)a4
{
  id v6;
  NSMapTable *overriddenFocusConfigurationForPosterConfiguration;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  overriddenFocusConfigurationForPosterConfiguration = self->_overriddenFocusConfigurationForPosterConfiguration;
  if (!overriddenFocusConfigurationForPosterConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_overriddenFocusConfigurationForPosterConfiguration;
    self->_overriddenFocusConfigurationForPosterConfiguration = v8;

    overriddenFocusConfigurationForPosterConfiguration = self->_overriddenFocusConfigurationForPosterConfiguration;
  }
  if (v11)
  {
    -[NSMapTable setObject:forKey:](overriddenFocusConfigurationForPosterConfiguration, "setObject:forKey:", v11, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](overriddenFocusConfigurationForPosterConfiguration, "setObject:forKey:", v10, v6);

  }
}

- (id)homeConfigurationForPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_overriddenHomescreenConfigurationForPosterConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)PRMutableSwitcherConfiguration;
    -[PRSwitcherConfiguration homeConfigurationForPoster:](&v10, sel_homeConfigurationForPoster_, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)setHomeConfiguration:(id)a3 forPosterConfiguration:(id)a4
{
  id v6;
  NSMapTable *overriddenHomescreenConfigurationForPosterConfiguration;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("homeConfiguration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration setHomeConfiguration:forPosterConfiguration:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D7BCCLL);
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterConfiguration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration setHomeConfiguration:forPosterConfiguration:].cold.2();
    goto LABEL_11;
  }
  overriddenHomescreenConfigurationForPosterConfiguration = self->_overriddenHomescreenConfigurationForPosterConfiguration;
  if (!overriddenHomescreenConfigurationForPosterConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_overriddenHomescreenConfigurationForPosterConfiguration;
    self->_overriddenHomescreenConfigurationForPosterConfiguration = v8;

    overriddenHomescreenConfigurationForPosterConfiguration = self->_overriddenHomescreenConfigurationForPosterConfiguration;
  }
  -[NSMapTable setObject:forKey:](overriddenHomescreenConfigurationForPosterConfiguration, "setObject:forKey:", v11, v6);

}

- (void)removeConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  PRMutableSwitcherConfiguration *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRSwitcherConfiguration configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v7, "mutableCopy");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = self;
  -[PRSwitcherConfiguration configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v13, "_path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "serverIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "posterUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v6);

        if (v17)
        {
          objc_msgSend(v33, "removeObject:", v13);
          v18 = (void *)objc_msgSend(v33, "copy");
          -[PRSwitcherConfiguration setConfigurations:](v32, "setConfigurations:", v18);

          -[PRSwitcherConfiguration collection](v32, "collection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRSwitcherConfiguration selectedConfiguration](v32, "selectedConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "serverIdentity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "posterUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqual:", v6);

          v31 = v19;
          if (v24)
          {
            objc_msgSend(v19, "fallbackSelectedForSortedConfigurations:reverse:", v33, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRSwitcherConfiguration setSelectedConfiguration:](v32, "setSelectedConfiguration:", v25);
          }
          else
          {
            v25 = 0;
          }
          -[PRSwitcherConfiguration activeConfiguration](v32, "activeConfiguration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "serverIdentity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "posterUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqual:", v6);

          if (v30)
            -[PRSwitcherConfiguration setActiveConfiguration:](v32, "setActiveConfiguration:", v25);

          goto LABEL_16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void)ingestNewPosterConfiguration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  NSMutableOrderedSet *pathsToIngest;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!objc_msgSend(v14, "incomingPosterType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path incomingPosterType] != PRIncomingPosterTypeUnknown"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D8048);
  }
  objc_msgSend(v14, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("PRPosterRoleLockScreen"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path role] isEqual:PRPosterRoleLockScreen]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:].cold.3();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D80ACLL);
  }
  objc_msgSend(v14, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("PRPosterRoleLockScreen"));

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[[path path] role] isEqual:PRPosterRoleLockScreen]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:].cold.2();
    goto LABEL_15;
  }
  pathsToIngest = self->_pathsToIngest;
  if (!pathsToIngest)
  {
    v10 = (NSMutableOrderedSet *)objc_opt_new();
    v11 = self->_pathsToIngest;
    self->_pathsToIngest = v10;

    pathsToIngest = self->_pathsToIngest;
  }
  -[NSMutableOrderedSet addObject:](pathsToIngest, "addObject:", v14);

}

- (id)incomingPosterConfigurations
{
  void *v2;
  void *v3;
  id v4;

  -[NSMutableOrderedSet array](self->_pathsToIngest, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)posterConfigurationsNeedingHomeScreenConfigurationUpdates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_overriddenHomescreenConfigurationForPosterConfiguration, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_overriddenHomescreenConfigurationForPosterConfiguration, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)posterConfigurationsNeedingFocusConfigurationUpdates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMapTable keyEnumerator](self->_overriddenFocusConfigurationForPosterConfiguration, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_overriddenFocusConfigurationForPosterConfiguration, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_class();
        v11 = v9;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        if (v13)
          objc_msgSend(v15, "setObject:forKey:", v13, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v15;
}

- (id)posterConfigurationsNeedingFocusConfigurationDeleted
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_overriddenFocusConfigurationForPosterConfiguration, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_overriddenFocusConfigurationForPosterConfiguration, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v10)
          objc_msgSend(v13, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v13, "copy");
  return v11;
}

- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithHomeScreenConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = v6;
  NSClassFromString(CFSTR("PRIncomingPosterConfiguration"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D8714);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D8778);
  }

  v8 = v7;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D87DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:].cold.2();
    goto LABEL_17;
  }

  -[PRMutableSwitcherConfiguration incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs](self, "incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, v12);

}

- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "incomingPosterType") != 4 && objc_msgSend(v6, "incomingPosterType") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[incomingPosterConfiguration incomingPosterType] == PRIncomingPosterTypeAssociatedNew || [incomingPosterConfiguration incomingPosterType] == PRIncomingPosterTypeAssociatedUpdate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.5();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D898CLL);
  }
  v14 = v6;
  NSClassFromString(CFSTR("PRIncomingPosterConfiguration"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.1();
    goto LABEL_22;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D89F0);
  }

  v8 = v7;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D8A54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6D8AB8);
  }

  -[PRMutableSwitcherConfiguration incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs](self, "incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v14, v8);

}

- (id)incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs
{
  NSMapTable *incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  NSMapTable *v4;
  NSMapTable *v5;

  incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  if (!incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
    self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = v4;

    incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  }
  return incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
}

- (void)setDesiredActiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_desiredActiveConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredActiveConfiguration, 0);
  objc_storeStrong((id *)&self->_pathsToIngest, 0);
  objc_storeStrong((id *)&self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs, 0);
  objc_storeStrong((id *)&self->_overriddenHomescreenConfigurationForPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_overriddenFocusConfigurationForPosterConfiguration, 0);
}

- (void)setHomeConfiguration:forPosterConfiguration:.cold.1()
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

- (void)setHomeConfiguration:forPosterConfiguration:.cold.2()
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

- (void)ingestNewPosterConfiguration:.cold.1()
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

- (void)ingestNewPosterConfiguration:.cold.2()
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

- (void)ingestNewPosterConfiguration:.cold.3()
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

- (void)ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:.cold.1()
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

- (void)ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:.cold.2()
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

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.1()
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

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.2()
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

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.5()
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

@end
