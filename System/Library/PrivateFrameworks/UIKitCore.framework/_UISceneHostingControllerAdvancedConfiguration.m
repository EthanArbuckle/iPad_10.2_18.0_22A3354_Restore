@implementation _UISceneHostingControllerAdvancedConfiguration

- (_UISceneHostingControllerAdvancedConfiguration)initWithProcessIdentity:(id)a3
{
  id v5;
  _UISceneHostingControllerAdvancedConfiguration *v6;
  _UISceneHostingControllerAdvancedConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISceneHostingControllerAdvancedConfiguration;
  v6 = -[_UISceneHostingControllerAdvancedConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processIdentity, a3);
    -[_UISceneHostingControllerAdvancedConfiguration setSceneSpecification:](v7, "setSceneSpecification:", 0);
    -[_UISceneHostingControllerAdvancedConfiguration setSceneWorkspace:](v7, "setSceneWorkspace:", 0);
    -[_UISceneHostingControllerAdvancedConfiguration setSceneIdentifier:](v7, "setSceneIdentifier:", 0);
  }

  return v7;
}

- (void)setSceneSpecification:(id)a3
{
  id v4;
  UIApplicationSceneSpecification *v5;
  UIApplicationSceneSpecification *sceneSpecification;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (UIApplicationSceneSpecification *)v4;
  }
  else
  {
    +[FBSSceneSpecification specification](_UISceneHostingSceneSpecification, "specification");
    v5 = (UIApplicationSceneSpecification *)objc_claimAutoreleasedReturnValue();
  }
  sceneSpecification = self->_sceneSpecification;
  self->_sceneSpecification = v5;

}

- (void)setSceneWorkspace:(id)a3
{
  id v4;
  FBSceneWorkspace *v5;
  void *sceneWorkspace;
  FBSceneWorkspace *v7;
  FBSceneWorkspace *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = (FBSceneWorkspace *)v4;
    sceneWorkspace = self->_sceneWorkspace;
    self->_sceneWorkspace = v5;
  }
  else
  {
    objc_msgSend((id)UIApp, "_sceneHostingWorkspaceController");
    sceneWorkspace = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(sceneWorkspace, "sceneWorkspace");
    v7 = (FBSceneWorkspace *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sceneWorkspace;
    self->_sceneWorkspace = v7;

  }
}

- (void)setSceneIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  void *sceneIdentifier;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    v5 = (NSString *)v4;
    sceneIdentifier = self->_sceneIdentifier;
    self->_sceneIdentifier = v5;
  }
  else
  {
    -[RBSProcessIdentity embeddedApplicationIdentifier](self->_processIdentity, "embeddedApplicationIdentifier");
    sceneIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    if (sceneIdentifier
      || (-[RBSProcessIdentity xpcServiceIdentifier](self->_processIdentity, "xpcServiceIdentifier"),
          (sceneIdentifier = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("UIHostedScene-%@-%@"), sceneIdentifier, v9);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = self->_sceneIdentifier;
      self->_sceneIdentifier = v10;

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      sceneIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(sceneIdentifier, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("UIHostedScene-%@"), v8);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_sceneIdentifier;
      self->_sceneIdentifier = v13;
    }

  }
}

- (id)sceneHostingSpecification
{
  UIApplicationSceneSpecification *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_sceneSpecification;
  else
    v3 = 0;
  return v3;
}

- (UIApplicationSceneSpecification)sceneSpecification
{
  return self->_sceneSpecification;
}

- (NSOrderedSet)additionalExtensions
{
  return self->_additionalExtensions;
}

- (void)setAdditionalExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalExtensions, a3);
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (id)initialSettingsUpdater
{
  return self->_initialSettingsUpdater;
}

- (void)setInitialSettingsUpdater:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)initialClientSettingsUpdater
{
  return self->_initialClientSettingsUpdater;
}

- (void)setInitialClientSettingsUpdater:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong(&self->_initialClientSettingsUpdater, 0);
  objc_storeStrong(&self->_initialSettingsUpdater, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_additionalExtensions, 0);
  objc_storeStrong((id *)&self->_sceneSpecification, 0);
}

@end
