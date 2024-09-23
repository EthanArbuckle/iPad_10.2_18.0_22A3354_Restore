@implementation KNBuildFireworks

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KNFireworks");
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
  return &off_469958;
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
  v4 = &off_469200;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-fireworks");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a7)
    *a4 = CFSTR("apple:dissolve");
}

- (KNBuildFireworks)initWithAnimationContext:(id)a3
{
  KNBuildFireworks *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  KNAnimParameterGroup *parameterGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KNBuildFireworks;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v10, "initWithAnimationContext:", a3);
  if (v3)
  {
    v4 = KNBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("Fireworks"), CFSTR("parameterGroup")));

    v7 = objc_claimAutoreleasedReturnValue(+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", v6));
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v7;

  }
  return v3;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

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
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)p_fireworksSystemsForTR:(id)a3 build:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
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
  double v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  TSDMetalShader *metalFireworksShader;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v62;
  unint64_t v63;
  id v64;
  id v65;

  v65 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "randomGenerator"));
  objc_msgSend(v8, "duration");
  v12 = v11;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworksCount"));
  v14 = v12 * v13;
  if ((unint64_t)v14 <= 2)
    v15 = 2;
  else
    v15 = (unint64_t)v14;
  v64 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v15));
  v63 = v15;
  objc_msgSend(v10, "doubleBetween::", 0.0, (double)(v15 - 1));
  v16 = 0;
  v62 = (unint64_t)v17;
  while (1)
  {
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v19 = v18;
    v21 = v20;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleCount"));
    v23 = v22;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkSizeMin"));
    v25 = v24;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkSizeMax"));
    objc_msgSend(v10, "doubleBetween::", v25, v26);
    v28 = v27;
    objc_msgSend(v9, "duration");
    v30 = v29;
    v31 = objc_msgSend(v9, "direction");
    metalFireworksShader = self->_metalFireworksShader;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metalContext"));
    v34 = +[KNBuildFireworksSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildFireworksSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v31, v10, metalFireworksShader, v33, 1.0, 1.0, (double)(unint64_t)v23, 1.0, self->_drawableFrame.size.width, self->_drawableFrame.size.height, v19, v21, v30);

    -[TSDTexturedRectangle size](self->_particleTR, "size");
    if (!v34)
      break;
    v37 = v35;
    v38 = v36;
    if (v19 >= v21)
      v39 = v21;
    else
      v39 = v19;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleSizeMin"));
    v41 = v40;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleSizeMax"));
    objc_msgSend(v34, "setRandomParticleSizeMinMax:", TSDMultiplySizeScalar(v41, v42, v39 / 100.0));
    objc_msgSend(v34, "setMaxDistance:", v39 * v28);
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleColorRandomness"));
    objc_msgSend(v34, "setColorRandomness:");
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleLifeSpanMinDuration"));
    objc_msgSend(v34, "setLifeSpanMinDuration:");
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkSpeedMin"));
    v44 = v43;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkSpeedMax"));
    objc_msgSend(v34, "setRandomParticleSpeedMinMax:", v44, v45);
    if ((v16 & 1) != 0)
    {
      v46 = 0.5;
      v47 = 1.0;
    }
    else
    {
      v46 = 0.0;
      v47 = 0.5;
    }
    objc_msgSend(v10, "doubleBetween::", v46, v47);
    objc_msgSend(v34, "setFireworkStartingPositionX:");
    if (!v16)
    {
      v48 = 0.0;
      goto LABEL_16;
    }
    if (v16 == 1)
    {
      v48 = 1.0;
LABEL_16:
      objc_msgSend(v34, "setFireworkStartingPositionX:", v48);
    }
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkDurationMin"));
    v50 = v49;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkDurationMax"));
    objc_msgSend(v10, "doubleBetween::", v50, v51);
    v53 = v52;
    objc_msgSend(v9, "duration");
    v55 = v53 / v54;
    objc_msgSend(v10, "doubleBetween::", 0.0, 1.0 - v55);
    HIDWORD(v57) = 0;
    if (v62 == v16)
      v56 = 0.0;
    if (v56 < 0.001)
      v56 = 0.001;
    *(float *)&v56 = v56;
    *(float *)&v57 = v55;
    objc_msgSend(v34, "setLifeSpan:", v56, v57);
    objc_msgSend(v34, "setupWithTexture:particleTextureSize:reverseDrawOrder:", v65, 0, v37, v38);
    objc_msgSend(v64, "addObject:", v34);

    if (v63 == ++v16)
      goto LABEL_24;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFireworks p_fireworksSystemsForTR:build:context:]"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFireworks.m"));
  objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, v60, 298, CFSTR("invalid nil value for '%s'"), "particleSystem");

