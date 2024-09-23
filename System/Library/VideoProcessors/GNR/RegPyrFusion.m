@implementation RegPyrFusion

+ (void)calculatePyramidDimensions:(float)a3 pyrWidths:(int *)a4 pyrHeights:(int *)a5 topLevelIndex:(int)a6 maxDim:(int)a7 minDim:(int)a8
{
  int32x2_t v12;
  float32x2_t v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t v18;
  uint64_t v24;
  int32x4_t *v25;
  int32x4_t *v26;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float v34;
  uint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  int32x2_t v38;
  float v39;
  float32x2_t v40;
  int32x4_t v42;
  float v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;

  v12.i32[0] = log2f((float)a7);
  v38 = v12;
  if (a6 < 2)
  {
    v13.i32[0] = 0;
    v15 = a3;
    if (a6 != 1)
      return;
  }
  else
  {
    v14 = log2f((float)a8);
    v12 = v38;
    v13.f32[0] = (float)(*(float *)v38.i32 - v14) / (float)(a6 - 1);
    v15 = a3;
  }
  v16 = 0;
  v39 = sqrtf(1.0 / v15) * 0.16667;
  v40 = v13;
  v17 = a6;
  if (a6 < 4)
    goto LABEL_12;
  if ((unint64_t)((char *)a5 - (char *)a4) < 0x10)
    goto LABEL_12;
  v16 = a6 & 0x7FFFFFFC;
  v37 = (float32x4_t)vdupq_lane_s32(v12, 0);
  v18 = (int32x4_t)xmmword_216F95ED0;
  __asm { FMOV            V1.4S, #6.0 }
  v36 = _Q1;
  v24 = a6 & 0xFFFFFFFC;
  v25 = (int32x4_t *)a5;
  v26 = (int32x4_t *)a4;
  do
  {
    v42 = v18;
    v46 = vmlsq_lane_f32(v37, vcvtq_f32_s32(v18), v13, 0);
    v43 = exp2f(v46.f32[1]);
    v27.f32[0] = exp2f(v46.f32[0]);
    v27.f32[1] = v43;
    v44 = v27;
    v28 = exp2f(v46.f32[2]);
    v29 = v44;
    v29.f32[2] = v28;
    v45 = v29;
    v30 = exp2f(v46.f32[3]);
    v31 = v45;
    v31.f32[3] = v30;
    v13 = v40;
    v32 = vmulq_f32(vrndpq_f32(vmulq_n_f32(v31, v39)), v36);
    *v26++ = vcvtq_s32_f32(vmulq_n_f32(vrndq_f32(v32), a3));
    *v25++ = vcvtq_s32_f32(v32);
    v31.i64[0] = 0x400000004;
    v31.i64[1] = 0x400000004;
    v18 = vaddq_s32(v42, (int32x4_t)v31);
    v24 -= 4;
  }
  while (v24);
  v12.i32[0] = v38.i32[0];
  if (v16 != v17)
  {
LABEL_12:
    do
    {
      v33 = exp2f(*(float *)v12.i32 - (float)(v13.f32[0] * (float)(int)v16));
      v13.i32[0] = v40.i32[0];
      v12.i32[0] = v38.i32[0];
      v34 = ceilf(v39 * v33) * 6.0;
      v35 = v16;
      a4[v35] = (int)(float)(truncf(v34) * a3);
      a5[v35] = (int)v34;
      ++v16;
    }
    while (v17 != v16);
  }
}

- (RegPyrFusion)initWithMetalContext:(id)a3
{
  id v5;
  RegPyrFusion *v6;
  RegPyrFusion *v7;
  id *p_metal;
  MTLBuffer **pyrHomographyTeleIsRef;
  MTLBuffer **pyrHomographyWideIsRef;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  MTLBuffer *v15;
  void *v16;
  uint64_t v17;
  MTLBuffer *v18;
  void *v19;
  uint64_t v20;
  RegPyrFusionShaders *shaders;
  RegPyrFusion *v22;
  RegPyrFusion *v23;
  int v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RegPyrFusion;
  v6 = -[RegPyrFusion init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    p_metal = (id *)&v6->_metal;
    objc_storeStrong((id *)&v6->_metal, a3);
    if (v7->_metal)
    {
      pyrHomographyTeleIsRef = v7->_pyrHomographyTeleIsRef;
      pyrHomographyWideIsRef = v7->_pyrHomographyWideIsRef;
      LODWORD(v11) = 21;
      while (1)
      {
        v11 = (v11 - 1);
        objc_msgSend(*p_metal, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "newBufferWithLength:options:", 48, 0);
        v14 = v11;
        v15 = pyrHomographyTeleIsRef[v14];
        pyrHomographyTeleIsRef[v14] = (MTLBuffer *)v13;

        if (!pyrHomographyTeleIsRef[v14])
          break;
        objc_msgSend(*p_metal, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "newBufferWithLength:options:", 48, 0);
        v18 = pyrHomographyWideIsRef[v11];
        pyrHomographyWideIsRef[v11] = (MTLBuffer *)v17;

        if (!pyrHomographyWideIsRef[v11])
          break;
        if (v11 < 2)
        {
          +[RegPyrFusionShared sharedInstance](RegPyrFusionShared, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getShaders:", v7->_metal);
          v20 = objc_claimAutoreleasedReturnValue();
          shaders = v7->_shaders;
          v7->_shaders = (RegPyrFusionShaders *)v20;

          if (!v7->_shaders)
            break;
          +[RegPyrFusion prewarmRenderers:](RegPyrFusion, "prewarmRenderers:", *p_metal);
          goto LABEL_9;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v25 = FigSignalErrorAt();
  v22 = 0;
  if (!v25)
LABEL_9:
    v22 = v7;
  v23 = v22;

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyrScaleParams[19], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[18], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[17], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[16], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[15], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[14], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[13], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[12], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[11], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[10], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[9], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[8], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[7], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[6], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[5], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[4], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[3], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[2], 0);
  objc_storeStrong((id *)&self->_pyrScaleParams[1], 0);
  objc_storeStrong((id *)self->_pyrScaleParams, 0);
  objc_storeStrong((id *)&self->_pyrRoiScaleLevel0[1], 0);
  objc_storeStrong((id *)self->_pyrRoiScaleLevel0, 0);
  objc_storeStrong((id *)&self->_pyrScaleParamLevel0[1], 0);
  objc_storeStrong((id *)self->_pyrScaleParamLevel0, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[19], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[18], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[17], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[16], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[15], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[14], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[13], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[12], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[11], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[10], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[9], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[8], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[7], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[6], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[5], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[4], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[3], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[2], 0);
  objc_storeStrong((id *)&self->_pyrHomographyWideIsRef[1], 0);
  objc_storeStrong((id *)self->_pyrHomographyWideIsRef, 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[19], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[18], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[17], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[16], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[15], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[14], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[13], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[12], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[11], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[10], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[9], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[8], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[7], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[6], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[5], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[4], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[3], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[2], 0);
  objc_storeStrong((id *)&self->_pyrHomographyTeleIsRef[1], 0);
  objc_storeStrong((id *)self->_pyrHomographyTeleIsRef, 0);
  objc_storeStrong((id *)&self->_nonRefPyramid, 0);
  objc_storeStrong((id *)&self->_refPyramid, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

+ (int)prewarmShaders:(id)a3
{
  id v3;
  RegPyrFusionShaders *v4;
  int v5;

  v3 = a3;
  v4 = -[RegPyrFusionShaders initWithMetal:]([RegPyrFusionShaders alloc], "initWithMetal:", v3);

  if (v4)
    v5 = 0;
  else
    v5 = -12786;
  +[RegPyrFusion prewarmRenderers:](RegPyrFusion, "prewarmRenderers:", v3);

  return v5;
}

+ (void)prewarmRenderers:(id)a3
{
  objc_msgSend(a3, "prewarmInternalMetalShadersForFormatsList:", &unk_24D6705C8);
}

- (void)scaleHomographyUsingCalib:(id *)a3 to:(id *)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float32x4_t v11;
  unint64_t v12;
  __int128 v13;
  $7F30CB8CE7B8FAE8005751F529DD8A65 var1;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  $7F30CB8CE7B8FAE8005751F529DD8A65 v27;
  float32x4_t v28;
  uint64_t v29;
  PyramidStorage *refPyramid;
  float32x4_t v31;
  float v32;
  float v33;
  uint64_t v34;
  float32x4_t v35;
  uint64_t v36;
  float v37;
  unint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  __int128 v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;

  v7 = truncf((float)(a3[1].var2.var1.var0 + 1.0) - a3[1].var2.var0.var0);
  v8 = truncf((float)(a3[1].var2.var1.var1 + 1.0) - a3[1].var2.var0.var1);
  v9 = truncf((float)(a3[2].var1.var1.var0 + 1.0) - a3[2].var1.var0.var0);
  v10 = truncf((float)(a3[2].var1.var1.var1 + 1.0) - a3[2].var1.var0.var1);
  v11.f32[0] = (float)(unint64_t)-[MTLTexture width](self->_refPyramid->textureY[1], "width");
  v58 = v11;
  v12 = -[MTLTexture height](self->_refPyramid->textureY[1], "height");
  *(float *)&v13 = (float)v12;
  var1 = a3[1].var1;
  v15.i64[0] = 0x3F0000003F000000;
  v15.i64[1] = 0x3F0000003F000000;
  v16 = vmlaq_f32((float32x4_t)a3->var1, v15, (float32x4_t)var1);
  v17 = vmlaq_f32((float32x4_t)a3->var2, v15, (float32x4_t)var1);
  v18 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_216F95EE0, var1.var0.var0), (float32x4_t)xmmword_216F95EF0, (float32x2_t)var1.var0, 1), (float32x4_t)xmmword_216F95F00, (float32x4_t)var1, 2);
  if (fabsf(v18.f32[2]) <= 0.00000001)
  {
    v16.i32[3] = 0;
    v17.i32[3] = 0;
    var1.var1.var1 = 0.0;
  }
  else
  {
    v16 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_216F95EE0, v16.f32[0]), (float32x4_t)xmmword_216F95EF0, *(float32x2_t *)v16.f32, 1), (float32x4_t)xmmword_216F95F00, v16, 2), 1.0 / v18.f32[2]);
    v17 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_216F95EE0, v17.f32[0]), (float32x4_t)xmmword_216F95EF0, *(float32x2_t *)v17.f32, 1), (float32x4_t)xmmword_216F95F00, v17, 2), 1.0 / v18.f32[2]);
    var1 = ($7F30CB8CE7B8FAE8005751F529DD8A65)vmulq_n_f32(v18, 1.0 / v18.f32[2]);
  }
  v19.i32[1] = 0;
  v19.i64[1] = 0;
  v19.f32[0] = v7 / v58.f32[0];
  v20.i32[0] = 0;
  v20.i64[1] = 0;
  v20.f32[1] = v8 / (float)v12;
  v21 = vmulq_n_f32(v16, v58.f32[0] / v9);
  v22 = vmulq_n_f32(v17, *(float *)&v13 / v10);
  v23 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(v7 / v58.f32[0]), var1.var0.var0), (float32x4_t)v20.u64[0], (float32x2_t)var1.var0, 1), (float32x4_t)xmmword_216F95F00, (float32x4_t)var1, 2);
  if (fabsf(v23.f32[2]) <= 0.00000001)
  {
    v21.i32[3] = 0;
    v22.i32[3] = 0;
    var1.var1.var1 = 0.0;
  }
  else
  {
    v21 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, v21.f32[0]), v20, *(float32x2_t *)v21.f32, 1), (float32x4_t)xmmword_216F95F00, v21, 2), 1.0 / v23.f32[2]);
    v22 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, v22.f32[0]), v20, *(float32x2_t *)v22.f32, 1), (float32x4_t)xmmword_216F95F00, v22, 2), 1.0 / v23.f32[2]);
    var1 = ($7F30CB8CE7B8FAE8005751F529DD8A65)vmulq_n_f32(v23, 1.0 / v23.f32[2]);
  }
  v52 = (float32x4_t)var1;
  v24 = v58;
  v24.i32[1] = 0;
  v24.i32[2] = 0.5;
  v19.i32[0] = 0;
  v19.f32[1] = (float)v12;
  v19.i32[2] = 0.5;
  v51 = vmulq_n_f32(v21, 1.0 / v58.f32[0]);
  v25 = vmlaq_n_f32(v51, (float32x4_t)var1, -0.5 / v58.f32[0]);
  v50 = vmulq_n_f32(v22, 1.0 / *(float *)&v13);
  v26 = vmlaq_n_f32(v50, (float32x4_t)var1, -0.5 / *(float *)&v13);
  v27 = var1;
  v27.var1.var1 = 0.0;
  v28 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, var1.var0.var0), v19, (float32x2_t)var1.var0, 1), (float32x4_t)xmmword_216F95F00, (float32x4_t)var1, 2);
  v44 = v13;
  v45 = (float32x4_t)v27;
  if (fabsf(v28.f32[2]) <= 0.00000001)
  {
    v25.i32[3] = 0;
    v56 = v25;
    v26.i32[3] = 0;
    v54 = v26;
    v48 = (float32x4_t)v27;
  }
  else
  {
    v56 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, v25.f32[0]), v19, *(float32x2_t *)v25.f32, 1), (float32x4_t)xmmword_216F95F00, v25, 2), 1.0 / v28.f32[2]);
    v54 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, v26.f32[0]), v19, *(float32x2_t *)v26.f32, 1), (float32x4_t)xmmword_216F95F00, v26, 2), 1.0 / v28.f32[2]);
    v48 = vmulq_n_f32(v28, 1.0 / v28.f32[2]);
  }
  v29 = objc_msgSend(objc_retainAutorelease(a4[1]), "contents");
  *(_QWORD *)v29 = v56.i64[0];
  *(_DWORD *)(v29 + 8) = v56.i32[2];
  *(_DWORD *)(v29 + 24) = v54.i32[2];
  *(_QWORD *)(v29 + 16) = v54.i64[0];
  *(_QWORD *)(v29 + 32) = v48.i64[0];
  *(_DWORD *)(v29 + 40) = v48.i32[2];
  refPyramid = self->_refPyramid;
  if (refPyramid->levels >= 3)
  {
    v49 = (float32x4_t)v58.u32[0];
    v31 = 0u;
    v31.i32[1] = v44;
    v53 = v31;
    v46 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2);
    v47 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v52.f32, 1);
    v32 = v58.f32[0] * 0.5;
    v33 = *(float *)&v44 * 0.5;
    v34 = 2;
    do
    {
      v37 = (float)(unint64_t)-[MTLTexture width](refPyramid->textureY[v34], "width", v44);
      v38 = -[MTLTexture height](self->_refPyramid->textureY[v34], "height");
      v39 = v49;
      v39.f32[2] = v32 / v37;
      v40 = v53;
      v40.f32[2] = v33 / (float)v38;
      v41 = vmlaq_n_f32(v51, v52, -0.5 / v37);
      v42 = vmlaq_n_f32(v50, v52, -0.5 / (float)v38);
      v43 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v39, v52.f32[0]), v47, v40), (float32x4_t)xmmword_216F95F00, v46);
      if (fabsf(v43.f32[2]) > 0.00000001)
      {
        v57 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, v42.f32[0]), v40, *(float32x2_t *)v42.f32, 1), (float32x4_t)xmmword_216F95F00, v42, 2), 1.0 / v43.f32[2]);
        v59 = vmulq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, v41.f32[0]), v40, *(float32x2_t *)v41.f32, 1), (float32x4_t)xmmword_216F95F00, v41, 2), 1.0 / v43.f32[2]);
        v35 = vmulq_n_f32(v43, 1.0 / v43.f32[2]);
      }
      else
      {
        v41.i32[3] = 0;
        v42.i32[3] = 0;
        v57 = v42;
        v59 = v41;
        v35 = v45;
      }
      v55 = v35;
      v36 = objc_msgSend(objc_retainAutorelease(a4[v34]), "contents");
      *(_QWORD *)v36 = v59.i64[0];
      *(_DWORD *)(v36 + 8) = v59.i32[2];
      *(_QWORD *)(v36 + 16) = v57.i64[0];
      *(_DWORD *)(v36 + 24) = v57.i32[2];
      *(_QWORD *)(v36 + 32) = v55.i64[0];
      *(_DWORD *)(v36 + 40) = v55.i32[2];
      ++v34;
      refPyramid = self->_refPyramid;
    }
    while (v34 < refPyramid->levels);
  }
}

