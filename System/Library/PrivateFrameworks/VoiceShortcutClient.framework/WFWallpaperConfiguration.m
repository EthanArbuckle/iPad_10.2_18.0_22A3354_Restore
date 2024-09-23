@implementation WFWallpaperConfiguration

- (WFWallpaperConfiguration)initWithURL:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7
{
  return -[WFWallpaperConfiguration initWithAssetURL:localIdentifier:location:legibilityBlur:smartCrop:usePreview:](self, "initWithAssetURL:localIdentifier:location:legibilityBlur:smartCrop:usePreview:", a3, 0, a4, a5, a6, a7);
}

- (WFWallpaperConfiguration)initWithLocalIdentifier:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7
{
  return -[WFWallpaperConfiguration initWithAssetURL:localIdentifier:location:legibilityBlur:smartCrop:usePreview:](self, "initWithAssetURL:localIdentifier:location:legibilityBlur:smartCrop:usePreview:", 0, a3, a4, a5, a6, a7);
}

- (WFWallpaperConfiguration)initWithAssetURL:(id)a3 localIdentifier:(id)a4 location:(int64_t)a5 legibilityBlur:(id)a6 smartCrop:(id)a7 usePreview:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WFWallpaperConfiguration *v19;
  WFWallpaperConfiguration *v20;
  uint64_t v21;
  NSSecurityScopedURLWrapper *assetURLWrapper;
  uint64_t v23;
  NSString *assetIdentifier;
  WFWallpaperConfiguration *v25;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)WFWallpaperConfiguration;
  v19 = -[WFWallpaperConfiguration init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    if (v14)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v14, 1);
      assetURLWrapper = v20->_assetURLWrapper;
      v20->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v21;
    }
    else
    {
      assetURLWrapper = v19->_assetURLWrapper;
      v19->_assetURLWrapper = 0;
    }

    v23 = objc_msgSend(v15, "copy");
    assetIdentifier = v20->_assetIdentifier;
    v20->_assetIdentifier = (NSString *)v23;

    v20->_location = a5;
    objc_storeStrong((id *)&v20->_legibilityBlur, a6);
    objc_storeStrong((id *)&v20->_smartCrop, a7);
    objc_storeStrong((id *)&v20->_usePreview, a8);
    v25 = v20;
  }

  return v20;
}

