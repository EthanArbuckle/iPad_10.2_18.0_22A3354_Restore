@implementation KNBuildVanish

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.Vanish");
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
  return &off_469940;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_4691D0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("kn-mac-anim-icons-builds-vanish");
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (a7)
  {
    v8 = *(_QWORD *)&a6;
    *a4 = CFSTR("apple:dissolve");
    v11 = KNBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ builds were exported as Dissolve."), &stru_43D7D8, CFSTR("Keynote")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedMenuString:", v8));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

  }
}

- (KNBuildVanish)initWithAnimationContext:(id)a3
{
  KNBuildVanish *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  KNAnimParameterGroup *parameterGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KNBuildVanish;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v10, "initWithAnimationContext:", a3);
  if (v3)
  {
    v4 = KNBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("Vanish"), CFSTR("parameterGroup")));

    v7 = objc_claimAutoreleasedReturnValue(+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", v6));
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v7;

  }
  return v3;
}

- (void)teardown
{
  -[KNGaussianBlurEffect teardown](self->_blurEffect, "teardown");
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  objc_msgSend(a3, "drawableFrame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
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
  if (width * 1.2 >= height * 1.2)
    v12 = width * 1.2;
  else
    v12 = height * 1.2;
  v13 = TSDRectWithPoints(MinX - v12, MinY - v12, MaxX + v12, MaxY + v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v31.origin.x = v20;
  v31.origin.y = v21;
  v31.size.width = v22;
  v31.size.height = v23;
  v28.origin.x = v13;
  v28.origin.y = v15;
  v28.size.width = v17;
  v28.size.height = v19;
  v29 = CGRectIntersection(v28, v31);
  result = CGRectIntegral(v29);
  self->_animationRect = result;
  self->_drawableFrame.origin.x = x;
  self->_drawableFrame.origin.y = y;
  self->_drawableFrame.size.width = width;
  self->_drawableFrame.size.height = height;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double Width;
  double Height;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D v31;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  objc_msgSend(v5, "frameOnCanvas");
  v7 = v6 - CGRectGetMinX(self->_animationRect);
  objc_msgSend(v5, "frameOnCanvas");
  v9 = v8 - CGRectGetMaxY(self->_animationRect);
  Width = CGRectGetWidth(self->_animationRect);
  Height = CGRectGetHeight(self->_animationRect);
  TSDTransform3DMakeOrtho(0.0, Width, 0.0, Height, -1.0, 1.0);
  v12 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&self->_baseMatrix.m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&self->_baseMatrix.m33 = v12;
  v13 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&self->_baseMatrix.m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&self->_baseMatrix.m43 = v13;
  v14 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&self->_baseMatrix.m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&self->_baseMatrix.m13 = v14;
  v15 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&self->_baseMatrix.m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&self->_baseMatrix.m23 = v15;
  v16 = *(_OWORD *)&self->_baseMatrix.m33;
  *(_OWORD *)&v30.m31 = *(_OWORD *)&self->_baseMatrix.m31;
  *(_OWORD *)&v30.m33 = v16;
  v17 = *(_OWORD *)&self->_baseMatrix.m43;
  *(_OWORD *)&v30.m41 = *(_OWORD *)&self->_baseMatrix.m41;
  *(_OWORD *)&v30.m43 = v17;
  v18 = *(_OWORD *)&self->_baseMatrix.m13;
  *(_OWORD *)&v30.m11 = *(_OWORD *)&self->_baseMatrix.m11;
  *(_OWORD *)&v30.m13 = v18;
  v19 = *(_OWORD *)&self->_baseMatrix.m23;
  *(_OWORD *)&v30.m21 = *(_OWORD *)&self->_baseMatrix.m21;
  *(_OWORD *)&v30.m23 = v19;
  CATransform3DTranslate(&v31, &v30, v7, -v9, 0.0);
  v20 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&self->_baseMatrix.m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&self->_baseMatrix.m33 = v20;
  v21 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&self->_baseMatrix.m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&self->_baseMatrix.m43 = v21;
  v22 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&self->_baseMatrix.m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&self->_baseMatrix.m13 = v22;
  v23 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&self->_baseMatrix.m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&self->_baseMatrix.m23 = v23;
  v24 = *(_OWORD *)&self->_baseMatrix.m23;
  v26 = *(_OWORD *)&self->_baseMatrix.m11;
  v25 = *(_OWORD *)&self->_baseMatrix.m13;
  *(_OWORD *)&self->_projectionMatrix.m21 = *(_OWORD *)&self->_baseMatrix.m21;
  *(_OWORD *)&self->_projectionMatrix.m23 = v24;
  *(_OWORD *)&self->_projectionMatrix.m11 = v26;
  *(_OWORD *)&self->_projectionMatrix.m13 = v25;
  v27 = *(_OWORD *)&self->_baseMatrix.m43;
  v29 = *(_OWORD *)&self->_baseMatrix.m31;
  v28 = *(_OWORD *)&self->_baseMatrix.m33;
  *(_OWORD *)&self->_projectionMatrix.m41 = *(_OWORD *)&self->_baseMatrix.m41;
  *(_OWORD *)&self->_projectionMatrix.m43 = v27;
  *(_OWORD *)&self->_projectionMatrix.m31 = v29;
  *(_OWORD *)&self->_projectionMatrix.m33 = v28;

}

- (void)p_setupParticleSystemWithContext:(id)a3 image:(id)a4 build:(id)a5 randomGenerator:(id)a6
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
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TSDMetalShader *vanishMetalShader;
  void *v30;
  KNBuildVanishParticleSystem *v31;
  KNBuildVanishParticleSystem *vanishParticleSystem;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;

  v37 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildVanish p_setupParticleSystemWithContext:image:build:randomGenerator:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildVanish.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 242, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "duration");
  v21 = v20;
  objc_msgSend(v10, "frame");
  v24 = (unint64_t)(sqrt(sqrt(v23 * (v22 / v19) / v17)) * 10000.0);
  objc_msgSend(v10, "size");
  v26 = v25;
  v28 = v27;
  vanishMetalShader = self->_vanishMetalShader;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "metalContext"));
  v31 = (KNBuildVanishParticleSystem *)+[KNBuildVanishParticleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildVanishParticleSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v24, 0, v12, vanishMetalShader, v30, v26, v28, v17, v19, v21);
  vanishParticleSystem = self->_vanishParticleSystem;
  self->_vanishParticleSystem = v31;

  -[TSDTexturedRectangle size](self->_particleTR, "size");
  v34 = v33;
  v36 = v35;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Particle Min Scale"));
  -[KNBuildVanishParticleSystem setMinScale:](self->_vanishParticleSystem, "setMinScale:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Particle Max Scale"));
  -[KNBuildVanishParticleSystem setMaxScale:](self->_vanishParticleSystem, "setMaxScale:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Random Max Speed"));
  -[KNBuildVanishParticleSystem setRandomParticleSpeedMax:](self->_vanishParticleSystem, "setRandomParticleSpeedMax:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Max Speed"));
  -[KNBuildVanishParticleSystem setMaxSpeed:](self->_vanishParticleSystem, "setMaxSpeed:");
  -[KNBuildVanishParticleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_vanishParticleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", v10, 0, v34, v36);

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildVanish metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  -[KNBuildVanish metalAnimationHasBegunWithContext:](self, "metalAnimationHasBegunWithContext:", v4);

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildVanish metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildVanish metalAnimationDidEndWithContext:](self, "metalAnimationDidEndWithContext:", v4);
  -[KNBuildVanish metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", v4);

}

