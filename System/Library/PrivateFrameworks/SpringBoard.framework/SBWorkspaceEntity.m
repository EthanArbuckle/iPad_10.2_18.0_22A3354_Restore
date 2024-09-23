@implementation SBWorkspaceEntity

uint64_t __41__SBWorkspaceEntity_supportedLayoutRoles__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_supportsLayoutRole:", a2);
  if ((_DWORD)result)
  {
    result = SBLayoutRoleMaskForRole(a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  }
  return result;
}

- (void)clearActivationSettings
{
  -[SBActivationSettings clearActivationSettings](self->_activationSettings, "clearActivationSettings");
}

- (BOOL)isApplicationSceneEntity
{
  return 0;
}

- (id)applicationSceneEntity
{
  return 0;
}

- (SBActivationSettings)activationSettings
{
  return self->_activationSettings;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (SBWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4
{
  id v6;
  id v7;
  SBWorkspaceEntity *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  SBActivationSettings *activationSettings;
  uint64_t v13;
  SBDeactivationSettings *deactivationSettings;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBWorkspaceEntity;
  v8 = -[SBWorkspaceEntity init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copyActivationSettings");
    activationSettings = v8->_activationSettings;
    v8->_activationSettings = (SBActivationSettings *)v11;

    v13 = objc_msgSend(v7, "copyDeactivationSettings");
    deactivationSettings = v8->_deactivationSettings;
    v8->_deactivationSettings = (SBDeactivationSettings *)v13;

    v8->_layoutRole = 0;
  }

  return v8;
}

- (BOOL)isEmptyWorkspaceEntity
{
  return 0;
}

- (BOOL)isHomeScreenEntity
{
  return 0;
}

uint64_t __59__SBWorkspaceEntity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  SBLayoutRoleMaskDescription(objc_msgSend(*(id *)(a1 + 40), "supportedLayoutRoles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("supportedRoles"));

  v5 = *(void **)(a1 + 32);
  SBLayoutAttributesDescription(objc_msgSend(*(id *)(a1 + 40), "layoutAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("layoutAttributes"));

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "isEmpty") & 1) == 0)
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("activation"), 1);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isEmpty");
  if ((result & 1) == 0)
    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("deactivation"), 1);
  return result;
}

