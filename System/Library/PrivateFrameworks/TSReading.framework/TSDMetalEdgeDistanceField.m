@implementation TSDMetalEdgeDistanceField

+ (void)willBeginWithDevice:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v3 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  if (!s_TSDMetalEdgeDistanceFieldShaderReferenceCount)
  {
    v4 = a3;
    +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_CopyToSquare"));
    v35 = 0;
    v7 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v6, &v35);
    v8 = v35;
    v9 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
    s_TSDMetalEdgeDistanceField_copyToSquarePipeline = v7;

    v10 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_Seed"));
    v34 = v8;
    v11 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v10, &v34);
    v12 = v34;

    v13 = (void *)s_TSDMetalEdgeDistanceField_seedPipeline;
    s_TSDMetalEdgeDistanceField_seedPipeline = v11;

    v14 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_Flood"));
    v33 = v12;
    v15 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v14, &v33);
    v16 = v33;

    v17 = (void *)s_TSDMetalEdgeDistanceField_floodPipeline;
    s_TSDMetalEdgeDistanceField_floodPipeline = v15;

    v18 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_Combine"));
    v32 = v16;
    v19 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v18, &v32);
    v20 = v32;

    v21 = (void *)s_TSDMetalEdgeDistanceField_combinePipeline;
    s_TSDMetalEdgeDistanceField_combinePipeline = v19;

    v22 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_CombineByte"));
    v31 = v20;
    v23 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v22, &v31);
    v24 = v31;

    v25 = (void *)s_TSDMetalEdgeDistanceField_combineBytePipeline;
    s_TSDMetalEdgeDistanceField_combineBytePipeline = v23;

    v26 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("TSDMetalEdgeDistanceField_Gradient"));
    v30 = v24;
    v27 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v26, &v30);

    v28 = v30;
    v29 = (void *)s_TSDMetalEdgeDistanceField_gradientPipeline;
    s_TSDMetalEdgeDistanceField_gradientPipeline = v27;

    v3 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  }
  s_TSDMetalEdgeDistanceFieldShaderReferenceCount = v3 + 1;
}

+ (void)didEndWithDevice:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v4 = s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  v5 = --s_TSDMetalEdgeDistanceFieldShaderReferenceCount;
  if (v4 <= 0)
  {
    v16 = v3;
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalEdgeDistanceField didEndWithDevice:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 148, CFSTR("overreleasing pipeline reference count!"));

    v3 = v16;
    if (s_TSDMetalEdgeDistanceFieldShaderReferenceCount)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
    s_TSDMetalEdgeDistanceField_copyToSquarePipeline = 0;
    v17 = v3;

    v10 = (void *)s_TSDMetalEdgeDistanceField_seedPipeline;
    s_TSDMetalEdgeDistanceField_seedPipeline = 0;

    v11 = (void *)s_TSDMetalEdgeDistanceField_floodPipeline;
    s_TSDMetalEdgeDistanceField_floodPipeline = 0;

    v12 = (void *)s_TSDMetalEdgeDistanceField_copyToSquarePipeline;
    s_TSDMetalEdgeDistanceField_copyToSquarePipeline = 0;

    v13 = (void *)s_TSDMetalEdgeDistanceField_combinePipeline;
    s_TSDMetalEdgeDistanceField_combinePipeline = 0;

    v14 = (void *)s_TSDMetalEdgeDistanceField_combineBytePipeline;
    s_TSDMetalEdgeDistanceField_combineBytePipeline = 0;

    v15 = (void *)s_TSDMetalEdgeDistanceField_gradientPipeline;
    s_TSDMetalEdgeDistanceField_gradientPipeline = 0;

    v3 = v17;
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:

}

