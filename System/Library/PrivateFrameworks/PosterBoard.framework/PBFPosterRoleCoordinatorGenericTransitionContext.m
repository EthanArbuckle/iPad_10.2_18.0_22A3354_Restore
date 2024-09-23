@implementation PBFPosterRoleCoordinatorGenericTransitionContext

- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PBFPosterRoleCoordinatorGenericTransitionContext *v16;

  v10 = (void *)MEMORY[0x1E0CB3550];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PBFPosterRoleCoordinatorGenericTransitionContext initWithActiveFocusMode:activeChargerIdentifier:extensionStoreCoordinators:currentActivePosterForRole:affectedRoles:](self, "initWithActiveFocusMode:activeChargerIdentifier:extensionStoreCoordinators:currentActivePosterForRole:affectedRoles:", v14, v13, v12, v11, v15);

  return v16;
}

- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6 affectedRoles:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PBFPosterRoleCoordinatorGenericTransitionContext *v18;
  uint64_t v19;
  NSDictionary *extensionStoreCoordinatorForProviderIdentifier;
  uint64_t v21;
  NSDictionary *currentActivePosterForRole;
  uint64_t v23;
  NSUUID *transitionContextIdentifier;
  uint64_t v25;
  NSString *activeChargerIdentifier;
  uint64_t v27;
  NSCountedSet *affectedRoles;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PBFPosterRoleCoordinatorGenericTransitionContext;
  v18 = -[PBFPosterRoleCoordinatorGenericTransitionContext init](&v30, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v15, "copy");
    extensionStoreCoordinatorForProviderIdentifier = v18->_extensionStoreCoordinatorForProviderIdentifier;
    v18->_extensionStoreCoordinatorForProviderIdentifier = (NSDictionary *)v19;

    v21 = objc_msgSend(v16, "copy");
    currentActivePosterForRole = v18->_currentActivePosterForRole;
    v18->_currentActivePosterForRole = (NSDictionary *)v21;

    objc_storeStrong((id *)&v18->_activeFocusMode, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = objc_claimAutoreleasedReturnValue();
    transitionContextIdentifier = v18->_transitionContextIdentifier;
    v18->_transitionContextIdentifier = (NSUUID *)v23;

    v25 = objc_msgSend(v14, "copy");
    activeChargerIdentifier = v18->_activeChargerIdentifier;
    v18->_activeChargerIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    affectedRoles = v18->_affectedRoles;
    v18->_affectedRoles = (NSCountedSet *)v27;

  }
  return v18;
}

- (id)pbf_activeChargerIdentifier
{
  return self->_activeChargerIdentifier;
}

- (id)pbf_activeFocusMode
{
  return self->_activeFocusMode;
}

- (void)setDesiredActiveConfiguration:(id)a3 forRole:(id)a4
{
  id v6;
  PBFPosterRoleCoordinatorGenericTransitionContext *v7;
  NSMutableDictionary *desiredActivePosterConfigurationForRole;
  uint64_t v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  desiredActivePosterConfigurationForRole = v7->_desiredActivePosterConfigurationForRole;
  if (!desiredActivePosterConfigurationForRole)
  {
    v9 = objc_opt_new();
    v10 = v7->_desiredActivePosterConfigurationForRole;
    v7->_desiredActivePosterConfigurationForRole = (NSMutableDictionary *)v9;

    desiredActivePosterConfigurationForRole = v7->_desiredActivePosterConfigurationForRole;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](desiredActivePosterConfigurationForRole, "setObject:forKeyedSubscript:", v11, v6);
  objc_sync_exit(v7);

}

- (id)pbf_desiredActiveConfigurationForRole:(id)a3
{
  id v4;
  PBFPosterRoleCoordinatorGenericTransitionContext *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_desiredActivePosterConfigurationForRole, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)setTransitionFromIncomingFocusModeChange:(BOOL)a3
{
  PBFPosterRoleCoordinatorGenericTransitionContext *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_transitionFromIncomingFocusModeChange = a3;
  objc_sync_exit(obj);

}

- (BOOL)pbf_transitionFromIncomingFocusModeChange
{
  PBFPosterRoleCoordinatorGenericTransitionContext *v2;
  BOOL transitionFromIncomingFocusModeChange;

  v2 = self;
  objc_sync_enter(v2);
  transitionFromIncomingFocusModeChange = v2->_transitionFromIncomingFocusModeChange;
  objc_sync_exit(v2);

  return transitionFromIncomingFocusModeChange;
}

- (id)pbf_transitionContextIdentifier
{
  PBFPosterRoleCoordinatorGenericTransitionContext *v2;
  NSUUID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_transitionContextIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)pbf_extensionStoreCoordinatorForProvider
{
  return self->_extensionStoreCoordinatorForProviderIdentifier;
}

- (id)pbf_currentActivePosterForRole:(id)a3
{
  return -[NSDictionary objectForKey:](self->_currentActivePosterForRole, "objectForKey:", a3);
}

- (id)pbf_transitionAffectedRoles
{
  return self->_affectedRoles;
}

- (NSString)description
{
  NSString *description;
  NSString *v3;
  void *v5;
  PBFPosterRoleCoordinatorGenericTransitionContext *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *v16;

  description = self->_description;
  if (description)
  {
    v3 = description;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    objc_sync_enter(v6);
    -[NSUUID UUIDString](v6->_transitionContextIdentifier, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:withName:", v8, CFSTR("id"));

    objc_msgSend(v5, "appendString:withName:", v6->_activeChargerIdentifier, CFSTR("activeChargerIdentifier"));
    v9 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", v6->_transitionFromIncomingFocusModeChange, CFSTR("fromFocusModeChange"), 1);
    v10 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", v6->_initialUpdate, CFSTR("isInitialUpdate"), 1);
    -[FCActivityDescribing activityUniqueIdentifier](v6->_activeFocusMode, "activityUniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringToIndex:", 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v13, CFSTR("_activeFocusMode"), 1);

    objc_msgSend(v5, "appendDictionarySection:withName:skipIfEmpty:", v6->_desiredActivePosterConfigurationForRole, CFSTR("desiredActiveConfigurationFromRole"), 1);
    objc_msgSend(v5, "appendDictionarySection:withName:skipIfEmpty:", v6->_currentActivePosterForRole, CFSTR("currentActivePosterForRole"), 1);
    objc_msgSend(v5, "appendDictionarySection:withName:skipIfEmpty:", v6->_extensionStoreCoordinatorForProviderIdentifier, CFSTR("extensionStoreCoordinatorForProviderIdentifier"), 1);
    objc_sync_exit(v6);

    objc_msgSend(v5, "build");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_description;
    self->_description = v15;

    v3 = self->_description;
  }
  return v3;
}

- (BOOL)isInitialUpdate
{
  return self->_initialUpdate;
}

- (void)setInitialUpdate:(BOOL)a3
{
  self->_initialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_activeChargerIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
  objc_storeStrong((id *)&self->_currentActivePosterForRole, 0);
  objc_storeStrong((id *)&self->_desiredActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinatorForProviderIdentifier, 0);
}

@end
