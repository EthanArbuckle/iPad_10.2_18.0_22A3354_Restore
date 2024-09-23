@implementation FuseRemixFragmentShader

- (FuseRemixFragmentShader)initWithMetal:(id)a3 fragName:(id)a4 pixelFormat:(unint64_t)a5 fusionType:(int)a6 fixPyramidAlignment:(BOOL)a7 staticOIS:(BOOL)a8 reduceOisGhosting:(BOOL)a9
{
  id v15;
  id v16;
  FuseRemixFragmentShader *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  MTLRenderPipelineState *pipeline;
  FuseRemixFragmentShader *v35;
  FuseRemixFragmentShader *v36;
  int v38;
  void *v39;
  id obj;
  unint64_t v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  int v49;

  v15 = a3;
  v16 = a4;
  v49 = a6;
  v48 = a7;
  v47 = a8;
  v46 = a9;
  v45.receiver = self;
  v45.super_class = (Class)FuseRemixFragmentShader;
  v17 = -[FuseRemixFragmentShader init](&v45, sel_init);
  if (!v17)
  {
    v22 = 0;
    v19 = 0;
    v27 = 0;
    v24 = 0;
    v21 = 0;
    goto LABEL_8;
  }
  v18 = (void *)objc_opt_new();
  v19 = v18;
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v24 = 0;
    v27 = 0;
    v22 = 0;
    goto LABEL_16;
  }
  v41 = a5;
  objc_msgSend(v18, "setConstantValue:type:atIndex:", &v49, 29, 0);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &v48, 53, 2);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &v47, 53, 3);
  objc_msgSend(v19, "setConstantValue:type:atIndex:", &v46, 53, 4);
  objc_msgSend(v15, "library");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v21 = (void *)objc_msgSend(v20, "newFunctionWithName:constantValues:error:", CFSTR("FusionVert"), v19, &v44);
  v22 = v44;

  if (!v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
    v27 = 0;
    goto LABEL_16;
  }
  obj = a4;
  objc_msgSend(v15, "library");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v22;
  v24 = (void *)objc_msgSend(v23, "newFunctionWithName:constantValues:error:", v16, v19, &v43);
  v25 = v43;

  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v27 = 0;
    v22 = v25;
    goto LABEL_16;
  }
  v26 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  v27 = v26;
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = v25;
    goto LABEL_16;
  }
  v39 = v21;
  objc_msgSend(v26, "setVertexFunction:", v21);
  v28 = v24;
  objc_msgSend(v27, "setFragmentFunction:", v24);
  objc_msgSend(v15, "fullRangeVertexDesc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVertexDescriptor:", v29);

  objc_msgSend(v27, "colorAttachments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPixelFormat:", v41);

  objc_msgSend(v15, "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v25;
  v33 = objc_msgSend(v32, "newRenderPipelineStateWithDescriptor:error:", v27, &v42);
  v22 = v42;

  pipeline = v17->_pipeline;
  v17->_pipeline = (MTLRenderPipelineState *)v33;

  if (!v17->_pipeline)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = v39;
    v24 = v28;
LABEL_16:
    v38 = FigSignalErrorAt();
    v35 = 0;
    if (v38)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v17->_fragName, obj);
  v21 = v39;
  v24 = v28;
LABEL_8:
  v35 = v17;
LABEL_9:
  v36 = v35;

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