LABEL_24:
  return v64;
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildFireworks metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildFireworks metalAnimationDidEndWithContext:](self, "metalAnimationDidEndWithContext:", v4);
  -[KNBuildFireworks metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", v4);

}

- (void)teardown
{
  -[KNBuildFireworks metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", 0);
}

- (id)p_particleTexturedRectWithPath:(id)a3
{
  const __CFData *v3;
  CGDataProvider *v4;
  CGImage *v5;
  id v6;

  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", a3));
  v4 = CGDataProviderCreateWithCFData(v3);

  v5 = CGImageCreateWithPNGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v4);
  v6 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v5);
  CGImageRelease(v5);
  return v6;
}

- (void)p_setupParticleTexturedRectsWithMetalContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  TSDTexturedRectangle *v7;
  TSDTexturedRectangle *particleTR;
  TSDTexturedRectangle *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  TSDTexturedRectangle *v14;
  TSDTexturedRectangle *centerBurstTR;
  TSDTexturedRectangle *v16;
  void *v17;
  id v18;

  if (!self->_particleTR)
  {
    v4 = a3;
    v5 = KNBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", CFSTR("KNBuildFireworks"), CFSTR("png")));

    v7 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworks p_particleTexturedRectWithPath:](self, "p_particleTexturedRectWithPath:", v18));
    particleTR = self->_particleTR;
    self->_particleTR = v7;

    v9 = self->_particleTR;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
    -[TSDTexturedRectangle setupMetalTextureForDevice:](v9, "setupMetalTextureForDevice:", v10);

    v11 = KNBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathForResource:ofType:", CFSTR("KNBuildFireworks_CenterBurst"), CFSTR("png")));

    v14 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworks p_particleTexturedRectWithPath:](self, "p_particleTexturedRectWithPath:", v13));
    centerBurstTR = self->_centerBurstTR;
    self->_centerBurstTR = v14;

    v16 = self->_centerBurstTR;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

    -[TSDTexturedRectangle setupMetalTextureForDevice:](v16, "setupMetalTextureForDevice:", v17);
  }
}

