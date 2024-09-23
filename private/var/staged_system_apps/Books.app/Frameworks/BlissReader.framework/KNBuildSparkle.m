@implementation KNBuildSparkle

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNSparkle");
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469AC0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-sparkle");
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_468FE8;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect *p_frameRect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  objc_msgSend(a4, "drawableFrame", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  self->_drawableFrame = v24;
  MinX = CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v13 = self->_drawableFrame.size.width;
  if (v13 < self->_drawableFrame.size.height)
    v13 = self->_drawableFrame.size.height;
  if (v13 >= 128.0)
    v14 = v13;
  else
    v14 = 128.0;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v15 = CGRectGetMinY(v28);
  if (v15 >= MinY - v14)
    v16 = v15;
  else
    v16 = MinY - v14;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v17 = CGRectGetMaxY(v29);
  if (v17 >= MaxY + v14)
    v18 = MaxY + v14;
  else
    v18 = v17;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v19 = CGRectGetMinX(v30);
  if (v19 >= MinX - v14)
    v20 = v19;
  else
    v20 = MinX - v14;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v21 = CGRectGetMaxX(v31);
  if (v21 >= MaxX + v14)
    v22 = MaxX + v14;
  else
    v22 = v21;
  p_frameRect = &self->_frameRect;
  v32.origin.x = TSDRectWithPoints(v20, v16, v22, v18);
  *p_frameRect = v32;
  result = CGRectIntegral(v32);
  *p_frameRect = result;
  return result;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect *p_frameRect;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "textures"), "objectAtIndexedSubscript:", 0), "contentRect");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  self->_drawableFrame = v23;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  v12 = self->_drawableFrame.size.width;
  if (v12 < self->_drawableFrame.size.height)
    v12 = self->_drawableFrame.size.height;
  if (v12 >= 128.0)
    v13 = v12;
  else
    v13 = 128.0;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v14 = CGRectGetMinY(v27);
  if (v14 >= MinY - v13)
    v15 = v14;
  else
    v15 = MinY - v13;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v16 = CGRectGetMaxY(v28);
  if (v16 >= MaxY + v13)
    v17 = MaxY + v13;
  else
    v17 = v16;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v18 = CGRectGetMinX(v29);
  if (v18 >= MinX - v13)
    v19 = v18;
  else
    v19 = MinX - v13;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v20 = CGRectGetMaxX(v30);
  if (v20 >= MaxX + v13)
    v21 = MaxX + v13;
  else
    v21 = v20;
  p_frameRect = &self->_frameRect;
  v31.origin.x = TSDRectWithPoints(v19, v15, v21, v17);
  *p_frameRect = v31;
  result = CGRectIntegral(v31);
  *p_frameRect = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  KNSparkleEffect *v13;
  KNAnimationContext *mAnimationContext;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  double x;
  double y;
  double width;
  double height;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v5 = objc_msgSend(a3, "textures");
  v6 = objc_msgSend(a3, "animatedBuild");
  objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "frame");
  -[KNBuildSparkle frameOfEffectWithFrame:context:](self, "frameOfEffectWithFrame:context:", a3);
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildSparkle animationWillBeginWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"), 172, CFSTR("Effect expects one texture. Passed (%ld) textures."), objc_msgSend(v5, "count"));
  v7 = objc_msgSend(v6, "direction");
  v8 = objc_msgSend(v5, "lastObject");
  if (self)
  {
    -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", a3);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
  }
  v9 = v33;
  *(_OWORD *)&self->_baseTransform.m31 = v32;
  *(_OWORD *)&self->_baseTransform.m33 = v9;
  v10 = v35;
  *(_OWORD *)&self->_baseTransform.m41 = v34;
  *(_OWORD *)&self->_baseTransform.m43 = v10;
  v11 = v29;
  *(_OWORD *)&self->_baseTransform.m11 = v28;
  *(_OWORD *)&self->_baseTransform.m13 = v11;
  v12 = v31;
  *(_OWORD *)&self->_baseTransform.m21 = v30;
  *(_OWORD *)&self->_baseTransform.m23 = v12;
  v13 = [KNSparkleEffect alloc];
  mAnimationContext = self->super.mAnimationContext;
  objc_msgSend(v6, "duration");
  v16 = v15;
  v17 = objc_msgSend(v6, "buildType");
  v18 = objc_msgSend(a3, "metalContext");
  v19 = objc_msgSend(a3, "randomGenerator");
  x = self->_frameRect.origin.x;
  y = self->_frameRect.origin.y;
  width = self->_frameRect.size.width;
  height = self->_frameRect.size.height;
  v24 = *(_OWORD *)&self->_baseTransform.m33;
  v32 = *(_OWORD *)&self->_baseTransform.m31;
  v33 = v24;
  v25 = *(_OWORD *)&self->_baseTransform.m43;
  v34 = *(_OWORD *)&self->_baseTransform.m41;
  v35 = v25;
  v26 = *(_OWORD *)&self->_baseTransform.m13;
  v28 = *(_OWORD *)&self->_baseTransform.m11;
  v29 = v26;
  v27 = *(_OWORD *)&self->_baseTransform.m23;
  v30 = *(_OWORD *)&self->_baseTransform.m21;
  v31 = v27;
  self->_effect = -[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:](v13, "initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:", mAnimationContext, v8, &v28, v7, v17, v18, x, y, width, height, v16, v19);
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildSparkle metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)animationDidEndWithContext:(id)a3
{
  -[KNSparkleEffect teardown](self->_effect, "teardown", a3);
  self->_effect = 0;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;

  objc_msgSend(a3, "drawableFrame");
  self->_drawableFrame.origin.x = v5;
  self->_drawableFrame.origin.y = v6;
  self->_drawableFrame.size.width = v7;
  self->_drawableFrame.size.height = v8;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_frameRect.origin.x = v9;
  self->_frameRect.origin.y = v10;
  self->_frameRect.size.width = v11;
  self->_frameRect.size.height = v12;
  -[KNBuildSparkle animationWillBeginWithContext:](self, "animationWillBeginWithContext:", a3);
}

- (void)metalRenderFrameWithContext:(id)a3
{
  KNSparkleEffect *effect;
  double v5;

  effect = self->_effect;
  objc_msgSend(a3, "percent");
  -[KNSparkleEffect renderEffectAtPercent:withContext:](effect, "renderEffectAtPercent:withContext:", objc_msgSend(a3, "metalContext"), v5);
}

@end
