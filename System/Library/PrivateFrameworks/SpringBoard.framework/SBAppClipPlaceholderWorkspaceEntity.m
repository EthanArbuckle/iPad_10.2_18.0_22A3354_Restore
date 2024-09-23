@implementation SBAppClipPlaceholderWorkspaceEntity

+ (BOOL)isAppClipUpdateAvailableForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v8;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  objc_msgSend(v5, "appClipMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "updateAvailability") == 1 && v6 != 0;
  return v8;
}

- (SBAppClipPlaceholderWorkspaceEntity)initWithBundleIdentifier:(id)a3 futureSceneIdentifier:(id)a4 needsUpdate:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  SBAppClipPlaceholderWorkspaceEntity *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  uint64_t v15;
  NSString *futureSceneIdentifier;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderWorkspaceEntity.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("futureSceneIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderWorkspaceEntity.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Placeholder-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)SBAppClipPlaceholderWorkspaceEntity;
  v12 = -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](&v20, sel_initWithIdentifier_displayChangeSettings_, v11, 0);

  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    futureSceneIdentifier = v12->_futureSceneIdentifier;
    v12->_futureSceneIdentifier = (NSString *)v15;

    v12->_needsUpdate = a5;
  }

  return v12;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)supportsPresentationAtAnySize
{
  return 0;
}

- (BOOL)wantsExclusiveForeground
{
  return 0;
}

- (id)entityGenerator
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  BOOL needsUpdate;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  BOOL v20;

  v4 = self->_bundleIdentifier;
  v5 = self->_futureSceneIdentifier;
  v6 = v5;
  needsUpdate = self->_needsUpdate;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderWorkspaceEntity.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipPlaceholderWorkspaceEntity.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("futureSceneIdentifier"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v8 = objc_opt_class();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__SBAppClipPlaceholderWorkspaceEntity_entityGenerator__block_invoke;
  v16[3] = &unk_1E8EA5E38;
  v18 = v6;
  v19 = v8;
  v17 = v4;
  v20 = needsUpdate;
  v9 = v6;
  v10 = v4;
  v11 = (void *)MEMORY[0x1D17E5550](v16);
  v12 = (void *)MEMORY[0x1D17E5550]();

  return v12;
}

id __54__SBAppClipPlaceholderWorkspaceEntity_entityGenerator__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (Class)viewControllerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAppClipPlaceholderEntity
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SBAppClipPlaceholderWorkspaceEntity *v4;
  SBAppClipPlaceholderWorkspaceEntity *v5;
  NSString *bundleIdentifier;
  void *v7;
  NSString *futureSceneIdentifier;
  void *v9;
  char v10;

  v4 = (SBAppClipPlaceholderWorkspaceEntity *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      -[SBAppClipPlaceholderWorkspaceEntity bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](bundleIdentifier, "isEqualToString:", v7))
      {
        futureSceneIdentifier = self->_futureSceneIdentifier;
        -[SBAppClipPlaceholderWorkspaceEntity futureSceneIdentifier](v5, "futureSceneIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](futureSceneIdentifier, "isEqualToString:", v9);

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

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_futureSceneIdentifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBAppClipPlaceholderWorkspaceEntity;
  v4 = -[SBWorkspaceEntity copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_bundleIdentifier, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_futureSceneIdentifier, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  *((_BYTE *)v4 + 40) = self->_needsUpdate;
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)futureSceneIdentifier
{
  return self->_futureSceneIdentifier;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