- (TSDMetalEdgeDistanceField)initWithTexture:(id)a3 textureSize:(CGSize)a4 edgeInsets:(UIEdgeInsets)a5 downsampleScale:(double)a6 metalContext:(id)a7 capabilities:(id)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  TSDMetalEdgeDistanceField *v26;
  TSDMetalEdgeDistanceField *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v42;
  objc_super v43;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v19 = a3;
  v20 = a7;
  v21 = a8;
  if (a6 <= 0.0 || a6 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceField initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 163, CFSTR("Invalid value for downsampleScale, expected (0,1]: %f"), *(_QWORD *)&a6);

  }
  v43.receiver = self;
  v43.super_class = (Class)TSDMetalEdgeDistanceField;
  v26 = -[TSDMetalEdgeDistanceField init](&v43, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_metalContext, a7);
    objc_storeStrong((id *)&v27->_inputTexture, a3);
    v27->_textureSize.width = width;
    v27->_textureSize.height = height;
    v42 = bottom;
    v27->_edgeInsets.top = top;
    v27->_edgeInsets.left = left;
    v28 = left;
    v27->_edgeInsets.bottom = bottom;
    v27->_edgeInsets.right = right;
    v29 = right;
    objc_msgSend(v20, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "maximumMetalTextureSizeForDevice:", v30);
    v32 = v31;
    v34 = v33;

    v35 = ceil(width * a6);
    if (v35 >= v32)
    {
      a6 = v32 / v35 * a6;
      TSDMultiplySizeScalar(v27->_textureSize.width, v27->_textureSize.height, 1.0 / a6);
    }
    else
    {
      v36 = ceil(height * a6);
    }
    if (v36 >= v34)
      a6 = a6 * (v34 / v36);
    v27->_downsampleScale = a6;
    v37 = ceil(width * a6) - (v28 + v29);
    v38 = ceil(height * a6) - (top + v42);
    v27->_resultTextureSize.width = v37;
    v27->_resultTextureSize.height = v38;
    if (v37 <= v38)
      v37 = v38;
    v39 = (double)(uint64_t)v37;
    if (v32 <= v39)
      v39 = v32;
    v40 = (double)(uint64_t)v39;
    v27->_squareSize.width = v40;
    v27->_squareSize.height = v40;
  }

  return v27;
}

