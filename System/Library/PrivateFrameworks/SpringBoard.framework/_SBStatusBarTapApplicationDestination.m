@implementation _SBStatusBarTapApplicationDestination

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[SBApplication bundleIdentifier](self->_application, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (_SBStatusBarTapApplicationDestination)initWithApplication:(id)a3 sceneIdentifier:(id)a4 windowScene:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SBStatusBarTapApplicationDestination *v12;
  _SBStatusBarTapApplicationDestination *v13;
  uint64_t v14;
  NSString *sceneIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SBStatusBarTapApplicationDestination;
  v12 = -[_SBStatusBarTapApplicationDestination init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    v14 = objc_msgSend(v10, "copy");
    sceneIdentifier = v13->_sceneIdentifier;
    v13->_sceneIdentifier = (NSString *)v14;

    objc_storeWeak((id *)&v13->_windowScene, v11);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  SBApplication *application;
  NSString *sceneIdentifier;
  id WeakRetained;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  application = self->_application;
  sceneIdentifier = self->_sceneIdentifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v8 = (void *)objc_msgSend(v4, "initWithApplication:sceneIdentifier:windowScene:", application, sceneIdentifier, WeakRetained);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SBApplication *application;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    application = self->_application;
    objc_msgSend(v4, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBApplication isEqual:](application, "isEqual:", v6))
    {
      objc_msgSend(v4, "sceneIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
        objc_msgSend(v4, "windowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(WeakRetained, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  id WeakRetained;
  unint64_t v6;

  v3 = -[SBApplication hash](self->_application, "hash");
  v4 = -[NSString hash](self->_sceneIdentifier, "hash") ^ v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v6 = v4 ^ objc_msgSend(WeakRetained, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *sceneIdentifier;
  id WeakRetained;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_SBStatusBarTapApplicationDestination bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneIdentifier = self->_sceneIdentifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p application:%@, sceneID:%@, windowScene:%@>"), v4, self, v5, sceneIdentifier, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SBApplication)application
{
  return self->_application;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
