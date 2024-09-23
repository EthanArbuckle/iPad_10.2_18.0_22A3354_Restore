@implementation THWImageCropAnimationController

- (THWImageCropAnimationController)initWithImageContentLayer:(id)a3
{
  char *v4;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWImageCropAnimationController;
  v4 = -[THWImageCropAnimationController init](&v11, "init");
  if (v4)
  {
    *((_QWORD *)v4 + 9) = a3;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v4 + 40) = _Q0;
    *((_QWORD *)v4 + 7) = 0x3FF0000000000000;
  }
  return (THWImageCropAnimationController *)v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWImageCropAnimationController;
  -[THWImageCropAnimationController dealloc](&v3, "dealloc");
}

- (void)setupWrapperLayer
{
  CALayer *v3;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double x;
  double v11;
  double v12;
  CALayer *v13;
  CALayer *cropLayer;
  double v15;
  double v16;
  CATransform3D v17;
  CATransform3D v18;

  v3 = +[CALayer layer](CALayer, "layer");
  self->_wrapperLayer = v3;
  -[CALayer setAnchorPoint:](v3, "setAnchorPoint:", 0.5, 0.5);
  -[CALayer frame](self->_imageContentLayer, "frame");
  -[CALayer setFrame:](self->_wrapperLayer, "setFrame:");
  -[CALayer replaceSublayer:with:](-[CALayer superlayer](self->_imageContentLayer, "superlayer"), "replaceSublayer:with:", self->_imageContentLayer, self->_wrapperLayer);
  y = CGPointZero.y;
  -[CALayer frame](self->_wrapperLayer, "frame");
  -[CALayer setFrame:](self->_imageContentLayer, "setFrame:", CGPointZero.x, y);
  -[CALayer bounds](self->_imageContentLayer, "bounds");
  v6 = v5;
  v8 = v7;
  x = self->_sourceContentsRect.origin.x;
  v9 = self->_sourceContentsRect.origin.y;
  v15 = x * v5;
  v16 = v9 * v7;
  v11 = v5 * self->_sourceContentsRect.size.width;
  v12 = v7 * self->_sourceContentsRect.size.height;
  v13 = +[CALayer layer](CALayer, "layer");
  self->_cropLayer = v13;
  -[CALayer setMasksToBounds:](v13, "setMasksToBounds:", 1);
  -[CALayer setAnchorPoint:](self->_cropLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_cropLayer, "setFrame:", v15, v16, v11, v12);
  -[CALayer setCornerRadius:](self->_cropLayer, "setCornerRadius:", self->_sourceCornerRadius);
  CATransform3DMakeTranslation(&v18, -(x * v6), -(v9 * v8), 0.0);
  cropLayer = self->_cropLayer;
  v17 = v18;
  -[CALayer setSublayerTransform:](cropLayer, "setSublayerTransform:", &v17);
  -[CALayer addSublayer:](self->_cropLayer, "addSublayer:", self->_imageContentLayer);
  if (self->_backgroundLayer)
    -[CALayer addSublayer:](self->_wrapperLayer, "addSublayer:");
  -[CALayer addSublayer:](self->_wrapperLayer, "addSublayer:", self->_cropLayer);
  -[CALayer removeAllAnimations](self->_imageContentLayer, "removeAllAnimations");
}

- (void)setBackgroundLayer:(id)a3
{
  CALayer *backgroundLayer;
  CALayer *v6;
  CALayer *v7;

  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer != a3)
  {
    if (backgroundLayer)
    {
      -[CALayer removeFromSuperlayer](backgroundLayer, "removeFromSuperlayer");
      -[CALayer removeAllAnimations](self->_backgroundLayer, "removeAllAnimations");
      v6 = self->_backgroundLayer;
    }
    else
    {
      v6 = 0;
    }

    v7 = (CALayer *)a3;
    self->_backgroundLayer = v7;
    if (v7)
    {
      -[CALayer insertSublayer:atIndex:](self->_wrapperLayer, "insertSublayer:atIndex:", v7, 0);
      -[CALayer removeAllAnimations](self->_backgroundLayer, "removeAllAnimations");
    }
  }
}

- (void)teardownWrapperLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CALayer *v11;

  -[CALayer frame](self->_wrapperLayer, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CALayer superlayer](self->_imageContentLayer, "superlayer") == self->_cropLayer)
  {
    v11 = -[CALayer superlayer](self->_wrapperLayer, "superlayer");
    -[CALayer setFrame:](self->_imageContentLayer, "setFrame:", v4, v6, v8, v10);
    -[CALayer replaceSublayer:with:](v11, "replaceSublayer:with:", self->_wrapperLayer, self->_imageContentLayer);
  }
  -[CALayer removeFromSuperlayer](self->_wrapperLayer, "removeFromSuperlayer");
  -[CALayer removeAllAnimations](self->_backgroundLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_imageContentLayer, "removeAllAnimations");

  self->_wrapperLayer = 0;
  self->_cropLayer = 0;
}

