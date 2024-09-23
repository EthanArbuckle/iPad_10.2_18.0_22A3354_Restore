@implementation KNBuildConfetti

- (KNBuildConfetti)initWithAnimationContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNBuildConfetti;
  return -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
}

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNConfetti");
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
  return &off_4699B8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_468F98;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)customAttributes
{
  return 0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("kn-mac-anim-icons-builds-confetti");
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  char *v13;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double width;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect *p_frameRect;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "drawableFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (char *)objc_msgSend(v4, "direction");

  self->_drawableFrame.origin.x = v6;
  self->_drawableFrame.origin.y = v8;
  self->_drawableFrame.size.width = v10;
  self->_drawableFrame.size.height = v12;
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  MinX = CGRectGetMinX(v28);
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  MaxY = CGRectGetMaxY(v31);
  if (self->_drawableFrame.size.width >= self->_drawableFrame.size.height)
    width = self->_drawableFrame.size.width;
  else
    width = self->_drawableFrame.size.height;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v19 = CGRectGetMinY(v32);
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v20 = CGRectGetMaxY(v33);
  if (v20 < MaxY + width || v13 == &stru_68.segname[1])
    v22 = v20;
  else
    v22 = MaxY + width;
  if (v19 < MinY - width)
    v19 = MinY - width;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v23 = CGRectGetMinX(v34);
  if (v23 >= MinX - width)
    v24 = v23;
  else
    v24 = MinX - width;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v25 = CGRectGetMaxX(v35);
  if (v25 >= MaxX + width)
    v26 = MaxX + width;
  else
    v26 = v25;
  p_frameRect = &self->_frameRect;
  v36.origin.x = TSDRectWithPoints(v24, v19, v26, v22);
  *p_frameRect = v36;
  result = CGRectIntegral(v36);
  *p_frameRect = result;
  return result;
}

- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  KNBuildConfettiSystem *v26;
  KNBuildConfettiSystem *particleSystem;
  id v28;

  v28 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti p_setupParticleSystemWithImage:build:randomGenerator:metalContext:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 182, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v28, "frame");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v10, "duration");
  v24 = objc_msgSend(v10, "direction");
  if (v12)
  {
    v25 = v24;
    objc_msgSend(v28, "size");
    v26 = (KNBuildConfettiSystem *)+[KNBuildConfettiSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildConfettiSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", (unint64_t)(sqrt(sqrt(v21 * (v23 / v19) / v17)) * 10000.0), v25, v11, self->_metalShader, v12);
    particleSystem = self->_particleSystem;
    self->_particleSystem = v26;

  }
  -[KNBuildConfettiSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_particleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, CGSizeZero.height);

}

