@implementation KNIrisBase

+ (BOOL)isTransition
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNIrisBase isTransition]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 93, CFSTR("Should be called on base class!"));

  return 0;
}

- (KNIrisBase)initWithAnimationContext:(id)a3
{
  KNIrisBase *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNIrisBase;
  result = -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
  if (result)
    result->_numDivisionsPerQuadrant = 10;
  return result;
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)animationName
{
  return CFSTR("apple:wipe-iris");
}

+ (unint64_t)directionType
{
  return 7;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-trans-iris");
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (void)p_setupMetalShadersWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  TSDMetalShader *v7;
  TSDMetalShader *quadMetalShader;
  TSDMetalShader *v9;
  TSDMetalShader *fadeMetalShader;
  TSDMetalShader *v11;
  TSDMetalShader *opaqueMetalShader;
  id v13;

  v4 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  v6 = objc_msgSend(v4, "pixelFormat");

  objc_msgSend(v5, "setPixelFormat:", v6);
  objc_msgSend(v5, "setBlendingEnabled:", 1);
  objc_msgSend(v5, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v5, "setDestinationRGBBlendFactor:", 5);
  v7 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v13, v5);
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v7;

  v9 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionIrisVertexShader_Fade"), CFSTR("transitionIrisFragmentShader_Fade"), v13, CFSTR("KeynoteMetalLibrary"), v5);
  fadeMetalShader = self->_fadeMetalShader;
  self->_fadeMetalShader = v9;

  v11 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("transitionIrisVertexShader_Opaque"), CFSTR("transitionIrisFragmentShader_Opaque"), v13, CFSTR("KeynoteMetalLibrary"), v5);
  opaqueMetalShader = self->_opaqueMetalShader;
  self->_opaqueMetalShader = v11;

}

- (double)p_angleFromQuadrant:(unint64_t)a3 inRect:(CGRect)a4
{
  double result;

  TSDAngleFromDelta(self, a2, a4.size.width * dbl_314C80[a3 & 3], a4.size.height * dbl_314C60[a3 & 3]);
  return result;
}

- (double)p_largestDividedAngleInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 0);
  v9 = v8;
  -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 1, x, y, width, height);
  v11 = v10;
  v12 = -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 2, x, y, width, height);
  v14 = v13;
  v15 = TSDDistanceBetweenAnglesInRadians(v12, v11, v9);
  v17 = TSDDistanceBetweenAnglesInRadians(v16, v14, v11);
  if (v15 >= v17)
    v17 = v15;
  return v17 / (double)self->_numDivisionsPerQuadrant;
}

