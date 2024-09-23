@implementation KNBuildFlame

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNFlame");
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
  return &off_469820;
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
  v4 = &off_468F38;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-flame");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (void)teardown
{
  -[KNBuildFlame metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", 0);
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));

  objc_msgSend(v5, "frameOnCanvas");
  self->_drawableFrame.origin.x = v6;
  self->_drawableFrame.origin.y = v7;
  self->_drawableFrame.size.width = v8;
  self->_drawableFrame.size.height = v9;
  v10 = TSDRectWithSize(-[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect"));
  self->_frameRect.origin.x = TSDCenterRectOverRect(v10);
  self->_frameRect.origin.y = v11;
  self->_frameRect.size.width = v12;
  self->_frameRect.size.height = v13;
  self->_frameRect.origin.y = v11 + (v13 - self->_drawableFrame.size.height) * -0.25;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v29.origin.x = v14;
  v29.origin.y = v15;
  v29.size.width = v16;
  v29.size.height = v17;
  v26 = CGRectIntersection(self->_frameRect, v29);
  self->_frameRect = v26;
  v27 = CGRectIntegral(v26);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  self->_frameRect = v27;

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)p_flameSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  id v23;
  double width;
  double height;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame p_flameSystemForTR:build:randomGenerator:metalContext:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"));
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 180, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  objc_msgSend(v11, "duration");
  v18 = v17;
  objc_msgSend(v10, "size");
  v20 = v19;
  objc_msgSend(v10, "size");
  if (v13)
  {
    v22 = (unint64_t)((v18 + fmax(v18 * -0.5 + 1.0, 0.0)) * (double)(unint64_t)(v20 / v21 * 150.0));
    objc_msgSend(v10, "size");
    v23 = +[KNBuildFlameSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildFlameSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v22, 0, v12, self->_metalFlameShader, v13);
    -[TSDTexturedRectangle size](self->_metalFlameTexture, "size");
  }
  else
  {
    v23 = 0;
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  objc_msgSend(v23, "setupWithTexture:particleTextureSize:reverseDrawOrder:", v10, 0, width, height);

  return v23;
}

- (CATransform3D)p_orthoTransformWithScale:(SEL)a3 offset:(double)a4
{
  double y;
  CGFloat x;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CATransform3D *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CATransform3D v19;
  CATransform3D v20;

  y = a5.y;
  x = a5.x;
  v8 = TSDMultiplySizeScalar(self->_frameRect.size.width, self->_frameRect.size.height, a4);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  TSDTransform3DMakeOrtho(0.0, v8, 0.0, v9, -1.0, 1.0);
  v10 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v19.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v19.m33 = v10;
  v11 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v19.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v19.m43 = v11;
  v12 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v19.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v19.m13 = v12;
  v13 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v19.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v19.m23 = v13;
  result = CATransform3DTranslate(&v20, &v19, x, -y, 0.0);
  v15 = *(_OWORD *)&v20.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v20.m31;
  *(_OWORD *)&retstr->m33 = v15;
  v16 = *(_OWORD *)&v20.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v20.m41;
  *(_OWORD *)&retstr->m43 = v16;
  v17 = *(_OWORD *)&v20.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v20.m11;
  *(_OWORD *)&retstr->m13 = v17;
  v18 = *(_OWORD *)&v20.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v20.m21;
  *(_OWORD *)&retstr->m23 = v18;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildFlame metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUImage imageWithContentsOfFile:](TSUImage, "imageWithContentsOfFile:", a3));
  v7 = objc_msgSend(v6, "CGImage");

  v8 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));

  objc_msgSend(v8, "setupMetalTextureForDevice:", v9);
  return v8;
}

