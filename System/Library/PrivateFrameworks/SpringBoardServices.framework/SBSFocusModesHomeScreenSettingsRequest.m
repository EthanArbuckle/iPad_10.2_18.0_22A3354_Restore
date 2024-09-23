@implementation SBSFocusModesHomeScreenSettingsRequest

- (SBSFocusModesHomeScreenSettingsRequest)initWithFocusModeIdentifier:(id)a3
{
  id v4;
  SBSFocusModesHomeScreenSettingsRequest *v5;
  uint64_t v6;
  NSString *focusModeIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSFocusModesHomeScreenSettingsRequest;
  v5 = -[SBSFocusModesHomeScreenSettingsRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    focusModeIdentifier = v5->_focusModeIdentifier;
    v5->_focusModeIdentifier = (NSString *)v6;

    v5->_snapshotScale = 0.5;
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *focusModeIdentifier;
  id v5;

  focusModeIdentifier = self->_focusModeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", focusModeIdentifier, CFSTR("focusModeIdentifier"));
  objc_msgSend(v5, "encodeCollection:forKey:", self->_listsToAdd, CFSTR("listsToAdd"));
  objc_msgSend(v5, "encodeCollection:forKey:", self->_listsToRemove, CFSTR("listsToRemove"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactivePages, CFSTR("proactivePages"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("snapshotDelay"), self->_snapshotDelay);
  objc_msgSend(v5, "encodeBool:forKey:", self->_appendExistingPages, CFSTR("appendExistingPages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_excludeWallpaper, CFSTR("excludeWallpaper"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("snapshotScale"), self->_snapshotScale);

}

- (SBSFocusModesHomeScreenSettingsRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  SBSFocusModesHomeScreenSettingsRequest *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  SBSFocusModesHomeScreenSettingsRequest *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("focusModeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[SBSFocusModesHomeScreenSettingsRequest initWithFocusModeIdentifier:](self, "initWithFocusModeIdentifier:", v5);
    v7 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("listsToAdd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSFocusModesHomeScreenSettingsRequest setListsToAdd:](v6, "setListsToAdd:", v8);
    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("listsToRemove"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSFocusModesHomeScreenSettingsRequest setListsToRemove:](v6, "setListsToRemove:", v10);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v11 = (void *)getATXHomeScreenPageClass_softClass;
    v20 = getATXHomeScreenPageClass_softClass;
    if (!getATXHomeScreenPageClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getATXHomeScreenPageClass_block_invoke;
      v16[3] = &unk_1E288DFE8;
      v16[4] = &v17;
      __getATXHomeScreenPageClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v17, 8);
    if (v12)
    {
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", objc_opt_class(), v12, CFSTR("proactivePages"));
      v13 = objc_claimAutoreleasedReturnValue();
      -[SBSFocusModesHomeScreenSettingsRequest setProactivePages:](v6, "setProactivePages:", v13);
    }
    else
    {
      SBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SBSFocusModesHomeScreenSettingsRequest initWithBSXPCCoder:].cold.1(v13);
    }

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("snapshotDelay"));
    -[SBSFocusModesHomeScreenSettingsRequest setSnapshotDelay:](v6, "setSnapshotDelay:");
    -[SBSFocusModesHomeScreenSettingsRequest setAppendExistingPages:](v6, "setAppendExistingPages:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appendExistingPages")));
    -[SBSFocusModesHomeScreenSettingsRequest setExcludeWallpaper:](v6, "setExcludeWallpaper:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeWallpaper")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("snapshotScale"));
    -[SBSFocusModesHomeScreenSettingsRequest setSnapshotScale:](v6, "setSnapshotScale:");
    self = v6;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)-[SBSFocusModesHomeScreenSettingsRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSFocusModesHomeScreenSettingsRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSFocusModesHomeScreenSettingsRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBSFocusModesHomeScreenSettingsRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSFocusModesHomeScreenSettingsRequest focusModeIdentifier](self, "focusModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("focusModeIdentifier"));

  -[SBSFocusModesHomeScreenSettingsRequest listsToAdd](self, "listsToAdd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("listsToAdd"), 0);

  -[SBSFocusModesHomeScreenSettingsRequest listsToRemove](self, "listsToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("listsToRemove"), 0);

  return v4;
}

- (NSString)focusModeIdentifier
{
  return self->_focusModeIdentifier;
}

- (NSArray)listsToAdd
{
  return self->_listsToAdd;
}

- (void)setListsToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_listsToAdd, a3);
}

- (NSArray)listsToRemove
{
  return self->_listsToRemove;
}

- (void)setListsToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_listsToRemove, a3);
}

- (NSArray)proactivePages
{
  return self->_proactivePages;
}

- (void)setProactivePages:(id)a3
{
  objc_storeStrong((id *)&self->_proactivePages, a3);
}

- (double)snapshotDelay
{
  return self->_snapshotDelay;
}

- (void)setSnapshotDelay:(double)a3
{
  self->_snapshotDelay = a3;
}

- (BOOL)appendExistingPages
{
  return self->_appendExistingPages;
}

- (void)setAppendExistingPages:(BOOL)a3
{
  self->_appendExistingPages = a3;
}

- (BOOL)excludeWallpaper
{
  return self->_excludeWallpaper;
}

- (void)setExcludeWallpaper:(BOOL)a3
{
  self->_excludeWallpaper = a3;
}

- (double)snapshotScale
{
  return self->_snapshotScale;
}

- (void)setSnapshotScale:(double)a3
{
  self->_snapshotScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactivePages, 0);
  objc_storeStrong((id *)&self->_listsToRemove, 0);
  objc_storeStrong((id *)&self->_listsToAdd, 0);
  objc_storeStrong((id *)&self->_focusModeIdentifier, 0);
}

- (void)initWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18EB52000, log, OS_LOG_TYPE_FAULT, "Could not load ATXHomeScreenPage from SpringBoardServices", v1, 2u);
}

@end
