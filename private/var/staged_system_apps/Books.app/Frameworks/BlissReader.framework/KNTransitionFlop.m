@implementation KNTransitionFlop

- (KNTransitionFlop)initWithAnimationContext:(id)a3
{
  KNTransitionFlop *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionFlop;
  result = -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
  if (result)
    result->_numPoints = 13;
  return result;
}

- (void)p_teardown
{
  NSArray *colorBufferAttributes;
  NSArray *shadowBufferAttributes;
  TSDMetalShader *quadMetalShader;
  TSDMTLDataBuffer *metalOutgoingQuadDataBuffer;
  TSDMTLDataBuffer *metalIncomingQuadDataBuffer;
  TSDMetalShader *colorMetalShader;
  TSDMTLDataBuffer *metalColorDataBuffer;
  TSDMetalShader *shadowMetalShader;
  TSDMTLDataBuffer *metalShadowDataBuffer;

  colorBufferAttributes = self->_colorBufferAttributes;
  self->_colorBufferAttributes = 0;

  shadowBufferAttributes = self->_shadowBufferAttributes;
  self->_shadowBufferAttributes = 0;

  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = 0;

  metalOutgoingQuadDataBuffer = self->_metalOutgoingQuadDataBuffer;
  self->_metalOutgoingQuadDataBuffer = 0;

  metalIncomingQuadDataBuffer = self->_metalIncomingQuadDataBuffer;
  self->_metalIncomingQuadDataBuffer = 0;

  colorMetalShader = self->_colorMetalShader;
  self->_colorMetalShader = 0;

  metalColorDataBuffer = self->_metalColorDataBuffer;
  self->_metalColorDataBuffer = 0;

  shadowMetalShader = self->_shadowMetalShader;
  self->_shadowMetalShader = 0;

  metalShadowDataBuffer = self->_metalShadowDataBuffer;
  self->_metalShadowDataBuffer = 0;

}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.BUKFlop");
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
  return &off_4697F0;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNTransitionAttributesDuration");
  v4 = &off_468F28;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-trans-flop");
}

