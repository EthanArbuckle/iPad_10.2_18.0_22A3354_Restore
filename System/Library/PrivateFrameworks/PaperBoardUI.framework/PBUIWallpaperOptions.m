@implementation PBUIWallpaperOptions

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v13;
  id v17;
  void *v18;

  v8 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a6;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v17, v13, 0, v8, 0, 0, a4, a5, x, y, width, height, 0.0, 0.0, 0, 0);

  return v18;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v17;
  id v21;
  void *v22;

  v11 = a9;
  v12 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v17 = a6;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v21, v17, 0, v12, v11, 0, a4, a5, x, y, width, height, 0.0, a10, 0, 0);

  return v22;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperKitData:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v18;
  id v23;
  id v24;
  void *v25;

  v12 = a9;
  v13 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a6;
  v23 = a11;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v24, v18, 0, v13, v12, 0, a4, a5, x, y, width, height, 0.0, a10, 0, v23);

  return v25;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12
{
  _BOOL8 v15;
  _BOOL8 v16;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v21;
  id v25;
  void *v26;

  v15 = a9;
  v16 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v21 = a6;
  v25 = a3;
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v25, v21, 0, v16, v15, a11, a4, a5, x, y, width, height, 0.0, a10, a12, 0);

  return v26;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14
{
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v18;
  double height;
  double width;
  double y;
  double x;
  id v28;
  void *v29;

  v15 = a11;
  v16 = a10;
  v17 = a8;
  v18 = a6;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v28 = a3;
  v29 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v28, v18, v17, v16, v15, a13, a4, a5, x, y, width, height, a9, a12, a14, 0);

  return v29;
}

+ (id)optionsWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 portrait:(BOOL)a8 hasVideo:(BOOL)a9 stillTimeInVideo:(double)a10 wallpaperMode:(int64_t)a11 wallpaperStatus:(int64_t)a12 wallpaperKitData:(id)a13
{
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  double height;
  double width;
  double y;
  double x;
  id v27;
  id v28;
  void *v29;

  v15 = a9;
  v16 = a8;
  v17 = a6;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v27 = a13;
  v28 = a3;
  v29 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:supportsRotation:rotationAngle:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v28, v17, 0, v16, v15, a11, a4, a5, x, y, width, height, 0.0, a10, a12, v27);

  return v29;
}

- (PBUIWallpaperOptions)initWithName:(id)a3 parallaxFactor:(double)a4 zoomScale:(double)a5 supportsCropping:(BOOL)a6 cropRect:(CGRect)a7 supportsRotation:(BOOL)a8 rotationAngle:(double)a9 portrait:(BOOL)a10 hasVideo:(BOOL)a11 stillTimeInVideo:(double)a12 wallpaperMode:(int64_t)a13 wallpaperStatus:(int64_t)a14 wallpaperKitData:(id)a15
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v29;
  id v30;
  PBUIWallpaperOptions *v31;
  uint64_t v32;
  NSString *name;
  uint64_t v34;
  NSDictionary *wallpaperKitData;
  PBUIWallpaperOptions *v36;
  objc_super v38;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v29 = a3;
  v30 = a15;
  v38.receiver = self;
  v38.super_class = (Class)PBUIWallpaperOptions;
  v31 = -[PBUIWallpaperOptions init](&v38, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v29, "copy");
    name = v31->_name;
    v31->_name = (NSString *)v32;

    v31->_cropRect.origin.x = x;
    v31->_cropRect.origin.y = y;
    v31->_cropRect.size.width = width;
    v31->_cropRect.size.height = height;
    v31->_supportsCropping = a6;
    v31->_supportsRotation = a8;
    v31->_parallaxFactor = a4;
    v31->_zoomScale = a5;
    v31->_portrait = a10;
    v31->_hasVideo = a11;
    v31->_rotationAngle = a9;
    v31->_stillTimeInVideo = a12;
    v31->_wallpaperMode = a13;
    v31->_wallpaperStatus = a14;
    v34 = objc_msgSend(v30, "copy");
    wallpaperKitData = v31->_wallpaperKitData;
    v31->_wallpaperKitData = (NSDictionary *)v34;

    v36 = v31;
  }

  return v31;
}

