@implementation KNWipeDataBuffer

- (KNWipeDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 minimumDataSize:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  KNWipeDataBuffer *v14;
  KNWipeDataBuffer *v15;
  int64_t v16;
  int64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  NSArray *wipeBufferAttributes;
  uint64_t v25;
  NSArray *solidBufferAttributes;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)KNWipeDataBuffer;
  v14 = -[KNWipeDataBuffer init](&v28, "init");
  v15 = v14;
  if (v14)
  {
    v14->_vertexRect.origin.x = v13;
    v14->_vertexRect.origin.y = v12;
    v14->_vertexRect.size.width = v11;
    v14->_vertexRect.size.height = v10;
    v14->_textureRect.origin.x = x;
    v14->_textureRect.origin.y = y;
    if (a5 <= 2)
      v16 = 2;
    else
      v16 = a5;
    v14->_textureRect.size.width = width;
    v14->_textureRect.size.height = height;
    if (a5 <= 3)
      v17 = 3;
    else
      v17 = a5;
    v18 = objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Position"), 35040, 5, 0, 2);
    v19 = objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("TexCoord"), 35040, v17, 1, 2);
    v20 = objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Position"), 35040, 5, 0, 2);
    v21 = objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("TexCoord"), 35040, v17, 1, 2);
    v22 = objc_msgSend(objc_alloc((Class)TSDGPUDataBufferAttribute), "initWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("Opacity"), 35040, v16, 1, 1);
    v30[0] = v20;
    v30[1] = v21;
    v30[2] = v22;
    v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
    wipeBufferAttributes = v15->_wipeBufferAttributes;
    v15->_wipeBufferAttributes = (NSArray *)v23;

    v15->_wipePositionAttributeIndex = -[NSArray indexOfObject:](v15->_wipeBufferAttributes, "indexOfObject:", v20);
    v15->_wipeTexCoordAttributeIndex = -[NSArray indexOfObject:](v15->_wipeBufferAttributes, "indexOfObject:", v21);
    v15->_wipeOpacityAttributeIndex = -[NSArray indexOfObject:](v15->_wipeBufferAttributes, "indexOfObject:", v22);
    v29[0] = v18;
    v29[1] = v19;
    v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    solidBufferAttributes = v15->_solidBufferAttributes;
    v15->_solidBufferAttributes = (NSArray *)v25;

    v15->_solidPositionAttributeIndex = -[NSArray indexOfObject:](v15->_solidBufferAttributes, "indexOfObject:", v18);
    v15->_solidTexCoordAttributeIndex = -[NSArray indexOfObject:](v15->_solidBufferAttributes, "indexOfObject:", v19);

  }
  return v15;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->mMVPMatrix.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->mMVPMatrix.m23 = v5;
  *(_OWORD *)&self->mMVPMatrix.m11 = v3;
  *(_OWORD *)&self->mMVPMatrix.m13 = v4;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->mMVPMatrix.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->mMVPMatrix.m43 = v8;
  *(_OWORD *)&self->mMVPMatrix.m31 = v6;
  *(_OWORD *)&self->mMVPMatrix.m33 = v7;
  v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m21), *(float64x2_t *)&a3->m23);
  v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m31), *(float64x2_t *)&a3->m33);
  v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m41), *(float64x2_t *)&a3->m43);
  *(float32x4_t *)self->_anon_150 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->m11), *(float64x2_t *)&a3->m13);
  *(float32x4_t *)&self->_anon_150[16] = v9;
  *(float32x4_t *)&self->_anon_150[32] = v10;
  *(float32x4_t *)&self->_anon_150[48] = v11;
}

+ (id)newWipeDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 metalContext:(id)a5 colorAttachment:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a5;
  v17 = a6;
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:minimumDataSize:", 5, v14, v13, v12, v11, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setupMTLWipeDataBufferWithContext:colorAttachment:", v16, v17);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"));
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 103, CFSTR("invalid nil value for '%s'"), "wipeBuffer");

  }
  return v19;
}

