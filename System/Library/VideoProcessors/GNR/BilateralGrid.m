@implementation BilateralGrid

- (void)dealloc
{
  objc_super v3;

  -[BilateralGrid releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)BilateralGrid;
  -[BilateralGrid dealloc](&v3, sel_dealloc);
}

- (BilateralGrid)initWithContext:(id)a3
{
  return -[BilateralGrid initWithContext:normalizeGridConfidence:](self, "initWithContext:normalizeGridConfidence:", a3, 1);
}

- (void)releaseResources
{
  MTLTexture *grid_tex;
  MTLTexture *tmp_grid_tex;
  MTLTexture *confidence_solved_tex;
  MTLTexture *bistochast_m_tex;
  MTLTexture *bistochast_n_tex;
  MTLTexture *A_tex;
  MTLTexture *x0_tex;
  MTLTexture *x1_tex;
  MTLTexture *residual0_tex;
  MTLTexture *residual1_tex;
  MTLTexture *d0_tex;
  MTLTexture *d1_tex;
  MTLTexture *q_tex;

  grid_tex = self->_grid_tex;
  self->_grid_tex = 0;

  tmp_grid_tex = self->_tmp_grid_tex;
  self->_tmp_grid_tex = 0;

  confidence_solved_tex = self->_confidence_solved_tex;
  self->_confidence_solved_tex = 0;

  bistochast_m_tex = self->_bistochast_m_tex;
  self->_bistochast_m_tex = 0;

  bistochast_n_tex = self->_bistochast_n_tex;
  self->_bistochast_n_tex = 0;

  A_tex = self->_A_tex;
  self->_A_tex = 0;

  x0_tex = self->_x0_tex;
  self->_x0_tex = 0;

  x1_tex = self->_x1_tex;
  self->_x1_tex = 0;

  residual0_tex = self->_residual0_tex;
  self->_residual0_tex = 0;

  residual1_tex = self->_residual1_tex;
  self->_residual1_tex = 0;

  d0_tex = self->_d0_tex;
  self->_d0_tex = 0;

  d1_tex = self->_d1_tex;
  self->_d1_tex = 0;

  q_tex = self->_q_tex;
  self->_q_tex = 0;

}