- (void)p_setupMetalBlurEffectsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  KNGaussianBlurEffect *v16;
  KNGaussianBlurEffect *blurEffect;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  KNGaussianBlurEffect *v22;
  void *v23;
  _OWORD v24[8];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Blur Steps"));
  v9 = (unint64_t)fmax(v8, 1.0);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Blur Radius Max"));
  v11 = v10;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Half Size Radius Every"));
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandQueue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandBuffer"));
  v16 = -[KNGaussianBlurEffect initWithContext:]([KNGaussianBlurEffect alloc], "initWithContext:", v4);

  blurEffect = self->_blurEffect;
  self->_blurEffect = v16;

  v18 = *(_OWORD *)&self->_projectionMatrix.m33;
  v24[4] = *(_OWORD *)&self->_projectionMatrix.m31;
  v24[5] = v18;
  v19 = *(_OWORD *)&self->_projectionMatrix.m43;
  v24[6] = *(_OWORD *)&self->_projectionMatrix.m41;
  v24[7] = v19;
  v20 = *(_OWORD *)&self->_projectionMatrix.m13;
  v24[0] = *(_OWORD *)&self->_projectionMatrix.m11;
  v24[1] = v20;
  v21 = *(_OWORD *)&self->_projectionMatrix.m23;
  v24[2] = *(_OWORD *)&self->_projectionMatrix.m21;
  v24[3] = v21;
  -[KNGaussianBlurEffect setMVPMatrix:](self->_blurEffect, "setMVPMatrix:", v24);
  -[KNGaussianBlurEffect setTexture:](self->_blurEffect, "setTexture:", v7);
  -[KNGaussianBlurEffect setSaturateBlurTextures:](self->_blurEffect, "setSaturateBlurTextures:", 1);
  -[KNGaussianBlurEffect setupEffectIfNecessary](self->_blurEffect, "setupEffectIfNecessary");
  v22 = self->_blurEffect;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationContext capabilities](self->super.mAnimationContext, "capabilities"));
  -[KNGaussianBlurEffect createBlurTexturesWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:](v22, "createBlurTexturesWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:", v9 + 1, v15, v23, v11, v13);

  objc_msgSend(v15, "commit");
}

