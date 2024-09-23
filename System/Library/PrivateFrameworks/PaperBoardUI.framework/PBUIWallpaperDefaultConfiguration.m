@implementation PBUIWallpaperDefaultConfiguration

- (id)initStaticWithImageURL:(id)a3
{
  id v4;
  PBUIWallpaperDefaultConfiguration *v5;
  PBUIWallpaperDefaultConfiguration *v6;
  uint64_t v7;
  NSURL *staticImageURL;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = -[PBUIWallpaperDefaultConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 1;
    v7 = objc_msgSend(v4, "copy");
    staticImageURL = v6->_staticImageURL;
    v6->_staticImageURL = (NSURL *)v7;

  }
  return v6;
}

- (id)initVideoWithStaticImageURL:(id)a3 videoURL:(id)a4
{
  id v6;
  id v7;
  PBUIWallpaperDefaultConfiguration *v8;
  PBUIWallpaperDefaultConfiguration *v9;
  uint64_t v10;
  NSURL *staticImageURL;
  uint64_t v12;
  NSURL *videoURL;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v8 = -[PBUIWallpaperDefaultConfiguration init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_wallpaperType = 3;
    v10 = objc_msgSend(v6, "copy");
    staticImageURL = v9->_staticImageURL;
    v9->_staticImageURL = (NSURL *)v10;

    v12 = objc_msgSend(v7, "copy");
    videoURL = v9->_videoURL;
    v9->_videoURL = (NSURL *)v12;

  }
  return v9;
}

- (id)initProceduralWithIdentifier:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  PBUIWallpaperDefaultConfiguration *v8;
  PBUIWallpaperDefaultConfiguration *v9;
  uint64_t v10;
  NSString *proceduralWallpaperIdentifier;
  uint64_t v12;
  NSDictionary *proceduralWallpaperOptions;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v8 = -[PBUIWallpaperDefaultConfiguration init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_wallpaperType = 2;
    v10 = objc_msgSend(v6, "copy");
    proceduralWallpaperIdentifier = v9->_proceduralWallpaperIdentifier;
    v9->_proceduralWallpaperIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    proceduralWallpaperOptions = v9->_proceduralWallpaperOptions;
    v9->_proceduralWallpaperOptions = (NSDictionary *)v12;

  }
  return v9;
}

- (id)initColorWithColor:(id)a3
{
  id v4;
  PBUIWallpaperDefaultConfiguration *v5;
  PBUIWallpaperDefaultConfiguration *v6;
  uint64_t v7;
  UIColor *wallpaperColor;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = -[PBUIWallpaperDefaultConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 4;
    v7 = objc_msgSend(v4, "copy");
    wallpaperColor = v6->_wallpaperColor;
    v6->_wallpaperColor = (UIColor *)v7;

  }
  return v6;
}

- (id)initColorWithColorName:(id)a3
{
  id v4;
  PBUIWallpaperDefaultConfiguration *v5;
  PBUIWallpaperDefaultConfiguration *v6;
  uint64_t v7;
  NSString *wallpaperColorName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = -[PBUIWallpaperDefaultConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 4;
    v7 = objc_msgSend(v4, "copy");
    wallpaperColorName = v6->_wallpaperColorName;
    v6->_wallpaperColorName = (NSString *)v7;

  }
  return v6;
}

- (id)initGradientWithGradient:(id)a3
{
  id v4;
  PBUIWallpaperDefaultConfiguration *v5;
  PBUIWallpaperDefaultConfiguration *v6;
  uint64_t v7;
  PBUIWallpaperGradient *wallpaperGradient;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = -[PBUIWallpaperDefaultConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 5;
    v7 = objc_msgSend(v4, "copy");
    wallpaperGradient = v6->_wallpaperGradient;
    v6->_wallpaperGradient = (PBUIWallpaperGradient *)v7;

  }
  return v6;
}

