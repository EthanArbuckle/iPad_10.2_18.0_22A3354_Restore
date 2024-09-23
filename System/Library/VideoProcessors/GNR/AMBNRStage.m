@implementation AMBNRStage

- (int)setResourcesWithPyramid:(id)a3 laplacianPyramid:(id)a4 denoisedPyramid:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_pyramid, a3);
  if (-[PyramidStage setResourcesWithPyramid:](self->_pyramidStage, "setResourcesWithPyramid:", v9)
    || -[DenoiseRemixStage setResourcesWithPyramid:laplacianPyramid:](self->_denoiseRemixStage, "setResourcesWithPyramid:laplacianPyramid:", v11, v10))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = FigSignalErrorAt();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)computeConfiguration:(exposureParameters *)a3 tuningParams:(id)a4 highGainTuningParams:(id)a5 correctBias:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  unsigned __int8 *v12;
  __int128 v13;
  __int128 v14;
  uint64_t levels;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unsigned __int8 *v19;
  float *p_luma_param;
  PyramidStorage *pyramid;
  uint64_t v22;
  float32x2_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int32x2_t v27;
  uint64x2_t v28;
  uint64_t v29;
  uint64_t v30;
  int32x2_t v31;
  uint64x2_t v32;
  _DWORD *v34;

  v6 = a6;
  v34 = a4;
  v10 = a5;
  if (self->_pyramid->levels >= 1)
  {
    v11 = 0;
    v12 = &self->_anon_78[144];
    if (v10)
    {
      do
      {
        computeNoiseModel((uint64_t)(v12 - 240), v34, &a3->gain, v11, 1, v6);
        computeNoiseModel((uint64_t)(v12 - 144), v10, &a3->gain, v11, 1, v6);
        *((_DWORD *)v12 - 2) = v34[8];
        *((_DWORD *)v12 - 1) = v34[9];
        *(_DWORD *)v12 = v34[10];
        v13 = *(_OWORD *)&a3->gain;
        v14 = *(_OWORD *)&a3->exposure_time;
        *((_QWORD *)v12 - 2) = *(_QWORD *)&a3->exposure_bias;
        *((_OWORD *)v12 - 3) = v13;
        *((_OWORD *)v12 - 2) = v14;
        ++v11;
        levels = self->_pyramid->levels;
        v12 += 272;
      }
      while (v11 < levels);
    }
    else
    {
      do
      {
        computeNoiseModel((uint64_t)(v12 - 240), v34, &a3->gain, v11, 1, v6);
        *((_DWORD *)v12 - 2) = v34[8];
        *((_DWORD *)v12 - 1) = v34[9];
        *(_DWORD *)v12 = v34[10];
        v16 = *(_OWORD *)&a3->gain;
        v17 = *(_OWORD *)&a3->exposure_time;
        *((_QWORD *)v12 - 2) = *(_QWORD *)&a3->exposure_bias;
        *((_OWORD *)v12 - 3) = v16;
        *((_OWORD *)v12 - 2) = v17;
        ++v11;
        levels = self->_pyramid->levels;
        v12 += 272;
      }
      while (v11 < levels);
    }
    if ((int)levels >= 2)
    {
      v18 = 0;
      v19 = &self->_anon_78[148];
      p_luma_param = &self->_pyrFilters[0].luma_param;
      do
      {
        -[AMBNRStage selectBlurKernelSize:](self, "selectBlurKernelSize:", v19 - 244);
        *((_DWORD *)p_luma_param - 1) = 1;
        *(_QWORD *)p_luma_param = *(_QWORD *)v19;
        p_luma_param += 3;
        ++v18;
        pyramid = self->_pyramid;
        v22 = pyramid->levels;
        v19 += 272;
      }
      while (v18 < v22 - 1);
      if ((int)v22 >= 2)
      {
        v23 = (float32x2_t *)&self->_anon_78[168];
        v24 = 1;
        do
        {
          v25 = -[MTLTexture width](pyramid->textureY[v24], "width");
          v26 = -[MTLTexture height](self->_pyramid->textureY[v24], "height");
          v28.i64[0] = v25;
          v28.i64[1] = v26;
          if (self->_pyramidOffsetsMatchStock)
            *(float *)v27.i32 = -0.25;
          else
            *(float *)v27.i32 = 0.25;
          v23[-1] = vdiv_f32((float32x2_t)vdup_lane_s32(v27, 0), vcvt_f32_f64(vcvtq_f64_u64(v28)));
          v29 = -[MTLTexture width](self->_pyramid->textureUV[v24], "width");
          v30 = -[MTLTexture height](self->_pyramid->textureUV[v24], "height");
          if (self->_pyramidOffsetsMatchStock)
            *(float *)v31.i32 = -0.25;
          else
            *(float *)v31.i32 = 0.25;
          v32.i64[0] = v29;
          v32.i64[1] = v30;
          *v23 = vdiv_f32((float32x2_t)vdup_lane_s32(v31, 0), vcvt_f32_f64(vcvtq_f64_u64(v32)));
          pyramid = self->_pyramid;
          v23 += 34;
        }
        while (v24++ < pyramid->levels - 1);
      }
    }
  }

}

