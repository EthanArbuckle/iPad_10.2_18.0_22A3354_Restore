@implementation TSDStyledRep

- (void)dealloc
{
  objc_super v3;

  -[CALayer setDelegate:](self->mReflectionLayer, "setDelegate:", 0);

  self->mReflectionLayer = 0;
  self->mShadowLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDStyledRep;
  -[TSDRep dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  TSDLayout *v11;
  CGRect v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDRep info](self, "info");
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = -[TSDRep info](self, "info");
  -[TSDRep layout](self, "layout");
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = -[TSDRep layout](self, "layout");
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>"), v5, self, v7, v8, v10, v11, NSStringFromCGRect(v13));
}

- (id)styledInfo
{
  return -[TSDLayout info](-[TSDRep layout](self, "layout"), "info");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDStyledRep;
  -[TSDRep setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
  -[CALayer setNeedsDisplay](self->mReflectionLayer, "setNeedsDisplay");
}

- (void)viewScaleDidChange
{
  char mFlags;
  objc_super v4;

  mFlags = (char)self->mFlags;
  v4.receiver = self;
  v4.super_class = (Class)TSDStyledRep;
  -[TSDRep viewScaleDidChange](&v4, sel_viewScaleDidChange);
  *(_BYTE *)&self->mFlags = *(_BYTE *)&self->mFlags & 0xFE | mFlags & 1;
}

- (CGRect)clipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  -[TSDStyledRep rectWithEffectsAppliedToRect:](self, "rectWithEffectsAppliedToRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  -[TSDStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v11.c = v5;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a3->tx;
  v13 = CGRectApplyAffineTransform(v12, &v11);
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSDStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:", &v11, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)p_drawReflectionInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;

  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  TSDSetCGContextInfo((uint64_t)a3, 0, 0, 1, 0, v5);
  -[TSDStyledRep reflectionLayerFrameInRoot](self, "reflectionLayerFrameInRoot");
  v7 = v6;
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrameInRoot");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
  v17 = TSDMultiplyRectScalar(v9, v11, v13, v15, v16);
  v19 = TSDSubtractPoints(v17, v18, v7);
  CGContextTranslateCTM(a3, v19, v20);
  -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
  CGContextScaleCTM(a3, v21, v21);
  -[TSDStyledRep drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:drawChildren:](self, "drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:drawChildren:", a3, 0, 0, 1);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->mReflectionLayer == a3)
  {
    -[TSDRep i_configureFontSmoothingForContext:layer:](self, "i_configureFontSmoothingForContext:layer:", a4, a3);
    -[TSDStyledRep p_drawReflectionInContext:](self, "p_drawReflectionInContext:", a4);
  }
}

- (double)opacity
{
  double result;

  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "opacity");
  return result;
}

- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSDLayout *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[TSDRep layout](self, "layout");
  if (v8)
    -[TSDAbstractLayout transformInRoot](v8, "transformInRoot");
  else
    memset(&v13, 0, sizeof(v13));
  CGAffineTransformInvert(&v14, &v13);
  -[TSDStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:", &v14, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height;
  double width;
  double y;
  double x;
  TSDShadow *v10;
  TSDShadow *v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDRep info](self, "info");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[TSDStyledRep shadow](self, "shadow");
    if (v10)
    {
      v11 = v10;
      if (-[TSDShadow isEnabled](v10, "isEnabled"))
      {
        v12 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v35.c = v12;
        *(_OWORD *)&v35.tx = *(_OWORD *)&a4->tx;
        -[TSDShadow shadowBoundsForRect:additionalTransform:](v11, "shadowBoundsForRect:additionalTransform:", &v35, x, y, width, height);
        x = v13;
        y = v14;
        width = v15;
        height = v16;
      }
    }
  }
  if (-[TSDStyledRep reflection](self, "reflection"))
  {
    objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (-[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent"))
    {
      objc_msgSend(-[TSDAbstractLayout geometryInRoot](-[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent"), "geometryInRoot"), "frame");
      v18 = TSDAddPoints(v18, v20, v25);
      v20 = v26;
    }
    v27 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v35.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v35.c = v27;
    *(_OWORD *)&v35.tx = *(_OWORD *)&a4->tx;
    v28 = v18;
    *(double *)&v27 = v20;
    v29 = v22;
    v30 = v24;
    v39 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v27 - 8), &v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v37 = CGRectUnion(v36, v39);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (TSDReflection)reflection
{
  if (self->mIsUpdatingReflectionOpacity)
    return &self->mDynamicReflection->super;
  else
    return (TSDReflection *)objc_msgSend(-[TSDStyledRep styledInfo](self, "styledInfo"), "reflection");
}

- (TSDShadow)shadow
{
  if (self->mIsUpdatingShadow)
    return self->mDynamicShadow;
  else
    return (TSDShadow *)objc_msgSend(-[TSDStyledRep styledInfo](self, "styledInfo"), "shadow");
}

- (BOOL)shouldShowReflection
{
  return objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") ^ 1;
}

- (BOOL)shouldShowShadow
{
  return objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") ^ 1;
}

- (void)createReflectionLayer
{
  TSDTilingLayer *v3;

  v3 = objc_alloc_init(TSDTilingLayer);
  self->mReflectionLayer = &v3->super;
  -[TSDTilingLayer setDelegate:](v3, "setDelegate:", self);
  -[TSDTilingLayer setDrawsInBackground:](v3, "setDrawsInBackground:", 1);
  -[TSDTilingLayer setNeedsDisplay](v3, "setNeedsDisplay");
  -[TSDTilingLayer setTilingMode:](v3, "setTilingMode:", -[TSDRep tilingMode](self, "tilingMode"));
}

- (void)disposeReflectionLayer
{
  -[CALayer setDelegate:](self->mReflectionLayer, "setDelegate:", 0);

  self->mReflectionLayer = 0;
}

- (void)willUpdateEffectLayersForLayer:(id)a3
{
  TSDShadow *v4;
  CALayer *mShadowLayer;

  v4 = -[TSDStyledRep shadow](self, "shadow", a3);
  if (v4 && -[TSDShadow isEnabled](v4, "isEnabled") && -[TSDStyledRep shouldShowShadow](self, "shouldShowShadow"))
  {
    if (!self->mShadowLayer)
    {
      self->mShadowLayer = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
    }
  }
  else
  {
    mShadowLayer = self->mShadowLayer;
    if (mShadowLayer)
    {

      self->mShadowLayer = 0;
    }
  }
  if (-[TSDStyledRep reflection](self, "reflection")
    && -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
  {
    if (!self->mReflectionLayer)
      -[TSDStyledRep createReflectionLayer](self, "createReflectionLayer");
  }
  else if (self->mReflectionLayer)
  {
    -[TSDStyledRep disposeReflectionLayer](self, "disposeReflectionLayer");
  }
}

- (BOOL)isInvisible
{
  return 0;
}

- (CGRect)reflectionLayerFrameInRoot
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGRect v12;

  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrameInRoot");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
  v12.origin.x = TSDMultiplyRectScalar(v4, v6, v8, v10, v11);
  return CGRectIntegral(v12);
}

- (CGRect)reflectionLayerFrame
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
  v12 = TSDMultiplyRectScalar(v4, v6, v8, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (-[TSDRep parentRep](self, "parentRep"))
  {
    -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
    v20 = v19;
    v12 = TSDAddPoints(v12, v14, v19);
    v14 = v21;
  }
  else
  {
    v20 = *MEMORY[0x24BDBF090];
  }
  v31.origin.x = v12;
  v31.origin.y = v14;
  v31.size.width = v16;
  v31.size.height = v18;
  v32 = CGRectIntegral(v31);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  if (-[TSDRep parentRep](self, "parentRep"))
  {
    x = TSDSubtractPoints(x, y, v20);
    y = v26;
  }
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)didUpdateEffectLayersForLayer:(id)a3
{
  _BOOL4 v4;
  CALayer *mShadowLayer;
  TSDShadow *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  CALayer *v17;
  TSDShadow *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  CALayer *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGImage *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53[2];

  objc_msgSend(MEMORY[0x24BDE57D8], "begin", a3);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.0);
  v4 = -[TSDStyledRep isInvisible](self, "isInvisible");
  mShadowLayer = self->mShadowLayer;
  if (v4)
  {
    -[CALayer setContents:](mShadowLayer, "setContents:", 0);
  }
  else if (mShadowLayer)
  {
    v6 = -[TSDStyledRep shadow](self, "shadow");
    if (!v6)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep didUpdateEffectLayersForLayer:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 365, CFSTR("invalid nil value for '%s'"), "shadow");
    }
    if (!-[TSDShadow isEnabled](v6, "isEnabled"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep didUpdateEffectLayersForLayer:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 366, CFSTR("shouldn't have shadow layer if shadow is not enabled"));
    }
    if (v6 && -[TSDShadow isEnabled](v6, "isEnabled"))
    {
      -[TSDStyledRep opacity](self, "opacity");
      v12 = v11;
      -[TSDShadow opacity](v6, "opacity");
      v14 = v12 * v13;
      -[CALayer opacity](self->mShadowLayer, "opacity");
      v16 = v15;
      if (v14 != v16)
      {
        *(float *)&v16 = v14;
        -[CALayer setOpacity:](self->mShadowLayer, "setOpacity:", v16);
      }
      if (v14 != 0.0 && !-[CALayer contents](self->mShadowLayer, "contents"))
        -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
      v17 = self->mShadowLayer;
      objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
      -[TSDStyledRep positionShadowLayer:forShadow:withNaturalBounds:](self, "positionShadowLayer:forShadow:withNaturalBounds:", v17, v6);
    }
  }
  if (self->mShadowLayer)
  {
    v18 = -[TSDStyledRep shadow](self, "shadow");
    if (!v18)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep didUpdateEffectLayersForLayer:]");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 398, CFSTR("invalid nil value for '%s'"), "shadow");
    }
    if (!-[TSDShadow isEnabled](v18, "isEnabled"))
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep didUpdateEffectLayersForLayer:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 399, CFSTR("shouldn't have shadow layer if shadow is not enabled"));
    }
    if (v18 && -[TSDShadow isEnabled](v18, "isEnabled"))
    {
      -[TSDStyledRep opacity](self, "opacity");
      v24 = v23;
      -[TSDShadow opacity](v18, "opacity");
      v26 = v24 * v25;
      -[CALayer opacity](self->mShadowLayer, "opacity");
      v28 = v27;
      if (v26 != v28)
      {
        *(float *)&v28 = v26;
        -[CALayer setOpacity:](self->mShadowLayer, "setOpacity:", v28);
      }
      v29 = self->mShadowLayer;
      objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "shadowedNaturalBoundsWithoutOffset");
      -[TSDStyledRep positionShadowLayer:forShadow:withNaturalBounds:](self, "positionShadowLayer:forShadow:withNaturalBounds:", v29, v18);
    }
    if ((*(_BYTE *)&self->mFlags & 1) != 0)
    {
      -[CALayer bounds](self->mShadowLayer, "bounds");
      v31 = v30;
      v33 = v32;
      -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
      v35 = -[TSDStyledRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, 1, TSDMultiplySizeScalar(v31, v33, 1.0 / v34));
      -[CALayer setContents:](self->mShadowLayer, "setContents:", v35);
      *(_BYTE *)&self->mFlags &= ~1u;
      CGImageRelease(v35);
    }
  }
  if (self->mReflectionLayer)
  {
    -[TSDStyledRep reflectionLayerFrameInRoot](self, "reflectionLayerFrameInRoot");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    memset(&v53[1], 0, sizeof(CGAffineTransform));
    -[TSDRep parentLayerInverseTransformInRootForZeroAnchor](self, "parentLayerInverseTransformInRootForZeroAnchor");
    v44 = TSDCenterOfRect(v37, v39, v41, v43);
    v52 = v53[1];
    TSDTransformConvertForNewOrigin(&v52, v53, v44, v45);
    v53[1] = v53[0];
    -[CALayer setIfDifferentFrame:orTransform:](self->mReflectionLayer, "setIfDifferentFrame:orTransform:", v53, v37, v39, v41, v43);
    -[TSDStyledRep opacity](self, "opacity");
    v47 = v46;
    -[TSDReflection opacity](-[TSDStyledRep reflection](self, "reflection"), "opacity");
    v49 = v47 * v48;
    -[CALayer opacity](self->mReflectionLayer, "opacity");
    v51 = v50;
    if (v49 != v51)
    {
      *(float *)&v51 = v49;
      -[CALayer setOpacity:](self->mReflectionLayer, "setOpacity:", v51);
    }
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)invalidateShadowLayer
{
  *(_BYTE *)&self->mFlags |= 1u;
}

- (void)positionShadowLayer:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 *v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  void *v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
  v13 = v12;
  if (objc_msgSend(a4, "isDropShadow"))
  {
    TSDMultiplyRectScalar(x, y, width, height, v13);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v88 = 0u;
    -[TSDRep computeDirectLayerFrame:andTransform:](self, "computeDirectLayerFrame:andTransform:", &v91, &v88);
    v14 = TSDCenterOfRect(*(CGFloat *)&v91, *((CGFloat *)&v91 + 1), *(CGFloat *)&v92, *((CGFloat *)&v92 + 1));
    v16 = v15;
    objc_msgSend(a4, "offsetDelta");
    TSDMultiplyPointScalar(v17, v18, v13);
    v19 = TSDRoundedPoint();
    objc_msgSend(a3, "setPosition:", TSDAddPoints(v14, v16, v19));
    objc_msgSend(a3, "setBounds:", TSDRectWithSize());
    v85 = v88;
    v86 = v89;
    v87 = v90;
    v20 = &v85;
  }
  else if (objc_msgSend(a4, "isContactShadow"))
  {
    -[TSDShadow boundsForRep:](-[TSDStyledRep shadow](self, "shadow"), "boundsForRep:", self);
    v25 = TSDMultiplyRectScalar(v21, v22, v23, v24, v13);
    v29 = TSDCenterOfRect(v25, v26, v27, v28);
    v31 = v30;
    objc_msgSend(a4, "offset");
    TSDMultiplyPointScalar(0.0, v32, v13);
    v33 = TSDRoundedPoint();
    v34 = TSDAddPoints(v29, v31, v33);
    v36 = v35;
    if (-[TSDRep parentRep](self, "parentRep"))
    {
      -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
      v34 = v34 - v37;
      v36 = v36 - v38;
    }
    objc_msgSend(a3, "setPosition:", v34, v36);
    objc_msgSend(a3, "setBounds:", TSDRectWithSize());
    v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v82 = *MEMORY[0x24BDBD8B8];
    v83 = v39;
    v84 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v20 = &v82;
  }
  else
  {
    if (!objc_msgSend(a4, "isCurvedShadow"))
      goto LABEL_14;
    objc_opt_class();
    v40 = (void *)TSUDynamicCast();
    -[TSDShadow boundsForRep:](-[TSDStyledRep shadow](self, "shadow"), "boundsForRep:", self);
    v45 = TSDMultiplyRectScalar(v41, v42, v43, v44, v13);
    v49 = TSDCenterOfRect(v45, v46, v47, v48);
    v51 = v50;
    objc_msgSend(v40, "offsetFromCurve");
    objc_msgSend(v40, "curve");
    if (v52 > 0.0)
    {
      TSDAddPoints(v49, v51, 0.0);
      v49 = TSDRoundedPoint();
      v51 = v53;
    }
    objc_msgSend(a4, "offsetDelta");
    TSDMultiplyPointScalar(v54, v55, v13);
    v56 = TSDRoundedPoint();
    v57 = TSDAddPoints(v49, v51, v56);
    v59 = v58;
    if (-[TSDRep parentRep](self, "parentRep"))
    {
      -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
      v57 = v57 - v60;
      v59 = v59 - v61;
    }
    objc_msgSend(a3, "setPosition:", v57, v59);
    objc_msgSend(a3, "setBounds:", TSDRectWithSize());
    v62 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v79 = *MEMORY[0x24BDBD8B8];
    v80 = v62;
    v81 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v20 = &v79;
  }
  objc_msgSend(a3, "setAffineTransform:", v20, v79, v80, v81, v82, v83, v84, v85, v86, v87);
