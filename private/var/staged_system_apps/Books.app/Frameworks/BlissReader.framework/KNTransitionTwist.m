@implementation KNTransitionTwist

- (KNTransitionTwist)initWithAnimationContext:(id)a3
{
  KNTransitionTwist *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionTwist;
  result = -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
  if (result)
    result->_numPoints = 19;
  return result;
}

- (void)p_teardown
{
  TSDMTLDataBuffer *metalDataBuffer;
  TSDMetalShader *metalShader;

  metalDataBuffer = self->_metalDataBuffer;
  self->_metalDataBuffer = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;

}

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.BUKTwist");
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
  return &off_469808;
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *bufferAttributes;
  TSDMTLDataBuffer *v19;
  TSDMTLDataBuffer *metalDataBuffer;
  double v21;
  double v22;
  id v23;
  int64_t numPoints;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t positionAttributeIndex;
  unint64_t texCoordAttributeIndex;
  unint64_t normalAttributeIndex;
  unint64_t prevPositionAttributeIndex;
  double v33;
  _QWORD *v34;
  void *v35;
  _QWORD v36[12];
  unsigned __int8 v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (self->_metalDataBuffer)
      goto LABEL_12;
    v11 = 35048;
  }
  else
  {
    v11 = 35044;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePosition, 35048, 5, 0, 3));
  objc_msgSend(v12, "addObject:", v13);
  self->_positionAttributeIndex = (unint64_t)objc_msgSend(v12, "indexOfObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeTexCoord, v11, 3, 1, 2));
  objc_msgSend(v12, "addObject:", v14);
  self->_texCoordAttributeIndex = (unint64_t)objc_msgSend(v12, "indexOfObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeNormal, 35048, 3, 1, 3));
  objc_msgSend(v12, "addObject:", v15);
  self->_normalAttributeIndex = (unint64_t)objc_msgSend(v12, "indexOfObject:", v15);

  if (objc_msgSend(v9, "isMotionBlurred"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePreviousPosition, 35048, 5, 0, 3));
    objc_msgSend(v12, "addObject:", v16);
    self->_prevPositionAttributeIndex = (unint64_t)objc_msgSend(v12, "indexOfObject:", v16);

  }
  v17 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v12);
  bufferAttributes = self->_bufferAttributes;
  self->_bufferAttributes = v17;

  if (v10)
  {
    v19 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_bufferAttributes, v10, (double)self->_numPoints, (double)self->_numPoints);
    metalDataBuffer = self->_metalDataBuffer;
    self->_metalDataBuffer = v19;

  }
  objc_msgSend(v8, "size", v9);
  v22 = v21;
  v23 = v8;
  objc_msgSend(v8, "size");
  numPoints = self->_numPoints;
  v25 = (double)(numPoints - 1);
  v26 = v22 / v25;
  v28 = v27 / v25;
  positionAttributeIndex = self->_positionAttributeIndex;
  texCoordAttributeIndex = self->_texCoordAttributeIndex;
  normalAttributeIndex = self->_normalAttributeIndex;
  prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  v33 = 1.0 / v25;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_23C5C;
  v36[3] = &unk_427578;
  v36[4] = positionAttributeIndex;
  v36[5] = texCoordAttributeIndex;
  v37 = objc_msgSend(v35, "isMotionBlurred");
  v36[6] = normalAttributeIndex;
  v36[7] = prevPositionAttributeIndex;
  v36[8] = numPoints;
  *(double *)&v36[9] = v26;
  *(double *)&v36[10] = v28;
  *(double *)&v36[11] = v33;
  v34 = objc_retainBlock(v36);
  if (v10)
    -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_metalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_bufferAttributes, v34);

  v8 = v23;
  v9 = v35;
LABEL_12:

}

