@implementation KNBuildAnvil

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.BUKAnvil");
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
  return &off_469A90;
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
  v4 = &off_468FC8;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-anvil");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_drawableFrame;
  double MinX;
  double MaxX;
  double MaxY;
  double MinY;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_drawableFrame = &self->_drawableFrame;
  self->_drawableFrame = a3;
  MinX = CGRectGetMinX(a3);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  CGRectGetMinY(v23);
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
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  MinY = CGRectGetMinY(v26);
  v14 = p_drawableFrame->size.width;
  if (v14 < p_drawableFrame->size.height)
    v14 = p_drawableFrame->size.height;
  if (v14 >= 128.0)
    v15 = v14;
  else
    v15 = 128.0;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v16 = CGRectGetMaxY(v27);
  if (v16 >= MaxY + v15 * 0.5)
    v17 = MaxY + v15 * 0.5;
  else
    v17 = v16;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v18 = CGRectGetMinX(v28);
  if (v18 >= MinX - v15)
    v19 = v18;
  else
    v19 = MinX - v15;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v20 = CGRectGetMaxX(v29);
  if (v20 >= MaxX + v15)
    v21 = MaxX + v15;
  else
    v21 = v20;
  p_frameRect = &self->_frameRect;
  v30.origin.x = TSDRectWithPoints(v19, MinY, v21, v17);
  *p_frameRect = v30;
  result = CGRectIntegral(v30);
  *p_frameRect = result;
  return result;
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
}

- (void)teardown
{
  CGPoint *cameraShakePoints;

  cameraShakePoints = self->_cameraShakePoints;
  if (cameraShakePoints)
  {
    free(cameraShakePoints);
    self->_cameraShakePoints = 0;
  }
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MaxY;
  double MinY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect *p_frameRect;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  objc_msgSend(a3, "drawableFrame");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  self->_drawableFrame = v21;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGRectGetMinY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxY = CGRectGetMaxY(v24);
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  MinY = CGRectGetMinY(v25);
  v12 = self->_drawableFrame.size.width;
  if (v12 < self->_drawableFrame.size.height)
    v12 = self->_drawableFrame.size.height;
  if (v12 >= 128.0)
    v13 = v12;
  else
    v13 = 128.0;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v14 = CGRectGetMaxY(v26);
  if (v14 >= MaxY + v13 * 0.5)
    v15 = MaxY + v13 * 0.5;
  else
    v15 = v14;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v16 = CGRectGetMinX(v27);
  if (v16 >= MinX - v13)
    v17 = v16;
  else
    v17 = MinX - v13;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v18 = CGRectGetMaxX(v28);
  if (v18 >= MaxX + v13)
    v19 = MaxX + v13;
  else
    v19 = v18;
  p_frameRect = &self->_frameRect;
  v29.origin.x = TSDRectWithPoints(v17, MinY, v19, v15);
  *p_frameRect = v29;
  result = CGRectIntegral(v29);
  *p_frameRect = result;
  return result;
}

- (CGPoint)p_cameraShakePointsWithRandomGenerator:(id)a3
{
  id v4;
  CGPoint *cameraShakePoints;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  double *p_x;

  v4 = a3;
  cameraShakePoints = self->_cameraShakePoints;
  if (!cameraShakePoints)
  {
    v6 = 0;
    v7 = 0;
    self->_cameraShakePoints = (CGPoint *)malloc_type_calloc(0x10uLL, 0xBuLL, 0x8CB475F9uLL);
    do
    {
      v8 = ((double)(int)v7 / -10.0 + 1.0) * ((double)(int)v7 / -10.0 + 1.0);
      objc_msgSend(v4, "doubleBetween::", -1.0, 1.0);
      v10 = v8 * (v9 * 0.025) * 0.4;
      v11 = pow(-1.0, (double)(int)v7);
      cameraShakePoints = self->_cameraShakePoints;
      p_x = &cameraShakePoints[v6].x;
      *p_x = v10;
      p_x[1] = v11 * 0.025 * v8;
      ++v7;
      ++v6;
    }
    while (v7 != 11);
  }

  return cameraShakePoints;
}