- (void)createArrays:(id)a3 context:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *colorBufferAttributes;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSArray *v24;
  NSArray *shadowBufferAttributes;
  TSDMTLDataBuffer *v26;
  TSDMTLDataBuffer *metalShadowDataBuffer;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  int64_t numPoints;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  TSDMTLDataBuffer *v40;
  TSDMTLDataBuffer *metalColorDataBuffer;
  unsigned __int8 v42;
  unint64_t colorPositionAttributeIndex;
  unint64_t colorTexCoordAttributeIndex;
  unint64_t colorNormalAttributeIndex;
  unint64_t colorPrevPositionAttributeIndex;
  _QWORD *v47;
  int *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  int64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  unsigned __int8 v61;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (self->_metalColorDataBuffer)
      goto LABEL_29;
    v49 = v8;
    v11 = 35048;
  }
  else
  {
    v49 = v8;
    v11 = 35044;
  }
  v48 = (int *)objc_msgSend(v9, "direction");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = kTSDGPUShaderAttributePosition;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePosition, 35048, 5, 0, 3));
  objc_msgSend(v12, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeTexCoord, v11, 3, 1, 2));
  objc_msgSend(v12, "addObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeNormal, 35048, 3, 1, 3));
  objc_msgSend(v12, "addObject:", v16);
  if (objc_msgSend(v9, "isMotionBlurred"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePreviousPosition, 35048, 5, 0, 3));
    objc_msgSend(v12, "addObject:", v17);
  }
  else
  {
    v17 = 0;
  }
  v18 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v12);
  colorBufferAttributes = self->_colorBufferAttributes;
  self->_colorBufferAttributes = v18;

  self->_colorPositionAttributeIndex = -[NSArray indexOfObject:](self->_colorBufferAttributes, "indexOfObject:", v14);
  self->_colorTexCoordAttributeIndex = -[NSArray indexOfObject:](self->_colorBufferAttributes, "indexOfObject:", v15);
  self->_colorNormalAttributeIndex = -[NSArray indexOfObject:](self->_colorBufferAttributes, "indexOfObject:", v16);
  self->_colorPrevPositionAttributeIndex = -[NSArray indexOfObject:](self->_colorBufferAttributes, "indexOfObject:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", v13, 35048, 5, 0, 2));
  objc_msgSend(v20, "addObject:", v21);
  if (v10)
    v22 = 5;
  else
    v22 = 2;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Alpha"), 35048, v22, 1, 1));
  objc_msgSend(v20, "addObject:", v23);
  v24 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v20);
  shadowBufferAttributes = self->_shadowBufferAttributes;
  self->_shadowBufferAttributes = v24;

  self->_shadowPositionAttributeIndex = -[NSArray indexOfObject:](self->_shadowBufferAttributes, "indexOfObject:", v21);
  self->_shadowAlphaAttributeIndex = -[NSArray indexOfObject:](self->_shadowBufferAttributes, "indexOfObject:", v23);

  if (v10)
  {
    v26 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", self->_shadowBufferAttributes, 2 * self->_numPoints, 0, v10);
    metalShadowDataBuffer = self->_metalShadowDataBuffer;
    self->_metalShadowDataBuffer = v26;

  }
  v8 = v49;
  objc_msgSend(v49, "size");
  v29 = v28;
  objc_msgSend(v49, "size");
  v31 = (unint64_t)v48 - 13;
  v32 = v29 * 0.5;
  if (v48 == (int *)((char *)&dword_C + 1))
    v33 = v30 * 0.5;
  else
    v33 = 0.0;
  if (v31 < 2)
    v30 = v30 * 0.5;
  numPoints = self->_numPoints;
  if (v31 >= 2)
    v35 = v29 * 0.5;
  else
    v35 = v29;
  v36 = (double)(numPoints - 1);
  v37 = v35 / v36;
  v38 = v30 / v36;
  if (v48 == &dword_C)
    v39 = v32;
  else
    v39 = 0.0;
  if (v10)
  {
    v40 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:meshSize:device:", self->_colorBufferAttributes, v10, (double)numPoints, (double)numPoints);
    metalColorDataBuffer = self->_metalColorDataBuffer;
    self->_metalColorDataBuffer = v40;

  }
  v42 = objc_msgSend(v9, "isMotionBlurred");
  colorPositionAttributeIndex = self->_colorPositionAttributeIndex;
  colorTexCoordAttributeIndex = self->_colorTexCoordAttributeIndex;
  colorNormalAttributeIndex = self->_colorNormalAttributeIndex;
  colorPrevPositionAttributeIndex = self->_colorPrevPositionAttributeIndex;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_20660;
  v50[3] = &unk_427510;
  v52 = colorPositionAttributeIndex;
  v53 = colorTexCoordAttributeIndex;
  v61 = v42;
  v54 = colorNormalAttributeIndex;
  v55 = colorPrevPositionAttributeIndex;
  v56 = numPoints;
  v57 = v37;
  v58 = v39;
  v59 = v38;
  v60 = v33;
  v51 = v49;
  v47 = objc_retainBlock(v50);
  if (v10)
    -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_metalColorDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_colorBufferAttributes, v47);

LABEL_29:
}

- (void)_updateFlop:(id)a3 withContext:(id)a4 dataBuffer:(id)a5 isUpdating:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  int64_t numPoints;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "percent");
  v14 = v13;
  v15 = objc_msgSend(v11, "direction");
  objc_msgSend(v10, "size");
  v17 = v16 * 0.5;
  objc_msgSend(v10, "size");
  v19 = v18 * 0.5;
  objc_msgSend(v10, "size");
  v21 = v20;
  objc_msgSend(v10, "size");
  numPoints = self->_numPoints;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_20A74;
  v27[3] = &unk_427538;
  v27[4] = self;
  v28 = v11;
  v31 = v21;
  v32 = v23;
  v33 = v15;
  v34 = v17;
  v35 = v19;
  v36 = v14 * 3.14159265;
  v37 = v14 * (v14 * v14) * 3.14159265;
  v38 = v14;
  v39 = a6;
  v29 = v10;
  v30 = numPoints;
  v24 = v10;
  v25 = v11;
  v26 = objc_retainBlock(v27);
  objc_msgSend(v12, "updateMetalDataBufferAttributes:withBlock:", self->_colorBufferAttributes, v26);

}