- (void)p_prepareAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  TSDTexturedRectangle *v14;
  TSDTexturedRectangle *metalFlameTexture;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double MaxY;
  double v25;
  double v26;
  double v27;
  double v28;
  double y;
  id v30;
  TSDMetalShader *v31;
  TSDMetalShader *metalObjectShader;
  TSDMTLDataBuffer *v33;
  TSDMTLDataBuffer *metalObjectDataBuffer;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  void *v38;
  id v39;
  TSDMetalRenderTarget *v40;
  TSDMetalRenderTarget *fboRenderTarget;
  TSDMetalShader *v42;
  TSDMetalShader *metalFlameShader;
  void *v44;
  void *v45;
  KNBuildFlameSystem *v46;
  KNBuildFlameSystem *flameSystem;
  double height;
  double v49;
  long double v50;
  long double v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  double v55;
  double v56;
  double v57;
  TSDMetalShader *v58;
  TSDMetalShader *metalFboShader;
  uint64_t v60;
  TSDMTLDataBuffer *v61;
  TSDMTLDataBuffer *metalFboDataBuffer;
  double v63;
  double v64;
  CGFloat x;
  CGFloat v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v76;
  CATransform3D v77;
  CATransform3D v78;
  CGRect frameRect;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame p_prepareAnimationWithContext:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 254, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v12 = KNBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathForResource:ofType:", CFSTR("KNBuildFlame"), CFSTR("png")));

  v14 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildFlame p_texturedRectFromImagePath:metalContext:](self, "p_texturedRectFromImagePath:metalContext:", v73, v6));
  metalFlameTexture = self->_metalFlameTexture;
  self->_metalFlameTexture = v14;

  -[KNBuildFlame frameOfEffectWithContext:](self, "frameOfEffectWithContext:", v4);
  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", v4);
  v16 = *(_OWORD *)&v78.m33;
  *(_OWORD *)&self->_baseTransform.m31 = *(_OWORD *)&v78.m31;
  *(_OWORD *)&self->_baseTransform.m33 = v16;
  v17 = *(_OWORD *)&v78.m43;
  *(_OWORD *)&self->_baseTransform.m41 = *(_OWORD *)&v78.m41;
  *(_OWORD *)&self->_baseTransform.m43 = v17;
  v18 = *(_OWORD *)&v78.m13;
  *(_OWORD *)&self->_baseTransform.m11 = *(_OWORD *)&v78.m11;
  *(_OWORD *)&self->_baseTransform.m13 = v18;
  v19 = *(_OWORD *)&v78.m23;
  *(_OWORD *)&self->_baseTransform.m21 = *(_OWORD *)&v78.m21;
  *(_OWORD *)&self->_baseTransform.m23 = v19;
  objc_msgSend(v11, "frameOnCanvas");
  v71 = v20 - CGRectGetMinX(self->_frameRect);
  objc_msgSend(v11, "frameOnCanvas");
  v22 = v21 - CGRectGetMaxY(self->_frameRect);
  v72 = v5;
  frameRect = self->_frameRect;
  v23 = self->_drawableFrame.origin.y - frameRect.origin.y;
  MaxY = CGRectGetMaxY(frameRect);
  v70 = v22 + MaxY - CGRectGetMaxY(self->_drawableFrame) - v23;
  objc_msgSend(v11, "frameOnCanvas");
  v26 = v25;
  v28 = v27;
  y = CGPointZero.y;
  v30 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v30, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  objc_msgSend(v30, "setBlendingEnabled:", 1);
  objc_msgSend(v30, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v30, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v30, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v30, "setDestinationAlphaBlendFactor:", 5);
  v31 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v7, v30);
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v31;

  v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7, CGPointZero.x, y, v26, v28, TSDRectUnit[0], TSDRectUnit[1], TSDRectUnit[2], TSDRectUnit[3]);
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v33;

  v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_160 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  *(float32x4_t *)&self->_anon_160[16] = v35;
  *(float32x4_t *)&self->_anon_160[32] = v36;
  *(float32x4_t *)&self->_anon_160[48] = v37;
  v38 = v4;
  v39 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v39, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  objc_msgSend(v39, "setBlendingEnabled:", 1);
  objc_msgSend(v39, "setSourceRGBBlendFactor:", 4);
  objc_msgSend(v39, "setSourceAlphaBlendFactor:", 4);
  objc_msgSend(v39, "setDestinationRGBBlendFactor:", 1);
  objc_msgSend(v39, "setDestinationAlphaBlendFactor:", 1);
  v40 = (TSDMetalRenderTarget *)objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v6, self->_frameRect.size.width, self->_frameRect.size.height);
  fboRenderTarget = self->_fboRenderTarget;
  self->_fboRenderTarget = v40;

  v42 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildFlameVertexShader"), CFSTR("buildFlameFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v39);
  metalFlameShader = self->_metalFlameShader;
  self->_metalFlameShader = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "animatedBuild"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "randomGenerator"));
  v46 = (KNBuildFlameSystem *)objc_claimAutoreleasedReturnValue(-[KNBuildFlame p_flameSystemForTR:build:randomGenerator:metalContext:](self, "p_flameSystemForTR:build:randomGenerator:metalContext:", v11, v44, v45, v6));
  flameSystem = self->_flameSystem;
  self->_flameSystem = v46;

  objc_msgSend(v11, "frameOnCanvas");
  objc_msgSend(v11, "frameOnCanvas");
  height = self->_frameRect.size.height;
  -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians");
  v50 = tan(v49 * 0.5);
  v51 = height / (v50 + v50);
  memset(&v78, 0, sizeof(v78));
  TSDTransform3DMakeProjection(&v78, -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians"));
  memset(&v77, 0, sizeof(v77));
  CATransform3DMakeTranslation(&v77, v71 - self->_frameRect.size.width * 0.5, -self->_frameRect.size.height - self->_frameRect.origin.y + self->_frameRect.origin.y - v70, -v51);
  a = v77;
  b = v78;
  CATransform3DConcat(&v76, &a, &b);
  v78 = v76;
  v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v76.m21), *(float64x2_t *)&v76.m23);
  v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v76.m31), *(float64x2_t *)&v76.m33);
  v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v76.m41), *(float64x2_t *)&v76.m43);
  *(float32x4_t *)&self->_flameUniforms.RotationMax = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v76.m11), *(float64x2_t *)&v76.m13);
  *(float32x4_t *)&self->_flameUniforms.Duration = v52;
  *(float32x4_t *)&self->_anon_34[12] = v53;
  *(float32x4_t *)&self->_anon_34[28] = v54;
  -[KNBuildFlameSystem speedMax](self->_flameSystem, "speedMax");
  *(float *)&v55 = v55;
  *(_DWORD *)&self->_anon_34[48] = LODWORD(v55);
  -[KNBuildFlameSystem rotationMax](self->_flameSystem, "rotationMax");
  *(float *)&v56 = v56;
  *(_DWORD *)&self->_anon_34[44] = LODWORD(v56);
  -[KNBuildFlameSystem duration](self->_flameSystem, "duration");
  *(float *)&v57 = v57;
  *(_DWORD *)&self->_anon_34[60] = LODWORD(v57);
  v58 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v7, v30);
  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = v58;

  v61 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7, TSDRectWithSize(v60));
  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = v61;

  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  memset(&v76, 0, sizeof(v76));
  TSDTransform3DMakeOrtho(0.0, v63, v64, 0.0, -1.0, 1.0);
  x = self->_frameRect.origin.x;
  v66 = self->_frameRect.origin.y - self->_frameRect.size.height * 0.5;
  b = v76;
  CATransform3DTranslate(&a, &b, x, v66, 0.0);
  v76 = a;
  v67 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m21), *(float64x2_t *)&a.m23);
  v68 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m31), *(float64x2_t *)&a.m33);
  v69 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m41), *(float64x2_t *)&a.m43);
  *(float32x4_t *)self->_anon_1c0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a.m11), *(float64x2_t *)&a.m13);
  *(float32x4_t *)&self->_anon_1c0[16] = v67;
  *(float32x4_t *)&self->_anon_1c0[32] = v68;
  *(float32x4_t *)&self->_anon_1c0[48] = v69;

}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildIn");

  if (v5)
    -[KNBuildFlame p_prepareAnimationWithContext:](self, "p_prepareAnimationWithContext:", v6);

}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildFlame metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  -[KNBuildFlame metalAnimationHasBegunWithContext:](self, "metalAnimationHasBegunWithContext:", v4);

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
    -[KNBuildFlame p_prepareAnimationWithContext:](self, "p_prepareAnimationWithContext:", v6);

}

