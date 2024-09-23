@implementation DenoiseRemixFragmentShader

- (DenoiseRemixFragmentShader)initWithMetal:(id)a3 vertFunc:(id)a4 fragName:(id)a5 useLGA:(int)a6 useGDGNR:(int)a7 pixelFormat:(unint64_t)a8 pixelFormat2:(unint64_t)a9 pixelFormat3:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  DenoiseRemixFragmentShader *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  MTLRenderPipelineState *pipeline;
  DenoiseRemixFragmentShader *v40;
  DenoiseRemixFragmentShader *v41;
  int v43;
  void *v44;
  id v45;
  id obj;
  void *v47;
  id v48;
  id v49;
  objc_super v50;
  int v51;
  int v52;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v52 = a6;
  v51 = a7;
  v50.receiver = self;
  v50.super_class = (Class)DenoiseRemixFragmentShader;
  v19 = -[DenoiseRemixFragmentShader init](&v50, sel_init);
  v47 = v18;
  if (!v19)
  {
    v38 = 0;
    v21 = 0;
    v27 = 0;
    v24 = 0;
    goto LABEL_7;
  }
  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
    v27 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v22 = a8;
  obj = a5;
  objc_msgSend(v20, "setConstantValue:type:atIndex:", &v52, 29, 0);
  objc_msgSend(v21, "setConstantValue:type:atIndex:", &v51, 29, 1);
  objc_msgSend(v16, "library");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v24 = (void *)objc_msgSend(v23, "newFunctionWithName:constantValues:error:", v18, v21, &v49);
  v25 = v49;

  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v27 = 0;
    goto LABEL_14;
  }
  v26 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  v27 = v26;
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  v44 = v21;
  v45 = v17;
  objc_msgSend(v26, "setVertexFunction:", v17);
  objc_msgSend(v27, "setFragmentFunction:", v24);
  objc_msgSend(v16, "fullRangeVertexDesc");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVertexDescriptor:", v28);

  objc_msgSend(v27, "colorAttachments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = v16;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPixelFormat:", v22);

  v16 = v30;
  objc_msgSend(v27, "colorAttachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPixelFormat:", a9);

  objc_msgSend(v27, "colorAttachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPixelFormat:", a10);

  objc_msgSend(v16, "device");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v25;
  v37 = objc_msgSend(v36, "newRenderPipelineStateWithDescriptor:error:", v27, &v48);
  v38 = v48;

  pipeline = v19->_pipeline;
  v19->_pipeline = (MTLRenderPipelineState *)v37;

  if (!v19->_pipeline)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = v38;
    v21 = v44;
    v17 = v45;
LABEL_14:
    v43 = FigSignalErrorAt();
    v40 = 0;
    v38 = v25;
    if (v43)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v19->_fragName, obj);
  v21 = v44;
  v17 = v45;
LABEL_7:
  v25 = v38;
  v40 = v19;
LABEL_8:
  v41 = v40;

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragName, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