- (unint64_t)supportedLayoutRoles
{
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBWorkspaceEntity_supportedLayoutRoles__block_invoke;
  v5[3] = &unk_1E8EA6CA0;
  v5[4] = self;
  v5[5] = &v6;
  SBLayoutRoleEnumerateAppLayoutRoles(v5);
  if (-[SBWorkspaceEntity _supportsLayoutRole:](self, "_supportsLayoutRole:", 3))
  {
    v3 = v7[3] | 8;
    v7[3] = v3;
  }
  else
  {
    v3 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return 0;
}

- (unint64_t)layoutAttributes
{
  unint64_t v3;

  v3 = -[SBWorkspaceEntity supportsPresentationAtAnySize](self, "supportsPresentationAtAnySize");
  if (-[SBWorkspaceEntity wantsExclusiveForeground](self, "wantsExclusiveForeground"))
    return v3 | 2;
  else
    return v3;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isAnalogousToEntity:(id)a3
{
  SBWorkspaceEntity *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (SBWorkspaceEntity *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[SBWorkspaceEntity uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceEntity uniqueIdentifier](v4, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)displayItemRepresentation
{
  SBWorkspaceEntity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SBWorkspaceEntity isApplicationSceneEntity](self, "isApplicationSceneEntity"))
  {
    v3 = self;
    -[SBWorkspaceEntity application](v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isWebApplication"))
    {
      -[SBWorkspaceEntity uniqueIdentifier](v3, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceEntity uniqueIdentifier](v3, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", v5, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  if (-[SBWorkspaceEntity isAppClipPlaceholderEntity](self, "isAppClipPlaceholderEntity"))
  {
    -[SBWorkspaceEntity appClipPlaceholderEntity](self, "appClipPlaceholderEntity");
    v3 = (SBWorkspaceEntity *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceEntity bundleIdentifier](v3, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceEntity futureSceneIdentifier](v3, "futureSceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    return v6;
  }
  if (-[SBWorkspaceEntity isHomeScreenEntity](self, "isHomeScreenEntity"))
  {
    +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_identifier;
}

- (BOOL)wantsExclusiveForeground
{
  return 0;
}

- (BOOL)supportsPresentationAtAnySize
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWorkspaceEntity descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBWorkspaceEntity *v11;

  v4 = a3;
  -[SBWorkspaceEntity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SBWorkspaceEntity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWorkspaceEntity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_identifier, CFSTR("ID"), 1);
  SBLayoutRoleDescription(self->_layoutRole);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("layoutRole"));

  return v3;
}

- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SBActivationSettings *v7;
  SBActivationSettings *activationSettings;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = v6;
  if (v6 && !self->_activationSettings)
  {
    v7 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v7;

    v6 = v9;
  }
  -[SBActivationSettings setObject:forActivationSetting:](self->_activationSettings, "setObject:forActivationSetting:", v6, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SBWorkspaceEntity uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:displayChangeSettings:", v5, 0);

  -[SBWorkspaceEntity activationSettings](self, "activationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyActivationSettings:", v7);

  -[SBWorkspaceEntity deactivationSettings](self, "deactivationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyDeactivationSettings:", v8);

  objc_msgSend(v6, "setLayoutRole:", -[SBWorkspaceEntity layoutRole](self, "layoutRole"));
  return v6;
}

+ (id)entity
{
  return objc_alloc_init((Class)a1);
}

- (void)applyActivationSettings:(id)a3
{
  id v4;
  SBActivationSettings *v5;
  SBActivationSettings *activationSettings;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && !self->_activationSettings)
  {
    v5 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v5;

    v4 = v7;
  }
  -[SBActivationSettings applyActivationSettings:](self->_activationSettings, "applyActivationSettings:", v4);

}

- (SBDeactivationSettings)deactivationSettings
{
  return self->_deactivationSettings;
}

- (void)applyDeactivationSettings:(id)a3
{
  id v4;
  SBDeactivationSettings *v5;
  SBDeactivationSettings *deactivationSettings;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && !self->_deactivationSettings)
  {
    v5 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v5;

    v4 = v7;
  }
  -[SBDeactivationSettings applyDeactivationSettings:](self->_deactivationSettings, "applyDeactivationSettings:", v4);

}

- (BOOL)BOOLForActivationSetting:(unsigned int)a3
{
  return -[SBActivationSettings BOOLForActivationSetting:](self->_activationSettings, "BOOLForActivationSetting:", *(_QWORD *)&a3);
}

- (id)objectForActivationSetting:(unsigned int)a3
{
  return -[SBActivationSettings objectForActivationSetting:](self->_activationSettings, "objectForActivationSetting:", *(_QWORD *)&a3);
}

- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4
{
  uint64_t v4;
  SBActivationSettings *v7;
  SBActivationSettings *activationSettings;

  v4 = *(_QWORD *)&a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_activationSettings)
  {
    v7 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v7;

  }
  -[SBActivationSettings setFlag:forActivationSetting:](self->_activationSettings, "setFlag:forActivationSetting:", a3, v4);
}

- (int64_t)flagForActivationSetting:(unsigned int)a3
{
  SBActivationSettings *activationSettings;

  activationSettings = self->_activationSettings;
  if (activationSettings)
    return -[SBActivationSettings flagForActivationSetting:](activationSettings, "flagForActivationSetting:", *(_QWORD *)&a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isAppClipPlaceholderEntity
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deactivationSettings, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isPreviousWorkspaceEntity
{
  return 0;
}

- (id)appClipPlaceholderEntity
{
  return 0;
}

- (BOOL)isDeviceApplicationSceneEntity
{
  return 0;
}

- (id)deviceApplicationSceneEntity
{
  return 0;
}

- (SBWorkspaceEntity)init
{
  return -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](self, "initWithIdentifier:displayChangeSettings:", 0, 0);
}

- (id)copyActivationSettings
{
  return (id)-[SBActivationSettings copy](self->_activationSettings, "copy");
}

- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4
{
  uint64_t v4;
  SBDeactivationSettings *v7;
  SBDeactivationSettings *deactivationSettings;

  v4 = *(_QWORD *)&a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_deactivationSettings)
  {
    v7 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v7;

  }
  -[SBDeactivationSettings setFlag:forDeactivationSetting:](self->_deactivationSettings, "setFlag:forDeactivationSetting:", a3, v4);
}

- (int64_t)flagForDeactivationSetting:(unsigned int)a3
{
  SBDeactivationSettings *deactivationSettings;

  deactivationSettings = self->_deactivationSettings;
  if (deactivationSettings)
    return -[SBDeactivationSettings flagForDeactivationSetting:](deactivationSettings, "flagForDeactivationSetting:", *(_QWORD *)&a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3
{
  return -[SBDeactivationSettings BOOLForDeactivationSetting:](self->_deactivationSettings, "BOOLForDeactivationSetting:", *(_QWORD *)&a3);
}

- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SBDeactivationSettings *v7;
  SBDeactivationSettings *deactivationSettings;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = v6;
  if (v6 && !self->_deactivationSettings)
  {
    v7 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v7;

    v6 = v9;
  }
  -[SBDeactivationSettings setObject:forDeactivationSetting:](self->_deactivationSettings, "setObject:forDeactivationSetting:", v6, v4);

}

- (id)objectForDeactivationSetting:(unsigned int)a3
{
  return -[SBDeactivationSettings objectForDeactivationSetting:](self->_deactivationSettings, "objectForDeactivationSetting:", *(_QWORD *)&a3);
}

- (id)copyDeactivationSettings
{
  return (id)-[SBDeactivationSettings copy](self->_deactivationSettings, "copy");
}

- (void)clearDeactivationSettings
{
  -[SBDeactivationSettings clearDeactivationSettings](self->_deactivationSettings, "clearDeactivationSettings");
}

- (BOOL)supportsSplitView
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[SBWorkspaceEntity descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)_generator
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SBWorkspaceEntity__generator__block_invoke;
  v6[3] = &__block_descriptor_40_e5__8__0lu32l8;
  v6[4] = v2;
  v3 = (void *)MEMORY[0x1D17E5550](v6);
  v4 = (void *)MEMORY[0x1D17E5550]();

  return v4;
}

uint64_t __31__SBWorkspaceEntity__generator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "entity");
}

- (Class)viewControllerClass
{
  return 0;
}

- (BOOL)supportsLayoutRole:(int64_t)a3
{
  return SBLayoutRoleMaskContainsRole(-[SBWorkspaceEntity supportedLayoutRoles](self, "supportedLayoutRoles"), a3);
}

- (BOOL)hasLayoutAttributes:(unint64_t)a3
{
  return (a3 & ~-[SBWorkspaceEntity layoutAttributes](self, "layoutAttributes")) == 0;
}

- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBWorkspaceEntity uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isCaptureExtensionEntity
{
  return 0;
}

- (id)captureExtensionEntity
{
  return 0;
}

@end