- (void)setupMTLWipeDataBufferWithContext:(id)a3 colorAttachment:(id)a4
{
  id v6;
  TSDMTLDataBuffer *v7;
  TSDMTLDataBuffer *wipeMTLDataBuffer;
  TSDMTLDataBuffer *v9;
  TSDMTLDataBuffer *solidMTLDataBuffer;
  id v11;
  id v12;
  TSDMetalShader *v13;
  TSDMetalShader *solidMetalShader;
  TSDMetalShader *v15;
  TSDMetalShader *wipeMetalShader;
  id v17;

  v6 = a4;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "device"));
  v7 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", self->_wipeBufferAttributes, 6, 0, v17);
  wipeMTLDataBuffer = self->_wipeMTLDataBuffer;
  self->_wipeMTLDataBuffer = v7;

  -[TSDMTLDataBuffer setMetalDrawMode:](self->_wipeMTLDataBuffer, "setMetalDrawMode:", 4);
  v9 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", self->_solidBufferAttributes, 6, 0, v17);
  solidMTLDataBuffer = self->_solidMTLDataBuffer;
  self->_solidMTLDataBuffer = v9;

  -[TSDMTLDataBuffer setMetalDrawMode:](self->_solidMTLDataBuffer, "setMetalDrawMode:", 4);
  v11 = objc_alloc((Class)TSDMetalShader);
  v12 = MTLCreateSystemDefaultDevice();
  v13 = (TSDMetalShader *)objc_msgSend(v11, "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v12, v6);
  solidMetalShader = self->_solidMetalShader;
  self->_solidMetalShader = v13;

  v15 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("wipeDataBufferVertexShader"), CFSTR("wipeDataBufferFragmentShader"), v17, CFSTR("KeynoteMetalLibrary"), v6);
  wipeMetalShader = self->_wipeMetalShader;
  self->_wipeMetalShader = v15;

}

