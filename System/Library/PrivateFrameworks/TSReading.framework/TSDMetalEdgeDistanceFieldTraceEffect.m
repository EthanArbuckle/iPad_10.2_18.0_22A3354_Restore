@implementation TSDMetalEdgeDistanceFieldTraceEffect

+ (void)willBeginWithDevice:(id)a3
{
  +[TSDMetalEdgeDistanceField willBeginWithDevice:](TSDMetalEdgeDistanceField, "willBeginWithDevice:", a3);
}

+ (void)didEndWithDevice:(id)a3
{
  +[TSDMetalEdgeDistanceField didEndWithDevice:](TSDMetalEdgeDistanceField, "didEndWithDevice:", a3);
}

- (TSDMetalEdgeDistanceFieldTraceEffect)initWithTR:(id)a3 strokeWidth:(double)a4 downsampleScale:(double)a5 clockwise:(BOOL)a6 context:(id)a7 randomGenerator:(id)a8 capabilities:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  id v55;
  TSDMetalShader *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  double v67;
  float64x2_t v68;
  double v69;
  double v70;
  double v71;
  float64x2_t v72;
  double v73;
  float64x2_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v80;
  double v81;
  float64_t v82;
  float64_t v83;
  float64_t v84;
  float64_t v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  objc_super v88;

  v12 = a6;
  v16 = a3;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v88.receiver = self;
  v88.super_class = (Class)TSDMetalEdgeDistanceFieldTraceEffect;
  v20 = -[TSDMetalEdgeDistanceFieldTraceEffect init](&v88, sel_init);
  if (v20)
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldTraceEffect initWithTR:strokeWidth:downsampleScale:clockwise:context:randomGenerator:capabilities:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 1453, CFSTR("invalid nil value for '%s'"), "randomGenerator");

    }
    objc_msgSend(v16, "frame");
    v26 = v24;
    v27 = v25;
    if (v24 > 65536.0 || v25 > 65536.0)
    {
      v31 = TSDScaleSizeWithinSize(v24, v25, 65536.0, 65536.0);
      v30 = TSDCeilSize(v31);
      v28 = v30 / v26;
      if (v30 / v26 >= v29 / v27)
        v28 = v29 / v27;
    }
    else
    {
      v28 = 1.0;
      v29 = v25;
      v30 = v26;
    }
    if (v28 <= a5)
      a5 = v28;
    if (v30 <= v29)
      v30 = v29;
    v32 = round(v30 * -0.05);
    if (a4 >= 1.0)
      v33 = a4;
    else
      v33 = 1.0;
    v34 = vcvtpd_s64_f64(v33);
    objc_msgSend(v16, "metalTexture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v35, v34, 0, 1, v17, v19, v26, v27, v32, v32, v32, v32, a5);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v20 + 43);
    *((_QWORD *)v20 + 43) = v36;

    v38 = TSDMultiplySizeScalar(v26, v27, a5);
    v40 = v39;
    v41 = -v32;
    v42 = -v32 / (double)objc_msgSend(*((id *)v20 + 43), "width");
    v43 = v41 / (double)objc_msgSend(*((id *)v20 + 43), "height");
    v44 = v38 / (double)objc_msgSend(*((id *)v20 + 43), "width");
    v45 = v40 / (double)objc_msgSend(*((id *)v20 + 43), "height");
    v46 = MEMORY[0x24BDBD8B8];
    v47 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)(v20 + 24) = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(v20 + 40) = v47;
    *(_OWORD *)(v20 + 56) = *(_OWORD *)(v46 + 32);
    v48 = *(_OWORD *)(v20 + 40);
    *(_OWORD *)&v86.a = *(_OWORD *)(v20 + 24);
    *(_OWORD *)&v86.c = v48;
    *(_OWORD *)&v86.tx = *(_OWORD *)(v20 + 56);
    CGAffineTransformTranslate(&v87, &v86, v42, v43);
    v50 = *(_OWORD *)&v87.c;
    v49 = *(_OWORD *)&v87.tx;
    *(_OWORD *)(v20 + 24) = *(_OWORD *)&v87.a;
    *(_OWORD *)(v20 + 40) = v50;
    *(_OWORD *)(v20 + 56) = v49;
    v51 = *(_OWORD *)(v20 + 40);
    *(_OWORD *)&v86.a = *(_OWORD *)(v20 + 24);
    *(_OWORD *)&v86.c = v51;
    *(_OWORD *)&v86.tx = *(_OWORD *)(v20 + 56);
    CGAffineTransformScale(&v87, &v86, v44, v45);
    v53 = *(_OWORD *)&v87.c;
    v52 = *(_OWORD *)&v87.tx;
    *(_OWORD *)(v20 + 24) = *(_OWORD *)&v87.a;
    *(_OWORD *)(v20 + 40) = v53;
    *(_OWORD *)(v20 + 56) = v52;
    v54 = objc_msgSend(v20, "p_generateTraceTextureInfoWithStrokeWidth:clockwise:context:randomGenerator:", v12, v17, v18, a4);
    v20[336] = v54;
    if (v54)
    {
      v55 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
      objc_msgSend(v55, "setPixelFormat:", objc_msgSend(v17, "pixelFormat"));
      objc_msgSend(v55, "setBlendingEnabled:", 1);
      objc_msgSend(v55, "setSourceRGBBlendFactor:", 1);
      objc_msgSend(v55, "setSourceAlphaBlendFactor:", 1);
      objc_msgSend(v55, "setDestinationRGBBlendFactor:", 5);
      objc_msgSend(v55, "setDestinationAlphaBlendFactor:", 5);
      v56 = [TSDMetalShader alloc];
      objc_msgSend(v17, "device");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[TSDMetalShader initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:](v56, "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("TSDMetalEdgeDistanceField_Trace_VertexShader"), CFSTR("TSDMetalEdgeDistanceField_Trace_FragmentShader"), v57, CFSTR("KeynoteMetalLibrary"), v55);
      v59 = (void *)*((_QWORD *)v20 + 45);
      *((_QWORD *)v20 + 45) = v58;

      v60 = vcvt_f32_f64(*(float64x2_t *)(v20 + 24));
      v61 = vcvt_f32_f64(*(float64x2_t *)(v20 + 40));
      v62 = vcvt_f32_f64(*(float64x2_t *)(v20 + 56));
      *((_DWORD *)v20 + 54) = 0;
      *((float32x2_t *)v20 + 26) = v60;
      *((_DWORD *)v20 + 58) = 0;
      *((float32x2_t *)v20 + 28) = v61;
      *((_DWORD *)v20 + 62) = 1065353216;
      *((float32x2_t *)v20 + 30) = v62;
      v60.f32[0] = a4;
      *((_DWORD *)v20 + 79) = v60.i32[0];
      objc_msgSend(*((id *)v20 + 43), "size");
      v84 = v63;
      objc_msgSend(*((id *)v20 + 43), "size");
      v82 = v64;
      objc_msgSend(*((id *)v20 + 43), "size");
      v80 = 1.0 / v65;
      objc_msgSend(*((id *)v20 + 43), "size");
      v66.f64[0] = v80;
      v66.f64[1] = 1.0 / v67;
      v68.f64[0] = v84;
      v68.f64[1] = v82;
      *((float32x4_t *)v20 + 17) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v66);
      objc_msgSend(v17, "layerSize");
      v85 = v69;
      objc_msgSend(v17, "layerSize");
      v83 = v70;
      objc_msgSend(v17, "layerSize");
      v81 = 1.0 / v71;
      objc_msgSend(v17, "layerSize");
      v72.f64[0] = v81;
      v72.f64[1] = 1.0 / v73;
      v74.f64[0] = v85;
      v74.f64[1] = v83;
      *((float32x4_t *)v20 + 18) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v72);
      *((_DWORD *)v20 + 82) = *((_QWORD *)v20 + 2);
      *(float *)v74.f64 = 1.0 / a5;
      *((_DWORD *)v20 + 78) = LODWORD(v74.f64[0]);
      objc_msgSend(v16, "frameOnCanvas");
      *((_QWORD *)v20 + 13) = v75;
      *((_QWORD *)v20 + 14) = v76;
      *((_QWORD *)v20 + 15) = v77;
      *((_QWORD *)v20 + 16) = v78;

    }
    else
    {
      objc_msgSend(v20, "teardown");
    }
  }

  return (TSDMetalEdgeDistanceFieldTraceEffect *)v20;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  __CFArray *zeroesArray;
  objc_super v7;

  if (!self->_didTeardown)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldTraceEffect dealloc]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 1525, CFSTR("Didn't teardown!"));

  }
  zeroesArray = self->_zeroesArray;
  if (zeroesArray)
  {
    CFRelease(zeroesArray);
    self->_zeroesArray = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDMetalEdgeDistanceFieldTraceEffect;
  -[TSDMetalEdgeDistanceFieldTraceEffect dealloc](&v7, sel_dealloc);
}

