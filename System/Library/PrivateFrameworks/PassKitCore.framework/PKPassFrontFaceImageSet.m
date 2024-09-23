@implementation PKPassFrontFaceImageSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassFrontFaceImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassFrontFaceImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *faceImage;
  uint64_t v9;
  PKColor *faceImageAverageColor;
  uint64_t v11;
  PKImage *faceShadowImage;
  uint64_t v13;
  PKImage *footerImage;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  CGFloat *p_x;
  CGSize v20;
  CGFloat *v21;
  CGSize v22;
  CGFloat *v23;
  CGSize v24;
  CGFloat *v25;
  CGSize v26;
  uint64_t v27;
  PKImage *dynamicLayerStaticFallbackImage;
  uint64_t v29;
  PKImage *backgroundParallaxEmitterImage;
  uint64_t v31;
  PKImage *backgroundParallaxImage;
  uint64_t v33;
  PKImage *backgroundParallaxCrossDissolveImage;
  uint64_t v35;
  PKImage *neutralEmitterImage;
  uint64_t v37;
  PKImage *neutralImage;
  uint64_t v39;
  PKImage *foregroundParallaxEmitterImage;
  uint64_t v41;
  PKImage *foregroundParallaxImage;
  uint64_t v43;
  PKImage *foregroundParallaxCrossDissolveImage;
  uint64_t v45;
  PKImage *staticOverlayEmitterImage;
  uint64_t v47;
  PKImage *staticOverlayImage;
  uint64_t v49;
  PKImage *transactionEffectEmitterImage;
  uint64_t v51;
  NSData *transactionEffectEmitterShapeSVGData;
  objc_super v54;
  NSRect v55;
  NSRect v56;
  NSRect v57;
  NSRect v58;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKPassFrontFaceImageSet;
  v5 = -[PKImageSet initWithCoder:](&v54, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceImage"));
    v7 = objc_claimAutoreleasedReturnValue();
    faceImage = v5->_faceImage;
    v5->_faceImage = (PKImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceImageAverageColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    faceImageAverageColor = v5->_faceImageAverageColor;
    v5->_faceImageAverageColor = (PKColor *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceShadowImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    faceShadowImage = v5->_faceShadowImage;
    v5->_faceShadowImage = (PKImage *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    footerImage = v5->_footerImage;
    v5->_footerImage = (PKImage *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoRect"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobrandLogoRect"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailRect"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stripRect"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    p_x = &v5->_logoRect.origin.x;
    if (v15)
    {
      v55 = NSRectFromString(v15);
      *p_x = v55.origin.x;
      v5->_logoRect.origin.y = v55.origin.y;
      v5->_logoRect.size.width = v55.size.width;
      v5->_logoRect.size.height = v55.size.height;
    }
    else
    {
      v20 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)p_x = *MEMORY[0x1E0C9D628];
      v5->_logoRect.size = v20;
    }
    v21 = &v5->_cobrandLogoRect.origin.x;
    if (v16)
    {
      v56 = NSRectFromString(v16);
      *v21 = v56.origin.x;
      v5->_cobrandLogoRect.origin.y = v56.origin.y;
      v5->_cobrandLogoRect.size.width = v56.size.width;
      v5->_cobrandLogoRect.size.height = v56.size.height;
    }
    else
    {
      v22 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)v21 = *MEMORY[0x1E0C9D628];
      v5->_cobrandLogoRect.size = v22;
    }
    v23 = &v5->_thumbnailRect.origin.x;
    if (v17)
    {
      v57 = NSRectFromString(v17);
      *v23 = v57.origin.x;
      v5->_thumbnailRect.origin.y = v57.origin.y;
      v5->_thumbnailRect.size.width = v57.size.width;
      v5->_thumbnailRect.size.height = v57.size.height;
    }
    else
    {
      v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)v23 = *MEMORY[0x1E0C9D628];
      v5->_thumbnailRect.size = v24;
    }
    v25 = &v5->_stripRect.origin.x;
    if (v18)
    {
      v58 = NSRectFromString(v18);
      *v25 = v58.origin.x;
      v5->_stripRect.origin.y = v58.origin.y;
      v5->_stripRect.size.width = v58.size.width;
      v5->_stripRect.size.height = v58.size.height;
    }
    else
    {
      v26 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)v25 = *MEMORY[0x1E0C9D628];
      v5->_stripRect.size = v26;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicLayerStaticFallbackImage"));
    v27 = objc_claimAutoreleasedReturnValue();
    dynamicLayerStaticFallbackImage = v5->_dynamicLayerStaticFallbackImage;
    v5->_dynamicLayerStaticFallbackImage = (PKImage *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundParallaxEmitterImage"));
    v29 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxEmitterImage = v5->_backgroundParallaxEmitterImage;
    v5->_backgroundParallaxEmitterImage = (PKImage *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundParallaxImage"));
    v31 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxImage = v5->_backgroundParallaxImage;
    v5->_backgroundParallaxImage = (PKImage *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundParallaxCrossDissolveImage"));
    v33 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxCrossDissolveImage = v5->_backgroundParallaxCrossDissolveImage;
    v5->_backgroundParallaxCrossDissolveImage = (PKImage *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("neutralEmitterImage"));
    v35 = objc_claimAutoreleasedReturnValue();
    neutralEmitterImage = v5->_neutralEmitterImage;
    v5->_neutralEmitterImage = (PKImage *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("neutralImage"));
    v37 = objc_claimAutoreleasedReturnValue();
    neutralImage = v5->_neutralImage;
    v5->_neutralImage = (PKImage *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundParallaxEmitterImage"));
    v39 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxEmitterImage = v5->_foregroundParallaxEmitterImage;
    v5->_foregroundParallaxEmitterImage = (PKImage *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundParallaxImage"));
    v41 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxImage = v5->_foregroundParallaxImage;
    v5->_foregroundParallaxImage = (PKImage *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundParallaxCrossDissolveImage"));
    v43 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxCrossDissolveImage = v5->_foregroundParallaxCrossDissolveImage;
    v5->_foregroundParallaxCrossDissolveImage = (PKImage *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticOverlayEmitterImage"));
    v45 = objc_claimAutoreleasedReturnValue();
    staticOverlayEmitterImage = v5->_staticOverlayEmitterImage;
    v5->_staticOverlayEmitterImage = (PKImage *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticOverlayImage"));
    v47 = objc_claimAutoreleasedReturnValue();
    staticOverlayImage = v5->_staticOverlayImage;
    v5->_staticOverlayImage = (PKImage *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionEffectEmitterImage"));
    v49 = objc_claimAutoreleasedReturnValue();
    transactionEffectEmitterImage = v5->_transactionEffectEmitterImage;
    v5->_transactionEffectEmitterImage = (PKImage *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionEffectEmitterShapeImage"));
    v51 = objc_claimAutoreleasedReturnValue();
    transactionEffectEmitterShapeSVGData = v5->_transactionEffectEmitterShapeSVGData;
    v5->_transactionEffectEmitterShapeSVGData = (NSData *)v51;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (PKColor)faceImageAverageColor
{
  return self->_faceImageAverageColor;
}

- (CGRect)cobrandLogoRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cobrandLogoRect.origin.x;
  y = self->_cobrandLogoRect.origin.y;
  width = self->_cobrandLogoRect.size.width;
  height = self->_cobrandLogoRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKImage)faceShadowImage
{
  return self->_faceShadowImage;
}

- (PKImage)faceImage
{
  return self->_faceImage;
}

+ (int64_t)imageSetType
{
  return 0;
}

+ (unsigned)currentVersion
{
  return 26;
}

+ (id)archiveName
{
  return CFSTR("FrontFace");
}

- (CGRect)thumbnailRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_thumbnailRect.origin.x;
  y = self->_thumbnailRect.origin.y;
  width = self->_thumbnailRect.size.width;
  height = self->_thumbnailRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)logoRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_logoRect.origin.x;
  y = self->_logoRect.origin.y;
  width = self->_logoRect.size.width;
  height = self->_logoRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKPassFrontFaceImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassFrontFaceImageSet *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  PKImage *faceImage;
  uint64_t v22;
  PKImage *faceShadowImage;
  CGSize v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PKImage *footerImage;
  uint64_t v33;
  PKImage *dynamicLayerStaticFallbackImage;
  uint64_t v35;
  PKImage *backgroundParallaxEmitterImage;
  uint64_t v37;
  PKImage *backgroundParallaxImage;
  uint64_t v39;
  PKImage *backgroundParallaxCrossDissolveImage;
  uint64_t v41;
  PKImage *neutralEmitterImage;
  uint64_t v43;
  PKImage *neutralImage;
  uint64_t v45;
  PKImage *foregroundParallaxEmitterImage;
  uint64_t v47;
  PKImage *foregroundParallaxImage;
  uint64_t v49;
  PKImage *foregroundParallaxCrossDissolveImage;
  uint64_t v51;
  PKImage *staticOverlayEmitterImage;
  uint64_t v53;
  PKImage *staticOverlayImage;
  uint64_t v55;
  PKImage *transactionEffectEmitterImage;
  void *v57;
  void *v58;
  uint64_t v59;
  NSData *transactionEffectEmitterShapeSVGData;
  void *context;
  id v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v64.receiver = self;
  v64.super_class = (Class)PKPassFrontFaceImageSet;
  v13 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v64, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    context = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      PKLogFacilityTypeGetObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v16 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v66 = v18;
        v67 = 2112;
        v68 = v11;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Could not instantiate bundle for process(%@): %@", buf, 0x16u);

        v10 = v16;
      }

    }
    v63 = v10;
    v19 = v10;
    PKPassFrontFaceImage(v19, v14, &v13->_logoRect.origin.x, &v13->_thumbnailRect.origin.x, &v13->_stripRect.origin.x, (uint64_t)&v13->_faceImageAverageColor, v12, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    faceImage = v13->_faceImage;
    v13->_faceImage = (PKImage *)v20;

    PKPassFrontFaceShadowImage(v13->_faceImage);
    v22 = objc_claimAutoreleasedReturnValue();
    faceShadowImage = v13->_faceShadowImage;
    v13->_faceShadowImage = (PKImage *)v22;

    v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v13->_cobrandLogoRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v13->_cobrandLogoRect.size = v24;
    +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", CFSTR("cobrandLogo"), v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "size");
      v13->_cobrandLogoRect.origin = (CGPoint)*MEMORY[0x1E0C9D538];
      v13->_cobrandLogoRect.size.width = v27;
      v13->_cobrandLogoRect.size.height = v28;
    }
    +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", CFSTR("footer"), v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImageResizingConstraints constraintsWithMaxSize:](PKImageResizingConstraints, "constraintsWithMaxSize:", 286.0, 15.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scale");
    objc_msgSend(v30, "setOutputScale:");
    objc_msgSend(v29, "resizedImageWithConstraints:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    footerImage = v13->_footerImage;
    v13->_footerImage = (PKImage *)v31;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("dynamicLayerStaticFallback"), v14, 0, v12, a5);
    v33 = objc_claimAutoreleasedReturnValue();
    dynamicLayerStaticFallbackImage = v13->_dynamicLayerStaticFallbackImage;
    v13->_dynamicLayerStaticFallbackImage = (PKImage *)v33;

    PKPassFrontFaceDynamicLayerEmitterImage(v19, CFSTR("backgroundParallaxEmitter"), v14, v12, a5);
    v35 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxEmitterImage = v13->_backgroundParallaxEmitterImage;
    v13->_backgroundParallaxEmitterImage = (PKImage *)v35;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("backgroundParallax"), v14, 1, v12, a5);
    v37 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxImage = v13->_backgroundParallaxImage;
    v13->_backgroundParallaxImage = (PKImage *)v37;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("backgroundParallaxCrossDissolve"), v14, 1, v12, a5);
    v39 = objc_claimAutoreleasedReturnValue();
    backgroundParallaxCrossDissolveImage = v13->_backgroundParallaxCrossDissolveImage;
    v13->_backgroundParallaxCrossDissolveImage = (PKImage *)v39;

    PKPassFrontFaceDynamicLayerEmitterImage(v19, CFSTR("neutralEmitter"), v14, v12, a5);
    v41 = objc_claimAutoreleasedReturnValue();
    neutralEmitterImage = v13->_neutralEmitterImage;
    v13->_neutralEmitterImage = (PKImage *)v41;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("neutral"), v14, 0, v12, a5);
    v43 = objc_claimAutoreleasedReturnValue();
    neutralImage = v13->_neutralImage;
    v13->_neutralImage = (PKImage *)v43;

    PKPassFrontFaceDynamicLayerEmitterImage(v19, CFSTR("foregroundParallaxEmitter"), v14, v12, a5);
    v45 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxEmitterImage = v13->_foregroundParallaxEmitterImage;
    v13->_foregroundParallaxEmitterImage = (PKImage *)v45;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("foregroundParallax"), v14, 1, v12, a5);
    v47 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxImage = v13->_foregroundParallaxImage;
    v13->_foregroundParallaxImage = (PKImage *)v47;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("foregroundParallaxCrossDissolve"), v14, 1, v12, a5);
    v49 = objc_claimAutoreleasedReturnValue();
    foregroundParallaxCrossDissolveImage = v13->_foregroundParallaxCrossDissolveImage;
    v13->_foregroundParallaxCrossDissolveImage = (PKImage *)v49;

    PKPassFrontFaceDynamicLayerEmitterImage(v19, CFSTR("staticOverlayEmitter"), v14, v12, a5);
    v51 = objc_claimAutoreleasedReturnValue();
    staticOverlayEmitterImage = v13->_staticOverlayEmitterImage;
    v13->_staticOverlayEmitterImage = (PKImage *)v51;

    PKPassFrontFaceDynamicLayerImage(v19, CFSTR("staticOverlay"), v14, 0, v12, a5);
    v53 = objc_claimAutoreleasedReturnValue();
    staticOverlayImage = v13->_staticOverlayImage;
    v13->_staticOverlayImage = (PKImage *)v53;

    PKPassFrontFaceDynamicLayerEmitterImage(v19, CFSTR("transactionEffectEmitter"), v14, v12, a5);
    v55 = objc_claimAutoreleasedReturnValue();

    transactionEffectEmitterImage = v13->_transactionEffectEmitterImage;
    v13->_transactionEffectEmitterImage = (PKImage *)v55;

    if (v14)
    {
      v57 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v14, "URLForResource:withExtension:", CFSTR("transactionEffectShape"), CFSTR("svg"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "dataWithContentsOfURL:", v58);
      v59 = objc_claimAutoreleasedReturnValue();
      transactionEffectEmitterShapeSVGData = v13->_transactionEffectEmitterShapeSVGData;
      v13->_transactionEffectEmitterShapeSVGData = (NSData *)v59;

    }
    objc_autoreleasePoolPop(context);
    v10 = v63;
  }

  return v13;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_faceImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_dynamicLayerStaticFallbackImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_backgroundParallaxEmitterImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_backgroundParallaxImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_backgroundParallaxCrossDissolveImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_neutralEmitterImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_neutralImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_foregroundParallaxEmitterImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_foregroundParallaxImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_foregroundParallaxCrossDissolveImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_staticOverlayEmitterImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_staticOverlayImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_transactionEffectEmitterImage, "preheatBitmapData");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassFrontFaceImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceImage, CFSTR("faceImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceImageAverageColor, CFSTR("faceImageAverageColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceShadowImage, CFSTR("faceShadowImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_footerImage, CFSTR("footerImage"));
  if (CGRectIsNull(self->_logoRect))
  {
    v7 = 0;
  }
  else
  {
    NSStringFromRect(self->_logoRect);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (CGRectIsNull(self->_cobrandLogoRect))
  {
    v8 = 0;
  }
  else
  {
    NSStringFromRect(self->_cobrandLogoRect);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (CGRectIsNull(self->_thumbnailRect))
  {
    v9 = 0;
  }
  else
  {
    NSStringFromRect(self->_thumbnailRect);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (CGRectIsNull(self->_stripRect))
  {
    v10 = 0;
  }
  else
  {
    NSStringFromRect(self->_stripRect);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("logoRect"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cobrandLogoRect"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("thumbnailRect"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("stripRect"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dynamicLayerStaticFallbackImage, CFSTR("dynamicLayerStaticFallbackImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundParallaxEmitterImage, CFSTR("backgroundParallaxEmitterImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundParallaxImage, CFSTR("backgroundParallaxImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundParallaxCrossDissolveImage, CFSTR("backgroundParallaxCrossDissolveImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_neutralEmitterImage, CFSTR("neutralEmitterImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_neutralImage, CFSTR("neutralImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_foregroundParallaxEmitterImage, CFSTR("foregroundParallaxEmitterImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_foregroundParallaxImage, CFSTR("foregroundParallaxImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_foregroundParallaxCrossDissolveImage, CFSTR("foregroundParallaxCrossDissolveImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_staticOverlayEmitterImage, CFSTR("staticOverlayEmitterImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_staticOverlayImage, CFSTR("staticOverlayImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionEffectEmitterImage, CFSTR("transactionEffectEmitterImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionEffectEmitterShapeSVGData, CFSTR("transactionEffectEmitterShapeImage"));

  objc_autoreleasePoolPop(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (CGRectEqualToRect(self->_logoRect, *((CGRect *)v5 + 5))
      && CGRectEqualToRect(self->_cobrandLogoRect, *((CGRect *)v5 + 6))
      && CGRectEqualToRect(self->_thumbnailRect, *((CGRect *)v5 + 7))
      && CGRectEqualToRect(self->_stripRect, *((CGRect *)v5 + 8)))
    {
      -[PKImage imageHash](self->_faceImage, "imageHash");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v5 + 3), "imageHash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[PKImage imageHash](self->_faceShadowImage, "imageHash");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v5 + 5), "imageHash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[PKImage imageHash](self->_footerImage, "imageHash");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v5 + 6), "imageHash");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11)
             && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_dynamicLayerStaticFallbackImage, *((_QWORD *)v5 + 7))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_backgroundParallaxEmitterImage, *((_QWORD *)v5 + 8))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_backgroundParallaxImage, *((_QWORD *)v5 + 9))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_backgroundParallaxCrossDissolveImage, *((_QWORD *)v5 + 10))
             && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_neutralEmitterImage, *((_QWORD *)v5 + 11))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_neutralImage, *((_QWORD *)v5 + 12))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_foregroundParallaxEmitterImage, *((_QWORD *)v5 + 13))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_foregroundParallaxImage, *((_QWORD *)v5 + 14))
             && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_foregroundParallaxCrossDissolveImage, *((_QWORD *)v5 + 15))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_staticOverlayEmitterImage, *((_QWORD *)v5 + 16))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_staticOverlayImage, *((_QWORD *)v5 + 17))&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_transactionEffectEmitterImage, *((_QWORD *)v5 + 18))
             && -[NSData isEqualToData:](self->_transactionEffectEmitterShapeSVGData, "isEqualToData:", *((_QWORD *)v5 + 19));

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  -[PKImage imageHash](self->_faceImage, "imageHash");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v34, "hash");
  -[PKImage imageHash](self->_faceShadowImage, "imageHash");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v33, "hash") + v3;
  -[PKImage imageHash](self->_footerImage, "imageHash");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v32, "hash");
  -[PKImage imageHash](self->_dynamicLayerStaticFallbackImage, "imageHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + v5 + objc_msgSend(v31, "hash");
  -[PKImage imageHash](self->_backgroundParallaxEmitterImage, "imageHash");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v30, "hash");
  -[PKImage imageHash](self->_backgroundParallaxImage, "imageHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 + objc_msgSend(v29, "hash");
  -[PKImage imageHash](self->_backgroundParallaxCrossDissolveImage, "imageHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 + v8 + objc_msgSend(v28, "hash");
  -[PKImage imageHash](self->_neutralEmitterImage, "imageHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v27, "hash");
  -[PKImage imageHash](self->_neutralImage, "imageHash");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 + objc_msgSend(v26, "hash");
  -[PKImage imageHash](self->_foregroundParallaxEmitterImage, "imageHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 + objc_msgSend(v12, "hash");
  -[PKImage imageHash](self->_foregroundParallaxImage, "imageHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 + v13 + objc_msgSend(v14, "hash");
  -[PKImage imageHash](self->_foregroundParallaxCrossDissolveImage, "imageHash");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[PKImage imageHash](self->_staticOverlayEmitterImage, "imageHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 + objc_msgSend(v18, "hash");
  -[PKImage imageHash](self->_staticOverlayImage, "imageHash");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 + objc_msgSend(v20, "hash");
  -[PKImage imageHash](self->_transactionEffectEmitterImage, "imageHash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 + objc_msgSend(v22, "hash");
  v24 = v15 + v23 + -[NSData hash](self->_transactionEffectEmitterShapeSVGData, "hash");

  return v24;
}

- (void)setFaceImage:(id)a3
{
  objc_storeStrong((id *)&self->_faceImage, a3);
}

- (void)setFaceImageAverageColor:(id)a3
{
  objc_storeStrong((id *)&self->_faceImageAverageColor, a3);
}

- (void)setFaceShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_faceShadowImage, a3);
}

- (PKImage)footerImage
{
  return self->_footerImage;
}

- (void)setFooterImage:(id)a3
{
  objc_storeStrong((id *)&self->_footerImage, a3);
}

- (void)setLogoRect:(CGRect)a3
{
  self->_logoRect = a3;
}

- (void)setCobrandLogoRect:(CGRect)a3
{
  self->_cobrandLogoRect = a3;
}

- (void)setThumbnailRect:(CGRect)a3
{
  self->_thumbnailRect = a3;
}

- (CGRect)stripRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stripRect.origin.x;
  y = self->_stripRect.origin.y;
  width = self->_stripRect.size.width;
  height = self->_stripRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStripRect:(CGRect)a3
{
  self->_stripRect = a3;
}

- (PKImage)dynamicLayerStaticFallbackImage
{
  return self->_dynamicLayerStaticFallbackImage;
}

- (void)setDynamicLayerStaticFallbackImage:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicLayerStaticFallbackImage, a3);
}

- (PKImage)backgroundParallaxEmitterImage
{
  return self->_backgroundParallaxEmitterImage;
}

- (void)setBackgroundParallaxEmitterImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundParallaxEmitterImage, a3);
}