- (void)_updateShadowWithTexture:(id)a3 percent:(double)a4 direction:(unint64_t)a5 shadowBuffer:(id)a6 currentBuffer:(unint64_t)a7
{
  unint64_t v12;
  int64_t numPoints;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t shadowPositionAttributeIndex;
  double v32;
  unint64_t shadowAlphaAttributeIndex;
  _QWORD *v34;
  _QWORD v35[16];
  BOOL v36;
  BOOL v37;

  v12 = a5 - 11;
  numPoints = self->_numPoints;
  v14 = a6;
  v15 = a3;
  objc_msgSend(v15, "size");
  v17 = v16;
  objc_msgSend(v15, "size");
  v19 = v18;

  if (v12 >= 2)
  {
    v26 = ceil(v19 * 0.5 * 0.02);
    v27 = v19 * 0.5 - v26;
    v22 = 0.0;
    v28 = v19 * 0.5 + v26;
    if (a5 == 13)
      v25 = v28;
    else
      v25 = v27;
    if (a5 == 13)
      v23 = -1.0;
    else
      v23 = 1.0;
    if (a5 == 13)
      v19 = v28;
    else
      v19 = v27;
  }
  else
  {
    v20 = ceil(v17 * 0.5 * 0.02);
    v21 = v17 * 0.5 - v20;
    v22 = -1.0;
    v23 = 1.0;
    v24 = v17 * 0.5 + v20;
    if (a5 == 12)
      v25 = v24;
    else
      v25 = v21;
    if (a5 == 12)
      v17 = v24;
    else
      v17 = v21;
  }
  v29 = v25 / 5.0;
  v30 = TSUSineMap(a4);
  shadowPositionAttributeIndex = self->_shadowPositionAttributeIndex;
  v32 = self->_shadowUmbra[a7];
  shadowAlphaAttributeIndex = self->_shadowAlphaAttributeIndex;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_212CC;
  v35[3] = &unk_427558;
  v35[4] = shadowPositionAttributeIndex;
  v35[5] = shadowAlphaAttributeIndex;
  *(double *)&v35[6] = a4;
  *(double *)&v35[7] = a4 * 0.2 * a4 + 0.8;
  v36 = v12 < 2;
  *(double *)&v35[8] = v17;
  *(double *)&v35[9] = v19;
  v37 = a5 == 11;
  *(double *)&v35[10] = a4 * 0.3 + 0.5;
  *(double *)&v35[11] = v22;
  *(double *)&v35[12] = v32;
  *(double *)&v35[13] = v23;
  v35[14] = numPoints;
  *(double *)&v35[15] = v29 * v30 * a4;
  v34 = objc_retainBlock(v35);
  objc_msgSend(v14, "updateMetalDataBufferAttributes:withBlock:", self->_shadowBufferAttributes, v34);

}

- (void)updateFlopAndShadowMeshesWithTexture:(id)a3 context:(id)a4 flopBuffer:(id)a5 shadowBuffer:(id)a6 isUpdating:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id v18;

  v7 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[KNTransitionFlop _updateFlop:withContext:dataBuffer:isUpdating:](self, "_updateFlop:withContext:dataBuffer:isUpdating:", v14, v13, a5, v7);
  objc_msgSend(v13, "percent");
  v16 = v15;
  v17 = objc_msgSend(v13, "direction");
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metalContext"));

  -[KNTransitionFlop _updateShadowWithTexture:percent:direction:shadowBuffer:currentBuffer:](self, "_updateShadowWithTexture:percent:direction:shadowBuffer:currentBuffer:", v14, v17, v12, objc_msgSend(v18, "currentBuffer"), v16);
}