- (unint64_t)p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 minRadius:(double)a6 maxRadius:(double)a7 center:(id)a8
{
  float var1;
  float var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD v22[12];
  float v23;
  float v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  var1 = a8.var1;
  var0 = a8.var0;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_11B058;
  v22[3] = &unk_429D00;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  *(CGFloat *)&v22[8] = width;
  *(CGFloat *)&v22[9] = height;
  *(double *)&v22[10] = a6;
  *(double *)&v22[11] = a7;
  v23 = var0;
  v24 = var1;
  v25 = a5;
  v22[4] = self;
  v22[5] = &v26;
  v19 = objc_retainBlock(v22);
  -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_opaqueMetalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", v18, v19);
  v20 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (unint64_t)p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 maxRadius:(double)a6 center:(id)a7
{
  float var1;
  float var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD v19[11];
  float v20;
  float v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  var1 = a7.var1;
  var0 = a7.var0;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_11B5D8;
  v19[3] = &unk_429D28;
  *(CGFloat *)&v19[6] = x;
  *(CGFloat *)&v19[7] = y;
  *(CGFloat *)&v19[8] = width;
  *(CGFloat *)&v19[9] = height;
  *(double *)&v19[10] = a6;
  v20 = var0;
  v21 = var1;
  v19[4] = self;
  v19[5] = &v22;
  v16 = objc_retainBlock(v19);
  -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_fadeMetalDataBuffer, "updateMetalDataBufferAttributes:withBlock:", v15, v16);
  v17 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (void)p_setupDataBuffersWithFrameRect:(CGRect)a3 openFromCenter:(BOOL)a4 device:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TSDMTLDataBuffer *v14;
  TSDMTLDataBuffer *quadMetalDataBuffer;
  double v16;
  double v17;
  long double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  float v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  TSDMTLDataBuffer *v33;
  TSDMTLDataBuffer *opaqueMetalDataBuffer;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  TSDMTLDataBuffer *v39;
  TSDMTLDataBuffer *fadeMetalDataBuffer;
  double v41;
  double v42;
  unint64_t v43;
  double v44;
  double v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];

  v57 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  if (self->_initializedBuffers)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 327, CFSTR("We already initialized our data buffers!"));

  }
  if (objc_msgSend((id)objc_opt_class(self), "isTransition"))
  {
    v14 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, x, y, width, height, TSDRectUnit[0], TSDRectUnit[1], TSDRectUnit[2], TSDRectUnit[3]);
    quadMetalDataBuffer = self->_quadMetalDataBuffer;
    self->_quadMetalDataBuffer = v14;

  }
  v16 = sqrt(width * width + height * height) * 0.5;
  -[KNIrisBase p_largestDividedAngleInRect:](self, "p_largestDividedAngleInRect:", x, y, width, height);
  v18 = v16 * 1.15384615 / cos(v17 * 0.5);
  v20 = TSDRectWithSize(v19);
  v24 = TSDCenterOfRect(v20, v21, v22, v23);
  v26 = v25;
  v27 = (8 * self->_numDivisionsPerQuadrant) | 2;
  v28 = kTSDGPUShaderAttributePosition;
  v29 = v10;
  v30 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributePosition, 35044, 5, 0, 2));
  v31 = kTSDGPUShaderAttributeTexCoord;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", kTSDGPUShaderAttributeTexCoord, 35044, 5, 0, 2));
  v56 = (void *)v30;
  v60[0] = v30;
  v60[1] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("RadiusType"), 35044, 5, 0, 1));
  v60[2] = v54;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 3));
  v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v32, v27, 0, v29);
  opaqueMetalDataBuffer = self->_opaqueMetalDataBuffer;
  self->_opaqueMetalDataBuffer = v33;

  -[TSDMTLDataBuffer setMetalDrawMode:](self->_opaqueMetalDataBuffer, "setMetalDrawMode:", 4);
  v35 = objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", v28, 35044, 5, 0, 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", v31, 35044, 5, 0, 2));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[TSDGPUDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](TSDGPUDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("RadiusType"), 35044, 5, 0, 1));
  v53 = (void *)v35;
  v59[0] = v35;
  v59[1] = v36;
  v59[2] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));
  v58 = v29;
  v39 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v38, v27, 0, v29);
  fadeMetalDataBuffer = self->_fadeMetalDataBuffer;
  self->_fadeMetalDataBuffer = v39;

  -[TSDMTLDataBuffer setMetalDrawMode:](self->_fadeMetalDataBuffer, "setMetalDrawMode:", 4);
  *(float *)&v41 = v24;
  *(float *)&v42 = v26;
  v43 = -[KNIrisBase p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:minRadius:maxRadius:center:](self, "p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:minRadius:maxRadius:center:", v32, v57, x, y, width, height, v16, (double)v18, v41, v42);
  *(float *)&v44 = v24;
  *(float *)&v45 = v26;
  v46 = -[KNIrisBase p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:maxRadius:center:](self, "p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:maxRadius:center:", v38, v57, x, y, width, height, (double)v18, v44, v45);
  if (v43 != v27)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, v49, 399, CFSTR("Wrong number of opaque vertices! expected %lu, ended up with %lu"), v43, v27);

  }
  if (v46 != v27)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, v52, 400, CFSTR("Wrong number of fade vertices! expected %lu, ended up with %lu"), v46, v27);

  }
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v23;
  float64_t v24;
  float32x2_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float32x4_t *v30;
  float32x4_t *v31;
  float32x2_t *v32;
  float32x4_t v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (char *)objc_msgSend(v4, "direction");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  -[KNIrisBase p_setupMetalShadersWithContext:](self, "p_setupMetalShadersWithContext:", v8);

  v9 = (v6 == &stru_20.segname[2]) ^ self->_isBuildOut;
  v10 = TSDRectWithSize(objc_msgSend(v7, "frame"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "device"));
  -[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:](self, "p_setupDataBuffersWithFrameRect:openFromCenter:device:", v9, v18, v10, v12, v14, v16);

  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", v4);
  v33 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  v19 = TSDRectWithSize(objc_msgSend(v7, "frame"));
  v23.f64[0] = TSDCenterOfRect(v19, v20, v21, v22);
  v23.f64[1] = v24;
  v25 = vcvt_f32_f64(v23);
  v26 = 64;
  v27 = 304;
  v28 = 544;
  v29 = 3;
  do
  {
    v30 = (float32x4_t *)((char *)self + v26);
    *v30 = v33;
    v30[1] = v33;
    v30[2] = v33;
    v30[3] = v33;
    v31 = (float32x4_t *)((char *)self + v27);
    *v31 = v33;
    v31[1] = v33;
    v31[2] = v33;
    v31[3] = v33;
    *(float32x2_t *)v31[4].f32 = v25;
    *(float32x2_t *)v30[4].f32 = v25;
    v32 = (float32x2_t *)((char *)self + v28);
    v28 += 24;
    v32[1] = v25;
    v27 += 80;
    v26 += 80;
    v32[2].i8[0] = v9;
    --v29;
  }
  while (v29);
  *(float32x4_t *)self->_anon_280 = v33;
  *(float32x4_t *)&self->_anon_280[16] = v33;
  *(float32x4_t *)&self->_anon_280[32] = v33;
  *(float32x4_t *)&self->_anon_280[48] = v33;

}

