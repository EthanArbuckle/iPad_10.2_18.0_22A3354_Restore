@implementation _UICoreUICatalogColorWrapper

- (_UICoreUICatalogColorWrapper)initWithName:(id)a3 bundleID:(id)a4 fallbackColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UICoreUICatalogColorWrapper *v12;
  _UICoreUICatalogColorWrapper *v13;
  void *v14;
  uint64_t v15;
  NSString *nibLoadingBundleID;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UICoreUICatalogColorWrapper;
  v12 = -[_UICoreUICatalogColorWrapper init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_bundleID, a4);
    objc_storeStrong((id *)&v13->_fallbackColor, a5);
    if (!v13->_bundleID)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "currentNibLoadingBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      nibLoadingBundleID = v13->_nibLoadingBundleID;
      v13->_nibLoadingBundleID = (NSString *)v15;

    }
  }

  return v13;
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", self->_bundleID);
}

- (id)nibLoadingBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", self->_nibLoadingBundleID);
}

- (id)colorCache
{
  NSMutableDictionary *colorCache;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  colorCache = self->_colorCache;
  if (!colorCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_colorCache;
    self->_colorCache = v4;

    colorCache = self->_colorCache;
  }
  return colorCache;
}

- (id)cachedColorForDisplayGamut:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[_UICoreUICatalogColorWrapper colorCache](self, "colorCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCachedColor:(id)a3 forDisplayGamut:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[_UICoreUICatalogColorWrapper colorCache](self, "colorCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

}

- (CGColor)cgColorForTraitCollection:(id)a3
{
  id v3;
  CGColor *v4;

  -[_UICoreUICatalogColorWrapper _uikit_valueForTraitCollection:](self, "_uikit_valueForTraitCollection:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  return v4;
}

- (BOOL)_uikit_variesByTraitCollections
{
  return 1;
}

- (id)_uikit_valueForTraitCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  UIColor *fallbackColor;
  void *v10;
  void *v11;
  void *v12;
  NSString *name;
  void *v14;
  UIColor *v15;
  _QWORD aBlock[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__116;
  v24 = __Block_byref_object_dispose__116;
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UICoreUICatalogColorWrapper__uikit_valueForTraitCollection___block_invoke;
  aBlock[3] = &unk_1E16CC988;
  v19 = &v20;
  aBlock[4] = self;
  v5 = v4;
  v18 = v5;
  v6 = _Block_copy(aBlock);
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (self->_bundleID)
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  else
  {
    (*((void (**)(void *, NSString *))v6 + 2))(v6, self->_nibLoadingBundleID);
    _UIMainBundleIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  }
  fallbackColor = (UIColor *)v21[5];
  if (!fallbackColor)
  {
    if (self->_hasLoggedFailure)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (self->_bundleID)
    {
      objc_msgSend(v10, "addObject:");
    }
    else
    {
      if (self->_nibLoadingBundleID)
        objc_msgSend(v10, "addObject:");
      _UIMainBundleIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
    name = self->_name;
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WARNING: Unable to resolve the color named \"%@\" from any of the following bundles: %@"), name, v14);

    self->_hasLoggedFailure = 1;
    fallbackColor = (UIColor *)v21[5];
    if (!fallbackColor)
LABEL_6:
      fallbackColor = self->_fallbackColor;
  }
  v15 = fallbackColor;

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (_UICoreUICatalogColorWrapper)initWithCoder:(id)a3
{
  id v4;
  _UICoreUICatalogColorWrapper *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  UIColor *fallbackColor;
  void *v12;
  uint64_t v13;
  NSString *nibLoadingBundleID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UICoreUICatalogColorWrapper;
  v5 = -[_UICoreUICatalogColorWrapper init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAssetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAssetBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFallbackColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    fallbackColor = v5->_fallbackColor;
    v5->_fallbackColor = (UIColor *)v10;

    if (!v5->_bundleID)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "currentNibLoadingBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      nibLoadingBundleID = v5->_nibLoadingBundleID;
      v5->_nibLoadingBundleID = (NSString *)v13;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("UIAssetName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("UIAssetBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackColor, CFSTR("UIFallbackColor"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *bundleID;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleID)
    bundleID = (const __CFString *)self->_bundleID;
  else
    bundleID = CFSTR("<main>");
  -[_UICoreUICatalogColorWrapper name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@ %@>"), v5, self, bundleID, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqualToCoreUICatalogColor:(id)a3
{
  void *v3;
  _UICoreUICatalogColorWrapper *v5;
  _UICoreUICatalogColorWrapper *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *bundleID;
  NSString *v12;
  NSString *v13;
  void *v14;

  v5 = (_UICoreUICatalogColorWrapper *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      name = self->_name;
      -[_UICoreUICatalogColorWrapper name](v6, "name");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (name == v8
        || (v9 = self->_name,
            -[_UICoreUICatalogColorWrapper name](v6, "name"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v9, "isEqualToString:", v3)))
      {
        bundleID = self->_bundleID;
        -[_UICoreUICatalogColorWrapper bundleID](v6, "bundleID");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (bundleID == v12)
        {
          v10 = 1;
        }
        else
        {
          v13 = self->_bundleID;
          -[_UICoreUICatalogColorWrapper bundleID](v6, "bundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

        }
        if (name == v8)
          goto LABEL_13;
      }
      else
      {
        v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[_UICoreUICatalogColorWrapper isEqualToCoreUICatalogColor:](self, "isEqualToCoreUICatalogColor:", v4);

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_bundleID, "hash") ^ v3;
}

- (UIColor)color
{
  return (UIColor *)-[_UICoreUICatalogColorWrapper _uikit_valueForTraitCollection:](self, "_uikit_valueForTraitCollection:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_nibLoadingBundleID, 0);
}

@end
