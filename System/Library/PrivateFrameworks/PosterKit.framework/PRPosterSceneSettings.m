@implementation PRPosterSceneSettings

- (void)applyToMutableSceneSettings:(id)a3
{
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PRPosterSceneSettings sceneSettings](self, "sceneSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRPosterSceneSettings interfaceOrientation](self, "interfaceOrientation");
  v6 = -[PRPosterSceneSettings deviceOrientation](self, "deviceOrientation");
  -[PRPosterSceneSettings displayConfiguration](self, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings titleStyleConfiguration](self, "titleStyleConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings ambientConfiguration](self, "ambientConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDisplayConfiguration:", v7);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v15, "setFrame:");
  if (v9)
    objc_msgSend(v15, "pr_setPosterTitleStyleConfiguration:", v9);
  if (v10)
    objc_msgSend(v15, "pr_setPosterAmbientConfiguration:", v10);
  v12 = v15;
  if (v11)
  {
    objc_msgSend(v15, "pui_setPosterContents:", v11);
    v12 = v15;
  }
  if (objc_msgSend(v12, "isUISubclass") && v8)
    objc_msgSend(v15, "setAccessibilityContrast:", objc_msgSend(v8, "accessibilityContrast"));
  objc_msgSend(v11, "role");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToMutableSceneSettings:role:", v15, v13);

  objc_msgSend(v11, "role");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PRPosterRoleLockScreen"))
    && !PUIDynamicRotationIsActive())
  {
    v6 = 1;
  }

  objc_msgSend(v15, "pui_setDeviceOrientation:", v6);
  objc_msgSend(v15, "setInterfaceOrientation:", v5);
  if (v8)
    objc_msgSend(v15, "pui_setUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterSceneSettings)initWithCoder:(id)a3
{
  id v4;
  PRPosterSceneSettings *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PRPosterSceneSettings;
  v5 = -[PRPosterSceneSettings init](&v21, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("displayConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettings setDisplayConfiguration:](v5, "setDisplayConfiguration:", v7);

    -[PRPosterSceneSettings setInterfaceOrientation:](v5, "setInterfaceOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceOrientation")));
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("sceneSettings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettings setSceneSettings:](v5, "setSceneSettings:", v9);

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("serverPosterPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[PRPosterSceneSettings setPath:](v5, "setPath:", v11);
    }
    else
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("path"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterSceneSettings setPath:](v5, "setPath:", v13);

    }
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("titleStyleConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettings setTitleStyleConfiguration:](v5, "setTitleStyleConfiguration:", v15);

    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("ambientConfiguration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettings setAmbientConfiguration:](v5, "setAmbientConfiguration:", v17);

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("traitCollection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettings setTraitCollection:](v5, "setTraitCollection:", v19);

    -[PRPosterSceneSettings setSnapshotOptions:](v5, "setSnapshotOptions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("snapshotOptions")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PRPosterSceneSettings displayConfiguration](self, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("displayConfiguration"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[PRPosterSceneSettings interfaceOrientation](self, "interfaceOrientation"), CFSTR("interfaceOrientation"));
  -[PRPosterSceneSettings sceneSettings](self, "sceneSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("sceneSettings"));

  -[PRPosterSceneSettings path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isServerPosterPath"))
    v8 = CFSTR("serverPosterPath");
  else
    v8 = CFSTR("path");
  objc_msgSend(v12, "encodeObject:forKey:", v6, v8);

  -[PRPosterSceneSettings traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("traitCollection"));

  -[PRPosterSceneSettings titleStyleConfiguration](self, "titleStyleConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("titleStyleConfiguration"));

  -[PRPosterSceneSettings ambientConfiguration](self, "ambientConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("ambientConfiguration"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[PRPosterSceneSettings snapshotOptions](self, "snapshotOptions"), CFSTR("snapshotOptions"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterSceneSettings *v4;
  void *v5;
  void *v6;

  v4 = -[PRPosterSceneSettings init](+[PRPosterSceneSettings allocWithZone:](PRPosterSceneSettings, "allocWithZone:", a3), "init");
  -[PRPosterSceneSettings sceneSettings](self, "sceneSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings setSceneSettings:](v4, "setSceneSettings:", v5);

  -[PRPosterSceneSettings displayConfiguration](self, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettings setDisplayConfiguration:](v4, "setDisplayConfiguration:", v6);

  -[PRPosterSceneSettings setInterfaceOrientation:](v4, "setInterfaceOrientation:", -[PRPosterSceneSettings interfaceOrientation](self, "interfaceOrientation"));
  -[PRPosterSceneSettings setSnapshotOptions:](v4, "setSnapshotOptions:", -[PRPosterSceneSettings snapshotOptions](self, "snapshotOptions"));
  return v4;
}

- (PRSceneSettings)stagedSceneSettings
{
  return (PRSceneSettings *)self->_sceneSettings;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (int64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (void)setSnapshotOptions:(int64_t)a3
{
  self->_snapshotOptions = a3;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_titleStyleConfiguration, a3);
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  return self->_ambientConfiguration;
}

- (void)setAmbientConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_ambientConfiguration, a3);
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (_PRPosterStagedSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (void)setSceneSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettings, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end