- (id)description
{
  return &stru_24D82FEB0;
}

- (void)teardown
{
  void *v3;
  void *v4;
  TSDMetalTextureInfo *edgeDistanceFieldTextureInfo;
  TSDMetalTextureInfo *traceTextureInfo;
  TSDMetalShader *shader;

  if (!self->_didTeardown)
  {
    -[TSDMetalEdgeDistanceFieldTraceEffect edgeDistanceFieldTextureInfo](self, "edgeDistanceFieldTextureInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "teardown");

    -[TSDMetalEdgeDistanceFieldTraceEffect traceTextureInfo](self, "traceTextureInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "teardown");

    edgeDistanceFieldTextureInfo = self->_edgeDistanceFieldTextureInfo;
    self->_edgeDistanceFieldTextureInfo = 0;

    traceTextureInfo = self->_traceTextureInfo;
    self->_traceTextureInfo = 0;

    shader = self->_shader;
    self->_shader = 0;

    self->_didTeardown = 1;
  }
}

- (void)drawWithContext:(id)a3 andBuffer:(id)a4 atPercent:(double)a5 MVPMatrix:(CATransform3D *)a6 opacity:(double)a7 color:(id)a8 strokeFadeHardnessLeading:(double)a9 strokeFadeHardnessTrailing:(double)a10
{
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  id *anon_90;
  float v15;
  unsigned __int8 *anon_100;
  float var1;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;

  v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m21), *(float64x2_t *)&a6->m23);
  v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m31), *(float64x2_t *)&a6->m33);
  v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m41), *(float64x2_t *)&a6->m43);
  *(float32x4_t *)self->_anon_90 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m11), *(float64x2_t *)&a6->m13);
  *(float32x4_t *)&self->_anon_90[16] = v11;
  anon_90 = (id *)self->_anon_90;
  *(float32x4_t *)&self->_anon_90[32] = v12;
  *(float32x4_t *)&self->_anon_90[48] = v13;
  v15 = a7;
  anon_100 = self->_anon_100;
  var1 = a8.var1;
  v18 = a5;
  v19 = *(_QWORD *)&a8.var2;
  *(float *)&self->_anon_100[48] = v15;
  *(float *)&self->_anon_100[52] = v18;
  *($C28CD4A45FD07A4F97CC9D5F91F25271 *)self->_anon_100 = a8;
  v20 = a9;
  v21 = a10;
  *(float *)&self->_anon_100[64] = v20;
  *(float *)&self->_anon_100[68] = v21;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v23, "renderEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(anon_90[25], "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFragmentTexture:atIndex:", v25, 0);

  objc_msgSend(v23, "renderEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(anon_90[26], "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFragmentTexture:atIndex:", v27, 1);

  v28 = anon_90[27];
  objc_msgSend(v23, "renderEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v29, anon_90, anon_100);

  objc_msgSend(v23, "renderEncoder");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "drawWithEncoder:atIndex:", v30, objc_msgSend(anon_90[27], "bufferIndex"));
}

