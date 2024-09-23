@implementation KNShimmerEffect

- (void)setupEffectIfNecessary
{
  if (self->_metalContext)
    -[KNShimmerEffect setupMetalEffectIfNecessary](self, "setupMetalEffectIfNecessary");
}

- (void)setupMetalEffectIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFData *v7;
  CGDataProvider *v8;
  CGImage *v9;
  TSDTexturedRectangle *v10;
  TSDTexturedRectangle *shimmerTexturedRect;
  TSDTexturedRectangle *v12;
  void *v13;
  id v14;
  TSDMetalShader *v15;
  TSDMetalShader *objectSystemMetalShader;
  TSDTexturedRectangle *texture;
  KNShimmerObjectSystem *v18;
  KNShimmerObjectSystem *objectSystem;
  KNShimmerObjectSystem *v20;
  TSDMetalShader *v21;
  TSDMetalShader *particleSystemMetalShader;
  TSDTexturedRectangle *v23;
  KNShimmerParticleSystem *v24;
  KNShimmerParticleSystem *particleSystem;
  KNShimmerParticleSystem *v26;
  TSDMetalShader *v27;
  TSDMetalShader *objectMetalShader;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  TSDMTLDataBuffer *v32;
  TSDMTLDataBuffer *objectMTLDataBuffer;
  float32x4_t v34;
  __int128 v35;
  float32x4_t v36;
  __int128 v37;
  float32x4_t v38;
  __int128 v39;
  float32x4_t v40;
  __int128 v41;
  _OWORD v42[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[9];
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;

  if (!self->_isSetup)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalContext device](self->_metalContext, "device"));
    v4 = KNBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("KNBuildShimmer"), CFSTR("png")));

    v7 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6));
    v8 = CGDataProviderCreateWithCFData(v7);

    v9 = CGImageCreateWithPNGDataProvider(v8, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v8);
    v10 = (TSDTexturedRectangle *)objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v9);
    shimmerTexturedRect = self->_shimmerTexturedRect;
    self->_shimmerTexturedRect = v10;

    v12 = self->_shimmerTexturedRect;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalContext device](self->_metalContext, "device"));
    -[TSDTexturedRectangle setupMetalTextureForDevice:](v12, "setupMetalTextureForDevice:", v13);

    CGImageRelease(v9);
    v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m11), *(float64x2_t *)&self->_translate.m13);
    v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m21), *(float64x2_t *)&self->_translate.m23);
    v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m31), *(float64x2_t *)&self->_translate.m33);
    v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_translate.m41), *(float64x2_t *)&self->_translate.m43);
    v14 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v14, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v14, "setBlendingEnabled:", 1);
    objc_msgSend(v14, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v14, "setDestinationAlphaBlendFactor:", 5);
    v15 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildShimmerObjectVertexShader"), CFSTR("buildShimmerFragmentShader"), v3, CFSTR("KeynoteMetalLibrary"), v14);
    objectSystemMetalShader = self->_objectSystemMetalShader;
    self->_objectSystemMetalShader = v15;

    texture = self->_texture;
    -[KNAnimationContext slideRect](self->_animationContext, "slideRect");
    v18 = (KNShimmerObjectSystem *)objc_claimAutoreleasedReturnValue(-[KNShimmerEffect objectSystemForTR:slideRect:duration:](self, "objectSystemForTR:slideRect:duration:", texture));
    objectSystem = self->_objectSystem;
    self->_objectSystem = v18;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v60 = 0u;
    v20 = self->_objectSystem;
    if (v20)
    {
      -[KNShimmerObjectSystem vertexUniforms](v20, "vertexUniforms");
      v20 = self->_objectSystem;
    }
    else
    {
      v67 = 0uLL;
      v68 = 0uLL;
      v65 = 0uLL;
      v66 = 0uLL;
      v64 = 0uLL;
    }
    v60 = v40;
    v61 = v38;
    v62 = v36;
    v63 = v34;
    v59[6] = v66;
    v59[7] = v67;
    v59[8] = v68;
    v59[4] = v64;
    v59[5] = v65;
    v59[2] = v36;
    v59[3] = v34;
    v59[0] = v40;
    v59[1] = v38;
    -[KNShimmerObjectSystem setVertexUniforms:](v20, "setVertexUniforms:", v59, *(_OWORD *)&v34, *(_OWORD *)&v36, *(_OWORD *)&v38, *(_OWORD *)&v40);
    if (-[KNShimmerObjectSystem shouldDraw](self->_objectSystem, "shouldDraw"))
    {
      v21 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildShimmerParticleVertexShader"), CFSTR("buildShimmerFragmentShader"), v3, CFSTR("KeynoteMetalLibrary"), v14);
      particleSystemMetalShader = self->_particleSystemMetalShader;
      self->_particleSystemMetalShader = v21;

      v23 = self->_texture;
      -[KNAnimationContext slideRect](self->_animationContext, "slideRect");
      v24 = (KNShimmerParticleSystem *)objc_claimAutoreleasedReturnValue(-[KNShimmerEffect particleSystemForTR:slideRect:duration:](self, "particleSystemForTR:slideRect:duration:", v23));
      particleSystem = self->_particleSystem;
      self->_particleSystem = v24;

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v26 = self->_particleSystem;
      if (v26)
      {
        -[KNShimmerParticleSystem vertexUniforms](v26, "vertexUniforms");
        v26 = self->_particleSystem;
      }
      else
      {
        v57 = 0uLL;
        v58 = 0uLL;
        v55 = 0uLL;
        v56 = 0uLL;
        v53 = 0uLL;
        v54 = 0uLL;
        v51 = 0uLL;
        v52 = 0uLL;
        v49 = 0uLL;
        v50 = 0uLL;
        v47 = 0uLL;
        v48 = 0uLL;
      }
      v43 = v41;
      v44 = v39;
      v45 = v37;
      v46 = v35;
      BYTE4(v51) = 0;
      v42[12] = v55;
      v42[13] = v56;
      v42[14] = v57;
      v42[15] = v58;
      v42[10] = v53;
      v42[11] = v54;
      v42[4] = v47;
      v42[5] = v48;
      v42[6] = v49;
      v42[7] = v50;
      v42[8] = v51;
      v42[9] = v52;
      v42[0] = v41;
      v42[1] = v39;
      v42[2] = v37;
      v42[3] = v35;
      -[KNShimmerParticleSystem setVertexUniforms:](v26, "setVertexUniforms:", v42);
    }
    v27 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v3, v14);
    objectMetalShader = self->_objectMetalShader;
    self->_objectMetalShader = v27;

    v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
    v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
    v31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
    *(float32x4_t *)self->_anon_190 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
    *(float32x4_t *)&self->_anon_190[16] = v29;
    *(float32x4_t *)&self->_anon_190[32] = v30;
    *(float32x4_t *)&self->_anon_190[48] = v31;
    -[TSDTexturedRectangle frame](self->_texture, "frame");
    v32 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v3, CGPointZero.x, CGPointZero.y);
    objectMTLDataBuffer = self->_objectMTLDataBuffer;
    self->_objectMTLDataBuffer = v32;

    self->_isSetup = 1;
  }
}

