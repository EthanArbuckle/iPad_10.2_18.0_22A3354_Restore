@implementation KNTransitionPageFlip

- (KNTransitionPageFlip)initWithAnimationContext:(id)a3
{
  KNTransitionPageFlip *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionPageFlip;
  result = -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
  if (result)
    result->_numPoints = 30;
  return result;
}

- (void)p_teardown
{
  NSArray *dataBufferAttributes;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  TSDMetalShader *pageFlipMetalShader;
  TSDMetalShader *quadMetalShader;
  TSDMTLDataBuffer *pageFlipMetalDataBuffer;
  TSDMTLDataBuffer *quadMetalDatabuffer;

  dataBufferAttributes = self->_dataBufferAttributes;
  self->_dataBufferAttributes = 0;

  motionBlurMetalEffect = self->_motionBlurMetalEffect;
  self->_motionBlurMetalEffect = 0;

  pageFlipMetalShader = self->_pageFlipMetalShader;
  self->_pageFlipMetalShader = 0;

  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = 0;

  pageFlipMetalDataBuffer = self->_pageFlipMetalDataBuffer;
  self->_pageFlipMetalDataBuffer = 0;

  quadMetalDatabuffer = self->_quadMetalDatabuffer;
  self->_quadMetalDatabuffer = 0;

}

+ (id)animationName
{
  return CFSTR("apple:pageflip");
}

+ (int)animationCategory
{
  return 202;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469B08;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-trans-pageFlip");
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *dataBufferAttributes;
  int *v19;
  TSDMTLDataBuffer *v20;
  TSDMTLDataBuffer *pageFlipMetalDataBuffer;
  TSDMTLDataBuffer *v22;
  TSDMTLDataBuffer *quadMetalDatabuffer;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  unint64_t positionAttributeIndex;
  unint64_t texCoordAttributeIndex;
  unint64_t normalAttributeIndex;
  unint64_t prevPositionAttributeIndex;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[13];
  unsigned __int8 v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (self->_pageFlipMetalDataBuffer)
      goto LABEL_13;
    v11 = 35048;
  }
  else
  {
    v11 = 35044;
  }
  v37 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePosition, 35048, 5, 0, 3));
  objc_msgSend(v12, "addObject:", v13);
  v14 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeTexCoord, v11, 3, 1, 2));
  objc_msgSend(v12, "addObject:", v14);
  v15 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeNormal, 35048, 3, 1, 3));
  objc_msgSend(v12, "addObject:", v15);
  if (objc_msgSend(v9, "isMotionBlurred"))
  {
    v16 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePreviousPosition, 35048, 5, 0, 3));
    objc_msgSend(v12, "addObject:", v16);
  }
  else
  {
    v16 = 0;
  }
  v17 = (NSArray *)objc_msgSend(v12, "copy");
  dataBufferAttributes = self->_dataBufferAttributes;
  self->_dataBufferAttributes = v17;

  v41 = (void *)v13;
  self->_positionAttributeIndex = -[NSArray indexOfObject:](self->_dataBufferAttributes, "indexOfObject:", v13);
  v39 = (void *)v15;
  self->_normalAttributeIndex = -[NSArray indexOfObject:](self->_dataBufferAttributes, "indexOfObject:", v15);
  v40 = (void *)v14;
  self->_texCoordAttributeIndex = -[NSArray indexOfObject:](self->_dataBufferAttributes, "indexOfObject:", v14);
  v38 = (void *)v16;
  self->_prevPositionAttributeIndex = -[NSArray indexOfObject:](self->_dataBufferAttributes, "indexOfObject:", v16);
  v19 = &OBJC_IVAR___THWScrollableCanvasController__delegate;
  v8 = v37;
  if (v10)
  {
    v20 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_dataBufferAttributes, v10, (double)self->_numPoints, (double)self->_numPoints);
    pageFlipMetalDataBuffer = self->_pageFlipMetalDataBuffer;
    self->_pageFlipMetalDataBuffer = v20;

    v19 = &OBJC_IVAR___THWScrollableCanvasController__delegate;
    v22 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, TSDRectWithSize(objc_msgSend(v37, "size")));
    quadMetalDatabuffer = self->_quadMetalDatabuffer;
    self->_quadMetalDatabuffer = v22;

  }
  objc_msgSend(v37, "size");
  v25 = v24;
  objc_msgSend(v37, "size");
  v27 = v26;
  v28 = *(uint64_t *)((char *)&self->super.super.isa + v19[341]);
  v29 = (double)(v28 - 1);
  v30 = v25 / v29;
  v31 = v26 / v29;
  positionAttributeIndex = self->_positionAttributeIndex;
  texCoordAttributeIndex = self->_texCoordAttributeIndex;
  normalAttributeIndex = self->_normalAttributeIndex;
  prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1B242C;
  v42[3] = &unk_42B148;
  v42[4] = positionAttributeIndex;
  v42[5] = texCoordAttributeIndex;
  v43 = objc_msgSend(v9, "isMotionBlurred");
  v42[6] = normalAttributeIndex;
  v42[7] = prevPositionAttributeIndex;
  v42[8] = v28;
  *(double *)&v42[9] = v30;
  *(double *)&v42[10] = v31;
  *(double *)&v42[11] = v25;
  *(double *)&v42[12] = v27;
  v36 = objc_retainBlock(v42);
  if (v10)
    -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_pageFlipMetalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_dataBufferAttributes, v36);