- (id)p_smokeSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  id v23;
  double v24;
  double v25;
  double v26;

  if (a6)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    objc_msgSend(a3, "size");
    v14 = v13;
    v16 = v15;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "duration");
    v22 = v21;

    v23 = +[KNBuildAnvilSmokeSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildAnvilSmokeSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v11, self->_metalSmokeShader, v10, 16.0, 16.0, 300.0, 1.0, v14, v16, v18, v20, v22);
    -[TSDTexturedRectangle frame](self->_metalSmokeTexture, "frame");
    v25 = v24;
    -[TSDTexturedRectangle frame](self->_metalSmokeTexture, "frame");
    objc_msgSend(v23, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, v25, v26);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (id)p_specksSystemForTR:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  id v37;
  double v38;
  double v39;
  double v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil p_specksSystemForTR:build:randomGenerator:metalContext:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"));
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 273, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v10, "frameOnCanvas");
  v22 = v21;
  v24 = v23;
  v25 = v23 * (v21 / v18) / v20;
  objc_msgSend(v10, "size");
  v27 = v26 / v22;
  objc_msgSend(v10, "size");
  v30 = TSUClamp(v25 * (v27 * v28 / v24), 0.0, 1.0);
  if (v13)
  {
    v31 = (double)(unint64_t)TSDMixFloats(v29, 50.0, 15.0, v30);
    objc_msgSend(v10, "size");
    v33 = v32;
    v35 = v34;
    objc_msgSend(v11, "duration");
    v37 = +[KNBuildAnvilSpecksSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildAnvilSpecksSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", 0, v12, self->_metalSpecksShader, v13, 16.0, 16.0, v31, 1.0, v33, v35, v18, v20, v36);
    -[TSDTexturedRectangle frame](self->_metalSpecksTexture, "frame");
    v39 = v38;
    -[TSDTexturedRectangle frame](self->_metalSpecksTexture, "frame");
    objc_msgSend(v37, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, v39, v40);
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (CGPoint)p_objectTranslationAtPercent:(double)a3 duration:(double)a4 objectSmashDuration:(double)a5 objectFrame:(CGRect)a6 randomGenerator:(id)a7
{
  CGFloat height;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double y;
  CGFloat v20;
  CGPoint *v21;
  double v22;
  double *p_x;
  double v25;
  CGPoint *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat x;
  CGFloat width;
  CGFloat rect;
  CGPoint result;
  CGRect v45;

  height = a6.size.height;
  width = a6.size.width;
  rect = a6.origin.y;
  x = a6.origin.x;
  v12 = a7;
  if (a4 * 0.5 <= 0.25)
    v13 = a4 * 0.5;
  else
    v13 = 0.25;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v15 = v14;
  if (!v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"));
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 315, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  v20 = CGPointZero.x;
  y = CGPointZero.y;
  v21 = -[KNBuildAnvil p_cameraShakePointsWithRandomGenerator:](self, "p_cameraShakePointsWithRandomGenerator:", v12);
  v22 = -(a5 - a3 * a4) / v13;
  if (v22 > 0.0 && v22 < 1.0)
  {
    p_x = &v21[vcvtmd_s64_f64(v22 * 10.0)].x;
    v25 = *p_x;
    v39 = p_x[1];
    v26 = &v21[vcvtpd_s64_f64(v22 * 10.0)];
    v38 = v26->y;
    v40 = a4;
    v27 = v15;
    v28 = height;
    v29 = -((double)(uint64_t)floor(v22 * 10.0) - v22 * 10.0);
    TSDMixFloats(v21, v25, v26->x, v29);
    v30 = v29;
    height = v28;
    v15 = v27;
    a4 = v40;
    TSDMixFloats(v31, v39, v38, v30);
    v20 = TSDAddPoints(v32);
    y = v33;
  }
  v34 = TSUClamp(a3 * a4 / a5, 0.0, 1.0);
  v45.origin.x = x;
  v45.size.width = width;
  v45.origin.y = rect;
  v45.size.height = height;
  v35 = y + (1.0 - v34 * v34) * (v15 + CGRectGetMaxY(v45) + self->_drawableFrame.origin.y + 5.0);

  v36 = v20;
  v37 = v35;
  result.y = v37;
  result.x = v36;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildAnvil metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
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

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  TSDTexturedRectangle *v20;
  TSDTexturedRectangle *metalSmokeTexture;
  id v22;
  void *v23;
  void *v24;
  TSDTexturedRectangle *v25;
  TSDTexturedRectangle *metalSpecksTexture;
  double v27;
  double v28;
  double v29;
  double v30;
  double y;
  double v32;
  double v33;
  double v34;
  double v35;
  TSDMTLDataBuffer *v36;
  TSDMTLDataBuffer *metalObjectDataBuffer;
  TSDMTLDataBuffer *v38;
  TSDMTLDataBuffer *metalBlurDataBuffer;
  id v40;
  TSDMetalShader *v41;
  TSDMetalShader *metalSmokeShader;
  TSDMetalShader *v43;
  TSDMetalShader *metalSpecksShader;
  TSDMetalShader *v45;
  TSDMetalShader *metalObjectShader;
  TSDMetalShader *v47;
  TSDMetalShader *metalObjectBlurShader;
  double v49;
  double v50;
  double v51;
  float64x2_t v52;
  double v53;
  float64x2_t v54;
  void *v55;
  KNBuildAnvilSmokeSystem *v56;
  KNBuildAnvilSmokeSystem *smokeSystem;
  KNBuildAnvilSpecksSystem *v58;
  KNBuildAnvilSpecksSystem *specksSystem;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  double v64;
  float64_t v65;
  float64_t v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v8, "frameOnCanvas");
  -[KNBuildAnvil frameOfEffectWithFrame:context:](self, "frameOfEffectWithFrame:context:", v4);

  objc_msgSend(v4, "drawableFrame");
  self->_drawableFrame.origin.x = v9;
  self->_drawableFrame.origin.y = v10;
  self->_drawableFrame.size.width = v11;
  self->_drawableFrame.size.height = v12;
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil metalPrepareAnimationWithContext:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 385, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v17 = KNBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathForResource:ofType:", CFSTR("KNBuildAnvil-Smoke"), CFSTR("png")));

  v67 = (void *)v19;
  v20 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvil p_texturedRectFromImagePath:metalContext:](self, "p_texturedRectFromImagePath:metalContext:", v19, v6));
  metalSmokeTexture = self->_metalSmokeTexture;
  self->_metalSmokeTexture = v20;

  v22 = KNBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pathForResource:ofType:", CFSTR("KNBuildAnvil-Specks"), CFSTR("png")));

  v25 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvil p_texturedRectFromImagePath:metalContext:](self, "p_texturedRectFromImagePath:metalContext:", v24, v6));
  metalSpecksTexture = self->_metalSpecksTexture;
  self->_metalSpecksTexture = v25;

  objc_msgSend(v16, "frameOnCanvas");
  v28 = v27;
  v30 = v29;
  y = CGPointZero.y;
  v32 = TSDRectUnit[0];
  v33 = TSDRectUnit[1];
  v34 = TSDRectUnit[2];
  v35 = TSDRectUnit[3];
  v36 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7, CGPointZero.x, y);
  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = v36;

  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v38 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:", 1, 1, 1, v7, CGPointZero.x, y, v28, v30, v32, v33, v34, v35, TSDGPUDataBufferMeshSizeDefault[0], TSDGPUDataBufferMeshSizeDefault[1]);
    metalBlurDataBuffer = self->_metalBlurDataBuffer;
    self->_metalBlurDataBuffer = v38;

  }
  v40 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v40, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  objc_msgSend(v40, "setBlendingEnabled:", 1);
  objc_msgSend(v40, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v40, "setDestinationAlphaBlendFactor:", 5);
  v41 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildAnvilSmokeVertexShader"), CFSTR("buildAnvilSmokeFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v40);
  metalSmokeShader = self->_metalSmokeShader;
  self->_metalSmokeShader = v41;

  v43 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildAnvilSpecksVertexShader"), CFSTR("buildAnvilSpecksFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v40);
  metalSpecksShader = self->_metalSpecksShader;
  self->_metalSpecksShader = v43;

  v45 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v7, v40);
  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = v45;

  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v47 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultSingleDirectionMotionBlurShaderWithDevice:colorAttachment:", v7, v40);
    metalObjectBlurShader = self->_metalObjectBlurShader;
    self->_metalObjectBlurShader = v47;

    objc_msgSend(v16, "size");
    v66 = v49;
    objc_msgSend(v16, "size");
    v65 = v50;
    objc_msgSend(v16, "size");
    v64 = 1.0 / v51;
    objc_msgSend(v16, "size");
    v52.f64[0] = v64;
    v52.f64[1] = 1.0 / v53;
    v54.f64[0] = v66;
    v54.f64[1] = v65;
    *(float32x4_t *)&self->_anon_1e0[16] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54), v52);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
  v56 = (KNBuildAnvilSmokeSystem *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvil p_smokeSystemForTR:build:randomGenerator:metalContext:](self, "p_smokeSystemForTR:build:randomGenerator:metalContext:", v16, v68, v55, v6));
  smokeSystem = self->_smokeSystem;
  self->_smokeSystem = v56;

  v58 = (KNBuildAnvilSpecksSystem *)objc_claimAutoreleasedReturnValue(-[KNBuildAnvil p_specksSystemForTR:build:randomGenerator:metalContext:](self, "p_specksSystemForTR:build:randomGenerator:metalContext:", v16, v68, v55, v6));
  specksSystem = self->_specksSystem;
  self->_specksSystem = v58;

  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", v4);
  *(_OWORD *)&self->_baseTransform.m31 = v73;
  *(_OWORD *)&self->_baseTransform.m33 = v74;
  *(_OWORD *)&self->_baseTransform.m41 = v75;
  *(_OWORD *)&self->_baseTransform.m43 = v76;
  *(_OWORD *)&self->_baseTransform.m11 = v69;
  *(_OWORD *)&self->_baseTransform.m13 = v70;
  *(_OWORD *)&self->_baseTransform.m21 = v71;
  *(_OWORD *)&self->_baseTransform.m23 = v72;
  v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m11), *(float64x2_t *)&self->_baseTransform.m13);
  v61 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m21), *(float64x2_t *)&self->_baseTransform.m23);
  v62 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m31), *(float64x2_t *)&self->_baseTransform.m33);
  v63 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_baseTransform.m41), *(float64x2_t *)&self->_baseTransform.m43);
  *(float32x4_t *)self->_anon_190 = v60;
  *(float32x4_t *)&self->_anon_190[16] = v61;
  *(float32x4_t *)&self->_anon_190[32] = v62;
  *(float32x4_t *)&self->_anon_190[48] = v63;
  *(float32x4_t *)&self->_anon_1e0[32] = v60;
  *(float32x4_t *)&self->_anon_1e0[48] = v61;
  *(float32x4_t *)&self->_anon_1e0[64] = v62;
  *(float32x4_t *)&self->_anon_1e0[80] = v63;

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

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGFloat m44;
  CGFloat m43;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __n128 v43;
  __n128 v44;
  float64_t v45;
  double v46;
  char v47;
  float64x2_t v48;
  double v49;
  TSDMetalShader **p_metalObjectShader;
  int *v51;
  double v52;
  $C1DFD4E0A10081BF298E754D91354697 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  double v57;
  float v58;
  float v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  float v64;
  double v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  float64_t v70;
  __int128 v71;
  float64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  double v80;
  void *v81;
  __int128 v82;
  float32x4_t v83;
  __int128 v84;
  float32x4_t v85;
  __int128 v86;
  float32x4_t v87;
  __int128 v88;
  float32x4_t v89;
  CATransform3D v90;
  CATransform3D v91;
  CATransform3D v92;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  objc_msgSend(v4, "percent");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "renderEncoder"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildAnvil metalRenderFrameWithContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildAnvil.m"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 474, CFSTR("invalid nil value for '%s'"), "renderEncoder");

  }
  objc_msgSend(v6, "duration");
  v16 = v15;
  v17 = v15 * 0.4;
  if (v17 <= 0.2)
    v18 = v17;
  else
    v18 = 0.2;
  objc_msgSend(v9, "frameOnCanvas");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metalTextureWithContext:", v21));

  if (v22)
  {
    objc_msgSend(v11, "setFragmentTexture:atIndex:", v22, 0);
    if (v8 <= 0.999)
    {
      v80 = v20;
      v86 = *(_OWORD *)&self->_baseTransform.m13;
      v88 = *(_OWORD *)&self->_baseTransform.m11;
      v82 = *(_OWORD *)&self->_baseTransform.m23;
      v84 = *(_OWORD *)&self->_baseTransform.m21;
      v76 = *(_OWORD *)&self->_baseTransform.m33;
      v78 = *(_OWORD *)&self->_baseTransform.m31;
      v74 = *(_OWORD *)&self->_baseTransform.m41;
      m43 = self->_baseTransform.m43;
      m44 = self->_baseTransform.m44;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
      objc_msgSend(v9, "frameOnCanvas");
      -[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:](self, "p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:", v25, v8, v16, v18, v26, v27, v28, v29);
      v31 = v30;
      v33 = v32;
      v34 = TSUClamp(v8 + 1.0 / (v16 * -60.0), 0.0, 1.0);
      objc_msgSend(v9, "frameOnCanvas");
      v81 = (void *)v25;
      -[KNBuildAnvil p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:](self, "p_objectTranslationAtPercent:duration:objectSmashDuration:objectFrame:randomGenerator:", v25, v34, v16, v18, v35, v36, v37, v38);
      v40 = v39;
      v42 = v41;
      v43.n128_f64[0] = v31;
      v44.n128_f64[0] = v33;
      v45 = TSDSubtractPoints(v43, v44, v40, v42);
      v70 = v46;
      v72 = v45;
      v47 = TSDNearlyEqualPoints();
      v48.f64[0] = v72;
      v48.f64[1] = v70;
      *(float32x2_t *)self->_anon_1e0 = vcvt_f32_f64(v48);
      *(_OWORD *)&v91.m11 = v88;
      *(_OWORD *)&v91.m13 = v86;
      *(_OWORD *)&v91.m21 = v84;
      *(_OWORD *)&v91.m23 = v82;
      *(_OWORD *)&v91.m31 = v78;
      *(_OWORD *)&v91.m33 = v76;
      *(_OWORD *)&v91.m41 = v74;
      v91.m43 = m43;
      v91.m44 = m44;
      CATransform3DTranslate(&v92, &v91, v31, v33, 0.0);
      v77 = *(_OWORD *)&v92.m11;
      v79 = *(_OWORD *)&v92.m13;
      v89 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v92.m11), *(float64x2_t *)&v92.m13);
      v73 = *(_OWORD *)&v92.m21;
      v75 = *(_OWORD *)&v92.m23;
      v87 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v92.m21), *(float64x2_t *)&v92.m23);
      v69 = *(_OWORD *)&v92.m31;
      v71 = *(_OWORD *)&v92.m33;
      v85 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v92.m31), *(float64x2_t *)&v92.m33);
      v67 = *(_OWORD *)&v92.m41;
      v68 = *(_OWORD *)&v92.m43;
      v83 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v92.m41), *(float64x2_t *)&v92.m43);
      objc_msgSend(v9, "singleTextureOpacity");
      *(float32x4_t *)self->_anon_190 = v89;
      *(float32x4_t *)&self->_anon_190[16] = v87;
      *(float32x4_t *)&self->_anon_190[32] = v85;
      *(float32x4_t *)&self->_anon_190[48] = v83;
      *(float *)&v49 = v49;
      self->_objectFragmentUniforms.Opacity = *(float *)&v49;
      *(float32x4_t *)&self->_anon_1e0[32] = v89;
      *(float32x4_t *)&self->_anon_1e0[48] = v87;
      *(float32x4_t *)&self->_anon_1e0[64] = v85;
      *(float32x4_t *)&self->_anon_1e0[80] = v83;
      self->_blurFragmentUniforms.Opacity = *(float *)&v49;
      if ((v47 & 1) != 0 || !objc_msgSend(v4, "isMotionBlurred"))
      {
        p_metalObjectShader = &self->_metalObjectShader;
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v11, self->_anon_190, &self->_objectFragmentUniforms);
        v51 = &OBJC_IVAR___KNBuildAnvil__metalObjectDataBuffer;
      }
      else
      {
        p_metalObjectShader = &self->_metalObjectBlurShader;
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectBlurShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v11, self->_anon_1e0, &self->_blurFragmentUniforms);
        v51 = &OBJC_IVAR___KNBuildAnvil__metalBlurDataBuffer;
      }
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v51), "drawWithEncoder:atIndex:", v11, -[TSDMetalShader bufferIndex](*p_metalObjectShader, "bufferIndex"));
      v52 = TSUClamp(-(v18 - v8 * v16) / (v16 - v18), 0.0, 1.0);
      *(_OWORD *)&v92.m11 = v77;
      *(_OWORD *)&v92.m13 = v79;
      *(_OWORD *)&v92.m21 = v73;
      *(_OWORD *)&v92.m23 = v75;
      *(_OWORD *)&v92.m31 = v69;
      *(_OWORD *)&v92.m33 = v71;
      *(_OWORD *)&v92.m41 = v67;
      *(_OWORD *)&v92.m43 = v68;
      CATransform3DTranslate(&v90, &v92, 0.0, v52 * (v80 / -7.0 * 0.5 * v52), 0.0);
      v53 = ($C1DFD4E0A10081BF298E754D91354697)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v90.m11), *(float64x2_t *)&v90.m13);
      v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v90.m21), *(float64x2_t *)&v90.m23);
      v55 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v90.m31), *(float64x2_t *)&v90.m33);
      v56 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v90.m41), *(float64x2_t *)&v90.m43);
      v57 = 1.0 - v52 * v52;
      if (v52 == 0.0)
        v57 = 0.0;
      v58 = v52;
      v59 = v57;
      *(float *)&self->_anon_30[56] = v58;
      *(float *)&self->_anon_30[60] = v59;
      self->_smokeUniforms = v53;
      *(float32x4_t *)self->_anon_30 = v54;
      *(float32x4_t *)&self->_anon_30[16] = v55;
      *(float32x4_t *)&self->_anon_30[32] = v56;
      -[KNBuildAnvilSmokeSystem speedMax](self->_smokeSystem, "speedMax");
      *(float *)&v60 = v60;
      *(_DWORD *)&self->_anon_30[52] = LODWORD(v60);
      -[KNBuildAnvilSmokeSystem rotationMax](self->_smokeSystem, "rotationMax");
      *(float *)&v61 = v61;
      *(_DWORD *)&self->_anon_30[48] = LODWORD(v61);
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalSmokeShader, "setPipelineStateWithEncoder:vertexBytes:", v11, &self->_smokeUniforms);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_metalSmokeTexture, "metalTexture"));
      objc_msgSend(v11, "setFragmentTexture:atIndex:", v62, 0);

      -[KNBuildAnvilSmokeSystem drawMetalWithEncoder:](self->_smokeSystem, "drawMetalWithEncoder:", v11);
      if (v52 < 0.5)
      {
        *(float32x4_t *)&self->_specksUniforms.SpeedMax = v89;
        *(float32x4_t *)&self->_anon_9c[4] = v87;
        *(float32x4_t *)&self->_anon_9c[20] = v85;
        *(float32x4_t *)&self->_anon_9c[36] = v83;
        v63 = TSUSineMap(v52);
        v64 = TSUClamp(v63 * -2.0 + 1.0, 0.0, 1.0);
        *(float *)&self->_anon_9c[56] = v58;
        *(float *)&self->_anon_9c[60] = v64;
        -[KNBuildAnvilSpecksSystem speedMax](self->_specksSystem, "speedMax");
        *(float *)&v65 = v65;
        *(_DWORD *)&self->_anon_9c[52] = LODWORD(v65);
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalSpecksShader, "setPipelineStateWithEncoder:vertexBytes:", v11, &self->_specksUniforms);
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_metalSpecksTexture, "metalTexture"));
        objc_msgSend(v11, "setFragmentTexture:atIndex:", v66, 0);

        -[KNBuildAnvilSpecksSystem drawMetalWithEncoder:](self->_specksSystem, "drawMetalWithEncoder:", v11);
      }

    }
    else
    {
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalObjectShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v11, self->_anon_190, &self->_objectFragmentUniforms);
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalObjectDataBuffer, "drawWithEncoder:atIndex:", v11, -[TSDMetalShader bufferIndex](self->_metalObjectShader, "bufferIndex"));
    }
  }

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalSmokeShader;
  TSDMetalShader *metalSpecksShader;
  TSDMetalShader *metalObjectShader;
  TSDMetalShader *metalObjectBlurShader;
  TSDMTLDataBuffer *metalObjectDataBuffer;
  TSDMTLDataBuffer *metalBlurDataBuffer;
  CGPoint *cameraShakePoints;

  metalSmokeShader = self->_metalSmokeShader;
  self->_metalSmokeShader = 0;

  metalSpecksShader = self->_metalSpecksShader;
  self->_metalSpecksShader = 0;

  metalObjectShader = self->_metalObjectShader;
  self->_metalObjectShader = 0;

  metalObjectBlurShader = self->_metalObjectBlurShader;
  self->_metalObjectBlurShader = 0;

  metalObjectDataBuffer = self->_metalObjectDataBuffer;
  self->_metalObjectDataBuffer = 0;

  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = 0;

  -[TSDTexturedRectangle teardown](self->_metalSmokeTexture, "teardown");
  -[TSDTexturedRectangle teardown](self->_metalSpecksTexture, "teardown");
  cameraShakePoints = self->_cameraShakePoints;
  if (cameraShakePoints)
  {
    free(cameraShakePoints);
    self->_cameraShakePoints = 0;
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  id v11;
  id v12;

  if ((a6 - 1) <= 1 && a8 <= 0x174876E7FFLL && a7)
  {
    v11 = objc_msgSend(*a3, "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("KNBuildCustomAttributesMotionBlur"));
    v12 = objc_retainAutorelease(v11);
    *a3 = v12;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBlurDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalObjectBlurShader, 0);
  objc_storeStrong((id *)&self->_metalObjectShader, 0);
  objc_storeStrong((id *)&self->_metalSpecksTexture, 0);
  objc_storeStrong((id *)&self->_metalSpecksShader, 0);
  objc_storeStrong((id *)&self->_specksSystem, 0);
  objc_storeStrong((id *)&self->_metalSmokeTexture, 0);
  objc_storeStrong((id *)&self->_metalSmokeShader, 0);
  objc_storeStrong((id *)&self->_smokeSystem, 0);
}

@end