- (void)metalRenderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "metalContext"));
  objc_msgSend(v37, "percent");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "animatedBuild"));
  if (objc_msgSend(v8, "isBuildOut"))
    v9 = 1.0 - v7;
  else
    v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "metalContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "renderEncoder"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFlame metalRenderFrameWithContext:]"));
    v15 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFlame.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v16, 392, CFSTR("invalid nil value for '%s'"), "renderEncoder");

    v5 = v15;
  }
  if (objc_msgSend(v8, "isBuildOut"))
    v17 = 0.25;
  else
    v17 = 0.5;
  objc_msgSend(v8, "duration");
  v19 = 1.0 / v18;
  if (v17 >= v19)
    v20 = v19;
  else
    v20 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "metalContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metalTextureWithContext:", v21));

  if (v22)
  {
    v36 = v4;
    objc_msgSend(v12, "setFragmentTexture:atIndex:", v22, 0);
    if (v9 > v20)
    {
      v23 = (v9 - v20) / (1.0 - v20) + (v9 - v20) / (1.0 - v20);
      if (v23 > 1.0)
        v23 = 1.0;
      v24 = TSUSineMap(v23);
      objc_msgSend(v10, "singleTextureOpacity");
      *(float *)&v25 = v24 * v25;
      self->_objectFragmentUniforms.Opacity = *(float *)&v25;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v12, self->_anon_160);
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalObjectDataBuffer, "drawWithEncoder:atIndex:", v12, -[TSDMetalShader bufferIndex](self->_metalObjectShader, "bufferIndex"));
    }
    v26 = v9 == 1.0 || v9 == 0.0;
    v28 = 1.0;
    if (v26)
      v28 = 0.0;
    v27 = v7;
    *(float *)&self->_anon_34[52] = v27;
    *(float *)&self->_anon_34[56] = v28;
    v35 = v5;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandQueue"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "commandBuffer"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget passDescriptor](self->_fboRenderTarget, "passDescriptor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "renderCommandEncoderWithDescriptor:", v31));

    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalFlameShader, "setPipelineStateWithEncoder:vertexBytes:", v32, &self->_flameUniforms);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_metalFlameTexture, "metalTexture"));
    objc_msgSend(v32, "setFragmentTexture:atIndex:", v33, 0);

    -[KNBuildFlameSystem drawMetalWithEncoder:](self->_flameSystem, "drawMetalWithEncoder:", v32);
    objc_msgSend(v32, "endEncoding");
    objc_msgSend(v30, "commit");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_fboRenderTarget, "texture"));
    objc_msgSend(v12, "setFragmentTexture:atIndex:", v34, 0);

    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalFboShader, "setPipelineStateWithEncoder:vertexBytes:", v12, self->_anon_1c0);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalFboDataBuffer, "drawWithEncoder:atIndex:", v12, -[TSDMetalShader bufferIndex](self->_metalFboShader, "bufferIndex"));

    v5 = v35;
    v4 = v36;
  }

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalFlameShader;
  TSDMetalShader *metalObjectShader;
  TSDMTLDataBuffer *metalObjectDataBuffer;
  TSDTexturedRectangle *metalFlameTexture;
  TSDMetalShader *metalFboShader;
  TSDMTLDataBuffer *metalFboDataBuffer;
  TSDMetalRenderTarget *fboRenderTarget;

  metalFlameShader = self->_metalFlameShader;
  self->_metalFlameShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = 0;

  -[TSDTexturedRectangle teardown](self->_metalFlameTexture, "teardown");
  metalFlameTexture = self->_metalFlameTexture;
  self->_metalFlameTexture = 0;

  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = 0;

  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = 0;

  fboRenderTarget = self->_fboRenderTarget;
  self->_fboRenderTarget = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fboRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalFboDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFboShader, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalFlameShader, 0);
  objc_storeStrong((id *)&self->_metalFlameTexture, 0);
  objc_storeStrong((id *)&self->_flameSystem, 0);
}

@end