- (PBUIWallpaperDefaultConfiguration)init
{
  PBUIWallpaperDefaultConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  result = -[PBUIWallpaperDefaultConfiguration init](&v3, sel_init);
  if (result)
    result->_wallpaperType = 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PBUIWallpaperDefaultConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PBUIWallpaperDefaultConfiguration *v7;
  int64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;

  v4 = (PBUIWallpaperDefaultConfiguration *)a3;
  if (self == v4)
  {
    v29 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[PBUIWallpaperDefaultConfiguration wallpaperType](self, "wallpaperType");
      if (v8 != -[PBUIWallpaperDefaultConfiguration wallpaperType](v7, "wallpaperType"))
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration staticImageURL](self, "staticImageURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration staticImageURL](v7, "staticImageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = BSEqualObjects();

      if (!v11)
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration videoURL](self, "videoURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration videoURL](v7, "videoURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = BSEqualObjects();

      if (!v14)
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration proceduralWallpaperIdentifier](self, "proceduralWallpaperIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration proceduralWallpaperIdentifier](v7, "proceduralWallpaperIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = BSEqualObjects();

      if (!v17)
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration proceduralWallpaperOptions](self, "proceduralWallpaperOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration proceduralWallpaperOptions](v7, "proceduralWallpaperOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = BSEqualObjects();

      if (!v20)
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration wallpaperColor](self, "wallpaperColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration wallpaperColor](v7, "wallpaperColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = BSEqualObjects();

      if (!v23)
        goto LABEL_13;
      -[PBUIWallpaperDefaultConfiguration wallpaperColorName](self, "wallpaperColorName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultConfiguration wallpaperColorName](v7, "wallpaperColorName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = BSEqualObjects();

      if (v26)
      {
        -[PBUIWallpaperDefaultConfiguration wallpaperGradient](self, "wallpaperGradient");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBUIWallpaperDefaultConfiguration wallpaperGradient](v7, "wallpaperGradient");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = BSEqualObjects();

      }
      else
      {
LABEL_13:
        v29 = 0;
      }

    }
    else
    {
      v29 = 0;
    }
  }

  return v29;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = -[PBUIWallpaperDefaultConfiguration wallpaperType](self, "wallpaperType");
  -[PBUIWallpaperDefaultConfiguration staticImageURL](self, "staticImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;
  -[PBUIWallpaperDefaultConfiguration videoURL](self, "videoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperIdentifier](self, "proceduralWallpaperIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 + v7 + objc_msgSend(v8, "hash");
  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperOptions](self, "proceduralWallpaperOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[PBUIWallpaperDefaultConfiguration wallpaperColor](self, "wallpaperColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 + objc_msgSend(v12, "hash");
  -[PBUIWallpaperDefaultConfiguration wallpaperColorName](self, "wallpaperColorName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 + v13 + objc_msgSend(v14, "hash");
  -[PBUIWallpaperDefaultConfiguration wallpaperGradient](self, "wallpaperGradient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 + objc_msgSend(v16, "hash");

  return v17;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperDefaultConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaultConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperType(-[PBUIWallpaperDefaultConfiguration wallpaperType](self, "wallpaperType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("wallpaperType"));

  -[PBUIWallpaperDefaultConfiguration staticImageURL](self, "staticImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("staticImageURL"));

  -[PBUIWallpaperDefaultConfiguration videoURL](self, "videoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("videoURL"));

  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperIdentifier](self, "proceduralWallpaperIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("proceduralWallpaperIdentifier"));

  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperOptions](self, "proceduralWallpaperOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("proceduralWallpaperOptions"));

  -[PBUIWallpaperDefaultConfiguration wallpaperColor](self, "wallpaperColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("wallpaperColor"));

  -[PBUIWallpaperDefaultConfiguration wallpaperColorName](self, "wallpaperColorName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("wallpaperColorName"));

  -[PBUIWallpaperDefaultConfiguration wallpaperGradient](self, "wallpaperGradient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:", v19, CFSTR("wallpaperGradient"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperDefaultConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  PBUIStringForWallpaperType(-[PBUIWallpaperDefaultConfiguration wallpaperType](self, "wallpaperType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wallpaperType"));

  -[PBUIWallpaperDefaultConfiguration staticImageURL](self, "staticImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("staticImageURL"));

  -[PBUIWallpaperDefaultConfiguration videoURL](self, "videoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("videoURL"));

  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperIdentifier](self, "proceduralWallpaperIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("proceduralWallpaperIdentifier"));

  -[PBUIWallpaperDefaultConfiguration proceduralWallpaperOptions](self, "proceduralWallpaperOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("proceduralWallpaperOptions"));

  -[PBUIWallpaperDefaultConfiguration wallpaperColor](self, "wallpaperColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("wallpaperColor"));

  -[PBUIWallpaperDefaultConfiguration wallpaperColorName](self, "wallpaperColorName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("wallpaperColorName"));

  -[PBUIWallpaperDefaultConfiguration wallpaperGradient](self, "wallpaperGradient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("wallpaperGradient"));

}

- (PBUIWallpaperDefaultConfiguration)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperDefaultConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *staticImageURL;
  void *v11;
  uint64_t v12;
  NSURL *videoURL;
  void *v14;
  uint64_t v15;
  NSString *proceduralWallpaperIdentifier;
  void *v17;
  uint64_t v18;
  NSDictionary *proceduralWallpaperOptions;
  void *v20;
  uint64_t v21;
  UIColor *wallpaperColor;
  void *v23;
  uint64_t v24;
  NSString *wallpaperColorName;
  void *v26;
  uint64_t v27;
  PBUIWallpaperGradient *wallpaperGradient;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = -[PBUIWallpaperDefaultConfiguration init](&v30, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("wallpaperType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wallpaperType = PBUIWallpaperTypeForString(v7);

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("staticImageURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    staticImageURL = v5->_staticImageURL;
    v5->_staticImageURL = (NSURL *)v9;

    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("videoURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v12;

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("proceduralWallpaperIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    proceduralWallpaperIdentifier = v5->_proceduralWallpaperIdentifier;
    v5->_proceduralWallpaperIdentifier = (NSString *)v15;

    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, CFSTR("wallpaperThumbnailImageData"));
    v18 = objc_claimAutoreleasedReturnValue();
    proceduralWallpaperOptions = v5->_proceduralWallpaperOptions;
    v5->_proceduralWallpaperOptions = (NSDictionary *)v18;

    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, CFSTR("wallpaperColor"));
    v21 = objc_claimAutoreleasedReturnValue();
    wallpaperColor = v5->_wallpaperColor;
    v5->_wallpaperColor = (UIColor *)v21;

    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, CFSTR("wallpaperColorName"));
    v24 = objc_claimAutoreleasedReturnValue();
    wallpaperColorName = v5->_wallpaperColorName;
    v5->_wallpaperColorName = (NSString *)v24;

    objc_opt_self();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, CFSTR("wallpaperGradient"));
    v27 = objc_claimAutoreleasedReturnValue();
    wallpaperGradient = v5->_wallpaperGradient;
    v5->_wallpaperGradient = (PBUIWallpaperGradient *)v27;

  }
  return v5;
}

- (int64_t)wallpaperType
{
  return self->_wallpaperType;
}

- (NSURL)staticImageURL
{
  return self->_staticImageURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)proceduralWallpaperIdentifier
{
  return self->_proceduralWallpaperIdentifier;
}

- (NSDictionary)proceduralWallpaperOptions
{
  return self->_proceduralWallpaperOptions;
}

- (UIColor)wallpaperColor
{
  return self->_wallpaperColor;
}

- (NSString)wallpaperColorName
{
  return self->_wallpaperColorName;
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperGradient, 0);
  objc_storeStrong((id *)&self->_wallpaperColorName, 0);
  objc_storeStrong((id *)&self->_wallpaperColor, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperOptions, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_staticImageURL, 0);
}

@end