- (void)p_metalAnimationWillBeginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  TSDMetalShader *v11;
  TSDMetalShader *quadMetalShader;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double width;
  double y;
  double height;
  double x;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  TSDMTLDataBuffer *v31;
  TSDMTLDataBuffer *metalOutgoingQuadDataBuffer;
  TSDMTLDataBuffer *v33;
  TSDMTLDataBuffer *metalIncomingQuadDataBuffer;
  TSDMetalShader *v35;
  TSDMetalShader *shadowMetalShader;
  id v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  TSDMetalMotionBlurEffect *v50;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  unsigned int v52;
  __CFString *v53;
  __CFString *v54;
  unsigned int v55;
  __CFString *v56;
  __CFString *v57;
  TSDMetalShader *v58;
  TSDMetalShader *colorMetalShader;
  float32x4_t v60;
  KNAnimationContext *mAnimationContext;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  TSDMetalMotionBlurEffect *v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  float64x2_t *v73;
  float32x2_t v74;
  float32x2_t v75;
  float32x2_t v76;
  float64_t v77;
  float64x2_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  CGAffineTransform v83;
  CGAffineTransform v84;
  CGAffineTransform v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  CGAffineTransform v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));

  v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  objc_msgSend(v9, "setPixelFormat:", objc_msgSend(v10, "pixelFormat"));

  v11 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v8, v9);
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v11;

  v13 = objc_msgSend(v4, "direction");
  objc_msgSend(v6, "frame");
  v18 = v16;
  v19 = v17;
  switch((unint64_t)v13)
  {
    case 0xBuLL:
      v20 = 0.49;
      v21 = v14;
      v14 = v14 + v16 * 0.49;
      width = 0.51;
      v18 = v16 * 0.51;
      y = 0.0;
      height = 1.0;
      x = 0.0;
      v26 = 0.0;
      goto LABEL_5;
    case 0xCuLL:
      width = 0.51;
      x = 0.49;
      v21 = v14 + v16 * 0.49;
      v18 = v16 * 0.51;
      y = 0.0;
      height = 1.0;
      v26 = 0.0;
      v20 = 0.0;
LABEL_5:
      v30 = v15;
      break;
    case 0xDuLL:
      height = 0.51;
      y = 0.49;
      v30 = v15 + v17 * 0.49;
      v19 = v17 * 0.51;
      x = 0.0;
      width = 1.0;
      v26 = 0.0;
      goto LABEL_8;
    case 0xEuLL:
      v26 = 0.49;
      v30 = v15;
      v15 = v15 + v17 * 0.49;
      height = 0.51;
      v19 = v17 * 0.51;
      y = 0.0;
      width = 1.0;
      x = 0.0;
LABEL_8:
      v20 = 0.0;
      v21 = v14;
      break;
    default:
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionFlop p_metalAnimationWillBeginWithContext:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionFlop.m"));
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 609, CFSTR("Unknown direction!"));

      v26 = y;
      v20 = CGRectZero.origin.x;
      v18 = width;
      v30 = y;
      v21 = CGRectZero.origin.x;
      v19 = height;
      v15 = y;
      v14 = CGRectZero.origin.x;
      break;
  }
  if (!self->_metalOutgoingQuadDataBuffer)
  {
    v31 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8, v14, v15, v18, v19, v20, v26, width, height);
    metalOutgoingQuadDataBuffer = self->_metalOutgoingQuadDataBuffer;
    self->_metalOutgoingQuadDataBuffer = v31;

    v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8, v21, v30, v18, v19, x, y, width, height);
    metalIncomingQuadDataBuffer = self->_metalIncomingQuadDataBuffer;
    self->_metalIncomingQuadDataBuffer = v33;

  }
  objc_msgSend(v9, "setBlendingEnabled:", 1, v14, v15);
  objc_msgSend(v9, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v9, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v9, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v9, "setDestinationAlphaBlendFactor:", 5);
  v35 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionFlopShadowVertexShader"), CFSTR("transitionFlopShadowFragmentShader"), v8, CFSTR("KeynoteMetalLibrary"), v9);
  shadowMetalShader = self->_shadowMetalShader;
  self->_shadowMetalShader = v35;

  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    v37 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    objc_msgSend(v37, "setPixelFormat:", objc_msgSend(v38, "pixelFormat"));

    objc_msgSend(v9, "setBlendingEnabled:", 0);
    v39 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v41 = v40;
    v43 = v42;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v45 = v44;
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "randomGenerator"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v50 = (TSDMetalMotionBlurEffect *)objc_msgSend(v39, "initWithFramebufferSize:slideSize:randomGenerator:metalContext:", v48, v49, v41, v43, v45, v47);
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v50;

    -[TSDMetalMotionBlurEffect setIsSingleObject:](self->_motionBlurMetalEffect, "setIsSingleObject:", 1);
  }
  else
  {
    v37 = 0;
  }
  v52 = objc_msgSend(v4, "isMotionBlurred");
  v53 = CFSTR("transitionFlopVertexShader");
  if (v52)
    v53 = CFSTR("transitionFlopMBVertexShader");
  v54 = v53;
  v55 = objc_msgSend(v4, "isMotionBlurred");
  v56 = CFSTR("transitionFlopFragmentShader");
  if (v55)
    v56 = CFSTR("transitionFlopMBFragmentShader");
  v57 = v56;
  v58 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", v54, v57, v8, CFSTR("KeynoteMetalLibrary"), v9, v37);

  colorMetalShader = self->_colorMetalShader;
  self->_colorMetalShader = v58;

  -[KNTransitionFlop createArrays:context:device:](self, "createArrays:context:device:", v6, v4, v8);
  v60 = 0uLL;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
  {
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
    v62 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v103), v104);
    v63 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v101), v102);
    v64 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v99), v100);
    v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v97), v98);
  }
  else
  {
    v64 = 0uLL;
    v63 = 0uLL;
    v62 = 0uLL;
  }
  *(float32x4_t *)self->_anon_a0 = v60;
  *(float32x4_t *)&self->_anon_a0[16] = v64;
  *(float32x4_t *)&self->_anon_a0[32] = v63;
  *(float32x4_t *)&self->_anon_a0[48] = v62;
  *(float32x4_t *)self->_anon_e0 = v60;
  *(float32x4_t *)&self->_anon_e0[16] = v64;
  *(float32x4_t *)&self->_anon_e0[32] = v63;
  *(float32x4_t *)&self->_anon_e0[48] = v62;
  if (objc_msgSend(v4, "isMotionBlurred", *(_OWORD *)&v62, *(_OWORD *)&v63, *(_OWORD *)&v64, *(_OWORD *)&v60))
  {
    v65 = self->_motionBlurMetalEffect;
    if (v65)
    {
      v87 = v101;
      v88 = v102;
      v89 = v103;
      v90 = v104;
      *(float64x2_t *)&v85.a = v97;
      *(float64x2_t *)&v85.c = v98;
      *(float64x2_t *)&v85.tx = v99;
      v86 = v100;
      -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](v65, "adjustTransformForMotionBlurBuffer:", &v85);
    }
    else
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v92 = 0u;
      memset(&v91, 0, sizeof(v91));
    }
    v97 = *(float64x2_t *)&v91.a;
    v98 = *(float64x2_t *)&v91.c;
    v103 = v95;
    v104 = v96;
    v101 = v93;
    v102 = v94;
    v99 = *(float64x2_t *)&v91.tx;
    v100 = v92;
    v66 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v91.a), *(float64x2_t *)&v91.c);
    v67 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v91.tx), v92);
    v69 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v93), v94);
    v68 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v95), v96);
  }
  else
  {
    v67 = v81;
    v66 = v82;
    v68 = v79;
    v69 = v80;
  }
  *(float32x4_t *)self->_anon_120 = v66;
  *(float32x4_t *)&self->_anon_120[16] = v67;
  *(float32x4_t *)&self->_anon_120[32] = v69;
  *(float32x4_t *)&self->_anon_120[48] = v68;
  *(float32x4_t *)self->_anon_1a0 = v66;
  *(float32x4_t *)&self->_anon_1a0[16] = v67;
  *(float32x4_t *)&self->_anon_1a0[32] = v69;
  *(float32x4_t *)&self->_anon_1a0[48] = v68;
  v70 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
  v71 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.c);
  v72 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
  *(_DWORD *)&self->_anon_120[72] = 0;
  *(float32x2_t *)&self->_anon_120[64] = v70;
  *(_DWORD *)&self->_anon_120[88] = 0;
  *(float32x2_t *)&self->_anon_120[80] = v71;
  *(_DWORD *)&self->_anon_120[104] = 1065353216;
  *(float32x2_t *)&self->_anon_120[96] = v72;
  v73 = (float64x2_t *)&v85;
  if (objc_msgSend(v4, "direction") != (char *)&dword_C + 1 && objc_msgSend(v4, "direction") != (char *)&dword_C + 2)
    v73 = (float64x2_t *)&v91;
  memset(&v91, 0, sizeof(v91));
  CGAffineTransformMakeScale(&v91, -1.0, 1.0);
  v84 = v91;
  CGAffineTransformTranslate(&v85, &v84, -1.0, 0.0);
  v91 = v85;
  memset(&v85, 0, sizeof(v85));
  CGAffineTransformMakeScale(&v85, 1.0, -1.0);
  v83 = v85;
  CGAffineTransformTranslate(&v84, &v83, 0.0, -1.0);
  v85 = v84;
  v74 = vcvt_f32_f64(*v73);
  v75 = vcvt_f32_f64(v73[1]);
  v76 = vcvt_f32_f64(v73[2]);
  *(_DWORD *)&self->_anon_1a0[72] = 0;
  *(float32x2_t *)&self->_anon_1a0[64] = v74;
  *(_DWORD *)&self->_anon_1a0[88] = 0;
  *(float32x2_t *)&self->_anon_1a0[80] = v75;
  *(_DWORD *)&self->_anon_1a0[104] = 1065353216;
  *(float32x2_t *)&self->_anon_1a0[96] = v76;
  *(_DWORD *)&self->_anon_120[120] = 1065353216;
  *(_DWORD *)&self->_anon_1a0[120] = -1082130432;
  if (objc_msgSend(v4, "isMotionBlurred"))
  {
    -[TSDMetalMotionBlurEffect velocityScale](self->_motionBlurMetalEffect, "velocityScale");
    v78.f64[1] = v77;
    *(float32x2_t *)&v78.f64[0] = vcvt_f32_f64(v78);
    *(float64_t *)&self->_anon_120[112] = v78.f64[0];
    *(float64_t *)&self->_anon_1a0[112] = v78.f64[0];
  }

}

