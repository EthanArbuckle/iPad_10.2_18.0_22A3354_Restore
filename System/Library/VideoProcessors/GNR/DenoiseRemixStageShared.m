@implementation DenoiseRemixStageShared

- (id)getShaders:(id)a3 lumaFP16:(BOOL)a4 chromaFP16:(BOOL)a5 lGAAlgorithm:(int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  char *v11;
  id *v12;
  void *v13;
  DenoiseRemixShaders *v14;
  void *v15;
  void *v16;
  DenoiseRemixShaders *v17;
  uint64_t v18;
  uint64_t v19;
  DenoiseRemixShaders *v20;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (char *)self + 32 * v8 + 16 * v7 + 8 * v6;
  v13 = (void *)*((_QWORD *)v11 + 1);
  v12 = (id *)(v11 + 8);
  v14 = v13;
  if (!v14)
  {
    objc_msgSend(v10, "library");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("RemixDenoise_vert"));

    if (v16
      && ((v17 = [DenoiseRemixShaders alloc], !v8) ? (v18 = 10) : (v18 = 25),
          !v7 ? (v19 = 30) : (v19 = 65),
          (v20 = -[DenoiseRemixShaders initWithMetal:vertFunc:pixelFormatLuma:pixelFormatChroma:pixelFormatLoG:lgaAlgorithm:](v17, "initWithMetal:vertFunc:pixelFormatLuma:pixelFormatChroma:pixelFormatLoG:lgaAlgorithm:", v10, v16, v18, v19, v18, v6)) != 0))
    {
      v14 = v20;
      objc_storeStrong(v12, v20);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v14 = 0;
    }

  }
  return v14;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  return (id)qword_253DAF310;
}

void __41__DenoiseRemixStageShared_sharedInstance__block_invoke()
{
  DenoiseRemixStageShared *v0;
  void *v1;

  v0 = objc_alloc_init(DenoiseRemixStageShared);
  v1 = (void *)qword_253DAF310;
  qword_253DAF310 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denoiseShaders[1][1][1], 0);
  objc_storeStrong((id *)self->_denoiseShaders[1][1], 0);
  objc_storeStrong((id *)&self->_denoiseShaders[1][0][1], 0);
  objc_storeStrong((id *)self->_denoiseShaders[1][0], 0);
  objc_storeStrong((id *)&self->_denoiseShaders[0][1][1], 0);
  objc_storeStrong((id *)self->_denoiseShaders[0][1], 0);
  objc_storeStrong((id *)&self->_denoiseShaders[0][0][1], 0);
  objc_storeStrong((id *)self->_denoiseShaders[0][0], 0);
}

@end