- (void)p_drawWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  char *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  double v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  CATransform3D v43;
  CATransform3D v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  objc_msgSend(v4, "percent");
  v8 = v7;
  v9 = (char *)objc_msgSend(v6, "direction");
  v10 = objc_msgSend(v6, "isBuildIn");
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v35 = *(float64x2_t *)&self->_baseTransform.m11;
  v36 = *(float64x2_t *)&self->_baseTransform.m21;
  v40 = *(float64x2_t *)&self->_baseTransform.m23;
  v41 = *(float64x2_t *)&self->_baseTransform.m33;
  v37 = *(float64x2_t *)&self->_baseTransform.m31;
  v38 = *(float64x2_t *)&self->_baseTransform.m13;
  v42 = *(float64x2_t *)&self->_baseTransform.m43;
  v39 = *(float64x2_t *)&self->_baseTransform.m41;
  objc_msgSend(v15, "singleTextureOpacity");
  if (v10)
    v21 = 1.0 - v8;
  else
    v21 = v8;
  v22 = 1.0 - v21;
  v23 = v21 + v21 * v21 * (1.0 - v22 * v22) + (-(v22 * v22) * v22 + 1.0) * (1.0 - v21 * v21);
  v24 = v23 * 0.5;
  if (v10)
    v25 = v23 * 0.5;
  else
    v25 = 1.0;
  v34 = v20;
  if (v9 == &stru_68.segname[1])
  {
    *(float64x2_t *)&v43.m11 = v35;
    *(float64x2_t *)&v43.m13 = v38;
    *(float64x2_t *)&v43.m21 = v36;
    *(float64x2_t *)&v43.m23 = v40;
    *(float64x2_t *)&v43.m31 = v37;
    *(float64x2_t *)&v43.m33 = v41;
    *(float64x2_t *)&v43.m41 = v39;
    *(float64x2_t *)&v43.m43 = v42;
    CATransform3DTranslate(&v44, &v43, 0.0, v21 * (v21 * (v19 * -2.0)) * (sqrt(sqrt(v17 * (v19 / v14) / v12)) * -0.5 + 1.0), 0.0);
    v35 = *(float64x2_t *)&v44.m11;
    v36 = *(float64x2_t *)&v44.m21;
    v40 = *(float64x2_t *)&v44.m23;
    v41 = *(float64x2_t *)&v44.m33;
    v37 = *(float64x2_t *)&v44.m31;
    v38 = *(float64x2_t *)&v44.m13;
    v42 = *(float64x2_t *)&v44.m43;
    v39 = *(float64x2_t *)&v44.m41;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "renderEncoder"));
  if (!v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti p_drawWithContext:]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"));
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 250, CFSTR("invalid nil value for '%s'"), "renderEncoder");

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metalTextureWithContext:", v26));
  if (v31)
  {
    self->_vertexInput = ($8E8993324294570CC2572FFC521E3532)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v38);
    *(float32x4_t *)self->_anon_b0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v36), v40);
    *(float32x4_t *)&self->_anon_b0[16] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v41);
    *(float32x4_t *)&self->_anon_b0[32] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v42);
    v32 = v24 * v25;
    v33 = v22 * v34;
    *(float *)&self->_anon_b0[56] = v32;
    *(float *)&self->_anon_b0[60] = v33;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalShader, "setPipelineStateWithEncoder:vertexBytes:", v27);
    objc_msgSend(v27, "setFragmentTexture:atIndex:", v31, 0);
    -[KNBuildConfettiSystem drawMetalWithEncoder:](self->_particleSystem, "drawMetalWithEncoder:", v27);
  }

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildConfetti metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4;
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
  id v15;
  void *v16;
  TSDMetalShader *v17;
  TSDMetalShader *metalShader;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  if (objc_msgSend(v6, "count") != (char *)&dword_0 + 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti metalPrepareAnimationWithContext:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 288, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v6, "count"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildConfetti metalPrepareAnimationWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildConfetti.m"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 291, CFSTR("invalid nil value for '%s'"), "device");

  }
  v15 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  objc_msgSend(v15, "setPixelFormat:", objc_msgSend(v16, "pixelFormat"));

  objc_msgSend(v15, "setBlendingEnabled:", 1);
  objc_msgSend(v15, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v15, "setDestinationRGBBlendFactor:", 5);
  v17 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionConfettiVertexShader"), CFSTR("transitionConfettiFragmentShader"), v11, CFSTR("KeynoteMetalLibrary"), v15);
  metalShader = self->_metalShader;
  self->_metalShader = v17;

  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_frameRect.origin.x = v19;
  self->_frameRect.origin.y = v20;
  self->_frameRect.size.width = v21;
  self->_frameRect.size.height = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  -[KNBuildConfetti p_setupParticleSystemWithImage:build:randomGenerator:metalContext:](self, "p_setupParticleSystemWithImage:build:randomGenerator:metalContext:", v23, v5, v24, v25);

  -[KNBuildConfettiSystem rotationMax](self->_particleSystem, "rotationMax");
  *(float *)&v26 = v26;
  *(_DWORD *)&self->_anon_b0[48] = LODWORD(v26);
  -[KNBuildConfettiSystem speedMax](self->_particleSystem, "speedMax");
  *(float *)&v27 = v27;
  *(_DWORD *)&self->_anon_b0[52] = LODWORD(v27);
  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", v4);
  v28 = v37;
  *(_OWORD *)&self->_baseTransform.m31 = v36;
  *(_OWORD *)&self->_baseTransform.m33 = v28;
  v29 = v39;
  *(_OWORD *)&self->_baseTransform.m41 = v38;
  *(_OWORD *)&self->_baseTransform.m43 = v29;
  v30 = v33;
  *(_OWORD *)&self->_baseTransform.m11 = v32;
  *(_OWORD *)&self->_baseTransform.m13 = v30;
  v31 = v35;
  *(_OWORD *)&self->_baseTransform.m21 = v34;
  *(_OWORD *)&self->_baseTransform.m23 = v31;

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalShader;
  KNBuildConfettiSystem *particleSystem;

  metalShader = self->_metalShader;
  self->_metalShader = 0;

  particleSystem = self->_particleSystem;
  self->_particleSystem = 0;

}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v11;
  void *v12;
  int *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;

  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNBuildAttributesDirection"), a4, a5));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNBuildAttributesDirection")));
      v13 = (int *)objc_msgSend(v12, "unsignedIntegerValue");

      if (v13 == &dword_C)
        v14 = 121;
      else
        v14 = 122;
      v15 = objc_msgSend(*a3, "mutableCopy");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("KNBuildAttributesDirection"));

      v17 = objc_retainAutorelease(v15);
      *a3 = v17;

    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;

  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction"), a4, a5));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction")));
      v13 = (char *)objc_msgSend(v12, "unsignedIntegerValue");

      v14 = 122;
      if (v13 == &stru_68.segname[1])
        v14 = 12;
      if (v13 == &stru_68.segname[2])
        v15 = 11;
      else
        v15 = v14;
      v16 = objc_msgSend(*a3, "mutableCopy");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("direction"));

      v18 = objc_retainAutorelease(v16);
      *a3 = v18;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_particleSystem, 0);
}

@end