- (void)drawGrid:(id)a3 encoder:(id)a4 currentBuffer:(unint64_t)a5 advanceDynamicBuffer:(BOOL)a6
{
  _BOOL8 v6;
  id v10;

  v6 = a6;
  v10 = a4;
  objc_msgSend(v10, "setFragmentTexture:atIndex:", a3, 0);
  objc_msgSend(v10, "setVertexBytes:length:atIndex:", (char *)&self[1] + 128 * a5, 128, 1);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:advanceDynamicBuffer:](self->_metalDataBuffer, "drawWithEncoder:atIndex:advanceDynamicBuffer:", v10, 0, v6);

}

- (double)fx:(double)a3 withPercent:(double)a4
{
  double v4;
  double v5;
  double v6;

  v4 = (self->_twistyness + -1.0) / 9.0 + 0.25;
  v5 = (v4 + 1.0) * a4 - v4 * a3;
  v6 = 0.0;
  if (v5 >= 0.0 && (v6 = 1.0, v5 <= 1.0))
    return TSUSineMap(v5);
  else
    return v6;
}

- (void)update:(id)a3 withContext:(id)a4 isUpdating:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double v13;
  double v14;
  int64_t numPoints;
  unint64_t positionAttributeIndex;
  unint64_t texCoordAttributeIndex;
  unint64_t normalAttributeIndex;
  unint64_t prevPositionAttributeIndex;
  _QWORD *v20;
  _QWORD v21[12];
  char v22;
  BOOL v23;
  BOOL v24;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "percent");
  v11 = v10;
  v12 = (char *)objc_msgSend(v8, "direction");
  objc_msgSend(v9, "size");
  v14 = v13;

  numPoints = self->_numPoints;
  positionAttributeIndex = self->_positionAttributeIndex;
  texCoordAttributeIndex = self->_texCoordAttributeIndex;
  normalAttributeIndex = self->_normalAttributeIndex;
  prevPositionAttributeIndex = self->_prevPositionAttributeIndex;
  LOBYTE(v9) = objc_msgSend(v8, "isMotionBlurred");

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_240FC;
  v21[3] = &unk_4275A0;
  v21[6] = texCoordAttributeIndex;
  v21[7] = normalAttributeIndex;
  v22 = (char)v9;
  v21[8] = prevPositionAttributeIndex;
  v21[9] = numPoints;
  v21[4] = self;
  v21[5] = positionAttributeIndex;
  v23 = v12 == (_BYTE *)&dword_8 + 3;
  v21[10] = v11;
  *(double *)&v21[11] = v14 * 0.5;
  v24 = a5;
  v20 = objc_retainBlock(v21);
  -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_metalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_bufferAttributes, v20);

}