- (int)setupPyramidScalersUsingCalib
{
  void *v3;
  MTLBuffer *v4;
  MTLBuffer *v5;
  void *v6;
  MTLBuffer *v7;
  MTLBuffer *v8;
  void *v9;
  MTLBuffer *v10;
  MTLBuffer *v11;
  void *v12;
  MTLBuffer *v13;
  MTLBuffer *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _DWORD *v19;
  float v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int var0;
  uint64_t v24;
  unsigned int v25;
  _DWORD *v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;

  -[FigMetalContext device](self->_metal, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (MTLBuffer *)objc_msgSend(v3, "newBufferWithLength:options:", 16, 0);
  v5 = self->_pyrScaleParamLevel0[1];
  self->_pyrScaleParamLevel0[1] = v4;

  if (!self->_pyrScaleParamLevel0[1])
    goto LABEL_11;
  -[FigMetalContext device](self->_metal, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", 16, 0);
  v8 = self->_pyrScaleParamLevel0[0];
  self->_pyrScaleParamLevel0[0] = v7;

  if (!self->_pyrScaleParamLevel0[0])
    goto LABEL_11;
  -[FigMetalContext device](self->_metal, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MTLBuffer *)objc_msgSend(v9, "newBufferWithLength:options:", 16, 0);
  v11 = self->_pyrRoiScaleLevel0[1];
  self->_pyrRoiScaleLevel0[1] = v10;

  if (!self->_pyrRoiScaleLevel0[1])
    goto LABEL_11;
  -[FigMetalContext device](self->_metal, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTLBuffer *)objc_msgSend(v12, "newBufferWithLength:options:", 16, 0);
  v14 = self->_pyrRoiScaleLevel0[0];
  self->_pyrRoiScaleLevel0[0] = v13;

  if (!self->_pyrRoiScaleLevel0[0])
    goto LABEL_11;
  v15 = -[MTLTexture width](self->_refPyramid->textureY[1], "width");
  v16 = -[MTLTexture height](self->_refPyramid->textureY[1], "height");
  v17 = -[MTLTexture width](self->_nonRefPyramid->textureY[1], "width");
  v18 = -[MTLTexture height](self->_nonRefPyramid->textureY[1], "height");
  v19 = (_DWORD *)-[MTLBuffer contents](objc_retainAutorelease(self->_pyrScaleParamLevel0[1]), "contents");
  if (!v19)
    goto LABEL_11;
  v20 = (float)v15;
  *(float *)&v21 = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var0 + 1.0)
                         - self->_wideIsRefCalibData[1].var2.var0.var0)
                 / (float)v15;
  *v19 = v21;
  *((float *)&v21 + 1) = (float)((float)(self->_wideIsRefCalibData[1].var2.var1.var1 + 1.0)
                               - self->_wideIsRefCalibData[1].var2.var0.var1)
                       / (float)v16;
  *(_QWORD *)v19 = v21;
  *(float *)&v21 = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var0 + 1.0)
                         - self->_wideIsRefCalibData[2].var1.var0.var0)
                 / (float)v17;
  v19[2] = v21;
  *((float *)&v21 + 1) = (float)((float)(self->_wideIsRefCalibData[2].var1.var1.var1 + 1.0)
                               - self->_wideIsRefCalibData[2].var1.var0.var1)
                       / (float)v18;
  *((_QWORD *)v19 + 1) = v21;
  v22 = (unsigned int *)-[MTLBuffer contents](objc_retainAutorelease(self->_pyrRoiScaleLevel0[1]), "contents");
  if (!v22)
    goto LABEL_11;
  var0 = self->_wideIsRefCalibData[1].var2.var0.var0;
  *v22 = var0;
  LODWORD(v24) = var0;
  HIDWORD(v24) = self->_wideIsRefCalibData[1].var2.var0.var1;
  *(_QWORD *)v22 = v24;
  v25 = self->_wideIsRefCalibData[1].var2.var1.var0;
  v22[2] = v25;
  LODWORD(v24) = v25;
  HIDWORD(v24) = self->_wideIsRefCalibData[1].var2.var1.var1;
  *((_QWORD *)v22 + 1) = v24;
  v26 = (_DWORD *)-[MTLBuffer contents](objc_retainAutorelease(self->_pyrScaleParamLevel0[0]), "contents");
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  *(float *)&v27 = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var0 + 1.0)
                         - self->_teleIsRefCalibData[1].var2.var0.var0)
                 / v20;
  v26[2] = v27;
  *((float *)&v27 + 1) = (float)((float)(self->_teleIsRefCalibData[1].var2.var1.var1 + 1.0)
                               - self->_teleIsRefCalibData[1].var2.var0.var1)
                       / (float)v16;
  *((_QWORD *)v26 + 1) = v27;
  *(float *)&v27 = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var0 + 1.0)
                         - self->_teleIsRefCalibData[2].var1.var0.var0)
                 / (float)v17;
  *v26 = v27;
  *((float *)&v27 + 1) = (float)((float)(self->_teleIsRefCalibData[2].var1.var1.var1 + 1.0)
                               - self->_teleIsRefCalibData[2].var1.var0.var1)
                       / (float)v18;
  *(_QWORD *)v26 = v27;
  v28 = (unsigned int *)-[MTLBuffer contents](objc_retainAutorelease(self->_pyrRoiScaleLevel0[0]), "contents");
  if (v28)
  {
    v29 = self->_teleIsRefCalibData[2].var1.var0.var0;
    *v28 = v29;
    LODWORD(v30) = v29;
    HIDWORD(v30) = self->_teleIsRefCalibData[2].var1.var0.var1;
    *(_QWORD *)v28 = v30;
    v31 = self->_teleIsRefCalibData[2].var1.var1.var0;
    v28[2] = v31;
    LODWORD(v30) = v31;
    HIDWORD(v30) = self->_teleIsRefCalibData[2].var1.var1.var1;
    *((_QWORD *)v28 + 1) = v30;
    return 0;
  }
  else
  {
LABEL_11:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)create2DTextureFromBuffer:(id)a3 offset:(unint64_t)a4 descriptor:(id)a5
{
  FigMetalContext *metal;
  id v8;
  id v9;
  void *v10;

  metal = self->_metal;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(v9, "newTextureWithDescriptor:offset:bytesPerRow:", v8, a4, (objc_msgSend(v8, "width")* -[FigMetalContext getPixelSizeInBytes:](metal, "getPixelSizeInBytes:", objc_msgSend(v8, "pixelFormat"))+ 63) & 0xFFFFFFC0);

  return v10;
}