- (BilateralGrid)initWithContext:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  id v7;
  BilateralGrid *v8;
  BilateralGrid *v9;
  void *v10;
  uint64_t v11;
  MTLBuffer *uniforms;
  void *v13;
  uint64_t v14;
  MTLBuffer *max_grid_confidence;
  void *v16;
  uint64_t v17;
  BilateralGridShaders *shaders;
  void *v19;
  uint64_t v20;
  MTLBuffer *l0_buf;
  void *v22;
  uint64_t v23;
  MTLBuffer *l1_buf;
  void *v25;
  uint64_t v26;
  MTLBuffer *alpha_buf;
  void *v28;
  uint64_t v29;
  MTLBuffer *residual_buf;
  void *v31;
  uint64_t v32;
  MTLBuffer *hasconverged_buf;
  BilateralGrid *v34;
  BilateralGrid *v35;
  int v37;
  objc_super v38;

  v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BilateralGrid;
  v8 = -[BilateralGrid init](&v38, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metal, a3);
    v9->_normalizeGridConfidence = a4;
    -[FigMetalContext device](v9->_metal, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "newBufferWithLength:options:", 36, 0);
    uniforms = v9->_uniforms;
    v9->_uniforms = (MTLBuffer *)v11;

    if (v9->_uniforms)
    {
      -[FigMetalContext device](v9->_metal, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "newBufferWithLength:options:", 4, 0);
      max_grid_confidence = v9->_max_grid_confidence;
      v9->_max_grid_confidence = (MTLBuffer *)v14;

      if (v9->_max_grid_confidence)
      {
        +[BilateralGridShared sharedInstance](BilateralGridShared, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "getShaders:normalizeGridConfidence:", v9->_metal, v9->_normalizeGridConfidence);
        v17 = objc_claimAutoreleasedReturnValue();
        shaders = v9->_shaders;
        v9->_shaders = (BilateralGridShaders *)v17;

        if (v9->_shaders)
        {
          -[FigMetalContext device](v9->_metal, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "newBufferWithLength:options:", 4, 0);
          l0_buf = v9->_l0_buf;
          v9->_l0_buf = (MTLBuffer *)v20;

          if (v9->_l0_buf)
          {
            -[FigMetalContext device](v9->_metal, "device");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "newBufferWithLength:options:", 4, 0);
            l1_buf = v9->_l1_buf;
            v9->_l1_buf = (MTLBuffer *)v23;

            if (v9->_l1_buf)
            {
              -[FigMetalContext device](v9->_metal, "device");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "newBufferWithLength:options:", 4, 0);
              alpha_buf = v9->_alpha_buf;
              v9->_alpha_buf = (MTLBuffer *)v26;

              if (v9->_alpha_buf)
              {
                -[FigMetalContext device](v9->_metal, "device");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "newBufferWithLength:options:", 4, 0);
                residual_buf = v9->_residual_buf;
                v9->_residual_buf = (MTLBuffer *)v29;

                if (v9->_residual_buf)
                {
                  -[FigMetalContext device](v9->_metal, "device");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "newBufferWithLength:options:", 4, 0);
                  hasconverged_buf = v9->_hasconverged_buf;
                  v9->_hasconverged_buf = (MTLBuffer *)v32;

                  if (v9->_hasconverged_buf)
                    goto LABEL_10;
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v37 = FigSignalErrorAt();
  v34 = 0;
  if (!v37)
LABEL_10:
    v34 = v9;
  v35 = v34;

  return v35;
}

- (int)config:(unint64_t)a3 height:(unint64_t)a4 space_sigma:(int)a5 range_sigma:(float)a6 solver:(BilateralSolverConfiguration)a7
{
  float v7;
  float min_input_signal;
  float min_confidence;
  int32x2_t v11;
  float lambda;
  uint64x2_t v14;
  float v20;
  uint64_t v21;
  float max_input_signal;
  float v24;

  if (a3
    && a4
    && (v7 = a7.max_input_signal,
        min_input_signal = a7.min_input_signal,
        min_confidence = a7.min_confidence,
        a7.max_input_signal = a6,
        v11.i32[1] = 1025758986,
        (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(vdupq_n_s32(a5), (int32x4_t)xmmword_216F96160), (int8x16_t)vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7.max_input_signal, 0), (float32x4_t)xmmword_216F96170))), 0xFuLL))) & 1) != 0))
  {
    lambda = a7.lambda;
    self->_space_sigma = a5;
    self->_range_sigma = a6;
    self->_input_width = a3;
    self->_input_height = a4;
    v14.i64[0] = a3;
    v14.i64[1] = a4;
    *(float *)v11.i32 = (float)a5;
    max_input_signal = a7.max_input_signal;
    v24 = (float)a5;
    __asm { FMOV            V1.2S, #-1.0 }
    *(int32x2_t *)&self->_grid_width = vadd_s32(vcvt_s32_f32(vdiv_f32(vadd_f32(vcvt_f32_f64(vcvtq_f64_u64(v14)), _D1), (float32x2_t)vdup_lane_s32(v11, 0))), (int32x2_t)0x100000001);
    v20 = 1.0 / a7.max_input_signal;
    self->_grid_depth = (unsigned __int16)((int)(float)(1.0 / a7.max_input_signal) + 1);
    v21 = -[MTLBuffer contents](self->_uniforms, "contents");
    *(_DWORD *)v21 = a5;
    *(float *)(v21 + 4) = max_input_signal;
    *(float *)(v21 + 8) = 1.0 / v24;
    *(float *)(v21 + 12) = v20;
    *(_DWORD *)(v21 + 16) = self->_grid_depth;
    *(float *)(v21 + 20) = min_confidence;
    *(float *)(v21 + 24) = min_input_signal;
    *(float *)(v21 + 28) = v7;
    *(float *)(v21 + 32) = lambda;
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)allocateResourcesWithConfiguration:(BilateralGridConfiguration *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v12;
  MTLTexture *v13;
  MTLTexture *grid_tex;
  MTLTexture *v15;
  MTLTexture *tmp_grid_tex;
  MTLTexture *v17;
  MTLTexture *confidence_solved_tex;
  MTLTexture *v19;
  MTLTexture *bistochast_m_tex;
  MTLTexture *v21;
  MTLTexture *bistochast_n_tex;
  MTLTexture *v23;
  MTLTexture *A_tex;
  MTLTexture *v25;
  MTLTexture *x0_tex;
  MTLTexture *v27;
  MTLTexture *x1_tex;
  MTLTexture *v29;
  MTLTexture *residual0_tex;
  MTLTexture *v31;
  MTLTexture *residual1_tex;
  MTLTexture *v33;
  MTLTexture *d0_tex;
  MTLTexture *v35;
  MTLTexture *d1_tex;
  MTLTexture *v37;
  MTLTexture *q_tex;
  int v40;
  uint64_t v41;
  uint64_t v42;

  *(float *)&v6 = a3->var1;
  *(float *)&v7 = a3->var2.min_confidence;
  *(float *)&v8 = a3->var2.min_input_signal;
  *(float *)&v9 = a3->var2.max_input_signal;
  *(float *)&v10 = a3->var2.lambda;
  v12 = -[BilateralGrid config:height:space_sigma:range_sigma:solver:](self, "config:height:space_sigma:range_sigma:solver:", a4, a5, a3->var0, v6, v7, v8, v9, v10);
  if (v12)
  {
    v40 = v12;
    fig_log_get_emitter();
    v42 = v5;
    LODWORD(v41) = v40;
    FigDebugAssert3();
  }
  else
  {
    v13 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 115);
    grid_tex = self->_grid_tex;
    self->_grid_tex = v13;

    if (self->_grid_tex)
    {
      v15 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 115);
      tmp_grid_tex = self->_tmp_grid_tex;
      self->_tmp_grid_tex = v15;

      if (self->_tmp_grid_tex)
      {
        v17 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 25);
        confidence_solved_tex = self->_confidence_solved_tex;
        self->_confidence_solved_tex = v17;

        if (self->_confidence_solved_tex)
        {
          v19 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
          bistochast_m_tex = self->_bistochast_m_tex;
          self->_bistochast_m_tex = v19;

          if (self->_bistochast_m_tex)
          {
            v21 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
            bistochast_n_tex = self->_bistochast_n_tex;
            self->_bistochast_n_tex = v21;

            if (self->_bistochast_n_tex)
            {
              v23 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
              A_tex = self->_A_tex;
              self->_A_tex = v23;

              if (self->_A_tex)
              {
                v25 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 25);
                x0_tex = self->_x0_tex;
                self->_x0_tex = v25;

                if (self->_x0_tex)
                {
                  v27 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 25);
                  x1_tex = self->_x1_tex;
                  self->_x1_tex = v27;

                  if (self->_x1_tex)
                  {
                    v29 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
                    residual0_tex = self->_residual0_tex;
                    self->_residual0_tex = v29;

                    if (self->_residual0_tex)
                    {
                      v31 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
                      residual1_tex = self->_residual1_tex;
                      self->_residual1_tex = v31;

                      if (self->_residual1_tex)
                      {
                        v33 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
                        d0_tex = self->_d0_tex;
                        self->_d0_tex = v33;

                        if (self->_d0_tex)
                        {
                          v35 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
                          d1_tex = self->_d1_tex;
                          self->_d1_tex = v35;

                          if (self->_d1_tex)
                          {
                            v37 = -[BilateralGrid allocGridTexture:](self, "allocGridTexture:", 55);
                            q_tex = self->_q_tex;
                            self->_q_tex = v37;

                            if (self->_q_tex)
                              return 0;
                          }
                        }
                      }
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
    v42 = v5;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    v40 = FigSignalErrorAt();
  }
  -[BilateralGrid releaseResources](self, "releaseResources", v41, v42);
  return v40;
}

- (id)allocGridTexture:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3, self->_grid_width, self->_grid_height, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTextureType:", 7);
    objc_msgSend(v5, "setDepth:", self->_grid_depth);
    objc_msgSend(v5, "setUsage:", 3);
    -[FigMetalContext device](self->_metal, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newTextureWithDescriptor:", v5);

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasconverged_buf, 0);
  objc_storeStrong((id *)&self->_residual_buf, 0);
  objc_storeStrong((id *)&self->_alpha_buf, 0);
  objc_storeStrong((id *)&self->_l1_buf, 0);
  objc_storeStrong((id *)&self->_l0_buf, 0);
  objc_storeStrong((id *)&self->_q_tex, 0);
  objc_storeStrong((id *)&self->_d1_tex, 0);
  objc_storeStrong((id *)&self->_d0_tex, 0);
  objc_storeStrong((id *)&self->_confidence_solved_tex, 0);
  objc_storeStrong((id *)&self->_residual1_tex, 0);
  objc_storeStrong((id *)&self->_residual0_tex, 0);
  objc_storeStrong((id *)&self->_x1_tex, 0);
  objc_storeStrong((id *)&self->_x0_tex, 0);
  objc_storeStrong((id *)&self->_A_tex, 0);
  objc_storeStrong((id *)&self->_bistochast_n_tex, 0);
  objc_storeStrong((id *)&self->_bistochast_m_tex, 0);
  objc_storeStrong((id *)&self->_max_grid_confidence, 0);
  objc_storeStrong((id *)&self->_tmp_grid_tex, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_uniforms, 0);
  objc_storeStrong((id *)&self->_grid_tex, 0);
}

+ (int)prewarmShaders:(id)a3
{
  id v3;
  BilateralGridShaders *v4;
  BilateralGridShaders *v5;
  BilateralGridShaders *v6;
  int v7;

  v3 = a3;
  v4 = -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]([BilateralGridShaders alloc], "initWithMetal:normalizeGridConfidence:", v3, 0);
  if (v4
    && (v5 = v4,
        v6 = -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]([BilateralGridShaders alloc], "initWithMetal:normalizeGridConfidence:", v3, 1), v5, v6))
  {
    v7 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = FigSignalErrorAt();
    v6 = 0;
  }

  return v7;
}

- (int)buildWithGuideAndConfidence:(id)a3 target:(id)a4 confidence:(id)a5 grid_tex:(id)a6 ltc_tex:(id)a7 gtcRatio_tex:(id)a8 gtcFinal_tex:(id)a9 ltmROI:
{
  __int128 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t grid_width;
  uint64_t grid_height;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  __int128 v32;
  id v33;
  id v34;
  int64x2_t v35;
  uint64_t v36;
  _QWORD v37[3];
  __int128 v38;

  v32 = v9;
  v34 = a3;
  v33 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v38 = v32;
  grid_width = self->_grid_width;
  grid_height = self->_grid_height;
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commandBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "computeCommandEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = (unint64_t)(grid_width + 7) >> 3;
      v28 = (unint64_t)(grid_height + 7) >> 3;
      v29 = 8;
      if (v18)
        v29 = 16;
      objc_msgSend(v25, "setComputePipelineState:", *(Class *)((char *)&self->_shaders->super.isa + v29));
      objc_msgSend(v26, "setTexture:atIndex:", v34, 0);
      objc_msgSend(v26, "setTexture:atIndex:", v33, 1);
      objc_msgSend(v26, "setTexture:atIndex:", v16, 2);
      objc_msgSend(v26, "setTexture:atIndex:", v17, 3);
      if (v18 && v19 && v20)
      {
        objc_msgSend(v26, "setTexture:atIndex:", v18, 4);
        objc_msgSend(v26, "setTexture:atIndex:", v19, 5);
        objc_msgSend(v26, "setTexture:atIndex:", v20, 6);
        objc_msgSend(v26, "setBytes:length:atIndex:", &v38, 16, 1);
      }
      objc_msgSend(v26, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
      v37[0] = v27;
      v37[1] = v28;
      v37[2] = 1;
      v35 = vdupq_n_s64(8uLL);
      v36 = 1;
      objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v37, &v35);
      objc_msgSend(v26, "endEncoding");
      objc_msgSend(v24, "commit");
      v30 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v30 = FigSignalErrorAt();
    }

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v30 = FigSignalErrorAt();
  }

  return v30;
}

