@implementation SBSUserNotificationImageAssetDefinition

+ (id)_definitionType
{
  return CFSTR("imageAsset");
}

- (SBSUserNotificationImageAssetDefinition)initWithImagePath:(id)a3
{
  return (SBSUserNotificationImageAssetDefinition *)-[SBSUserNotificationImageAssetDefinition _initWithImagePath:imageCatalogPath:catalogImageKey:](self, "_initWithImagePath:imageCatalogPath:catalogImageKey:", a3, 0, 0);
}

- (SBSUserNotificationImageAssetDefinition)initWithImageCatalogPath:(id)a3 catalogImageKey:(id)a4
{
  return (SBSUserNotificationImageAssetDefinition *)-[SBSUserNotificationImageAssetDefinition _initWithImagePath:imageCatalogPath:catalogImageKey:](self, "_initWithImagePath:imageCatalogPath:catalogImageKey:", 0, a3, a4);
}

- (id)_initWithImagePath:(id)a3 imageCatalogPath:(id)a4 catalogImageKey:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SBSUserNotificationImageAssetDefinition *v14;
  id *p_isa;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10 && (!v11 || !v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationImageAssetDefinition.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imagePath || (catalogPath && catalogImageKey)"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  v14 = -[SBSUserNotificationImageAssetDefinition init](&v18, sel_init);
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imagePath, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  v5 = -[SBSUserNotificationAssetDefinition _initWithDictionary:](&v13, sel__initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNImagePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNCatalogPath"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[2];
    v5[2] = v8;

    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNCatalogImageKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (id)build
{
  void *v3;
  void *v4;
  NSString *imagePath;
  NSString *catalogPath;
  NSString *catalogImageKey;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSUserNotificationImageAssetDefinition;
  -[SBSUserNotificationAssetDefinition build](&v10, sel_build);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  imagePath = self->_imagePath;
  if (imagePath)
    objc_msgSend(v4, "setObject:forKey:", imagePath, CFSTR("SBSCFUNImagePath"));
  catalogPath = self->_catalogPath;
  if (catalogPath)
    objc_msgSend(v4, "setObject:forKey:", catalogPath, CFSTR("SBSCFUNCatalogPath"));
  catalogImageKey = self->_catalogImageKey;
  if (catalogImageKey)
    objc_msgSend(v4, "setObject:forKey:", catalogImageKey, CFSTR("SBSCFUNCatalogImageKey"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (NSString)catalogPath
{
  return self->_catalogPath;
}

- (NSString)catalogImageKey
{
  return self->_catalogImageKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogImageKey, 0);
  objc_storeStrong((id *)&self->_catalogPath, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

@end