LABEL_14:
  objc_msgSend(a3, "frame");
  v64 = v63;
  v66 = v65;
  v67 = objc_msgSend(a3, "superlayer");
  if (v67)
  {
    v68 = (void *)v67;
    do
    {
      objc_msgSend(v68, "frame");
      v64 = TSDAddPoints(v64, v66, v69);
      v66 = v70;
      v68 = (void *)objc_msgSend(v68, "superlayer");
    }
    while (v68);
  }
  objc_msgSend(a3, "position");
  v72 = v71;
  v74 = v73;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v76 = TSDRoundedPointForScale(v64, v66, v75);
  v78 = TSDSubtractPoints(v76, v77, v64);
  objc_msgSend(a3, "setPosition:", TSDAddPoints(v72, v74, v78));
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return (CGImage *)objc_msgSend(a4, "newShadowImageForRep:withSize:drawSelector:unflipped:", self, a5, a6, a3.width, a3.height);
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5
{
  char **v5;

  v5 = &selRef_drawInContextWithoutEffectsForAlphaOnly_;
  if (!a5)
    v5 = &selRef_drawInContextWithoutEffectsOrChildrenForAlphaOnly_;
  return -[TSDStyledRep newShadowImageWithSize:shadow:drawSelector:unflipped:](self, "newShadowImageWithSize:shadow:drawSelector:unflipped:", -[TSDStyledRep shadow](self, "shadow"), *v5, a4, a3.width, a3.height);
}

