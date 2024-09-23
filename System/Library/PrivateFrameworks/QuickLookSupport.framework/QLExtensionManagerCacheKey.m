@implementation QLExtensionManagerCacheKey

- (unint64_t)hash
{
  unint64_t v3;

  v3 = ((unint64_t)self->_allowParentTypes << 9) | (-[NSDictionary hash](self->_attributes, "hash") << 10) | ((unint64_t)self->_wantsFirstPartyExtension << 8);
  return v3 & 0xFFFFFFFFFFFFFF00 | -[NSString hash](self->_extensionPath, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPath, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (QLExtensionManagerCacheKey)initWithAttributes:(id)a3 allowParentTypes:(BOOL)a4 wantsFirstPartyExtension:(BOOL)a5 extensionPath:(id)a6
{
  id v11;
  id v12;
  QLExtensionManagerCacheKey *v13;
  QLExtensionManagerCacheKey *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)QLExtensionManagerCacheKey;
  v13 = -[QLExtensionManagerCacheKey init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_attributes, a3);
    v14->_allowParentTypes = a4;
    v14->_wantsFirstPartyExtension = a5;
    objc_storeStrong((id *)&v14->_extensionPath, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  QLExtensionManagerCacheKey *v5;
  QLExtensionManagerCacheKey *v6;
  void *v7;
  NSString *v8;
  NSString *extensionPath;
  BOOL v10;

  v5 = (QLExtensionManagerCacheKey *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[QLExtensionManagerCacheKey attributes](v6, "attributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", self->_attributes))
      {
        v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
      -[QLExtensionManagerCacheKey extensionPath](v6, "extensionPath");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      extensionPath = self->_extensionPath;
      if (v8 == extensionPath
        || (-[QLExtensionManagerCacheKey extensionPath](v6, "extensionPath"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", self->_extensionPath)))
      {
        v10 = self->_allowParentTypes == -[QLExtensionManagerCacheKey allowParentTypes](v6, "allowParentTypes")
           && self->_wantsFirstPartyExtension == -[QLExtensionManagerCacheKey wantsFirstPartyExtension](v6, "wantsFirstPartyExtension");
        if (v8 == extensionPath)
          goto LABEL_15;
      }
      else
      {
        v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)extensionPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)allowParentTypes
{
  return self->_allowParentTypes;
}

- (BOOL)wantsFirstPartyExtension
{
  return self->_wantsFirstPartyExtension;
}

@end