- (void)renderFrameWithContext:(id)a3
{
  void *v4;
  char *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 isBuildOut;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  int v31;
  void *v32;
  id v33;
  float64x2_t v34;
  double v35;
  unsigned __int8 *v36;
  double v37;
  unsigned int v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  float32x2_t v46;
  double v47;
  _BOOL4 v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v54 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "textures"));
  v5 = (char *)objc_msgSend(v54, "direction");
  objc_msgSend(v54, "percent");
  v7 = v6;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    v52 = 0;
  else
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v9 = TSUSineMap(v7);
  v10 = v9;
  if (v5 == &stru_20.segname[1])
    v10 = TSUSineMap(1.0 - v9);
  v48 = v5 == &stru_20.segname[2];
  isBuildOut = self->_isBuildOut;
  objc_msgSend(v8, "frame");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "metalContext"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "device"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandBuffer"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "passDescriptor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "renderEncoder"));
  v51 = (void *)v17;
  if (!v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]"));
    v22 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v23, 478, CFSTR("invalid nil value for '%s'"), "device");

    v18 = v22;
  }
  v50 = (void *)v18;
  if (!v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 479, CFSTR("invalid nil value for '%s'"), "commandBuffer");

  }
  if (v53)
  {
    if (v19)
      goto LABEL_12;
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
    objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, v42, 480, CFSTR("invalid nil value for '%s'"), "passDescriptor");

    if (v19)
      goto LABEL_12;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"));
  objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, v45, 481, CFSTR("invalid nil value for '%s'"), "renderEncoder");