- (void)p_drawTwistWithPercent:(double)a3 currentBuffer:(unint64_t)a4 texture:(id)a5 oldTexture:(id)a6 encoder:(id)a7 isMotionBlurred:(BOOL)a8 isUpdating:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64_t v24;
  float64x2_t v25;
  float32x2_t *v26;
  float64x2_t v27;
  float32x2_t v28;
  float64x2_t v29;
  float32x2_t v30;
  float64x2_t v31;
  float32x2_t v32;
  float64x2_t v33;
  float32x2_t v34;
  float64x2_t v35;
  float32x2_t v36;
  float64x2_t v37;
  float32x2_t v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  v9 = a9;
  v10 = a8;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 1.0, -1.0);
  v39 = v41;
  CGAffineTransformTranslate(&v40, &v39, 0.0, -1.0);
  v41 = v40;
  v18 = *(float64x2_t *)&v40.a;
  v19 = *(float64x2_t *)&v40.c;
  v20 = *(float64x2_t *)&v40.tx;
  v21 = *(float64x2_t *)&CGAffineTransformIdentity.a;
  v22 = *(float64x2_t *)&CGAffineTransformIdentity.c;
  v23 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  if (v10)
  {
    v35 = *(float64x2_t *)&v41.c;
    v37 = *(float64x2_t *)&v40.a;
    v31 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    v33 = *(float64x2_t *)&v40.tx;
    v27 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
    v29 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    -[TSDMetalMotionBlurEffect velocityScale](self->_motionBlurMetalEffect, "velocityScale");
    v22 = v29;
    v21 = v31;
    v20 = v33;
    v19 = v35;
    v25.f64[1] = v24;
    v18 = v37;
    *((float32x2_t *)&self[2].super.super.isa + 16 * a4) = vcvt_f32_f64(v25);
    v23 = v27;
  }
  v32 = vcvt_f32_f64(v23);
  v30 = vcvt_f32_f64(v22);
  v38 = vcvt_f32_f64(v20);
  v36 = vcvt_f32_f64(v19);
  v34 = vcvt_f32_f64(v18);
  objc_msgSend(v17, "popDebugGroup", vcvt_f32_f64(v21), *(_QWORD *)&v23.f64[1]);
  objc_msgSend(v17, "pushDebugGroup:", CFSTR("KNTransitionTwist Draw Front"));
  objc_msgSend(v17, "setCullMode:", 1);
  v26 = (float32x2_t *)((char *)&self[1] + 128 * a4);
  v26[15].i32[1] = 1065353216;
  v26[8] = v28;
  v26[9] = 0;
  v26[10] = v30;
  v26[11] = 0;
  v26[12] = v32;
  v26[13] = (float32x2_t)1065353216;
  -[KNTransitionTwist drawGrid:encoder:currentBuffer:advanceDynamicBuffer:](self, "drawGrid:encoder:currentBuffer:advanceDynamicBuffer:", v15, v17, a4, 0);
  objc_msgSend(v17, "pushDebugGroup:", CFSTR("KNTransitionTwist Draw Back"));
  objc_msgSend(v17, "setCullMode:", 2);
  v26[15].i32[1] = -1082130432;
  v26[8] = v34;
  v26[9] = 0;
  v26[10] = v36;
  v26[11] = 0;
  v26[12] = v38;
  v26[13] = (float32x2_t)1065353216;
  -[KNTransitionTwist drawGrid:encoder:currentBuffer:advanceDynamicBuffer:](self, "drawGrid:encoder:currentBuffer:advanceDynamicBuffer:", v16, v17, a4, v9);

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  KNAnimationContext *mAnimationContext;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  TSDMetalMotionBlurEffect *v26;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  TSDMetalMotionBlurEffect *v28;
  void *v29;
  unsigned int v30;
  __CFString *v31;
  __CFString *v32;
  unsigned int v33;
  __CFString *v34;
  __CFString *v35;
  TSDMetalShader *v36;
  TSDMetalShader *metalShader;
  uint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t *v43;
  uint64_t v44;
  void *v45;
  _OWORD v46[8];
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;

  v4 = a3;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
  self->_twistyness = 3.3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.iWork.Keynote.BUKTwist.twist")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.iWork.Keynote.BUKTwist.twist")));
    objc_msgSend(v7, "doubleValue");
    self->_twistyness = v8;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
  v11 = objc_msgSend(v9, "pixelFormat");
  v12 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v12, "setPixelFormat:", v11);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v14 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v14, "setPixelFormat:", v11);
    v15 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v17 = v16;
    v19 = v18;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v26 = (TSDMetalMotionBlurEffect *)objc_msgSend(v15, "initWithFramebufferSize:slideSize:randomGenerator:metalContext:", v24, v25, v17, v19, v21, v23);
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v26;

    v28 = self->_motionBlurMetalEffect;
    if (v28)
    {
      v46[4] = v59;
      v46[5] = v60;
      v46[6] = v61;
      v46[7] = v62;
      v46[0] = v55;
      v46[1] = v56;
      v46[2] = v57;
      v46[3] = v58;
      -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](v28, "adjustTransformForMotionBlurBuffer:", v46);
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
    }
    v29 = (void *)v44;
    v59 = v51;
    v60 = v52;
    v61 = v53;
    v62 = v54;
    v55 = v47;
    v56 = v48;
    v57 = v49;
    v58 = v50;
  }
  else
  {
    v14 = 0;
    v29 = (void *)v44;
  }
  v30 = objc_msgSend(v4, "isMotionBlurred");
  v31 = CFSTR("transitionTwistVertexShader");
  if (v30)
    v31 = CFSTR("transitionTwistMBVertexShader");
  v32 = v31;
  v33 = objc_msgSend(v4, "isMotionBlurred");
  v34 = CFSTR("transitionTwistFragmentShader");
  if (v33)
    v34 = CFSTR("transitionTwistMBFragmentShader");
  v35 = v34;
  v36 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", v32, v35, v10, CFSTR("KeynoteMetalLibrary"), v12, v14);
  metalShader = self->_metalShader;
  self->_metalShader = v36;

  -[KNTransitionTwist createArrays:context:device:](self, "createArrays:context:device:", v29, v4, v10);
  v38 = 0;
  v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v55), v56);
  v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
  v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
  do
  {
    v43 = (float32x4_t *)((char *)&self[1]._positionAttributeIndex + v38);
    v43[-2] = v39;
    v43[-1] = v40;
    *v43 = v41;
    v43[1] = v42;
    v38 += 128;
  }
  while (v38 != 384);

}

