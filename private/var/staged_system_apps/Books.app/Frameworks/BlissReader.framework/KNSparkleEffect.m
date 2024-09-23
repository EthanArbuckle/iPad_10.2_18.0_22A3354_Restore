@implementation KNSparkleEffect

- (void)setupEffectIfNecessary
{
  id v3;
  TSDMetalContext *metalContext;
  id v5;
  CGDataProvider *v6;
  CGImage *v7;
  TSDTexturedRectangle *v8;
  id v9;
  TSDTexturedRectangle *texture;
  double v11;
  double v12;
  double v13;
  double v14;
  TSDGPUDataBufferAttribute *v15;
  TSDGPUDataBufferAttribute *v16;
  NSArray *v17;
  TSDMetalContext *v18;
  NSArray *objectBufferAttributes;
  id v20;
  _QWORD v21[2];

  if (!self->_isSetup)
  {
    v3 = objc_msgSend(KNBundle(), "pathForResource:ofType:", CFSTR("KNBuildSparkle"), CFSTR("png"));
    metalContext = self->_metalContext;
    if (metalContext)
    {
      v5 = -[TSDMetalContext device](metalContext, "device");
      v6 = CGDataProviderCreateWithCFData((CFDataRef)+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));
      v7 = CGImageCreateWithPNGDataProvider(v6, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v6);
      v8 = (TSDTexturedRectangle *)objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v7);
      self->_sparkleTexturedRect = v8;
      -[TSDTexturedRectangle setupMetalTextureForDevice:](v8, "setupMetalTextureForDevice:", v5);
      CGImageRelease(v7);
      v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
      objc_msgSend(v9, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
      objc_msgSend(v9, "setBlendingEnabled:", 1);
      objc_msgSend(v9, "setDestinationRGBBlendFactor:", 5);
      objc_msgSend(v9, "setDestinationAlphaBlendFactor:", 5);
      self->_objectMTLShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v5, v9);
      self->_sparkleMTLShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildSparkleVertexShader"), CFSTR("buildSparkleFragmentShader"), v5, CFSTR("KeynoteMetalLibrary"), v9);
      texture = self->_texture;
      -[KNAnimationContext slideRect](self->_animationContext, "slideRect");
      self->_sparkleSystem = (KNBuildSparkleSystem *)-[KNSparkleEffect p_sparkleSystemForTR:slideRect:duration:direction:randomGenerator:](self, "p_sparkleSystemForTR:slideRect:duration:direction:randomGenerator:", texture, self->_direction, -[KNSparkleEffect randomGenerator](self, "randomGenerator"), v11, v12, v13, v14, self->_duration);
    }
    v15 = +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePosition, 35040, 5, 0, 2);
    v16 = +[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeTexCoord, 35040, 5, 0, 2);
    v21[0] = v15;
    v21[1] = v16;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2);
    self->_objectBufferAttributes = v17;
    self->_objectPositionAttributeIndex = -[NSArray indexOfObject:](v17, "indexOfObject:", v15);
    self->_objectTexCoordAttributeIndex = -[NSArray indexOfObject:](self->_objectBufferAttributes, "indexOfObject:", v16);
    v18 = self->_metalContext;
    if (v18)
    {
      objectBufferAttributes = self->_objectBufferAttributes;
      v20 = -[TSDMetalContext device](v18, "device");
      self->_objectMTLDataBuffer = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", objectBufferAttributes, v20, TSDGPUDataBufferMeshSizeDefault[0], TSDGPUDataBufferMeshSizeDefault[1]);
    }
    self->_isSetup = 1;
  }
}

