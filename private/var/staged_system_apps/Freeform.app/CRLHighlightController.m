@implementation CRLHighlightController

- (CALayer)layerToAnimate
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[CRLHighlightController shouldCreateBackground](self, "shouldCreateBackground");
  v4 = 24;
  if (v3)
    v4 = 56;
  return (CALayer *)*(id *)((char *)&self->super.isa + v4);
}

- (void)setPath:(CGPath *)a3
{
  CGPath *path;

  path = self->_path;
  if (path != a3)
  {
    if (path)
      CGPathRelease(path);
    self->_path = CGPathRetain(a3);
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColor *backgroundColor;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor != a3)
  {
    if (backgroundColor)
      CGColorRelease(backgroundColor);
    self->_backgroundColor = CGColorRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CRLHighlightController reset](self, "reset");
  -[CRLHighlightController setPath:](self, "setPath:", 0);
  -[CRLHighlightController setBackgroundColor:](self, "setBackgroundColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLHighlightController;
  -[CRLHighlightController dealloc](&v3, "dealloc");
}

- (void)reset
{
  CGSize size;
  void *v4;
  CALayer *layer;

  size = CGRectZero.size;
  self->_rectToAnimate.origin = CGRectZero.origin;
  self->_rectToAnimate.size = size;
  -[CRLHighlightController setImage:](self, "setImage:", 0);
  -[CRLHighlightController setPath:](self, "setPath:", 0);
  -[CALayer setDelegate:](self->_layer, "setDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self->_layer, "sublayers"));
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", "setDelegate:", 0);

  layer = self->_layer;
  self->_layer = 0;

}

- (BOOL)drawRoundedRect
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void)hide
{
  -[CALayer setHidden:](self->_layer, "setHidden:", 1);
}

- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  CALayer *v10;
  CALayer *layer;
  double y;
  CALayer *v13;
  CALayer *imageLayer;

  if (self->_layer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240FA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06BBC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240FC8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController createLayerWithZOrder:contentsScaleForLayers:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 99, 0, "Shouldn't be creating _layer again");

    -[CRLHighlightController reset](self, "reset");
  }
  if (a4 <= 0.0)
    a4 = 1.0;
  v10 = (CALayer *)objc_alloc_init((Class)CALayer);
  layer = self->_layer;
  self->_layer = v10;

  y = CGPointZero.y;
  -[CALayer setAnchorPoint:](self->_layer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setEdgeAntialiasingMask:](self->_layer, "setEdgeAntialiasingMask:", 0);
  -[CALayer setContentsScale:](self->_layer, "setContentsScale:", a4);
  -[CALayer setZPosition:](self->_layer, "setZPosition:", a3);
  -[CALayer setDelegate:](self->_layer, "setDelegate:", self);
  v13 = (CALayer *)objc_alloc_init((Class)CALayer);
  imageLayer = self->_imageLayer;
  self->_imageLayer = v13;

  -[CALayer setAnchorPoint:](self->_imageLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setEdgeAntialiasingMask:](self->_imageLayer, "setEdgeAntialiasingMask:", 0);
  -[CALayer setContentsScale:](self->_imageLayer, "setContentsScale:", a4);
  -[CALayer addSublayer:](self->_layer, "addSublayer:", self->_imageLayer);
  -[CALayer setDelegate:](self->_imageLayer, "setDelegate:", self);
  -[CALayer setZPosition:](self->_imageLayer, "setZPosition:", 1.0);
}

