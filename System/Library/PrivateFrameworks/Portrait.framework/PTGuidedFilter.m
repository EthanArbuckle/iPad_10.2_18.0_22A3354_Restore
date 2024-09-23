@implementation PTGuidedFilter

- (PTGuidedFilter)initWithMetalContext:(id)a3 inputSize:(id *)a4 epsilon:(float)a5
{
  id v8;
  PTGuidedFilter *v9;
  PTGuidedFilter *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  MTLComputePipelineState *averageUpsamplingCoefficients;
  BOOL v16;
  uint64_t v17;
  MTLComputePipelineState *computeWeightedUpsamplingCoefficients;
  void *v19;
  uint64_t v20;
  MTLTexture *edges;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  PTGuidedFilter *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  MTLComputePipelineState *computeUpsamplingCoefficients;
  MTLComputePipelineState **applyUpsamplingCoefficients;
  uint64_t v41;
  MTLComputePipelineState *v42;
  int v43;
  void *v44;
  uint64_t v45;
  MTLTexture *coeffTexture;
  void *v47;
  uint64_t v48;
  MTLTexture *coeffAveragedTexture;
  PTRaytracingUtils *v50;
  PTRaytracingUtils *utils;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v95;
  char v96;
  int v97;
  int v98;
  objc_super v99;

  v8 = a3;
  v99.receiver = self;
  v99.super_class = (Class)PTGuidedFilter;
  v9 = -[PTGuidedFilter init](&v99, sel_init);
  v10 = v9;
  if (!v9)
  {
    v30 = 0;
    goto LABEL_33;
  }
  v97 = 1;
  v98 = 0;
  v96 = 0;
  v9->_edgeTolerance = 1.0;
  *(_WORD *)&v9->_useHighresGuideForComputingCoefficients = 0;
  v11 = (void *)objc_opt_new();
  *(float *)&v12 = a5;
  objc_msgSend(v11, "setConstantFloat:withName:", CFSTR("kFilterEpsilon_float"), v12);
  LODWORD(v13) = 981668463;
  objc_msgSend(v11, "setConstantFloat:withName:", CFSTR("kFilterWeightEpsilon_float"), v13);
  objc_msgSend(v11, "setConstantValue:type:withName:", &v97, 29, CFSTR("kFilterRadius"));
  objc_msgSend(v11, "setConstantValue:type:withName:", &v98, 29, CFSTR("kFilterSamplePattern"));
  objc_msgSend(v11, "setConstantValue:type:withName:", &v96, 53, CFSTR("kFilterSqrtGuide"));
  objc_msgSend(v8, "computePipelineStateFor:withConstants:", CFSTR("guidedFilterAverageUpsamplingCoefficients"), v11);
  v14 = objc_claimAutoreleasedReturnValue();
  averageUpsamplingCoefficients = v10->_averageUpsamplingCoefficients;
  v10->_averageUpsamplingCoefficients = (MTLComputePipelineState *)v14;

  if (v10->_averageUpsamplingCoefficients)
  {
    v16 = (v98 - 5) >= 5;
    v10->_useWeightedSampling = (v98 - 5) < 5;
    if (v16)
    {
      objc_msgSend(v8, "computePipelineStateFor:withConstants:", CFSTR("guidedFilterComputeUpsamplingCoefficients"), v11);
      v38 = objc_claimAutoreleasedReturnValue();
      computeUpsamplingCoefficients = v10->_computeUpsamplingCoefficients;
      v10->_computeUpsamplingCoefficients = (MTLComputePipelineState *)v38;

      if (v10->_computeUpsamplingCoefficients)
        goto LABEL_12;
      _PTLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.8(v22, v66, v67, v68, v69, v70, v71, v72);
    }
    else
    {
      objc_msgSend(v8, "computePipelineStateFor:withConstants:", CFSTR("computeWeightedUpsamplingCoefficients"), v11);
      v17 = objc_claimAutoreleasedReturnValue();
      computeWeightedUpsamplingCoefficients = v10->_computeWeightedUpsamplingCoefficients;
      v10->_computeWeightedUpsamplingCoefficients = (MTLComputePipelineState *)v17;

      if (v10->_computeWeightedUpsamplingCoefficients)
      {
        objc_msgSend(v8, "textureUtil");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 10);
        v20 = objc_claimAutoreleasedReturnValue();
        edges = v10->_edges;
        v10->_edges = (MTLTexture *)v20;

        if (!v10->_edges)
        {
          _PTLogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.3(v22, v23, v24, v25, v26, v27, v28, v29);
          goto LABEL_31;
        }
LABEL_12:
        v95 = 0;
        applyUpsamplingCoefficients = v10->_applyUpsamplingCoefficients;
        do
        {
          objc_msgSend(v11, "setConstantValue:type:withName:", &v95, 33, CFSTR("kFilterMode"));
          objc_msgSend(v8, "computePipelineStateFor:withConstants:", CFSTR("guidedFilterApplyUpsamplingCoefficients"), v11);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = applyUpsamplingCoefficients[v95];
          applyUpsamplingCoefficients[v95] = (MTLComputePipelineState *)v41;

          v43 = v95;
          if (!applyUpsamplingCoefficients[v95])
          {
            _PTLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.4(v22, v52, v53, v54, v55, v56, v57, v58);
            goto LABEL_31;
          }
          ++v95;
        }
        while ((v43 + 1) <= 2);
        objc_msgSend(v8, "textureUtil");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 115);
        v45 = objc_claimAutoreleasedReturnValue();
        coeffTexture = v10->_coeffTexture;
        v10->_coeffTexture = (MTLTexture *)v45;

        if (v10->_coeffTexture)
        {
          objc_msgSend(v8, "textureUtil");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 115);
          v48 = objc_claimAutoreleasedReturnValue();
          coeffAveragedTexture = v10->_coeffAveragedTexture;
          v10->_coeffAveragedTexture = (MTLTexture *)v48;

          if (v10->_coeffAveragedTexture)
          {
            v50 = -[PTRaytracingUtils initWithMetalContext:]([PTRaytracingUtils alloc], "initWithMetalContext:", v8);
            utils = v10->_utils;
            v10->_utils = v50;

            if (v10->_utils)
            {
              v30 = v10;
              goto LABEL_32;
            }
            _PTLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.7(v22, v87, v88, v89, v90, v91, v92, v93);
          }
          else
          {
            _PTLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.6(v22, v80, v81, v82, v83, v84, v85, v86);
          }
        }
        else
        {
          _PTLogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.5(v22, v73, v74, v75, v76, v77, v78, v79);
        }
        goto LABEL_31;
      }
      _PTLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.2(v22, v59, v60, v61, v62, v63, v64, v65);
    }
  }
  else
  {
    _PTLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.1(v22, v31, v32, v33, v34, v35, v36, v37);
  }