- ($94F468A8D4C62B317260615823C2B210)p_texCoordFromX:(double)a3 y:(double)a4
{
  double v4;
  float v5;
  float v6;
  $94F468A8D4C62B317260615823C2B210 result;

  v5 = TSDPointFromNormalizedRect((a3 - self->_vertexRect.origin.x) / self->_vertexRect.size.width, (a4 - self->_vertexRect.origin.y) / self->_vertexRect.size.height, self->_textureRect.origin.x, self->_textureRect.origin.y, self->_textureRect.size.width, self->_textureRect.size.height);
  v6 = 1.0 - v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)updateWipeWithPercent:(double)a3 solidVertexCount:(unint64_t *)a4 wipeVertexCount:(unint64_t *)a5 drawIntoMetalBuffer:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double x;
  _BOOL4 v18;
  double width;
  double v20;
  double v21;
  double height;
  double v23;
  long double v24;
  long double v25;
  double v26;
  long double v27;
  long double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  _BOOL4 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _QWORD *v54;
  unint64_t wipeOpacityAttributeIndex;
  _QWORD *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat rect;
  _QWORD v69[8];
  __int128 v70;
  unint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  BOOL v88;
  _QWORD v89[6];
  __int128 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  BOOL v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  v6 = a6;
  y = CGPointZero.y;
  v12 = -[KNWipeDataBuffer direction](self, "direction") - 11;
  if (v12 < 0xE && ((0x3C0Fu >> v12) & 1) != 0)
  {
    v16 = dbl_315348[v12];
    x = dbl_3153B8[v12];
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeDataBuffer updateWipeWithPercent:solidVertexCount:wipeVertexCount:drawIntoMetalBuffer:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 172, CFSTR("Unknown direction!"));

    v16 = y;
    x = CGPointZero.x;
  }
  v67 = v16;
  v18 = v16 != 0.0 && x != 0.0;
  width = self->_vertexRect.size.width;
  -[KNWipeDataBuffer blurFraction](self, "blurFraction");
  v21 = width * v20;
  if (v18)
  {
    v23 = self->_vertexRect.size.width;
    height = self->_vertexRect.size.height;
    v24 = atan(height / v23);
    v25 = sin(v24);
    v26 = v21 / (v25 + v25);
    v27 = atan(v23 / height);
    v28 = sin(v27);
    v29 = v21 / (v28 + v28);
    v30 = v67;
    v31 = x;
  }
  else
  {
    v26 = width * v20;
    v31 = x;
    if (x == 0.0)
      v26 = self->_vertexRect.size.width;
    height = self->_vertexRect.size.height;
    v30 = v67;
    if (v67 == 0.0)
      v29 = self->_vertexRect.size.height;
    else
      v29 = v21;
  }
  v32 = self->_vertexRect.size.width;
  if (v31 == 0.0)
    v33 = v26;
  else
    v33 = -(v26 - (v26 + v32) * a3);
  if (v30 == 0.0)
    v34 = v29;
  else
    v34 = -(v29 - (v29 + height) * a3);
  rect = y;
  v65 = v31;
  if (v18)
  {
    if (v31 == -1.0)
      v35 = self->_vertexRect.size.width;
    else
      v35 = CGPointZero.x;
    v64 = v35;
    v36 = 2.0;
    if (v30 == -1.0)
    {
      v63 = height;
      v37 = rect;
    }
    else
    {
      v37 = rect;
      v63 = rect;
    }
  }
  else
  {
    v38 = v31 == -1.0;
    if (v30 == -1.0)
      v38 = 1;
    if (v38)
      v39 = height;
    else
      v39 = y;
    if (v38)
      v40 = self->_vertexRect.size.width;
    else
      v40 = CGPointZero.x;
    v63 = v39;
    v64 = v40;
    v37 = y;
    v36 = 1.0;
  }
  if (v18)
    v41 = v29 + v29;
  else
    v41 = v29;
  if (v18)
    v42 = v26 + v26;
  else
    v42 = v26;
  v61 = v42;
  v62 = v41;
  v112.origin.x = CGPointZero.x;
  v112.origin.y = v37;
  v112.size.width = self->_vertexRect.size.width;
  v112.size.height = height;
  v66 = -(CGRectGetWidth(v112) - v36 * v33);
  v113.origin.x = CGPointZero.x;
  v113.origin.y = v37;
  v113.size.width = v32;
  v113.size.height = height;
  v43 = CGRectGetHeight(v113);
  v44 = 0.0;
  v45 = 0.0;
  if (v18)
  {
    v45 = 0.0;
    if (v66 > 0.0)
    {
      v114.origin.x = CGPointZero.x;
      v114.origin.y = rect;
      v114.size.width = v32;
      v114.size.height = height;
      v45 = -CGRectGetWidth(v114);
    }
  }
  v60 = v45;
  v46 = -(v43 - v36 * v34);
  if (v18)
  {
    v47 = rect;
    if (v46 > 0.0)
    {
      v115.origin.x = CGPointZero.x;
      v115.origin.y = rect;
      v115.size.width = v32;
      v115.size.height = height;
      v44 = -CGRectGetHeight(v115);
    }
  }
  else
  {
    v47 = rect;
  }
  v48 = fmax(v66, 0.0);
  v49 = fmax(v46, 0.0);
  v50 = -v33 / v61;
  if (v33 > 0.0)
    v50 = 0.0;
  v57 = v50;
  v108 = 0;
  v109 = &v108;
  v110 = 0x2020000000;
  v111 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x2020000000;
  v107 = 0;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1A5F80;
  v89[3] = &unk_42ADF8;
  v90 = *(_OWORD *)&self->_solidPositionAttributeIndex;
  v103 = v18;
  v91 = v64;
  v92 = v63;
  v89[4] = self;
  v89[5] = &v108;
  v58 = v34;
  v59 = v33;
  v93 = v33;
  v94 = v34;
  v95 = v65;
  v96 = v67;
  v97 = CGPointZero.x;
  v98 = v47;
  v99 = v32;
  v100 = height;
  if (v34 <= 0.0)
    v51 = -v34 / v62;
  else
    v51 = 0.0;
  v52 = v48;
  v101 = v48;
  v102 = v49;
  v53 = v49;
  v54 = objc_retainBlock(v89);
  if (v6)
    -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_solidMTLDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_solidBufferAttributes, v54);
  wipeOpacityAttributeIndex = self->_wipeOpacityAttributeIndex;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1A6760;
  v69[3] = &unk_42AE20;
  *(double *)&v69[6] = v57;
  *(double *)&v69[7] = v51;
  v70 = *(_OWORD *)&self->_wipePositionAttributeIndex;
  v71 = wipeOpacityAttributeIndex;
  v88 = v18;
  v72 = v64;
  v73 = v63;
  v74 = v52;
  v75 = v59;
  v76 = v58;
  v77 = v65;
  v78 = v67;
  v79 = v53;
  v80 = CGPointZero.x;
  v81 = rect;
  v82 = v32;
  v83 = height;
  v69[4] = self;
  v69[5] = &v104;
  v84 = v61;
  v85 = v62;
  v86 = fmax(v61 + v66 + v60, 0.0);
  v87 = fmax(v62 + v46 + v44, 0.0);
  v56 = objc_retainBlock(v69);
  if (v6)
    -[TSDMTLDataBuffer updateMetalDataBufferAttributes:withBlock:](self->_wipeMTLDataBuffer, "updateMetalDataBufferAttributes:withBlock:", self->_wipeBufferAttributes, v56);
  *a4 = v109[3];
  *a5 = v105[3];

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);
}