- (void)renderFrameWithContext:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL8 v17;
  double v18;
  double v19;
  float v20;
  void *v21;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  void *v23;
  uint64_t v24;
  void *v25;
  TSDMetalMotionBlurEffect *v26;
  void *v27;
  id v28;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textures"));
  objc_msgSend(v28, "percent");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metalContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderEncoder"));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionTwist renderFrameWithContext:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionTwist.m"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 501, CFSTR("invalid nil value for '%s'"), "workingEncoder");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metalTextureWithContext:", v7));

  if (v13)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metalTextureWithContext:", v7));
    }
    objc_msgSend(v28, "percent");
    if (v16 == self->_lastUpdatePercent)
    {
      objc_msgSend(v28, "percent");
      v17 = v18 == 0.0;
    }
    else
    {
      v17 = 1;
    }
    objc_msgSend(v28, "percent");
    self->_lastUpdatePercent = v19;
    -[KNTransitionTwist update:withContext:isUpdating:](self, "update:withContext:isUpdating:", v14, v28, v17);
    v20 = TSUSineMap(self->_lastUpdatePercent + self->_lastUpdatePercent) * 0.5;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metalContext"));
    *((float *)&self[2].super.mAnimationContext + 32 * (_QWORD)objc_msgSend(v21, "currentBuffer")) = v20;

    if (objc_msgSend(v28, "isMotionBlurred"))
    {
      motionBlurMetalEffect = self->_motionBlurMetalEffect;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metalContext"));
      v24 = objc_claimAutoreleasedReturnValue(-[TSDMetalMotionBlurEffect bindColorAndVelocityWithMetalContext:shouldFillBackground:](motionBlurMetalEffect, "bindColorAndVelocityWithMetalContext:shouldFillBackground:", v23, 0));

      v8 = (void *)v24;
    }
    -[TSDMetalShader setPipelineStateWithEncoder:](self->_metalShader, "setPipelineStateWithEncoder:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metalContext"));
    -[KNTransitionTwist p_drawTwistWithPercent:currentBuffer:texture:oldTexture:encoder:isMotionBlurred:isUpdating:](self, "p_drawTwistWithPercent:currentBuffer:texture:oldTexture:encoder:isMotionBlurred:isUpdating:", objc_msgSend(v25, "currentBuffer"), v13, v15, v8, objc_msgSend(v28, "isMotionBlurred"), v17, v6);

    if (objc_msgSend(v28, "isMotionBlurred"))
    {
      v26 = self->_motionBlurMetalEffect;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderEncoder"));
      -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:](v26, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:", v8, v27);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_bufferAttributes, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
}

@end