- (id)textureFromIOSurfaceOrBuffer:(id)a3 texDesc:(id)a4 offset:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "buffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "buffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RegPyrFusion create2DTextureFromBuffer:offset:descriptor:](self, "create2DTextureFromBuffer:offset:descriptor:", v11, a5, v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_msgSend(v9, "iosurface");

    if (!v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v14 = 0;
      goto LABEL_6;
    }
    -[FigMetalContext device](self->_metal, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "newTextureWithDescriptor:iosurface:plane:", v8, v13, 0);
  }
  v14 = (void *)v12;

LABEL_6:
  return v14;
}

- (int)setResourcesWithRefPyramid:(id)a3 nonRefPyramid:(id)a4 resources:(id)a5
{
  _DWORD *v9;
  _DWORD *v10;
  id v11;
  PyramidStorage **p_refPyramid;
  id v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  Class *v24;
  Class v25;
  uint64_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  RegPyrFusionResources *resources;
  MTLTexture *prevShiftMapAsU32;
  uint64_t v32;
  RegPyrFusionResources *v33;
  MTLTexture *nextShiftMapAsR16;
  uint64_t v35;
  RegPyrFusionResources *v36;
  MTLTexture *nextShiftMapAsRG16;
  RegPyrFusionResources *v38;
  void *v39;
  uint64_t v40;
  RegPyrFusionResources *v41;
  MTLTexture *confidenceMapAsRG16;
  MTLBuffer *v43;
  unint64_t v44;
  unsigned int v45;
  MTLBuffer **v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  MTLBuffer *v50;
  float v51;
  float v52;
  unint64_t v53;
  uint64_t v54;
  int v55;
  void *v57;
  __IOSurface *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  RegPyrFusionResources *v62;
  MTLTexture *v63;
  uint64_t v64;
  RegPyrFusionResources *v65;
  id v66;
  _DWORD *v67;
  RegPyrFusionResources **p_resources;
  float v69;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  p_refPyramid = &self->_refPyramid;
  objc_storeStrong((id *)&self->_refPyramid, a3);
  objc_storeStrong((id *)&self->_nonRefPyramid, a4);
  objc_storeStrong((id *)&self->_resources, a5);
  v13 = objc_alloc_init(MEMORY[0x24BDDD740]);
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_29;
  }
  v66 = v11;
  v14 = v9[2];
  if (v14 != v10[2])
    goto LABEL_33;
  v67 = v10;
  p_resources = &self->_resources;
  if (v14 >= 2)
  {
    LODWORD(v15) = v9[2];
    do
    {
      v15 = (v15 - 1);
      v16 = 8 * v15;
      v17 = objc_msgSend(*(id *)&v9[v16 / 4 + 84], "width");
      v18 = objc_msgSend(*(id *)&v9[v16 / 4 + 84], "height");
      objc_msgSend(v13, "setPixelFormat:", 53);
      objc_msgSend(v13, "setWidth:", v17);
      objc_msgSend(v13, "setHeight:", v18);
      objc_msgSend(v13, "setUsage:", 5);
      -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->refDerivTex[v16 / 8], v13, self->_resources->offsets.refDerivTex);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (char *)self->_resources + v16;
      v21 = (void *)*((_QWORD *)v20 + 66);
      *((_QWORD *)v20 + 66) = v19;

      if (!self->_resources->refDerivAsU32[v16 / 8])
        goto LABEL_28;
      objc_msgSend(v13, "setPixelFormat:", 115);
      objc_msgSend(v13, "setWidth:", v17 >> 1);
      objc_msgSend(v13, "setHeight:", v18);
      v22 = v15;
      -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->prevShiftMap[v15], v13, self->_resources->offsets.prevShiftMap);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = &self->_resources->super.isa + v15;
      v25 = v24[166];
      v24[166] = (Class)v23;

      if (!self->_resources->prevShiftMapAsRGBA[v15])
        goto LABEL_28;
      objc_msgSend(v13, "setPixelFormat:", 53);
      objc_msgSend(v13, "setWidth:", v17);
      objc_msgSend(v13, "setHeight:", v18);
      -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->interim[v22], v13, self->_resources->offsets.interimNextShiftMap);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (char *)self->_resources + v22 * 8;
      v28 = (void *)*((_QWORD *)v27 + 106);
      *((_QWORD *)v27 + 106) = v26;

      if (!self->_resources->interimAsU32[v22])
        goto LABEL_28;
    }
    while ((int)v15 >= 2);
  }
  objc_msgSend(v13, "setPixelFormat:", 53);
  objc_msgSend(v13, "setWidth:", -[MTLTexture width](self->_resources->prevShiftMap[1], "width"));
  objc_msgSend(v13, "setHeight:", -[MTLTexture height](self->_resources->prevShiftMap[1], "height"));
  -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->prevShiftMap[1], v13, self->_resources->offsets.prevShiftMap);
  v29 = objc_claimAutoreleasedReturnValue();
  resources = self->_resources;
  prevShiftMapAsU32 = resources->prevShiftMapAsU32;
  resources->prevShiftMapAsU32 = (MTLTexture *)v29;

  if (!self->_resources->prevShiftMapAsU32)
  {
LABEL_28:
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = v66;
    v10 = v67;
LABEL_29:
    v55 = FigSignalErrorAt();
    goto LABEL_21;
  }
  objc_msgSend(v13, "setPixelFormat:", 25);
  objc_msgSend(v13, "setWidth:", -[MTLTexture width](self->_resources->nextShiftMap[1], "width"));
  objc_msgSend(v13, "setHeight:", -[MTLTexture height](self->_resources->nextShiftMap[1], "height"));
  -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->nextShiftMap[1], v13, self->_resources->offsets.interimNextShiftMap);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = self->_resources;
  nextShiftMapAsR16 = v33->nextShiftMapAsR16;
  v33->nextShiftMapAsR16 = (MTLTexture *)v32;

  v10 = v67;
  if (!self->_resources->nextShiftMapAsR16)
    goto LABEL_33;
  objc_msgSend(v13, "setPixelFormat:", 65);
  objc_msgSend(v13, "setWidth:", (unint64_t)-[MTLTexture width](self->_resources->confidenceMap, "width") >> 1);
  objc_msgSend(v13, "setHeight:", -[MTLTexture height](self->_resources->confidenceMap, "height"));
  -[RegPyrFusion textureFromIOSurfaceOrBuffer:texDesc:offset:](self, "textureFromIOSurfaceOrBuffer:texDesc:offset:", self->_resources->nextShiftMapAsR16, v13, self->_resources->offsets.interimNextShiftMap);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = self->_resources;
  nextShiftMapAsRG16 = v36->nextShiftMapAsRG16;
  v36->nextShiftMapAsRG16 = (MTLTexture *)v35;

  v38 = self->_resources;
  if (!v38->nextShiftMapAsRG16)
    goto LABEL_33;
  if (-[MTLTexture iosurface](v38->confidenceMap, "iosurface"))
  {
    -[FigMetalContext device](self->_metal, "device");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "newTextureWithDescriptor:iosurface:plane:", v13, -[MTLTexture iosurface](self->_resources->confidenceMap, "iosurface"), 0);
    v41 = self->_resources;
    confidenceMapAsRG16 = v41->confidenceMapAsRG16;
    v41->confidenceMapAsRG16 = (MTLTexture *)v40;

    if ((*p_resources)->confidenceMapAsRG16)
      goto LABEL_14;
