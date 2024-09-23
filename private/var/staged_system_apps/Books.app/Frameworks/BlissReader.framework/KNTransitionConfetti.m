@implementation KNTransitionConfetti

- (KNTransitionConfetti)initWithAnimationContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionConfetti;
  return -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
}

- (void)p_teardown
{

  self->mParticleSystem = 0;
  self->_metalShader = 0;

  self->_quadMetalShader = 0;
  self->_quadMTLDataBuffer = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[KNTransitionConfetti p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionConfetti;
  -[KNTransitionConfetti dealloc](&v3, "dealloc");
}

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNConfetti");
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469988;
}

+ (unint64_t)directionType
{
  return 7;
}

+ (id)defaultAttributes
{
  double v2;

  LODWORD(v2) = 1.5;
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2), CFSTR("KNTransitionAttributesDuration"), 0);
}

+ (id)customAttributes
{
  return 0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("kn-mac-anim-icons-trans-confetti");
}

- (void)p_setupParticleSystemWithImage:(id)a3 direction:(unint64_t)a4 duration:(double)a5 randomGenerator:(id)a6 metalContext:(id)a7
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  KNBuildConfettiSystem *mParticleSystem;

  if (!a6)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti p_setupParticleSystemWithImage:direction:duration:randomGenerator:metalContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"), 150, CFSTR("invalid nil value for '%s'"), "randGen");
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v13 = v12;
  v15 = v14;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  if (a7)
  {
    v18 = (unint64_t)(sqrt(sqrt(v16 * (v17 / v15) / v13)) * 10000.0);
    objc_msgSend(a3, "size");
    mParticleSystem = (KNBuildConfettiSystem *)+[KNBuildConfettiSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildConfettiSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v18, a4, a6, self->_metalShader, a7);
    self->mParticleSystem = mParticleSystem;
  }
  else
  {
    mParticleSystem = self->mParticleSystem;
  }
  -[KNBuildConfettiSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](mParticleSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, CGSizeZero.height);
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  KNAnimationContext *mAnimationContext;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float32x4_t *v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;

  v5 = objc_msgSend(a3, "textures");
  v6 = objc_msgSend(a3, "direction");
  objc_msgSend(a3, "duration");
  v8 = v7;
  v9 = objc_msgSend(v5, "lastObject");
  v10 = objc_msgSend(objc_msgSend(a3, "metalContext"), "device");
  v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v11, "setPixelFormat:", objc_msgSend(objc_msgSend(a3, "metalContext"), "pixelFormat"));
  objc_msgSend(v11, "setBlendingEnabled:", 1);
  objc_msgSend(v11, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v11, "setDestinationRGBBlendFactor:", 5);
  self->_metalShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionConfettiVertexShader"), CFSTR("transitionConfettiFragmentShader"), v10, CFSTR("KeynoteMetalLibrary"), v11);
  -[KNTransitionConfetti p_setupParticleSystemWithImage:direction:duration:randomGenerator:metalContext:](self, "p_setupParticleSystemWithImage:direction:duration:randomGenerator:metalContext:", objc_msgSend(v5, "objectAtIndexedSubscript:", 0), v6, objc_msgSend(a3, "randomGenerator"), objc_msgSend(a3, "metalContext"), v8);
  self->_quadMetalShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v10, v11);
  if (!self->_quadMTLDataBuffer)
  {
    objc_msgSend(v9, "size");
    v13 = v12;
    objc_msgSend(v9, "size");
    self->_quadMTLDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, 0.0, 0.0, v13, v14, 0.0, 0.0, 1.0, 1.0);
  }
  for (i = 0; i != 15; i += 5)
  {
    mAnimationContext = self->super.mAnimationContext;
    if (mAnimationContext)
    {
      -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
      v18 = v28;
      v17 = v29;
      v20 = v30;
      v19 = v31;
      v22 = v32;
      v21 = v33;
      v24 = v34;
      v23 = v35;
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v24 = 0uLL;
      v32 = 0u;
      v33 = 0u;
      v23 = 0uLL;
      v22 = 0uLL;
      v21 = 0uLL;
      v30 = 0u;
      v31 = 0u;
      v20 = 0uLL;
      v19 = 0uLL;
      v18 = 0uLL;
      v17 = 0uLL;
      v28 = 0u;
      v29 = 0u;
    }
    v25 = (float32x4_t *)&self->_vertexInput[i];
    *v25 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v17);
    v25[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v19);
    v25[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v21);
    v25[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v23);
    -[KNBuildConfettiSystem rotationMax](self->mParticleSystem, "rotationMax", *(_OWORD *)&v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31, *(_OWORD *)&v32, *(_OWORD *)&v33, *(_OWORD *)&v34, *(_OWORD *)&v35);
    *(float *)&v26 = v26;
    v25[4].i32[0] = LODWORD(v26);
    -[KNBuildConfettiSystem speedMax](self->mParticleSystem, "speedMax");
    *(float *)&v27 = v27;
    v25[4].i32[1] = LODWORD(v27);
  }
}

