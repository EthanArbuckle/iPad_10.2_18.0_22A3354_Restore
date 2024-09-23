@implementation PBUIWallpaperEffectImageRequestActionImageURLResponse

- (PBUIWallpaperEffectImageRequestActionImageURLResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 imageURL:(id)a5
{
  double height;
  double width;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PBUIWallpaperEffectImageRequestActionImageURLResponse *v16;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v9 = (objc_class *)MEMORY[0x1E0D017D0];
  v10 = a5;
  v11 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v12, 1);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v13, 2);

  objc_msgSend(v10, "filePathURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v15, 3);

  v18.receiver = self;
  v18.super_class = (Class)PBUIWallpaperEffectImageRequestActionImageURLResponse;
  v16 = -[BSActionResponse initWithInfo:error:](&v18, sel_initWithInfo_error_, v11, 0);

  return v16;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;
  void *v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

@end
