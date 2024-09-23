@implementation PyramidStageShared

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  void *v4;
  void *v5;
  PyramidStageShared *v6;
  id v7;

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_1;
  if (a3)
  {
    v6 = 0;
LABEL_5:
    getSharedInstanceOrRelease__singleton_1 = (uint64_t)v6;

    goto LABEL_6;
  }
  if (!getSharedInstanceOrRelease__singleton_1)
  {
    v6 = objc_alloc_init(PyramidStageShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_1;
    goto LABEL_5;
  }
LABEL_6:
  v7 = (id)getSharedInstanceOrRelease__singleton_1;
  objc_sync_exit(v4);

  return v7;
}

+ (id)sharedInstance
{
  return +[PyramidStageShared getSharedInstanceOrRelease:](PyramidStageShared, "getSharedInstanceOrRelease:", 0);
}

- (id)getPipeline:(id)a3 lumaWrite:(BOOL)a4 chromaType:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  char *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  v9 = (char *)self + 24 * v6 + 8 * v5;
  v11 = (void *)*((_QWORD *)v9 + 1);
  v10 = (id *)(v9 + 8);
  v12 = v11;
  v13 = v12;
  if (v5 >= 3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    v13 = 0;
  }
  else if (!v12)
  {
    +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v8, v6, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_storeStrong(v10, v13);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v13;
}

- (id)getRec709DownsamplePipelineState:(id)a3 kernelType:(int)a4
{
  uint64_t v4;
  id v6;
  Class *v7;
  id *v8;
  Class v9;
  objc_class *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v4 >= 6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }
  else
  {
    v7 = &self->super.isa + v4;
    v9 = v7[7];
    v8 = (id *)(v7 + 7);
    v10 = v9;
    if (!v10)
    {
      +[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v6, v4);
      v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_storeStrong(v8, v10);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
  }

  return v10;
}

+ (BOOL)isRec709DownsampleSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE11A10], "metalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFamily:", 1004);

  return v3;
}

+ (id)compileShader:(id)a3 lumaWrite:(BOOL)a4 chromaType:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  BOOL v13;

  v7 = a3;
  v13 = a4;
  v12 = a5;
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setConstantValue:type:atIndex:", &v13, 53, 2);
    objc_msgSend(v9, "setConstantValue:type:atIndex:", &v12, 29, 1);
    objc_msgSend(v7, "computePipelineStateFor:constants:", CFSTR("pyramid_downsample"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

+ (id)compileShader:(id)a3 kernelType:(int)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (a4 >= 6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "computePipelineStateFor:constants:", off_24D669730[a4], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (void)releaseSharedInstance
{
  id v2;

  v2 = +[PyramidStageShared getSharedInstanceOrRelease:](PyramidStageShared, "getSharedInstanceOrRelease:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rec709DownsamplePipelineState[5], 0);
  objc_storeStrong((id *)&self->_rec709DownsamplePipelineState[4], 0);
  objc_storeStrong((id *)&self->_rec709DownsamplePipelineState[3], 0);
  objc_storeStrong((id *)&self->_rec709DownsamplePipelineState[2], 0);
  objc_storeStrong((id *)&self->_rec709DownsamplePipelineState[1], 0);
  objc_storeStrong((id *)self->_rec709DownsamplePipelineState, 0);
  objc_storeStrong((id *)&self->_pipeline[1][2], 0);
  objc_storeStrong((id *)&self->_pipeline[1][1], 0);
  objc_storeStrong((id *)self->_pipeline[1], 0);
  objc_storeStrong((id *)&self->_pipeline[0][2], 0);
  objc_storeStrong((id *)&self->_pipeline[0][1], 0);
  objc_storeStrong((id *)self->_pipeline[0], 0);
}

@end