- (void)addAnimationWithDuration:(double)a3 targetScale:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CABasicAnimation *v15;
  CABasicAnimation *v16;
  CABasicAnimation *v17;
  CABasicAnimation *v18;
  double sourceCornerRadius;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double x;
  double y;
  double v28;
  double v29;
  double v31;
  CATransform3D v32;
  CATransform3D v33;

  if (!self->_animationDisabled)
  {
    v6 = self->_cropDurationScale * a3;
    v31 = self->_cornerRadiusDurationScale * a3;
    -[CALayer bounds](self->_imageContentLayer, "bounds");
    v8 = v7;
    v10 = v9;
    x = self->_sourceContentsRect.origin.x;
    y = self->_sourceContentsRect.origin.y;
    v22 = x * v7;
    v23 = y * v9;
    v11 = v7 * self->_sourceContentsRect.size.width;
    v12 = v9 * self->_sourceContentsRect.size.height;
    v28 = self->_targetContentsRect.origin.x;
    v29 = self->_targetContentsRect.origin.y;
    v24 = v7 * v28;
    v25 = v9 * v29;
    v13 = v7 * self->_targetContentsRect.size.width;
    v14 = v9 * self->_targetContentsRect.size.height;
    v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds.size"));
    -[CABasicAnimation setFromValue:](v15, "setFromValue:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v11, v12));
    -[CABasicAnimation setToValue:](v15, "setToValue:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v13, v14));
    -[CABasicAnimation setRemovedOnCompletion:](v15, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v15, "setFillMode:", kCAFillModeForwards);
    -[CABasicAnimation setDuration:](v15, "setDuration:", v6);
    v16 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
    -[CABasicAnimation setFromValue:](v16, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v23));
    -[CABasicAnimation setToValue:](v16, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v25));
    -[CABasicAnimation setRemovedOnCompletion:](v16, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v16, "setFillMode:", kCAFillModeForwards);
    -[CABasicAnimation setDuration:](v16, "setDuration:", v6);
    v17 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform"));
    CATransform3DMakeTranslation(&v33, -(x * v8), -(y * v10), 0.0);
    -[CABasicAnimation setFromValue:](v17, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v33));
    CATransform3DMakeTranslation(&v32, -(v8 * v28), -(v10 * v29), 0.0);
    -[CABasicAnimation setToValue:](v17, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v32));
    -[CABasicAnimation setRemovedOnCompletion:](v17, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v17, "setFillMode:", kCAFillModeForwards);
    -[CABasicAnimation setDuration:](v17, "setDuration:", v6);
    v18 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("cornerRadius"));
    sourceCornerRadius = self->_sourceCornerRadius;
    *(float *)&sourceCornerRadius = sourceCornerRadius;
    -[CABasicAnimation setFromValue:](v18, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", sourceCornerRadius));
    v20 = self->_targetCornerRadius / a4;
    *(float *)&v20 = v20;
    -[CABasicAnimation setToValue:](v18, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
    -[CABasicAnimation setRemovedOnCompletion:](v18, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v18, "setFillMode:", kCAFillModeForwards);
    -[CABasicAnimation setDuration:](v18, "setDuration:", v31);
    -[CABasicAnimation setBeginTime:](v18, "setBeginTime:", a3 - v31);
    v21 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
    objc_msgSend(v21, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, v16, v18, v17, 0));
    objc_msgSend(v21, "setDuration:", a3);
    objc_msgSend(v21, "setRemovedOnCompletion:", 0);
    objc_msgSend(v21, "setFillMode:", kCAFillModeForwards);
    -[CALayer addAnimation:forKey:](self->_cropLayer, "addAnimation:forKey:", v21, CFSTR("cropAnimation"));
  }
}