- (void)p_setupShadersWithMetalContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  TSDMetalShader *v7;
  TSDMetalShader *metalObjectShader;
  TSDMetalShader *v9;
  TSDMetalShader *metalFireworksShader;
  TSDMetalShader *v11;
  TSDMetalShader *metalTrailsShader;
  TSDMetalShader *v13;
  TSDMetalShader *metalFBOShader;
  TSDMetalShader *v15;
  TSDMetalShader *metalCenterBurstShader;
  id v17;

  v4 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v6 = objc_msgSend(v4, "pixelFormat");

  objc_msgSend(v5, "setPixelFormat:", v6);
  objc_msgSend(v5, "setBlendingEnabled:", 1);
  objc_msgSend(v5, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v5, "setDestinationAlphaBlendFactor:", 5);
  v7 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v17, v5);
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v7;

  v9 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildFireworksParticlesVertexShader"), CFSTR("buildFireworksParticlesFragmentShader"), v17, CFSTR("KeynoteMetalLibrary"), v5);
  metalFireworksShader = self->_metalFireworksShader;
  self->_metalFireworksShader = v9;

  objc_msgSend(v5, "setDestinationRGBBlendFactor:", 0);
  objc_msgSend(v5, "setDestinationAlphaBlendFactor:", 0);
  v11 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initQuadTextureShaderWithFragmentShader:device:library:colorAttachment:", CFSTR("buildFireworksTrailsFragmentShader"), v17, CFSTR("KeynoteMetalLibrary"), v5);
  metalTrailsShader = self->_metalTrailsShader;
  self->_metalTrailsShader = v11;

  objc_msgSend(v5, "setSourceRGBBlendFactor:", 4);
  objc_msgSend(v5, "setSourceAlphaBlendFactor:", 4);
  v13 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initQuadTextureShaderWithFragmentShader:device:library:colorAttachment:", CFSTR("buildFireworksTrailsFragmentShader"), v17, CFSTR("KeynoteMetalLibrary"), v5);
  metalFBOShader = self->_metalFBOShader;
  self->_metalFBOShader = v13;

  objc_msgSend(v5, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v5, "setDestinationAlphaBlendFactor:", 5);
  v15 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v17, v5);
  metalCenterBurstShader = self->_metalCenterBurstShader;
  self->_metalCenterBurstShader = v15;

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
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  NSArray *v29;
  NSArray *fireworksSystems;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  TSDMTLDataBuffer *v36;
  TSDMTLDataBuffer *metalObjectDataBuffer;
  uint64_t v38;
  TSDMTLDataBuffer *v39;
  TSDMTLDataBuffer *metalFBODataBuffer;
  double v41;
  double v42;
  double v43;
  TSDMTLDataBuffer *v44;
  TSDMTLDataBuffer *metalCenterBurstDataBuffer;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  double v52;
  double v53;
  double MinX;
  double v55;
  double v56;
  double MaxY;
  KNAnimationContext *mAnimationContext;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  CATransform3D v62;
  CATransform3D v63;
  CATransform3D v64;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFireworks metalPrepareAnimationWithContext:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFireworks.m"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 443, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
  objc_msgSend(v4, "drawableFrame");
  self->_drawableFrame.origin.x = v13;
  self->_drawableFrame.origin.y = v14;
  self->_drawableFrame.size.width = v15;
  self->_drawableFrame.size.height = v16;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_frameRect.origin.x = v17;
  self->_frameRect.origin.y = v18;
  self->_frameRect.size.width = v19;
  self->_frameRect.size.height = v20;
  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", v4);
  v21 = *(_OWORD *)&v64.m33;
  *(_OWORD *)&self->_baseTransform.m31 = *(_OWORD *)&v64.m31;
  *(_OWORD *)&self->_baseTransform.m33 = v21;
  v22 = *(_OWORD *)&v64.m43;
  *(_OWORD *)&self->_baseTransform.m41 = *(_OWORD *)&v64.m41;
  *(_OWORD *)&self->_baseTransform.m43 = v22;
  v23 = *(_OWORD *)&v64.m13;
  *(_OWORD *)&self->_baseTransform.m11 = *(_OWORD *)&v64.m11;
  *(_OWORD *)&self->_baseTransform.m13 = v23;
  v24 = *(_OWORD *)&v64.m23;
  *(_OWORD *)&self->_baseTransform.m21 = *(_OWORD *)&v64.m21;
  *(_OWORD *)&self->_baseTransform.m23 = v24;
  TSDTransform3DMakeOrtho(0.0, self->_frameRect.size.width, 0.0, self->_frameRect.size.height, -1.0, 1.0);
  v25 = *(_OWORD *)&v64.m33;
  *(_OWORD *)&self->_baseOrthoTransform.m31 = *(_OWORD *)&v64.m31;
  *(_OWORD *)&self->_baseOrthoTransform.m33 = v25;
  v26 = *(_OWORD *)&v64.m43;
  *(_OWORD *)&self->_baseOrthoTransform.m41 = *(_OWORD *)&v64.m41;
  *(_OWORD *)&self->_baseOrthoTransform.m43 = v26;
  v27 = *(_OWORD *)&v64.m13;
  *(_OWORD *)&self->_baseOrthoTransform.m11 = *(_OWORD *)&v64.m11;
  *(_OWORD *)&self->_baseOrthoTransform.m13 = v27;
  v28 = *(_OWORD *)&v64.m23;
  *(_OWORD *)&self->_baseOrthoTransform.m21 = *(_OWORD *)&v64.m21;
  *(_OWORD *)&self->_baseOrthoTransform.m23 = v28;
  -[KNBuildFireworks p_setupParticleTexturedRectsWithMetalContext:](self, "p_setupParticleTexturedRectsWithMetalContext:", v7);
  -[KNBuildFireworks p_setupShadersWithMetalContext:](self, "p_setupShadersWithMetalContext:", v7);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue(-[KNBuildFireworks p_fireworksSystemsForTR:build:context:](self, "p_fireworksSystemsForTR:build:context:", v11, v6, v4));
  fireworksSystems = self->_fireworksSystems;
  self->_fireworksSystems = v29;

  v31 = TSDRectWithSize(objc_msgSend(v11, "frame"));
  v32 = TSDRectUnit[0];
  v33 = TSDRectUnit[1];
  v34 = TSDRectUnit[2];
  v35 = TSDRectUnit[3];
  v36 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12, v31);
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v36;

  v39 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12, TSDRectWithSize(v38));
  metalFBODataBuffer = self->_metalFBODataBuffer;
  self->_metalFBODataBuffer = v39;

  -[TSDTexturedRectangle size](self->_centerBurstTR, "size");
  v42 = v41;
  -[TSDTexturedRectangle size](self->_centerBurstTR, "size");
  v44 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v12, 0.0, 0.0, v42, v43, v32, v33, v34, v35);
  metalCenterBurstDataBuffer = self->_metalCenterBurstDataBuffer;
  self->_metalCenterBurstDataBuffer = v44;

  v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  v47 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  v48 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_230 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  *(float32x4_t *)&self->_anon_230[16] = v46;
  *(float32x4_t *)&self->_anon_230[32] = v47;
  *(float32x4_t *)&self->_anon_230[48] = v48;
  v49 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m21), *(float64x2_t *)&self->_baseOrthoTransform.m23);
  v50 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m31), *(float64x2_t *)&self->_baseOrthoTransform.m33);
  v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m41), *(float64x2_t *)&self->_baseOrthoTransform.m43);
  *(float32x4_t *)self->_anon_1f0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseOrthoTransform.m11), *(float64x2_t *)&self->_baseOrthoTransform.m13);
  *(float32x4_t *)&self->_anon_1f0[16] = v49;
  *(float32x4_t *)&self->_anon_1f0[32] = v50;
  *(float32x4_t *)&self->_anon_1f0[48] = v51;
  objc_msgSend(v11, "frameOnCanvas");
  v53 = v52;
  MinX = CGRectGetMinX(self->_frameRect);
  objc_msgSend(v11, "frameOnCanvas");
  v56 = v55;
  MaxY = CGRectGetMaxY(self->_frameRect);
  memset(&v64, 0, sizeof(v64));
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  v62 = v64;
  CATransform3DTranslate(&v63, &v62, v53 - MinX, -(v56 - MaxY), 0.0);
  v64 = v63;
  v59 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v63.m21), *(float64x2_t *)&v63.m23);
  v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v63.m31), *(float64x2_t *)&v63.m33);
  v61 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v63.m41), *(float64x2_t *)&v63.m43);
  *(float32x4_t *)&self->_particlesVertexUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v63.m11), *(float64x2_t *)&v63.m13);
  *(float32x4_t *)&self->_particlesVertexUniforms.ShouldSparkle = v59;
  *(float32x4_t *)&self->_particlesVertexUniforms.SpeedMax = v60;
  *(float32x4_t *)&self->_anon_194[12] = v61;

}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4;
  TSDMetalRenderTarget *v5;
  TSDMetalRenderTarget *frameRenderTarget;
  TSDMetalRenderTarget *v7;
  TSDMetalRenderTarget *bloomRenderTarget;
  id v9;
  double v10;
  TSDMetalBloomEffect *v11;
  TSDMetalBloomEffect *metalBloomEffect;
  id v13;

  v4 = a3;
  -[KNBuildFireworks frameOfEffectWithContext:](self, "frameOfEffectWithContext:", v4);
  -[KNBuildFireworks metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));

  v5 = (TSDMetalRenderTarget *)objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v13, self->_frameRect.size.width, self->_frameRect.size.height);
  frameRenderTarget = self->_frameRenderTarget;
  self->_frameRenderTarget = v5;

  v7 = (TSDMetalRenderTarget *)objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v13, self->_frameRect.size.width, self->_frameRect.size.height);
  bloomRenderTarget = self->_bloomRenderTarget;
  self->_bloomRenderTarget = v7;

  v9 = objc_alloc((Class)TSDMetalBloomEffect);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("BloomBlurScale"));
  v11 = (TSDMetalBloomEffect *)objc_msgSend(v9, "initWithEffectSize:blurScale:metalContext:", v13, self->_frameRect.size.width, self->_frameRect.size.height, v10);
  metalBloomEffect = self->_metalBloomEffect;
  self->_metalBloomEffect = v11;

  self->_previousPercent = 0.0;
}

