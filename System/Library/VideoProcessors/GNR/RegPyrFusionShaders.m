@implementation RegPyrFusionShaders

- (RegPyrFusionShaders)initWithMetal:(id)a3
{
  id v4;
  RegPyrFusionShaders *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MTLRenderPipelineState *initialDownScalePipelineState;
  uint64_t v10;
  MTLRenderPipelineState *bilinearScalePipelineState;
  uint64_t v12;
  MTLRenderPipelineState *derivSobelPipelineState;
  uint64_t v14;
  MTLComputePipelineState *derivPipelineState;
  uint64_t v16;
  MTLRenderPipelineState *basicSearchLumaPipelineState;
  uint64_t v18;
  MTLRenderPipelineState *fusionXLumaPipelineState;
  uint64_t v20;
  MTLRenderPipelineState *fusionYLumaPipelineState;
  uint64_t v22;
  MTLRenderPipelineState *smoothPipelineState;
  uint64_t v24;
  MTLRenderPipelineState *selectionLumaPipelineState;
  uint64_t v26;
  MTLRenderPipelineState *confidenceStageOne;
  uint64_t v28;
  MTLRenderPipelineState *confidenceErode;
  uint64_t v30;
  MTLRenderPipelineState *confidenceDilate;
  RegPyrFusionShaders *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)RegPyrFusionShaders;
  v5 = -[RegPyrFusionShaders init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newFunctionWithName:", CFSTR("regpyr_vert"));

    if (v7)
    {
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_initial_downscale_frag"), &unk_24D670478);
      v8 = objc_claimAutoreleasedReturnValue();
      initialDownScalePipelineState = v5->_initialDownScalePipelineState;
      v5->_initialDownScalePipelineState = (MTLRenderPipelineState *)v8;

      if (!v5->_initialDownScalePipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_bilinear_downscale_frag"), &unk_24D670490);
      v10 = objc_claimAutoreleasedReturnValue();
      bilinearScalePipelineState = v5->_bilinearScalePipelineState;
      v5->_bilinearScalePipelineState = (MTLRenderPipelineState *)v10;

      if (!v5->_bilinearScalePipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_deriv_sobel_frag"), &unk_24D6704A8);
      v12 = objc_claimAutoreleasedReturnValue();
      derivSobelPipelineState = v5->_derivSobelPipelineState;
      v5->_derivSobelPipelineState = (MTLRenderPipelineState *)v12;

      if (!v5->_derivSobelPipelineState)
        goto LABEL_19;
      objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("regpyr_deriv_compute_frag"), 0);
      v14 = objc_claimAutoreleasedReturnValue();
      derivPipelineState = v5->_derivPipelineState;
      v5->_derivPipelineState = (MTLComputePipelineState *)v14;

      if (!v5->_derivPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_basic_search_luma_frag"), &unk_24D6704C0);
      v16 = objc_claimAutoreleasedReturnValue();
      basicSearchLumaPipelineState = v5->_basicSearchLumaPipelineState;
      v5->_basicSearchLumaPipelineState = (MTLRenderPipelineState *)v16;

      if (!v5->_basicSearchLumaPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_fusion_luma_x_frag"), &unk_24D6704D8);
      v18 = objc_claimAutoreleasedReturnValue();
      fusionXLumaPipelineState = v5->_fusionXLumaPipelineState;
      v5->_fusionXLumaPipelineState = (MTLRenderPipelineState *)v18;

      if (!v5->_fusionXLumaPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_fusion_luma_y_frag"), &unk_24D6704F0);
      v20 = objc_claimAutoreleasedReturnValue();
      fusionYLumaPipelineState = v5->_fusionYLumaPipelineState;
      v5->_fusionYLumaPipelineState = (MTLRenderPipelineState *)v20;

      if (!v5->_fusionYLumaPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_smooth_frag"), &unk_24D670508);
      v22 = objc_claimAutoreleasedReturnValue();
      smoothPipelineState = v5->_smoothPipelineState;
      v5->_smoothPipelineState = (MTLRenderPipelineState *)v22;

      if (!v5->_smoothPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_selection_luma_frag"), &unk_24D670520);
      v24 = objc_claimAutoreleasedReturnValue();
      selectionLumaPipelineState = v5->_selectionLumaPipelineState;
      v5->_selectionLumaPipelineState = (MTLRenderPipelineState *)v24;

      if (!v5->_selectionLumaPipelineState)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_confidence_stage_one_frag"), &unk_24D670538);
      v26 = objc_claimAutoreleasedReturnValue();
      confidenceStageOne = v5->_confidenceStageOne;
      v5->_confidenceStageOne = (MTLRenderPipelineState *)v26;

      if (!v5->_confidenceStageOne)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_confidence_erode_frag"), &unk_24D670550);
      v28 = objc_claimAutoreleasedReturnValue();
      confidenceErode = v5->_confidenceErode;
      v5->_confidenceErode = (MTLRenderPipelineState *)v28;

      if (!v5->_confidenceErode)
        goto LABEL_19;
      -[RegPyrFusionShaders createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:](v5, "createPipelineStateWithMetal:vFunction:fShaderName:outputColorMetalFormat:", v4, v7, CFSTR("regpyr_confidence_dilate_frag"), &unk_24D670568);
      v30 = objc_claimAutoreleasedReturnValue();
      confidenceDilate = v5->_confidenceDilate;
      v5->_confidenceDilate = (MTLRenderPipelineState *)v30;

      if (v5->_confidenceDilate)
      {
        v32 = v5;

      }
      else
      {
LABEL_19:
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();

        v32 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v32 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v32 = 0;
  }

  return v32;
}

- (id)createPipelineStateWithMetal:(id)a3 vFunction:(id)a4 fShaderName:(id)a5 outputColorMetalFormat:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  if (v13)
  {
    objc_msgSend(v9, "pipelineLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPipelineLibrary:", v14);

    objc_msgSend(v13, "setVertexFunction:", v10);
    objc_msgSend(v13, "vertexFunction");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_17;
    objc_msgSend(v9, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "newFunctionWithName:", v11);
    objc_msgSend(v13, "setFragmentFunction:", v17);

    objc_msgSend(v13, "fragmentFunction");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v32 = v11;
      v33 = v10;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v31 = v12;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v18);
            v24 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "intValue");
            objc_msgSend(v13, "colorAttachments");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", (v21 + i));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setPixelFormat:", v24);

          }
          v21 += i;
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v20);
      }

      objc_msgSend(v9, "fullRangeVertexDesc");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVertexDescriptor:", v27);

      objc_msgSend(v9, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v29 = (void *)objc_msgSend(v28, "newRenderPipelineStateWithDescriptor:error:", v13, &v34);
      v15 = v34;

      if (!v29 || v15)
      {

        v29 = 0;
      }
      v11 = v32;
      v10 = v33;
      v12 = v31;
    }
    else
    {
LABEL_17:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v29 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v29 = 0;
    v15 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceDilate, 0);
  objc_storeStrong((id *)&self->_confidenceErode, 0);
  objc_storeStrong((id *)&self->_confidenceStageOne, 0);
  objc_storeStrong((id *)&self->_selectionLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_smoothPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionYLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_fusionXLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_basicSearchLumaPipelineState, 0);
  objc_storeStrong((id *)&self->_derivSobelPipelineState, 0);
  objc_storeStrong((id *)&self->_derivPipelineState, 0);
  objc_storeStrong((id *)&self->_bilinearScalePipelineState, 0);
  objc_storeStrong((id *)&self->_initialDownScalePipelineState, 0);
}

@end