- (PBUIWallpaperOptions)init
{
  PBUIWallpaperOptions *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperOptions;
  result = -[PBUIWallpaperOptions init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_parallaxFactor = _Q0;
    result->_rotationAngle = 0.0;
    result->_portrait = 1;
  }
  return result;
}

- (PBUIWallpaperOptions)initWithContentsOfURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PBUIWallpaperOptions *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99DB0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v6, "open");
  v7 = -[PBUIWallpaperOptions initWithStream:](self, "initWithStream:", v6);
  objc_msgSend(v6, "close");

  return v7;
}

- (PBUIWallpaperOptions)initWithPersistentDataRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PBUIWallpaperOptions *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99DB0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  objc_msgSend(v6, "open");
  v7 = -[PBUIWallpaperOptions initWithStream:](self, "initWithStream:", v6);
  objc_msgSend(v6, "close");

  return v7;
}

- (PBUIWallpaperOptions)initWithStream:(id)a3
{
  void *v4;
  PBUIWallpaperOptions *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  NSString *name;
  NSString *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  PBUIWallpaperOptions *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  void *v40;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[PBUIWallpaperOptions init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v9 = objc_msgSend(v6, "copy");
        name = v5->_name;
        v5->_name = (NSString *)v9;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("CropRect"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
        v5->_cropRect = CGRectFromString(v11);
      objc_msgSend(v4, "objectForKey:", CFSTR("RotationAngle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "doubleValue");
        v5->_rotationAngle = v15;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("ParallaxFactor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "doubleValue");
        v5->_parallaxFactor = v17;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("SupportsCropping"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_supportsCropping = objc_msgSend(v18, "BOOLValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("SupportsRotation"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_supportsRotation = objc_msgSend(v19, "BOOLValue");
      v38 = v14;
      objc_msgSend(v4, "objectForKey:", CFSTR("MagnifyEnabled"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_magnifyEnabled = objc_msgSend(v20, "BOOLValue");
      v34 = v20;
      v37 = v16;
      objc_msgSend(v4, "objectForKey:", CFSTR("ZoomScale"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v21, "doubleValue");
        v5->_zoomScale = v22;
      }
      v40 = v6;
      objc_msgSend(v4, "objectForKey:", CFSTR("Portrait"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_portrait = objc_msgSend(v23, "BOOLValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("HasVideo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_hasVideo = objc_msgSend(v24, "BOOLValue");
      v39 = v11;
      objc_msgSend(v4, "objectForKey:", CFSTR("StillTimeInVideo"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v25, "doubleValue");
        v5->_stillTimeInVideo = v26;
      }
      v35 = v19;
      v36 = v18;
      objc_msgSend(v4, "objectForKey:", CFSTR("WallpaperMode"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v27, "doubleValue");
        v5->_wallpaperMode = (uint64_t)v28;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("WallpaperKitData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) != 0)
        objc_storeStrong((id *)&v5->_wallpaperKitData, v29);

    }
    self = v5;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)parallaxEnabled
{
  return BSFloatIsZero() ^ 1;
}

- (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 wallpaperScale:(double)a4 deviceType:(int64_t)a5 imageScale:(double)a6
{
  double height;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat y;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat x;
  double width;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGSize result;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  width = a3.width;
  height = a3.height;
  -[PBUIWallpaperOptions cropRect](self, "cropRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, v18, v18);
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, a6, a6);
  v46 = v48;
  v50.origin.x = v11;
  v50.origin.y = v13;
  v50.size.width = v15;
  v50.size.height = v17;
  v51 = CGRectApplyAffineTransform(v50, &v46);
  v19 = v51.size.width;
  v20 = v51.size.height;
  v46 = v47;
  v52 = CGRectApplyAffineTransform(v51, &v46);
  x = v52.origin.x;
  y = v52.origin.y;
  v22 = v52.size.width;
  v23 = v52.size.height;
  -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
  +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", a5, -[PBUIWallpaperOptions isPortrait](self, "isPortrait"), width, height, v24);
  v26 = v25;
  v28 = v27;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, a4, a4);
  v29 = v28 * v46.c + v46.a * v26;
  v30 = v28 * v46.d + v46.b * v26;
  if (v29 < v22 && v30 < v23)
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = v22;
    v53.size.height = v23;
    v32 = CGRectGetWidth(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = v22;
    v54.size.height = v23;
    v33 = v32 / CGRectGetHeight(v54);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = v22;
    v55.size.height = v23;
    v34 = CGRectGetWidth(v55);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = v22;
    v56.size.height = v23;
    v35 = CGRectGetHeight(v56);
    v36 = v34 <= v35;
    if (v34 <= v35)
      v37 = v30 * v33;
    else
      v37 = v29;
    if (v36)
      v38 = v30;
    else
      v38 = v29 * v33;
    v44 = v47;
    CGAffineTransformInvert(&v45, &v44);
    v19 = v38 * v45.c + v45.a * v37;
    v20 = v38 * v45.d + v45.b * v37;
  }
  v39 = v19;
  v40 = v20;
  result.height = v40;
  result.width = v39;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBUIWallpaperOptions *v4;
  uint64_t v5;
  NSString *name;
  CGSize size;
  uint64_t v8;
  NSDictionary *wallpaperKitData;
  PBUIWallpaperOptions *v10;

  v4 = objc_alloc_init(PBUIWallpaperOptions);
  if (v4)
  {
    v5 = -[NSString copy](self->_name, "copy");
    name = v4->_name;
    v4->_name = (NSString *)v5;

    size = self->_cropRect.size;
    v4->_cropRect.origin = self->_cropRect.origin;
    v4->_cropRect.size = size;
    v4->_rotationAngle = self->_rotationAngle;
    v4->_parallaxFactor = self->_parallaxFactor;
    v4->_supportsCropping = self->_supportsCropping;
    v4->_supportsRotation = self->_supportsRotation;
    v4->_magnifyEnabled = self->_magnifyEnabled;
    v4->_zoomScale = self->_zoomScale;
    v4->_portrait = self->_portrait;
    v4->_hasVideo = self->_hasVideo;
    v4->_stillTimeInVideo = self->_stillTimeInVideo;
    v4->_wallpaperMode = self->_wallpaperMode;
    v8 = -[NSDictionary copy](self->_wallpaperKitData, "copy");
    wallpaperKitData = v4->_wallpaperKitData;
    v4->_wallpaperKitData = (NSDictionary *)v8;

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PBUIWallpaperOptions *v4;
  void *v5;
  char isKindOfClass;
  PBUIWallpaperOptions *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  int64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  CGRect v47;
  CGRect v48;

  v4 = (PBUIWallpaperOptions *)a3;
  if (self == v4)
  {
    v45 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PBUIWallpaperOptions name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperOptions name](v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (!v10)
        goto LABEL_19;
      -[PBUIWallpaperOptions cropRect](self, "cropRect");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[PBUIWallpaperOptions cropRect](v7, "cropRect");
      v48.origin.x = v19;
      v48.origin.y = v20;
      v48.size.width = v21;
      v48.size.height = v22;
      v47.origin.x = v12;
      v47.origin.y = v14;
      v47.size.width = v16;
      v47.size.height = v18;
      if (!CGRectEqualToRect(v47, v48))
        goto LABEL_19;
      -[PBUIWallpaperOptions rotationAngle](self, "rotationAngle");
      v24 = v23;
      -[PBUIWallpaperOptions rotationAngle](v7, "rotationAngle");
      if (v24 != v25)
        goto LABEL_19;
      -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
      v27 = v26;
      -[PBUIWallpaperOptions parallaxFactor](v7, "parallaxFactor");
      if (v27 != v28)
        goto LABEL_19;
      v29 = -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping");
      if (v29 != -[PBUIWallpaperOptions supportsCropping](v7, "supportsCropping"))
        goto LABEL_19;
      v30 = -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation");
      if (v30 != -[PBUIWallpaperOptions supportsRotation](v7, "supportsRotation"))
        goto LABEL_19;
      v31 = -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled");
      if (v31 != -[PBUIWallpaperOptions isMagnifyEnabled](v7, "isMagnifyEnabled"))
        goto LABEL_19;
      -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
      v33 = v32;
      -[PBUIWallpaperOptions zoomScale](v7, "zoomScale");
      if (v33 != v34)
        goto LABEL_19;
      v35 = -[PBUIWallpaperOptions isPortrait](self, "isPortrait");
      if (v35 == -[PBUIWallpaperOptions isPortrait](v7, "isPortrait")
        && (v36 = -[PBUIWallpaperOptions hasVideo](self, "hasVideo"),
            v36 == -[PBUIWallpaperOptions hasVideo](v7, "hasVideo"))
        && (-[PBUIWallpaperOptions stillTimeInVideo](self, "stillTimeInVideo"),
            v38 = v37,
            -[PBUIWallpaperOptions stillTimeInVideo](v7, "stillTimeInVideo"),
            v38 == v39)
        && (v40 = -[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"),
            v40 == -[PBUIWallpaperOptions wallpaperMode](v7, "wallpaperMode")))
      {
        -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v42 = (void *)v41;
          -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBUIWallpaperOptions wallpaperKitData](v7, "wallpaperKitData");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "isEqual:", v44);

        }
        else
        {
          v45 = 1;
        }
      }
      else
      {
LABEL_19:
        v45 = 0;
      }

    }
    else
    {
      v45 = 0;
    }
  }

  return v45;
}

- (BOOL)isLooselyEqualToWallpaperOptions:(id)a3
{
  id v4;
  BOOL v5;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double MinX;
  double MinY;
  double v36;
  double v37;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGRect v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v4 = a3;
  if (-[PBUIWallpaperOptions isEqual:](self, "isEqual:", v4))
    goto LABEL_2;
  -[PBUIWallpaperOptions cropRect](self, "cropRect");
  v8 = v7;
  v41.origin.x = v9;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "cropRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  rect_24 = v22;
  objc_msgSend(v4, "zoomScale");
  v24 = v23;
  rect_8 = v21;
  v43.origin.x = v8;
  v43.origin.y = v41.origin.x;
  v43.size.width = v11;
  v43.size.height = v13;
  rect_16 = v15;
  v56.origin.x = v15;
  v25 = v17;
  v56.origin.y = v17;
  v56.size.width = v19;
  v56.size.height = v21;
  v5 = 0;
  if (!CGRectEqualToRect(v43, v56) && rect_24 == v24)
  {
    CGAffineTransformMakeScale(&v42, rect_24, rect_24);
    v44.origin.x = v8;
    v44.origin.y = v41.origin.x;
    v44.size.width = v11;
    v44.size.height = v13;
    v45 = CGRectApplyAffineTransform(v44, &v42);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;
    CGAffineTransformMakeScale((CGAffineTransform *)&v41.origin.y, v24, v24);
    v46.size.height = rect_8;
    v46.origin.x = rect_16;
    v46.origin.y = v25;
    v46.size.width = v19;
    v47 = CGRectApplyAffineTransform(v46, (CGAffineTransform *)&v41.origin.y);
    v30 = v47.origin.x;
    v31 = v47.origin.y;
    v32 = v47.size.width;
    v33 = v47.size.height;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v57.origin.x = v30;
    v57.origin.y = v31;
    v57.size.width = v32;
    v57.size.height = v33;
    if (CGRectEqualToRect(v47, v57))
    {
LABEL_2:
      v5 = 1;
      goto LABEL_3;
    }
    v41.origin.x = x;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    MinX = CGRectGetMinX(v48);
    v49.origin.x = v30;
    v49.origin.y = v31;
    v49.size.width = v32;
    v49.size.height = v33;
    if (vabdd_f64(MinX, CGRectGetMinX(v49)) >= 1.0)
      goto LABEL_11;
    v50.origin.x = v41.origin.x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinY = CGRectGetMinY(v50);
    v51.origin.x = v30;
    v51.origin.y = v31;
    v51.size.width = v32;
    v51.size.height = v33;
    if (vabdd_f64(MinY, CGRectGetMinY(v51)) >= 1.0)
      goto LABEL_11;
    v52.origin.x = v41.origin.x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v36 = CGRectGetWidth(v52);
    v53.origin.x = v30;
    v53.origin.y = v31;
    v53.size.width = v32;
    v53.size.height = v33;
    if (vabdd_f64(v36, CGRectGetWidth(v53)) >= 1.0)
    {
LABEL_11:
      v5 = 0;
    }
    else
    {
      v54.origin.x = v41.origin.x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v37 = CGRectGetHeight(v54);
      v55.origin.x = v30;
      v55.origin.y = v31;
      v55.size.width = v32;
      v55.size.height = v33;
      v5 = vabdd_f64(v37, CGRectGetHeight(v55)) < 1.0;
    }
  }
LABEL_3:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  unint64_t v25;

  v3 = -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping");
  v4 = -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[PBUIWallpaperOptions isPortrait](self, "isPortrait"))
    v7 = 4;
  else
    v7 = 0;
  v8 = -[PBUIWallpaperOptions hasVideo](self, "hasVideo");
  v9 = 8;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9;
  v11 = -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation");
  v12 = 16;
  if (!v11)
    v12 = 0;
  v13 = v10 | v12;
  -[PBUIWallpaperOptions name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (double)(unint64_t)(v13 + objc_msgSend(v14, "hash"));
  -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
  v17 = v16 + v15;
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  v19 = v18 + v17;
  -[PBUIWallpaperOptions stillTimeInVideo](self, "stillTimeInVideo");
  v21 = v20 + v19 + (double)-[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode");
  -[PBUIWallpaperOptions rotationAngle](self, "rotationAngle");
  v23 = v22 + v21;
  -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (unint64_t)(v23 + (double)(unint64_t)objc_msgSend(v24, "hash"));

  return v25;
}

- (id)persistentPropertyList
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperOptions name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Name"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ParallaxFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MagnifyEnabled"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ZoomScale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SupportsCropping"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SupportsRotation"));

  -[PBUIWallpaperOptions cropRect](self, "cropRect");
  NSStringFromCGRect(v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("CropRect"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperOptions rotationAngle](self, "rotationAngle");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("RotationAngle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("Portrait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("HasVideo"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperOptions stillTimeInVideo](self, "stillTimeInVideo");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("StillTimeInVideo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("WallpaperMode"));

  -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("WallpaperKitData"));

  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99E48];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:append:", v7, 0);

  objc_msgSend(v8, "open");
  -[PBUIWallpaperOptions persistentPropertyList](self, "persistentPropertyList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v9, v8, 200, 0, a4) != 0;
  objc_msgSend(v8, "close");

  return (char)a4;
}

- (NSData)persistentDataRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
  objc_msgSend(v3, "open");
  -[PBUIWallpaperOptions persistentPropertyList](self, "persistentPropertyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v4, v3, 200, 0, 0);
  objc_msgSend(v3, "close");
  if (!v5
    || (objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0C99868]), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to make persistentDataRepresentation"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v7 = (void *)v6;

  return (NSData *)v7;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperOptions name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("name"));

  -[PBUIWallpaperOptions cropRect](self, "cropRect");
  v7 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("cropRect"));
  -[PBUIWallpaperOptions rotationAngle](self, "rotationAngle");
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("rotationAngle"));
  -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
  v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("parallaxFactor"));
  v10 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"), CFSTR("supportsCropping"));
  v11 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"), CFSTR("supportsRotation"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"), CFSTR("magnifyEnabled"));
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  v13 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("zoomScale"));
  v14 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"), CFSTR("portrait"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"), CFSTR("hasVideo"));
  -[PBUIWallpaperOptions stillTimeInVideo](self, "stillTimeInVideo");
  v16 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("stillTimeInVideo"));
  PBUIStringForWallpaperMode(-[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v17, CFSTR("wallpaperMode"));

  -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, CFSTR("wallpaperKitData"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PBUIWallpaperOptions name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("name"));

  -[PBUIWallpaperOptions cropRect](self, "cropRect");
  objc_msgSend(v9, "encodeCGRect:forKey:", CFSTR("cropRect"));
  -[PBUIWallpaperOptions rotationAngle](self, "rotationAngle");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("rotationAngle"));
  -[PBUIWallpaperOptions parallaxFactor](self, "parallaxFactor");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("parallaxFactor"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions supportsCropping](self, "supportsCropping"), CFSTR("supportsCropping"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions supportsRotation](self, "supportsRotation"), CFSTR("supportsRotation"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions isMagnifyEnabled](self, "isMagnifyEnabled"), CFSTR("magnifyEnabled"));
  -[PBUIWallpaperOptions zoomScale](self, "zoomScale");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("zoomScale"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions isPortrait](self, "isPortrait"), CFSTR("portrait"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PBUIWallpaperOptions hasVideo](self, "hasVideo"), CFSTR("hasVideo"));
  -[PBUIWallpaperOptions stillTimeInVideo](self, "stillTimeInVideo");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("stillTimeInVideo"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[PBUIWallpaperOptions wallpaperMode](self, "wallpaperMode"), CFSTR("wallpaperMode"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[PBUIWallpaperOptions wallpaperStatus](self, "wallpaperStatus"), CFSTR("wallpaperStatus"));
  -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB38B0];
    -[PBUIWallpaperOptions wallpaperKitData](self, "wallpaperKitData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithPropertyList:format:options:error:", v7, 200, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("wallpaperKitData"));
  }

}