LABEL_13:
}

- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  char *v12;
  int64_t numPoints;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __double2 v20;
  __double2 v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  unint64_t positionAttributeIndex;
  unint64_t normalAttributeIndex;
  unint64_t texCoordAttributeIndex;
  unint64_t prevPositionAttributeIndex;
  _QWORD *v32;
  double v33;
  double v34;
  _QWORD v35[22];
  unsigned __int8 v36;
  BOOL v37;
  BOOL v38;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "percent");
  v11 = v10;
  v12 = (char *)objc_msgSend(v8, "direction");
  numPoints = self->_numPoints;
  v14 = 3.14159265;
  v34 = v11;
  v15 = (v11 + sin((v11 + -1.0) * 3.14159265 * 0.5) + 1.0) * 0.5;
  v16 = 1.0 - v15;
  if (v12 == (_BYTE *)&dword_C + 1)
  {
    v17 = 1.57079633;
    goto LABEL_5;
  }
  if (v12 == (_BYTE *)&dword_C + 2)
  {
    v17 = -1.57079633;
LABEL_5:
    v18 = v17 + v16 * 0.785398163;
    goto LABEL_7;
  }
  v18 = v16 * -0.785398163;
LABEL_7:
  v19 = fmax(v15 * -0.200000003 * 2.0 + 0.5, 0.200000003);
  if (v15 * 6.28318531 <= 3.14159265)
    v14 = v15 * 6.28318531;
  v33 = (v15 * -2.0 + 1.0) * 1.2;
  v20 = __sincos_stret(v18);
  v21 = __sincos_stret(v14);
  v22 = v14 * v19;
  objc_msgSend(v9, "size");
  v24 = v23;
  objc_msgSend(v9, "size");
  v26 = v25;

  v27 = v12 == (_BYTE *)&dword_8 + 3;
  positionAttributeIndex = self->_positionAttributeIndex;
  normalAttributeIndex = self->_normalAttributeIndex;
  texCoordAttributeIndex = self->_texCoordAttributeIndex;
  prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1B2944;
  v35[3] = &unk_42B168;
  v35[4] = positionAttributeIndex;
  v35[5] = normalAttributeIndex;
  v36 = objc_msgSend(v8, "isMotionBlurred");
  v35[6] = prevPositionAttributeIndex;
  v35[7] = numPoints;
  v37 = v27;
  v35[8] = *(_QWORD *)&v20.__cosval;
  v35[9] = *(_QWORD *)&v20.__sinval;
  *(double *)&v35[10] = v33;
  *(double *)&v35[11] = v22;
  *(double *)&v35[12] = 1.0 / v19;
  *(double *)&v35[13] = v19;
  *(double *)&v35[14] = v19 * (1.0 - v21.__cosval);
  v35[15] = *(_QWORD *)&v21.__sinval;
  *(double *)&v35[16] = v19 * v21.__sinval;
  v35[17] = *(_QWORD *)&v21.__cosval;
  v35[18] = v26;
  v35[19] = v24;
  *(double *)&v35[20] = v34;
  v38 = a5;
  v35[21] = texCoordAttributeIndex;
  v32 = objc_retainBlock(v35);
  -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_pageFlipMetalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_dataBufferAttributes, v32);

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  TSDMetalMotionBlurEffect *v18;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  void *v20;
  id v21;
  TSDMetalShader *v22;
  TSDMetalShader *quadMetalShader;
  id v24;
  unsigned int v25;
  __CFString *v26;
  __CFString *v27;
  unsigned int v28;
  __CFString *v29;
  __CFString *v30;
  TSDMetalShader *v31;
  TSDMetalShader *pageFlipMetalShader;
  KNAnimationContext *mAnimationContext;
  TSDMetalMotionBlurEffect *v34;
  uint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  __int128 v40;
  float32x2_t v41;
  float64x2_t v47;
  unsigned __int8 *anon_60;
  unsigned __int8 *v49;
  KNAnimationContext *v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  void *v55;
  void *v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  _OWORD v65[8];
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;

  v4 = a3;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v7 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v9 = v8;
    v11 = v10;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v18 = (TSDMetalMotionBlurEffect *)objc_msgSend(v7, "initWithFramebufferSize:slideSize:randomGenerator:metalContext:", v16, v17, v9, v11, v13, v15);
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v18;

    -[TSDMetalMotionBlurEffect setIsSingleObject:](self->_motionBlurMetalEffect, "setIsSingleObject:", 1);
  }
  v20 = (void *)v5;
  v21 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v21, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  v22 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v56, v21);
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v22;

  objc_msgSend(v21, "setBlendingEnabled:", 1);
  objc_msgSend(v21, "setSourceAlphaBlendFactor:", 4);
  objc_msgSend(v21, "setSourceRGBBlendFactor:", 4);
  objc_msgSend(v21, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v21, "setDestinationAlphaBlendFactor:", 5);
  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v24 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v24, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(v4, "isMotionBlurred");
  v26 = CFSTR("transitionPageFlipVertexShader");
  if (v25)
    v26 = CFSTR("transitionPageFlipMBVertexShader");
  v27 = v26;
  v28 = objc_msgSend(v4, "isMotionBlurred");
  v29 = CFSTR("transitionPageFlipFragmentShader");
  if (v28)
    v29 = CFSTR("transitionPageFlipMBFragmentShader");
  v30 = v29;
  v31 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", v27, v30, v56, CFSTR("KeynoteMetalLibrary"), v21, v24);
  pageFlipMetalShader = self->_pageFlipMetalShader;
  self->_pageFlipMetalShader = v31;

  -[KNTransitionPageFlip createArrays:context:device:](self, "createArrays:context:device:", v20, v4, v56);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v34 = self->_motionBlurMetalEffect;
    if (v34)
    {
      v65[4] = v78;
      v65[5] = v79;
      v65[6] = v80;
      v65[7] = v81;
      v65[0] = v74;
      v65[1] = v75;
      v65[2] = v76;
      v65[3] = v77;
      -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](v34, "adjustTransformForMotionBlurBuffer:", v65);
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
    }
    v78 = v70;
    v79 = v71;
    v80 = v72;
    v81 = v73;
    v74 = v66;
    v75 = v67;
    v76 = v68;
    v77 = v69;
  }
  v35 = 0;
  v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
  v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v76), v77);
  v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v78), v79);
  v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v80), v81);
  v40 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v47 = *(float64x2_t *)&CGAffineTransformIdentity.c;
  *(float32x2_t *)&v40 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
  v41 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
  __asm { FMOV            V5.4S, #1.0 }
  *(float32x2_t *)&v47.f64[0] = vcvt_f32_f64(v47);
  anon_60 = self->_anon_60;
  do
  {
    v49 = &anon_60[v35];
    *(float32x4_t *)v49 = v36;
    *((float32x4_t *)v49 + 1) = v37;
    *((float32x4_t *)v49 + 2) = v38;
    *((float32x4_t *)v49 + 3) = v39;
    *((_QWORD *)v49 + 8) = v40;
    *(_DWORD *)&anon_60[v35 + 72] = DWORD2(v40);
    *((_DWORD *)v49 + 19) = 0;
    *((_QWORD *)v49 + 10) = *(_QWORD *)&v47.f64[0];
    *(_DWORD *)&anon_60[v35 + 88] = LODWORD(v47.f64[1]);
    *((_DWORD *)v49 + 23) = 0;
    *((float32x2_t *)v49 + 12) = v41;
    *(_DWORD *)&anon_60[v35 + 104] = DWORD2(_Q5);
    v35 += 128;
    *((_DWORD *)v49 + 27) = 0;
  }
  while (v35 != 384);
  v50 = self->super.mAnimationContext;
  if (v50)
  {
    -[KNAnimationContext slideProjectionMatrix](v50, "slideProjectionMatrix");
    v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v63), v64);
    v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
    v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
    v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  }
  else
  {
    v54 = 0uLL;
    v53 = 0uLL;
    v52 = 0uLL;
    v51 = 0uLL;
  }
  *(float32x4_t *)&self->_anon_1f0[4] = v54;
  *(float32x4_t *)&self->_anon_1f0[20] = v53;
  *(float32x4_t *)&self->_anon_1f0[36] = v52;
  *(float32x4_t *)&self->_anon_1f0[52] = v51;

}