- (unint64_t)p_numberOfParticlesForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double width;
  double height;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  width = self->_destinationRect.size.width;
  height = self->_destinationRect.size.height;
  v7 = width / a4.size.width * height / a4.size.height;
  v8 = a3;
  objc_msgSend(v8, "size");
  v10 = v9 / width;
  objc_msgSend(v8, "size");
  v12 = v11;

  return (unint64_t)fmin(v7 * (v10 * v12 / height) * 2000.0, 3276.0);
}

- (id)objectSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t direction;
  void *v19;
  id v20;
  void *v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = -[KNShimmerEffect p_numberOfParticlesForTR:slideRect:duration:](self, "p_numberOfParticlesForTR:slideRect:duration:", v11, x, y, width, height, a5);
  if (self->_metalContext)
  {
    v13 = v12;
    objc_msgSend(v11, "size");
    v15 = v14;
    v17 = v16;
    direction = self->_direction;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerEffect randomGenerator](self, "randomGenerator"));
    v20 = +[KNShimmerObjectSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNShimmerObjectSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v13, direction, v19, self->_objectSystemMetalShader, self->_metalContext, v15, v17, width, height, a5);

  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationContext capabilities](self->_animationContext, "capabilities"));
  objc_msgSend(v20, "setupWithTexture:particleTextureSize:reverseDrawOrder:capabilities:", v11, 0, v21, CGSizeZero.width, CGSizeZero.height);

  return v20;
}

