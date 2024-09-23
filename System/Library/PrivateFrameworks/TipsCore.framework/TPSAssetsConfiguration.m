@implementation TPSAssetsConfiguration

- (id)identifierForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a3 == 2)
  {
    -[TPSAssetsConfiguration assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thumbnailId");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    -[TPSAssetsConfiguration assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoId");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3)
  {
    v5 = 0;
    goto LABEL_11;
  }
  -[TPSAssetsConfiguration assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TPSAssetsConfiguration assets](self, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[TPSAssetsConfiguration assets](self, "assets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageId");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = (void *)v8;

    }
  }
LABEL_11:
  -[TPSAssetsConfiguration assetFileInfoManager](self, "assetFileInfoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileInfoIdentifierWithMainIdentifier:userInterfaceStyle:", v5, -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (id)cacheIdentifierForType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[TPSAssetsConfiguration identifierForType:](self, "identifierForType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 <= 2)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", off_1E395C8C0[a3]);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
}

- (TPSAssetsConfiguration)initWithAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  TPSAssetsConfiguration *v15;
  TPSAssetsConfiguration *v16;
  TPSAssetsConfiguration *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11
    && ((objc_msgSend(v11, "baseURL"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v12) || !v14))
  {
    v19.receiver = self;
    v19.super_class = (Class)TPSAssetsConfiguration;
    v16 = -[TPSAssetsConfiguration init](&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_assets, a3);
      objc_storeStrong((id *)&v17->_language, a4);
      v17->_userInterfaceStyle = a5;
      objc_storeStrong((id *)&v17->_assetFileInfoManager, a6);
    }
    self = v17;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setUserInterfaceStyle:", -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"));
  -[TPSAssetsConfiguration assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssets:", v5);

  -[TPSAssetsConfiguration language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguage:", v6);

  -[TPSAssetsConfiguration assetFileInfoManager](self, "assetFileInfoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetFileInfoManager:", v7);

  return v4;
}

- (TPSAssetsConfiguration)initWithCoder:(id)a3
{
  id v4;
  TPSAssetsConfiguration *v5;
  uint64_t v6;
  TPSAssets *assets;
  uint64_t v8;
  NSString *language;
  uint64_t v10;
  TPSAssetFileInfoManager *assetFileInfoManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAssetsConfiguration;
  v5 = -[TPSAssetsConfiguration init](&v13, sel_init);
  if (v5)
  {
    v5->_userInterfaceStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userInterface"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assets"));
    v6 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v8 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("files"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetFileInfoManager = v5->_assetFileInfoManager;
    v5->_assetFileInfoManager = (TPSAssetFileInfoManager *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"), CFSTR("userInterface"));
  -[TPSAssetsConfiguration assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assets"));

  -[TPSAssetsConfiguration language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("language"));

  -[TPSAssetsConfiguration assetFileInfoManager](self, "assetFileInfoManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("files"));

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)TPSAssetsConfiguration;
  -[TPSAssetsConfiguration debugDescription](&v13, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSAssetsConfiguration assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSAssetsConfiguration assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("assets"), v8);

  }
  -[TPSAssetsConfiguration language](self, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TPSAssetsConfiguration language](self, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("language"), v10);

  }
  -[TPSAssetsConfiguration assetFileInfoManager](self, "assetFileInfoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %ld\n"), CFSTR("files"), v11);

  objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %ld\n"), CFSTR("userInterface"), -[TPSAssetsConfiguration userInterfaceStyle](self, "userInterfaceStyle"));
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setAssetFileInfoManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