- (PBUIWallpaperOptions)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperOptions *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *wallpaperKitData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PBUIWallpaperOptions;
  v5 = -[PBUIWallpaperOptions init](&v23, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("cropRect"));
    v5->_cropRect.origin.x = v10;
    v5->_cropRect.origin.y = v11;
    v5->_cropRect.size.width = v12;
    v5->_cropRect.size.height = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationAngle"));
    v5->_rotationAngle = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("parallaxFactor"));
    v5->_parallaxFactor = v15;
    v5->_supportsCropping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCropping"));
    v5->_supportsRotation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRotation"));
    v5->_magnifyEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("magnifyEnabled"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("zoomScale"));
    v5->_zoomScale = v16;
    v5->_portrait = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("portrait"));
    v5->_hasVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVideo"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("stillTimeInVideo"));
    v5->_stillTimeInVideo = v17;
    v5->_wallpaperMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wallpaperMode"));
    v5->_wallpaperStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wallpaperStatus"));
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("wallpaperKitData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v19, 0, 0, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      wallpaperKitData = v5->_wallpaperKitData;
      v5->_wallpaperKitData = (NSDictionary *)v20;

    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (BOOL)isMagnifyEnabled
{
  return self->_magnifyEnabled;
}

- (void)setMagnifyEnabled:(BOOL)a3
{
  self->_magnifyEnabled = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (BOOL)supportsCropping
{
  return self->_supportsCropping;
}

- (void)setSupportsCropping:(BOOL)a3
{
  self->_supportsCropping = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (BOOL)supportsRotation
{
  return self->_supportsRotation;
}

- (void)setSupportsRotation:(BOOL)a3
{
  self->_supportsRotation = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (BOOL)isPortrait
{
  return self->_portrait;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void)setStillTimeInVideo:(double)a3
{
  self->_stillTimeInVideo = a3;
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (int64_t)wallpaperStatus
{
  return self->_wallpaperStatus;
}

- (void)setWallpaperStatus:(int64_t)a3
{
  self->_wallpaperStatus = a3;
}

- (NSDictionary)wallpaperKitData
{
  return self->_wallpaperKitData;
}

- (void)setWallpaperKitData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperKitData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
