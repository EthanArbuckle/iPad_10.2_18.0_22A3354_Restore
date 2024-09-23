@implementation TRASettings

- (TRASettings)initWithZOrderLevelSettings:(id)a3 orientationSettings:(id)a4 ambientPresentationSettings:(id)a5 userInterfaceStyleSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TRASettings *v14;
  uint64_t v15;
  TRASettingsZOrderLevel *zOrderLevelSettings;
  uint64_t v17;
  TRASettingsOrientation *orientationSettings;
  uint64_t v19;
  TRASettingsAmbientPresentation *ambientPresentationSettings;
  uint64_t v21;
  TRASettingsUserInterfaceStyle *userInterfaceStyleSettings;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TRASettings;
  v14 = -[TRASettings init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    zOrderLevelSettings = v14->_zOrderLevelSettings;
    v14->_zOrderLevelSettings = (TRASettingsZOrderLevel *)v15;

    v17 = objc_msgSend(v11, "copy");
    orientationSettings = v14->_orientationSettings;
    v14->_orientationSettings = (TRASettingsOrientation *)v17;

    v19 = objc_msgSend(v12, "copy");
    ambientPresentationSettings = v14->_ambientPresentationSettings;
    v14->_ambientPresentationSettings = (TRASettingsAmbientPresentation *)v19;

    v21 = objc_msgSend(v13, "copy");
    userInterfaceStyleSettings = v14->_userInterfaceStyleSettings;
    v14->_userInterfaceStyleSettings = (TRASettingsUserInterfaceStyle *)v21;

  }
  return v14;
}

- (TRASettings)initWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TRASettings *v9;

  v4 = a3;
  objc_msgSend(v4, "zOrderLevelSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orientationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceStyleSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](self, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", v5, v6, v7, v8);
  return v9;
}

- (TRASettingsZOrderLevel)zOrderLevelSettings
{
  return self->_zOrderLevelSettings;
}

- (TRASettingsAmbientPresentation)ambientPresentationSettings
{
  return self->_ambientPresentationSettings;
}

- (TRASettingsOrientation)orientationSettings
{
  return self->_orientationSettings;
}

- (TRASettingsUserInterfaceStyle)userInterfaceStyleSettings
{
  return self->_userInterfaceStyleSettings;
}

- (TRASettings)init
{
  return -[TRASettings initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:](self, "initWithZOrderLevelSettings:orientationSettings:ambientPresentationSettings:userInterfaceStyleSettings:", 0, 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceStyleSettings, 0);
  objc_storeStrong((id *)&self->_ambientPresentationSettings, 0);
  objc_storeStrong((id *)&self->_orientationSettings, 0);
  objc_storeStrong((id *)&self->_zOrderLevelSettings, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRASettings initWithSettings:](+[TRAMutableSettings allocWithZone:](TRAMutableSettings, "allocWithZone:", a3), "initWithSettings:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRASettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_zOrderLevelSettings, 0, 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_orientationSettings, 0, 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_ambientPresentationSettings, 0, 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_userInterfaceStyleSettings, 0, 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRASettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setZOrderLevelSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zOrderLevelSettings, a3);
}

- (void)setOrientationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_orientationSettings, a3);
}

- (void)setAmbientPresentationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_ambientPresentationSettings, a3);
}

@end
