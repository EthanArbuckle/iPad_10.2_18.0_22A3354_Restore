@implementation SBSceneIdentityProvider

- (SBSceneIdentityProvider)initWithDisplayIdentity:(id)a3
{
  id v5;
  SBSceneIdentityProvider *v6;
  SBSceneIdentityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneIdentityProvider;
  v6 = -[SBSceneIdentityProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_displayIdentity, a3);

  return v7;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneIdentityProvider _sceneIdentifierForBundleIdentifier:](self, "_sceneIdentifierForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSceneIdentityProvider sceneIdentityForApplication:uniqueIdentifier:](self, "sceneIdentityForApplication:uniqueIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3
{
  return -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3);
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a3, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneIdentityProvider _sceneIdentifierForBundleIdentifier:](self, "_sceneIdentifierForBundleIdentifier:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  return -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  return -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a3;
  -[SBSceneIdentityProvider sceneIdentityForApplication:](self, "sceneIdentityForApplication:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8 && v5)
    v8 = -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", v7);

  return v8;
}

- (id)_sceneIdentifierForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), a3, self->_displayIdentity);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