- (void)p_setupParticleTexturedRectWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const __CFData *v7;
  CGDataProvider *v8;
  CGImage *v9;
  TSDTexturedRectangle *v10;
  TSDTexturedRectangle *particleTR;
  TSDTexturedRectangle *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = KNBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", CFSTR("KNBuildVanish"), CFSTR("png")));

  v7 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v15));
  v8 = CGDataProviderCreateWithCFData(v7);

  v9 = CGImageCreateWithPNGDataProvider(v8, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v8);
  v10 = (TSDTexturedRectangle *)objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v9);
  particleTR = self->_particleTR;
  self->_particleTR = v10;

  v12 = self->_particleTR;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "device"));
  -[TSDTexturedRectangle setupMetalTextureForDevice:](v12, "setupMetalTextureForDevice:", v14);

  CGImageRelease(v9);
}

- (void)p_setupMetalShadersWithContext:(id)a3
{
  void *v4;
  id v5;
  TSDMetalShader *v6;
  TSDMetalShader *vanishMetalShader;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "metalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));
  v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v5, "setPixelFormat:", objc_msgSend(v8, "pixelFormat"));
  objc_msgSend(v5, "setBlendingEnabled:", 1);
  objc_msgSend(v5, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v5, "setDestinationAlphaBlendFactor:", 5);
  v6 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildVanishVertexShader"), CFSTR("buildVanishFragmentShader"), v4, CFSTR("KeynoteMetalLibrary"), v5);
  vanishMetalShader = self->_vanishMetalShader;
  self->_vanishMetalShader = v6;

}