- (NSArray)strokeLineSegment
{
  NSArray *v3;
  NSArray *strokeLineSegment;
  NSArray *v5;

  if (self->_zeroesArray)
  {
    -[TSDMetalEdgeDistanceFieldTraceEffect p_houghTransformWithZeroes:bufferSize:](self, "p_houghTransformWithZeroes:bufferSize:", self->_bufferSize.width, self->_bufferSize.height);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    strokeLineSegment = self->_strokeLineSegment;
    self->_strokeLineSegment = v3;
    v5 = v3;

    CFRelease(self->_zeroesArray);
    self->_zeroesArray = 0;
  }
  return self->_strokeLineSegment;
}

- (CGPoint)p_normalizedPointInTexturedRectangleFrameFromPoint:(CGPoint)a3 inBufferSize:(CGSize)a4
{
  __int128 v4;
  float64x2_t v5;
  double v6;
  double v7;
  double v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGPoint result;

  v8 = a3.x / a4.width;
  v4 = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&v9.c = v4;
  *(_OWORD *)&v9.tx = *(_OWORD *)&self->_textureEdgeInsetsAdjustmentMatrix.tx;
  v7 = a3.y / a4.height;
  CGAffineTransformInvert(&v10, &v9);
  v5 = vaddq_f64(*(float64x2_t *)&v10.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v10.c, v7), *(float64x2_t *)&v10.a, v8));
  v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

- (id)p_houghTransformWithZeroes:(__CFArray *)a3 bufferSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ValueAtIndex;
  uint64_t v22;
  double *v23;
  double v24;
  uint64_t v25;
  char *v28;
  unsigned __int16 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFArray *Mutable;
  CFIndex i;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  CFIndex v44;
  CFIndex v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CFIndex v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
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
  double v68;
  void *v69;
  void *v70;
  TSDMetalEdgeDistanceFieldTraceEffect *v72;
  uint64_t v73;
  CFIndex Count;
  double v75;
  CFArrayRef theArraya;
  _QWORD v78[3];

  height = a4.height;
  width = a4.width;
  v78[2] = *MEMORY[0x24BDAC8D0];
  if (p_houghTransformWithZeroes_bufferSize__onceToken != -1)
    dispatch_once(&p_houghTransformWithZeroes_bufferSize__onceToken, &__block_literal_global_208);
  v7 = (uint64_t)width;
  v8 = (uint64_t)height;
  v9 = (uint64_t)sqrt((double)(v8 * v8 + v7 * v7));
  v10 = (char *)malloc_type_calloc(2 * v9, 0x168uLL, 0x2EDACB6CuLL);
  Count = CFArrayGetCount(a3);
  if (Count <= 0)
  {
    free(v10);
    goto LABEL_32;
  }
  v11 = 0;
  v12 = 0;
  if (v7 >= 0)
    v13 = (uint64_t)width;
  else
    v13 = v7 + 1;
  v72 = self;
  v73 = -(v13 >> 1);
  if (v8 >= 0)
    v14 = (uint64_t)height;
  else
    v14 = v8 + 1;
  v15 = -(v14 >> 1);
  if (v9 >= 0)
    v16 = v9;
  else
    v16 = v9 + 1;
  v17 = -(v16 >> 1);
  v18 = v16 >> 1;
  v19 = -1;
  v20 = -1;
  do
  {
    ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(a3, v12);
    v22 = 0;
    v23 = (double *)&unk_254F23920;
    do
    {
      v24 = *v23 * (double)(v15 + (unint64_t)(double)(ValueAtIndex / v7))
          + (double)(v73 + (unint64_t)(double)(ValueAtIndex % v7)) * *(v23 - 1);
      v25 = (uint64_t)v24;
      if (v17 < (uint64_t)v24 && v18 > v25 && v25 != 0)
      {
        v28 = &v10[720 * v18 + 720 * v25];
        v29 = *(_WORD *)&v28[2 * v22] + 1;
        *(_WORD *)&v28[2 * v22] = v29;
        if (v11 < v29)
        {
          v20 = v22;
          v19 = (uint64_t)v24;
        }
        if (v11 <= v29)
          v11 = v29;
      }
      ++v22;
      v23 += 2;
    }
    while (v22 != 360);
    ++v12;
  }
  while (v12 != Count);
  if (v11 >= 0xFFFF)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldTraceEffect p_houghTransformWithZeroes:bufferSize:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, v33, 1657, CFSTR("max_value > 2^16!"));

    free(v10);
    goto LABEL_34;
  }
  free(v10);
  if (v11 < 11)
  {
LABEL_32:
    v30 = 0;
    return v30;
  }