LABEL_31:

  v30 = 0;
LABEL_32:

LABEL_33:
  return v30;
}

- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImage:(id)a7 sourceColorBitDepth:(int)a8 postModifierPtr:(PTPostModifier *)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v25[0] = a7;
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v15, "arrayWithObjects:count:", v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = a8;
  v22 = -[PTGuidedFilter guidedFilter:filterMode:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:postModifierPtr:](self, "guidedFilter:filterMode:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:postModifierPtr:", v20, a9 != 0, v19, v18, v17, v21, v24, 0, a9);

  return v22;
}

- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImageArray:(id)a7 sourceColorBitDepth:(int)a8 postModifierBuffer:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = objc_msgSend(v19, "count");
  if (v20 || v21 != 1)
  {
    if (v20 && (unint64_t)objc_msgSend(v19, "count") <= 2)
    {
      v24 = 3 * objc_msgSend(v19, "count");
      if (objc_msgSend(v20, "length") >= (unint64_t)(4 * v24))
      {
        if (objc_msgSend(v19, "count") == 1)
          v22 = 1;
        else
          v22 = 2;
        goto LABEL_4;
      }
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:].cold.2(v20, 4 * v24, v25);
    }
    else
    {
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:].cold.1(v19, v25);
    }

    v23 = -10;
    goto LABEL_13;
  }
  v22 = 0;
LABEL_4:
  LODWORD(v27) = a8;
  v23 = -[PTGuidedFilter guidedFilter:filterMode:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:postModifierPtr:](self, "guidedFilter:filterMode:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:postModifierPtr:", v15, v22, v16, v17, v18, v19, v27, v20, 0);
LABEL_13:

  return v23;
}

