@implementation PKPassLiveRenderedArmedStateImageSet

- (PKPassLiveRenderedArmedStateImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassLiveRenderedArmedStateImageSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKPassLiveRenderedArmedStateImageSet *v19;
  PKPassLiveRenderedArmedStateImageSet *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPassLiveRenderedArmedStateImageSet;
  v13 = -[PKPassLiveRenderedImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v22, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    v14 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("diffuseArmed"), v15, v12, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setDiffuseMaterialPropertyImage:](v13, "setDiffuseMaterialPropertyImage:", v16);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("normalArmed"), v15, v12, a5);
    v17 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setNormalMaterialPropertyImage:](v13, "setNormalMaterialPropertyImage:", v17);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("metalnessArmed"), v15, v12, a5);
    v18 = objc_claimAutoreleasedReturnValue();
    -[PKPassLiveRenderedImageSet setMetalnessMaterialPropertyImage:](v13, "setMetalnessMaterialPropertyImage:", v18);

    objc_autoreleasePoolPop(v14);
    if (v16 | v17 | v18)
      v19 = v13;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  return v20;
}

+ (int64_t)imageSetType
{
  return 7;
}

+ (BOOL)shouldCache
{
  return 0;
}

+ (id)archiveName
{
  return CFSTR("LiveRenderedArmedState");
}

+ (unsigned)currentVersion
{
  return 1;
}

@end
