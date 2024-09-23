@implementation RegDenseShaders

- (RegDenseShaders)initWithMetal:(id)a3
{
  id v4;
  RegDenseShaders *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  MTLRenderPipelineState *confPipeline;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MTLComputePipelineState *warpPipeline;
  void *v24;
  void *v25;
  uint64_t v26;
  MTLComputePipelineState *warpWithConfidencePipeline;
  void *v28;
  void *v29;
  uint64_t v30;
  MTLComputePipelineState *warpWithBlendingWeightPipeline;
  void *v32;
  void *v33;
  uint64_t v34;
  MTLComputePipelineState *getBlendingWeightPipeline;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  RegDenseShaders *v51;
  void *v53;
  void *v54;
  void *v55;
  RegDenseShaders *v56;
  void *v57;
  int64x2_t v58;
  id v59;
  void *v60;
  _QWORD v61[3];
  int64x2_t v62;
  uint64_t v63;
  _QWORD v64[3];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  objc_super v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)RegDenseShaders;
  v5 = -[RegDenseShaders init](&v70, sel_init);
  if (!v5)
  {
    v51 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newFunctionWithName:", CFSTR("pyramidConfidence"));

  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v51 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newFunctionWithName:", CFSTR("regpyr_vert"));

  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_32:

    v51 = 0;
    goto LABEL_23;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_31:

    goto LABEL_32;
  }
  v11 = v10;
  objc_msgSend(v10, "setVertexFunction:", v9);
  objc_msgSend(v11, "setFragmentFunction:", v7);
  objc_msgSend(v4, "fullRangeVertexDesc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVertexDescriptor:", v12);

  objc_msgSend(v11, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPixelFormat:", 25);

  objc_msgSend(v4, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v16 = objc_msgSend(v15, "newRenderPipelineStateWithDescriptor:error:", v11, &v69);
  v17 = v69;
  confPipeline = v5->_confPipeline;
  v5->_confPipeline = (MTLRenderPipelineState *)v16;

  if (!v5->_confPipeline)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(v4, "library");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "newFunctionWithName:", CFSTR("warpFrame"));

  if (!v20)
    goto LABEL_29;
  objc_msgSend(v4, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "newComputePipelineStateWithFunction:error:", v20, 0);
  warpPipeline = v5->_warpPipeline;
  v5->_warpPipeline = (MTLComputePipelineState *)v22;

  if (!v5->_warpPipeline)
    goto LABEL_29;

  objc_msgSend(v4, "library");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v24, "newFunctionWithName:", CFSTR("warpFrameWithConfidence"));

  if (!v20)
    goto LABEL_29;
  objc_msgSend(v4, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "newComputePipelineStateWithFunction:error:", v20, 0);
  warpWithConfidencePipeline = v5->_warpWithConfidencePipeline;
  v5->_warpWithConfidencePipeline = (MTLComputePipelineState *)v26;

  if (!v5->_warpWithConfidencePipeline)
    goto LABEL_29;

  objc_msgSend(v4, "library");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v28, "newFunctionWithName:", CFSTR("warpFrameWithBlendingWeight"));

  if (!v20)
    goto LABEL_29;
  objc_msgSend(v4, "device");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "newComputePipelineStateWithFunction:error:", v20, 0);
  warpWithBlendingWeightPipeline = v5->_warpWithBlendingWeightPipeline;
  v5->_warpWithBlendingWeightPipeline = (MTLComputePipelineState *)v30;

  if (!v5->_warpWithBlendingWeightPipeline)
    goto LABEL_29;

  objc_msgSend(v4, "library");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v32, "newFunctionWithName:", CFSTR("getBlendingWeight"));

  if (!v20
    || (objc_msgSend(v4, "device"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend(v33, "newComputePipelineStateWithFunction:error:", v20, 0),
        getBlendingWeightPipeline = v5->_getBlendingWeightPipeline,
        v5->_getBlendingWeightPipeline = (MTLComputePipelineState *)v34,
        getBlendingWeightPipeline,
        v33,
        !v5->_getBlendingWeightPipeline))
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_30;
  }
  v57 = v17;

  objc_msgSend(v4, "commandQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commandBuffer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "setHeight:", 1);
  objc_msgSend(v37, "setWidth:", 1);
  objc_msgSend(v37, "setUsage:", 3);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v38 = objc_msgSend(&unk_24D670430, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v38)
  {
    v39 = v38;
    v53 = v11;
    v54 = v9;
    v55 = v7;
    v56 = v5;
    v59 = v4;
    v40 = 0;
    v41 = 0;
    v42 = *(_QWORD *)v66;
    v58 = vdupq_n_s64(1uLL);
    v43 = v4;
    do
    {
      v44 = 0;
      v45 = v40;
      v46 = v41;
      do
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(&unk_24D670430);
        v47 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v44);
        objc_msgSend(v60, "blitCommandEncoder");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setPixelFormat:", (int)objc_msgSend(v47, "intValue"));
        objc_msgSend(v43, "device");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v49, "newTextureWithDescriptor:", v37);

        objc_msgSend(v43, "device");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v50, "newTextureWithDescriptor:", v37);

        memset(v64, 0, sizeof(v64));
        memset(v61, 0, sizeof(v61));
        v62 = v58;
        v63 = 1;
        objc_msgSend(v48, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v40, 0, 0, v64, &v62, v41, 0, 0, v61);
        objc_msgSend(v48, "endEncoding");

        ++v44;
        v45 = v40;
        v46 = v41;
      }
      while (v39 != v44);
      v39 = objc_msgSend(&unk_24D670430, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v39);

    v4 = v59;
    v7 = v55;
    v5 = v56;
    v11 = v53;
    v9 = v54;
  }

  v51 = v5;
LABEL_23:

  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithBlendingWeightPipeline, 0);
  objc_storeStrong((id *)&self->_warpWithConfidencePipeline, 0);
  objc_storeStrong((id *)&self->_warpPipeline, 0);
  objc_storeStrong((id *)&self->_confPipeline, 0);
}

@end