- (CATransform3D)p_calculateQuadShaderMVPMatrixWithPercent:(SEL)a3 slideSize:(double)a4 destRect:(CGSize)a5
{
  double height;
  double width;
  KNAnimationContext *mAnimationContext;
  long double v11;
  __int128 v12;
  CGFloat v13;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CATransform3D *result;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CATransform3D v38;
  CATransform3D v39;

  height = a6.size.height;
  width = a6.size.width;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  v11 = pow(a4, 4.0);
  v12 = *(_OWORD *)&retstr->m33;
  v13 = (1.0 - v11) * 0.25 + 0.75;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v12;
  v14 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v14;
  v15 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v15;
  v16 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v16;
  CATransform3DTranslate(&v39, &v38, width * 0.5, height * 0.5, 0.0);
  v17 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v17;
  v18 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v18;
  v19 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v19;
  v20 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v20;
  v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v21;
  v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v22;
  v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v23;
  v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v24;
  CATransform3DScale(&v39, &v38, v13, v13, 1.0);
  v25 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v25;
  v26 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v26;
  v27 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v27;
  v28 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v28;
  v29 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v38.m33 = v29;
  v30 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v38.m43 = v30;
  v31 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v38.m13 = v31;
  v32 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v38.m23 = v32;
  result = CATransform3DTranslate(&v39, &v38, width * -0.5, height * -0.5, 0.0);
  v34 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&retstr->m33 = v34;
  v35 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&retstr->m43 = v35;
  v36 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&retstr->m13 = v36;
  v37 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&retstr->m23 = v37;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  KNAnimationContext *mAnimationContext;
  CGFloat v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  double v35;
  double v36;
  KNAnimationContext *v37;
  double v38;
  id v39;
  $8E8993324294570CC2572FFC521E3532 *v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float v44;
  $8E8993324294570CC2572FFC521E3532 *v45;
  float v46;
  id v47;
  double v48;
  char *v49;
  id v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;

  v5 = objc_msgSend(a3, "textures");
  v49 = (char *)objc_msgSend(a3, "direction");
  objc_msgSend(a3, "percent");
  v7 = v6;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v9 = v8;
  v11 = v10;
  v50 = objc_msgSend(v5, "lastObject");
  v12 = objc_msgSend(v5, "objectAtIndex:", 0);
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v48 = v7;
  v21 = 1.0 - v7;
  memset(&v55, 0, sizeof(v55));
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  v23 = (1.0 - pow(v21, 4.0)) * 0.25 + 0.75;
  v53 = v55;
  CATransform3DTranslate(&v54, &v53, v18 * 0.5, v20 * 0.5, 0.0);
  v55 = v54;
  v53 = v54;
  CATransform3DScale(&v54, &v53, v23, v23, 1.0);
  v55 = v54;
  v53 = v54;
  CATransform3DTranslate(&v54, &v53, v18 * -0.5, v20 * -0.5, 0.0);
  v55 = v54;
  v24 = objc_msgSend(a3, "metalContext");
  v25 = objc_msgSend(v24, "device");
  v26 = objc_msgSend(v24, "commandBuffer");
  v27 = objc_msgSend(v24, "passDescriptor");
  v47 = objc_msgSend(v24, "currentBuffer");
  v28 = objc_msgSend(v24, "renderEncoder");
  memset(&v54, 0, sizeof(v54));
  -[KNTransitionConfetti p_calculateQuadShaderMVPMatrixWithPercent:slideSize:destRect:](self, "p_calculateQuadShaderMVPMatrixWithPercent:slideSize:destRect:", v21, v9, v11, v14, v16, v18, v20);
  if (v25)
  {
    if (v26)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"), 281, CFSTR("invalid nil value for '%s'"), "device");
    if (v26)
    {
LABEL_5:
      if (v27)
        goto LABEL_6;
LABEL_18:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"), 283, CFSTR("invalid nil value for '%s'"), "passDescriptor");
      if (v28)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"), 282, CFSTR("invalid nil value for '%s'"), "commandBuffer");
  if (!v27)
    goto LABEL_18;
LABEL_6:
  if (!v28)
LABEL_7:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionConfetti renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionConfetti.m"), 284, CFSTR("invalid nil value for '%s'"), "renderEncoder");
LABEL_8:
  v29 = objc_msgSend(v50, "metalTextureWithContext:", v24);
  v30 = objc_msgSend(v12, "metalTextureWithContext:", v24);
  if (v29)
  {
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v28, "setFragmentTexture:atIndex:", v29, 0);
      v32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m21), *(float64x2_t *)&v54.m23);
      v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m31), *(float64x2_t *)&v54.m33);
      v34 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m41), *(float64x2_t *)&v54.m43);
      self[1].super = (KNAnimationEffect)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v54.m11), *(float64x2_t *)&v54.m13);
      *(float32x4_t *)&self[1].mParticleSystem = v32;
      *(float32x4_t *)&self[1]._quadMetalShader = v33;
      self[1]._vertexInput[0] = ($8E8993324294570CC2572FFC521E3532)v34;
      objc_msgSend(a3, "percent");
      if (v35 > 0.0)
      {
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v28, &self[1]);
        objc_msgSend(v28, "setFragmentTexture:atIndex:", v29, 0);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_quadMTLDataBuffer, "drawWithEncoder:atIndex:", v28, 0);
      }
      if (v49 == &stru_68.segname[1])
      {
        v36 = sqrt(sqrt(v18 * (v20 / v11) / v9));
        memset(&v53, 0, sizeof(v53));
        v37 = self->super.mAnimationContext;
        if (v37)
          -[KNAnimationContext slideProjectionMatrix](v37, "slideProjectionMatrix");
        v38 = v48;
        v51 = v53;
        CATransform3DTranslate(&v52, &v51, 0.0, v48 * (v48 * (v20 * -2.0)) * (v36 * -0.5 + 1.0), 0.0);
        v53 = v52;
        v39 = v47;
        v40 = &self->_vertexInput[5 * (_QWORD)v47];
        v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m21), *(float64x2_t *)&v52.m23);
        v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m31), *(float64x2_t *)&v52.m33);
        v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m41), *(float64x2_t *)&v52.m43);
        *(float32x4_t *)v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v52.m11), *(float64x2_t *)&v52.m13);
        v40[1] = ($8E8993324294570CC2572FFC521E3532)v41;
        v40[2] = ($8E8993324294570CC2572FFC521E3532)v42;
        v40[3] = ($8E8993324294570CC2572FFC521E3532)v43;
      }
      else
      {
        v38 = v48;
        v39 = v47;
      }
      v44 = v21;
      v45 = &self->_vertexInput[5 * (_QWORD)v39];
      v46 = v38;
      v45[4].percent = v46;
      v45[4].opacity = v44;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalShader, "setPipelineStateWithEncoder:vertexBytes:", v28);
      objc_msgSend(v28, "setFragmentTexture:atIndex:", v31, 0);
      -[KNBuildConfettiSystem drawMetalWithEncoder:](self->mParticleSystem, "drawMetalWithEncoder:", v28);
    }
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  uint64_t v9;
  id v10;

  if (a6 == 3
    && a8 <= 0x174876E7FFLL
    && a7
    && objc_msgSend(*a3, "objectForKey:", CFSTR("KNTransitionAttributesDirection"), a4, a5))
  {
    if (objc_msgSend(objc_msgSend(*a3, "objectForKey:", CFSTR("KNTransitionAttributesDirection")), "unsignedIntegerValue") == &dword_C)v9 = 121;
    else
      v9 = 122;
    v10 = objc_msgSend(*a3, "mutableCopy");
    objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9), CFSTR("KNTransitionAttributesDirection"));
    *a3 = v10;
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7 && objc_msgSend(*a3, "objectForKey:", CFSTR("direction"), a4, a5))
  {
    v9 = (char *)objc_msgSend(objc_msgSend(*a3, "objectForKey:", CFSTR("direction")), "unsignedIntegerValue");
    v10 = 122;
    if (v9 == &stru_68.segname[1])
      v10 = 12;
    if (v9 == &stru_68.segname[2])
      v11 = 11;
    else
      v11 = v10;
    v12 = objc_msgSend(*a3, "mutableCopy");
    objc_msgSend(v12, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11), CFSTR("direction"));
    *a3 = v12;
  }
}

@end