LABEL_34:
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
  for (i = 0; i != Count; ++i)
  {
    v36 = (uint64_t)CFArrayGetValueAtIndex(a3, i);
    v37 = 0;
    v38 = (double *)&unk_254F23920;
    while (v19 != (uint64_t)(*v38 * (double)(v15 + (unint64_t)(double)(v36 / v7))
                           + (double)(v73 + (unint64_t)(double)(v36 % v7)) * *(v38 - 1))
         || v20 != v37)
    {
      ++v37;
      v38 += 2;
      if (v37 == 360)
        goto LABEL_43;
    }
    CFArrayAppendValue(Mutable, (const void *)v36);
LABEL_43:
    ;
  }
  v40 = (uint64_t)CFArrayGetValueAtIndex(Mutable, 0);
  v41 = (double)(v40 % v7);
  v42 = (double)(v40 / v7);
  v43 = cos((double)v20 * 3.14159265 / 180.0);
  v44 = CFArrayGetCount(Mutable);
  if (v44 < 2)
  {
    v60 = (double)(v40 / v7);
    v59 = (double)(v40 % v7);
  }
  else
  {
    v45 = v44;
    v75 = width;
    *(double *)&theArraya = height;
    v46 = sin((double)v20 * 3.14159265 / 180.0);
    v47 = fabs(v46);
    v48 = fabs(v43);
    v49 = -v46;
    v50 = 0.0;
    v51 = 1;
    v52 = v40;
    v53 = 0.0;
    do
    {
      v54 = (uint64_t)CFArrayGetValueAtIndex(Mutable, v51);
      v55 = v54 / v7;
      if (v47 <= v48)
      {
        v56 = v42;
      }
      else
      {
        v55 = v54 % v7;
        v56 = v41;
      }
      if (v47 > v48)
        v57 = v49;
      else
        v57 = v43;
      v58 = ((double)v55 - v56) / v57;
      if (v58 < v53)
      {
        v53 = v58;
        v52 = v54;
      }
      if (v58 > v50)
      {
        v50 = v58;
        v40 = v54;
      }
      ++v51;
    }
    while (v45 != v51);
    v59 = (double)(v52 % v7);
    v60 = (double)(v52 / v7);
    v41 = (double)(v40 % v7);
    v42 = (double)(v40 / v7);
    width = v75;
    height = *(double *)&theArraya;
  }
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v72, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", v59, v60, width, height);
  v62 = v61;
  v64 = v63;
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v72, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", v41, v42, width, height);
  v66 = v65;
  v68 = v67;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v62, v64);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v69;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v66, v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(Mutable);
  return v30;
}

int64x2_t __78__TSDMetalEdgeDistanceFieldTraceEffect_p_houghTransformWithZeroes_bufferSize___block_invoke()
{
  int64x2_t result;
  uint64_t v1;
  __double2 v2;
  __double2 v3;
  double *v4;
  int64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  int64x2_t v9;
  float64x2x2_t v10;

  result = (int64x2_t)xmmword_217C27AF0;
  v1 = 0x1FFFFFFFFFFFFD30;
  v6 = (float64x2_t)vdupq_n_s64(0x4066800000000000uLL);
  v7 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  v5 = vdupq_n_s64(2uLL);
  do
  {
    v9 = result;
    v8 = vdivq_f64(vmulq_f64(vcvtq_f64_s64(result), v7), v6);
    v2 = __sincos_stret(v8.f64[1]);
    v3 = __sincos_stret(v8.f64[0]);
    v10.val[1].f64[0] = v3.__sinval;
    v10.val[0].f64[0] = v3.__cosval;
    v10.val[0].f64[1] = v2.__cosval;
    v10.val[1].f64[1] = v2.__sinval;
    v4 = (double *)&p_houghTransformWithZeroes_bufferSize__s_CosSinArray[v1 + 720];
    vst2q_f64(v4, v10);
    result = vaddq_s64(v9, v5);
    v1 += 4;
  }
  while (v1 * 8);
  return result;
}