- (void)p_setupMetalShaderUniformsWithTexture:(id)a3
{
  KNAnimParameterGroup *parameterGroup;
  id v5;
  double v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  double v10;
  uint64_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  float v17;
  double MidY;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  parameterGroup = self->_parameterGroup;
  v5 = a3;
  -[KNAnimParameterGroup valueForConstant:](parameterGroup, "valueForConstant:", CFSTR("Should Sparkle"));
  *(float *)&v6 = v6;
  *(_DWORD *)&self->_anon_5c[44] = LODWORD(v6);
  v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)&self->_vertexUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_vertexUniforms.ParticleScalePercent = v7;
  *(float32x4_t *)&self->_anon_5c[4] = v8;
  *(float32x4_t *)&self->_anon_5c[20] = v9;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("SparklePeriod"));
  *(float *)&v10 = v10;
  *(_DWORD *)&self->_anon_5c[48] = LODWORD(v10);
  -[KNBuildVanishParticleSystem particleSize](self->_vanishParticleSystem, "particleSize");
  objc_msgSend(v5, "size");
  -[KNBuildVanishParticleSystem particleSize](self->_vanishParticleSystem, "particleSize");
  objc_msgSend(v5, "size");

  v25.origin.x = TSDRectWithSize(v11);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v17 = MidX - CGRectGetMinX(v26);
  v24 = v17;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidY = CGRectGetMidY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  *(float *)&v19 = MidY - CGRectGetMinY(v28);
  *(float *)&v20 = -v24;
  LODWORD(v21) = 0;
  HIDWORD(v21) = v19;
  *(float *)&v22 = v24;
  LODWORD(v23) = 0;
  *((float *)&v20 + 1) = -*(float *)&v19;
  *((float *)&v23 + 1) = -*(float *)&v19;
  *((float *)&v22 + 1) = -*(float *)&v19;
  *(_QWORD *)&self->_anon_5c[68] = __PAIR64__(v19, -v24);
  *(_QWORD *)&self->_anon_5c[76] = v21;
  *(_QWORD *)&self->_anon_5c[84] = __PAIR64__(v19, LODWORD(v24));
  *(_QWORD *)&self->_anon_5c[92] = COERCE_UNSIGNED_INT(-v24);
  *(_QWORD *)&self->_anon_5c[100] = 0;
  *(_QWORD *)&self->_anon_5c[108] = LODWORD(v24);
  *(_QWORD *)&self->_anon_5c[116] = v20;
  *(_QWORD *)&self->_anon_5c[124] = v23;
  *(_QWORD *)&self->_anon_5c[132] = v22;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGSize size;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CATransform3D v15;

  v4 = a3;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_drawableFrame.origin.x = v5;
  self->_drawableFrame.origin.y = v6;
  self->_drawableFrame.size.width = v7;
  self->_drawableFrame.size.height = v8;
  size = self->_drawableFrame.size;
  self->_animationRect.origin = self->_drawableFrame.origin;
  self->_animationRect.size = size;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", v4);
  self->_projectionMatrix = v15;
  -[KNBuildVanish p_setupParticleTexturedRectWithContext:](self, "p_setupParticleTexturedRectWithContext:", v4);
  -[KNBuildVanish p_setupMetalShadersWithContext:](self, "p_setupMetalShadersWithContext:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
  -[KNBuildVanish p_setupParticleSystemWithContext:image:build:randomGenerator:](self, "p_setupParticleSystemWithContext:image:build:randomGenerator:", v4, v11, v12, v13);

  -[KNBuildVanish p_setupMetalShaderUniformsWithTexture:](self, "p_setupMetalShaderUniformsWithTexture:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  LODWORD(v13) = objc_msgSend(v14, "isBuildIn");

  if ((_DWORD)v13)
    -[KNBuildVanish p_setupMetalBlurEffectsWithContext:](self, "p_setupMetalBlurEffectsWithContext:", v4);

}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildOut");

  if (v5)
    -[KNBuildVanish p_setupMetalBlurEffectsWithContext:](self, "p_setupMetalBlurEffectsWithContext:", v6);

}