- (void)p_buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6;
  CGSize size;
  __int128 v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  double v29;
  CGFloat v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect BoundingBox;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = a4;
  size = CGRectZero.size;
  self->_rectToAnimate.origin = CGRectZero.origin;
  self->_rectToAnimate.size = size;
  -[CRLHighlightController setImage:](self, "setImage:", v6);
  -[CRLHighlightController setPath:](self, "setPath:", a3);
  if (a3)
  {
    BoundingBox = CGPathGetBoundingBox(a3);
    v8 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v35.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v35.c = v8;
    *(_OWORD *)&v35.tx = *(_OWORD *)&self->_transform.tx;
    v37 = CGRectApplyAffineTransform(BoundingBox, &v35);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    if (sub_10006178C(v37.origin.x, v37.origin.y, v37.size.width, v37.size.height))
    {
      -[CRLHighlightController viewScale](self, "viewScale");
      if (v13 != 0.0)
      {
        -[CRLHighlightController viewScale](self, "viewScale");
        v15 = v14;
        -[CRLHighlightController viewScale](self, "viewScale");
        CGAffineTransformMakeScale(&v34, v15, v16);
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        v39 = CGRectApplyAffineTransform(v38, &v34);
        x = v39.origin.x;
        y = v39.origin.y;
        width = v39.size.width;
        height = v39.size.height;
      }
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      self->_rectToAnimate = CGRectIntegral(v40);
      -[CALayer setFrame:](self->_layer, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v17 = self->_rectToAnimate.origin.x;
      v18 = self->_rectToAnimate.origin.y;
      v19 = self->_rectToAnimate.size.width;
      v20 = self->_rectToAnimate.size.height;
      objc_msgSend(v6, "size");
      v22 = v21;
      v24 = v23;
      *(float *)&v21 = (v23 - v20) * 0.5;
      v25 = roundf(*(float *)&v21);
      *(float *)&v23 = (v22 - v19) * 0.5;
      v26 = v17 - roundf(*(float *)&v23);
      v27 = v18 - v25;
      LODWORD(v25) = 0.75;
      -[CALayer setShadowOpacity:](self->_imageLayer, "setShadowOpacity:", v25);
      -[CALayer setShadowRadius:](self->_imageLayer, "setShadowRadius:", 1.0);
      -[CALayer setShadowOffset:](self->_imageLayer, "setShadowOffset:", 0.0, 0.0);
      -[CALayer setContents:](self->_imageLayer, "setContents:", -[CRLImage CGImage](self->_image, "CGImage"));
      -[CALayer setFrame:](self->_imageLayer, "setFrame:", v26, v27, v22, v24);
      -[CALayer setContentsGravity:](self->_imageLayer, "setContentsGravity:", kCAGravityCenter);
      v28 = *(_OWORD *)&self->_transform.c;
      *(_OWORD *)&v35.a = *(_OWORD *)&self->_transform.a;
      *(_OWORD *)&v35.c = v28;
      *(_OWORD *)&v35.tx = *(_OWORD *)&self->_transform.tx;
      v29 = sub_100079240(&v35.a);
      memset(&v35, 0, sizeof(v35));
      CGAffineTransformMakeScale(&v35, v29, v30);
      v32 = v35;
      sub_1000796D4(&v32, &v33, v22 * -0.5, v24 * -0.5);
      v35 = v33;
      v31 = v33;
      -[CALayer setAffineTransform:](self->_imageLayer, "setAffineTransform:", &v31);
      -[CALayer setHidden:](self->_layer, "setHidden:", 0);
    }
  }

}

- (void)p_buildLayersWithBackgroundForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6;
  CAShapeLayer *v7;
  CAShapeLayer *backgroundLayer;
  double v9;
  double v10;
  __int128 v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  const CGPath *CopyByTransformingPath;
  const CGPath *v25;
  CGColor *backgroundColor;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v30;
  CGAffineTransform transform;
  CGRect BoundingBox;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v6 = a4;
  -[CRLHighlightController setImage:](self, "setImage:", v6);
  -[CRLHighlightController setPath:](self, "setPath:", a3);
  if (a3)
  {
    v7 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v7;

    -[CAShapeLayer setAnchorPoint:](self->_backgroundLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    -[CAShapeLayer setEdgeAntialiasingMask:](self->_backgroundLayer, "setEdgeAntialiasingMask:", 0);
    -[CALayer contentsScale](self->_imageLayer, "contentsScale");
    -[CAShapeLayer setContentsScale:](self->_backgroundLayer, "setContentsScale:");
    -[CALayer addSublayer:](self->_layer, "addSublayer:", self->_backgroundLayer);
    -[CAShapeLayer setDelegate:](self->_backgroundLayer, "setDelegate:", self);
    -[CAShapeLayer setZPosition:](self->_backgroundLayer, "setZPosition:", -1.0);
    LODWORD(v9) = 0.75;
    -[CAShapeLayer setShadowOpacity:](self->_backgroundLayer, "setShadowOpacity:", v9);
    -[CAShapeLayer setShadowRadius:](self->_backgroundLayer, "setShadowRadius:", 1.0);
    -[CAShapeLayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:", 0.0, 0.0);
    -[CRLHighlightController p_buildLayersForPath:withImage:](self, "p_buildLayersForPath:withImage:", a3, v6);
    LODWORD(v10) = 0;
    -[CALayer setShadowOpacity:](self->_imageLayer, "setShadowOpacity:", v10);
    -[CALayer setFrame:](self->_layer, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    BoundingBox = CGPathGetBoundingBox(a3);
    v11 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&transform.c = v11;
    *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
    v33 = CGRectApplyAffineTransform(BoundingBox, &transform);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    -[CRLHighlightController viewScale](self, "viewScale");
    if (v16 == 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240FE8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E06CEC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241008);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController p_buildLayersWithBackgroundForPath:withImage:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 209, 0, "viewScale must be set before calling this method!");

    }
    memset(&transform, 0, sizeof(transform));
    -[CRLHighlightController viewScale](self, "viewScale");
    v21 = v20;
    -[CRLHighlightController viewScale](self, "viewScale");
    CGAffineTransformMakeScale(&transform, v21, v22);
    -[CRLHighlightController viewScale](self, "viewScale");
    if (v23 != 0.0)
    {
      v30 = transform;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v35 = CGRectApplyAffineTransform(v34, &v30);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
    }
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    self->_rectToAnimate = CGRectIntegral(v36);
    CopyByTransformingPath = CGPathCreateCopyByTransformingPath(a3, &self->_transform);
    v25 = CGPathCreateCopyByTransformingPath(CopyByTransformingPath, &transform);
    -[CAShapeLayer setPath:](self->_backgroundLayer, "setPath:", v25);
    backgroundColor = self->_backgroundColor;
    if (!backgroundColor)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241028);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E06C40();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241048);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController p_buildLayersWithBackgroundForPath:withImage:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 218, 0, "invalid nil value for '%{public}s'", "_backgroundColor");

      backgroundColor = self->_backgroundColor;
    }
    -[CAShapeLayer setFillColor:](self->_backgroundLayer, "setFillColor:", backgroundColor);
    -[CAShapeLayer setContentsGravity:](self->_backgroundLayer, "setContentsGravity:", kCAGravityCenter);
    CGPathRelease(v25);
    CGPathRelease(CopyByTransformingPath);
    -[CALayer setHidden:](self->_layer, "setHidden:", 0);
  }

}

- (void)buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6;

  v6 = a4;
  if (-[CRLHighlightController shouldCreateBackground](self, "shouldCreateBackground"))
    -[CRLHighlightController p_buildLayersWithBackgroundForPath:withImage:](self, "p_buildLayersWithBackgroundForPath:withImage:", a3, v6);
  else
    -[CRLHighlightController p_buildLayersForPath:withImage:](self, "p_buildLayersForPath:withImage:", a3, v6);

}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CGRect)rectToAnimate
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectToAnimate.origin.x;
  y = self->_rectToAnimate.origin.y;
  width = self->_rectToAnimate.size.width;
  height = self->_rectToAnimate.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPath)path
{
  return self->_path;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)shouldCreateBackground
{
  return self->_shouldCreateBackground;
}

- (void)setShouldCreateBackground:(BOOL)a3
{
  self->_shouldCreateBackground = a3;
}

- (CRLImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
