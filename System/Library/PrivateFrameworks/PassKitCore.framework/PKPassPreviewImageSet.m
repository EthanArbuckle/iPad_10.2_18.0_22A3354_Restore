@implementation PKPassPreviewImageSet

- (PKPassPreviewImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassPreviewImageSet *v13;
  void *v14;
  PKImage *v15;
  void *v16;
  PKImage *v17;
  uint64_t v18;
  PKImage *iconImage;
  void *v20;
  PKImage *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  PKImage *v26;
  uint64_t v27;
  PKImage *notificationIconImage;
  void *context;
  double v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKPassPreviewImageSet;
  v13 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v32, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    context = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", CFSTR("icon"), v14);
    v15 = (PKImage *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v13->_rawIcon, v15);
    v16 = (void *)MEMORY[0x19400CFE8]();
    v31 = 1.0;
    v17 = (PKImage *)PKPassIconImage(v15, &v31);
    __75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(v17, v31);
    v18 = objc_claimAutoreleasedReturnValue();
    iconImage = v13->_iconImage;
    v13->_iconImage = (PKImage *)v18;

    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x19400CFE8]();
    v31 = 1.0;
    v21 = v15;
    v22 = v21;
    if (!v21)
    {
      PKPassKitCoreBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", CFSTR("GenericIcon"), v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v22, "scale");
    DefaultNotificationIconDescriptor(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShouldApplyMask:", 0);
    v26 = (PKImage *)IconImageFromImage(v22, v25, &v31);

    __75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(v26, v31);
    v27 = objc_claimAutoreleasedReturnValue();
    notificationIconImage = v13->_notificationIconImage;
    v13->_notificationIconImage = (PKImage *)v27;

    objc_autoreleasePoolPop(v20);
    objc_autoreleasePoolPop(context);
  }

  return v13;
}

PKImage *__75__PKPassPreviewImageSet_initWithDisplayProfile_fileURL_screenScale_suffix___block_invoke(PKImage *a1, double a2)
{
  if (a1)
    a1 = -[PKImage initWithCGImage:scale:orientation:]([PKImage alloc], "initWithCGImage:scale:orientation:", a1, 1, a2);
  return a1;
}

+ (int64_t)imageSetType
{
  return 1;
}

+ (id)archiveName
{
  return CFSTR("Preview");
}

+ (unsigned)currentVersion
{
  return 19;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_iconImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_notificationIconImage, "preheatBitmapData");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPreviewImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassPreviewImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *iconImage;
  uint64_t v9;
  PKImage *notificationIconImage;
  uint64_t v11;
  PKImage *rawIcon;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassPreviewImageSet;
  v5 = -[PKImageSet initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconImage"));
    v7 = objc_claimAutoreleasedReturnValue();
    iconImage = v5->_iconImage;
    v5->_iconImage = (PKImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationIconImage"));
    v9 = objc_claimAutoreleasedReturnValue();
    notificationIconImage = v5->_notificationIconImage;
    v5->_notificationIconImage = (PKImage *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawIcon"));
    v11 = objc_claimAutoreleasedReturnValue();
    rawIcon = v5->_rawIcon;
    v5->_rawIcon = (PKImage *)v11;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassPreviewImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_iconImage, CFSTR("iconImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_notificationIconImage, CFSTR("notificationIconImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawIcon, CFSTR("rawIcon"));
  objc_autoreleasePoolPop(v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_iconImage, v5[3])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_notificationIconImage, v5[4])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_rawIcon, v5[5]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PKImage imageHash](self->_notificationIconImage, "imageHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PKImage imageHash](self->_iconImage, "imageHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  -[PKImage imageHash](self->_rawIcon, "imageHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "hash");

  return v8;
}

- (PKImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (PKImage)notificationIconImage
{
  return self->_notificationIconImage;
}

- (void)setNotificationIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIconImage, a3);
}

- (PKImage)rawIcon
{
  return self->_rawIcon;
}

- (void)setRawIcon:(id)a3
{
  objc_storeStrong((id *)&self->_rawIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawIcon, 0);
  objc_storeStrong((id *)&self->_notificationIconImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
