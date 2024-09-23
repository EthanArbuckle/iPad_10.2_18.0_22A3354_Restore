@implementation UIDynamicCatalogColor

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[_UIAssetManager hash](self->_assetManager, "hash");
  return -[NSString hash](self->_name, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  UIDynamicCatalogColor *v4;
  BOOL v5;

  v4 = (UIDynamicCatalogColor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_assetManager == v4->_assetManager
      && -[NSString isEqualToString:](self->_name, "isEqualToString:", v4->_name);
  }

  return v5;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *genericColor;

  v4 = a3;
  os_unfair_lock_lock(&self->_cachedColorLock);
  v5 = _UIThemeKeyValueFromTraitCollection(v4);
  v6 = v5;
  if (self->_cachedColor && self->_cachedThemeKey == v5)
  {
    v7 = self->_cachedColor;
  }
  else
  {
    os_unfair_lock_unlock(&self->_cachedColorLock);
    -[_UIAssetManager resolvedColorNamed:withTraitCollection:](self->_assetManager, "resolvedColorNamed:withTraitCollection:", self->_name, v4);
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    genericColor = v8;
    if (!v8)
      genericColor = self->_genericColor;
    v7 = genericColor;

    os_unfair_lock_lock(&self->_cachedColorLock);
    objc_storeStrong((id *)&self->_cachedColor, genericColor);
    self->_cachedThemeKey = v6;
  }
  os_unfair_lock_unlock(&self->_cachedColorLock);

  return v7;
}

- (id)initWithName:(void *)a3 assetManager:(void *)a4 genericColor:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_7;
  if (v8)
  {
    if (v9)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithName_assetManager_genericColor_, a1, CFSTR("UIColor.m"), 4770, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetManager != nil"));

    if (v10)
      goto LABEL_5;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithName_assetManager_genericColor_, a1, CFSTR("UIColor.m"), 4769, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  if (!v9)
    goto LABEL_9;
LABEL_4:
  if (v10)
    goto LABEL_5;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithName_assetManager_genericColor_, a1, CFSTR("UIColor.m"), 4771, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("genericColor != nil"));

LABEL_5:
  v16.receiver = a1;
  v16.super_class = (Class)UIDynamicCatalogColor;
  v11 = (id *)objc_msgSendSuper2(&v16, sel_init);
  a1 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 3, a2);
    objc_storeStrong(a1 + 4, a3);
    objc_storeStrong(a1 + 5, a4);
    *((_DWORD *)a1 + 12) = 0;
  }
LABEL_7:

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_genericColor, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  _UIAssetManager *assetManager;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("UIDynamicCatalogName"));
  assetManager = self->_assetManager;
  if (assetManager)
  {
    -[_UIAssetManager bundle](assetManager, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("UIDynamicCatalogBundleIdentifier"));

    objc_msgSend(v7, "executablePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("UIDynamicCatalogBundleLibraryName"));

  }
  else
  {
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("UIDynamicCatalogUseNibBundle"));
  }
  v11.receiver = self;
  v11.super_class = (Class)UIDynamicCatalogColor;
  -[UIColor encodeWithCoder:](&v11, sel_encodeWithCoder_, v5);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@>"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_debugName
{
  return self->_name;
}

- (id)_debugCatalogBundleIdentifier
{
  void *v2;
  void *v3;

  -[_UIAssetManager bundle](self->_assetManager, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
