@implementation KNWipeBase

- (KNWipeBase)initWithAnimationContext:(id)a3
{
  KNWipeBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KNWipeBase;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v5, "initWithAnimationContext:", a3);
  if (v3)
    v3->_parameterGroup = (KNAnimParameterGroup *)+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", objc_msgSend(KNBundle(), "pathForResource:ofType:", CFSTR("Wipe"), CFSTR("parameterGroup")));
  return v3;
}

+ (BOOL)isTransition
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNWipeBase isTransition]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"), 62, CFSTR("Should be called on base class!"));
  return 0;
}

- (void)p_teardown
{

  self->mWipeDataBuffer = 0;
  self->_quadMetalShader = 0;
  self->_quadDataBuffer = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[KNWipeBase p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)KNWipeBase;
  -[KNWipeBase dealloc](&v3, "dealloc");
}

+ (id)animationName
{
  return CFSTR("apple:wipe");
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
  return &off_469898;
}

+ (unint64_t)directionType
{
  return 0;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  KNWipeDataBuffer *v12;
  KNWipeDataBuffer *mWipeDataBuffer;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  _OWORD v17[8];
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v5 = objc_msgSend(a3, "textures");
  v6 = objc_msgSend(a3, "direction");
  v7 = (uint64_t)v6;
  if (self->_isBuildOut)
    v7 = sub_85EB8((uint64_t)v6);
  v8 = objc_msgSend(v5, "firstObject");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", a3);
  v9 = objc_msgSend(a3, "metalContext");
  v10 = objc_msgSend(v9, "device");
  v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v11, "setPixelFormat:", objc_msgSend(v9, "pixelFormat"));
  objc_msgSend(v11, "setBlendingEnabled:", 1);
  objc_msgSend(v11, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v11, "setDestinationAlphaBlendFactor:", 5);
  v12 = +[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:](KNWipeDataBuffer, "newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:", v9, v11, TSDRectWithSize(objc_msgSend(v8, "frame")));
  self->mWipeDataBuffer = v12;
  -[KNWipeDataBuffer setDirection:](v12, "setDirection:", v7);
  -[KNWipeDataBuffer setBlurFraction:](self->mWipeDataBuffer, "setBlurFraction:", *(double *)&kKNWipeDataBufferBlurFractionTransitionDefault);
  mWipeDataBuffer = self->mWipeDataBuffer;
  v17[4] = v22;
  v17[5] = v23;
  v17[6] = v24;
  v17[7] = v25;
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v17[3] = v21;
  -[KNWipeDataBuffer setMVPMatrix:](mWipeDataBuffer, "setMVPMatrix:", v17);
  v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
  v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v23);
  v16 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v25);
  *(float32x4_t *)self->_anon_20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
  *(float32x4_t *)&self->_anon_20[16] = v14;
  *(float32x4_t *)&self->_anon_20[32] = v15;
  *(float32x4_t *)&self->_anon_20[48] = v16;
  if (objc_msgSend(a3, "isTransition"))
  {
    self->_quadDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, TSDRectWithSize(objc_msgSend(v8, "frame")));
    self->_quadMetalShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v10, v11);
  }
}

- (void)renderFrameWithContext:(id)a3
{
  id v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  KNWipeDataBuffer *mWipeDataBuffer;
  double v18;

  v5 = objc_msgSend(a3, "textures");
  objc_msgSend(a3, "percent");
  if (self->_isBuildOut)
    v7 = 1.0 - v6;
  else
    v7 = v6;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
    v8 = 0;
  else
    v8 = objc_msgSend(v5, "objectAtIndex:", 0);
  v9 = objc_msgSend(v5, "lastObject");
  v10 = objc_msgSend(a3, "metalContext");
  v11 = objc_msgSend(v10, "device");
  v12 = objc_msgSend(v10, "commandBuffer");
  v13 = objc_msgSend(v10, "passDescriptor");
  v14 = objc_msgSend(v10, "renderEncoder");
  if (v11)
  {
    if (v12)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"), 200, CFSTR("invalid nil value for '%s'"), "device");
    if (v12)
    {
LABEL_9:
      if (v13)
        goto LABEL_10;
LABEL_17:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"), 202, CFSTR("invalid nil value for '%s'"), "passDescriptor");
      if (v14)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"), 201, CFSTR("invalid nil value for '%s'"), "commandBuffer");
  if (!v13)
    goto LABEL_17;
LABEL_10:
  if (v14)
    goto LABEL_11;
LABEL_18:
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeBase renderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionWipe.m"), 203, CFSTR("invalid nil value for '%s'"), "renderEncoder");
LABEL_11:
  v15 = objc_msgSend(v9, "metalTexture");
  v16 = objc_msgSend(v8, "metalTexture");
  if (objc_msgSend(a3, "isTransition"))
  {
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v14, self->_anon_20);
    objc_msgSend(v14, "setFragmentTexture:atIndex:", v16, 0);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_quadDataBuffer, "drawWithEncoder:atIndex:", v14, 0);
  }
  if (v15)
  {
    objc_msgSend(v14, "setFragmentTexture:atIndex:", v15, 0);
    mWipeDataBuffer = self->mWipeDataBuffer;
    objc_msgSend(v9, "singleTextureOpacity");
    -[KNWipeDataBuffer drawWipeWithPercent:opacity:renderEncoder:](mWipeDataBuffer, "drawWipeWithPercent:opacity:renderEncoder:", v14, v7, v18);
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  if (a8 <= 0x174876E7FFLL && a7)
  {
    v11 = CFSTR("KNTransitionAttributesDirection");
    if (objc_msgSend(*a3, "objectForKey:", CFSTR("KNTransitionAttributesDirection"), a4, a5, *(_QWORD *)&a6, a7)
      || objc_msgSend(*a3, "objectForKey:", CFSTR("KNBuildAttributesDirection")))
    {
      if (a6 != 3)
        v11 = CFSTR("KNBuildAttributesDirection");
      v12 = (unint64_t)objc_msgSend(objc_msgSend(*a3, "objectForKey:", v11), "unsignedIntegerValue") - 21;
      if (v12 > 6)
        v13 = 11;
      else
        v13 = qword_314130[v12];
      if (a6 == 2)
        v13 = sub_85EB8(v13);
      v14 = objc_msgSend(*a3, "mutableCopy");
      objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13), v11);
      *a3 = v14;
    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  BOOL v8;
  char *v11;
  uint64_t v12;
  id v13;

  v8 = a8 > 0x174876E7FFLL || !a7;
  if (!v8 && objc_msgSend(*a3, "objectForKey:", CFSTR("direction"), a4, a5, *(_QWORD *)&a6, a7))
  {
    v11 = (char *)objc_msgSend(objc_msgSend(*a3, "objectForKey:", CFSTR("direction")), "unsignedIntegerValue");
    if (a6 == 2)
      v11 = (char *)sub_85EB8((uint64_t)v11);
    if ((unint64_t)(v11 - 12) > 0xC)
      v12 = 20;
    else
      v12 = qword_314168[(_QWORD)(v11 - 12)];
    v13 = objc_msgSend(*a3, "mutableCopy");
    objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12), CFSTR("direction"));
    *a3 = v13;
  }
}

@end