- (void)p_drawFlipWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 encoder:(id)a6 isMotionBlurred:(BOOL)a7 isUpdating:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v14;
  double v15;
  float v16;
  $F6E301B112AC41806F6602E6564C1A72 *v17;
  float32x2_t *v18;
  float64_t v19;
  float64x2_t v20;
  id v21;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  v21 = v14;
  v15 = (a3 + -0.75) * -4.0 + 1.0;
  if (v15 > 1.0)
    v15 = 1.0;
  v16 = v15;
  v17 = &self->_fragmentInput[a4];
  v17->Opacity = v16;
  objc_msgSend(v14, "setFragmentTexture:atIndex:", a5, 0);
  objc_msgSend(v21, "setCullMode:", 2);
  v18 = (float32x2_t *)&self->_anon_60[128 * a4];
  v18[15] = (float32x2_t)0xBF80000000000000;
  if (v9)
  {
    -[TSDMetalMotionBlurEffect velocityScale](self->_motionBlurMetalEffect, "velocityScale");
    v20.f64[1] = v19;
    v18[14] = vcvt_f32_f64(v20);
  }
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_pageFlipMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v21, v18, v17);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:advanceDynamicBuffer:](self->_pageFlipMetalDataBuffer, "drawWithEncoder:atIndex:advanceDynamicBuffer:", v21, 0, 0);
  objc_msgSend(v21, "setCullMode:", 1);
  v18[15] = (float32x2_t)0x3F8000003A83126FLL;
  objc_msgSend(v21, "setVertexBytes:length:atIndex:", v18, 128, 1);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:advanceDynamicBuffer:](self->_pageFlipMetalDataBuffer, "drawWithEncoder:atIndex:advanceDynamicBuffer:", v21, 0, v8);

}