- (int)blurAndNormalize:(id)a3 grid_tmp_tex:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t grid_height;
  uint64_t grid_width;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  id obj;
  id v37;
  int64x2_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v8;
  grid_width = self->_grid_width;
  grid_height = self->_grid_height;
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
    v16 = v9;
    v31 = v10;
    goto LABEL_17;
  }
  objc_msgSend(v14, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    v31 = v10;
    v19 = v9;
LABEL_26:
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();

    v16 = v19;
    goto LABEL_17;
  }
  v17 = (unint64_t)(grid_width + 7) >> 3;
  v18 = (unint64_t)(grid_height + 7) >> 3;
  objc_msgSend(v15, "setComputePipelineState:", self->_shaders->_bgBlur[0]);
  objc_msgSend(v16, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v10, 1);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v16, "endEncoding");
  v19 = v9;

  objc_msgSend(v14, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v16 = v19;
    v31 = v19;
    v19 = v10;
    goto LABEL_26;
  }
  v21 = v20;
  v37 = v9;
  objc_msgSend(v20, "setComputePipelineState:", self->_shaders->_bgBlur[0]);
  objc_msgSend(v21, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v21, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v21, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v21, "endEncoding");

  v22 = v10;
  objc_msgSend(v14, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_18;
  v24 = v23;
  obj = a3;
  objc_msgSend(v23, "setComputePipelineState:", self->_shaders->_bgBlur[1]);
  objc_msgSend(v24, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v24, "setTexture:atIndex:", v22, 1);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v24, "endEncoding");

  v19 = v19;
  objc_msgSend(v14, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v16 = v19;
    v31 = v19;
LABEL_24:
    v19 = v22;
    goto LABEL_25;
  }
  v26 = v25;
  objc_msgSend(v25, "setComputePipelineState:", self->_shaders->_bgBlur[1]);
  objc_msgSend(v26, "setTexture:atIndex:", v22, 0);
  objc_msgSend(v26, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v26, "endEncoding");

  v22 = v22;
  objc_msgSend(v14, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
LABEL_18:
    v16 = v22;
    v31 = v22;
LABEL_25:
    v9 = v37;
    goto LABEL_26;
  }
  v28 = v27;
  objc_msgSend(v27, "setComputePipelineState:", self->_shaders->_bgBlur[2]);
  objc_msgSend(v28, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v28, "setTexture:atIndex:", v22, 1);
  objc_msgSend(v28, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  if (self->_normalizeGridConfidence)
    objc_msgSend(v28, "setBuffer:offset:atIndex:", self->_max_grid_confidence, 0, 1);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v28, "endEncoding");

  v16 = v19;
  objc_msgSend(v14, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v31 = v16;
    goto LABEL_24;
  }
  v30 = v29;
  objc_msgSend(v29, "setComputePipelineState:", self->_shaders->_bgBlur[2]);
  objc_msgSend(v30, "setTexture:atIndex:", v22, 0);
  objc_msgSend(v30, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v30, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  if (self->_normalizeGridConfidence)
    objc_msgSend(v30, "setBuffer:offset:atIndex:", self->_max_grid_confidence, 0, 1);
  v40 = v17;
  v41 = v18;
  v42 = 1;
  v38 = vdupq_n_s64(8uLL);
  v39 = 1;
  objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v30, "endEncoding");

  v31 = v22;
  objc_msgSend(v14, "computeCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "setComputePipelineState:", self->_shaders->_bgNormalize);
    objc_msgSend(v33, "setTexture:atIndex:", v16, 0);
    objc_msgSend(v33, "setTexture:atIndex:", v31, 1);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
    v9 = v37;
    if (self->_normalizeGridConfidence)
      objc_msgSend(v33, "setBuffer:offset:atIndex:", self->_max_grid_confidence, 0, 1);
    v40 = v17;
    v41 = v18;
    v42 = 1;
    v38 = vdupq_n_s64(8uLL);
    v39 = 1;
    objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
    objc_msgSend(v33, "endEncoding");
    objc_msgSend(v14, "commit");
    objc_storeStrong((id *)&self->_grid_tex, a4);
    objc_storeStrong((id *)&self->_tmp_grid_tex, obj);
    v34 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
    v9 = v37;
  }

