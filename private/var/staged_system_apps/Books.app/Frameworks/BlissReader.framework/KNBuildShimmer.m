@implementation KNBuildShimmer

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNShimmer");
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469A78;
}

+ (id)localizedMenuString:(int)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = KNBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Shimmer *Shimmer Build*"), CFSTR("Shimmer"), CFSTR("Keynote")));

  return v5;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-shimmer");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
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
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  objc_msgSend(a3, "drawableFrame");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  self->_drawableFrame = v22;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxY = CGRectGetMaxY(v25);
  if (self->_drawableFrame.size.width >= self->_drawableFrame.size.height)
    v12 = self->_drawableFrame.size.width;
  else
    v12 = self->_drawableFrame.size.height;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  if (v12 >= v13 / 3.0)
    v14 = v12;
  else
    v14 = v13 / 3.0;
  self->_frameRect.origin.x = TSDRectWithPoints(MinX - v14, MinY - v14, MaxX + v14, MaxY + v14);
  self->_frameRect.origin.y = v15;
  self->_frameRect.size.width = v16;
  self->_frameRect.size.height = v17;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v26 = CGRectIntersection(self->_frameRect, v28);
  self->_frameRect = v26;
  result = CGRectIntegral(v26);
  self->_frameRect = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  KNShimmerEffect *v14;
  KNAnimationContext *mAnimationContext;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  KNShimmerEffect *v29;
  KNShimmerEffect *effect;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v4 = a3;
  -[KNBuildShimmer metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildShimmer animationWillBeginWithContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 151, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v33 = objc_msgSend(v4, "direction");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", v4);
  v10 = v39;
  *(_OWORD *)&self->_baseTransform.m31 = v38;
  *(_OWORD *)&self->_baseTransform.m33 = v10;
  v11 = v41;
  *(_OWORD *)&self->_baseTransform.m41 = v40;
  *(_OWORD *)&self->_baseTransform.m43 = v11;
  v12 = v35;
  *(_OWORD *)&self->_baseTransform.m11 = v34;
  *(_OWORD *)&self->_baseTransform.m13 = v12;
  v13 = v37;
  *(_OWORD *)&self->_baseTransform.m21 = v36;
  *(_OWORD *)&self->_baseTransform.m23 = v13;
  v14 = [KNShimmerEffect alloc];
  mAnimationContext = self->super.mAnimationContext;
  objc_msgSend(v9, "duration");
  v17 = v16;
  v18 = objc_msgSend(v9, "buildType");
  v31 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
  x = self->_frameRect.origin.x;
  y = self->_frameRect.origin.y;
  width = self->_frameRect.size.width;
  height = self->_frameRect.size.height;
  v25 = *(_OWORD *)&self->_baseTransform.m33;
  v38 = *(_OWORD *)&self->_baseTransform.m31;
  v39 = v25;
  v26 = *(_OWORD *)&self->_baseTransform.m43;
  v40 = *(_OWORD *)&self->_baseTransform.m41;
  v41 = v26;
  v27 = *(_OWORD *)&self->_baseTransform.m13;
  v34 = *(_OWORD *)&self->_baseTransform.m11;
  v35 = v27;
  v28 = *(_OWORD *)&self->_baseTransform.m23;
  v36 = *(_OWORD *)&self->_baseTransform.m21;
  v37 = v28;
  v29 = -[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:](v14, "initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:", mAnimationContext, v32, &v34, v33, v18, v19, x, y, width, height, v17, v20);
  effect = self->_effect;
  self->_effect = v29;

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildShimmer metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)animationDidEndWithContext:(id)a3
{
  KNShimmerEffect *effect;

  -[KNShimmerEffect teardown](self->_effect, "teardown", a3);
  effect = self->_effect;
  self->_effect = 0;

}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;

  objc_msgSend(a3, "drawableFrame");
  self->_drawableFrame.origin.x = v4;
  self->_drawableFrame.origin.y = v5;
  self->_drawableFrame.size.width = v6;
  self->_drawableFrame.size.height = v7;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_frameRect.origin.x = v8;
  self->_frameRect.origin.y = v9;
  self->_frameRect.size.width = v10;
  self->_frameRect.size.height = v11;
}

- (void)metalRenderFrameWithContext:(id)a3
{
  KNShimmerEffect *effect;
  id v4;
  double v5;
  double v6;
  id v7;

  effect = self->_effect;
  v4 = a3;
  objc_msgSend(v4, "percent");
  v6 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));

  -[KNShimmerEffect renderEffectAtPercent:withContext:](effect, "renderEffectAtPercent:withContext:", v7, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effect, 0);
}

@end
