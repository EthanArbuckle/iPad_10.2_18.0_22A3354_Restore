@implementation BilateralGridShaders

- (BilateralGridShaders)initWithMetal:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  id v6;
  BilateralGridShaders *v7;
  BilateralGridShaders *v8;
  MTLComputePipelineState **bgSplat;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  MTLComputePipelineState *v16;
  int v17;
  MTLComputePipelineState **bgBlur;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  MTLComputePipelineState *v23;
  int v24;
  void *v25;
  uint64_t v26;
  MTLComputePipelineState *bgNormalize;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  MTLRenderPipelineState *bgUpsample8;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  MTLRenderPipelineState *bgUpsample16;
  void *v54;
  uint64_t v55;
  MTLRenderPipelineState *bgUpsample16ToneMapped;
  uint64_t v57;
  MTLComputePipelineState *bgBistochastizeInit;
  uint64_t v59;
  MTLComputePipelineState *bgBistochastizeIter;
  uint64_t v61;
  MTLComputePipelineState *bgBistochastizeFinal;
  uint64_t v63;
  MTLComputePipelineState *bgSolverInit1;
  uint64_t v65;
  MTLComputePipelineState *bgSolverInit2;
  uint64_t v67;
  MTLComputePipelineState *bgSolverPcgIter0;
  uint64_t v69;
  MTLComputePipelineState *bgSolverPcgIter1;
  uint64_t v71;
  MTLComputePipelineState *bgSolverPcgIter2;
  uint64_t v73;
  MTLComputePipelineState *bgSolverPcgIter3;
  BilateralGridShaders *v75;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  int v82;
  objc_super v83;
  BOOL v84;
  id v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v84 = a4;
  v85 = 0;
  v86 = 0;
  v83.receiver = self;
  v83.super_class = (Class)BilateralGridShaders;
  v7 = -[BilateralGridShaders init](&v83, sel_init);
  v8 = v7;
  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v75 = 0;
    goto LABEL_28;
  }
  v82 = 0;
  bgSplat = v7->_bgSplat;
  do
  {
    v10 = (void *)objc_opt_new();
    v11 = 8 * v82;
    v12 = *(id *)((char *)&v85 + v11);
    *(id *)((char *)&v85 + v11) = v10;

    v13 = *(&v85 + v82);
    if (!v13)
      goto LABEL_29;
    objc_msgSend(v13, "setConstantValue:type:atIndex:", &v82, 53, 3);
    objc_msgSend(v6, "computePipelineStateFor:constants:", CFSTR("bg_splat"), *(&v85 + v82));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v82;
    v16 = bgSplat[v15];
    bgSplat[v15] = (MTLComputePipelineState *)v14;

    v17 = v82;
    if (!bgSplat[v82])
    {
LABEL_29:
      fig_log_get_emitter();
      goto LABEL_30;
    }
    ++v82;
  }
  while (v17 <= 0);
  v82 = 0;
  bgBlur = v8->_bgBlur;
  do
  {
    v19 = (void *)objc_opt_new();
    v20 = v19;
    if (!v19)
      goto LABEL_31;
    objc_msgSend(v19, "setConstantValue:type:atIndex:", &v82, 29, 2);
    objc_msgSend(v20, "setConstantValue:type:atIndex:", &v84, 53, 1);
    objc_msgSend(v6, "computePipelineStateFor:constants:", CFSTR("bg_blur"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v82;
    v23 = bgBlur[v22];
    bgBlur[v22] = (MTLComputePipelineState *)v21;

    if (!bgBlur[v82])
      goto LABEL_31;

    v24 = v82++;
  }
  while (v24 < 2);
  v25 = (void *)objc_opt_new();
  v20 = v25;
  if (!v25
    || (objc_msgSend(v25, "setConstantValue:type:atIndex:", &v84, 53, 1),
        objc_msgSend(v6, "computePipelineStateFor:constants:", CFSTR("bg_norm"), v20),
        v26 = objc_claimAutoreleasedReturnValue(),
        bgNormalize = v8->_bgNormalize,
        v8->_bgNormalize = (MTLComputePipelineState *)v26,
        bgNormalize,
        !v8->_bgNormalize))
  {
LABEL_31:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_32:

    v75 = 0;
    goto LABEL_28;
  }

  objc_msgSend(v6, "library");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v28, "newFunctionWithName:", CFSTR("BilateralUpsample_vert"));

  if (!v20)
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:].cold.1();
  objc_msgSend(v6, "library");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v85;
  objc_msgSend(v6, "pipelineLibrary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  v32 = (void *)objc_msgSend(v29, "newFunctionWithName:constantValues:pipelineLibrary:error:", CFSTR("BilateralUpsample_frag"), v30, v31, &v81);
  v33 = v81;

  if (!v32)
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:].cold.2();
  objc_msgSend(v6, "library");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v86;
  objc_msgSend(v6, "pipelineLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v33;
  v37 = (void *)objc_msgSend(v34, "newFunctionWithName:constantValues:pipelineLibrary:error:", CFSTR("BilateralUpsample_frag"), v35, v36, &v80);
  v38 = v80;

  if (!v37)
    -[BilateralGridShaders initWithMetal:normalizeGridConfidence:].cold.3();
  v39 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v6, "pipelineLibrary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPipelineLibrary:", v40);

  objc_msgSend(v39, "setVertexFunction:", v20);
  objc_msgSend(v39, "setFragmentFunction:", v32);
  objc_msgSend(v6, "fullRangeVertexDesc");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setVertexDescriptor:", v41);

  objc_msgSend(v39, "colorAttachments");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPixelFormat:", 10);

  objc_msgSend(v6, "device");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v38;
  v45 = objc_msgSend(v44, "newRenderPipelineStateWithDescriptor:error:", v39, &v79);
  v46 = v79;

  bgUpsample8 = v8->_bgUpsample8;
  v8->_bgUpsample8 = (MTLRenderPipelineState *)v45;

  if (!v8->_bgUpsample8)
  {
    fig_log_get_emitter();
LABEL_42:
    FigDebugAssert3();
    goto LABEL_43;
  }
  objc_msgSend(v39, "colorAttachments");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setPixelFormat:", 25);

  objc_msgSend(v6, "device");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v46;
  v51 = objc_msgSend(v50, "newRenderPipelineStateWithDescriptor:error:", v39, &v78);
  v52 = v78;

  bgUpsample16 = v8->_bgUpsample16;
  v8->_bgUpsample16 = (MTLRenderPipelineState *)v51;

  if (!v8->_bgUpsample16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = v52;
LABEL_43:
    FigSignalErrorAt();

    goto LABEL_32;
  }
  objc_msgSend(v39, "setFragmentFunction:", v37);
  objc_msgSend(v6, "device");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v52;
  v55 = objc_msgSend(v54, "newRenderPipelineStateWithDescriptor:error:", v39, &v77);
  v46 = v77;

  bgUpsample16ToneMapped = v8->_bgUpsample16ToneMapped;
  v8->_bgUpsample16ToneMapped = (MTLRenderPipelineState *)v55;

  if (!v8->_bgUpsample16ToneMapped)
  {
    fig_log_get_emitter();
    goto LABEL_42;
  }

  -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_bistochastize_init", v6);
  v57 = objc_claimAutoreleasedReturnValue();
  bgBistochastizeInit = v8->_bgBistochastizeInit;
  v8->_bgBistochastizeInit = (MTLComputePipelineState *)v57;

  if (v8->_bgBistochastizeInit)
  {
    -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_bistochastize_iter", v6);
    v59 = objc_claimAutoreleasedReturnValue();
    bgBistochastizeIter = v8->_bgBistochastizeIter;
    v8->_bgBistochastizeIter = (MTLComputePipelineState *)v59;

    if (v8->_bgBistochastizeIter)
    {
      -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_bistochastize_final", v6);
      v61 = objc_claimAutoreleasedReturnValue();
      bgBistochastizeFinal = v8->_bgBistochastizeFinal;
      v8->_bgBistochastizeFinal = (MTLComputePipelineState *)v61;

      if (v8->_bgBistochastizeFinal)
      {
        -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_init1", v6);
        v63 = objc_claimAutoreleasedReturnValue();
        bgSolverInit1 = v8->_bgSolverInit1;
        v8->_bgSolverInit1 = (MTLComputePipelineState *)v63;

        if (v8->_bgSolverInit1)
        {
          -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_init2", v6);
          v65 = objc_claimAutoreleasedReturnValue();
          bgSolverInit2 = v8->_bgSolverInit2;
          v8->_bgSolverInit2 = (MTLComputePipelineState *)v65;

          if (v8->_bgSolverInit2)
          {
            -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_pcg_iter0", v6);
            v67 = objc_claimAutoreleasedReturnValue();
            bgSolverPcgIter0 = v8->_bgSolverPcgIter0;
            v8->_bgSolverPcgIter0 = (MTLComputePipelineState *)v67;

            if (v8->_bgSolverPcgIter0)
            {
              -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_pcg_iter1", v6);
              v69 = objc_claimAutoreleasedReturnValue();
              bgSolverPcgIter1 = v8->_bgSolverPcgIter1;
              v8->_bgSolverPcgIter1 = (MTLComputePipelineState *)v69;

              if (v8->_bgSolverPcgIter1)
              {
                -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_pcg_iter2", v6);
                v71 = objc_claimAutoreleasedReturnValue();
                bgSolverPcgIter2 = v8->_bgSolverPcgIter2;
                v8->_bgSolverPcgIter2 = (MTLComputePipelineState *)v71;

                if (v8->_bgSolverPcgIter2)
                {
                  -[BilateralGridShaders createBasicComputeShader:metal:](v8, "createBasicComputeShader:metal:", "bg_solver_pcg_iter3", v6);
                  v73 = objc_claimAutoreleasedReturnValue();
                  bgSolverPcgIter3 = v8->_bgSolverPcgIter3;
                  v8->_bgSolverPcgIter3 = (MTLComputePipelineState *)v73;

                  if (v8->_bgSolverPcgIter3)
                  {
                    v75 = v8;
                    goto LABEL_28;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
LABEL_30:
  FigDebugAssert3();
  FigSignalErrorAt();
  v75 = 0;
LABEL_28:

  return v75;
}

- (id)createBasicComputeShader:(const char *)a3 metal:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  objc_msgSend(v5, "stringWithUTF8String:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computePipelineStateFor:constants:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgSolverPcgIter3, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter2, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter1, 0);
  objc_storeStrong((id *)&self->_bgSolverPcgIter0, 0);
  objc_storeStrong((id *)&self->_bgSolverInit2, 0);
  objc_storeStrong((id *)&self->_bgSolverInit1, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeFinal, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeIter, 0);
  objc_storeStrong((id *)&self->_bgBistochastizeInit, 0);
  objc_storeStrong((id *)&self->_bgUpsample16ToneMapped, 0);
  objc_storeStrong((id *)&self->_bgUpsample16, 0);
  objc_storeStrong((id *)&self->_bgUpsample8, 0);
  objc_storeStrong((id *)&self->_bgNormalize, 0);
  objc_storeStrong((id *)&self->_bgBlur[2], 0);
  objc_storeStrong((id *)&self->_bgBlur[1], 0);
  objc_storeStrong((id *)self->_bgBlur, 0);
  objc_storeStrong((id *)&self->_bgSplat[1], 0);
  objc_storeStrong((id *)self->_bgSplat, 0);
}

- (void)initWithMetal:normalizeGridConfidence:.cold.1()
{
  __assert_rtn("-[BilateralGridShaders initWithMetal:normalizeGridConfidence:]", "BilateralGrid.m", 169, "vertFunc");
}

- (void)initWithMetal:normalizeGridConfidence:.cold.2()
{
  __assert_rtn("-[BilateralGridShaders initWithMetal:normalizeGridConfidence:]", "BilateralGrid.m", 170, "fragFunc");
}

- (void)initWithMetal:normalizeGridConfidence:.cold.3()
{
  __assert_rtn("-[BilateralGridShaders initWithMetal:normalizeGridConfidence:]", "BilateralGrid.m", 171, "fragFuncToneMapped");
}

@end