- (void)drawWipeWithPercent:(double)a3 opacity:(double)a4 renderEncoder:(id)a5
{
  id v8;
  float v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v8 = a5;
  -[KNWipeDataBuffer updateWipeWithPercent:solidVertexCount:wipeVertexCount:drawIntoMetalBuffer:](self, "updateWipeWithPercent:solidVertexCount:wipeVertexCount:drawIntoMetalBuffer:", &v11, &v10, 1, a3);
  v9 = a4;
  self->_fragmentInput.Opacity = v9;
  self = (KNWipeDataBuffer *)((char *)self + 152);
  objc_msgSend(*(id *)&self->MVPMatrix.m32, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v8, &self->_wipePositionAttributeIndex, self);
  objc_msgSend(*(id *)&self->MVPMatrix.m33, "drawWithEncoder:atIndex:range:", v8, 0, 0, v11);
  objc_msgSend(*(id *)&self->MVPMatrix.m24, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v8, &self->_wipePositionAttributeIndex, self);
  objc_msgSend(*(id *)&self->MVPMatrix.m31, "drawWithEncoder:atIndex:range:", v8, 0, 0, v10);

}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (double)blurFraction
{
  return self->_blurFraction;
}

- (void)setBlurFraction:(double)a3
{
  self->_blurFraction = a3;
}

- (CATransform3D)MVPMatrix
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[3].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m13;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[3].m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (NSArray)wipeBufferAttributes
{
  return self->_wipeBufferAttributes;
}

- (void)setWipeBufferAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_wipeBufferAttributes, a3);
}

- (unint64_t)wipePositionAttributeIndex
{
  return self->_wipePositionAttributeIndex;
}

- (void)setWipePositionAttributeIndex:(unint64_t)a3
{
  self->_wipePositionAttributeIndex = a3;
}

- (unint64_t)wipeTexCoordAttributeIndex
{
  return self->_wipeTexCoordAttributeIndex;
}

- (void)setWipeTexCoordAttributeIndex:(unint64_t)a3
{
  self->_wipeTexCoordAttributeIndex = a3;
}

- (unint64_t)wipeOpacityAttributeIndex
{
  return self->_wipeOpacityAttributeIndex;
}

- (void)setWipeOpacityAttributeIndex:(unint64_t)a3
{
  self->_wipeOpacityAttributeIndex = a3;
}

- (NSArray)solidBufferAttributes
{
  return self->_solidBufferAttributes;
}

- (void)setSolidBufferAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_solidBufferAttributes, a3);
}

- (unint64_t)solidPositionAttributeIndex
{
  return self->_solidPositionAttributeIndex;
}

- (void)setSolidPositionAttributeIndex:(unint64_t)a3
{
  self->_solidPositionAttributeIndex = a3;
}

- (unint64_t)solidTexCoordAttributeIndex
{
  return self->_solidTexCoordAttributeIndex;
}

- (void)setSolidTexCoordAttributeIndex:(unint64_t)a3
{
  self->_solidTexCoordAttributeIndex = a3;
}

- (CGRect)vertexRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_vertexRect.origin.x;
  y = self->_vertexRect.origin.y;
  width = self->_vertexRect.size.width;
  height = self->_vertexRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVertexRect:(CGRect)a3
{
  self->_vertexRect = a3;
}

- (CGRect)textureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textureRect.origin.x;
  y = self->_textureRect.origin.y;
  width = self->_textureRect.size.width;
  height = self->_textureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextureRect:(CGRect)a3
{
  self->_textureRect = a3;
}

- (TSDMetalShader)wipeMetalShader
{
  return self->_wipeMetalShader;
}

- (void)setWipeMetalShader:(id)a3
{
  objc_storeStrong((id *)&self->_wipeMetalShader, a3);
}

- (TSDMTLDataBuffer)wipeMTLDataBuffer
{
  return self->_wipeMTLDataBuffer;
}

- (void)setWipeMTLDataBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_wipeMTLDataBuffer, a3);
}

- (TSDMetalShader)solidMetalShader
{
  return self->_solidMetalShader;
}

- (void)setSolidMetalShader:(id)a3
{
  objc_storeStrong((id *)&self->_solidMetalShader, a3);
}

- (TSDMTLDataBuffer)solidMTLDataBuffer
{
  return self->_solidMTLDataBuffer;
}

- (void)setSolidMTLDataBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_solidMTLDataBuffer, a3);
}

- (__n128)vertexInput
{
  return a1[21];
}

- (__n128)setVertexInput:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  result[24] = a5;
  return result;
}

- ($3BA783FF50B239963188BE194EBFFEBA)fragmentInput
{
  return LODWORD(self->_fragmentInput.Opacity);
}

- (void)setFragmentInput:(id)a3
{
  self->_fragmentInput.Opacity = a3.var0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solidMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_solidMetalShader, 0);
  objc_storeStrong((id *)&self->_wipeMTLDataBuffer, 0);
  objc_storeStrong((id *)&self->_wipeMetalShader, 0);
  objc_storeStrong((id *)&self->_solidBufferAttributes, 0);
  objc_storeStrong((id *)&self->_wipeBufferAttributes, 0);
}

@end