- (WFWallpaperConfiguration)initWithUserInfo:(id)a3
{
  id v4;
  WFWallpaperConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSSecurityScopedURLWrapper *assetURLWrapper;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *assetIdentifier;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSNumber *v23;
  NSNumber *legibilityBlur;
  void *v25;
  void *v26;
  NSNumber *v27;
  NSNumber *smartCrop;
  void *v29;
  void *v30;
  NSNumber *v31;
  NSNumber *usePreview;
  WFWallpaperConfiguration *v33;
  NSObject *v34;
  objc_super v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WFWallpaperConfiguration;
  v5 = -[WFWallpaperConfiguration init](&v36, sel_init);
  if (!v5)
  {
LABEL_38:
    v33 = 0;
    goto LABEL_39;
  }
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("wf_assetURLWrapper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();

  assetURLWrapper = v5->_assetURLWrapper;
  v5->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v11;

  objc_msgSend(v4, "objectForKey:", CFSTR("wf_assetIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  assetIdentifier = v5->_assetIdentifier;
  v5->_assetIdentifier = v15;

  objc_msgSend(v4, "objectForKey:", CFSTR("wf_wallpaperLocation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  v20 = objc_msgSend(v19, "integerValue");
  v5->_location = v20;
  objc_msgSend(v4, "objectForKey:", CFSTR("wf_legibilityBlur"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  legibilityBlur = v5->_legibilityBlur;
  v5->_legibilityBlur = v23;

  objc_msgSend(v4, "objectForKey:", CFSTR("wf_smartCrop"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  smartCrop = v5->_smartCrop;
  v5->_smartCrop = v27;

  objc_msgSend(v4, "objectForKey:", CFSTR("wf_usePreview"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  usePreview = v5->_usePreview;
  v5->_usePreview = v31;

  if (!v5->_assetURLWrapper && !v5->_assetIdentifier)
  {
    v34 = os_log_create("com.apple.shortcuts", "Actions");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_impl(&dword_1AF681000, v34, OS_LOG_TYPE_DEFAULT, "Unable to make wallpaper configuration from userInfo due to missing asset URL and identifier: %@", buf, 0xCu);
    }

    goto LABEL_38;
  }
  v33 = v5;
LABEL_39:

  return v33;
}

- (id)userInfoRepresentation
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
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFWallpaperConfiguration assetIdentifier](self, "assetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v4, CFSTR("wf_assetIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFWallpaperConfiguration location](self, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, CFSTR("wf_wallpaperLocation"));

  -[WFWallpaperConfiguration legibilityBlur](self, "legibilityBlur");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, CFSTR("wf_legibilityBlur"));

  -[WFWallpaperConfiguration smartCrop](self, "smartCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, CFSTR("wf_smartCrop"));

  -[WFWallpaperConfiguration usePreview](self, "usePreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v8, CFSTR("wf_usePreview"));

  -[WFWallpaperConfiguration assetURLWrapper](self, "assetURLWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[WFWallpaperConfiguration assetURLWrapper](self, "assetURLWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v12, CFSTR("wf_assetURLWrapper"));
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (NSURL)assetURL
{
  void *v2;
  void *v3;

  -[WFWallpaperConfiguration assetURLWrapper](self, "assetURLWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)WFWallpaperConfiguration;
  -[WFWallpaperConfiguration description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWallpaperConfiguration assetURL](self, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWallpaperConfiguration assetIdentifier](self, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFWallpaperConfiguration location](self, "location");
  if (v7 > 2)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E5FC6AF8[v7];
  -[WFWallpaperConfiguration legibilityBlur](self, "legibilityBlur");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWallpaperConfiguration smartCrop](self, "smartCrop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWallpaperConfiguration usePreview](self, "usePreview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, assetURL: %@, assetID: %@, location: %@, legibilityBlur: %@, smartCrop: %@, usePreview: %@"), v4, v5, v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (WFWallpaperConfiguration)initWithCoder:(id)a3
{
  id v4;
  WFWallpaperConfiguration *v5;
  uint64_t v6;
  NSSecurityScopedURLWrapper *assetURLWrapper;
  uint64_t v8;
  NSString *assetIdentifier;
  uint64_t v10;
  NSNumber *legibilityBlur;
  uint64_t v12;
  NSNumber *smartCrop;
  uint64_t v14;
  NSNumber *usePreview;
  WFWallpaperConfiguration *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFWallpaperConfiguration;
  v5 = -[WFWallpaperConfiguration init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetURLWrapper"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetURLWrapper = v5->_assetURLWrapper;
    v5->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetIdentifier = v5->_assetIdentifier;
    v5->_assetIdentifier = (NSString *)v8;

    v5->_location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("location"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legibilityBlur"));
    v10 = objc_claimAutoreleasedReturnValue();
    legibilityBlur = v5->_legibilityBlur;
    v5->_legibilityBlur = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartCrop"));
    v12 = objc_claimAutoreleasedReturnValue();
    smartCrop = v5->_smartCrop;
    v5->_smartCrop = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usePreview"));
    v14 = objc_claimAutoreleasedReturnValue();
    usePreview = v5->_usePreview;
    v5->_usePreview = (NSNumber *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFWallpaperConfiguration assetURLWrapper](self, "assetURLWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetURLWrapper"));

  -[WFWallpaperConfiguration assetIdentifier](self, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWallpaperConfiguration location](self, "location"), CFSTR("location"));
  -[WFWallpaperConfiguration legibilityBlur](self, "legibilityBlur");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("legibilityBlur"));

  -[WFWallpaperConfiguration smartCrop](self, "smartCrop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("smartCrop"));

  -[WFWallpaperConfiguration usePreview](self, "usePreview");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("usePreview"));

}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (int64_t)location
{
  return self->_location;
}

- (NSNumber)usePreview
{
  return self->_usePreview;
}

- (NSNumber)legibilityBlur
{
  return self->_legibilityBlur;
}

- (NSNumber)smartCrop
{
  return self->_smartCrop;
}

- (NSSecurityScopedURLWrapper)assetURLWrapper
{
  return self->_assetURLWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLWrapper, 0);
  objc_storeStrong((id *)&self->_smartCrop, 0);
  objc_storeStrong((id *)&self->_legibilityBlur, 0);
  objc_storeStrong((id *)&self->_usePreview, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
