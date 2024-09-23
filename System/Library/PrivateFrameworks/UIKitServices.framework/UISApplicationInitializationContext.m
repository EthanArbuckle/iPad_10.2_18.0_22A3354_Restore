@implementation UISApplicationInitializationContext

- (FBSSceneIdentityToken)defaultSceneToken
{
  return self->_defaultSceneToken;
}

- (NSSet)persistedSceneIdentifiers
{
  return self->_persistedSceneIdentifiers;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISApplicationInitializationContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UISApplicationInitializationContext *v13;
  UISApplicationInitializationContext *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UISMainDisplayContextKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UISLaunchDisplayContextKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UISDeviceContextKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UISCompatibilityContextKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("_UISPersistedSceneIdentifiersKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UISDefaultSceneTokenKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UISSupportAppSceneRequestsKey"));

  v13 = -[UISApplicationInitializationContext initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:](self, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v5, v6, v7, v10, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_defaultSceneToken, v11);
    objc_storeStrong((id *)&v14->_compatibilityContext, v8);
  }

  return v14;
}

- (UISApplicationInitializationContext)initWithMainDisplayContext:(id)a3 launchDisplayContext:(id)a4 deviceContext:(id)a5 persistedSceneIdentifiers:(id)a6 supportAppSceneRequests:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UISApplicationInitializationContext *v17;
  uint64_t v18;
  UISDisplayContext *mainDisplayContext;
  uint64_t v20;
  UISDisplayContext *launchDisplayContext;
  uint64_t v22;
  UISDeviceContext *deviceContext;
  uint64_t v24;
  NSSet *persistedSceneIdentifiers;
  void *v27;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationInitializationContext.m"), 116, CFSTR("%s: Invalid display contexts specified. Providing a launch display context without an initial display context is not supported: mainDisplayContext: %@; launchDisplayContext: %@"),
      "-[UISApplicationInitializationContext initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedScene"
      "Identifiers:supportAppSceneRequests:]",
      0,
      v14);

  }
  v28.receiver = self;
  v28.super_class = (Class)UISApplicationInitializationContext;
  v17 = -[UISApplicationInitializationContext init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    mainDisplayContext = v17->_mainDisplayContext;
    v17->_mainDisplayContext = (UISDisplayContext *)v18;

    v20 = objc_msgSend(v14, "copy");
    launchDisplayContext = v17->_launchDisplayContext;
    v17->_launchDisplayContext = (UISDisplayContext *)v20;

    v22 = objc_msgSend(v15, "copy");
    deviceContext = v17->_deviceContext;
    v17->_deviceContext = (UISDeviceContext *)v22;

    v24 = objc_msgSend(v16, "copy");
    persistedSceneIdentifiers = v17->_persistedSceneIdentifiers;
    v17->_persistedSceneIdentifiers = (NSSet *)v24;

    v17->_supportAppSceneRequests = a7;
  }

  return v17;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  UISDisplayContext *mainDisplayContext;
  id v5;

  mainDisplayContext = self->_mainDisplayContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mainDisplayContext, CFSTR("_UISMainDisplayContextKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchDisplayContext, CFSTR("_UISLaunchDisplayContextKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceContext, CFSTR("_UISDeviceContextKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compatibilityContext, CFSTR("_UISCompatibilityContextKey"));
  objc_msgSend(v5, "encodeCollection:forKey:", self->_persistedSceneIdentifiers, CFSTR("_UISPersistedSceneIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultSceneToken, CFSTR("_UISDefaultSceneTokenKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportAppSceneRequests, CFSTR("_UISSupportAppSceneRequestsKey"));

}

- (UISDisplayContext)mainDisplayContext
{
  return self->_mainDisplayContext;
}

- (UISDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (BOOL)supportAppSceneRequests
{
  return self->_supportAppSceneRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSceneToken, 0);
  objc_storeStrong((id *)&self->_persistedSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_compatibilityContext, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_launchDisplayContext, 0);
  objc_storeStrong((id *)&self->_mainDisplayContext, 0);
}

+ (id)defaultContext
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  +[UISDeviceContext defaultContext](UISDeviceContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc((Class)a1);
  +[UISDisplayContext defaultContext](UISDisplayContext, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "deviceInfoIntegerValueForKey:", CFSTR("UISDeviceContextDeviceClassKey"));
    if ((v8 + 1) <= 4)
      v9 = (0x19u >> (v8 + 1)) & 1;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }

  v10 = (void *)objc_msgSend(v4, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v5, 0, v7, 0, v9);
  return v10;
}

- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  UISApplicationInitializationContext *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = v11;
  if (v11
    && (v13 = objc_msgSend(v11, "deviceInfoIntegerValueForKey:", CFSTR("UISDeviceContextDeviceClassKey")) + 1, v13 <= 4))
  {
    v14 = (0x19u >> v13) & 1;
  }
  else
  {
    v14 = 0;
  }

  v15 = -[UISApplicationInitializationContext initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:](self, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v8, 0, v12, v10, v14);
  return v15;
}

- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5 supportAppSceneRequests:(BOOL)a6
{
  return -[UISApplicationInitializationContext initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:](self, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", a3, 0, a4, a5, a6);
}

- (UISApplicationInitializationContext)initWithUISApplicationInitializationContext:(id)a3
{
  id v4;
  UISApplicationInitializationContext *v5;
  uint64_t v6;
  UISDisplayContext *mainDisplayContext;
  uint64_t v8;
  UISDisplayContext *launchDisplayContext;
  uint64_t v10;
  UISDeviceContext *deviceContext;
  uint64_t v12;
  UISCompatibilityContext *compatibilityContext;
  uint64_t v14;
  NSSet *persistedSceneIdentifiers;
  uint64_t v16;
  FBSSceneIdentityToken *defaultSceneToken;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UISApplicationInitializationContext;
  v5 = -[UISApplicationInitializationContext init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 1), "copy");
    mainDisplayContext = v5->_mainDisplayContext;
    v5->_mainDisplayContext = (UISDisplayContext *)v6;

    v8 = objc_msgSend(*((id *)v4 + 2), "copy");
    launchDisplayContext = v5->_launchDisplayContext;
    v5->_launchDisplayContext = (UISDisplayContext *)v8;

    v10 = objc_msgSend(*((id *)v4 + 3), "copy");
    deviceContext = v5->_deviceContext;
    v5->_deviceContext = (UISDeviceContext *)v10;

    v12 = objc_msgSend(*((id *)v4 + 4), "copy");
    compatibilityContext = v5->_compatibilityContext;
    v5->_compatibilityContext = (UISCompatibilityContext *)v12;

    v14 = objc_msgSend(*((id *)v4 + 5), "copy");
    persistedSceneIdentifiers = v5->_persistedSceneIdentifiers;
    v5->_persistedSceneIdentifiers = (NSSet *)v14;

    v16 = objc_msgSend(*((id *)v4 + 6), "copy");
    defaultSceneToken = v5->_defaultSceneToken;
    v5->_defaultSceneToken = (FBSSceneIdentityToken *)v16;

    v5->_supportAppSceneRequests = *((_BYTE *)v4 + 56);
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationInitializationContext.m"), 205, CFSTR("%s is not supported"), "-[UISApplicationInitializationContext encodeWithXPCDictionary:]");

}

- (UISApplicationInitializationContext)initWithXPCDictionary:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationInitializationContext.m"), 209, CFSTR("%s is not supported"), "-[UISApplicationInitializationContext initWithXPCDictionary:]");

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UISApplicationInitializationContext initWithUISApplicationInitializationContext:]([UISMutableApplicationInitializationContext alloc], "initWithUISApplicationInitializationContext:", self);
}

- (BOOL)isEqual:(id)a3
{
  UISApplicationInitializationContext *v4;
  UISApplicationInitializationContext *v5;
  UISApplicationInitializationContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v20;
  id v21;
  void *v22;

  v4 = (UISApplicationInitializationContext *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[UISApplicationInitializationContext mainDisplayContext](self, "mainDisplayContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISApplicationInitializationContext mainDisplayContext](v6, "mainDisplayContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      -[UISApplicationInitializationContext launchDisplayContext](self, "launchDisplayContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISApplicationInitializationContext launchDisplayContext](v6, "launchDisplayContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[UISApplicationInitializationContext compatibilityContext](self, "compatibilityContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISApplicationInitializationContext compatibilityContext](v6, "compatibilityContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[UISApplicationInitializationContext deviceContext](self, "deviceContext");
          v13 = objc_claimAutoreleasedReturnValue();
          -[UISApplicationInitializationContext deviceContext](v6, "deviceContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)v13;
          if ((void *)v13 == v14)
          {
            v21 = v14;
            -[UISApplicationInitializationContext defaultSceneToken](self, "defaultSceneToken");
            v16 = objc_claimAutoreleasedReturnValue();
            -[UISApplicationInitializationContext defaultSceneToken](v6, "defaultSceneToken");
            v20 = (void *)v16;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (BSEqualObjects())
            {
              v18 = -[UISApplicationInitializationContext supportAppSceneRequests](self, "supportAppSceneRequests");
              v15 = v18 ^ -[UISApplicationInitializationContext supportAppSceneRequests](v6, "supportAppSceneRequests") ^ 1;
            }
            else
            {
              LOBYTE(v15) = 0;
            }

            v14 = v21;
          }
          else
          {
            LOBYTE(v15) = 0;
          }

        }
        else
        {
          LOBYTE(v15) = 0;
        }

      }
      else
      {
        LOBYTE(v15) = 0;
      }

    }
    else
    {
      LOBYTE(v15) = 0;
    }

  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL8 supportAppSceneRequests;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[FBSSceneIdentityToken hash](self->_defaultSceneToken, "hash");
  supportAppSceneRequests = self->_supportAppSceneRequests;
  -[UISApplicationInitializationContext mainDisplayContext](self, "mainDisplayContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[UISApplicationInitializationContext launchDisplayContext](self, "launchDisplayContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v6;
  -[UISApplicationInitializationContext deviceContext](self, "deviceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[UISApplicationInitializationContext compatibilityContext](self, "compatibilityContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3 + supportAppSceneRequests + (v8 ^ v10 ^ objc_msgSend(v11, "hash"));

  return v12;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_mainDisplayContext, CFSTR("MainDisplayContext"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_launchDisplayContext, CFSTR("LaunchDisplayContext"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_deviceContext, CFSTR("DeviceContext"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_compatibilityContext, CFSTR("CompatibilityContext"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_defaultSceneToken, CFSTR("DefaultSceneToken"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_supportAppSceneRequests, CFSTR("SupportAppSceneRequests"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (UISDisplayContext)launchDisplayContext
{
  return self->_launchDisplayContext;
}

- (UISCompatibilityContext)compatibilityContext
{
  return self->_compatibilityContext;
}

@end