LABEL_33:
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = v66;
    goto LABEL_29;
  }
  -[MTLTexture buffer]((*p_resources)->confidenceMap, "buffer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (__IOSurface *)objc_msgSend(v57, "iosurface");
  if (v58 && IOSurfaceGetBytesPerRow(v58))
  {
    -[FigMetalContext device](self->_metal, "device");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLTexture buffer](self->_resources->confidenceMap, "buffer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "newTextureWithDescriptor:iosurface:plane:", v13, objc_msgSend(v60, "iosurface"), 0);
    v62 = self->_resources;
    v63 = v62->confidenceMapAsRG16;
    v62->confidenceMapAsRG16 = (MTLTexture *)v61;

  }
  else
  {
    -[MTLTexture buffer](self->_resources->confidenceMap, "buffer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[RegPyrFusion create2DTextureFromBuffer:offset:descriptor:](self, "create2DTextureFromBuffer:offset:descriptor:", v59, -[MTLTexture bufferOffset](self->_resources->confidenceMap, "bufferOffset"), v13);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = self->_resources;
    v60 = v65->confidenceMapAsRG16;
    v65->confidenceMapAsRG16 = (MTLTexture *)v64;
  }

  if (!(*p_resources)->confidenceMapAsRG16)
    goto LABEL_33;
LABEL_14:
  v43 = self->_pyrScaleParams[0];
  self->_pyrScaleParams[0] = 0;

  if (v14 >= 3)
  {
    v44 = 0;
    v45 = v14 - 1;
    v46 = &self->_pyrScaleParams[1];
    v47 = 8 * v45 - 8;
    while (1)
    {
      -[FigMetalContext device](self->_metal, "device");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "newBufferWithLength:options:", 8, 0);
      v50 = v46[v44 / 8];
      v46[v44 / 8] = (MTLBuffer *)v49;

      if (!v46[v44 / 8])
        goto LABEL_28;
      v51 = (float)(unint64_t)-[MTLTexture width]((*p_refPyramid)->textureY[v44 / 8 + 1], "width");
      v69 = v51 / (float)(unint64_t)-[MTLTexture width]((*p_refPyramid)->textureY[v44 / 8 + 2], "width");
      v52 = (float)(unint64_t)-[MTLTexture height]((*p_refPyramid)->textureY[v44 / 8 + 1], "height");
      v53 = -[MTLTexture height]((*p_refPyramid)->textureY[v44 / 8 + 2], "height");
      *(float *)&v54 = v69;
      *((float *)&v54 + 1) = v52 / (float)v53;
      *(_QWORD *)-[MTLBuffer contents](objc_retainAutorelease(v46[v44 / 8]), "contents") = v54;
      v44 += 8;
      if (v47 == v44)
      {
        v55 = 0;
        v10 = v67;
        goto LABEL_20;
      }
    }
  }
  v55 = 0;
LABEL_20:
  v11 = v66;
LABEL_21:

  return v55;
}