LABEL_12:
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metalTextureWithContext:", v16));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "metalTextureWithContext:", v16));
  v29 = (void *)v28;
  if (v27)
  {
    v30 = sqrt(v15 * v15 + v13 * v13) * 0.5;
    v31 = v48 ^ isBuildOut;
    v47 = v10 * (v30 * 1.15384615) + v30 * -0.153846154;
    v49 = v10 * (v30 * 1.15384615);
    if (v28)
    {
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_quadMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v19, self->_anon_280);
      objc_msgSend(v19, "setFragmentTexture:atIndex:", v29, 0);
      -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_quadMetalDataBuffer, "drawWithEncoder:atIndex:", v19, 0);
    }
    objc_msgSend(v19, "setFragmentTexture:atIndex:", v27, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "metalContext"));
    v33 = objc_msgSend(v32, "currentBuffer");

    v34.f64[0] = v47;
    v34.f64[1] = v49;
    v46 = vcvt_f32_f64(v34);
    *(float32x2_t *)&self->_anon_40[80 * (_QWORD)v33 + 72] = v46;
    objc_msgSend(v8, "singleTextureOpacity");
    *(float *)&v35 = v35;
    v36 = &self->_anon_220[24 * (_QWORD)v33];
    *((_DWORD *)v36 + 5) = LODWORD(v35);
    *(float32x2_t *)v36 = v46;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_fadeMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v19, &self->_anon_40[80 * (_QWORD)v33]);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_fadeMetalDataBuffer, "drawWithEncoder:atIndex:", v19, 0);
    v37 = v47;
    if (!v31)
      v37 = v49;
    *(float *)&v38 = v37;
    *(_QWORD *)&self->_anon_130[80 * (_QWORD)v33 + 72] = __PAIR64__(v46.u32[1], v38);
    objc_msgSend(v8, "singleTextureOpacity");
    *(float *)&v39 = v39;
    self->_opaqueFragmentInput[(_QWORD)v33].Opacity = *(float *)&v39;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_opaqueMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v19, &self->_anon_130[80 * (_QWORD)v33]);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_opaqueMetalDataBuffer, "drawWithEncoder:atIndex:", v19, 0);
  }

}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v11;
  void *v12;
  void *v13;
  uint32_t *v14;
  uint64_t v15;
  void *v16;
  uint32_t *v17;
  id v18;
  void *v19;
  id v20;
  __CFString *v21;

  if (a8 <= 0x174876E7FFLL && a7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNTransitionAttributesDirection"), a4, a5, *(_QWORD *)&a6, a7));
    if (v11)
    {

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNBuildAttributesDirection")));

      if (!v12)
        return;
    }
    if (a6 == 3)
    {
      v21 = CFSTR("KNTransitionAttributesDirection");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:"));
      v14 = (uint32_t *)objc_msgSend(v13, "unsignedIntegerValue");

      if (v14 == &stru_68.reserved1)
        v15 = 41;
      else
        v15 = 42;
    }
    else
    {
      v21 = CFSTR("KNBuildAttributesDirection");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:"));
      v17 = (uint32_t *)objc_msgSend(v16, "unsignedIntegerValue");

      if (v17 == &stru_68.reserved1)
        v15 = 41;
      else
        v15 = 42;
      if (a6 == 2)
        v15 = sub_11C6F8(v15);
    }
    v18 = objc_msgSend(*a3, "mutableCopy");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v21);

    v20 = objc_retainAutorelease(v18);
    *a3 = v20;

  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;

  if (a8 <= 0x174876E7FFLL && a7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction"), a4, a5, *(_QWORD *)&a6, a7));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("direction")));
      v13 = (char *)objc_msgSend(v12, "unsignedIntegerValue");

      if (a6 == 2)
        v13 = (char *)sub_11C6F8((uint64_t)v13);
      v14 = 42;
      if (v13 == &stru_20.segname[2])
        v14 = 173;
      if (v13 == &stru_20.segname[1])
        v15 = 172;
      else
        v15 = v14;
      v16 = objc_msgSend(*a3, "mutableCopy");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("direction"));

      v18 = objc_retainAutorelease(v16);
      *a3 = v18;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_fadeMetalShader, 0);
  objc_storeStrong((id *)&self->_opaqueMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_opaqueMetalShader, 0);
  objc_storeStrong((id *)&self->_quadMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_quadMetalShader, 0);
}

@end