- (int)guidedFilter:(id)a3 filterMode:(int)a4 image:(id)a5 guideRGBACoefficients:(id)a6 guideRGBAUpscale:(id)a7 upscaledImageArray:(id)a8 sourceColorBitDepth:(int)a9 postModifierBuffer:(id)a10 postModifierPtr:(PTPostModifier *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  float v24;
  id v25;
  double v26;
  _BOOL4 v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v31;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  if (a9 == 8)
    v24 = 1.0;
  else
    v24 = 0.16667;
  if (self->_useWeightedSampling)
  {
    *(float *)&v23 = self->_edgeTolerance;
    -[PTRaytracingUtils sobelEdgeDetection:inImage:outEdges:edgeTolerance:](self->_utils, "sobelEdgeDetection:inImage:outEdges:edgeTolerance:", v17, v18, self->_edges, v23);
  }
  if (self->_useHighresGuideForComputingCoefficients)
    v25 = v20;
  else
    v25 = v19;
  *(float *)&v23 = v24;
  -[PTGuidedFilter computeUpsamplingCoefficients:guideTexture:imageTexture:coeffTexture:weights:guideMultiplier:](self, "computeUpsamplingCoefficients:guideTexture:imageTexture:coeffTexture:weights:guideMultiplier:", v17, v25, v18, self->_coeffTexture, self->_edges, v23);
  if (self->_skipBoxFilter)
  {
    v27 = 0;
  }
  else
  {
    -[PTGuidedFilter averageUpsamplingCoefficients:coeffTexture:coeffAveragedTexture:](self, "averageUpsamplingCoefficients:coeffTexture:coeffAveragedTexture:", v17, self->_coeffTexture, self->_coeffAveragedTexture);
    v27 = !self->_skipBoxFilter;
  }
  v28 = !v27;
  v29 = 56;
  if (!v28)
    v29 = 72;
  LODWORD(v31) = a4;
  *(float *)&v26 = v24;
  -[PTGuidedFilter applyUpsamplingCoefficients:guideTexture:coeffTexture:upscaledImageArray:guideMultiplier:postModifierBuffer:postModifierPtr:filterMode:](self, "applyUpsamplingCoefficients:guideTexture:coeffTexture:upscaledImageArray:guideMultiplier:postModifierBuffer:postModifierPtr:filterMode:", v17, v20, *(Class *)((char *)&self->super.isa + v29), v21, v22, a11, v26, v31);

  return 0;
}

- (void)computeUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 imageTexture:(id)a5 coeffTexture:(id)a6 weights:(id)a7 guideMultiplier:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  float v31;

  v14 = a6;
  v15 = a7;
  v31 = a8;
  v16 = a5;
  v17 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

  }
  v27 = 8;
  if (!self->_useWeightedSampling)
    v27 = 16;
  objc_msgSend(v18, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v27));
  objc_msgSend(v18, "setTexture:atIndex:", v17, 0);

  objc_msgSend(v18, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v18, "setTexture:atIndex:", v14, 2);
  if (self->_useWeightedSampling)
    objc_msgSend(v18, "setTexture:atIndex:", v15, 3);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v31, 4, 0);
  v30[0] = objc_msgSend(v14, "width");
  v30[1] = objc_msgSend(v14, "height");
  v30[2] = 1;
  v28 = xmmword_1C9322A40;
  v29 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", v30, &v28);
  objc_msgSend(v18, "endEncoding");

}

- (void)averageUpsamplingCoefficients:(id)a3 coeffTexture:(id)a4 coeffAveragedTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v10, "setComputePipelineState:", self->_averageUpsamplingCoefficients);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v19 = objc_msgSend(v8, "width");
  v20 = objc_msgSend(v8, "height");

  v23[0] = v19;
  v23[1] = v20;
  v23[2] = 1;
  v21 = xmmword_1C9322A40;
  v22 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v23, &v21);
  objc_msgSend(v10, "endEncoding");

}

- (void)applyUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 coeffTexture:(id)a5 upscaledImageArray:(id)a6 guideMultiplier:(float)a7 postModifierBuffer:(id)a8 postModifierPtr:(PTPostModifier *)a9 filterMode:(int)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[3];
  float v38;

  v17 = a6;
  v38 = a7;
  v18 = a8;
  v19 = a5;
  v20 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    _PTLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  objc_msgSend(v21, "setComputePipelineState:", self->_applyUpsamplingCoefficients[a10]);
  objc_msgSend(v21, "setTexture:atIndex:", v20, 0);

  objc_msgSend(v21, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:atIndex:", v30, 2);

  if (objc_msgSend(v17, "count") == 2)
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTexture:atIndex:", v31, 3);

  }
  objc_msgSend(v21, "setBytes:length:atIndex:", &v38, 4, 0);
  if (v18)
  {
    objc_msgSend(v21, "setBuffer:offset:atIndex:", v18, 0, 1);
  }
  else if (a9)
  {
    objc_msgSend(v21, "setBytes:length:atIndex:", a9, 12, 1);
  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "width");
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  v37[1] = objc_msgSend(v34, "height");
  v37[2] = 1;
  v35 = xmmword_1C9322A40;
  v36 = 1;
  objc_msgSend(v21, "dispatchThreads:threadsPerThreadgroup:", v37, &v35);

  objc_msgSend(v21, "endEncoding");
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_u, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_coeffAveragedTexture, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_coeffTexture, 0);
  for (i = 48; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_averageUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_computeUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_computeWeightedUpsamplingCoefficients, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)guidedFilter:(void *)a1 image:(NSObject *)a2 guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:.cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = 3;
  v4 = 2048;
  v5 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "upscaledImageArray.count must be less than %i. Was %lu", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_1();
}

- (void)guidedFilter:(NSObject *)a3 image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "postModifierBuffer.length expected %zu but was %zu", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

@end