- (CGImage)p_newReflectionImageWithSize:(CGSize)a3 applyOpacity:(BOOL)a4 viewScale:(double)a5 withBlock:(id)a6
{
  _BOOL8 v8;
  double v10;
  double v11;
  CGContext *v12;
  CGContext *v13;
  CGImage *Image;

  v8 = a4;
  v10 = TSDCeilSize(a3.width);
  if (v10 <= 0.0)
    return 0;
  if (v11 <= 0.0)
    return 0;
  v12 = TSDBitmapContextCreate(11, v10);
  if (!v12)
    return 0;
  v13 = v12;
  CGContextScaleCTM(v12, a5, a5);
  TSDSetCGContextInfo((uint64_t)v13, -[TSDCanvas isPrinting](-[TSDRep canvas](self, "canvas"), "isPrinting"), -[TSDCanvas isDrawingIntoPDF](-[TSDRep canvas](self, "canvas"), "isDrawingIntoPDF"), 0, -[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds"), 1.0);
  -[TSDStyledRep p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:](self, "p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:", v13, 0, v8, 0, a6);
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  return Image;
}

- (void)drawGradientWithAlphaOverReflection:(CGContext *)a3 applyingOpacity:(BOOL)a4 reflectionSize:(CGSize)a5
{
  CGFloat height;
  _BOOL4 v6;
  double *v9;
  double v10;
  uint64_t v11;
  CGFunction *v12;
  CGColorSpace *v13;
  CGShading *Axial;
  CGFunctionCallbacks v15;
  CGFloat range[2];
  __int128 v17;
  CGFloat domain[3];
  uint64_t v19;
  CGPoint v20;

  height = a5.height;
  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v9 = (double *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  v10 = 1.0;
  if (v6)
    -[TSDReflection opacity](-[TSDStyledRep reflection](self, "reflection", 1.0), "opacity");
  *v9 = v10;
  -[TSDReflection fadeAcceleration](-[TSDStyledRep reflection](self, "reflection"), "fadeAcceleration");
  *((_QWORD *)v9 + 1) = v11;
  *(_OWORD *)range = xmmword_217C2A790;
  v17 = unk_217C2A7A0;
  *(_OWORD *)domain = xmmword_217C28F30;
  *(_OWORD *)&v15.version = xmmword_24D82CCB0;
  v15.releaseInfo = releaseReflectionShadingInfo;
  v12 = CGFunctionCreate(v9, 1uLL, domain, 2uLL, range, &v15);
  v13 = (CGColorSpace *)TSUDeviceGrayColorSpace();
  v20.x = 0.0;
  v20.y = height;
  Axial = CGShadingCreateAxial(v13, *MEMORY[0x24BDBEFB0], v20, v12, 1, 1);
  CGContextSetBlendMode(a3, kCGBlendModeDestinationIn);
  CGContextDrawShading(a3, Axial);
  CGShadingRelease(Axial);
  CGFunctionRelease(v12);
}

- (void)p_drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MaxY;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v13 = -[TSDStyledRep styledLayout](self, "styledLayout");
  objc_msgSend(v13, "reflectionFrame");
  v15 = v14;
  v17 = v16;
  CGContextSaveGState(a3);
  if (v10)
  {
    v40.origin.x = TSDRectWithSize();
    CGContextBeginTransparencyLayerWithRect(a3, v40, 0);
  }
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v19 = v18 * TSDCGContextAssociatedScreenScale((uint64_t)a3);
  v20 = TSDAliasRound(v19);
  CGContextTranslateCTM(a3, 0.0, v20 / v19);
  -[TSDAbstractLayout alignmentFrame](-[TSDRep layout](self, "layout"), "alignmentFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "aliasedAlignmentFrameForScale:", v19);
  MaxY = CGRectGetMaxY(v41);
  v42.origin.x = v22;
  v42.origin.y = v24;
  v42.size.width = v26;
  v42.size.height = v28;
  v30 = CGRectGetMaxY(v42);
  CGContextTranslateCTM(a3, 0.0, MaxY - v30 + MaxY - v30);
  objc_msgSend(v13, "alignmentFrameInRoot");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, v38);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -v32, -v34);
  if (v13)
    objc_msgSend(v13, "transformInRoot");
  else
    memset(&v39, 0, sizeof(v39));
  CGContextConcatCTM(a3, &v39);
  TSDCGContextSetIsReflection((uint64_t)a3, 1);
  (*((void (**)(id, CGContext *))a7 + 2))(a7, a3);
  TSDCGContextSetIsReflection((uint64_t)a3, 0);
  CGContextRestoreGState(a3);
  if (v8)
  {
    v43.size.width = v36 + 2.0;
    v43.origin.x = -1.0;
    v43.origin.y = 0.0;
    v43.size.height = v38;
    CGContextClipToRect(a3, v43);
  }
  -[TSDStyledRep drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:](self, "drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:", a3, v9, v15, v17, *(_OWORD *)&v39.a, *(_OWORD *)&v39.c, *(_OWORD *)&v39.tx);
  if (v10)
    CGContextEndTransparencyLayer(a3);
  CGContextRestoreGState(a3);
}

- (void)drawReflectionIntoReflectionFrameInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 drawChildren:(BOOL)a6
{
  _QWORD v6[5];
  BOOL v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __110__TSDStyledRep_drawReflectionIntoReflectionFrameInContext_withTransparencyLayer_applyingOpacity_drawChildren___block_invoke;
  v6[3] = &unk_24D82CCD0;
  v6[4] = self;
  v7 = a6;
  -[TSDStyledRep p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:](self, "p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:", a3, a4, a5, 0, v6);
}

uint64_t __110__TSDStyledRep_drawReflectionIntoReflectionFrameInContext_withTransparencyLayer_applyingOpacity_drawChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a2, 1, 1, 0, 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  TSDShadow *v9;
  TSDShadow *v10;
  double v11;
  CGFloat x;
  double v13;
  CGFloat y;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  CGImage *v19;
  CGImage *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  TSDLayout *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  TSDAbstractLayout *v45;
  double v46;
  double v47;
  CGFloat v48;
  CGAffineTransform *v49;
  double v50;
  TSDLayout *v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  _BYTE v57[48];
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform transform;
  _BYTE v63[48];
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v5 = a5;
  v6 = a4;
  v9 = -[TSDStyledRep shadow](self, "shadow");
  if (v9)
  {
    v10 = v9;
    if (-[TSDShadow isEnabled](v9, "isEnabled"))
    {
      if (-[TSDStyledRep shouldShowShadow](self, "shouldShowShadow"))
      {
        -[TSDShadow boundsInNaturalSpaceForRep:](v10, "boundsInNaturalSpaceForRep:", self);
        x = v11;
        y = v13;
        width = v15;
        height = v17;
        v19 = -[TSDStyledRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, v6, v15, v17);
        if (v19)
        {
          v20 = v19;
          CGContextSaveGState(a3);
          -[TSDShadow opacity](v10, "opacity");
          v22 = v21;
          if (v5)
          {
            -[TSDStyledRep opacity](self, "opacity");
            v22 = v22 * v23;
          }
          if (v22 < 1.0)
            CGContextSetAlpha(a3, v22);
          if (-[TSDShadow isDropShadow](v10, "isDropShadow"))
          {
            -[TSDShadow offsetDelta](v10, "offsetDelta");
            v25 = v24;
            v27 = v26;
            v28 = -[TSDStyledRep styledLayout](self, "styledLayout");
            if (v28)
              objc_msgSend(v28, "transformInRoot");
            else
              memset(&v64, 0, sizeof(v64));
            CGAffineTransformInvert(&v65, &v64);
            v46 = TSDDeltaApplyAffineTransform((float64x2_t *)&v65, v25, v27);
            v48 = v47;
            v66.origin.x = x;
            v66.origin.y = y;
            v66.size.width = width;
            v66.size.height = height;
            v67 = CGRectOffset(v66, v46, v48);
            x = v67.origin.x;
            y = v67.origin.y;
            width = v67.size.width;
            height = v67.size.height;
            TSDAffineTransformForFlips(0, 1, (uint64_t)v63, v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
            v49 = (CGAffineTransform *)v63;
          }
          else
          {
            if (-[TSDShadow isContactShadow](v10, "isContactShadow"))
            {
              objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "alignmentFrameInRoot");
              v30 = v29;
              objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "alignmentFrameInRoot");
              v32 = v31;
              v34 = v33;
              v35 = -[TSDRep layout](self, "layout");
              if (v35)
                -[TSDAbstractLayout transformInRoot](v35, "transformInRoot");
              else
                memset(&v61, 0, sizeof(v61));
              CGAffineTransformInvert(&transform, &v61);
              CGContextConcatCTM(a3, &transform);
              CGContextTranslateCTM(a3, v32, v34);
              -[TSDShadow offset](v10, "offset");
              CGContextTranslateCTM(a3, 0.0, v30 + v50);
              CGContextTranslateCTM(a3, 0.0, v30);
              CGContextScaleCTM(a3, 1.0, -1.0);
              goto LABEL_32;
            }
            if (!-[TSDShadow isCurvedShadow](v10, "isCurvedShadow"))
            {
LABEL_32:
              v70.origin.x = x;
              v70.origin.y = y;
              v70.size.width = width;
              v70.size.height = height;
              CGContextDrawImage(a3, v70, v20);
              CGImageRelease(v20);
              CGContextRestoreGState(a3);
              return;
            }
            objc_opt_class();
            v36 = (void *)TSUDynamicCast();
            -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "frame");
            v38 = v37;
            v40 = v39;
            v42 = v41;
            v44 = v43;
            if (-[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent"))
            {
              v45 = -[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent");
              if (v45)
                -[TSDAbstractLayout transformInRoot](v45, "transformInRoot");
              else
                memset(&v60, 0, sizeof(v60));
              v68.origin.x = v38;
              v68.origin.y = v40;
              v68.size.width = v42;
              v68.size.height = v44;
              v69 = CGRectApplyAffineTransform(v68, &v60);
              v38 = v69.origin.x;
              v40 = v69.origin.y;
            }
            v51 = -[TSDRep layout](self, "layout");
            if (v51)
              -[TSDAbstractLayout transformInRoot](v51, "transformInRoot");
            else
              memset(&v58, 0, sizeof(v58));
            CGAffineTransformInvert(&v59, &v58);
            CGContextConcatCTM(a3, &v59);
            CGContextTranslateCTM(a3, v38, v40);
            -[TSDShadow offsetDelta](v10, "offsetDelta");
            v53 = v52;
            -[TSDShadow offsetDelta](v10, "offsetDelta");
            CGContextTranslateCTM(a3, v53, v54);
            objc_msgSend(v36, "curve");
            if (v55 > 0.0)
            {
              objc_msgSend(v36, "offsetFromCurve");
              *(float *)&v56 = v56;
              CGContextTranslateCTM(a3, 0.0, *(float *)&v56);
            }
            TSDAffineTransformForFlips(0, 1, (uint64_t)v57, x, y, width, height);
            v49 = (CGAffineTransform *)v57;
          }
          CGContextConcatCTM(a3, v49);
          goto LABEL_32;
        }
      }
    }
  }
}

- (void)drawReflectionInContext:(CGContext *)a3 withTransparencyLayer:(BOOL)a4 applyingOpacity:(BOOL)a5 shouldClipGradient:(BOOL)a6 withBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGImage *v23;
  CGImage *v24;
  double v25;
  double v26;
  double MinY;
  CGFloat MaxY;
  CGFloat v29;
  CGFloat v30;
  CGAffineTransform v31;
  CGAffineTransform transform;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  if (-[TSDStyledRep reflection](self, "reflection")
    && -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
  {
    v13 = -[TSDStyledRep styledLayout](self, "styledLayout");
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "transformInRoot");
    else
      memset(&v31, 0, sizeof(v31));
    CGAffineTransformInvert(&transform, &v31);
    CGContextConcatCTM(a3, &transform);
    objc_msgSend(v14, "reflectionFrame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if (-[TSDCanvas isDrawingIntoPDF](-[TSDRep canvas](self, "canvas"), "isDrawingIntoPDF"))
    {
      v23 = -[TSDStyledRep p_newReflectionImageWithSize:applyOpacity:viewScale:withBlock:](self, "p_newReflectionImageWithSize:applyOpacity:viewScale:withBlock:", v9, a7, TSDMultiplySizeScalar(v20, v22, 4.16666651));
      if (v23)
      {
        v24 = v23;
        if (objc_msgSend(v14, "parent"))
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "parent"), "geometryInRoot"), "frame");
          v16 = TSDAddPoints(v16, v18, v25);
          v18 = v26;
        }
        v33.origin.x = v16;
        v33.origin.y = v18;
        v33.size.width = v20;
        v33.size.height = v22;
        MinY = CGRectGetMinY(v33);
        v34.origin.x = v16;
        v34.origin.y = v18;
        v34.size.width = v20;
        v34.size.height = v22;
        MaxY = CGRectGetMaxY(v34);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        v35.origin.x = v16;
        v35.origin.y = v18;
        v35.size.width = v20;
        v35.size.height = v22;
        CGContextDrawImage(a3, v35, v24);
        CGImageRelease(v24);
      }
    }
    else
    {
      CGContextTranslateCTM(a3, v16, v18);
      objc_msgSend((id)objc_msgSend(v14, "parent"), "frameInRoot");
      CGContextTranslateCTM(a3, v29, v30);
      -[TSDStyledRep p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:](self, "p_drawReflectionIntoReflectionFrameInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:", a3, v10, v9, v8, a7);
    }
  }
}