- (id)particleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
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
  id v27;
  KNShimmerObjectSystem *objectSystem;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  TSDTexturedRectangle *shimmerTexturedRect;
  double v41;
  double v42;
  id v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = -[KNShimmerEffect p_numberOfParticlesForTR:slideRect:duration:](self, "p_numberOfParticlesForTR:slideRect:duration:", v11, x, y, width, height, a5);
  v13 = -[KNShimmerObjectSystem visibleParticleCount](self->_objectSystem, "visibleParticleCount");
  if (self->_metalContext)
  {
    v14 = v12 / 0x28;
    if (v12 / 0x28 <= 2)
      v14 = 2;
    v15 = v14 + 2 * (_QWORD)v13;
    if (v15 >= 0xCCC)
      v16 = 3276;
    else
      v16 = v15;
    -[KNShimmerObjectSystem particleSize](self->_objectSystem, "particleSize");
    v18 = v17;
    v20 = v19;
    v21 = (double)v16;
    objc_msgSend(v11, "size");
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerEffect randomGenerator](self, "randomGenerator"));
    v27 = +[KNShimmerParticleSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNShimmerParticleSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v26, self->_particleSystemMetalShader, self->_metalContext, v18, v20, v21, 1.0, v23, v25, width, height, *(_QWORD *)&a5);

  }
  else
  {
    v27 = 0;
  }
  objectSystem = self->_objectSystem;
  if (!objectSystem)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect particleSystemForTR:slideRect:duration:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 392, CFSTR("Need to set up object system first!"));

    objectSystem = self->_objectSystem;
  }
  objc_msgSend(v27, "setObjectSystem:", objectSystem);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "vertexAttributeNamed:", kTSDGPUShaderAttributeColor));
  objc_msgSend(v27, "setObjectDataBufferAttributeColor:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "vertexAttributeNamed:", kTSDGPUShaderAttributePosition));
  objc_msgSend(v27, "setObjectDataBufferAttributePosition:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "vertexAttributeNamed:", kTSDGPUShaderAttributeSpeed));
  objc_msgSend(v27, "setObjectDataBufferAttributeSpeed:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerObjectSystem dataBuffer](self->_objectSystem, "dataBuffer"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "vertexAttributeNamed:", kTSDGPUShaderAttributeColorTexCoord));
  objc_msgSend(v27, "setObjectDataBufferAttributeColorTexCoord:", v39);

  shimmerTexturedRect = self->_shimmerTexturedRect;
  if (shimmerTexturedRect)
  {
    -[TSDTexturedRectangle size](shimmerTexturedRect, "size");
  }
  else
  {
    v41 = CGSizeZero.width;
    v42 = CGSizeZero.height;
  }
  if (self->_metalContext)
    v43 = v11;
  else
    v43 = 0;
  objc_msgSend(v27, "setupWithTexture:particleTextureSize:reverseDrawOrder:", v43, 0, v41, v42);

  return v27;
}

- (KNShimmerEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDTexturedRectangle *v23;
  id v24;
  id v25;
  KNShimmerEffect *v26;
  KNShimmerEffect *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  objc_super v42;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v41 = a3;
  v23 = (TSDTexturedRectangle *)a4;
  v24 = a10;
  v25 = a11;
  v42.receiver = self;
  v42.super_class = (Class)KNShimmerEffect;
  v26 = -[KNShimmerEffect init](&v42, "init");
  v27 = v26;
  if (v26)
  {
    v26->_texture = v23;
    v26->_destinationRect.origin.x = x;
    v26->_destinationRect.origin.y = y;
    v26->_destinationRect.size.width = width;
    v26->_destinationRect.size.height = height;
    v26->_duration = a7;
    v26->_direction = a8;
    v26->_buildType = a9;
    v28 = *(_OWORD *)&a6->m11;
    v29 = *(_OWORD *)&a6->m13;
    v30 = *(_OWORD *)&a6->m23;
    *(_OWORD *)&v26->_translate.m21 = *(_OWORD *)&a6->m21;
    *(_OWORD *)&v26->_translate.m23 = v30;
    *(_OWORD *)&v26->_translate.m11 = v28;
    *(_OWORD *)&v26->_translate.m13 = v29;
    v31 = *(_OWORD *)&a6->m31;
    v32 = *(_OWORD *)&a6->m33;
    v33 = *(_OWORD *)&a6->m43;
    *(_OWORD *)&v26->_translate.m41 = *(_OWORD *)&a6->m41;
    *(_OWORD *)&v26->_translate.m43 = v33;
    *(_OWORD *)&v26->_translate.m31 = v31;
    *(_OWORD *)&v26->_translate.m33 = v32;
    objc_storeStrong((id *)&v26->_animationContext, a3);
    if (!v24)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 429, CFSTR("invalid nil value for '%s'"), "metalContext", v41);

    }
    objc_storeStrong((id *)&v27->_metalContext, a10);
    if (!v25)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 431, CFSTR("invalid nil value for '%s'"), "randomGenerator");

    }
    objc_storeStrong((id *)&v27->_randomGenerator, a11);
    -[KNShimmerEffect setupMetalEffectIfNecessary](v27, "setupMetalEffectIfNecessary");
  }

  return v27;
}

- (void)renderEffectAtPercent:(double)a3
{
  -[KNShimmerEffect p_renderEffectAtPercent:withContext:](self, "p_renderEffectAtPercent:withContext:", 0, a3);
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  -[KNShimmerEffect p_renderEffectAtPercent:withContext:](self, "p_renderEffectAtPercent:withContext:", a4, a3);
}

- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  TSDTexturedRectangle *v6;
  int buildType;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  KNShimmerParticleSystem *particleSystem;
  double v21;
  id v22;

  v22 = a4;
  v6 = self->_texture;
  buildType = self->_buildType;
  if (buildType == 2)
    v8 = 1.0 - a3;
  else
    v8 = a3;
  v9 = TSUReverseSquare(v8);
  if (buildType == 1)
    v10 = (v8 + v9 * self->_duration) * 1.57079633;
  else
    v10 = -((v8 + v9 * self->_duration) * 1.57079633);
  v11 = TSUClamp((v8 + -0.200000003) / 0.400000006, 0.0, 1.0);
  v12 = TSUSineMap(v11);
  -[TSDTexturedRectangle singleTextureOpacity](v6, "singleTextureOpacity");
  if (v22)
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTextureWithContext:](v6, "metalTextureWithContext:"));
    if (v15)
    {
      v16 = (1.0 - v8) * (1.0 - v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "renderEncoder"));
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_objectMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v17, self->_anon_190, &self->_objectFragmentUniforms);
      objc_msgSend(v17, "setFragmentTexture:atIndex:", v15, 0);
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_objectMTLDataBuffer, "drawWithEncoder:atIndex:", v17, 0);
      -[TSDMetalShader setPipelineStateWithEncoder:](self->_objectSystemMetalShader, "setPipelineStateWithEncoder:", v17);
      -[KNShimmerObjectSystem drawWithPercent:opacity:rotation:clockwise:texture:context:](self->_objectSystem, "drawWithPercent:opacity:rotation:clockwise:texture:context:", buildType == 1, 0, v22, v16, v12 * v14, v10);
      if (-[KNShimmerObjectSystem shouldDraw](self->_objectSystem, "shouldDraw"))
      {
        v18 = buildType == 1;
        -[TSDMetalShader setPipelineStateWithEncoder:](self->_particleSystemMetalShader, "setPipelineStateWithEncoder:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_shimmerTexturedRect, "metalTexture"));
        objc_msgSend(v17, "setFragmentTexture:atIndex:", v19, 0);

        particleSystem = self->_particleSystem;
        -[TSDTexturedRectangle singleTextureOpacity](v6, "singleTextureOpacity");
        -[KNShimmerParticleSystem drawWithPercent:opacity:rotation:clockwise:texture:context:](particleSystem, "drawWithPercent:opacity:rotation:clockwise:texture:context:", v18, self->_texture, v22, v16, v21 * 0.5, v10);
      }

    }
  }

}

- (void)teardown
{
  KNShimmerObjectSystem *objectSystem;
  KNShimmerParticleSystem *particleSystem;
  TSDMetalShader *objectMetalShader;
  TSDMTLDataBuffer *objectMTLDataBuffer;
  TSDMetalShader *objectSystemMetalShader;
  TSDMetalShader *particleSystemMetalShader;
  TSDTexturedRectangle *shimmerTexturedRect;

  self->_isSetup = 0;
  objectSystem = self->_objectSystem;
  self->_objectSystem = 0;

  particleSystem = self->_particleSystem;
  self->_particleSystem = 0;

  objectMetalShader = self->_objectMetalShader;
  self->_objectMetalShader = 0;

  objectMTLDataBuffer = self->_objectMTLDataBuffer;
  self->_objectMTLDataBuffer = 0;

  objectSystemMetalShader = self->_objectSystemMetalShader;
  self->_objectSystemMetalShader = 0;

  particleSystemMetalShader = self->_particleSystemMetalShader;
  self->_particleSystemMetalShader = 0;

  -[TSDTexturedRectangle teardown](self->_shimmerTexturedRect, "teardown");
  shimmerTexturedRect = self->_shimmerTexturedRect;
  self->_shimmerTexturedRect = 0;

}

- (KNAnimationRandomGenerator)randomGenerator
{
  KNAnimationRandomGenerator *randomGenerator;
  void *v4;
  void *v5;
  void *v6;

  randomGenerator = self->_randomGenerator;
  if (!randomGenerator)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerEffect randomGenerator]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 511, CFSTR("invalid nil value for '%s'"), "_randomGenerator");

    randomGenerator = self->_randomGenerator;
  }
  return randomGenerator;
}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  self->_texture = (TSDTexturedRectangle *)a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void)setRandomGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_randomGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_objectMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_objectMetalShader, 0);
  objc_storeStrong((id *)&self->_particleSystemMetalShader, 0);
  objc_storeStrong((id *)&self->_objectSystemMetalShader, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_shimmerTexturedRect, 0);
  objc_storeStrong((id *)&self->_particleSystem, 0);
  objc_storeStrong((id *)&self->_objectSystem, 0);
}

@end