- (void)addBackgroundAnimationWithDuration:(double)a3 targetScale:(double)a4
{
  __n128 v4;
  __n128 v5;
  double v7;
  double x;
  double y;
  __n128 v10;
  double v11;
  __n128 v12;
  double v13;
  double v14;
  double v15;
  CABasicAnimation *v16;
  CABasicAnimation *v17;
  id v18;
  id v19;

  if (!self->_animationDisabled)
  {
    if (self->_backgroundLayer)
    {
      v7 = self->_backgroundDurationScale * a3;
      x = self->_backgroundSourceFrame.origin.x;
      y = self->_backgroundSourceFrame.origin.y;
      v10.n128_u64[0] = *(_QWORD *)&self->_backgroundTargetFrame.origin.x;
      v4.n128_u64[0] = *(_QWORD *)&self->_backgroundTargetFrame.size.width;
      v5.n128_u64[0] = *(_QWORD *)&self->_backgroundTargetFrame.size.height;
      v11 = 1.0 / a4;
      v12.n128_u64[0] = *(_QWORD *)&self->_backgroundTargetFrame.origin.y;
      v13 = TSDMultiplyRectScalar(v10, v12, v4, v5, v11);
      v15 = v14;
      v16 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
      -[CABasicAnimation setFromValue:](v16, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y));
      -[CABasicAnimation setToValue:](v16, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v15));
      -[CABasicAnimation setDuration:](v16, "setDuration:", v7);
      -[CABasicAnimation setFillMode:](v16, "setFillMode:", kCAFillModeBoth);
      -[CABasicAnimation setRemovedOnCompletion:](v16, "setRemovedOnCompletion:", 0);
      v17 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds"));
      v18 = -[CABasicAnimation setFromValue:](v17, "setFromValue:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", TSDRectWithSize(v17)));
      -[CABasicAnimation setToValue:](v17, "setToValue:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", TSDRectWithSize(v18)));
      -[CABasicAnimation setDuration:](v17, "setDuration:", v7);
      -[CABasicAnimation setFillMode:](v17, "setFillMode:", kCAFillModeBoth);
      -[CABasicAnimation setRemovedOnCompletion:](v17, "setRemovedOnCompletion:", 0);
      v19 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
      objc_msgSend(v19, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, v17, 0));
      objc_msgSend(v19, "setDuration:", v7);
      objc_msgSend(v19, "setRemovedOnCompletion:", 0);
      objc_msgSend(v19, "setFillMode:", kCAFillModeBoth);
      -[CALayer addAnimation:forKey:](self->_backgroundLayer, "addAnimation:forKey:", v19, CFSTR("frame"));
    }
  }
}

- (id)sourceShadowPath
{
  double v3;
  double v4;

  -[CALayer bounds](self->_imageContentLayer, "bounds");
  return +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", self->_sourceContentsRect.origin.x * v3, self->_sourceContentsRect.origin.y * v4, v3 * self->_sourceContentsRect.size.width, v4 * self->_sourceContentsRect.size.height, self->_sourceCornerRadius);
}

- (id)backgroundShadowPath
{
  id result;
  CALayer *wrapperLayer;

  result = self->_backgroundLayer;
  if (result)
  {
    wrapperLayer = self->_wrapperLayer;
    objc_msgSend(result, "bounds");
    -[CALayer convertRect:fromLayer:](wrapperLayer, "convertRect:fromLayer:", self->_backgroundLayer);
    return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
  }
  return result;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (CGRect)sourceContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceContentsRect.origin.x;
  y = self->_sourceContentsRect.origin.y;
  width = self->_sourceContentsRect.size.width;
  height = self->_sourceContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceContentsRect:(CGRect)a3
{
  self->_sourceContentsRect = a3;
}

- (CGRect)targetContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetContentsRect.origin.x;
  y = self->_targetContentsRect.origin.y;
  width = self->_targetContentsRect.size.width;
  height = self->_targetContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetContentsRect:(CGRect)a3
{
  self->_targetContentsRect = a3;
}

- (double)sourceCornerRadius
{
  return self->_sourceCornerRadius;
}

- (void)setSourceCornerRadius:(double)a3
{
  self->_sourceCornerRadius = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (CGRect)backgroundSourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundSourceFrame.origin.x;
  y = self->_backgroundSourceFrame.origin.y;
  width = self->_backgroundSourceFrame.size.width;
  height = self->_backgroundSourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundSourceFrame:(CGRect)a3
{
  self->_backgroundSourceFrame = a3;
}

- (CGRect)backgroundTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundTargetFrame.origin.x;
  y = self->_backgroundTargetFrame.origin.y;
  width = self->_backgroundTargetFrame.size.width;
  height = self->_backgroundTargetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundTargetFrame:(CGRect)a3
{
  self->_backgroundTargetFrame = a3;
}

- (BOOL)isAnimationDisabled
{
  return self->_animationDisabled;
}

- (void)setAnimationDisabled:(BOOL)a3
{
  self->_animationDisabled = a3;
}

- (double)cropDurationScale
{
  return self->_cropDurationScale;
}

- (void)setCropDurationScale:(double)a3
{
  self->_cropDurationScale = a3;
}

- (double)cornerRadiusDurationScale
{
  return self->_cornerRadiusDurationScale;
}

- (void)setCornerRadiusDurationScale:(double)a3
{
  self->_cornerRadiusDurationScale = a3;
}

- (double)backgroundDurationScale
{
  return self->_backgroundDurationScale;
}

- (void)setBackgroundDurationScale:(double)a3
{
  self->_backgroundDurationScale = a3;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (CALayer)imageContentLayer
{
  return self->_imageContentLayer;
}

- (CALayer)cropLayer
{
  return self->_cropLayer;
}

@end
