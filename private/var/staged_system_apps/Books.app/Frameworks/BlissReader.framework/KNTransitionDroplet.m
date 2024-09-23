@implementation KNTransitionDroplet

- (KNTransitionDroplet)initWithAnimationContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionDroplet;
  return -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
}

- (void)p_teardown
{

  self->_metalDrawBuffer = 0;
  self->_rippleShader = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[KNTransitionDroplet p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionDroplet;
  -[KNTransitionDroplet dealloc](&v3, "dealloc");
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
  return &off_469970;
}

+ (id)animationName
{
  return CFSTR("apple:droplet");
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNTransitionAttributesDuration");
  v4 = &off_468F68;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("kn-mac-anim-icons-trans-droplet");
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  KNAnimationContext *mAnimationContext;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  double v14;
  unsigned __int8 *anon_b0;
  double v16;
  float v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v5 = objc_msgSend(a3, "textures");
  v6 = objc_msgSend(objc_msgSend(a3, "metalContext"), "device");
  v7 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v7, "setPixelFormat:", objc_msgSend(objc_msgSend(a3, "metalContext"), "pixelFormat"));
  self->_rippleShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionDropletVertexShader"), CFSTR("transitionDropletFragmentShader"), v6, CFSTR("KeynoteMetalLibrary"), v7);
  v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  self->_metalDrawBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v6, TSDRectWithSize(objc_msgSend(v8, "size")));
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
  {
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
    v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v25);
    v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v23);
    v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
    v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
  }
  else
  {
    v13 = 0uLL;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = 0uLL;
    v11 = 0uLL;
    v10 = 0uLL;
    v18 = 0u;
    v19 = 0u;
  }
  *(float32x4_t *)self->_anon_70 = v13;
  *(float32x4_t *)&self->_anon_70[16] = v12;
  *(float32x4_t *)&self->_anon_70[32] = v11;
  *(float32x4_t *)&self->_anon_70[48] = v10;
  objc_msgSend(v8, "size", *(_OWORD *)&v18, *(_OWORD *)&v19, *(_OWORD *)&v20, *(_OWORD *)&v21, *(_OWORD *)&v22, *(_OWORD *)&v23, *(_OWORD *)&v24, *(_OWORD *)&v25);
  *(float *)&v14 = v14;
  anon_b0 = self->_anon_b0;
  *(_DWORD *)anon_b0 = LODWORD(v14);
  objc_msgSend(v8, "size");
  v17 = v16;
  *((float *)anon_b0 + 1) = v17;
  *(_OWORD *)(anon_b0 + 8) = xmmword_314910;
  *((_QWORD *)anon_b0 + 3) = 0x40C0000041200000;
}

- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4
{
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  float v13;

  v7 = objc_msgSend(a3, "textures");
  objc_msgSend(a3, "percent");
  v9 = v8;
  v10 = objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "metalTexture");
  v11 = objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "metalTexture");
  v12 = objc_msgSend(objc_msgSend(a3, "metalContext"), "currentBuffer");
  v13 = v9;
  self->_fragmentInput[(_QWORD)v12].percent = v13;
  objc_msgSend(a4, "setFragmentBytes:length:atIndex:");
  objc_msgSend(a4, "setFragmentTexture:atIndex:", v11, 0);
  objc_msgSend(a4, "setFragmentTexture:atIndex:", v10, 1);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalDrawBuffer, "drawWithEncoder:atIndex:", a4, 0);
}

- (void)renderFrameWithContext:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = objc_msgSend(a3, "metalContext");
  v6 = objc_msgSend(v5, "device");
  v7 = objc_msgSend(v5, "commandBuffer");
  v8 = objc_msgSend(v5, "passDescriptor");
  v9 = objc_msgSend(v5, "renderEncoder");
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"), 219, CFSTR("invalid nil value for '%s'"), "device");
    if (v7)
    {
LABEL_3:
      if (v8)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"), 221, CFSTR("invalid nil value for '%s'"), "passDescriptor");
      if (v9)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"), 222, CFSTR("invalid nil value for '%s'"), "renderEncoder");
      goto LABEL_5;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionDroplet renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionDroplet.m"), 220, CFSTR("invalid nil value for '%s'"), "commandBuffer");
  if (!v8)
    goto LABEL_8;
LABEL_4:
  if (!v9)
    goto LABEL_9;
LABEL_5:
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_rippleShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v9, self->_anon_70, self->_anon_b0);
  -[KNTransitionDroplet p_drawWithMetalContext:renderEncoder:](self, "p_drawWithMetalContext:renderEncoder:", a3, v9);
}

@end