- (void)animationWillBeginWithContext:(id)a3
{
  -[KNTransitionFlop p_metalAnimationWillBeginWithContext:](self, "p_metalAnimationWillBeginWithContext:", a3);
}

- (void)p_drawFlopVertical:(BOOL)a3 encoder:(id)a4 metalTexture:(id)a5 oldMetalTexture:(id)a6 isUpdating:(BOOL)a7
{
  _BOOL8 v7;
  TSDMetalShader *colorMetalShader;
  unsigned __int8 *anon_1a0;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  colorMetalShader = self->_colorMetalShader;
  anon_1a0 = self->_anon_1a0;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](colorMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v15, anon_1a0);
  objc_msgSend(v15, "setCullMode:", 1);
  objc_msgSend(v15, "setFragmentTexture:atIndex:", v14, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:advanceDynamicBuffer:](self->_metalColorDataBuffer, "drawWithEncoder:atIndex:advanceDynamicBuffer:", v15, 0, 0);
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_colorMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v15, self->_anon_120);
  objc_msgSend(v15, "setCullMode:", 2);
  objc_msgSend(v15, "setFragmentTexture:atIndex:", v13, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:advanceDynamicBuffer:](self->_metalColorDataBuffer, "drawWithEncoder:atIndex:advanceDynamicBuffer:", v15, 0, v7);
}