- (int)clearTextureWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 outputTex:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "colorAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTexture:", v7);

  objc_msgSend(v8, "colorAttachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLoadAction:", 2);

  objc_msgSend(v8, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStoreAction:", 1);

  objc_msgSend(v8, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClearColor:", 0.0, 0.0, 0.0, 1.0);

  objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "endEncoding");
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }

  return 0;
}

- (int)generateDerivativesWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 inputTex:(id)a5 sobelOutput:(id)a6 derivInput:(id)a7 outputTex:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a6;
  v19 = a4;
  objc_msgSend(v19, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:", v18);

  objc_msgSend(v14, "renderCommandEncoderWithDescriptor:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_5;
  -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setVertexBuffer:offset:atIndex:", v23, 0, 0);

  objc_msgSend(v22, "setFragmentTexture:atIndex:", v15, 0);
  objc_msgSend(v22, "setRenderPipelineState:", self->_shaders->_derivSobelPipelineState);
  objc_msgSend(v22, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v22, "endEncoding");
  v24 = objc_msgSend(v15, "width");
  v25 = objc_msgSend(v15, "height");
  objc_msgSend(v14, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = v26;
    objc_msgSend(v26, "setComputePipelineState:", self->_shaders->_derivPipelineState);
    objc_msgSend(v27, "setTexture:atIndex:", v15, 0);
    objc_msgSend(v27, "setTexture:atIndex:", v16, 1);
    objc_msgSend(v27, "setTexture:atIndex:", v17, 2);
    v32[0] = (unint64_t)(v24 + 31) >> 5;
    v32[1] = (unint64_t)(v25 + 3) >> 2;
    v32[2] = 1;
    v30 = xmmword_216F95F10;
    v31 = 1;
    objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", v32, &v30);
    objc_msgSend(v27, "endEncoding");

    v28 = 0;
  }
  else
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
  }

  return v28;
}

