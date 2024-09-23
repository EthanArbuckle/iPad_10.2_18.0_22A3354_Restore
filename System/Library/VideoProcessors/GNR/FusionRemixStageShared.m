@implementation FusionRemixStageShared

+ (id)sharedInstance
{
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_1);
  return (id)qword_253DAF320;
}

- (id)getShaders:(id)a3 fusionType:(int)a4 fp16:(BOOL)a5 staticOIS:(BOOL)a6 reduceOisGhosting:(BOOL)a7 fusionAlignment:(int)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  uint64_t v12;
  id v14;
  char *v15;
  id *v16;
  void *v17;
  FuseRemixShaders *v18;
  FuseRemixShaders *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = (char *)self
      + 128 * (unint64_t)v12
      + 64 * (unint64_t)v11
      + 32 * v10
      + 16 * a8
      + 8 * v9;
  v17 = (void *)*((_QWORD *)v15 + 1);
  v16 = (id *)(v15 + 8);
  v18 = v17;
  if (!v18)
  {
    v19 = [FuseRemixShaders alloc];
    if (v11)
      v20 = 25;
    else
      v20 = 10;
    if (v11)
      v21 = 65;
    else
      v21 = 30;
    LOBYTE(v23) = v9;
    v18 = -[FuseRemixShaders initWithMetal:pixelFormatLuma:pixelFormatChroma:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:](v19, "initWithMetal:pixelFormatLuma:pixelFormatChroma:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v14, v20, v21, v12, a8 == 1, v10, v23);
    if (v18)
    {
      objc_storeStrong(v16, v18);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v18;
}

void __40__FusionRemixStageShared_sharedInstance__block_invoke()
{
  FusionRemixStageShared *v0;
  void *v1;

  v0 = objc_alloc_init(FusionRemixStageShared);
  v1 = (void *)qword_253DAF320;
  qword_253DAF320 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][1][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][1][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][1][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][1][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][1][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][1][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][1][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][1][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][0][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][0][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][0][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][0][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][0][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][0][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[3][0][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[3][0][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][1][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][1][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][1][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][1][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][1][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][1][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][1][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][1][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][0][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][0][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][0][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][0][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][0][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][0][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[2][0][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[2][0][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][1][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][1][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][1][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][1][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][1][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][1][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][1][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][1][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][0][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][0][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][0][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][0][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][0][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][0][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[1][0][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[1][0][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][1][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][1][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][1][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][1][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][1][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][1][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][1][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][1][0][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][0][1][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][0][1][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][0][1][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][0][1][0], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][0][0][1][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][0][0][1], 0);
  objc_storeStrong((id *)&self->_fuseRemixShaders[0][0][0][0][1], 0);
  objc_storeStrong((id *)self->_fuseRemixShaders[0][0][0][0], 0);
}

@end