- (id)p_sparkleSystemForTR:(id)a3 slideRect:(CGRect)a4 duration:(double)a5 direction:(unint64_t)a6 randomGenerator:(id)a7
{
  double height;
  double width;
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
  id v24;

  if (!self->_metalContext)
    return 0;
  height = a4.size.height;
  width = a4.size.width;
  v14 = self->_destinationRect.size.width;
  v15 = self->_destinationRect.size.height;
  if (v14 >= a4.size.width)
    v14 = a4.size.width;
  v16 = v14 / a4.size.width;
  if (v15 >= a4.size.height)
    v15 = a4.size.height;
  v17 = (2.0 - sqrt(v16 * v15 / a4.size.height)) * 0.5 * 1500.0 * a5;
  -[TSDTexturedRectangle size](self->_sparkleTexturedRect, "size");
  v19 = v18;
  v21 = v20;
  objc_msgSend(a3, "size");
  v24 = +[KNBuildSparkleSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildSparkleSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", a6, a7, self->_sparkleMTLShader, self->_metalContext, v19, v21, (double)(unint64_t)v17, 1.0, v22, v23, width, height, *(_QWORD *)&a5);
  -[TSDTexturedRectangle size](self->_sparkleTexturedRect, "size");
  objc_msgSend(v24, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0);
  return v24;
}

- (KNSparkleEffect)initWithAnimationContext:(id)a3 texture:(id)a4 destinationRect:(CGRect)a5 translate:(CATransform3D *)a6 duration:(double)a7 direction:(unint64_t)a8 buildType:(int)a9 metalContext:(id)a10 randomGenerator:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  KNSparkleEffect *v22;
  KNSparkleEffect *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)KNSparkleEffect;
  v22 = -[KNSparkleEffect init](&v31, "init");
  v23 = v22;
  if (v22)
  {
    v22->_texture = (TSDTexturedRectangle *)a4;
    v22->_destinationRect.origin.x = x;
    v22->_destinationRect.origin.y = y;
    v22->_destinationRect.size.width = width;
    v22->_destinationRect.size.height = height;
    v22->_duration = a7;
    v22->_direction = a8;
    v22->_buildType = a9;
    v24 = *(_OWORD *)&a6->m11;
    v25 = *(_OWORD *)&a6->m13;
    v26 = *(_OWORD *)&a6->m23;
    *(_OWORD *)&v22->_translate.m21 = *(_OWORD *)&a6->m21;
    *(_OWORD *)&v22->_translate.m23 = v26;
    *(_OWORD *)&v22->_translate.m11 = v24;
    *(_OWORD *)&v22->_translate.m13 = v25;
    v27 = *(_OWORD *)&a6->m31;
    v28 = *(_OWORD *)&a6->m33;
    v29 = *(_OWORD *)&a6->m43;
    *(_OWORD *)&v22->_translate.m41 = *(_OWORD *)&a6->m41;
    *(_OWORD *)&v22->_translate.m43 = v29;
    *(_OWORD *)&v22->_translate.m31 = v27;
    *(_OWORD *)&v22->_translate.m33 = v28;
    v22->_animationContext = (KNAnimationContext *)a3;
    if (!a10)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"), 371, CFSTR("invalid nil value for '%s'"), "metalContext");
    v23->_metalContext = (TSDMetalContext *)a10;
    if (!a11)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"), 373, CFSTR("invalid nil value for '%s'"), "randomGenerator");
    v23->_randomGenerator = (KNAnimationRandomGenerator *)a11;
    -[KNSparkleEffect setupEffectIfNecessary](v23, "setupEffectIfNecessary");
  }
  return v23;
}

- (void)renderEffectAtPercent:(double)a3
{
  -[KNSparkleEffect p_renderEffectAtPercent:withContext:](self, "p_renderEffectAtPercent:withContext:", 0, a3);
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  -[KNSparkleEffect p_renderEffectAtPercent:withContext:](self, "p_renderEffectAtPercent:withContext:", a4, a3);
}

- (void)p_renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  TSDTexturedRectangle *texture;
  unint64_t direction;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double duration;
  double v18;
  BOOL v19;
  double v20;
  int buildType;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  _OWORD *v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float v47;
  float *v48;
  double v49;
  id v50;
  id v51;
  double v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  double v60;
  float64x2_t v61;
  double v62;
  _QWORD v63[4];
  __int128 v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;

  texture = self->_texture;
  direction = self->_direction;
  v9 = direction & 0xFFFFFFFFFFFFFFFELL;
  v10 = direction - 11;
  v53 = *(float64x2_t *)&self->_translate.m11;
  v54 = *(float64x2_t *)&self->_translate.m21;
  v58 = *(float64x2_t *)&self->_translate.m23;
  v59 = *(float64x2_t *)&self->_translate.m33;
  v55 = *(float64x2_t *)&self->_translate.m31;
  v56 = *(float64x2_t *)&self->_translate.m13;
  v61 = *(float64x2_t *)&self->_translate.m43;
  v57 = *(float64x2_t *)&self->_translate.m41;
  -[TSDTexturedRectangle singleTextureOpacity](texture, "singleTextureOpacity");
  v60 = v11;
  v12 = -0.2 / self->_duration;
  -[TSDTexturedRectangle size](texture, "size");
  v14 = v13;
  -[TSDTexturedRectangle size](texture, "size");
  v16 = v15;
  duration = self->_duration;
  v18 = -0.667 / duration + 1.0;
  v19 = duration <= 0.75;
  v20 = 0.110666667;
  if (!v19)
    v20 = v18;
  v62 = a3;
  buildType = self->_buildType;
  v22 = a3 / v20 + v12;
  v23 = 0.0;
  v24 = TSUClamp(v22, 0.0, 1.0);
  if (buildType == 2)
  {
    if (v9 != 12 && v10 >= 2)
      v26 = v16;
    else
      v26 = 0.0;
    if (v10 <= 1)
    {
      if (v9 != 12)
      {
        v36 = v14 * v24;
        v34 = 0.0;
        v23 = 1.0;
        v37 = v22;
        v30 = v36;
        v31 = TSUClamp(v37, 0.0, 1.0);
        v28 = 1.0;
        v26 = 0.0;
        goto LABEL_33;
      }
      v27 = v14 - v14 * v24;
      v28 = 1.0;
      v29 = v22;
      v30 = v27;
      v31 = 1.0 - TSUClamp(v29, 0.0, 1.0);
      goto LABEL_27;
    }
    if (v9 == 12)
    {
      v16 = v16 - v16 * v24;
      v31 = 1.0;
      v28 = 1.0 - TSUClamp(v22, 0.0, 1.0);
LABEL_30:
      v34 = 0.0;
      v30 = v14;
      goto LABEL_31;
    }
    v16 = v16 * v24;
    v34 = 1.0;
    v28 = TSUClamp(v22, 0.0, 1.0);
    v31 = 1.0;
    v30 = v14;
  }
  else
  {
    if (v9 == 12 && v10 < 2)
      v23 = v14;
    if (v10 <= 1)
    {
      if (v9 == 12)
      {
        v33 = v14 - v14 * v24;
        v34 = 0.0;
        v35 = v22;
        v30 = v33;
        v31 = 1.0 - TSUClamp(v35, 0.0, 1.0);
        v28 = 1.0;
        v26 = 0.0;
        v14 = v23;
        v23 = 1.0;
        goto LABEL_33;
      }
      v38 = v14 * v24;
      v23 = 0.0;
      v28 = 1.0;
      v39 = v22;
      v30 = v38;
      v31 = TSUClamp(v39, 0.0, 1.0);
LABEL_27:
      v34 = 0.0;
LABEL_31:
      v26 = 0.0;
      goto LABEL_32;
    }
    if (v9 != 12)
    {
      v16 = v16 * v24;
      v23 = 0.0;
      v31 = 1.0;
      v28 = TSUClamp(v22, 0.0, 1.0);
      goto LABEL_30;
    }
    v52 = v16 - v16 * v24;
    v23 = 0.0;
    v34 = 1.0;
    v28 = 1.0 - TSUClamp(v22, 0.0, 1.0);
    v31 = 1.0;
    v30 = v14;
    v26 = v16;
    v16 = v52;
  }