- (void)p_drawObject:(id)a3 percent:(double)a4 encoder:(id)a5
{
  KNAnimParameterGroup *parameterGroup;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;

  parameterGroup = self->_parameterGroup;
  v9 = a5;
  v10 = a3;
  -[KNAnimParameterGroup valueForConstant:](parameterGroup, "valueForConstant:", CFSTR("TextOpacityBeginTime"));
  v12 = v11;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("TextOpacityEndTime"));
  v14 = TSUClamp((a4 - v12) / (v13 - v12), 0.0, 1.0);
  objc_msgSend(v10, "singleTextureOpacity");
  v16 = v15;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("TextOpacityTiming"), v14);
  *(float *)&v17 = v16 * v17;
  v19 = LODWORD(v17);
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v9, self->_anon_230, &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metalTexture"));

  objc_msgSend(v9, "setFragmentTexture:atIndex:", v18, 0);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalObjectDataBuffer, "drawWithEncoder:atIndex:", v9, -[TSDMetalShader bufferIndex](self->_metalObjectShader, "bufferIndex"));

}

- (void)p_drawParticleSystemsWithPercent:(double)a3 sparkles:(BOOL)a4 particleSystemOpacity:(double)a5 context:(id)a6 renderEncoder:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *i;
  void *v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSArray *obj;
  uint64_t v53;
  CATransform3D v54;
  CATransform3D v55;
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v9 = a4;
  v12 = a6;
  v13 = a7;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "randomGenerator"));
  *(float *)&self->_anon_194[44] = (float)v9;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = self->_fireworksSystems;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v14)
  {
    v15 = v14;
    v50 = v12;
    v53 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v53)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "lifeSpan");
        v19 = v18;
        v21 = v20;
        v22 = (a3 - v18) / v20;
        if ((objc_msgSend(v12, "isWarmingUp") & 1) == 0 && (v22 <= 0.0 || v22 > 1.0))
          continue;
        v24 = TSUClamp(v22, 0.0, 1.0);
        v25 = TSUClamp((self->_previousPercent - v19) / v21, v24 * 0.5, 1.0);
        v26 = a5;
        if (v9)
        {
          -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleTransparency"), v24);
          v26 = 1.0 - v27;
        }
        -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleBurstTiming"), v24);
        *(float *)&v28 = v28;
        *(_DWORD *)&self->_anon_194[52] = LODWORD(v28);
        -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleBurstTiming"), v25);
        *(float *)&v29 = v29;
        *(_DWORD *)&self->_anon_194[56] = LODWORD(v29);
        *(float *)&v29 = v25;
        *(_DWORD *)&self->_anon_194[32] = LODWORD(v29);
        objc_msgSend(v17, "speedMax");
        *(float *)&v30 = v30;
        *(_DWORD *)&self->_anon_194[60] = LODWORD(v30);
        *(float *)&v30 = v24;
        *(_DWORD *)&self->_anon_194[28] = LODWORD(v30);
        *(float *)&v30 = v26;
        v56 = LODWORD(v30);
        if ((objc_msgSend(v12, "isWarmingUp") | !v9) == 1
          && (objc_msgSend(v17, "didDrawCenterBurst") & 1) == 0)
        {
          -[TSDTexturedRectangle size](self->_centerBurstTR, "size");
          v32 = v31;
          v34 = v33;
          v35 = self->_frameRect.size.height / v33;
          -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("CenterBurstScaleMin"));
          v37 = v36;
          -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("CenterBurstScaleMax"));
          objc_msgSend(v51, "doubleBetween::", v37, v38);
          v40 = v35 * v39;
          objc_msgSend(v17, "startingPoint");
          v41 = *(_OWORD *)&self->_baseTransform.m13;
          *(_OWORD *)&v54.m11 = *(_OWORD *)&self->_baseTransform.m11;
          *(_OWORD *)&v54.m13 = v41;
          v42 = *(_OWORD *)&self->_baseTransform.m23;
          *(_OWORD *)&v54.m21 = *(_OWORD *)&self->_baseTransform.m21;
          *(_OWORD *)&v54.m23 = v42;
          v43 = *(_OWORD *)&self->_baseTransform.m33;
          *(_OWORD *)&v54.m31 = *(_OWORD *)&self->_baseTransform.m31;
          *(_OWORD *)&v54.m33 = v43;
          v44 = *(_OWORD *)&self->_baseTransform.m43;
          *(_OWORD *)&v54.m41 = *(_OWORD *)&self->_baseTransform.m41;
          *(_OWORD *)&v54.m43 = v44;
          CATransform3DTranslate(&v55, &v54, v45, v46, 0.0);
          v54 = v55;
          CATransform3DTranslate(&v55, &v54, v32 * -0.5 * v40, v34 * -0.5 * v40, 0.0);
          v54 = v55;
          CATransform3DScale(&v55, &v54, v40, v40, 1.0);
          *(float32x4_t *)&v55.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m11), *(float64x2_t *)&v55.m13);
          *(float32x4_t *)&v55.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m21), *(float64x2_t *)&v55.m23);
          *(float32x4_t *)&v55.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m31), *(float64x2_t *)&v55.m33);
          *(float32x4_t *)&v55.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v55.m41), *(float64x2_t *)&v55.m43);
          LODWORD(v54.m11) = 0;
          -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("CenterBurstOpacity"));
          *(float *)&v47 = v47;
          LODWORD(v54.m11) = LODWORD(v47);
          -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalCenterBurstShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v13, &v55, &v54);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_centerBurstTR, "metalTexture"));
          objc_msgSend(v13, "setFragmentTexture:atIndex:", v48, 0);

          v12 = v50;
          -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalCenterBurstDataBuffer, "drawWithEncoder:atIndex:", v13, -[TSDMetalShader bufferIndex](self->_metalCenterBurstShader, "bufferIndex"));
          objc_msgSend(v17, "setDidDrawCenterBurst:", 1);
        }
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalFireworksShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v13, &self->_particlesVertexUniforms, &v56);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_particleTR, "metalTexture"));
        objc_msgSend(v13, "setFragmentTexture:atIndex:", v49, 0);

        objc_msgSend(v17, "drawMetalWithEncoder:", v13);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v15);
  }

}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  float64x2_t v42;
  float64_t v43;
  float32x2_t v44;
  float v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  TSDMetalBloomEffect *metalBloomEffect;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float64_t v64;
  void *v65;
  void *v66;
  void *v67;
  _OWORD v68[9];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandBuffer"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderEncoder"));

  if ((objc_msgSend(v4, "isWarmingUp") & 1) != 0)
  {
    v9 = 2;
  }
  else if (self->_previousPercent == 0.0)
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  -[TSDMetalRenderTarget setTextureLoadAction:](self->_frameRenderTarget, "setTextureLoadAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget passDescriptor](self->_frameRenderTarget, "passDescriptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v10));

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  objc_msgSend(v4, "percent");
  v13 = v12;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v15 = v14;
  v17 = v16;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleTrailsDitherAmount"));
  v19 = v18;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleTrailsDitherMax"));
  v21 = v20;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("BloomPower"));
  v23 = v22;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Gravity"));
  if (v15 >= v17)
    v15 = v17;
  v25 = v15 * 0.001 * v24;
  objc_msgSend(v4, "duration");
  v27 = v25 * v26;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("ParticleSizeStart"));
  v29 = v27;
  *(float *)&v28 = v15 * v28 / 100.0;
  *(float *)&self->_anon_194[36] = v29;
  *(_DWORD *)&self->_anon_194[40] = LODWORD(v28);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("SparklePeriod"));
  *(float *)&v30 = v30;
  *(_DWORD *)&self->_anon_194[48] = LODWORD(v30);
  if (self->_previousPercent > 0.0)
  {
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkDurationMin"));
    v32 = v31;
    objc_msgSend(v4, "duration");
    v34 = fmin(v32 / v33 * 0.5, 1.0);
    v35 = TSUClamp((v13 - v34) / (1.0 - v34), 0.0, 1.0);
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("TrailsFadeOutMin"));
    v37 = v36;
    v38 = -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("TrailsFadeOutMax"));
    v40 = 1.0 - TSDMixFloats(v38, v37, v39, v35 * v35);
    objc_msgSend(v67, "randomDouble");
    v64 = v41;
    objc_msgSend(v67, "randomDouble");
    v42.f64[0] = v64;
    v42.f64[1] = v43;
    v44 = vcvt_f32_f64(v42);
    *(float *)v42.f64 = v40;
    v45 = v19;
    self->_fboFragmentUniforms.Opacity = *(float *)v42.f64;
    self->_fboFragmentUniforms.NoiseAmount = v45;
    *(float *)v42.f64 = v21;
    *(_DWORD *)&self->_anon_2b8[8] = LODWORD(v42.f64[0]);
    *(float32x2_t *)self->_anon_2b8 = v44;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalTrailsShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v11, self->_anon_1f0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_frameRenderTarget, "texture"));
    objc_msgSend(v11, "setFragmentTexture:atIndex:", v46, 0);

    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalFBODataBuffer, "drawWithEncoder:atIndex:", v11, -[TSDMetalShader bufferIndex](self->_metalTrailsShader, "bufferIndex"));
  }
  -[KNBuildFireworks p_drawParticleSystemsWithPercent:sparkles:particleSystemOpacity:context:renderEncoder:](self, "p_drawParticleSystemsWithPercent:sparkles:particleSystemOpacity:context:renderEncoder:", 0, v4, v11, v13, 1.0);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("FireworkDurationMax"));
  v48 = v47;
  objc_msgSend(v4, "duration");
  v50 = fmin(v48 / v49, 0.999);
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("ParticleTransparency"), TSUClamp((v13 - v50) / (1.0 - v50), 0.0, 1.0));
  v52 = 1.0 - v51;
  *(float *)&v51 = 1.0 - v51;
  self->_fboFragmentUniforms.Opacity = *(float *)&v51;
  self->_fboFragmentUniforms.NoiseAmount = 0.0;
  objc_msgSend(v11, "endEncoding");
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget passDescriptor](self->_bloomRenderTarget, "passDescriptor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v53));

  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalFBOShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v54, self->_anon_1f0, &self->_fboFragmentUniforms);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_frameRenderTarget, "texture"));
  objc_msgSend(v54, "setFragmentTexture:atIndex:", v55, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalFBODataBuffer, "drawWithEncoder:atIndex:", v54, -[TSDMetalShader bufferIndex](self->_metalFBOShader, "bufferIndex"));
  -[KNBuildFireworks p_drawParticleSystemsWithPercent:sparkles:particleSystemOpacity:context:renderEncoder:](self, "p_drawParticleSystemsWithPercent:sparkles:particleSystemOpacity:context:renderEncoder:", 1, v4, v54, v13, v52);
  objc_msgSend(v54, "endEncoding");
  objc_msgSend(v7, "commit");
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", 0));
  -[KNBuildFireworks p_drawObject:percent:encoder:](self, "p_drawObject:percent:encoder:", v56, v66, v13);

  metalBloomEffect = self->_metalBloomEffect;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_bloomRenderTarget, "texture"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v60 = *(_OWORD *)&self->_baseOrthoTransform.m33;
  v68[4] = *(_OWORD *)&self->_baseOrthoTransform.m31;
  v68[5] = v60;
  v61 = *(_OWORD *)&self->_baseOrthoTransform.m43;
  v68[6] = *(_OWORD *)&self->_baseOrthoTransform.m41;
  v68[7] = v61;
  v62 = *(_OWORD *)&self->_baseOrthoTransform.m13;
  v68[0] = *(_OWORD *)&self->_baseOrthoTransform.m11;
  v68[1] = v62;
  v63 = *(_OWORD *)&self->_baseOrthoTransform.m23;
  v68[2] = *(_OWORD *)&self->_baseOrthoTransform.m21;
  v68[3] = v63;
  -[TSDMetalBloomEffect drawBloomEffectWithTexture:metalContext:encoder:MVPMatrix:bloomAmount:](metalBloomEffect, "drawBloomEffectWithTexture:metalContext:encoder:MVPMatrix:bloomAmount:", v58, v59, v66, v68, v23);

  self->_previousPercent = v13;
}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  TSDMetalRenderTarget *frameRenderTarget;
  TSDMetalRenderTarget *bloomRenderTarget;
  TSDMetalBloomEffect *metalBloomEffect;

  frameRenderTarget = self->_frameRenderTarget;
  self->_frameRenderTarget = 0;

  bloomRenderTarget = self->_bloomRenderTarget;
  self->_bloomRenderTarget = 0;

  -[TSDMetalBloomEffect teardown](self->_metalBloomEffect, "teardown");
  metalBloomEffect = self->_metalBloomEffect;
  self->_metalBloomEffect = 0;

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalFireworksShader;
  TSDMetalShader *metalObjectShader;
  TSDMetalShader *metalCenterBurstShader;
  TSDMTLDataBuffer *metalCenterBurstDataBuffer;
  TSDMetalShader *metalFBOShader;
  TSDMTLDataBuffer *metalFBODataBuffer;

  metalFireworksShader = self->_metalFireworksShader;
  self->_metalFireworksShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalCenterBurstShader = self->_metalCenterBurstShader;
  self->_metalCenterBurstShader = 0;

  metalCenterBurstDataBuffer = self->_metalCenterBurstDataBuffer;
  self->_metalCenterBurstDataBuffer = 0;

  -[TSDTexturedRectangle teardown](self->_centerBurstTR, "teardown");
  -[TSDTexturedRectangle teardown](self->_particleTR, "teardown");
  metalFBOShader = self->_metalFBOShader;
  self->_metalFBOShader = 0;

  metalFBODataBuffer = self->_metalFBODataBuffer;
  self->_metalFBODataBuffer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBloomEffect, 0);
  objc_storeStrong((id *)&self->_bloomRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFBOShader, 0);
  objc_storeStrong((id *)&self->_metalTrailsShader, 0);
  objc_storeStrong((id *)&self->_frameRenderTarget, 0);
  objc_storeStrong((id *)&self->_particleTR, 0);
  objc_storeStrong((id *)&self->_centerBurstTR, 0);
  objc_storeStrong((id *)&self->_metalCenterBurstDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalCenterBurstShader, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalFireworksShader, 0);
  objc_storeStrong((id *)&self->_fireworksSystems, 0);
  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end
