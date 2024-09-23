@implementation SBCaptureExtensionWorkspaceEntity

- (SBCaptureExtensionWorkspaceEntity)initWithBundleIdentifier:(id)a3 hostableEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBCaptureExtensionWorkspaceEntity *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CaptureExtension-%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SBCaptureExtensionWorkspaceEntity;
  v9 = -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](&v13, sel_initWithIdentifier_displayChangeSettings_, v8, 0);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_hostableEntity, a4);
  }

  return v9;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (id)_generator
{
  void *v3;
  CSHostableEntity *v4;
  uint64_t v5;
  CSHostableEntity *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  CSHostableEntity *v13;
  uint64_t v14;

  v3 = (void *)-[NSString copy](self->_bundleIdentifier, "copy");
  v4 = self->_hostableEntity;
  v5 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SBCaptureExtensionWorkspaceEntity__generator__block_invoke;
  v11[3] = &unk_1E8EBE2C8;
  v13 = v4;
  v14 = v5;
  v12 = v3;
  v6 = v4;
  v7 = v3;
  v8 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)MEMORY[0x1D17E5550]();

  return v9;
}

id __47__SBCaptureExtensionWorkspaceEntity__generator__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithBundleIdentifier:hostableEntity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)isCaptureExtensionEntity
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  SBCaptureExtensionWorkspaceEntity *v8;
  char v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8 == self)
  {
    v9 = 1;
  }
  else if (v8 && -[NSString isEqualToString:](v8->_bundleIdentifier, "isEqualToString:", self->_bundleIdentifier))
  {
    v9 = -[CSHostableEntity isEqual:](v8->_hostableEntity, "isEqual:", self->_hostableEntity);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCaptureExtensionWorkspaceEntity;
  v4 = -[SBWorkspaceEntity copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_bundleIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v5;

  objc_storeStrong((id *)v4 + 6, self->_hostableEntity);
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CSHostableEntity)hostableEntity
{
  return self->_hostableEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