- (void)p_fillFloatBuffer:(float *)a3 withRGBAData:(char *)a4 bufferSize:(CGSize)a5
{
  uint64_t v5;
  char *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  double v13;
  double v14;
  float v15;

  v5 = (uint64_t)(a5.width * a5.height);
  if (v5 >= 1)
  {
    v6 = a4 + 3;
    do
    {
      v7 = *(v6 - 2);
      v8 = *(v6 - 1);
      v9 = *v6;
      if (*(v6 - 3))
        v10 = 0;
      else
        v10 = v7 == 0;
      if (v10 && v8 == 0 && v9 == 0)
      {
        v14 = 1.79769313e308;
      }
      else
      {
        v13 = ((double)v7 / 255.0 + (double)*(v6 - 3) + (double)v8 / 65025.0 + (double)v9 / 16581375.0)
            / 255.0
            + -0.5;
        v14 = v13 + v13;
      }
      v6 += 4;
      v15 = v14;
      *a3++ = v15;
      --v5;
    }
    while (v5);
  }
}

- (BOOL)p_generateTraceTextureInfoWithStrokeWidth:(double)a3 clockwise:(BOOL)a4 context:(id)a5 randomGenerator:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  const __CFAllocator *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  size_t v23;
  void *v24;
  char *v25;
  const __CFAllocator *v26;
  _BYTE *v27;
  unint64_t v28;
  double v29;
  _BYTE *v30;
  double v31;
  unint64_t v32;
  double v33;
  _BYTE *v34;
  CFIndex Count;
  double v36;
  float *v37;
  double v38;
  double v39;
  double v40;
  uint64_t ValueAtIndex;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  char *v45;
  double v46;
  const __CFArray *v47;
  double v48;
  CFIndex v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  int v58;
  double *v59;
  uint64_t v60;
  double v61;
  long double v62;
  double v63;
  double v64;
  long double v65;
  char *v66;
  char *v67;
  uint64_t v69;
  char v70;
  char v71;
  double *v72;
  double v73;
  double v74;
  char *v75;
  const __CFArray *v76;
  const __CFArray *v77;
  const __CFArray *v78;
  CFIndex v79;
  CFIndex v80;
  CFIndex i;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int16 v91;
  CFIndex j;
  uint64_t v93;
  double v94;
  char *v95;
  void *v96;
  float *v97;
  char *v98;
  double v99;
  double v100;
  size_t v101;
  TSDMetalEdgeDistanceFieldTraceEffect *v102;
  unint64_t v103;
  unint64_t v104;
  double v105;
  double v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  double v113;
  double v114;
  BOOL v115;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  __int16 v121;
  unint64_t k;
  unint64_t m;
  double v124;
  uint64_t v125;
  __int16 v126;
  char *v127;
  CGColorSpace *DeviceRGB;
  TSDMetalEdgeDistanceFieldTraceEffect *v129;
  CGDataProvider *v130;
  CGImage *v131;
  void *v132;
  uint64_t v133;
  TSDMetalTextureInfo *traceTextureInfo;
  double v136;
  CFIndex v137;
  size_t v138;
  void *v139;
  id v140;
  CFMutableArrayRef cf;
  const __CFArray *Mutable;
  id v143;
  uint64_t v144;
  uint64_t v145;
  TSDMetalEdgeDistanceFieldTraceEffect *v146;
  __CFArray *theArray;
  char *data;
  unsigned int v149;
  double v150;
  unint64_t v151;
  size_t width;
  const __CFAllocator *allocator;
  CFAllocatorRef allocatora;
  float *v155;
  _BOOL4 v156;
  char v157;
  __int128 v158;
  double v159;
  double v160;
  const __CFAllocator *v161;
  uint64_t v162;
  uint64_t v163;

  v156 = a4;
  v163 = *MEMORY[0x24BDAC8D0];
  v140 = a5;
  v143 = a6;
  if (!v143)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldTraceEffect p_generateTraceTextureInfoWithStrokeWidth:clockwise:context:randomGenerator:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 1781, CFSTR("invalid nil value for '%s'"), "randGen");

  }
  -[TSDMetalEdgeDistanceFieldTraceEffect edgeDistanceFieldTextureInfo](self, "edgeDistanceFieldTextureInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSDMetalEdgeDistanceFieldTraceEffect edgeDistanceFieldTextureInfo](self, "edgeDistanceFieldTextureInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "width");

  -[TSDMetalEdgeDistanceFieldTraceEffect edgeDistanceFieldTextureInfo](self, "edgeDistanceFieldTextureInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (const __CFAllocator *)objc_msgSend(v16, "height");

  -[TSDMetalEdgeDistanceFieldTraceEffect edgeDistanceFieldTextureInfo](self, "edgeDistanceFieldTextureInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19;
  v22 = v21;

  v23 = (_QWORD)v17 * v15;
  v158 = 0uLL;
  v159 = 0.0;
  v24 = malloc_type_malloc(4 * v23, 0xD778D90DuLL);
  *(_QWORD *)&v160 = v15;
  v161 = v17;
  v162 = 1;
  v138 = 4 * v15;
  v139 = v13;
  objc_msgSend(v13, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v24, v138, &v158, 0);
  v146 = self;
  v155 = (float *)malloc_type_calloc(4uLL, v23, 0xC1271245uLL);
  -[TSDMetalEdgeDistanceFieldTraceEffect p_fillFloatBuffer:withRGBAData:bufferSize:](self, "p_fillFloatBuffer:withRGBAData:bufferSize:", v20, v22);
  free(v24);
  v25 = (char *)malloc_type_calloc(4uLL, v23, 0xCDEA002BuLL);
  data = (char *)malloc_type_calloc(4uLL, v23, 0x62567561uLL);
  v26 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
  Mutable = CFArrayCreateMutable(v26, 0, 0);
  v27 = malloc_type_calloc(1uLL, v23, 0x6321D04EuLL);
  width = v15;
  allocator = v26;
  theArray = CFArrayCreateMutable(v26, v15, 0);
  v149 = v15;
  if (v15)
  {
    v28 = 0;
    if (v20 <= v22)
      v29 = v22;
    else
      v29 = v20;
    v30 = v27;
    v31 = a3 / v29;
    do
    {
      if ((_DWORD)v17)
      {
        v32 = 0;
        v33 = (double)v28;
        v34 = v30;
        do
        {
          if (v31 < fabsf(v155[(uint64_t)(v33 + v20 * (double)v32)])
            || TSDMetalEdgeDistanceFieldBufferPixelIsLocalMaximum((uint64_t)v155, (double)v28, (double)v32, v20, v22))
          {
            *v34 = 1;
          }
          else if (TSDMetalEdgeDistanceFieldBufferNeighborPixelIsZero((uint64_t)v155, (double)v28, (double)v32, v20, v22))
          {
            CFArrayAppendValue(theArray, (const void *)(uint64_t)(v33 + v20 * (double)v32));
          }
          ++v32;
          v34 += width;
        }
        while (v17 != (const __CFAllocator *)v32);
      }
      ++v28;
      ++v30;
    }
    while (v28 != width);
  }
  Count = CFArrayGetCount(theArray);
  if (Count <= 0)
  {
    v96 = v140;
    v97 = v155;
    v98 = data;
    goto LABEL_124;
  }
  v146->_zeroesArray = CFArrayCreateCopy(allocator, theArray);
  v146->_bufferSize.width = v20;
  v146->_bufferSize.height = v22;
  v36 = (double)(Count - 1);
  v137 = Count;
  objc_msgSend(v143, "doubleBetween::", 0.0, (double)Count);
  v37 = v155;
  if (v38 <= v36)
  {
    objc_msgSend(v143, "doubleBetween::", 0.0, (double)Count);
    v36 = v39;
  }
  allocatora = v17;
  v40 = (double)v149;
  ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(theArray, (uint64_t)v36);
  v42 = (uint64_t)v20;
  -[TSDMetalEdgeDistanceFieldTraceEffect p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:](v146, "p_normalizedPointInTexturedRectangleFrameFromPoint:inBufferSize:", (double)(ValueAtIndex % (uint64_t)v20), (double)(ValueAtIndex / (uint64_t)v20), v20, v22);
  v146->_randomStrokePoint.x = v43;
  v146->_randomStrokePoint.y = v44;
  if (CFArrayGetCount(theArray) < 1)
  {
    v144 = 0;
    v145 = 0;
    v77 = cf;
    goto LABEL_71;
  }
  v144 = 0;
  v145 = 0;
  v150 = v40 * 0.5;
  v45 = v25 + 3;
  v46 = INFINITY;
  v47 = cf;
  v136 = a3;
  do
  {
    v48 = INFINITY;
    do
    {
      if (!CFArrayGetCount(theArray))
      {
        v77 = v47;
        a3 = v136;
        goto LABEL_71;
      }
      v49 = CFArrayGetCount(theArray);
      v50 = (double)(unint64_t)(v49 - 1);
      v51 = (double)(unint64_t)v49;
      objc_msgSend(v143, "doubleBetween::", 0.0, (double)(unint64_t)v49);
      if (v52 <= v50)
      {
        objc_msgSend(v143, "doubleBetween::", 0.0, v51);
        v50 = v53;
      }
      v54 = (uint64_t)CFArrayGetValueAtIndex(theArray, (uint64_t)v50);
      CFArrayRemoveValueAtIndex(theArray, (uint64_t)v50);
      v55 = (double)(v54 % v42);
      v56 = (double)(v54 / v42);
      v57 = 4 * (uint64_t)(v55 + v20 * v56);
      if (v45[v57]
        || (v59 = (double *)&v158,
            (v60 = TSDMetalEdgeDistanceFieldBufferNeighborPixelsClosestToZero((uint64_t)v155, 2, &v158, v55, v56, v20, v22)) == 0))
      {
        v58 = 13;
        continue;
      }
      if (v60 == 1)
        goto LABEL_33;
      if (v60 == 2)
      {
        v61 = TSDSubtractPoints(*(double *)&v158, *((double *)&v158 + 1), v150);
        v63 = TSDAngleFromDelta(v61, v62);
        v64 = TSDSubtractPoints(v159, v160, v150);
        v59 = (double *)(&v158 + ((TSDAngleFromDelta(v64, v65) > v63) ^ v156));
LABEL_33:
        v46 = *v59;
        v48 = v59[1];
      }
      v58 = 12;
    }
    while (v58 == 13);
    v66 = &v25[v57];
    *(_WORD *)v66 = 0x8000;
    v66[3] = -1;
    -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v55, v56, v20, v22);
    v67 = &v25[4 * (uint64_t)(v46 + v20 * v48)];
    *(_WORD *)v67 = 0x7FFF;
    v67[3] = -1;
    -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v46, v48, v20, v22);
    if (v46 != v55 && v48 != v56)
    {
      v69 = 0;
      *(double *)&v158 = v55;
      *((double *)&v158 + 1) = v48;
      v70 = 1;
      v159 = v46;
      v160 = v56;
      do
      {
        v71 = v70;
        v72 = (double *)(&v158 + v69);
        v73 = *v72;
        v74 = v72[1];
        v75 = &v25[4 * (uint64_t)(*v72 + v20 * v74)];
        *(_WORD *)v75 = v69 + 0x7FFF;
        v75[3] = -1;
        -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", Mutable, v155, v25, data, v27, v73, v74, v20, v22);
        v70 = 0;
        v69 = 1;
      }
      while ((v71 & 1) != 0);
    }
    if (CFArrayGetCount(Mutable) < 1)
    {
      v77 = v47;
      v76 = Mutable;
      a3 = v136;
    }
    else
    {
      v76 = Mutable;
      a3 = v136;
      do
      {
        v77 = v76;
        v78 = v47;
        v79 = CFArrayGetCount(v76);
        if (v79 >= 1)
        {
          v80 = v79;
          for (i = 0; i != v80; ++i)
          {
            v82 = (uint64_t)CFArrayGetValueAtIndex(v77, i);
            v83 = (double)(v82 % v42);
            v84 = (double)(v82 / v42);
            v85 = 4 * (uint64_t)(v83 + v20 * v84);
            if (!v45[v85])
            {
              v86 = &data[v85];
              if (!data[v85 + 3])
              {
                v87 = TSDMetalEdgeDistanceFieldBufferSurroundingTracePixelValueClosestToZero((uint64_t)v25, 0, (double)(v82 % v42), (double)(v82 / v42), v20, v22);
                if (v87 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v88 = ((v87 >> 63) | 1) + v87;
                  if (v145 >= v88)
                    v89 = ((v87 >> 63) | 1) + v87;
                  else
                    v89 = v145;
                  v90 = v144;
                  if (v144 <= v88)
                    v90 = ((v87 >> 63) | 1) + v87;
                  v144 = v90;
                  v145 = v89;
                  v91 = v88 + 0x8000;
                  if (v88 < -32768)
                    v91 = v88 - 32513;
                  *v86 = v88;
                  v86[1] = HIBYTE(v91);
                  v86[3] = -1;
                }
                -[TSDMetalEdgeDistanceFieldTraceEffect p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:](v146, "p_addNearbyPixelsToArray:pixel:edgeDataBuffer:dataBuffer:tempDataBuffer:localMaximumLookupBuffer:bufferSize:", v78, v155, v25, data, v27, v83, v84, v20, v22);
              }
            }
          }
          for (j = 0; j != v80; ++j)
          {
            v93 = (uint64_t)CFArrayGetValueAtIndex(v77, j);
            v94 = (double)(v93 % v42) + v20 * (double)(v93 / v42);
            v95 = &v25[4 * (uint64_t)v94];
            if (!v95[3])
            {
              *(_WORD *)v95 = *(_WORD *)&data[4 * (uint64_t)v94];
              v95[3] = -1;
            }
          }
        }
        CFArrayRemoveAllValues(v77);
        v76 = v78;
        v47 = v77;
      }
      while (CFArrayGetCount(v78) > 0);
    }
    Mutable = v76;
    v47 = v77;
    v46 = INFINITY;
  }
  while (CFArrayGetCount(theArray) >= 1);