- (void)drawReflectionInContext:(CGContext *)a3 drawChildren:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__TSDStyledRep_drawReflectionInContext_drawChildren___block_invoke;
  v4[3] = &unk_24D82CCD0;
  v4[4] = self;
  v5 = a4;
  -[TSDStyledRep drawReflectionInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:](self, "drawReflectionInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:", a3, 1, 1, 0, v4);
}

uint64_t __53__TSDStyledRep_drawReflectionInContext_drawChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a2, 1, 1, 0, 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;

  if ((objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") & 1) == 0)
  {
    -[TSDStyledRep drawShadowInContext:withChildren:withDrawableOpacity:](self, "drawShadowInContext:withChildren:withDrawableOpacity:", a3, 1, 1);
    -[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:](self, "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a3, 1, 1, 1, 0, 0);
    -[TSDStyledRep opacity](self, "opacity");
    v6 = v5;
    if (v5 == 1.0)
    {
      -[TSDStyledRep drawReflectionInContext:drawChildren:](self, "drawReflectionInContext:drawChildren:", a3, 1);
    }
    else
    {
      CGContextSaveGState(a3);
      CGContextSetAlpha(a3, v6);
      -[TSDStyledRep drawReflectionInContext:drawChildren:](self, "drawReflectionInContext:drawChildren:", a3, 1);
      CGContextRestoreGState(a3);
    }
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  void *v8;
  uint64_t v9;

  v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4, a5, a6, a7, a8);
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 911, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:]"), 0));
}

- (void)drawInContextWithoutEffects:(CGContext *)a3
{
  -[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:](self, "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a3, 1, 1, 0, 0, 1);
}

- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3
{
  -[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:](self, "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a3, 1, 1, 0, 0, 0);
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
  -[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:](self, "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a3, 1, 1, 0, 1, 1);
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
  -[TSDStyledRep drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:](self, "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a3, 1, 1, 0, 1, 0);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDStyledRep;
  -[TSDRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 518 || a3 == 520)
  {
    if (self->mIsUpdatingShadow)
      -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
  }
  else
  {
    if (a3 != 519)
      return;
    -[CALayer setNeedsDisplay](self->mReflectionLayer, "setNeedsDisplay");
  }
  -[TSDCanvas layoutInvalidated](self->super.mCanvas, "layoutInvalidated");
}

- (id)additionalLayersUnderLayer
{
  void *v3;

  if (!self->mShadowLayer && !self->mReflectionLayer)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (self->mShadowLayer && -[TSDStyledRep shouldShowShadow](self, "shouldShowShadow"))
    objc_msgSend(v3, "addObject:", self->mShadowLayer);
  if (self->mReflectionLayer && -[TSDStyledRep shouldShowReflection](self, "shouldShowReflection"))
    objc_msgSend(v3, "addObject:", self->mReflectionLayer);
  return v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v3 = -[TSDLayout i_wrapPath](-[TSDRep layout](self, "layout"), "i_wrapPath");
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDStyledRep shouldHideSelectionHighlightDueToRectangularPath]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledRep.m"), 987, CFSTR("invalid nil value for '%s'"), "wrapPath");
  }
  if (objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke")
    && objc_msgSend((id)objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke"), "isFrame")&& (objc_msgSend((id)objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "stroke"), "hasMask") & 1) != 0|| -[TSDInteractiveCanvasController usesAlternateDrawableSelectionHighlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "usesAlternateDrawableSelectionHighlight"))
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isRectangular") & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  -[TSDStyledRep pathSourceForSelectionHighlightBehavior](self, "pathSourceForSelectionHighlightBehavior");
  v6 = (void *)TSUDynamicCast();
  if (!v6)
    return (char)v6;
  v7 = v6;
  if (objc_msgSend(v6, "type")
    || (objc_msgSend(v7, "scalar"),
        v9 = v8,
        -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale"),
        v9 * v10 >= 10.0))
  {
LABEL_7:
    LOBYTE(v6) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

- (BOOL)shouldShowSelectionHighlight
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDStyledRep;
  v3 = -[TSDRep shouldShowSelectionHighlight](&v5, sel_shouldShowSelectionHighlight);
  if (v3)
    LOBYTE(v3) = !-[TSDStyledRep shouldHideSelectionHighlightDueToRectangularPath](self, "shouldHideSelectionHighlightDueToRectangularPath");
  return v3;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return 0;
}

- (id)textureForContext:(id)a3
{
  uint64_t v5;
  int v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  TSDTextureSet *v11;
  char v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double b;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  TSDTexturedRectangle *v122;
  uint64_t v123;
  TSDLayout *v124;
  NSDictionary *mTextureActionAttributes;
  uint64_t v126;
  void *v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  float v132;
  char v133;
  double v134;
  double x;
  double v136;
  CGFloat y;
  double v138;
  CGFloat width;
  double v140;
  CGFloat height;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  TSDTexturedRectangle *v160;
  void *v161;
  uint64_t v162;
  double v166;
  double v167;
  double v168;
  double v169;
  TSDTexturedRectangle *v170;
  TSDReflection *v171;
  char v172;
  TSDReflection *v173;
  double v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  double v178;
  double v179;
  double v180;
  CGFloat v181;
  double v182;
  CGFloat v183;
  double v184;
  CGFloat v185;
  double v186;
  CGFloat v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  double v192;
  CGFloat v193;
  CGFloat v194;
  CGFloat v195;
  double v196;
  double v197;
  double v198;
  TSDTexturedRectangle *v199;
  double v200;
  double v201;
  uint64_t v202;
  CGFloat v203;
  CGFloat v204;
  double v205;
  CGFloat v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  _QWORD v215[10];
  char v216;
  _QWORD v217[5];
  CGRect v218;
  double v219;
  CGAffineTransform v220;
  char v221;
  char v222;
  _QWORD v223[6];
  CGRect v224;
  double v225;
  CGAffineTransform v226;
  char v227;
  char v228;
  CGAffineTransform v229;
  CGAffineTransform v230;
  CGAffineTransform v231;
  _QWORD v232[18];
  char v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;

  if (-[TSDRep texture](self, "texture")
    && objc_msgSend(a3, "isEqual:", self->super.mTextureContext)
    && !-[TSDRep temporaryMixingLayout](self, "temporaryMixingLayout"))
  {
    return -[TSDRep texture](self, "texture");
  }
  v5 = objc_msgSend(a3, "isMagicMove");
  v6 = objc_msgSend(a3, "shouldAddMagicMoveObjectOnly");
  v7 = objc_msgSend(a3, "shouldNotAddContainedReps");
  v8 = (void *)objc_msgSend(-[TSDStyledRep styledInfo](self, "styledInfo"), "shadow");
  -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
  v10 = v9;
  v11 = objc_alloc_init(TSDTextureSet);
  -[TSDTextureSet setIsMagicMove:](v11, "setIsMagicMove:", v5);
  v214 = v10;
  if (objc_msgSend(a3, "shouldSeparateShadow")
    && v8
    && ((objc_msgSend(v8, "isEnabled") ^ 1 | v6) & 1) == 0)
  {
    *(_OWORD *)&v231.a = 0uLL;
    v12 = objc_msgSend(a3, "shouldNotAddContainedReps") ^ 1;
    -[TSDShadow boundsForRep:](-[TSDStyledRep shadow](self, "shadow"), "boundsForRep:", self);
    v17 = TSDMultiplyRectScalar(v13, v14, v15, v16, v10);
    v200 = v18;
    v201 = v17;
    -[TSDShadow boundsInNaturalSpaceForRep:](-[TSDStyledRep shadow](self, "shadow"), "boundsInNaturalSpaceForRep:", self);
    v206 = v20;
    v208 = v19;
    v203 = v22;
    v204 = v21;
    v23 = TSDMultiplyRectScalar(v19, v20, v21, v22, v10);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v211 = TSDRectWithSize();
    v31 = v30;
    v33 = v32;
    v35 = v34;
    if (objc_msgSend(v8, "isCurvedShadow"))
    {
      -[TSDRep naturalBounds](self, "naturalBounds");
      v40 = TSDMultiplyRectScalar(v36, v37, v38, v39, v10);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = TSDRectWithSize();
      v51 = TSDCenterRectOverRect(v40, v42, v44, v46, v47, v48, v49, v50);
      v54 = TSDRectWithOriginAndSize(v53, v51 / v27, v52 / v29, v44 / v27, v46 / v29);
      v58 = TSDRectByExpandingBoundingRectToContentRect(v23, v25, v27, v29, v54, v55, v56, v57, 0.2, 0.3, 0.8, 0.7);
      v61 = v60;
      v63 = v62;
      v211 = 0.2;
      v31 = 0.3;
      *(double *)&v33 = 0.8;
      *(double *)&v202 = 0.7;
    }
    else
    {
      v202 = v35;
      v63 = v29;
      v61 = v27;
      v59 = v25;
      v58 = v23;
    }
    v232[0] = MEMORY[0x24BDAC760];
    v232[1] = 3221225472;
    v232[2] = __34__TSDStyledRep_textureForContext___block_invoke;
    v232[3] = &unk_24D82CCF8;
    *(double *)&v232[6] = v208;
    *(CGFloat *)&v232[7] = v206;
    *(CGFloat *)&v232[8] = v204;
    *(CGFloat *)&v232[9] = v203;
    v233 = v12;
    v232[4] = self;
    v232[5] = v8;
    *(double *)&v232[10] = v58;
    *(double *)&v232[11] = v59;
    *(double *)&v232[12] = v61;
    *(double *)&v232[13] = v63;
    *(double *)&v232[14] = v23;
    *(double *)&v232[15] = v25;
    *(double *)&v232[16] = v27;
    *(double *)&v232[17] = v29;
    v207 = v61;
    v209 = *(double *)&v33;
    if (objc_msgSend(v8, "isDropShadow"))
    {
      objc_msgSend(v8, "offset");
      v65 = v31;
      v67 = v66;
      objc_msgSend(v8, "angle");
      TSDOriginRotate(&v231.a, v67, v68 * 0.0174532925);
      v10 = v214;
      v69 = TSDMultiplyPointScalar(v231.a, v231.b, v214);
      v231.a = v69;
      v231.b = v70;
      objc_msgSend(v8, "radius");
      v72 = v69 - v71 * v214;
      b = v231.b;
      objc_msgSend(v8, "radius");
      v75 = b - v74 * v214;
      v31 = v65;
    }
    else if (objc_msgSend(v8, "isContactShadow"))
    {
      objc_msgSend(v8, "offset");
      v10 = v214;
      TSDMultiplyPointScalar(0.0, v76, v214);
      v205 = TSDRoundedPoint();
      -[TSDRep naturalBounds](self, "naturalBounds");
      v77 = v31;
      v79 = v78;
      v80 = v63;
      v82 = v81;
      v84 = v83;
      v86 = v85;
      -[TSDRep naturalBounds](self, "naturalBounds");
      -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
      v88 = v87;
      v90 = v89;
      v91 = v79;
      v31 = v77;
      v92 = v82;
      v63 = v80;
      v95 = TSDCenterRectOverRect(v91, v92, v84, v86, v88, v90, v93, v94);
      v99 = TSDMultiplyRectScalar(v95, v96, v97, v98, v214);
      v100 = TSDSubtractPoints(v201, v200, v99);
      v72 = TSDAddPoints(v100, v101, v205);
      v75 = v102;
    }
    else
    {
      if (objc_msgSend(v8, "isCurvedShadow"))
      {
        -[TSDRep naturalBounds](self, "naturalBounds");
        v103 = v61;
        v10 = v214;
        TSDMultiplyRectScalar(v104, v105, v106, v107, v214);
        v110 = (v103 - v108) * -0.5;
        v111 = (v63 - v109) * -0.5;
        objc_opt_class();
        v112 = (void *)TSUDynamicCast();
        objc_msgSend(v112, "curve");
        v113 = *(double *)&v202;
        if (v114 > 0.0)
        {
          objc_msgSend(v112, "offsetFromCurve");
          v116 = TSDMultiplyPointScalar(0.0, v115, v214);
          v110 = TSDAddPoints(v110, v111, v116);
          v111 = v117;
        }
        objc_msgSend(v8, "offsetDelta");
        v120 = TSDMultiplyPointScalar(v118, v119, v214);
        v72 = TSDAddPoints(v110, v111, v120);
        v75 = v121;
        goto LABEL_21;
      }
      v72 = *MEMORY[0x24BDBEFB0];
      v75 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v10 = v214;
    }
    v113 = *(double *)&v202;
LABEL_21:
    v122 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v232, v207, v63, v72, v75);
    if (objc_msgSend(v8, "isContactShadow"))
      v123 = 3;
    else
      v123 = 2;
    -[TSDTexturedRectangle setTextureType:](v122, "setTextureType:", v123);
    objc_msgSend(v8, "opacity");
    -[TSDTexturedRectangle setTextureOpacity:](v122, "setTextureOpacity:");
    -[TSDTexturedRectangle setContentRect:](v122, "setContentRect:", v211, v31, v209, v113);
    -[TSDTextureSet addRenderable:](v11, "addRenderable:", v122);

  }
  memset(&v231, 0, sizeof(v231));
  v124 = -[TSDRep layout](self, "layout");
  if (v124)
    -[TSDAbstractLayout transformInRoot](v124, "transformInRoot");
  else
    memset(&v231, 0, sizeof(v231));
  mTextureActionAttributes = self->super.mTextureActionAttributes;
  if (mTextureActionAttributes)
  {
    v126 = -[NSDictionary valueForKey:](mTextureActionAttributes, "valueForKey:", CFSTR("sfx-action-rotation-angle"));
    if (v126)
    {
      v127 = (void *)v126;
      -[TSDRep centerForRotation](self, "centerForRotation");
      v129 = v128;
      v131 = v130;
      v229 = v231;
      CGAffineTransformTranslate(&v230, &v229, v128, v130);
      v231 = v230;
      objc_msgSend(v127, "floatValue");
      v229 = v231;
      CGAffineTransformRotate(&v230, &v229, v132 * 0.0174532925);
      v231 = v230;
      v229 = v230;
      CGAffineTransformTranslate(&v230, &v229, -v129, -v131);
      v231 = v230;
    }
  }
  if ((_DWORD)v5)
  {
    v229 = v231;
    -[TSDRep unRotatedTransform:](self, "unRotatedTransform:", &v229);
    v231 = v230;
  }
  v133 = v7 ^ 1;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v230 = v231;
  v235 = CGRectApplyAffineTransform(v234, &v230);
  v212 = TSDMultiplyRectScalar(v235.origin.x, v235.origin.y, v235.size.width, v235.size.height, v10);
  v230 = v231;
  -[TSDStyledRep p_clipRectInRootForTransform:](self, "p_clipRectInRootForTransform:", &v230);
  x = v134;
  y = v136;
  width = v138;
  height = v140;
  if ((_DWORD)v5
    && objc_msgSend(a3, "shouldSeparateReflection")
    && objc_msgSend(a3, "shouldSeparateShadow"))
  {
    -[TSDStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
    v230 = v231;
    v237 = CGRectApplyAffineTransform(v236, &v230);
    x = v237.origin.x;
    y = v237.origin.y;
    width = v237.size.width;
    height = v237.size.height;
  }
  -[TSDStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  v230 = v231;
  v239 = CGRectApplyAffineTransform(v238, &v230);
  v142 = v239.origin.x;
  v143 = v239.origin.y;
  v144 = v239.size.width;
  v145 = v239.size.height;
  v239.origin.x = x;
  v239.origin.y = y;
  v239.size.width = width;
  v239.size.height = height;
  v249.origin.x = v142;
  v249.origin.y = v143;
  v249.size.width = v144;
  v249.size.height = v145;
  if (!CGRectEqualToRect(v239, v249))
  {
    v146 = TSDCenterOfRect(v142, v143, v144, v145);
    v148 = v147;
    v149 = TSDCenterOfRect(x, y, width, height);
    v151 = TSDMultiplySizeScalar(vabdd_f64(v149, v146), vabdd_f64(v150, v148), 2.0);
    v152 = TSDAddSizes(width, height, v151);
    x = TSDRectWithCenterAndSize(v146, v148, v152);
    y = v153;
    width = v154;
    height = v155;
  }
  v240.origin.x = TSDMultiplyRectScalar(x, y, width, height, v214);
  v241 = CGRectIntegral(v240);
  v242 = CGRectInset(v241, -1.0, -1.0);
  v156 = v242.size.width;
  v157 = v242.size.height;
  v223[0] = MEMORY[0x24BDAC760];
  v223[1] = 3221225472;
  v223[2] = __34__TSDStyledRep_textureForContext___block_invoke_2;
  v223[3] = &unk_24D82CD20;
  v227 = v5;
  v224 = v242;
  v225 = v214;
  v226 = v231;
  v223[4] = self;
  v223[5] = a3;
  v228 = v7 ^ 1;
  v158 = TSDSubtractPoints(v242.origin.x, v242.origin.y, v212);
  v160 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v223, v156, v157, v158, v159);
  -[TSDTexturedRectangle setTextureType:](v160, "setTextureType:", 5);
  -[TSDTexturedRectangle setTextureOpacity:](v160, "setTextureOpacity:", 1.0);
  -[TSDStyledRep opacity](self, "opacity");
  -[TSDTextureSet setTextureOpacity:](v11, "setTextureOpacity:");
  -[TSDTextureSet addRenderable:](v11, "addRenderable:", v160);

  objc_opt_class();
  -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  v161 = (void *)TSUDynamicCast();
  if (objc_msgSend(a3, "shouldSeparateStroke")
    && v161
    && objc_msgSend(v161, "shouldRender"))
  {
    -[TSDStyledRep clipRect](self, "clipRect");
    if ((_DWORD)v5)
      -[TSDRep naturalBounds](self, "naturalBounds");
    v230 = v231;
    v243 = CGRectApplyAffineTransform(*(CGRect *)&v162, &v230);
    v244.origin.x = TSDMultiplyRectScalar(v243.origin.x, v243.origin.y, v243.size.width, v243.size.height, v214);
    v245 = CGRectIntegral(v244);
    v246 = CGRectInset(v245, -1.0, -1.0);
    v166 = v246.size.width;
    v167 = v246.size.height;
    v217[0] = MEMORY[0x24BDAC760];
    v217[1] = 3221225472;
    v217[2] = __34__TSDStyledRep_textureForContext___block_invoke_3;
    v217[3] = &unk_24D82CD48;
    v221 = v5;
    v217[4] = self;
    v218 = v246;
    v219 = v214;
    v220 = v231;
    v222 = v133;
    v168 = TSDSubtractPoints(v246.origin.x, v246.origin.y, v212);
    v170 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v217, v166, v167, v168, v169);
    -[TSDTexturedRectangle setTextureType:](v170, "setTextureType:", 8);
    -[TSDTexturedRectangle setTextureOpacity:](v170, "setTextureOpacity:", 1.0);
    -[TSDTextureSet addRenderable:](v11, "addRenderable:", v170);

  }
  if (objc_msgSend(a3, "shouldSeparateReflection"))
  {
    v171 = -[TSDStyledRep reflection](self, "reflection");
    v172 = v171 ? v6 : 1;
    if ((v172 & 1) == 0)
    {
      v173 = v171;
      objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "reflectionFrame");
      v247.origin.x = TSDMultiplyRectScalar(v174, v175, v176, v177, v214);
      v248 = CGRectIntegral(v247);
      v178 = v248.origin.x;
      v179 = v248.origin.y;
      v210 = v248.size.height;
      v213 = v248.size.width;
      -[TSDRep naturalBounds](self, "naturalBounds");
      -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:");
      v181 = v180;
      v183 = v182;
      v185 = v184;
      v187 = v186;
      -[TSDRep naturalBounds](self, "naturalBounds");
      v192 = TSDCenterRectOverRect(v188, v189, v190, v191, v181, v183, v185, v187);
      v196 = TSDMultiplyRectScalar(v192, v193, v194, v195, v214);
      v197 = TSDSubtractPoints(v178, v179, v196);
      v215[0] = MEMORY[0x24BDAC760];
      v215[1] = 3221225472;
      v215[2] = __34__TSDStyledRep_textureForContext___block_invoke_4;
      v215[3] = &unk_24D82CD70;
      *(double *)&v215[5] = v178;
      *(double *)&v215[6] = v179;
      *(double *)&v215[7] = v213;
      *(double *)&v215[8] = v210;
      *(double *)&v215[9] = v214;
      v215[4] = self;
      v216 = v133;
      v199 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v215, v213, v210, v197, v198);
      -[TSDTexturedRectangle setTextureType:](v199, "setTextureType:", 9);
      -[TSDReflection opacity](v173, "opacity");
      -[TSDTexturedRectangle setTextureOpacity:](v199, "setTextureOpacity:");
      -[TSDTextureSet addRenderable:](v11, "addRenderable:", v199);

    }
  }
  if ((objc_msgSend(a3, "shouldNotCacheTexture") & 1) == 0)
  {
    -[TSDRep setTexture:](self, "setTexture:", v11);
    -[TSDRep setTextureContext:](self, "setTextureContext:", a3);
  }
  return v11;
}

void __34__TSDStyledRep_textureForContext___block_invoke(uint64_t a1, CGContextRef c)
{
  CGImage *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform transform;
  CGAffineTransform v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGRect v30;

  CGContextSaveGState(c);
  v4 = (CGImage *)objc_msgSend(*(id *)(a1 + 32), "newShadowImageWithSize:unflipped:withChildren:", 1, *(unsigned __int8 *)(a1 + 144), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (objc_msgSend(*(id *)(a1 + 40), "isCurvedShadow"))
  {
    memset(&v29, 0, sizeof(v29));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
    if (v5)
      objc_msgSend(v5, "transformInRoot");
    else
      memset(&t1, 0, sizeof(t1));
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
    if (v6)
    {
      objc_msgSend(v6, "transformInRoot");
      v7 = *(double *)&v25;
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
      v7 = 0.0;
    }
    v8 = -v7;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
    if (v9)
    {
      objc_msgSend(v9, "transformInRoot");
      v10 = *((double *)&v22 + 1);
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      v10 = 0.0;
    }
    CGAffineTransformMakeTranslation(&t2, v8, -v10);
    CGAffineTransformConcat(&v28, &t1, &t2);
    CGAffineTransformInvert(&v29, &v28);
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeTranslation(&v19, *(double *)(a1 + 96) * 0.5, *(double *)(a1 + 104) * 0.5);
    transform = v19;
    CGContextConcatCTM(c, &transform);
    transform = v29;
    CGContextConcatCTM(c, &transform);
    transform = v19;
    CGAffineTransformInvert(&v17, &transform);
    CGContextConcatCTM(c, &v17);
    v11 = *(double *)(a1 + 112);
    v12 = *(double *)(a1 + 120);
    v13 = TSDCenterRectOverRect(*(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), v11, v12, *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136));
    v14 = TSDSubtractPoints(v11, v12, v13);
    CGAffineTransformMakeTranslation(&v16, v14, v15);
    CGContextConcatCTM(c, &v16);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isContactShadow"))
  {
    CGContextTranslateCTM(c, 0.0, *(CGFloat *)(a1 + 136));
    CGContextScaleCTM(c, 1.0, -1.0);
  }
  v30.origin.x = TSDRectWithSize();
  CGContextDrawImage(c, v30, v4);
  CGImageRelease(v4);
  CGContextRestoreGState(c);
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_2(uint64_t a1, CGContextRef c)
{
  void *v4;
  double v5;
  __int128 v6;
  uint64_t result;
  CGAffineTransform v8;
  _OWORD v9[3];

  CGContextSetAllowsFontSmoothing(c, 0);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  if (*(_BYTE *)(a1 + 136))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
    if (v4)
      objc_msgSend(v4, "transformInRoot");
    else
      memset(v9, 0, sizeof(v9));
    v5 = TSDTransformAngle((double *)v9);
    TSDCGContextUpdateLayoutAngle((uint64_t)c, v5);
  }
  CGContextTranslateCTM(c, -*(double *)(a1 + 48), -*(double *)(a1 + 56));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 80));
  v6 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(a1 + 120);
  CGContextConcatCTM(c, &v8);
  if ((objc_msgSend(*(id *)(a1 + 40), "shouldSeparateShadow") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "drawShadowInContext:withChildren:withDrawableOpacity:", c, *(unsigned __int8 *)(a1 + 137), 0);
  objc_msgSend(*(id *)(a1 + 32), "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", c, 1, 1, 0, 0, *(unsigned __int8 *)(a1 + 137));
  result = objc_msgSend(*(id *)(a1 + 40), "shouldSeparateReflection");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "drawReflectionInContext:drawChildren:", c, *(unsigned __int8 *)(a1 + 137));
  return result;
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_3(uint64_t a1, CGContextRef c)
{
  void *v4;
  double v5;
  __int128 v6;
  CGAffineTransform v8;
  _OWORD v9[3];

  if (*(_BYTE *)(a1 + 128))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
    if (v4)
      objc_msgSend(v4, "transformInRoot");
    else
      memset(v9, 0, sizeof(v9));
    v5 = TSDTransformAngle((double *)v9);
    TSDCGContextUpdateLayoutAngle((uint64_t)c, v5);
  }
  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  v6 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(a1 + 112);
  CGContextConcatCTM(c, &v8);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  return objc_msgSend(*(id *)(a1 + 32), "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", c, 0, 1, 0, 0, *(unsigned __int8 *)(a1 + 129));
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_4(uint64_t a1, CGContextRef c)
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  char v8;
  CGAffineTransform transform;

  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 72));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "layout");
  if (v4)
    objc_msgSend(v4, "transformInRoot");
  else
    memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(c, &transform);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextSetShouldSubpixelQuantizeFonts(c, 0);
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__TSDStyledRep_textureForContext___block_invoke_5;
  v7[3] = &unk_24D82CCD0;
  v7[4] = v5;
  v8 = *(_BYTE *)(a1 + 80);
  return objc_msgSend(v5, "drawReflectionInContext:withTransparencyLayer:applyingOpacity:shouldClipGradient:withBlock:", c, 0, 0, 0, v7);
}

uint64_t __34__TSDStyledRep_textureForContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInContextWithoutEffects:withContent:withStroke:withOpacity:forAlphaOnly:drawChildren:", a2, 1, 1, 0, 0, *(unsigned __int8 *)(a1 + 40));
}

- (CALayer)shadowLayer
{
  return self->mShadowLayer;
}

- (CALayer)reflectionLayer
{
  return self->mReflectionLayer;
}

@end