LABEL_32:
  v14 = 0.0;
LABEL_33:
  v40 = objc_msgSend(a4, "currentBuffer");
  v41 = objc_msgSend(a4, "renderEncoder");
  v42 = (_OWORD *)((char *)self + 64 * (_QWORD)v40);
  v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v53), v56);
  v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54), v58);
  v45 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v55), v59);
  v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v61);
  v42[20] = v43;
  v42[21] = v44;
  v42[22] = v45;
  v42[23] = v46;
  v47 = v60;
  v48 = (float *)((char *)self + 4 * (_QWORD)v40);
  v48[128] = v47;
  *(float32x4_t *)&self->_sparkleVertexInput.Percent = v43;
  *(float32x4_t *)&self->_anon_ec[4] = v44;
  *(float32x4_t *)&self->_anon_ec[20] = v45;
  *(float32x4_t *)&self->_anon_ec[36] = v46;
  v43.f32[0] = v62;
  *(_DWORD *)&self->_anon_ec[52] = v43.i32[0];
  *(float *)&self->_anon_ec[56] = v47;
  -[KNBuildSparkleSystem speedMax](self->_sparkleSystem, "speedMax");
  *(float *)&v49 = v49;
  *(_DWORD *)&self->_anon_ec[60] = LODWORD(v49);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1876C8;
  v63[3] = &unk_42A688;
  v64 = *(_OWORD *)&self->_objectPositionAttributeIndex;
  v65 = v14;
  v66 = v26;
  v67 = v30;
  v68 = v16;
  v69 = v23;
  v70 = v34;
  v71 = v31;
  v72 = v28;
  -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_objectMTLDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_objectBufferAttributes, v63);
  v50 = -[TSDTexturedRectangle metalTextureWithContext:](texture, "metalTextureWithContext:", a4);
  if (v50)
  {
    v51 = v50;
    objc_msgSend(v41, "setFragmentTexture:atIndex:", 0, 1);
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_objectMTLShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v41, v42 + 20, v48 + 128);
    objc_msgSend(v41, "setFragmentTexture:atIndex:", v51, 0);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_objectMTLDataBuffer, "drawWithEncoder:atIndex:", v41, 0);
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_sparkleMTLShader, "setPipelineStateWithEncoder:vertexBytes:", v41, &self->_sparkleVertexInput);
    objc_msgSend(v41, "setFragmentTexture:atIndex:", -[TSDTexturedRectangle metalTexture](self->_sparkleTexturedRect, "metalTexture"), 0);
    -[KNBuildSparkleSystem drawMetalWithEncoder:](self->_sparkleSystem, "drawMetalWithEncoder:", v41);
    self->_objectBufferAttributes = (NSArray *)-[NSArray copy](self->_objectBufferAttributes, "copy");
  }
}

- (void)teardown
{
  self->_objectBufferAttributes = 0;
  self->_sparkleSystem = 0;
  self->_sparkleMTLShader = 0;
  self->_objectMTLShader = 0;
  self->_objectMTLDataBuffer = 0;
  self->_isSetup = 0;
  -[TSDTexturedRectangle teardown](self->_sparkleTexturedRect, "teardown");
  self->_sparkleTexturedRect = 0;
  self->_effect = 0;
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

- (KNAnimationRandomGenerator)randomGenerator
{
  return self->_randomGenerator;
}

- (void)setRandomGenerator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

@end