- (void)p_drawMetalParticleSystemsWithEncoder:(id)a3 texture:(id)a4 percent:(double)a5 sparkles:(BOOL)a6 particleSystemOpacity:(double)a7 metalContext:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  id v23;

  v10 = a6;
  v23 = a3;
  v14 = a4;
  v15 = a8;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleTransparency"), a5);
  if (v10)
  {
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleTransparency"), a5);
    v18 = 1.0 - v17;
  }
  else
  {
    v18 = v16 * a7;
  }
  v19 = v18;
  v20 = a5;
  *(float *)&self->_anon_5c[36] = v20;
  *(float *)&self->_anon_5c[40] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metalTextureWithContext:", v15));
  if (v21)
  {
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_vanishMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v23, &self->_vertexUniforms);
    objc_msgSend(v23, "setVertexTexture:atIndex:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_particleTR, "metalTexture"));
    objc_msgSend(v23, "setFragmentTexture:atIndex:", v22, 0);

    -[KNBuildVanishParticleSystem drawMetalWithEncoder:](self->_vanishParticleSystem, "drawMetalWithEncoder:", v23);
  }

}

- (void)metalRenderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  float v11;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  v33 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metalContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
  objc_msgSend(v33, "percent");
  v7 = v6;
  v8 = 1.0 - v6;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleScale Pow"));
  v10 = pow(v8, v9);
  v11 = TSUMix(v8, v7 * 15.0, v10);
  *(float *)&self->_anon_5c[52] = v11;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Velocity Curve"), v7);
  *(float *)&v12 = 2.0 - v12;
  *(_DWORD *)&self->_anon_5c[56] = LODWORD(v12);
  -[KNBuildVanishParticleSystem speedMax](self->_vanishParticleSystem, "speedMax");
  *(float *)&v13 = v13;
  *(_DWORD *)&self->_anon_5c[60] = LODWORD(v13);
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Opacity Fade"), v7);
  v15 = v14;
  objc_msgSend(v33, "duration");
  v17 = v7 * v16;
  v18 = 0.0;
  if (v17 < 0.1)
  {
    objc_msgSend(v33, "duration", 0.0);
    v18 = v7 * v19 / 0.1;
  }
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Blur Radius Curve"), v18);
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "textures"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastObject"));

  objc_msgSend(v33, "duration");
  if (v7 * v24 <= 0.2)
  {
    objc_msgSend(v23, "singleTextureOpacity");
    -[KNGaussianBlurEffect setOpacity:](self->_blurEffect, "setOpacity:", (1.0 - v15) * v25);
    -[KNGaussianBlurEffect renderEffectAtPercent:withContext:](self->_blurEffect, "renderEffectAtPercent:withContext:", v4, v21);
  }
  objc_msgSend(v33, "duration");
  if (v7 * v26 >= 0.1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "randomGenerator"));
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Min Particle Opacity for Random"));
    v29 = v28;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Max Particle Opacity for Random"));
    objc_msgSend(v27, "doubleBetween::", v29, v30);
    v32 = v31;

    -[KNBuildVanish p_drawMetalParticleSystemsWithEncoder:texture:percent:sparkles:particleSystemOpacity:metalContext:](self, "p_drawMetalParticleSystemsWithEncoder:texture:percent:sparkles:particleSystemOpacity:metalContext:", v5, v23, 1, v4, v7, v32);
  }

}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildOut");

  if (v5)
    -[KNGaussianBlurEffect teardown](self->_blurEffect, "teardown");
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  KNBuildVanishParticleSystem *vanishParticleSystem;
  TSDMetalShader *vanishMetalShader;

  -[KNGaussianBlurEffect teardown](self->_blurEffect, "teardown", a3);
  -[TSDTexturedRectangle teardown](self->_particleTR, "teardown");
  vanishParticleSystem = self->_vanishParticleSystem;
  self->_vanishParticleSystem = 0;

  vanishMetalShader = self->_vanishMetalShader;
  self->_vanishMetalShader = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vanishMetalShader, 0);
  objc_storeStrong((id *)&self->_particleTR, 0);
  objc_storeStrong((id *)&self->_vanishParticleSystem, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end