LABEL_17:
  return v34;
}

- (int)upsample:(id)a3 grid_tex:(id)a4 conf_tex:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  __int128 v9;
  id v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  int v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  __int128 v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;

  v41 = v9;
  v42 = a3;
  v44 = a4;
  v43 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = v18;
  v45 = v41;
  if (v16)
    v20 = v17 == 0;
  else
    v20 = 1;
  v21 = !v20;
  v22 = v18 != 0;
  v23 = a9;
  v24 = objc_msgSend(v23, "pixelFormat");
  v25 = v21 & v22;
  v26 = 64;
  if (v25)
    v26 = 72;
  if (v24 != 25)
    v26 = 56;
  v27 = *(id *)((char *)&self->_shaders->super.isa + v26);
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "colorAttachments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTexture:", v23);

  objc_msgSend(v28, "colorAttachments");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLoadAction:", 0);

  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commandBuffer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34
    && (objc_msgSend(v34, "renderCommandEncoderWithDescriptor:", v28), (v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = (void *)v35;
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", v37, 0, 0);

    v38 = v42;
    objc_msgSend(v36, "setFragmentTexture:atIndex:", v42, 0);
    objc_msgSend(v36, "setFragmentTexture:atIndex:", v44, 1);
    objc_msgSend(v36, "setFragmentTexture:atIndex:", v43, 2);
    if ((v25 & 1) != 0)
    {
      objc_msgSend(v36, "setFragmentTexture:atIndex:", v16, 3);
      objc_msgSend(v36, "setFragmentTexture:atIndex:", v17, 4);
      objc_msgSend(v36, "setFragmentTexture:atIndex:", v19, 5);
      objc_msgSend(v36, "setFragmentBytes:length:atIndex:", &v45, 16, 1);
    }
    objc_msgSend(v36, "setFragmentBuffer:offset:atIndex:", self->_uniforms, 0, 0);
    objc_msgSend(v36, "setRenderPipelineState:", v27);
    objc_msgSend(v36, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v36, "endEncoding");
    objc_msgSend(v34, "commit");

    v39 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v39 = FigSignalErrorAt();
    v38 = v42;
  }

  return v39;
}