- (void)p_metalRenderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  _BOOL8 v20;
  double v21;
  double v22;
  TSDMTLDataBuffer **p_metalShadowDataBuffer;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  void *v25;
  uint64_t v26;
  TSDMetalMotionBlurEffect *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id v31;

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "metalContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionFlop p_metalRenderFrameWithContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionFlop.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 742, CFSTR("invalid nil value for '%s'"), "workingEncoder");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "textures"));
  v10 = (char *)objc_msgSend(v31, "direction");
  objc_msgSend(v31, "percent");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "metalContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metalTextureWithContext:", v14));

  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v18 = 0;
    v16 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "metalContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metalTextureWithContext:", v17));

    if (v18 && v15)
    {
      objc_msgSend(v31, "percent");
      v30 = v4;
      if (v19 == self->_lastUpdatePercent)
      {
        objc_msgSend(v31, "percent");
        v20 = v21 == 0.0;
      }
      else
      {
        v20 = 1;
      }
      objc_msgSend(v31, "percent");
      self->_lastUpdatePercent = v22;
      p_metalShadowDataBuffer = &self->_metalShadowDataBuffer;
      v29 = v20;
      -[KNTransitionFlop updateFlopAndShadowMeshesWithTexture:context:flopBuffer:shadowBuffer:isUpdating:](self, "updateFlopAndShadowMeshesWithTexture:context:flopBuffer:shadowBuffer:isUpdating:", v13, v31, self->_metalColorDataBuffer, self->_metalShadowDataBuffer, v20);
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v5, self->_anon_e0);
      if (v12 <= 0.7)
      {
        objc_msgSend(v5, "setFragmentTexture:atIndex:", v15, 0);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalIncomingQuadDataBuffer, "drawWithEncoder:atIndex:", v5, 0);
        objc_msgSend(v5, "setVertexBytes:length:atIndex:", self->_anon_e0, 64, 1);
        objc_msgSend(v5, "setFragmentTexture:atIndex:", v18, 0);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalOutgoingQuadDataBuffer, "drawWithEncoder:atIndex:", v5, 0);
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_shadowMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v5, self->_anon_a0);
      }
      else
      {
        objc_msgSend(v5, "setFragmentTexture:atIndex:", v18, 0);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalOutgoingQuadDataBuffer, "drawWithEncoder:atIndex:", v5, 0);
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_shadowMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v5, self->_anon_a0);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](*p_metalShadowDataBuffer, "drawWithEncoder:atIndex:", v5, 0);
        -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v5, self->_anon_e0);
        objc_msgSend(v5, "setFragmentTexture:atIndex:", v15, 0);
        p_metalShadowDataBuffer = &self->_metalIncomingQuadDataBuffer;
      }
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](*p_metalShadowDataBuffer, "drawWithEncoder:atIndex:", v5, 0);
      if (objc_msgSend(v31, "isMotionBlurred"))
      {
        motionBlurMetalEffect = self->_motionBlurMetalEffect;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "metalContext"));
        v26 = objc_claimAutoreleasedReturnValue(-[TSDMetalMotionBlurEffect bindColorAndVelocityWithMetalContext:shouldFillBackground:](motionBlurMetalEffect, "bindColorAndVelocityWithMetalContext:shouldFillBackground:", v25, 0));

        v5 = (void *)v26;
      }
      v4 = v30;
      -[KNTransitionFlop p_drawFlopVertical:encoder:metalTexture:oldMetalTexture:isUpdating:](self, "p_drawFlopVertical:encoder:metalTexture:oldMetalTexture:isUpdating:", (unint64_t)(v10 - 13) < 2, v5, v15, v18, v29);
      if (objc_msgSend(v31, "isMotionBlurred"))
      {
        v27 = self->_motionBlurMetalEffect;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "renderEncoder"));
        -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:](v27, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:", v5, v28);

        v4 = v30;
      }
    }
  }

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNTransitionFlop p_metalRenderFrameWithContext:](self, "p_metalRenderFrameWithContext:", a3);
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  id v9;
  void *v10;
  id v11;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    v9 = objc_msgSend(*a3, "mutableCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 13));
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("direction"));

    v11 = objc_retainAutorelease(v9);
    *a3 = v11;

  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  id v14;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction"), a4, a5));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction")));
      v11 = (char *)objc_msgSend(v10, "unsignedIntegerValue");

      if (v11 == (_BYTE *)&dword_C + 2)
      {
        v12 = objc_msgSend(*a3, "mutableCopy");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 13));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("direction"));

        v14 = objc_retainAutorelease(v12);
        *a3 = v14;

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShadowDataBuffer, 0);
  objc_storeStrong((id *)&self->_shadowMetalShader, 0);
  objc_storeStrong((id *)&self->_metalColorDataBuffer, 0);
  objc_storeStrong((id *)&self->_colorMetalShader, 0);
  objc_storeStrong((id *)&self->_metalIncomingQuadDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalOutgoingQuadDataBuffer, 0);
  objc_storeStrong((id *)&self->_quadMetalShader, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
  objc_storeStrong((id *)&self->_shadowBufferAttributes, 0);
  objc_storeStrong((id *)&self->_colorBufferAttributes, 0);
}

@end
