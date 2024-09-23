@implementation FuseRemixShaders

- (FuseRemixShaders)initWithMetal:(id)a3 pixelFormatLuma:(unint64_t)a4 pixelFormatChroma:(unint64_t)a5 fusionType:(int)a6 fixPyramidAlignment:(BOOL)a7 staticOIS:(BOOL)a8 reduceOisGhosting:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  id v15;
  FuseRemixShaders *v16;
  FuseRemixFragmentShader *v17;
  void *v18;
  uint64_t v19;
  FuseRemixFragmentShader *fuseLuma;
  FuseRemixFragmentShader *v21;
  void *v22;
  uint64_t v23;
  FuseRemixFragmentShader *fuseChroma;
  FuseRemixFragmentShader *v25;
  void *v26;
  uint64_t v27;
  FuseRemixFragmentShader *fuseRemixLuma;
  FuseRemixFragmentShader *v29;
  void *v30;
  uint64_t v31;
  FuseRemixFragmentShader *fuseRemixChroma;
  FuseRemixFragmentShader *v33;
  FuseRemixFragmentShader *blackSubtraction;
  FuseRemixShaders *v35;
  FuseRemixShaders *v36;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  v9 = a8;
  v10 = a7;
  v11 = *(_QWORD *)&a6;
  v15 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FuseRemixShaders;
  v16 = -[FuseRemixShaders init](&v44, sel_init);
  if (!v16)
    goto LABEL_8;
  v17 = [FuseRemixFragmentShader alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@LumaTopBand_Frag"), CFSTR("Fuse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = a9;
  v19 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:](v17, "initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v15, v18, a4, v11, v10, v9, v39);
  fuseLuma = v16->_fuseLuma;
  v16->_fuseLuma = (FuseRemixFragmentShader *)v19;

  if (v16->_fuseLuma)
  {
    v21 = [FuseRemixFragmentShader alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ChromaTopBand_Frag"), CFSTR("Fuse"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = a9;
    v23 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:](v21, "initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v15, v22, a5, v11, v10, v9, v40);
    fuseChroma = v16->_fuseChroma;
    v16->_fuseChroma = (FuseRemixFragmentShader *)v23;

    if (v16->_fuseChroma)
    {
      v25 = [FuseRemixFragmentShader alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@LumaBand_Frag"), CFSTR("Fuse"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v41) = a9;
      v27 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:](v25, "initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v15, v26, a4, v11, v10, v9, v41);
      fuseRemixLuma = v16->_fuseRemixLuma;
      v16->_fuseRemixLuma = (FuseRemixFragmentShader *)v27;

      if (v16->_fuseRemixLuma)
      {
        v29 = [FuseRemixFragmentShader alloc];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ChromaBand_Frag"), CFSTR("Fuse"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v42) = a9;
        v31 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:](v29, "initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v15, v30, a5, v11, v10, v9, v42);
        fuseRemixChroma = v16->_fuseRemixChroma;
        v16->_fuseRemixChroma = (FuseRemixFragmentShader *)v31;

        if (v16->_fuseRemixChroma)
        {
          if ((_DWORD)v11 != 3)
            goto LABEL_8;
          LOBYTE(v43) = 0;
          v33 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:]([FuseRemixFragmentShader alloc], "initWithMetal:fragName:pixelFormat:fusionType:fixPyramidAlignment:staticOIS:reduceOisGhosting:", v15, CFSTR("blackSubtractAndAddingContrast"), 10, 3, v10, 0, v43);
          blackSubtraction = v16->_blackSubtraction;
          v16->_blackSubtraction = v33;

          if (v16->_blackSubtraction)
            goto LABEL_8;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v38 = FigSignalErrorAt();
  v35 = 0;
  if (!v38)
LABEL_8:
    v35 = v16;
  v36 = v35;

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackSubtraction, 0);
  objc_storeStrong((id *)&self->_fuseRemixChroma, 0);
  objc_storeStrong((id *)&self->_fuseRemixLuma, 0);
  objc_storeStrong((id *)&self->_fuseChroma, 0);
  objc_storeStrong((id *)&self->_fuseLuma, 0);
}

@end