- (int)filter:(id)a3 output:(id)a4
{
  return -[BilateralGrid solverfilterWithGuide:target:confidence:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:](self, "solverfilterWithGuide:target:confidence:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:", a3, a3, 0, 0, 0, 0, 0.0, a4);
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 output:(id)a6
{
  int result;
  int v7;

  result = -[BilateralGrid solverfilterWithGuide:target:confidence:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:](self, "solverfilterWithGuide:target:confidence:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:", a3, a4, a5, 0, 0, 0, 0.0, a6);
  v7 = result;
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v7;
  }
  return result;
}

- (int)solverfilterWithGuide:(id)a3 target:(id)a4 confidence:(id)a5 ltc_tex:(id)a6 gtcRatio_tex:(id)a7 gtcFinal_tex:(id)a8 ltmROI:(id)a9 output:
{
  uint64_t v9;
  double v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _DWORD *v24;
  uint64_t v25;
  int v26;
  MTLTexture *v27;
  MTLTexture *confidence_solved_tex;
  int v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  _QWORD v37[7];

  v36 = v10;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v25 = objc_msgSend(v17, "pixelFormat");
  v35 = v18;
  if (v25 > 575)
  {
    if (v25 != 576 && v25 != 588)
    {
LABEL_22:
      fig_log_get_emitter();
      v34 = v9;
      LODWORD(v33) = 0;
      FigDebugAssert3();
      v27 = 0;
      v29 = -1;
      if (!*v24)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if (v25 != 10 && v25 != 25)
  {
    goto LABEL_22;
  }
  v26 = -[BilateralGrid buildWithGuideAndConfidence:target:confidence:grid_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:](self, "buildWithGuideAndConfidence:target:confidence:grid_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:", v17, v18, v19, self->_grid_tex, v20, v21, v36, v22);
  if (v26)
  {
    v29 = v26;
    fig_log_get_emitter();
    v34 = v9;
    LODWORD(v33) = v29;
    FigDebugAssert3();
    v27 = 0;
    if (!*MEMORY[0x24BDC0B48])
      goto LABEL_21;
    goto LABEL_20;
  }
  if (v19)
  {
    -[BilateralGrid solverBistochastize:](self, "solverBistochastize:", 10);
    -[BilateralGrid solverPcg:](self, "solverPcg:", 20);
    v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      confidence_solved_tex = self->_confidence_solved_tex;
      goto LABEL_15;
    }
LABEL_18:
    v29 = 0;
    goto LABEL_19;
  }
  -[BilateralGrid blurAndNormalize:grid_tmp_tex:](self, "blurAndNormalize:grid_tmp_tex:", self->_grid_tex, self->_tmp_grid_tex);
  v27 = self->_grid_tex;
  if (!v23)
    goto LABEL_18;
  confidence_solved_tex = 0;
LABEL_15:
  v29 = -[BilateralGrid upsample:grid_tex:conf_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:](self, "upsample:grid_tex:conf_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:", v17, v27, confidence_solved_tex, v20, v21, v22, v36, v23);
  if (v29)
  {
    fig_log_get_emitter();
    v34 = v9;
    LODWORD(v33) = v29;
    FigDebugAssert3();
    if (!*MEMORY[0x24BDC0B48])
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_19:
  if (*MEMORY[0x24BDC0B48])
  {
LABEL_20:
    -[FigMetalContext commandQueue](self->_metal, "commandQueue", v33, v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "commandBuffer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setLabel:", CFSTR("KTRACE_END_MTL"));
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __105__BilateralGrid_solverfilterWithGuide_target_confidence_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output___block_invoke;
    v37[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v37[4], 0, 24);
    objc_msgSend(v31, "addCompletedHandler:", v37);
    objc_msgSend(v31, "commit");

  }
LABEL_21:

  return v29;
}

void __105__BilateralGrid_solverfilterWithGuide_target_confidence_ltc_tex_gtcRatio_tex_gtcFinal_tex_ltmROI_output___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

- (int)jointfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 output:(__CVBuffer *)a5
{
  return -[BilateralGrid solverfilter:target:confidence:output:](self, "solverfilter:target:confidence:output:", a3, a4, 0, a5);
}

- (int)solverBistochastize:(int)a3
{
  uint64_t grid_height;
  uint64_t grid_width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  MTLTexture *v15;
  void *v16;
  uint64_t grid_depth;
  uint64_t v18;
  __int128 v19;
  MTLTexture *bistochast_n_tex;
  void *v21;
  int v22;
  int64x2_t v24;
  __int128 v25;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  grid_width = self->_grid_width;
  grid_height = self->_grid_height;
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v8, "computeCommandEncoder"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v10 = v9;
  v11 = (unint64_t)(grid_width + 7) >> 3;
  v12 = (unint64_t)(grid_height + 7) >> 3;
  objc_msgSend(v9, "setComputePipelineState:", self->_shaders->_bgBistochastizeInit);
  objc_msgSend(v10, "setTexture:atIndex:", self->_grid_tex, 0);
  objc_msgSend(v10, "setTexture:atIndex:", self->_bistochast_m_tex, 1);
  objc_msgSend(v10, "setTexture:atIndex:", self->_bistochast_n_tex, 2);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
  v29 = v11;
  v30 = v12;
  v31 = 1;
  v27 = vdupq_n_s64(8uLL);
  v28 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", &v29, &v27);
  objc_msgSend(v10, "endEncoding");
  if (a3 >= 1)
  {
    v13 = 0;
    v24 = vdupq_n_s64(8uLL);
    while (1)
    {
      v14 = v10;
      v15 = self->_A_tex;
      objc_msgSend(v8, "computeCommandEncoder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      objc_msgSend(v10, "setComputePipelineState:", self->_shaders->_bgBistochastizeIter);
      objc_msgSend(v10, "setTexture:atIndex:", self->_bistochast_m_tex, 0);
      objc_msgSend(v10, "setTexture:atIndex:", self->_bistochast_n_tex, 1);
      objc_msgSend(v10, "setTexture:atIndex:", v15, 2);
      objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
      v29 = v11;
      v30 = v12;
      v31 = 1;
      v27 = v24;
      v28 = 1;
      objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", &v29, &v27);
      objc_msgSend(v10, "endEncoding");
      objc_msgSend(v8, "blitCommandEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v22 = FigSignalErrorAt();
        goto LABEL_15;
      }
      v29 = 0;
      v30 = 0;
      v31 = 0;
      grid_depth = self->_grid_depth;
      v18 = *(_QWORD *)&self->_grid_width;
      *(_QWORD *)&v19 = (int)v18;
      *((_QWORD *)&v19 + 1) = SHIDWORD(v18);
      v25 = v19;
      v26 = grid_depth;
      bistochast_n_tex = self->_bistochast_n_tex;
      v27 = 0uLL;
      v28 = 0;
      objc_msgSend(v16, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v15, 0, 0, &v29, &v25, bistochast_n_tex, 0, 0, &v27);
      objc_msgSend(v16, "endEncoding");

      v13 = v16;
      if (!--a3)
      {
        objc_msgSend(v8, "computeCommandEncoder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_12;
LABEL_9:
        objc_msgSend(v21, "setComputePipelineState:", self->_shaders->_bgBistochastizeFinal);
        objc_msgSend(v21, "setTexture:atIndex:", self->_grid_tex, 0);
        objc_msgSend(v21, "setTexture:atIndex:", self->_bistochast_n_tex, 1);
        objc_msgSend(v21, "setTexture:atIndex:", self->_A_tex, 2);
        objc_msgSend(v21, "setBuffer:offset:atIndex:", self->_uniforms, 0, 0);
        v29 = v11;
        v30 = v12;
        v31 = 1;
        v27 = vdupq_n_s64(8uLL);
        v28 = 1;
        objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", &v29, &v27);
        objc_msgSend(v21, "endEncoding");
        objc_msgSend(v8, "commit");

        v22 = 0;
        goto LABEL_10;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = FigSignalErrorAt();

LABEL_15:
    goto LABEL_10;
  }
  v16 = 0;
  objc_msgSend(v8, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_9;
LABEL_12:
  fig_log_get_emitter();
  FigDebugAssert3();
  v22 = FigSignalErrorAt();

LABEL_10:
  return v22;
}

- (id)solverPcg:(int)a3
{
  uint64_t grid_width;
  uint64_t grid_height;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  float v18;
  double v19;
  MTLTexture *v20;
  MTLTexture *v21;
  MTLTexture *v22;
  MTLTexture *v23;
  MTLTexture *v24;
  MTLTexture *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  float v35;
  int v36;
  int *v37;
  float v38;
  MTLTexture *v39;
  int64x2_t v41;
  int64x2_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _OWORD v48[3];
  MTLBuffer *v49;
  id v50;
  id obj;
  id v52;
  id v53;
  id v54;
  MTLTexture *v55;
  MTLTexture *v56;
  MTLTexture *v57;
  MTLTexture *v58;
  MTLTexture *v59;
  MTLTexture *v60;
  MTLTexture *v61;
  MTLTexture *v62;
  MTLTexture *v63;
  MTLTexture *v64;
  MTLTexture *v65;
  MTLTexture *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  grid_width = self->_grid_width;
  grid_height = self->_grid_height;
  v53 = 0;
  v54 = 0;
  memset(v48, 0, sizeof(v48));
  v55 = self->_grid_tex;
  v56 = self->_bistochast_n_tex;
  v57 = self->_bistochast_m_tex;
  v58 = self->_A_tex;
  v59 = self->_x0_tex;
  v60 = self->_residual0_tex;
  v61 = self->_d0_tex;
  v62 = self->_x1_tex;
  v63 = self->_residual1_tex;
  v64 = self->_d1_tex;
  v65 = self->_q_tex;
  v66 = self->_confidence_solved_tex;
  v49 = self->_uniforms;
  v50 = self->_l0_buf;
  obj = self->_l1_buf;
  v52 = self->_alpha_buf;
  objc_storeStrong(&v53, self->_residual_buf);
  objc_storeStrong(&v54, self->_hasconverged_buf);
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[FigMetalContext commandQueue](self->_metal, "commandQueue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "commandBuffer"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8,
        v9))
  {
    objc_msgSend(v9, "computeCommandEncoder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v12 = (unint64_t)(grid_width + 7) >> 3;
      v13 = (unint64_t)(grid_height + 7) >> 3;
      objc_msgSend(v10, "setComputePipelineState:", self->_shaders->_bgSolverInit1);
      objc_msgSend(v11, "setTextures:withRange:", &v55, 0, 12);
      objc_msgSend(v11, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
      v45 = v12;
      v46 = v13;
      v47 = 1;
      v43 = vdupq_n_s64(8uLL);
      v44 = 1;
      objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
      objc_msgSend(v11, "endEncoding");
      objc_msgSend(v9, "commit");
      -[FigMetalContext commandQueue](self->_metal, "commandQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "commandBuffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "computeCommandEncoder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "setComputePipelineState:", self->_shaders->_bgSolverInit2);
          objc_msgSend(v16, "setTextures:withRange:", &v55, 0, 12);
          objc_msgSend(v16, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
          v45 = v12;
          v46 = v13;
          v47 = 1;
          v43 = vdupq_n_s64(8uLL);
          v44 = 1;
          objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
          objc_msgSend(v16, "endEncoding");
          objc_msgSend(v15, "commit");
          if (a3 < 1)
          {
LABEL_21:
            v39 = v59;

          }
          else
          {
            v17 = 0;
            v41 = vdupq_n_s64(8uLL);
            while (1)
            {
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "commandBuffer");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
              {
LABEL_27:
                fig_log_get_emitter();
                FigDebugAssert3();
                FigSignalErrorAt();

                v39 = 0;
                goto LABEL_22;
              }
              objc_msgSend(v29, "computeCommandEncoder");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
                goto LABEL_28;
              objc_msgSend(v30, "setComputePipelineState:", self->_shaders->_bgSolverPcgIter0);
              objc_msgSend(v30, "setTextures:withRange:", &v55, 0, 12);
              objc_msgSend(v30, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
              v45 = v12;
              v46 = v13;
              v47 = 1;
              v43 = v41;
              v44 = 1;
              objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
              objc_msgSend(v30, "endEncoding");
              objc_msgSend(v29, "commit");
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "commandBuffer");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                break;
              objc_msgSend(v15, "computeCommandEncoder");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
                goto LABEL_30;
              objc_msgSend(v16, "setComputePipelineState:", self->_shaders->_bgSolverPcgIter1);
              objc_msgSend(v16, "setTextures:withRange:", &v55, 0, 12);
              objc_msgSend(v16, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
              v45 = v12;
              v46 = v13;
              v47 = 1;
              v43 = vdupq_n_s64(8uLL);
              v44 = 1;
              objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
              objc_msgSend(v16, "endEncoding");
              objc_msgSend(v15, "commit");
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "commandBuffer");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
                goto LABEL_27;
              objc_msgSend(v29, "computeCommandEncoder");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
              {
LABEL_28:
                fig_log_get_emitter();
                FigDebugAssert3();
                FigSignalErrorAt();

                v39 = 0;
                goto LABEL_22;
              }
              objc_msgSend(v30, "setComputePipelineState:", self->_shaders->_bgSolverPcgIter2);
              objc_msgSend(v30, "setTextures:withRange:", &v55, 0, 12);
              objc_msgSend(v30, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
              v45 = v12;
              v46 = v13;
              v47 = 1;
              v43 = vdupq_n_s64(8uLL);
              v44 = 1;
              objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
              objc_msgSend(v30, "endEncoding");
              objc_msgSend(v29, "commit");
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "commandBuffer");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                break;
              objc_msgSend(v15, "computeCommandEncoder");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
                goto LABEL_30;
              objc_msgSend(v16, "setComputePipelineState:", self->_shaders->_bgSolverPcgIter3);
              objc_msgSend(v16, "setTextures:withRange:", &v55, 0, 12);
              objc_msgSend(v16, "setBuffers:offsets:withRange:", &v49, v48, 0, 6);
              v45 = v12;
              v46 = v13;
              v47 = 1;
              v43 = vdupq_n_s64(8uLL);
              v44 = 1;
              objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v45, &v43);
              objc_msgSend(v16, "endEncoding");
              objc_msgSend(v15, "commit");
              -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
              print_grid_stats(v60, (uint64_t)"res0");
              print_grid_stats(v63, (uint64_t)"res1");
              v34 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v50), "contents");
              v35 = 0.0001;
              if ((float)((float)*(int *)objc_msgSend(objc_retainAutorelease(v52), "contents") * 0.00024414) > 0.0001)
                v35 = (float)*(int *)objc_msgSend(objc_retainAutorelease(v52), "contents") * 0.00024414;
              v36 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(obj), "contents");
              v37 = (int *)objc_msgSend(objc_retainAutorelease(v50), "contents");
              v38 = 0.0001;
              if ((float)((float)*v37 * 0.00024414) > 0.0001)
                v38 = (float)*(int *)objc_msgSend(objc_retainAutorelease(v50), "contents") * 0.00024414;
              v18 = (float)((float)v36 * 0.00024414) / v38;
              v19 = (float)((float)*(int *)objc_msgSend(objc_retainAutorelease(v50), "contents") * 0.00024414);
              NSLog(CFSTR("debug\t%d\tl0:%f\tl1:%f\tres:%f\talpha:%f\tbeta:%f\tconv:%u"), v17, *(_QWORD *)&v19, (float)((float)*(int *)objc_msgSend(objc_retainAutorelease(obj), "contents") * 0.00024414), (float)((float)*(int *)-[MTLBuffer contents](objc_retainAutorelease(self->_residual_buf), "contents")* 0.00024414), (float)((float)((float)v34 * 0.00024414) / v35), v18, *(unsigned int *)-[MTLBuffer contents](objc_retainAutorelease(self->_hasconverged_buf), "contents"));
              v20 = v59;
              objc_storeStrong((id *)&v59, v62);
              v21 = v62;
              v62 = v20;

              v22 = v61;
              objc_storeStrong((id *)&v61, v64);
              v23 = v64;
              v64 = v22;

              v24 = v60;
              objc_storeStrong((id *)&v60, v63);
              v25 = v63;
              v63 = v24;

              v26 = v50;
              objc_storeStrong(&v50, obj);
              v27 = obj;
              obj = v26;

              v17 = (v17 + 1);
              if (a3 == (_DWORD)v17)
                goto LABEL_21;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            FigSignalErrorAt();

            v39 = 0;
          }
        }
        else
        {
LABEL_30:
          fig_log_get_emitter();
          FigDebugAssert3();
          FigSignalErrorAt();

          v39 = 0;
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();

        v39 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();

      v39 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v39 = 0;
  }
LABEL_22:

  return v39;
}

- (int)solverfilter:(__CVBuffer *)a3 target:(__CVBuffer *)a4 confidence:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  _DWORD *v11;
  unint64_t input_height;
  unint64_t input_width;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  OSType PixelFormatType;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  OSType v28;
  uint64_t v29;
  void *v30;
  int v31;
  MTLTexture *v32;
  MTLTexture *confidence_solved_tex;
  int v34;
  void *v35;
  void *v36;
  _QWORD v38[7];

  v11 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  input_width = self->_input_width;
  input_height = self->_input_height;
  if (CVPixelBufferGetWidth(a3) == input_width && CVPixelBufferGetHeight(a3) == input_height)
  {
    v15 = self->_input_width;
    v14 = self->_input_height;
    if (CVPixelBufferGetWidth(a4) == v15 && CVPixelBufferGetHeight(a4) == v14)
    {
      if (CVPixelBufferGetPixelFormatType(a3) != 875704422)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v34 = -1;
        goto LABEL_46;
      }
      -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 10, 7, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
        v19 = 10;
        if (PixelFormatType == 1751411059)
          v19 = 25;
        if (PixelFormatType == 1751410032)
          v20 = 25;
        else
          v20 = v19;
        if (PixelFormatType == 1278226536)
          v21 = 25;
        else
          v21 = v20;
        -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, v21, 7, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v34 = FigSignalErrorAt();
          goto LABEL_45;
        }
        v23 = (void *)v22;
        if (a5)
        {
          v25 = self->_input_width;
          v24 = self->_input_height;
          if (CVPixelBufferGetWidth(a5) != v25
            || CVPixelBufferGetHeight(a5) != v24
            || (-[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a5, 25, 7, 0), (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v34 = FigSignalErrorAt();
            goto LABEL_44;
          }
        }
        if (a6)
        {
          v27 = self->_input_width;
          v26 = self->_input_height;
          if (CVPixelBufferGetWidth(a6) != v27 || CVPixelBufferGetHeight(a6) != v26)
            goto LABEL_55;
          v28 = CVPixelBufferGetPixelFormatType(a6);
          v29 = 25;
          if (v28 != 1278226536 && v28 != 1751410032 && v28 != 1751411059)
            v29 = 10;
          -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a6, v29, 6, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
LABEL_55:
            fig_log_get_emitter();
            FigDebugAssert3();
            v34 = FigSignalErrorAt();
            goto LABEL_43;
          }
        }
        else
        {
          v30 = 0;
        }
        v31 = -[BilateralGrid buildWithGuideAndConfidence:target:confidence:grid_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:](self, "buildWithGuideAndConfidence:target:confidence:grid_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:", v17, v23, a5, self->_grid_tex, 0, 0, 0.0, 0);
        if (v31)
        {
          v34 = v31;
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_42;
        }
        if (a5)
        {
          -[BilateralGrid solverBistochastize:](self, "solverBistochastize:", 10);
          -[BilateralGrid solverPcg:](self, "solverPcg:", 20);
          v32 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            confidence_solved_tex = self->_confidence_solved_tex;
            goto LABEL_38;
          }
        }
        else
        {
          -[BilateralGrid blurAndNormalize:grid_tmp_tex:](self, "blurAndNormalize:grid_tmp_tex:", self->_grid_tex, self->_tmp_grid_tex);
          v32 = self->_grid_tex;
          if (v30)
          {
            confidence_solved_tex = 0;
LABEL_38:
            v34 = -[BilateralGrid upsample:grid_tex:conf_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:](self, "upsample:grid_tex:conf_tex:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:", v17, v32, confidence_solved_tex, 0, 0, 0, 0.0, v30);
            if (v34)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
            }
            goto LABEL_41;
          }
        }
        v34 = 0;
LABEL_41:

LABEL_42:
LABEL_43:

LABEL_44:
LABEL_45:

        goto LABEL_46;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v34 = FigSignalErrorAt();
LABEL_46:
  if (*v11)
  {
    -[FigMetalContext commandQueue](self->_metal, "commandQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "commandBuffer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setLabel:", CFSTR("KTRACE_END_MTL"));
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __55__BilateralGrid_solverfilter_target_confidence_output___block_invoke;
    v38[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v38[4], 0, 24);
    objc_msgSend(v36, "addCompletedHandler:", v38);
    objc_msgSend(v36, "commit");

  }
  return v34;
}

void __55__BilateralGrid_solverfilter_target_confidence_output___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

@end