LABEL_71:
  cf = v77;
  if (v20 <= v22)
    v99 = v22;
  else
    v99 = v20;
  v100 = a3 / v99;
  v101 = (size_t)allocatora;
  v102 = v146;
  while (2)
  {
    if (!(_DWORD)width)
      goto LABEL_123;
    v103 = 0;
    v157 = 1;
    while (2)
    {
      v151 = v103;
      if (!(_DWORD)v101)
        goto LABEL_114;
      v104 = 0;
      v105 = (double)v103;
      while (2)
      {
        v106 = v105 + v20 * (double)v104;
        v107 = &v25[4 * (uint64_t)v106];
        if (v107[3])
          goto LABEL_113;
        if (v100 < fabsf(v37[(uint64_t)v106]))
        {
          *(_WORD *)v107 = -1;
          v107[3] = -1;
          goto LABEL_113;
        }
        v108 = 0;
        v109 = 0;
        v110 = 0;
        v111 = 0x7FFFFFFFFFFFFFFFLL;
        v112 = 1;
        while (2)
        {
          v113 = TSDAddPoints(v105, (double)v104, *(double *)&kNeighboring8Points[v108]);
          if (v113 < 0.0)
            goto LABEL_93;
          v115 = v114 >= 0.0 && v113 < v20;
          if (!v115 || v114 >= v22)
            goto LABEL_93;
          if (v27[(int)(v113 + v114 * v40)])
            goto LABEL_93;
          v118 = &v25[4 * (uint64_t)(v113 + v20 * v114)];
          if (!v118[3])
            goto LABEL_93;
          v119 = *(unsigned __int16 *)v118;
          if (v119 == 0xFFFF)
            goto LABEL_93;
          v117 = v119 - 0x8000;
          if (v111 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v157 = 0;
            v112 = 0;
            v110 = v117;
            v109 = v117;
            goto LABEL_94;
          }
          if (v117 >= v111)
          {
            v157 = 0;
            v112 = 0;
            if (v117 >= v109)
              v110 = v109;
            else
              v110 = v117;
            if (v117 > v109)
              v109 = v117;
LABEL_93:
            v117 = v111;
            goto LABEL_94;
          }
          v157 = 0;
          v112 = 0;
          v110 = v111;
LABEL_94:
          v108 += 2;
          v111 = v117;
          if (v108 != 8)
            continue;
          break;
        }
        v101 = (size_t)allocatora;
        if ((v112 & 1) == 0)
        {
          v120 = ((v110 >> 63) | 1) + v110;
          v121 = v120 + 0x8000;
          if (v120 < -32768)
            v121 = v120 - 32513;
          *v107 = v120;
          v107[1] = HIBYTE(v121);
          v107[3] = -1;
          v27[(int)(v105 + (double)v104 * v40)] = 0;
        }
        v37 = v155;
LABEL_113:
        if (++v104 != v101)
          continue;
        break;
      }
LABEL_114:
      v103 = v151 + 1;
      if (v151 + 1 != width)
        continue;
      break;
    }
    v102 = v146;
    if ((v157 & 1) == 0)
      continue;
    break;
  }
  for (k = 0; k != width; ++k)
  {
    if ((_DWORD)v101)
    {
      for (m = 0; m != v101; ++m)
      {
        v124 = (double)k + v20 * (double)m;
        v125 = *(unsigned __int16 *)&v25[4 * (uint64_t)v124] - v145;
        v126 = v125 + 0x8000;
        if (v125 - 0x8000 < 0)
          v126 = v125 - 32513;
        v127 = &data[4 * (uint64_t)v124];
        *v127 = v125;
        v127[1] = HIBYTE(v126);
        v127[3] = -1;
      }
    }
  }