- (id)init:(id)a3 onlySingleImageDenoising:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  AMBNRStage *v8;
  void *v9;
  void *v10;
  PyramidStage *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PyramidStage *pyramidStage;
  DenoiseRemixStage *v17;
  DenoiseRemixStage *denoiseRemixStage;
  AMBNRStage *v19;
  objc_super v21;
  _QWORD v22[4];
  _QWORD v23[4];
  const __CFString *v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = CFSTR("gnr.AMBNR.PyramidOffsetsMatchStock");
  v25[0] = &unk_24D6700F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)AMBNRStage;
  v8 = -[AMBNRStage init](&v21, sel_init);
  if (v8)
  {
    loadDefaultsWritesWithPrefix();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gnr.AMBNR.PyramidOffsetsMatchStock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_pyramidOffsetsMatchStock = objc_msgSend(v10, "BOOLValue");

    v11 = [PyramidStage alloc];
    v23[0] = &unk_24D6700F0;
    v22[0] = CFSTR("PyrGen.DoSync");
    v22[1] = CFSTR("PyrGen.CompensateGpuShift");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8->_pyramidOffsetsMatchStock);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    v23[2] = &unk_24D670108;
    v22[2] = CFSTR("PyrGen.UseHW");
    v22[3] = CFSTR("PyrGen.SupportFP16");
    if (v4)
      v13 = &unk_24D670108;
    else
      v13 = &unk_24D6700F0;
    v23[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PyramidStage initWithOptions:context:](v11, "initWithOptions:context:", v14, v6);
    pyramidStage = v8->_pyramidStage;
    v8->_pyramidStage = (PyramidStage *)v15;

    if (v8->_pyramidStage
      && (v17 = -[DenoiseRemixStage initWithContext:onlySingleImageDenoising:]([DenoiseRemixStage alloc], "initWithContext:onlySingleImageDenoising:", v6, v4), denoiseRemixStage = v8->_denoiseRemixStage, v8->_denoiseRemixStage = v17, denoiseRemixStage, v8->_denoiseRemixStage))
    {
      v19 = v8;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int)run:(__CVBuffer *)a3 metalContext:(id)a4 exposure:(exposureParameters *)a5 tuningParams:(id)a6 highGainTuningParams:(id)a7 ltmBuffers:(id)a8 correctBias:(BOOL)a9
{
  id v15;
  float *v16;
  id v17;
  id v18;
  int v19;

  v15 = a4;
  v16 = (float *)a6;
  v17 = a7;
  v18 = a8;
  if (v16[8] == 0.0
    || (-[AMBNRStage computeConfiguration:tuningParams:highGainTuningParams:correctBias:](self, "computeConfiguration:tuningParams:highGainTuningParams:correctBias:", a5, v16, v17, a9), -[PyramidStage runWithFilters:](self->_pyramidStage, "runWithFilters:", self->_pyrFilters))|| -[DenoiseRemixStage setUniforms:](self->_denoiseRemixStage, "setUniforms:", self->_ambnrConf))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
  }
  else
  {
    -[DenoiseRemixStage run:gainPixelBuffer:ltmBuffers:](self->_denoiseRemixStage, "run:gainPixelBuffer:ltmBuffers:", self->_pyramid, a3, v18);
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyramid, 0);
  objc_storeStrong((id *)&self->_denoiseRemixStage, 0);
  objc_storeStrong((id *)&self->_pyramidStage, 0);
}

- (void)selectBlurKernelSize:(AmbnrConfiguration *)a3
{
  float v3;

  v3 = *((float *)&a3[1].var0 + 1);
  if (v3 >= 4.0)
  {
    if (v3 >= 6.0)
      a3[10].nm.lumaSigmaSlope = 7.0;
    else
      a3[10].nm.lumaSigmaSlope = 5.0;
    a3[10].nm.lumaSigmaMax = 5.0;
  }
  else
  {
    a3[10].nm.lumaSigmaSlope = 3.0;
    a3[10].nm.lumaSigmaMax = 5.0;
  }
}

@end
