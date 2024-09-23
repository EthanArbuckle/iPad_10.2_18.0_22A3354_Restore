@implementation PLSubstandardPhotoEditSource

- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4
{
  void *v6;
  void *v7;
  PLSubstandardPhotoEditSource *v8;
  objc_super v10;

  +[PLSubstandardPhotoEditSource _imageWithImage:orientation:](PLSubstandardPhotoEditSource, "_imageWithImage:orientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPIPhotoEditHelperClass_72665(), "imageSourceWithCIImage:orientation:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PLSubstandardPhotoEditSource;
  v8 = -[PLEditSource initWithResolvedSource:mediaType:](&v10, sel_initWithResolvedSource_mediaType_, v7, 1);

  return v8;
}

- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4 size:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  PLSubstandardPhotoEditSource *v17;
  objc_super v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  height = a5.height;
  width = a5.width;
  +[PLSubstandardPhotoEditSource _imageWithImage:orientation:](PLSubstandardPhotoEditSource, "_imageWithImage:orientation:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extent");
  if (width != v10 || height != v11)
  {
    v13 = width / v10;
    if (width / v10 < height / v11)
      v13 = height / v11;
    CGAffineTransformMakeScale(&v20, v13, v13);
    objc_msgSend(v9, "imageByApplyingTransform:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "extent");
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = width;
    v22.size.height = height;
    if (CGRectEqualToRect(v21, v22))
    {
      v9 = v14;
    }
    else
    {
      objc_msgSend(v14, "imageByClampingToExtent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "imageByCroppingToRect:", 0.0, 0.0, width, height);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(getPIPhotoEditHelperClass_72665(), "imageSourceWithCIImage:orientation:", v9, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PLSubstandardPhotoEditSource;
  v17 = -[PLEditSource initWithResolvedSource:mediaType:](&v19, sel_initWithResolvedSource_mediaType_, v16, 1);

  return v17;
}

+ (id)_imageWithImage:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", DCIM_CGImageRefFromPLImage());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 == 8)
    v7 = 6;
  else
    v7 = a4;
  if (a4 == 6)
    v8 = 8;
  else
    v8 = v7;
  objc_msgSend(v5, "imageByApplyingOrientation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