- (void)p_setupTextures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *exteriorTextures;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *interiorTextures;
  MTLTexture *v13;
  MTLTexture *combineTexture;
  MTLTexture *v15;
  MTLTexture *resultTexture;
  MTLTexture *v17;
  MTLTexture *combineByteTexture;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 110, (unint64_t)self->_squareSize.width, (unint64_t)self->_squareSize.height, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsage:", 0);
  objc_msgSend(v3, "setStorageMode:", 2);
  -[TSDMetalContext device](self->_metalContext, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  v20[0] = v5;
  v6 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  v20[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  exteriorTextures = self->_exteriorTextures;
  self->_exteriorTextures = v7;

  v9 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  v19[0] = v9;
  v10 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  v19[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  interiorTextures = self->_interiorTextures;
  self->_interiorTextures = v11;

  objc_msgSend(v3, "setWidth:", (unint64_t)self->_resultTextureSize.width);
  objc_msgSend(v3, "setHeight:", (unint64_t)self->_resultTextureSize.height);
  objc_msgSend(v3, "setPixelFormat:", 115);
  objc_msgSend(v3, "setStorageMode:", 0);
  v13 = (MTLTexture *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  combineTexture = self->_combineTexture;
  self->_combineTexture = v13;

  v15 = (MTLTexture *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  resultTexture = self->_resultTexture;
  self->_resultTexture = v15;

  objc_msgSend(v3, "setPixelFormat:", 70);
  v17 = (MTLTexture *)objc_msgSend(v4, "newTextureWithDescriptor:", v3);
  combineByteTexture = self->_combineByteTexture;
  self->_combineByteTexture = v17;

}

- (void)p_dispatchThreadgroupsWithEncoder:(id)a3 pipelineState:(id)a4 texture:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v8, "threadExecutionWidth");
  v11 = objc_msgSend(v8, "maxTotalThreadsPerThreadgroup");

  v12 = v11 / v10;
  v13 = (v10 + objc_msgSend(v7, "width") - 1) / v10;
  v14 = objc_msgSend(v7, "height");

  v16[0] = v13;
  v16[1] = (v12 + v14 - 1) / v12;
  v16[2] = 1;
  v15[0] = v10;
  v15[1] = v12;
  v15[2] = 1;
  objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", v16, v15);

}

- (void)p_writeWithCommandBuffer:(id)a3 intoSquareTexture:(id)a4
{
  id v6;
  void *v7;
  int32x2_t v8;

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", s_TSDMetalEdgeDistanceField_copyToSquarePipeline);
  v8 = vrev64_s32(vmovn_s64((int64x2_t)vcvtq_u64_f64(vnegq_f64(*(float64x2_t *)&self->_edgeInsets.top))));
  objc_msgSend(v7, "setBytes:length:atIndex:", &v8, 8, 0);
  objc_msgSend(v7, "setTexture:atIndex:", self->_inputTexture, 0);
  objc_msgSend(v7, "setTexture:atIndex:", v6, 1);
  -[TSDMetalEdgeDistanceField p_dispatchThreadgroupsWithEncoder:pipelineState:texture:](self, "p_dispatchThreadgroupsWithEncoder:pipelineState:texture:", v7, s_TSDMetalEdgeDistanceField_copyToSquarePipeline, v6);

  objc_msgSend(v7, "endEncoding");
}

- (void)p_seedWithCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(id)a5 invertSeed:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  float v14;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setComputePipelineState:", s_TSDMetalEdgeDistanceField_seedPipeline);
  v13 = 0x3F00008047800000;
  v14 = (float)v6;
  objc_msgSend(v12, "setBytes:length:atIndex:", &v13, 12, 0);
  objc_msgSend(v12, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v12, "setTexture:atIndex:", v10, 1);

  -[TSDMetalEdgeDistanceField p_dispatchThreadgroupsWithEncoder:pipelineState:texture:](self, "p_dispatchThreadgroupsWithEncoder:pipelineState:texture:", v12, s_TSDMetalEdgeDistanceField_seedPipeline, v11);
  objc_msgSend(v12, "endEncoding");

}

- (unint64_t)p_floodTextures:(id)a3 currentIndex:(unint64_t)a4 maxDistance:(int64_t)a5 commandBuffer:(id)a6
{
  id v10;
  id v11;
  CGFloat v12;
  int64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v21;
  uint64_t v22;

  v10 = a3;
  v11 = a6;
  v12 = self->_squareSize.width * 0.5;
  v13 = (uint64_t)v12;
  if (a5 >= 1)
    v13 = a5;
  if (v12 > 16384.0)
    v12 = 16384.0;
  v14 = v13 + 1;
  if (v12 >= (double)v14)
    v12 = (double)v14;
  v15 = vcvtpd_s64_f64(log(v12));
  if (v15 >= 1)
  {
    do
    {
      objc_msgSend(v11, "computeCommandEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setComputePipelineState:", s_TSDMetalEdgeDistanceField_floodPipeline);
      v21 = v15;
      v22 = 0x4080000047800000;
      objc_msgSend(v16, "setBytes:length:atIndex:", &v21, 12, 0);
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = (a4 & 1) == 0;
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTexture:atIndex:", v17, 0);
      objc_msgSend(v16, "setTexture:atIndex:", v18, 1);
      -[TSDMetalEdgeDistanceField p_dispatchThreadgroupsWithEncoder:pipelineState:texture:](self, "p_dispatchThreadgroupsWithEncoder:pipelineState:texture:", v16, s_TSDMetalEdgeDistanceField_floodPipeline, v17);
      objc_msgSend(v16, "endEncoding");

      v19 = v15 > 1;
      v15 = v15 >> 1;
    }
    while (v19);
  }

  return a4;
}

- (id)p_combinedTexturesWithIndex:(unint64_t)a3 floatTexture:(BOOL)a4 commandBuffer:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  id v12;
  float v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  float v19;

  v5 = a4;
  objc_msgSend(a5, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &s_TSDMetalEdgeDistanceField_combinePipeline;
  if (!v5)
    v9 = &s_TSDMetalEdgeDistanceField_combineBytePipeline;
  v10 = (void *)*v9;
  if (v5)
    v11 = 128;
  else
    v11 = 136;
  v12 = v10;
  objc_msgSend(v8, "setComputePipelineState:", v12);
  v18 = 0x4080000047800000;
  v13 = 4.0 / self->_squareSize.width;
  v19 = v13;
  objc_msgSend(v8, "setBytes:length:atIndex:", &v18, 12, 0);
  v14 = *(id *)((char *)&self->super.isa + v11);
  -[NSArray objectAtIndexedSubscript:](self->_interiorTextures, "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTexture:atIndex:", v15, 0);

  -[NSArray objectAtIndexedSubscript:](self->_exteriorTextures, "objectAtIndexedSubscript:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTexture:atIndex:", v16, 1);

  objc_msgSend(v8, "setTexture:atIndex:", v14, 2);
  -[TSDMetalEdgeDistanceField p_dispatchThreadgroupsWithEncoder:pipelineState:texture:](self, "p_dispatchThreadgroupsWithEncoder:pipelineState:texture:", v8, v12, v14);
  objc_msgSend(v8, "endEncoding");

  return v14;
}

- (id)p_gradientTextureWithCommandBuffer:(id)a3
{
  void *v4;
  MTLTexture *v5;

  objc_msgSend(a3, "computeCommandEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComputePipelineState:", s_TSDMetalEdgeDistanceField_gradientPipeline);
  objc_msgSend(v4, "setTexture:atIndex:", self->_combineTexture, 0);
  objc_msgSend(v4, "setTexture:atIndex:", self->_resultTexture, 1);
  -[TSDMetalEdgeDistanceField p_dispatchThreadgroupsWithEncoder:pipelineState:texture:](self, "p_dispatchThreadgroupsWithEncoder:pipelineState:texture:", v4, s_TSDMetalEdgeDistanceField_gradientPipeline, self->_resultTexture);
  objc_msgSend(v4, "endEncoding");
  v5 = self->_resultTexture;

  return v5;
}

+ (id)distanceFieldTextureWithTexture:(id)a3 textureSize:(CGSize)a4 maxDistance:(int64_t)a5 edgeInsets:(UIEdgeInsets)a6 downsampleScale:(double)a7 floatTexture:(BOOL)a8 makeCPUReadable:(BOOL)a9 metalContext:(id)a10 capabilities:(id)a11
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  TSDMetalEdgeDistanceField *v36;
  NSArray *interiorTextures;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  NSArray *v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  _BOOL4 v60;
  id v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v59 = a8;
  v60 = a9;
  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a4.height;
  width = a4.width;
  v70 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v22 = a10;
  v23 = a11;
  objc_msgSend(v22, "device");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 393, CFSTR("invalid nil value for '%s'"), "metalDevice");

  }
  objc_msgSend(v22, "commandQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 395, CFSTR("invalid nil value for '%s'"), "commandQueue");

  }
  v58 = v28;
  objc_msgSend(v28, "commandBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, v35, 397, CFSTR("invalid nil value for '%s'"), "commandBuffer");

  }
  v61 = a1;
  v62 = (void *)v24;
  objc_msgSend(a1, "willBeginWithDevice:", v24);
  v36 = -[TSDMetalEdgeDistanceField initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:]([TSDMetalEdgeDistanceField alloc], "initWithTexture:textureSize:edgeInsets:downsampleScale:metalContext:capabilities:", v21, v22, v23, width, height, top, left, bottom, right, a7);
  -[TSDMetalEdgeDistanceField p_setupTextures](v36, "p_setupTextures");
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  interiorTextures = v36->_interiorTextures;
  v68[0] = v36->_exteriorTextures;
  v68[1] = interiorTextures;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v39)
  {
    v40 = v39;
    v55 = v23;
    v56 = v22;
    v57 = v21;
    v41 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v65 != v41)
          objc_enumerationMutation(v38);
        v43 = *(NSArray **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v44 = v43 == v36->_interiorTextures;
        -[NSArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSDMetalEdgeDistanceField p_writeWithCommandBuffer:intoSquareTexture:](v36, "p_writeWithCommandBuffer:intoSquareTexture:", v32, v45);

        -[NSArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSDMetalEdgeDistanceField p_seedWithCommandBuffer:fromTexture:toTexture:invertSeed:](v36, "p_seedWithCommandBuffer:fromTexture:toTexture:invertSeed:", v32, v46, v47, v44);

        v48 = -[TSDMetalEdgeDistanceField p_floodTextures:currentIndex:maxDistance:commandBuffer:](v36, "p_floodTextures:currentIndex:maxDistance:commandBuffer:", v43, 1, a5, v32);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v40);
    v22 = v56;
    v21 = v57;
    v23 = v55;
  }
  else
  {
    v48 = 0;
  }

  -[TSDMetalEdgeDistanceField p_combinedTexturesWithIndex:floatTexture:commandBuffer:](v36, "p_combinedTexturesWithIndex:floatTexture:commandBuffer:", v48, v59, v32);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v59)
  {
    -[TSDMetalEdgeDistanceField p_gradientTextureWithCommandBuffer:](v36, "p_gradientTextureWithCommandBuffer:", v32);
    v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = v49;
  }
  v52 = v51;
  objc_msgSend(v32, "commit");
  if (v60)
    objc_msgSend(v32, "waitUntilCompleted");
  +[TSDMetalTextureInfo textureInfoWithName:width:height:containsMipmaps:](TSDMetalTextureInfo, "textureInfoWithName:width:height:containsMipmaps:", v52, v36->_resultTextureSize.width, v36->_resultTextureSize.height, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "didEndWithDevice:", v62);

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTexture, 0);
  objc_storeStrong((id *)&self->_combineByteTexture, 0);
  objc_storeStrong((id *)&self->_combineTexture, 0);
  objc_storeStrong((id *)&self->_interiorTextures, 0);
  objc_storeStrong((id *)&self->_exteriorTextures, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
