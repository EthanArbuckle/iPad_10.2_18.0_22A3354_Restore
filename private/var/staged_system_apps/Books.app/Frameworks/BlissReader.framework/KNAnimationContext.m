@implementation KNAnimationContext

- (KNAnimationContext)initWithShowSize:(CGSize)a3 viewScale:(double)a4 baseLayer:(id)a5 isBaseLayerVisible:(BOOL)a6
{
  KNAnimationContext *v9;
  KNAnimationContext *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double height;
  double v19;
  long double v20;
  long double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CATransform3D v27;
  CATransform3D a;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)KNAnimationContext;
  v9 = -[KNAnimationContext init](&v32, "init");
  v10 = v9;
  if (v9)
  {
    v9->mUnscaledSlideRect.origin.x = TSDRectWithSize(v9);
    v10->mUnscaledSlideRect.origin.y = v11;
    v10->mUnscaledSlideRect.size.width = v12;
    v10->mUnscaledSlideRect.size.height = v13;
    v10->mViewScale = a4;
    objc_msgSend(a5, "bounds");
    v10->mSlideRect.origin.x = v14;
    v10->mSlideRect.origin.y = v15;
    v10->mSlideRect.size.width = v16;
    v10->mSlideRect.size.height = v17;
    v10->mBaseLayer = (CALayer *)objc_msgSend(objc_alloc((Class)CALayer), "initWithLayer:", a5);
    objc_msgSend(a5, "bounds");
    -[CALayer setBounds:](v10->mBaseLayer, "setBounds:");
    objc_msgSend(a5, "position");
    -[CALayer setPosition:](v10->mBaseLayer, "setPosition:");
    v10->mBaseLayerVisible = a6;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer setSublayers:](v10->mBaseLayer, "setSublayers:", 0);
    -[CALayer setName:](v10->mBaseLayer, "setName:", CFSTR("Show base layer"));
    -[CALayer setMasksToBounds:](v10->mBaseLayer, "setMasksToBounds:", 1);
    -[CALayer setEdgeAntialiasingMask:](v10->mBaseLayer, "setEdgeAntialiasingMask:", 0);
    +[CATransaction commit](CATransaction, "commit");
    v10->mFOVInRadians = 0.34906585;
    height = v10->mSlideRect.size.height;
    -[KNAnimationContext fieldOfViewInRadians](v10, "fieldOfViewInRadians");
    v20 = tan(v19 * 0.5);
    v21 = height / (v20 + v20);
    memset(&v31, 0, sizeof(v31));
    TSDTransform3DMakeProjection(&v31, -[KNAnimationContext fieldOfViewInRadians](v10, "fieldOfViewInRadians"));
    memset(&v30, 0, sizeof(v30));
    CATransform3DMakeTranslation(&v30, v10->mSlideRect.size.width * -0.5 - v10->mSlideRect.origin.x, v10->mSlideRect.size.height * -0.5 - v10->mSlideRect.origin.y, -v21);
    a = v30;
    v27 = v31;
    CATransform3DConcat(&v29, &a, &v27);
    v22 = *(_OWORD *)&v29.m33;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m31 = *(_OWORD *)&v29.m31;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m33 = v22;
    v23 = *(_OWORD *)&v29.m43;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m41 = *(_OWORD *)&v29.m41;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m43 = v23;
    v24 = *(_OWORD *)&v29.m13;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m11 = *(_OWORD *)&v29.m11;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m13 = v24;
    v25 = *(_OWORD *)&v29.m23;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m21 = *(_OWORD *)&v29.m21;
    *(_OWORD *)&v10->mSlideProjectionMatrix.m23 = v25;
    v10->mPixelAspectRatio = 1.0;
    v10->mCapabilities = (TSDCapabilities *)objc_alloc_init((Class)TSDCapabilities);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNAnimationContext;
  -[KNAnimationContext dealloc](&v3, "dealloc");
}

- (double)showScale
{
  CALayer *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v2 = -[KNAnimationContext baseLayer](self, "baseLayer");
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationContext showScale]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m"), 128, CFSTR("invalid nil value for '%s'"), "baseLayer");
  v3 = -[CALayer valueForKeyPath:](v2, "valueForKeyPath:", CFSTR("transform.scale.x"));
  v4 = -[CALayer valueForKeyPath:](v2, "valueForKeyPath:", CFSTR("transform.scale.y"));
  v5 = v4;
  if (v3)
  {
    if (v4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationContext showScale]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m"), 131, CFSTR("invalid nil value for '%s'"), "xscale");
    if (v5)
      goto LABEL_5;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationContext showScale]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationContext.m"), 132, CFSTR("invalid nil value for '%s'"), "yscale");
LABEL_5:
  objc_msgSend(v3, "tsu_CGFloatValue");
  v7 = v6;
  objc_msgSend(v5, "tsu_CGFloatValue");
  if (v7 >= v8)
    v8 = v7;
  return fmin(v8, 1.0);
}

- (CGRect)slideRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mSlideRect.origin.x;
  y = self->mSlideRect.origin.y;
  width = self->mSlideRect.size.width;
  height = self->mSlideRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)unscaledSlideRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mUnscaledSlideRect.origin.x;
  y = self->mUnscaledSlideRect.origin.y;
  width = self->mUnscaledSlideRect.size.width;
  height = self->mUnscaledSlideRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CALayer)baseLayer
{
  return self->mBaseLayer;
}

- (BOOL)isBaseLayerVisible
{
  return self->mBaseLayerVisible;
}

- (double)fieldOfViewInRadians
{
  return self->mFOVInRadians;
}

- (CATransform3D)slideProjectionMatrix
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (double)pixelAspectRatio
{
  return self->mPixelAspectRatio;
}

- (void)setPixelAspectRatio:(double)a3
{
  self->mPixelAspectRatio = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (TSDCapabilities)capabilities
{
  return self->mCapabilities;
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

@end