- (int)basicSearchWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a8;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v21, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTexture:", v20);

  objc_msgSend(v22, "renderCommandEncoderWithDescriptor:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setVertexBuffer:offset:atIndex:", v26, 0, 0);

    objc_msgSend(v25, "setFragmentTexture:atIndex:", v16, 0);
    objc_msgSend(v25, "setFragmentTexture:atIndex:", v17, 1);
    objc_msgSend(v25, "setFragmentTexture:atIndex:", v18, 2);
    objc_msgSend(v25, "setFragmentBuffer:offset:atIndex:", v19, 0, 0);
    objc_msgSend(v25, "setRenderPipelineState:", self->_shaders->_basicSearchLumaPipelineState);
    objc_msgSend(v25, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v25, "endEncoding");
    v27 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
  }

  return v27;
}

- (int)smoothShiftMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 input:(id)a5 output:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTexture:", v11);

  objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVertexBuffer:offset:atIndex:", v17, 0, 0);

    objc_msgSend(v16, "setFragmentTexture:atIndex:", v10, 0);
    objc_msgSend(v16, "setRenderPipelineState:", self->_shaders->_smoothPipelineState);
    objc_msgSend(v16, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v16, "endEncoding");
    v18 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)selectionWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refDerivTex:(id)a5 nonRefDerivTex:(id)a6 prevShiftMap:(id)a7 nextShiftMap:(id)a8 homography:(id)a9 pyrLevel:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  float v28;
  void *v29;
  int v30;
  float v32;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a8;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v21, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTexture:", v20);

  v25 = objc_msgSend(v16, "width");
  v26 = objc_msgSend(v16, "height");
  objc_msgSend(v22, "renderCommandEncoderWithDescriptor:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = sqrtf((float)(unint64_t)(v26 * v25)) * 0.0019531;
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setVertexBuffer:offset:atIndex:", v29, 0, 0);

    objc_msgSend(v27, "setFragmentTexture:atIndex:", v16, 0);
    objc_msgSend(v27, "setFragmentTexture:atIndex:", v17, 1);
    objc_msgSend(v27, "setFragmentTexture:atIndex:", v18, 2);
    objc_msgSend(v27, "setFragmentBuffer:offset:atIndex:", v19, 0, 0);
    v32 = v28;
    objc_msgSend(v27, "setFragmentBytes:length:atIndex:", &v32, 4, 1);
    objc_msgSend(v27, "setRenderPipelineState:", self->_shaders->_selectionLumaPipelineState);
    objc_msgSend(v27, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v27, "endEncoding");
    v30 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v30 = FigSignalErrorAt();
  }

  return v30;
}

