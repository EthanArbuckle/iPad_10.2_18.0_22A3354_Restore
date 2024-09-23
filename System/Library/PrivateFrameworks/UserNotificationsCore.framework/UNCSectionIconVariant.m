@implementation UNCSectionIconVariant

+ (id)variantWithFormat:(int64_t)a3 imageData:(id)a4
{
  id v5;
  UNCSectionIconVariant *v6;

  v5 = a4;
  v6 = -[UNCSectionIconVariant initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:]([UNCSectionIconVariant alloc], "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", a3, v5, 1, 0, 0);

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 applicationIdentifier:(id)a4
{
  id v5;
  UNCSectionIconVariant *v6;

  v5 = a4;
  v6 = -[UNCSectionIconVariant initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:]([UNCSectionIconVariant alloc], "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", a3, v5, 4, 0, 0);

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 imagePath:(id)a4
{
  id v5;
  UNCSectionIconVariant *v6;

  v5 = a4;
  v6 = -[UNCSectionIconVariant initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:]([UNCSectionIconVariant alloc], "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", a3, v5, 2, 0, 0);

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundle:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a5, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "variantWithFormat:imageName:inBundleAtPath:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundleAtPath:(id)a5
{
  id v7;
  id v8;
  UNCSectionIconVariant *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[UNCSectionIconVariant initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:]([UNCSectionIconVariant alloc], "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", a3, v8, 3, v7, 0);

  return v9;
}

+ (id)variantWithFormat:(int64_t)a3 systemImageName:(id)a4
{
  id v5;
  UNCSectionIconVariant *v6;

  v5 = a4;
  v6 = -[UNCSectionIconVariant initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:]([UNCSectionIconVariant alloc], "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", a3, v5, 5, 0, 0);

  return v6;
}

- (NSData)imageData
{
  id imageInfo;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (self->_imageInfoType == 1)
  {
    imageInfo = self->_imageInfo;
    v3 = objc_opt_class();
    v4 = imageInfo;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (NSData *)v6;
}

- (void)setImageData:(id)a3
{
  -[UNCSectionIconVariant _setImageInfo:ofType:](self, "_setImageInfo:ofType:", a3, 1);
}

- (NSString)imagePath
{
  id imageInfo;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (self->_imageInfoType == 2)
  {
    imageInfo = self->_imageInfo;
    v3 = objc_opt_class();
    v4 = imageInfo;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setImagePath:(id)a3
{
  -[UNCSectionIconVariant _setImageInfo:ofType:](self, "_setImageInfo:ofType:", a3, 2);
}

- (NSString)imageName
{
  id imageInfo;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (self->_imageInfoType == 3)
  {
    imageInfo = self->_imageInfo;
    v3 = objc_opt_class();
    v4 = imageInfo;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setImageName:(id)a3
{
  -[UNCSectionIconVariant _setImageInfo:ofType:](self, "_setImageInfo:ofType:", a3, 3);
}

- (NSString)applicationIdentifier
{
  id imageInfo;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (self->_imageInfoType == 4)
  {
    imageInfo = self->_imageInfo;
    v3 = objc_opt_class();
    v4 = imageInfo;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setApplicationIdentifier:(id)a3
{
  -[UNCSectionIconVariant _setImageInfo:ofType:](self, "_setImageInfo:ofType:", a3, 4);
}

- (NSString)systemImageName
{
  id imageInfo;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (self->_imageInfoType == 5)
  {
    imageInfo = self->_imageInfo;
    v3 = objc_opt_class();
    v4 = imageInfo;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setSystemImageName:(id)a3
{
  -[UNCSectionIconVariant _setImageInfo:ofType:](self, "_setImageInfo:ofType:", a3, 5);
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[UNCSectionIconVariant format](self, "format");
  v4 = objc_msgSend(self->_imageInfo, "hash") ^ v3 ^ self->_imageInfoType;
  -[UNCSectionIconVariant bundlePath](self, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ v6 ^ -[UNCSectionIconVariant isPrecomposed](self, "isPrecomposed");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UNCSectionIconVariant *v4;
  UNCSectionIconVariant *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (UNCSectionIconVariant *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[UNCSectionIconVariant format](self, "format");
      if (v6 == -[UNCSectionIconVariant format](v5, "format")
        && BSEqualObjects()
        && self->_imageInfoType == v5->_imageInfoType)
      {
        -[UNCSectionIconVariant bundlePath](self, "bundlePath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCSectionIconVariant bundlePath](v5, "bundlePath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          v9 = -[UNCSectionIconVariant isPrecomposed](self, "isPrecomposed");
          v10 = v9 ^ -[UNCSectionIconVariant isPrecomposed](v5, "isPrecomposed") ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }

      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:imageInfo:imageInfoType:bundlePath:precomposed:", self->_format, self->_imageInfo, self->_imageInfoType, self->_bundlePath, self->_precomposed);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionIconVariant)initWithCoder:(id)a3
{
  id v4;
  UNCSectionIconVariant *v5;
  uint64_t v6;
  void *imageInfo;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *bundlePath;

  v4 = a3;
  v5 = -[UNCSectionIconVariant init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingVersion")) == 2)
    {
      v5->_imageInfoType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageInfoType"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", (id)objc_opt_class(), CFSTR("imageInfo"));
      v6 = objc_claimAutoreleasedReturnValue();
      imageInfo = v5->_imageInfo;
      v5->_imageInfo = (id)v6;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
      imageInfo = (void *)objc_claimAutoreleasedReturnValue();
      if (imageInfo)
        -[UNCSectionIconVariant setImageData:](v5, "setImageData:", imageInfo);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imagePath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[UNCSectionIconVariant setImageName:](v5, "setImageName:", v8);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[UNCSectionIconVariant setApplicationIdentifier:](v5, "setApplicationIdentifier:", v9);

    }
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v10;

    v5->_precomposed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("precomposed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("codingVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_imageInfoType, CFSTR("imageInfoType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageInfo, CFSTR("imageInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundlePath, CFSTR("bundlePath"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_precomposed, CFSTR("precomposed"));

}

- (UNCSectionIconVariant)initWithFormat:(int64_t)a3 imageInfo:(id)a4 imageInfoType:(int64_t)a5 bundlePath:(id)a6 precomposed:(BOOL)a7
{
  id v12;
  id v13;
  UNCSectionIconVariant *v14;
  UNCSectionIconVariant *v15;
  uint64_t v16;
  id imageInfo;
  uint64_t v18;
  NSString *bundlePath;
  objc_super v21;

  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNCSectionIconVariant;
  v14 = -[UNCSectionIconVariant init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_format = a3;
    -[UNCSectionIconVariant _processImageInfo:imageInfoType:](v14, "_processImageInfo:imageInfoType:", v12, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    imageInfo = v15->_imageInfo;
    v15->_imageInfo = (id)v16;

    v15->_imageInfoType = a5;
    v18 = objc_msgSend(v13, "copy");
    bundlePath = v15->_bundlePath;
    v15->_bundlePath = (NSString *)v18;

    v15->_precomposed = a7;
  }

  return v15;
}

- (id)_processImageInfo:(id)a3 imageInfoType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = v6;
  v8 = v6;
  if (a4 == 1)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[NSObject unc_objectCache](self, "unc_objectCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cacheObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_setImageInfo:(id)a3 ofType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id imageInfo;
  id v10;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    self->_imageInfoType = a4;
    v10 = v6;
    -[UNCSectionIconVariant _processImageInfo:imageInfoType:](self, "_processImageInfo:imageInfoType:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    imageInfo = self->_imageInfo;
    self->_imageInfo = v8;
LABEL_5:

    v7 = v10;
    goto LABEL_6;
  }
  if (self->_imageInfoType == a4)
  {
    v10 = 0;
    imageInfo = self->_imageInfo;
    self->_imageInfo = 0;
    self->_imageInfoType = 0;
    goto LABEL_5;
  }
LABEL_6:

}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPrecomposed
{
  return self->_precomposed;
}

- (void)setPrecomposed:(BOOL)a3
{
  self->_precomposed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong(&self->_imageInfo, 0);
}

@end