LABEL_123:
  v102->_traceTextureMaxValue = v144 - v145;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v98 = data;
  v129 = v102;
  v130 = CGDataProviderCreateWithData(0, data, v138 * v101, 0);
  v131 = CGImageCreate(width, v101, 8uLL, 0x20uLL, v138, DeviceRGB, 3u, v130, 0, 0, kCGRenderingIntentDefault);
  v96 = v140;
  objc_msgSend(v140, "device");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSDMetalTextureInfo textureInfoWithCGImage:forDevice:](TSDMetalTextureInfo, "textureInfoWithCGImage:forDevice:", v131, v132);
  v133 = objc_claimAutoreleasedReturnValue();
  traceTextureInfo = v129->_traceTextureInfo;
  v129->_traceTextureInfo = (TSDMetalTextureInfo *)v133;

  CGColorSpaceRelease(DeviceRGB);
  CGDataProviderRelease(v130);
  v97 = v155;
  CGImageRelease(v131);
  Count = v137;
LABEL_124:
  free(v97);
  free(v25);
  free(v98);
  free(v27);
  CFRelease(theArray);
  CFRelease(cf);
  CFRelease(Mutable);

  return Count > 0;
}

- (void)p_addNearbyPixelsToArray:(__CFArray *)a3 pixel:(CGPoint)a4 edgeDataBuffer:(float *)a5 dataBuffer:(char *)a6 tempDataBuffer:(char *)a7 localMaximumLookupBuffer:(BOOL *)a8 bufferSize:(CGSize)a9
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  char *v16;
  char *v17;
  double v18;
  double v19;
  double v22;
  uint64_t v23;

  height = a9.height;
  width = a9.width;
  y = a4.y;
  x = a4.x;
  v15 = 0;
  v16 = a6 + 3;
  v17 = a7 + 3;
  do
  {
    v18 = TSDAddPoints(x, y, *(double *)&kNeighboring8Points[v15]);
    if (v18 >= 0.0 && v19 >= 0.0 && v18 < width && v19 < height)
    {
      v22 = v18 + width * v19;
      v23 = 4 * (uint64_t)v22;
      if (!v16[v23] && !v17[v23] && !a8[(int)v22])
        CFArrayAppendValue(a3, (const void *)(uint64_t)v22);
    }
    v15 += 2;
  }
  while (v15 != 8);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (TSDMetalTextureInfo)edgeDistanceFieldTextureInfo
{
  return self->_edgeDistanceFieldTextureInfo;
}

- (TSDMetalTextureInfo)traceTextureInfo
{
  return self->_traceTextureInfo;
}

- (TSDMetalShader)shader
{
  return self->_shader;
}

- (CGPoint)randomStrokePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_randomStrokePoint.x;
  y = self->_randomStrokePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (TSDAnimationRandomGenerator)randomGenerator
{
  return self->_randomGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_traceTextureInfo, 0);
  objc_storeStrong((id *)&self->_edgeDistanceFieldTextureInfo, 0);
  objc_storeStrong((id *)&self->_strokeLineSegment, 0);
}

@end