- (void)renderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  void *v15;
  uint64_t v16;
  double v17;
  _BOOL8 v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  TSDMetalMotionBlurEffect *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metalContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderEncoder"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionPageFlip renderFrameWithContext:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionPageFlip.m"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 536, CFSTR("invalid nil value for '%s'"), "workingEncoder");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metalTextureWithContext:", v5));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metalTextureWithContext:", v5));

  if (v11 && v13)
  {
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v6, &self->_anon_1f0[4]);
    objc_msgSend(v6, "setFragmentTexture:atIndex:", v11, 0);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_quadMetalDatabuffer, "drawWithEncoder:atIndex:", v6, 0);
    if (objc_msgSend(v27, "isMotionBlurred"))
    {
      motionBlurMetalEffect = self->_motionBlurMetalEffect;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metalContext"));
      v16 = objc_claimAutoreleasedReturnValue(-[TSDMetalMotionBlurEffect bindColorAndVelocityWithMetalContext:shouldFillBackground:](motionBlurMetalEffect, "bindColorAndVelocityWithMetalContext:shouldFillBackground:", v15, 0));

      v6 = (void *)v16;
    }
    objc_msgSend(v27, "percent");
    if (v17 == self->_lastUpdatePercent)
    {
      objc_msgSend(v27, "percent");
      v18 = v19 == 0.0;
    }
    else
    {
      v18 = 1;
    }
    objc_msgSend(v27, "percent");
    self->_lastUpdatePercent = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    -[KNTransitionPageFlip update:withContext:isUpdating:](self, "update:withContext:isUpdating:", v21, v27, v18);

    objc_msgSend(v27, "percent");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metalContext"));
    -[KNTransitionPageFlip p_drawFlipWithPercent:currentBuffer:texture:encoder:isMotionBlurred:isUpdating:](self, "p_drawFlipWithPercent:currentBuffer:texture:encoder:isMotionBlurred:isUpdating:", objc_msgSend(v24, "currentBuffer"), v13, v6, objc_msgSend(v27, "isMotionBlurred"), v18, v23);

    if (objc_msgSend(v27, "isMotionBlurred"))
    {
      v25 = self->_motionBlurMetalEffect;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderEncoder"));
      -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:](v25, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:", v6, v26);

    }
  }

}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNTransitionAttributesDirection"), a4, a5));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNTransitionAttributesDirection")));
      v11 = (char *)objc_msgSend(v10, "unsignedIntegerValue");

      if ((unint64_t)(v11 - 1) > 3)
        v12 = 12;
      else
        v12 = qword_3155D0[(_QWORD)(v11 - 1)];
      v13 = objc_msgSend(*a3, "mutableCopy");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("KNTransitionAttributesDirection"));

      v15 = objc_retainAutorelease(v13);
      *a3 = v15;

    }
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction"), a4, a5));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction")));
      v11 = (char *)objc_msgSend(v10, "unsignedIntegerValue");

      if ((unint64_t)(v11 - 11) > 3)
        v12 = 1;
      else
        v12 = qword_3155F0[(_QWORD)(v11 - 11)];
      v13 = objc_msgSend(*a3, "mutableCopy");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("direction"));

      v15 = objc_retainAutorelease(v13);
      *a3 = v15;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadMetalDatabuffer, 0);
  objc_storeStrong((id *)&self->_quadMetalShader, 0);
  objc_storeStrong((id *)&self->_pageFlipMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_pageFlipMetalShader, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
  objc_storeStrong((id *)&self->_dataBufferAttributes, 0);
}

@end