- (PKImage)backgroundParallaxImage
{
  return self->_backgroundParallaxImage;
}

- (void)setBackgroundParallaxImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundParallaxImage, a3);
}

- (PKImage)backgroundParallaxCrossDissolveImage
{
  return self->_backgroundParallaxCrossDissolveImage;
}

- (void)setBackgroundParallaxCrossDissolveImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundParallaxCrossDissolveImage, a3);
}

- (PKImage)neutralEmitterImage
{
  return self->_neutralEmitterImage;
}

- (void)setNeutralEmitterImage:(id)a3
{
  objc_storeStrong((id *)&self->_neutralEmitterImage, a3);
}

- (PKImage)neutralImage
{
  return self->_neutralImage;
}

- (void)setNeutralImage:(id)a3
{
  objc_storeStrong((id *)&self->_neutralImage, a3);
}

- (PKImage)foregroundParallaxEmitterImage
{
  return self->_foregroundParallaxEmitterImage;
}

- (void)setForegroundParallaxEmitterImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundParallaxEmitterImage, a3);
}

- (PKImage)foregroundParallaxImage
{
  return self->_foregroundParallaxImage;
}

- (void)setForegroundParallaxImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundParallaxImage, a3);
}

- (PKImage)foregroundParallaxCrossDissolveImage
{
  return self->_foregroundParallaxCrossDissolveImage;
}

- (void)setForegroundParallaxCrossDissolveImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundParallaxCrossDissolveImage, a3);
}

- (PKImage)staticOverlayEmitterImage
{
  return self->_staticOverlayEmitterImage;
}

- (void)setStaticOverlayEmitterImage:(id)a3
{
  objc_storeStrong((id *)&self->_staticOverlayEmitterImage, a3);
}

- (PKImage)staticOverlayImage
{
  return self->_staticOverlayImage;
}

- (void)setStaticOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_staticOverlayImage, a3);
}

- (PKImage)transactionEffectEmitterImage
{
  return self->_transactionEffectEmitterImage;
}

- (void)setTransactionEffectEmitterImage:(id)a3
{
  objc_storeStrong((id *)&self->_transactionEffectEmitterImage, a3);
}

- (NSData)transactionEffectEmitterShapeSVGData
{
  return self->_transactionEffectEmitterShapeSVGData;
}

- (void)setTransactionEffectEmitterShapeSVGData:(id)a3
{
  objc_storeStrong((id *)&self->_transactionEffectEmitterShapeSVGData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionEffectEmitterShapeSVGData, 0);
  objc_storeStrong((id *)&self->_transactionEffectEmitterImage, 0);
  objc_storeStrong((id *)&self->_staticOverlayImage, 0);
  objc_storeStrong((id *)&self->_staticOverlayEmitterImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxCrossDissolveImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxImage, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxEmitterImage, 0);
  objc_storeStrong((id *)&self->_neutralImage, 0);
  objc_storeStrong((id *)&self->_neutralEmitterImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxCrossDissolveImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxImage, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxEmitterImage, 0);
  objc_storeStrong((id *)&self->_dynamicLayerStaticFallbackImage, 0);
  objc_storeStrong((id *)&self->_footerImage, 0);
  objc_storeStrong((id *)&self->_faceShadowImage, 0);
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
}

@end