- (RegPyrFusion)fusionWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTex:(id)a5 refDerivTex:(id)a6 nonRefDerivTex:(id)a7 prevShiftMap:(id)a8 shiftMapWeight:(id)a9 nextShiftMap:(id)a10 homography:(id)a11 pyrLevel:(int)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  RegPyrFusion *v40;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  float v48;
  float v49;

  v18 = a3;
  v19 = a4;
  v47 = a5;
  v20 = a6;
  v46 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42 = a11;
  objc_msgSend(v19, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v22;
  objc_msgSend(v25, "setTexture:", v22);

  v26 = objc_msgSend(v20, "width");
  v27 = objc_msgSend(v20, "height");
  objc_msgSend(v18, "renderCommandEncoderWithDescriptor:", v19);
  v28 = objc_claimAutoreleasedReturnValue();
  v44 = v23;
  v45 = v21;
  if (v28)
  {
    v29 = (void *)v28;
    v30 = sqrtf((float)(unint64_t)(v27 * v26)) * 0.0012695;
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", v31, 0, 0);

    objc_msgSend(v29, "setFragmentTexture:atIndex:", v47, 0);
    objc_msgSend(v29, "setFragmentTexture:atIndex:", v20, 1);
    objc_msgSend(v29, "setFragmentTexture:atIndex:", v46, 2);
    objc_msgSend(v29, "setFragmentTexture:atIndex:", v21, 3);
    v32 = v42;
    objc_msgSend(v29, "setFragmentBuffer:offset:atIndex:", v42, 0, 0);
    v49 = v30;
    objc_msgSend(v29, "setFragmentBytes:length:atIndex:", &v49, 4, 1);
    objc_msgSend(v29, "setRenderPipelineState:", self->_shaders->_fusionXLumaPipelineState);
    objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v29, "endEncoding");
    objc_msgSend(v19, "colorAttachments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTexture:", v23);

    objc_msgSend(v18, "renderCommandEncoderWithDescriptor:", v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setVertexBuffer:offset:atIndex:", v36, 0, 0);

      v37 = v47;
      objc_msgSend(v35, "setFragmentTexture:atIndex:", v47, 0);
      objc_msgSend(v35, "setFragmentTexture:atIndex:", v20, 1);
      v38 = v46;
      objc_msgSend(v35, "setFragmentTexture:atIndex:", v46, 2);
      v39 = v43;
      objc_msgSend(v35, "setFragmentTexture:atIndex:", v43, 3);
      objc_msgSend(v35, "setFragmentBuffer:offset:atIndex:", v42, 0, 0);
      v48 = v30;
      objc_msgSend(v35, "setFragmentBytes:length:atIndex:", &v48, 4, 1);
      objc_msgSend(v35, "setRenderPipelineState:", self->_shaders->_fusionYLumaPipelineState);
      objc_msgSend(v35, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
      objc_msgSend(v35, "endEncoding");

      v40 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v40 = (RegPyrFusion *)FigSignalErrorAt();
      v38 = v46;
      v37 = v47;
      v39 = v43;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v40 = (RegPyrFusion *)FigSignalErrorAt();
    v38 = v46;
    v37 = v47;
    v32 = v42;
    v39 = v43;
  }

  return v40;
}

- (int)confidenceMapWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 prevShiftMap:(id)a5 confidenceOut:(id)a6 confidenceErodeIn:(id)a7 confidenceErodeOut:(id)a8 confidenceDilateIn:(id)a9 confidenceDilateOut:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v40;
  id v41;

  v16 = a3;
  v17 = a4;
  v41 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a6;
  objc_msgSend(v17, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTexture:", v22);

  objc_msgSend(v16, "renderCommandEncoderWithDescriptor:", v17);
  v25 = objc_claimAutoreleasedReturnValue();
  v40 = v19;
  if (!v25)
    goto LABEL_6;
  v26 = (void *)v25;
  -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", v27, 0, 0);

  objc_msgSend(v26, "setFragmentTexture:atIndex:", v41, 0);
  objc_msgSend(v26, "setRenderPipelineState:", self->_shaders->_confidenceStageOne);
  objc_msgSend(v26, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v26, "endEncoding");
  objc_msgSend(v17, "colorAttachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTexture:", v19);

  objc_msgSend(v16, "renderCommandEncoderWithDescriptor:", v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
LABEL_6:
    v32 = v18;
    v35 = v16;
    fig_log_get_emitter();
LABEL_9:
    FigDebugAssert3();
    v38 = FigSignalErrorAt();
    goto LABEL_5;
  }
  -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVertexBuffer:offset:atIndex:", v31, 0, 0);

  v32 = v18;
  objc_msgSend(v30, "setFragmentTexture:atIndex:", v18, 0);
  objc_msgSend(v30, "setRenderPipelineState:", self->_shaders->_confidenceErode);
  objc_msgSend(v30, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v30, "endEncoding");
  objc_msgSend(v17, "colorAttachments");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTexture:", v21);

  v35 = v16;
  objc_msgSend(v16, "renderCommandEncoderWithDescriptor:", v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    fig_log_get_emitter();
    goto LABEL_9;
  }
  -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", v37, 0, 0);

  objc_msgSend(v36, "setFragmentTexture:atIndex:", v20, 0);
  objc_msgSend(v36, "setRenderPipelineState:", self->_shaders->_confidenceDilate);
  objc_msgSend(v36, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v36, "endEncoding");

  v38 = 0;
LABEL_5:

  return v38;
}

- (int)bilinearScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTexIn:(id)a5 refTexOut:(id)a6 nonRefTexIn:(id)a7 nonRefTexOut:(id)a8 pyrLevel:(int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v19, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", v18);

  objc_msgSend(v19, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTexture:", v17);

  objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setVertexBuffer:offset:atIndex:", v26, 0, 0);

    objc_msgSend(v25, "setFragmentTexture:atIndex:", v15, 0);
    objc_msgSend(v25, "setFragmentTexture:atIndex:", v16, 1);
    objc_msgSend(v25, "setFragmentBuffer:offset:atIndex:", self->_pyrScaleParams[a9], 0, 0);
    objc_msgSend(v25, "setRenderPipelineState:", self->_shaders->_bilinearScalePipelineState);
    objc_msgSend(v25, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v25, "endEncoding");
    v27 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
  }

  return v27;
}

- (int)initialDownScaleWithCommandBuffer:(id)a3 renderPassDesc:(id)a4 refTex:(id)a5 nonRefTex:(id)a6 refTexOut:(id)a7 nonRefTexOut:(id)a8 refCamType:(int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  Class *v33;
  int v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  objc_msgSend(v16, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (a9 == 1)
  {
    objc_msgSend(v22, "setTexture:", v19);

    objc_msgSend(v16, "colorAttachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v20;
  }
  else
  {
    objc_msgSend(v22, "setTexture:", v20);

    objc_msgSend(v16, "colorAttachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v19;
  }
  objc_msgSend(v25, "setTexture:", v27);

  v28 = v15;
  objc_msgSend(v15, "renderCommandEncoderWithDescriptor:", v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setVertexBuffer:offset:atIndex:", v30, 0, 0);

    if (a9 == 1)
      v31 = v17;
    else
      v31 = v18;
    if (a9 == 1)
      v32 = v18;
    else
      v32 = v17;
    objc_msgSend(v29, "setFragmentTexture:atIndex:", v31, 0);
    objc_msgSend(v29, "setFragmentTexture:atIndex:", v32, 1);
    v33 = &self->super.isa + a9;
    objc_msgSend(v29, "setFragmentBuffer:offset:atIndex:", v33[50], 0, 0);
    objc_msgSend(v29, "setFragmentBuffer:offset:atIndex:", v33[48], 0, 1);
    objc_msgSend(v29, "setRenderPipelineState:", self->_shaders->_initialDownScalePipelineState);
    objc_msgSend(v29, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v29, "endEncoding");
    v34 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)registerImagesWithReferenceCam:(int)a3 calibInfo:(id *)a4
{
  int levels;
  MTLBuffer **pyrHomographyTeleIsRef;
  uint64_t v8;
  void *v9;
  MTLBuffer **pyrHomographyWideIsRef;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MTLTexture *v17;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  MTLTexture *v30;
  void *v31;
  _QWORD *v32;
  void *v34;
  void *v35;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;

  levels = self->_refPyramid->levels;
  self->_teleIsRefCalibData = ($77E26384B26697B14E8366CBDAC4A8B1 *)&a4->var3;
  self->_wideIsRefCalibData = &a4->var0;
  pyrHomographyTeleIsRef = self->_pyrHomographyTeleIsRef;
  -[RegPyrFusion scaleHomographyUsingCalib:to:](self, "scaleHomographyUsingCalib:to:");
  -[RegPyrFusion scaleHomographyUsingCalib:to:](self, "scaleHomographyUsingCalib:to:", self->_wideIsRefCalibData, self->_pyrHomographyWideIsRef);
  if (-[RegPyrFusion setupPyramidScalersUsingCalib](self, "setupPyramidScalersUsingCalib"))
    return 0;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    if (a3 == 1)
      pyrHomographyWideIsRef = self->_pyrHomographyWideIsRef;
    else
      pyrHomographyWideIsRef = pyrHomographyTeleIsRef;
    -[FigMetalContext commandQueue](self->_metal, "commandQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commandBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_29;
    v13 = (levels - 1);
    LODWORD(v38) = a3;
    -[RegPyrFusion initialDownScaleWithCommandBuffer:renderPassDesc:refTex:nonRefTex:refTexOut:nonRefTexOut:refCamType:](self, "initialDownScaleWithCommandBuffer:renderPassDesc:refTex:nonRefTex:refTexOut:nonRefTexOut:refCamType:", v12, v9, self->_refPyramid->textureY[0], self->_nonRefPyramid->textureY[0], self->_refPyramid->textureY[1], self->_nonRefPyramid->textureY[1], v38);
    objc_msgSend(v12, "commit");
    v43 = levels;
    if (levels >= 3)
    {
      v14 = 0;
      while (1)
      {
        -[FigMetalContext commandQueue](self->_metal, "commandQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "commandBuffer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_29;
        v17 = self->_refPyramid->textureY[v14 + 1];
        v18 = self->_refPyramid->textureY[v14 + 2];
        v19 = self->_nonRefPyramid->textureY[v14 + 1];
        v20 = self->_nonRefPyramid->textureY[v14++ + 2];
        LODWORD(v39) = v14;
        -[RegPyrFusion bilinearScaleWithCommandBuffer:renderPassDesc:refTexIn:refTexOut:nonRefTexIn:nonRefTexOut:pyrLevel:](self, "bilinearScaleWithCommandBuffer:renderPassDesc:refTexIn:refTexOut:nonRefTexIn:nonRefTexOut:pyrLevel:", v16, v9, v17, v18, v19, v20, v39);
        objc_msgSend(v16, "commit");
        v12 = v16;
        if (v13 - 1 == v14)
          goto LABEL_13;
      }
    }
    v16 = v12;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[FigMetalContext commandQueue](self->_metal, "commandQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "commandBuffer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[RegPyrFusion clearTextureWithCommandBuffer:renderPassDesc:outputTex:](self, "clearTextureWithCommandBuffer:renderPassDesc:outputTex:", v23, v21, self->_resources->prevShiftMap[(int)v13]);
        objc_msgSend(v23, "commit");
        objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (v43 >= 2)
          {
            v44 = (int)v13;
            do
            {
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "commandBuffer");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v25)
                goto LABEL_29;
              v26 = v13;
              -[RegPyrFusion generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:sobelOutput:derivInput:outputTex:](self, "generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:sobelOutput:derivInput:outputTex:", v25, v9, self->_refPyramid->textureY[v13], self->_resources->interim[v13], self->_resources->interimAsU32[v13], self->_resources->refDerivTex[v13]);
              -[RegPyrFusion generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:sobelOutput:derivInput:outputTex:](self, "generateDerivativesWithCommandBuffer:renderPassDesc:inputTex:sobelOutput:derivInput:outputTex:", v25, v9, self->_nonRefPyramid->textureY[v13], self->_resources->interim[v26], self->_resources->interimAsU32[v26], self->_resources->nonRefDerivTex[v26]);
              objc_msgSend(v25, "commit");
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "commandBuffer");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v28)
                goto LABEL_29;
              if (v13 >= v44)
                v29 = v13;
              else
                v29 = v13 + 1;
              v30 = self->_resources->prevShiftMap[v29];
              LODWORD(v40) = v13;
              -[RegPyrFusion basicSearchWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:](self, "basicSearchWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:", v28, v9, self->_resources->refDerivAsU32[v13], self->_resources->nonRefDerivTex[v13], v30, self->_resources->nextShiftMap[v13], pyrHomographyWideIsRef[v13], v40);
              -[RegPyrFusion smoothShiftMapWithCommandBuffer:renderPassDesc:input:output:](self, "smoothShiftMapWithCommandBuffer:renderPassDesc:input:output:", v28, v9, self->_resources->nextShiftMap[v26], self->_resources->prevShiftMapAsRGBA[v26]);
              objc_msgSend(v28, "commit");
              -[FigMetalContext commandQueue](self->_metal, "commandQueue");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "commandBuffer");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v23)
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                v37 = FigSignalErrorAt();

                goto LABEL_31;
              }
              LODWORD(v41) = v13;
              -[RegPyrFusion selectionWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:](self, "selectionWithCommandBuffer:renderPassDesc:refDerivTex:nonRefDerivTex:prevShiftMap:nextShiftMap:homography:pyrLevel:", v23, v9, self->_resources->refDerivAsU32[v13], self->_resources->nonRefDerivTex[v13], self->_resources->prevShiftMap[v13], self->_resources->nextShiftMap[v13], pyrHomographyWideIsRef[v13], v41);
              v32 = (Class *)((char *)&self->_resources->super.isa + v26 * 8);
              LODWORD(v42) = v13;
              -[RegPyrFusion fusionWithCommandBuffer:renderPassDesc:refTex:refDerivTex:nonRefDerivTex:prevShiftMap:shiftMapWeight:nextShiftMap:homography:pyrLevel:](self, "fusionWithCommandBuffer:renderPassDesc:refTex:refDerivTex:nonRefDerivTex:prevShiftMap:shiftMapWeight:nextShiftMap:homography:pyrLevel:", v23, v9, self->_refPyramid->textureY[v13], v32[66], v32[126], v32[186], v32[206], v32[146], pyrHomographyWideIsRef[v13], v42);
              objc_msgSend(v23, "commit");

            }
            while (v13-- > 1);
          }
          -[FigMetalContext commandQueue](self->_metal, "commandQueue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "commandBuffer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            -[RegPyrFusion confidenceMapWithCommandBuffer:renderPassDesc:prevShiftMap:confidenceOut:confidenceErodeIn:confidenceErodeOut:confidenceDilateIn:confidenceDilateOut:](self, "confidenceMapWithCommandBuffer:renderPassDesc:prevShiftMap:confidenceOut:confidenceErodeIn:confidenceErodeOut:confidenceDilateIn:confidenceDilateOut:", v35, v9, self->_resources->prevShiftMapAsU32, self->_resources->nextShiftMapAsR16, self->_resources->confidenceMapAsRG16);
            objc_msgSend(v35, "commit");

            return 0;
          }
LABEL_29:
          fig_log_get_emitter();
          FigDebugAssert3();
          v37 = FigSignalErrorAt();
LABEL_31:

          return v37;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        v37 = FigSignalErrorAt();

      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v37 = FigSignalErrorAt();

      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v37 = FigSignalErrorAt();

    }
    return v37;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (MTLTexture)shiftMap
{
  return self->_resources->prevShiftMap[1];
}

- (MTLTexture)confidenceMap
{
  return self->_resources->confidenceMap;
}

@end
