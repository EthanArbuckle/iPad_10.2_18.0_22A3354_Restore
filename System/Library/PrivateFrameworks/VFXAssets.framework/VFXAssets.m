__n128 Main_comAppleRealitykitVfxGeneral_graph_CABE86CB_8495_4BA5_8564_211F4E42EAD3(float a1, uint64_t a2, uint64_t a3, int a4, __int128 *a5, float32x4_t *a6)
{
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  __float2 v11;
  float32x4_t v12;
  __int128 v13;
  __n128 result;
  float32x4_t v15;
  __int128 v16;

  v16 = *a5;
  v8 = vrsqrteq_f32((float32x4_t)xmmword_249C40FC0);
  v9 = vmulq_f32(v8, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v8, v8)));
  v15 = vmulq_f32(vmulq_f32(v9, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v9, v9))), (float32x4_t)xmmword_249C40FD0);
  v10 = 1.5708;
  if (!a4)
    v10 = 0.0;
  v11 = __sincosf_stret(v10);
  v12 = vmulq_n_f32(v15, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *a6 = v12;
  v13 = v16;
  *((float *)&v13 + 1) = a1;
  DWORD2(v13) = DWORD2(v16);
  *a5 = v13;
  result.n128_u64[0] = v13;
  result.n128_u32[2] = DWORD2(v13);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_CABE86CB_8495_4BA5_8564_211F4E42EAD3()
{
  uint64_t arguments_buffer;
  _DWORD *v1;
  __int128 *v2;
  float32x4_t *v3;
  float32x4_t v4;
  float32x4_t v5;
  float v6;
  __float2 v7;
  float32x4_t v8;
  __int128 v9;
  float result;
  float32x4_t v11;
  __int128 v12;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(_DWORD **)(arguments_buffer + 16);
  v2 = *(__int128 **)(arguments_buffer + 32);
  v3 = *(float32x4_t **)(arguments_buffer + 40);
  v12 = *v2;
  v4 = vrsqrteq_f32((float32x4_t)xmmword_249C40FC0);
  v5 = vmulq_f32(v4, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v4, v4)));
  v11 = vmulq_f32(vmulq_f32(v5, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v5, v5))), (float32x4_t)xmmword_249C40FD0);
  v6 = 1.5708;
  if (!**(_BYTE **)(arguments_buffer + 24))
    v6 = 0.0;
  v7 = __sincosf_stret(v6);
  v8 = vmulq_n_f32(v11, v7.__sinval);
  v8.i32[3] = LODWORD(v7.__cosval);
  LODWORD(v9) = v12;
  DWORD1(v9) = *v1;
  *v3 = v8;
  *((_QWORD *)&v9 + 1) = __PAIR64__(1.0, DWORD2(v12));
  result = 1.0;
  *v2 = v9;
  return result;
}

void Spawn_comAppleRealitykitVfxGeneral_graph_2EFCC965_6C2A_4409_B612_17DCDCF8132E(float a1, float a2, float a3, float a4, float a5, float a6, uint64_t a7, int a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, float *a13, float *a14, float *a15, float *a16, float *a17, _BYTE *a18, unint64_t *a19)
{
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  unsigned int v31;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v19 = a1 - a2;
  v20 = a1 + a2;
  v21 = fminf(v19, v20);
  v22 = fmaxf(v19, v20);
  v23 = a3 - a4;
  v24 = a3 + a4;
  v25 = fminf(v23, v24);
  v26 = fmaxf(v23, v24);
  v27 = a5 - a6;
  v28 = a5 + a6;
  v29 = fminf(v27, v28);
  v30 = fmaxf(v27, v28);
  v31 = 277803737
      * (((747796405 * a8 - 2038165537) >> (((747796405 * a8 - 2038165537) >> 28) + 4)) ^ (747796405 * a8 - 2038165537));
  v32 = COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0;
  v33 = v21 + (float)(v32 * (float)(v22 - v21));
  v34 = v25 + (float)(v32 * (float)(v26 - v25));
  v35 = a10 - a11;
  if (!a12)
    v35 = 0;
  *a13 = v21;
  a13[1] = v22;
  v36 = a11 + a10;
  *a14 = v25;
  a14[1] = v26;
  if (!a12)
    v36 = 0;
  *a15 = v29;
  a15[1] = v30;
  *a16 = v33;
  *a17 = v34;
  *a18 = a9 ^ 1;
  if (v35 >= v36)
    v37 = v36;
  else
    v37 = v35;
  if (v35 <= v36)
    v38 = v36;
  else
    v38 = v35;
  *a19 = v37;
  a19[1] = v38;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_2EFCC965_6C2A_4409_B612_17DCDCF8132E()
{
  uint64_t arguments_buffer;
  float *v1;
  _BYTE *v2;
  _QWORD *v3;
  _QWORD *v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  float *v9;
  unint64_t *v10;
  _BYTE *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t result;
  float v33;
  float v34;
  float v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 56);
  v2 = *(_BYTE **)(arguments_buffer + 64);
  v3 = *(_QWORD **)(arguments_buffer + 72);
  v4 = *(_QWORD **)(arguments_buffer + 80);
  v5 = *(float **)(arguments_buffer + 96);
  v7 = *(float **)(arguments_buffer + 104);
  v6 = *(float **)(arguments_buffer + 112);
  v8 = *(float **)(arguments_buffer + 120);
  v9 = *(float **)(arguments_buffer + 128);
  v11 = *(_BYTE **)(arguments_buffer + 136);
  v10 = *(unint64_t **)(arguments_buffer + 144);
  v12 = **(float **)(arguments_buffer + 16);
  v13 = **(float **)(arguments_buffer + 24);
  v14 = **(float **)(arguments_buffer + 32);
  v15 = **(float **)(arguments_buffer + 40);
  v16 = **(float **)(arguments_buffer + 48);
  v17 = **(_QWORD **)(arguments_buffer + 88);
  v18 = v12 - v13;
  v19 = v12 + v13;
  v20 = fminf(v18, v19);
  v21 = fmaxf(v18, v19);
  v22 = v14 - v15;
  v23 = v14 + v15;
  v24 = fminf(v22, v23);
  v25 = fmaxf(v22, v23);
  v26 = v16 - *v1;
  v27 = v16 + *v1;
  v28 = fminf(v26, v27);
  v29 = fmaxf(v26, v27);
  v30 = 747796405 * **(_DWORD **)(arguments_buffer + 8) - 2038165537;
  v31 = 277803737 * ((v30 >> ((v30 >> 28) + 4)) ^ v30);
  result = v31 >> 31;
  v33 = COERCE_FLOAT(result ^ (v31 >> 9) | 0x3F800000) + -1.0;
  v34 = v20 + (float)(v33 * (float)(v21 - v20));
  v35 = v24 + (float)(v33 * (float)(v25 - v24));
  v36 = *v2 ^ 1;
  v37 = *v3 - *v4;
  if (!v17)
    v37 = 0;
  v38 = *v4 + *v3;
  if (!v17)
    v38 = 0;
  *v5 = v20;
  v5[1] = v21;
  *v7 = v24;
  v7[1] = v25;
  *v6 = v28;
  v6[1] = v29;
  *v8 = v34;
  *v9 = v35;
  *v11 = v36;
  if (v37 >= v38)
    v39 = v38;
  else
    v39 = v37;
  if (v37 <= v38)
    v40 = v38;
  else
    v40 = v37;
  *v10 = v39;
  v10[1] = v40;
  return result;
}

float Init_comAppleRealitykitVfxGeneral_graph_C4E7830E_DFD6_42B0_8C1E_C42D73D86C9C(float a1, float a2, float a3, float a4, float a5, float a6, float a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, float *a13, float *a14, BOOL *a15, float *a16, float a17, float a18, uint64_t a19, __int128 a20,float a21,float *a22,_QWORD *a23,_QWORD *a24,__n128 *a25,float *a26,_OWORD *a27,_OWORD *a28,float *a29)
{
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float result;

  v29 = *a29;
  v30 = *a16;
  v31 = a1 - a2;
  v32 = a1 + a2;
  v33 = fminf(v31, v32);
  v34 = fmaxf(v31, v32);
  v35 = a3 - a4;
  v36 = a3 + a4;
  a8.n128_u64[0] = (unint64_t)vand_s8((int8x8_t)vcvt_u32_f32(vmaxnm_f32((float32x2_t)a8.n128_u64[0], 0)), vorr_s8((int8x8_t)vcltz_f32((float32x2_t)a8.n128_u64[0]), (int8x8_t)vcgez_f32((float32x2_t)a8.n128_u64[0])));
  a8.n128_u32[2] = fmaxf(a8.n128_f32[2], 0.0);
  *a13 = v33;
  a13[1] = v34;
  v37 = fmaxf(a6 - a7, 0.02);
  *a14 = fminf(v35, v36);
  a14[1] = fmaxf(v35, v36);
  *a15 = a11 == 0;
  *a22 = fminf(v37, a6 + a7);
  a22[1] = fmaxf(v37, a6 + a7);
  *a23 = a11 == 2;
  *a24 = a12;
  *a25 = a8;
  *a26 = fminf(a17 - a18, a17 + a18);
  a26[1] = fmaxf(a17 - a18, a17 + a18);
  *a27 = a20;
  *a28 = a20;
  *a29 = fminf(v29, a21);
  a29[1] = fmaxf(v29, a21);
  result = fminf(v30, a5);
  *a16 = result;
  a16[1] = fmaxf(v30, a5);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_C4E7830E_DFD6_42B0_8C1E_C42D73D86C9C()
{
  uint64_t arguments_buffer;
  float *v1;
  float *v2;
  float *v3;
  float *v4;
  float *v5;
  float *v6;
  uint64_t *v7;
  __int128 *v8;
  float *v9;
  float *v10;
  __int128 *v11;
  float *v12;
  float *v13;
  float *v14;
  float *v15;
  BOOL *v16;
  float *v17;
  _QWORD *v18;
  _OWORD *v19;
  _QWORD *v20;
  float *v21;
  _OWORD *v22;
  float *v23;
  _OWORD *v24;
  float v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float result;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 24);
  v2 = *(float **)(arguments_buffer + 32);
  v3 = *(float **)(arguments_buffer + 40);
  v4 = *(float **)(arguments_buffer + 56);
  v5 = *(float **)(arguments_buffer + 64);
  v6 = *(float **)(arguments_buffer + 72);
  v7 = *(uint64_t **)(arguments_buffer + 80);
  v8 = *(__int128 **)(arguments_buffer + 88);
  v9 = *(float **)(arguments_buffer + 96);
  v10 = *(float **)(arguments_buffer + 104);
  v11 = *(__int128 **)(arguments_buffer + 112);
  v12 = *(float **)(arguments_buffer + 120);
  v13 = *(float **)(arguments_buffer + 128);
  v14 = *(float **)(arguments_buffer + 136);
  v16 = *(BOOL **)(arguments_buffer + 144);
  v15 = *(float **)(arguments_buffer + 152);
  v17 = *(float **)(arguments_buffer + 160);
  v18 = *(_QWORD **)(arguments_buffer + 168);
  v20 = *(_QWORD **)(arguments_buffer + 176);
  v19 = *(_OWORD **)(arguments_buffer + 184);
  v21 = *(float **)(arguments_buffer + 192);
  v22 = *(_OWORD **)(arguments_buffer + 200);
  v24 = *(_OWORD **)(arguments_buffer + 208);
  v23 = *(float **)(arguments_buffer + 216);
  v25 = **(float **)(arguments_buffer + 16);
  v26 = **(_QWORD **)(arguments_buffer + 48);
  v27 = *v4;
  v28 = *v7;
  v29 = *v8;
  v30 = *v11;
  v31 = *v12;
  v32 = *v23;
  v33 = *v15;
  v34 = v25 - *v1;
  v35 = v25 + *v1;
  v36 = fminf(v34, v35);
  v37 = fmaxf(v34, v35);
  v38 = *v2 - *v3;
  v39 = *v2 + *v3;
  v40 = fminf(v38, v39);
  v41 = fmaxf(v38, v39);
  v42 = fmaxf(*v5 - *v6, 0.02);
  v43 = *v5 + *v6;
  v44 = fminf(v42, v43);
  v45 = fmaxf(v42, v43);
  *(int8x8_t *)&v29 = vand_s8((int8x8_t)vcvt_u32_f32(vmaxnm_f32(*(float32x2_t *)&v29, 0)), vorr_s8((int8x8_t)vcltz_f32(*(float32x2_t *)&v29), (int8x8_t)vcgez_f32(*(float32x2_t *)&v29)));
  DWORD2(v29) = fmaxf(COERCE_FLOAT(*((_QWORD *)v8 + 1)), 0.0);
  v46 = *v9 - *v10;
  v47 = *v9 + *v10;
  *v13 = v36;
  v13[1] = v37;
  *v14 = v40;
  v14[1] = v41;
  *v16 = v26 == 0;
  *v17 = v44;
  v17[1] = v45;
  *v18 = v26 == 2;
  *v20 = v28;
  *v19 = v29;
  *v21 = fminf(v46, v47);
  v21[1] = fmaxf(v46, v47);
  *v22 = v30;
  *v24 = v30;
  *v23 = fminf(v32, v31);
  v23[1] = fmaxf(v32, v31);
  v48 = fminf(v33, v27);
  result = fmaxf(v33, v27);
  *v15 = v48;
  v15[1] = result;
  return result;
}

__n128 Update_comAppleRealitykitVfxGeneral_graph_9D89648D_3FBB_4295_90CD_9E682BD76791(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, int a7, int32x4_t *a8, BOOL *a9, BOOL *a10, _QWORD *a11)
{
  double v20;
  BOOL v21;
  int32x4_t v22;
  __n128 result;
  __int32 v24;

  v24 = a8->i32[2];
  vfx_script_clock_time();
  *(float *)&v20 = v20;
  *(float *)&v20 = (float)(*(float *)&v20 * a1) * 0.1;
  v21 = a3 != 0.0;
  if (a4 != 0.0)
    v21 = 1;
  *a9 = a2 != 0.0;
  *a10 = v21;
  *a11 = a7 ^ 1u;
  v22 = vdupq_lane_s32(*(int32x2_t *)&v20, 0);
  v22.i32[2] = v24;
  *a8 = v22;
  result.n128_u64[0] = v22.i64[0];
  result.n128_u32[2] = v22.u32[2];
  return result;
}

__n128 __vfx_script_comAppleRealitykitVfxGeneral_graph_9D89648D_3FBB_4295_90CD_9E682BD76791()
{
  uint64_t arguments_buffer;
  __n128 *v1;
  BOOL *v2;
  BOOL *v3;
  _BOOL8 *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  _BOOL8 v9;
  double v10;
  BOOL v11;
  __n128 result;
  unsigned __int32 v13;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(__n128 **)(arguments_buffer + 56);
  v2 = *(BOOL **)(arguments_buffer + 64);
  v3 = *(BOOL **)(arguments_buffer + 72);
  v4 = *(_BOOL8 **)(arguments_buffer + 80);
  v5 = **(float **)(arguments_buffer + 16);
  v6 = **(float **)(arguments_buffer + 24);
  v7 = **(float **)(arguments_buffer + 32);
  v8 = **(float **)(arguments_buffer + 40);
  v9 = **(_BYTE **)(arguments_buffer + 48) == 0;
  v13 = v1->n128_u32[2];
  vfx_script_clock_time();
  *(float *)&v10 = v10;
  *(float *)&v10 = (float)(v5 * *(float *)&v10) * 0.1;
  v11 = v7 != 0.0;
  if (v8 != 0.0)
    v11 = 1;
  *v2 = v6 != 0.0;
  *v3 = v11;
  *v4 = v9;
  result.n128_u64[0] = vdupq_lane_s32(*(int32x2_t *)&v10, 0).u64[0];
  result.n128_u64[1] = __PAIR64__(1.0, v13);
  *v1 = result;
  return result;
}

void Render_comAppleRealitykitVfxGeneral_graph_39FD28C5_BDF9_4DD6_B2B8_459F45892DBF(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _OWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = qword_249C41068[a3];
  v11[0] = xmmword_249C40FE0;
  v11[1] = xmmword_249C40FF0;
  v11[2] = xmmword_249C41000;
  v12 = 0;
  v9 = *((_QWORD *)v11 + a4);
  v10 = 2;
  if (a5 < 2)
    v10 = a5;
  *a6 = v8;
  *a7 = v9;
  *a8 = v10;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_39FD28C5_BDF9_4DD6_B2B8_459F45892DBF()
{
  uint64_t result;
  _QWORD *v1;
  _QWORD *v2;
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = vfx_script_get_arguments_buffer();
  v1 = *(_QWORD **)(result + 40);
  v2 = *(_QWORD **)(result + 48);
  v3 = *(unint64_t **)(result + 56);
  v4 = **(_QWORD **)(result + 24);
  v5 = **(_QWORD **)(result + 32);
  v6 = qword_249C41068[**(_QWORD **)(result + 16)];
  v8[0] = xmmword_249C40FE0;
  v8[1] = xmmword_249C40FF0;
  v8[2] = xmmword_249C41000;
  v9 = 0;
  v7 = *((_QWORD *)v8 + v4);
  if (v5 >= 2)
    v5 = 2;
  *v1 = v6;
  *v2 = v7;
  *v3 = v5;
  return result;
}

uint64_t Spawn_comAppleRealitykitVfxGeneral_graph_3A6197AD_E251_4C3C_A4A4_97B88CE13708(const void *a1, int a2, float a3, float a4, BOOL a5, float a6, float *a7, BOOL *a8, BOOL *a9, float *a10)
{
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  unsigned int v22;
  uint64_t result;
  unsigned int v24;

  v17 = a3 - a4;
  v18 = a3 + a4;
  v19 = fminf(v17, v18);
  v20 = fmaxf(v17, v18);
  vfx_script_clock_time();
  *(float *)&v21 = v21;
  v22 = fmaxf(*(float *)&v21, 0.0);
  result = vfx_script_clock_simulation_index();
  v24 = 277803737
      * (((747796405 * ((_DWORD)result + a2 + v22) + 1270287430) >> (((747796405 * ((_DWORD)result + a2 + v22)
                                                                     + 1270287430) >> 28)
                                                                   + 4)) ^ (747796405 * (result + a2 + v22) + 1270287430));
  *a7 = v19 + (float)((float)(COERCE_FLOAT((v24 >> 31) ^ (v24 >> 9) | 0x3F800000) + -1.0) * (float)(v20 - v19));
  *a8 = a5;
  *a9 = a6 != 0.0;
  *a10 = a6;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_3A6197AD_E251_4C3C_A4A4_97B88CE13708()
{
  uint64_t arguments_buffer;
  float *v1;
  float *v2;
  float *v3;
  _BYTE *v4;
  BOOL *v5;
  float *v6;
  int v7;
  char v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  unsigned int v15;
  uint64_t result;
  unsigned int v17;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 16);
  v2 = *(float **)(arguments_buffer + 24);
  v3 = *(float **)(arguments_buffer + 48);
  v4 = *(_BYTE **)(arguments_buffer + 56);
  v5 = *(BOOL **)(arguments_buffer + 64);
  v6 = *(float **)(arguments_buffer + 72);
  v7 = **(_DWORD **)(arguments_buffer + 8);
  v8 = **(_BYTE **)(arguments_buffer + 32);
  v9 = **(float **)(arguments_buffer + 40);
  v10 = *v1 - *v2;
  v11 = *v1 + *v2;
  v12 = fminf(v10, v11);
  v13 = fmaxf(v10, v11);
  vfx_script_clock_time();
  *(float *)&v14 = v14;
  v15 = fmaxf(*(float *)&v14, 0.0);
  result = vfx_script_clock_simulation_index();
  v17 = 277803737
      * (((747796405 * ((_DWORD)result + v7 + v15) + 1270287430) >> (((747796405 * ((_DWORD)result + v7 + v15)
                                                                     + 1270287430) >> 28)
                                                                   + 4)) ^ (747796405 * (result + v7 + v15) + 1270287430));
  *v3 = v12 + (float)((float)(COERCE_FLOAT((v17 >> 31) ^ (v17 >> 9) | 0x3F800000) + -1.0) * (float)(v13 - v12));
  *v4 = v8;
  *v5 = v9 != 0.0;
  *v6 = v9;
  return result;
}

float Init_comAppleRealitykitVfxGeneral_graph_808D496A_AA3D_4B1F_B709_6D736E35F2D4(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, float *a11, float *a12, float *a13, float *a14, float *a15, float *a16, float a17, float a18, float a19)
{
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float result;

  v19 = *a14;
  v20 = a1 - a2;
  v21 = a1 + a2;
  v22 = fminf(v20, v21);
  v23 = fmaxf(v20, v21);
  v24 = a3 - a4;
  v25 = a3 + a4;
  v26 = fminf(v24, v25);
  v27 = fmaxf(v24, v25);
  v28 = a5 - a6;
  v29 = a5 + a6;
  v30 = fminf(v28, v29);
  v31 = fmaxf(v28, v29);
  v32 = fmaxf(a8 - a17, 0.02);
  v33 = a8 + a17;
  *a11 = v22;
  a11[1] = v23;
  *a12 = v26;
  a12[1] = v27;
  *a13 = v30;
  a13[1] = v31;
  *a15 = fminf(v32, v33);
  a15[1] = fmaxf(v32, v33);
  *a16 = fminf(a18 - a19, a18 + a19);
  a16[1] = fmaxf(a18 - a19, a18 + a19);
  result = fminf(v19, a7);
  *a14 = result;
  a14[1] = fmaxf(v19, a7);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_808D496A_AA3D_4B1F_B709_6D736E35F2D4()
{
  _QWORD *arguments_buffer;
  float *v1;
  float *v2;
  float *v3;
  float *v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  float *v12;
  float *v13;
  float *v14;
  float *v15;
  float *v16;
  float *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float result;

  arguments_buffer = (_QWORD *)vfx_script_get_arguments_buffer();
  v1 = (float *)arguments_buffer[2];
  v2 = (float *)arguments_buffer[3];
  v3 = (float *)arguments_buffer[4];
  v4 = (float *)arguments_buffer[5];
  v5 = (float *)arguments_buffer[6];
  v6 = (float *)arguments_buffer[7];
  v7 = (float *)arguments_buffer[8];
  v8 = (float *)arguments_buffer[9];
  v9 = (float *)arguments_buffer[10];
  v10 = (float *)arguments_buffer[11];
  v11 = (float *)arguments_buffer[12];
  v12 = (float *)arguments_buffer[13];
  v13 = (float *)arguments_buffer[14];
  v14 = (float *)arguments_buffer[15];
  v15 = (float *)arguments_buffer[16];
  v16 = (float *)arguments_buffer[17];
  v17 = (float *)arguments_buffer[18];
  v18 = *v7;
  v19 = *v15;
  v20 = *v1 - *v2;
  v21 = *v1 + *v2;
  v22 = fminf(v20, v21);
  v23 = fmaxf(v20, v21);
  v24 = *v3 - *v4;
  v25 = *v3 + *v4;
  v26 = fminf(v24, v25);
  v27 = fmaxf(v24, v25);
  v28 = *v5 - *v6;
  v29 = *v5 + *v6;
  v30 = fminf(v28, v29);
  v31 = fmaxf(v28, v29);
  v32 = fmaxf(*v8 - *v9, 0.02);
  v33 = *v8 + *v9;
  v34 = fminf(v32, v33);
  v35 = fmaxf(v32, v33);
  v36 = *v10 - *v11;
  v37 = *v10 + *v11;
  *v12 = v22;
  v12[1] = v23;
  *v13 = v26;
  v13[1] = v27;
  *v14 = v30;
  v14[1] = v31;
  *v16 = v34;
  v16[1] = v35;
  *v17 = fminf(v36, v37);
  v17[1] = fmaxf(v36, v37);
  result = fminf(v19, v18);
  *v15 = result;
  v15[1] = fmaxf(v19, v18);
  return result;
}

__n128 Update_comAppleRealitykitVfxGeneral_graph_C0414514_1ABD_430C_99B8_0B75A900FA1A(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, int a7, int32x4_t *a8, BOOL *a9, BOOL *a10, _QWORD *a11)
{
  double v20;
  BOOL v21;
  int32x4_t v22;
  __n128 result;
  __int32 v24;

  v24 = a8->i32[2];
  vfx_script_clock_time();
  *(float *)&v20 = v20;
  *(float *)&v20 = (float)(*(float *)&v20 * a1) * 0.1;
  v21 = a3 != 0.0;
  if (a4 != 0.0)
    v21 = 1;
  *a9 = a2 > 0.0;
  *a10 = v21;
  *a11 = a7 ^ 1u;
  v22 = vdupq_lane_s32(*(int32x2_t *)&v20, 0);
  v22.i32[2] = v24;
  *a8 = v22;
  result.n128_u64[0] = v22.i64[0];
  result.n128_u32[2] = v22.u32[2];
  return result;
}

__n128 __vfx_script_comAppleRealitykitVfxGeneral_graph_C0414514_1ABD_430C_99B8_0B75A900FA1A()
{
  uint64_t arguments_buffer;
  __n128 *v1;
  BOOL *v2;
  BOOL *v3;
  _BOOL8 *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  _BOOL8 v9;
  double v10;
  BOOL v11;
  __n128 result;
  unsigned __int32 v13;

  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(__n128 **)(arguments_buffer + 56);
  v2 = *(BOOL **)(arguments_buffer + 64);
  v3 = *(BOOL **)(arguments_buffer + 72);
  v4 = *(_BOOL8 **)(arguments_buffer + 80);
  v5 = **(float **)(arguments_buffer + 16);
  v6 = **(float **)(arguments_buffer + 24);
  v7 = **(float **)(arguments_buffer + 32);
  v8 = **(float **)(arguments_buffer + 40);
  v9 = **(_BYTE **)(arguments_buffer + 48) == 0;
  v13 = v1->n128_u32[2];
  vfx_script_clock_time();
  *(float *)&v10 = v10;
  *(float *)&v10 = (float)(v5 * *(float *)&v10) * 0.1;
  v11 = v7 != 0.0;
  if (v8 != 0.0)
    v11 = 1;
  *v2 = v6 > 0.0;
  *v3 = v11;
  *v4 = v9;
  result.n128_u64[0] = vdupq_lane_s32(*(int32x2_t *)&v10, 0).u64[0];
  result.n128_u64[1] = __PAIR64__(1.0, v13);
  *v1 = result;
  return result;
}

double Render_comAppleRealitykitVfxGeneral_graph_79611F84_9966_49FC_9DA9_42E714051A7E(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v8;
  double result;
  unint64_t v10;
  _OWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = qword_249C41068[a3];
  v11[0] = xmmword_249C40FE0;
  v11[1] = xmmword_249C40FF0;
  *(_QWORD *)&result = 1;
  v11[2] = xmmword_249C41000;
  v12 = 0;
  v10 = *((_QWORD *)v11 + a4);
  *a6 = v8;
  *a7 = v10;
  *a8 = a5;
  return result;
}

double __vfx_script_comAppleRealitykitVfxGeneral_graph_79611F84_9966_49FC_9DA9_42E714051A7E()
{
  uint64_t arguments_buffer;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;
  _OWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(_QWORD **)(arguments_buffer + 40);
  v2 = *(_QWORD **)(arguments_buffer + 48);
  v3 = *(_QWORD **)(arguments_buffer + 56);
  v4 = **(_QWORD **)(arguments_buffer + 24);
  v5 = **(_QWORD **)(arguments_buffer + 32);
  v6 = qword_249C41068[**(_QWORD **)(arguments_buffer + 16)];
  v9[0] = xmmword_249C40FE0;
  v9[1] = xmmword_249C40FF0;
  *(_QWORD *)&result = 1;
  v9[2] = xmmword_249C41000;
  v10 = 0;
  v8 = *((_QWORD *)v9 + v4);
  *v1 = v6;
  *v2 = v8;
  *v3 = v5;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_18FD4393_3EF4_4453_A815_8E3AD16F6D13(const void *a1, unsigned int a2, unint64_t a3, int a4, unint64_t a5, unint64_t *a6, unint64_t *a7)
{
  if (!a4)
    a3 = 1;
  if (!a4)
    a5 = 1;
  *a6 = a3;
  *a7 = a5;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_18FD4393_3EF4_4453_A815_8E3AD16F6D13()
{
  uint64_t result;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer();
  v1 = *(uint64_t **)(result + 48);
  v2 = **(_QWORD **)(result + 16);
  if (**(_BYTE **)(result + 24))
  {
    v3 = **(_QWORD **)(result + 32);
  }
  else
  {
    v2 = 1;
    v3 = 1;
  }
  **(_QWORD **)(result + 40) = v2;
  *v1 = v3;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_73DD6AB1_ACCC_401A_9516_CEDA7AB07AC2(const void *a1, unsigned int a2, unint64_t a3, int a4, unint64_t a5, unint64_t *a6, unint64_t *a7)
{
  if (!a4)
    a3 = 1;
  if (!a4)
    a5 = 1;
  *a6 = a3;
  *a7 = a5;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_73DD6AB1_ACCC_401A_9516_CEDA7AB07AC2()
{
  uint64_t result;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  result = vfx_script_get_arguments_buffer();
  v1 = *(uint64_t **)(result + 48);
  v2 = **(_QWORD **)(result + 16);
  if (**(_BYTE **)(result + 24))
  {
    v3 = **(_QWORD **)(result + 32);
  }
  else
  {
    v2 = 1;
    v3 = 1;
  }
  **(_QWORD **)(result + 40) = v2;
  *v1 = v3;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_C81D8ED9_E765_4CB8_B826_CC8497F5A622(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, BOOL *a8, _QWORD *a9)
{
  int8x16_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x4_t v19;
  float v20;
  float v21;
  int8x16_t v22;
  float v23;
  int8x16_t v24;
  float v25;
  float v26;
  float v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  unsigned __int32 v31;
  float32x4_t v32;
  float32x2_t v34;
  float v35;
  float32x4_t v36;
  float v37;
  int32x2_t v38;
  float v39;

  v10 = vmulq_f32(a1, a1);
  v10.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u64[0];
  v11 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  v11.i32[3] = 0;
  v12 = vrsqrteq_f32(v11);
  v13 = vmulq_f32(v12, vrsqrtsq_f32(v11, vmulq_f32(v12, v12)));
  v24 = (int8x16_t)vmulq_f32(v13, vrsqrtsq_f32(v11, vmulq_f32(v13, v13)));
  v14 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v10.f32[0] != 0.0)), 0x1FuLL));
  v14.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  v19 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v14), v24, _Q4), a1);
  _Q4.i32[0] = v19.i32[2];
  v9.i32[0] = 1.0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  v20 = *(float *)vbslq_s8(v22, v9, _Q4).i32;
  *(float *)v22.i32 = v19.f32[1] / (float)(fabsf(v19.f32[2]) + 1.0);
  v21 = vmuls_lane_f32(*(float *)v22.i32, *(float32x2_t *)v19.f32, 1);
  *(float *)v22.i32 = -(float)(v19.f32[0] * *(float *)v22.i32);
  v23 = v19.f32[2] + (float)(v20 * v21);
  *(float *)v24.i32 = v20 * *(float *)v22.i32;
  v25 = 1.0 - v21;
  v26 = vmuls_lane_f32(-v20, *(float32x2_t *)v19.f32, 1);
  v27 = v19.f32[2] + (float)(v23 + v25);
  if (v27 > 0.0)
  {
    v28 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    *(int32x2_t *)v32.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32), 0);
    v32.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v26)), v28).u32[0];
    v29 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v27 + 1.0)), v24.u32[0]);
    v30 = vmul_f32(v29, v29);
    v29.i32[0] = v22.i32[0];
    v31 = vsub_f32(*(float32x2_t *)v24.i8, v29).u32[0];
    v22.i32[1] = v30.i32[1];
    v32.i64[1] = v22.i64[0];
    *(float *)v22.i32 = 0.5 / v29.f32[1];
LABEL_12:
    v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.i8, 0);
    goto LABEL_13;
  }
  if (v23 < v25 || v23 < v19.f32[2])
  {
    if (v25 <= v19.f32[2])
    {
      v39 = sqrtf((float)((float)(v19.f32[2] + 1.0) - v23) - v25);
      v19.i32[0] = vsubq_f32(v19, v19).u32[0];
      v32.f32[1] = v19.f32[1] + v26;
      v32.f32[2] = v39 * v39;
      v32.f32[3] = *(float *)v24.i32 - *(float *)v22.i32;
      *(float *)v22.i32 = 0.5 / v39;
      goto LABEL_12;
    }
    v35 = sqrtf((float)((float)(v25 + 1.0) - v23) - v19.f32[2]);
    v36.f32[0] = *(float *)v22.i32 + *(float *)v24.i32;
    v37 = v35 * v35;
    v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    v38 = (int32x2_t)vadd_f32(v34, (float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v26)));
  }
  else
  {
    v35 = sqrtf((float)((float)(v23 + 1.0) - v25) - v19.f32[2]);
    v36.f32[0] = v35 * v35;
    v37 = *(float *)v22.i32 + *(float *)v24.i32;
    v38 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v26), v19.u32[0]), *(float32x2_t *)v19.f32);
  }
  v36.f32[1] = v37;
  *(int32x2_t *)&v36.u32[2] = v38;
  *(float *)v38.i32 = 0.5 / v35;
  v32 = (float32x4_t)vdupq_lane_s32(v38, 0);
LABEL_13:
  *a6 = vmulq_f32(v32, v36);
  *a7 = -a2;
  *a8 = a2 != 0.0;
  *a9 = a5 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_C81D8ED9_E765_4CB8_B826_CC8497F5A622()
{
  uint64_t result;
  float *v1;
  BOOL *v2;
  _QWORD *v3;
  float32x4_t v4;
  float v5;
  int v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x4_t v16;
  int8x16_t v17;
  float v18;
  float v19;
  int8x16_t v20;
  float v21;
  int8x16_t v22;
  float v23;
  float v24;
  float v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  unsigned __int32 v29;
  float32x4_t v30;
  float32x2_t v32;
  float v33;
  float32x4_t v34;
  float v35;
  int32x2_t v36;
  float v37;

  result = vfx_script_get_arguments_buffer();
  v1 = *(float **)(result + 48);
  v2 = *(BOOL **)(result + 56);
  v3 = *(_QWORD **)(result + 64);
  v4 = *(float32x4_t *)*(_QWORD *)(result + 16);
  v5 = **(float **)(result + 24);
  v6 = **(unsigned __int8 **)(result + 32);
  v7 = vmulq_f32(v4, v4);
  v7.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).u64[0];
  v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 0);
  v8.i32[3] = 0;
  v9 = vrsqrteq_f32(v8);
  v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  v22 = (int8x16_t)vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10)));
  v11 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v7.f32[0] != 0.0)), 0x1FuLL));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  v16 = vmulq_f32(v4, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v11), v22, _Q4));
  _Q4.i32[0] = v16.i32[2];
  v17.i32[0] = 1.0;
  v20.i64[0] = 0x8000000080000000;
  v20.i64[1] = 0x8000000080000000;
  v18 = *(float *)vbslq_s8(v20, v17, _Q4).i32;
  *(float *)v20.i32 = v16.f32[1] / (float)(fabsf(v16.f32[2]) + 1.0);
  v19 = vmuls_lane_f32(*(float *)v20.i32, *(float32x2_t *)v16.f32, 1);
  *(float *)v20.i32 = -(float)(v16.f32[0] * *(float *)v20.i32);
  v21 = v16.f32[2] + (float)(v18 * v19);
  *(float *)v22.i32 = v18 * *(float *)v20.i32;
  v23 = 1.0 - v19;
  v24 = vmuls_lane_f32(-v18, *(float32x2_t *)v16.f32, 1);
  v25 = v16.f32[2] + (float)(v21 + v23);
  if (v25 > 0.0)
  {
    v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    *(int32x2_t *)v30.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v16.f32, *(float32x2_t *)v16.f32), 0);
    v30.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v26.u32[1], LODWORD(v24)), v26).u32[0];
    v27 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v25 + 1.0)), v22.u32[0]);
    v28 = vmul_f32(v27, v27);
    v27.i32[0] = v20.i32[0];
    v29 = vsub_f32(*(float32x2_t *)v22.i8, v27).u32[0];
    v20.i32[1] = v28.i32[1];
    v30.i64[1] = v20.i64[0];
    *(float *)v20.i32 = 0.5 / v27.f32[1];
LABEL_12:
    v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.i8, 0);
    goto LABEL_13;
  }
  if (v21 < v23 || v21 < v16.f32[2])
  {
    if (v23 <= v16.f32[2])
    {
      v37 = sqrtf((float)((float)(v16.f32[2] + 1.0) - v21) - v23);
      v16.i32[0] = vsubq_f32(v16, v16).u32[0];
      v30.f32[1] = v16.f32[1] + v24;
      v30.f32[2] = v37 * v37;
      v30.f32[3] = *(float *)v22.i32 - *(float *)v20.i32;
      *(float *)v20.i32 = 0.5 / v37;
      goto LABEL_12;
    }
    v33 = sqrtf((float)((float)(v23 + 1.0) - v21) - v16.f32[2]);
    v34.f32[0] = *(float *)v20.i32 + *(float *)v22.i32;
    v35 = v33 * v33;
    v32 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    v36 = (int32x2_t)vadd_f32(v32, (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v24)));
  }
  else
  {
    v33 = sqrtf((float)((float)(v21 + 1.0) - v23) - v16.f32[2]);
    v34.f32[0] = v33 * v33;
    v35 = *(float *)v20.i32 + *(float *)v22.i32;
    v36 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v24), v16.u32[0]), *(float32x2_t *)v16.f32);
  }
  v34.f32[1] = v35;
  *(int32x2_t *)&v34.u32[2] = v36;
  *(float *)v36.i32 = 0.5 / v33;
  v30 = (float32x4_t)vdupq_lane_s32(v36, 0);
LABEL_13:
  *(float32x4_t *)*(_QWORD *)(result + 40) = vmulq_f32(v30, v34);
  *v1 = -v5;
  *v2 = v5 != 0.0;
  *v3 = v6 == 0;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_36892C5B_FE17_447F_9E03_D2C255C0486F(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, BOOL *a8, _QWORD *a9)
{
  int8x16_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x4_t v19;
  float v20;
  float v21;
  int8x16_t v22;
  float v23;
  int8x16_t v24;
  float v25;
  float v26;
  float v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  unsigned __int32 v31;
  float32x4_t v32;
  float32x2_t v34;
  float v35;
  float32x4_t v36;
  float v37;
  int32x2_t v38;
  float v39;

  v10 = vmulq_f32(a1, a1);
  v10.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u64[0];
  v11 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  v11.i32[3] = 0;
  v12 = vrsqrteq_f32(v11);
  v13 = vmulq_f32(v12, vrsqrtsq_f32(v11, vmulq_f32(v12, v12)));
  v24 = (int8x16_t)vmulq_f32(v13, vrsqrtsq_f32(v11, vmulq_f32(v13, v13)));
  v14 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v10.f32[0] != 0.0)), 0x1FuLL));
  v14.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  v19 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v14), v24, _Q4), a1);
  _Q4.i32[0] = v19.i32[2];
  v9.i32[0] = 1.0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  v20 = *(float *)vbslq_s8(v22, v9, _Q4).i32;
  *(float *)v22.i32 = v19.f32[1] / (float)(fabsf(v19.f32[2]) + 1.0);
  v21 = vmuls_lane_f32(*(float *)v22.i32, *(float32x2_t *)v19.f32, 1);
  *(float *)v22.i32 = -(float)(v19.f32[0] * *(float *)v22.i32);
  v23 = v19.f32[2] + (float)(v20 * v21);
  *(float *)v24.i32 = v20 * *(float *)v22.i32;
  v25 = 1.0 - v21;
  v26 = vmuls_lane_f32(-v20, *(float32x2_t *)v19.f32, 1);
  v27 = v19.f32[2] + (float)(v23 + v25);
  if (v27 > 0.0)
  {
    v28 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    *(int32x2_t *)v32.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32), 0);
    v32.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v26)), v28).u32[0];
    v29 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v27 + 1.0)), v24.u32[0]);
    v30 = vmul_f32(v29, v29);
    v29.i32[0] = v22.i32[0];
    v31 = vsub_f32(*(float32x2_t *)v24.i8, v29).u32[0];
    v22.i32[1] = v30.i32[1];
    v32.i64[1] = v22.i64[0];
    *(float *)v22.i32 = 0.5 / v29.f32[1];
LABEL_12:
    v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.i8, 0);
    goto LABEL_13;
  }
  if (v23 < v25 || v23 < v19.f32[2])
  {
    if (v25 <= v19.f32[2])
    {
      v39 = sqrtf((float)((float)(v19.f32[2] + 1.0) - v23) - v25);
      v19.i32[0] = vsubq_f32(v19, v19).u32[0];
      v32.f32[1] = v19.f32[1] + v26;
      v32.f32[2] = v39 * v39;
      v32.f32[3] = *(float *)v24.i32 - *(float *)v22.i32;
      *(float *)v22.i32 = 0.5 / v39;
      goto LABEL_12;
    }
    v35 = sqrtf((float)((float)(v25 + 1.0) - v23) - v19.f32[2]);
    v36.f32[0] = *(float *)v22.i32 + *(float *)v24.i32;
    v37 = v35 * v35;
    v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    v38 = (int32x2_t)vadd_f32(v34, (float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v26)));
  }
  else
  {
    v35 = sqrtf((float)((float)(v23 + 1.0) - v25) - v19.f32[2]);
    v36.f32[0] = v35 * v35;
    v37 = *(float *)v22.i32 + *(float *)v24.i32;
    v38 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v26), v19.u32[0]), *(float32x2_t *)v19.f32);
  }
  v36.f32[1] = v37;
  *(int32x2_t *)&v36.u32[2] = v38;
  *(float *)v38.i32 = 0.5 / v35;
  v32 = (float32x4_t)vdupq_lane_s32(v38, 0);
LABEL_13:
  *a6 = vmulq_f32(v32, v36);
  *a7 = -a2;
  *a8 = a2 != 0.0;
  *a9 = a5 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_36892C5B_FE17_447F_9E03_D2C255C0486F()
{
  uint64_t result;
  float *v1;
  BOOL *v2;
  _QWORD *v3;
  float32x4_t v4;
  float v5;
  int v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x4_t v16;
  int8x16_t v17;
  float v18;
  float v19;
  int8x16_t v20;
  float v21;
  int8x16_t v22;
  float v23;
  float v24;
  float v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  unsigned __int32 v29;
  float32x4_t v30;
  float32x2_t v32;
  float v33;
  float32x4_t v34;
  float v35;
  int32x2_t v36;
  float v37;

  result = vfx_script_get_arguments_buffer();
  v1 = *(float **)(result + 48);
  v2 = *(BOOL **)(result + 56);
  v3 = *(_QWORD **)(result + 64);
  v4 = *(float32x4_t *)*(_QWORD *)(result + 16);
  v5 = **(float **)(result + 24);
  v6 = **(unsigned __int8 **)(result + 32);
  v7 = vmulq_f32(v4, v4);
  v7.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).u64[0];
  v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 0);
  v8.i32[3] = 0;
  v9 = vrsqrteq_f32(v8);
  v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  v22 = (int8x16_t)vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10)));
  v11 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v7.f32[0] != 0.0)), 0x1FuLL));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  v16 = vmulq_f32(v4, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v11), v22, _Q4));
  _Q4.i32[0] = v16.i32[2];
  v17.i32[0] = 1.0;
  v20.i64[0] = 0x8000000080000000;
  v20.i64[1] = 0x8000000080000000;
  v18 = *(float *)vbslq_s8(v20, v17, _Q4).i32;
  *(float *)v20.i32 = v16.f32[1] / (float)(fabsf(v16.f32[2]) + 1.0);
  v19 = vmuls_lane_f32(*(float *)v20.i32, *(float32x2_t *)v16.f32, 1);
  *(float *)v20.i32 = -(float)(v16.f32[0] * *(float *)v20.i32);
  v21 = v16.f32[2] + (float)(v18 * v19);
  *(float *)v22.i32 = v18 * *(float *)v20.i32;
  v23 = 1.0 - v19;
  v24 = vmuls_lane_f32(-v18, *(float32x2_t *)v16.f32, 1);
  v25 = v16.f32[2] + (float)(v21 + v23);
  if (v25 > 0.0)
  {
    v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    *(int32x2_t *)v30.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v16.f32, *(float32x2_t *)v16.f32), 0);
    v30.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v26.u32[1], LODWORD(v24)), v26).u32[0];
    v27 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v25 + 1.0)), v22.u32[0]);
    v28 = vmul_f32(v27, v27);
    v27.i32[0] = v20.i32[0];
    v29 = vsub_f32(*(float32x2_t *)v22.i8, v27).u32[0];
    v20.i32[1] = v28.i32[1];
    v30.i64[1] = v20.i64[0];
    *(float *)v20.i32 = 0.5 / v27.f32[1];
LABEL_12:
    v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.i8, 0);
    goto LABEL_13;
  }
  if (v21 < v23 || v21 < v16.f32[2])
  {
    if (v23 <= v16.f32[2])
    {
      v37 = sqrtf((float)((float)(v16.f32[2] + 1.0) - v21) - v23);
      v16.i32[0] = vsubq_f32(v16, v16).u32[0];
      v30.f32[1] = v16.f32[1] + v24;
      v30.f32[2] = v37 * v37;
      v30.f32[3] = *(float *)v22.i32 - *(float *)v20.i32;
      *(float *)v20.i32 = 0.5 / v37;
      goto LABEL_12;
    }
    v33 = sqrtf((float)((float)(v23 + 1.0) - v21) - v16.f32[2]);
    v34.f32[0] = *(float *)v20.i32 + *(float *)v22.i32;
    v35 = v33 * v33;
    v32 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    v36 = (int32x2_t)vadd_f32(v32, (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v24)));
  }
  else
  {
    v33 = sqrtf((float)((float)(v21 + 1.0) - v23) - v16.f32[2]);
    v34.f32[0] = v33 * v33;
    v35 = *(float *)v20.i32 + *(float *)v22.i32;
    v36 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v24), v16.u32[0]), *(float32x2_t *)v16.f32);
  }
  v34.f32[1] = v35;
  *(int32x2_t *)&v34.u32[2] = v36;
  *(float *)v36.i32 = 0.5 / v33;
  v30 = (float32x4_t)vdupq_lane_s32(v36, 0);
LABEL_13:
  *(float32x4_t *)*(_QWORD *)(result + 40) = vmulq_f32(v30, v34);
  *v1 = -v5;
  *v2 = v5 != 0.0;
  *v3 = v6 == 0;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_3631C6CB_E76B_47C6_9BA0_12F4E98A26BD(const void *a1, unsigned int a2, float a3, int a4, float *a5, BOOL *a6, unint64_t *a7)
{
  *a5 = -a3;
  *a6 = a3 != 0.0;
  *a7 = a4 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_3631C6CB_E76B_47C6_9BA0_12F4E98A26BD()
{
  uint64_t result;
  BOOL *v1;
  _BOOL8 *v2;
  float v3;
  _BOOL8 v4;

  result = vfx_script_get_arguments_buffer();
  v1 = *(BOOL **)(result + 40);
  v2 = *(_BOOL8 **)(result + 48);
  v3 = **(float **)(result + 16);
  v4 = **(_BYTE **)(result + 24) == 0;
  **(float **)(result + 32) = -v3;
  *v1 = v3 != 0.0;
  *v2 = v4;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_EAD9CBA2_783E_48D3_B113_0CC58281BB32(const void *a1, unsigned int a2, float a3, int a4, float *a5, BOOL *a6, unint64_t *a7)
{
  *a5 = -a3;
  *a6 = a3 != 0.0;
  *a7 = a4 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_EAD9CBA2_783E_48D3_B113_0CC58281BB32()
{
  uint64_t result;
  BOOL *v1;
  _BOOL8 *v2;
  float v3;
  _BOOL8 v4;

  result = vfx_script_get_arguments_buffer();
  v1 = *(BOOL **)(result + 40);
  v2 = *(_BOOL8 **)(result + 48);
  v3 = **(float **)(result + 16);
  v4 = **(_BYTE **)(result + 24) == 0;
  **(float **)(result + 32) = -v3;
  *v1 = v3 != 0.0;
  *v2 = v4;
  return result;
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_52(float32x4_t a1, float32x4_t a2, uint64_t a3, uint64_t a4, __n128 *a5)
{
  float32x4_t v5;
  int16x4_t v6;
  __n128 result;

  a2.i32[0] = 0;
  v5 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(a1, a2), 0), (int8x16_t)xmmword_249C40FD0, (int8x16_t)0);
  a1.i32[0] = vextq_s8((int8x16_t)a1, (int8x16_t)a1, 8uLL).u32[0];
  v6 = (int16x4_t)vcgtz_f32(*(float32x2_t *)a1.f32);
  result = (__n128)vaddq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_lane_s16(v6, 0)), 0x1FuLL)), (int8x16_t)xmmword_249C41020, (int8x16_t)vdupq_n_s32(0x3DCCCCCDu)), vaddq_f32(v5, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vuzp1_s16(v6, v6)), 0x1FuLL)), (int8x16_t)xmmword_249C41010, (int8x16_t)0)));
  result.n128_u32[3] = 1.0;
  *a5 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_52()
{
  vfx_script_get_iteration_range();
  return vfx_script_get_arguments_buffer();
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_3(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float a5, float a6, float a7, float a8, uint64_t a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, uint64_t a16, unsigned __int8 a17, unint64_t a18, unint64_t a19, float a20,float32x4_t a21,float a22,float a23,uint64_t a24,float32x4_t a25,float a26,float a27,int a28,unint64_t a29,int8x16_t *a30,int8x16_t *a31,int8x16_t *a32,_OWORD *a33,_DWORD *a34,__n128 *a35,float *a36,float32x4_t *a37,float32x4_t *a38,_OWORD *a39)
{
  int v44;
  int v45;
  int v46;
  unsigned int v47;
  unint64_t v48;
  float v49;
  float v50;
  int v51;
  unsigned int v52;
  float v53;
  float v54;
  unsigned int v55;
  unsigned int v56;
  float v57;
  unsigned int v58;
  float v59;
  int8x16_t v60;
  float32x4_t v61;
  unsigned int v62;
  int8x16_t v63;
  __int32 v64;
  uint32x2_t v65;
  uint32x2_t v66;
  float32x2_t v72;
  float32x4_t v74;
  unsigned int v75;
  float32x4_t v76;
  float32x4_t v78;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  int8x16_t v85;
  int32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  int32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  int32x4_t v100;
  __float2 v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  int32x4_t v105;
  int8x16_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  int32x4_t v110;
  int8x16_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  int32x4_t v119;
  int v120;
  unsigned int v121;
  float v122;
  float32x4_t v123;
  int32x2_t v124;
  unsigned int v125;
  float v126;
  float v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  int8x16_t v131;
  int32x4_t v132;
  float v133;
  __float2 v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  int32x4_t v140;
  int v141;
  unsigned int v142;
  __int128 v143;
  __n128 result;
  float32x4_t v146;
  float32x4_t v148;
  float32x4_t v149;
  unsigned __int32 v150;
  float v152;
  int8x16_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float v158;
  float32x4_t v162;
  int8x16_t v164;
  float32x4_t v165;
  float32x4_t v166;
  int8x16_t v168;

  v44 = vfx_script_clock_simulation_index();
  v45 = vfx_script_clock_simulation_index();
  v46 = a11 + a10;
  v47 = 277803737
      * (((747796405 * (v45 + v46) - 745064565) >> (((747796405 * (v45 + v46) - 745064565) >> 28)
                                                                + 4)) ^ (747796405 * (v45 + v46) - 745064565));
  v48 = a16 * a15;
  v49 = fmaxf((float)v48, 1.0);
  v50 = (float)((float)(a7 - a8)
              + (float)((float)(COERCE_FLOAT((v47 >> 31) ^ (v47 >> 9) | 0x3F800000) + -1.0)
                      * (float)((float)(a7 + a8) - (float)(a7 - a8))))
      / v49;
  v51 = vfx_script_clock_simulation_index();
  v52 = 277803737
      * (((747796405 * (v51 + v46) - 745064565) >> (((747796405 * (v51 + v46) - 745064565) >> 28)
                                                                + 4)) ^ (747796405 * (v51 + v46) - 745064565));
  v53 = fmaxf((float)((float)a18 - (float)a19)+ (float)((float)(COERCE_FLOAT((v52 >> 31) ^ (v52 >> 9) | 0x3F800000) + -1.0)* (float)((float)((float)a18 + (float)a19) - (float)((float)a18 - (float)a19))), 0.0)/ v49;
  v54 = 0.999;
  if (!a17)
    v54 = 0.0;
  v158 = v54 * v50;
  v55 = 747796405 * (v46 + v44) - 606257472;
  v56 = 277803737 * ((v55 >> ((v55 >> 28) + 4)) ^ v55);
  v57 = COERCE_FLOAT((v56 >> 31) ^ (v56 >> 9) | 0x3F800000) + -1.0;
  v58 = 277803737
      * (((747796405 * v55 - 1403630843) >> (((747796405 * v55 - 1403630843) >> 28) + 4)) ^ (747796405 * v55 - 1403630843));
  v59 = COERCE_FLOAT((v58 >> 31) ^ (v58 >> 9) | 0x3F800000) + -1.0;
  if (!a13)
    v59 = 0.0;
  v60 = (int8x16_t)vmlaq_n_f32(a3, vsubq_f32(a4, a3), v59);
  if (!a12)
    v57 = 0.0;
  v61 = vsubq_f32(a2, a1);
  if (a14)
    v62 = -1;
  else
    v62 = 0;
  v168 = (int8x16_t)vmlaq_n_f32(a1, v61, v57);
  v63 = vbslq_s8((int8x16_t)vdupq_n_s32(v62), v60, v168);
  if ((a17 & (v48 > 1)) == 0)
    v53 = 0.0;
  v152 = v53;
  v154 = v63;
  v64 = 747796405 * (vfx_script_clock_simulation_index() + v46) + 85864716;
  v65.i32[0] = v64;
  v65.i32[1] = 747796405 * v64 - 1403630843;
  v66 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v65, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v65, 0x1CuLL))), (int8x8_t)v65), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v72 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v74.f32 = vadd_f32(v72, _D1);
  v75 = 277803737
      * (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v64
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v74.f32[2] = COERCE_FLOAT((v75 >> 31) ^ (v75 >> 9) | 0x3F800000) + -1.0;
  v74.i32[3] = 0;
  v76 = vmaxnmq_f32(v74, (float32x4_t)0);
  v76.i32[3] = 0;
  __asm { FMOV            V5.4S, #1.0 }
  v164 = _Q5;
  v78.i64[0] = 0x4000000040000000;
  v78.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  v80 = vmlaq_f32(_Q2, v78, vminnmq_f32(v76, (float32x4_t)xmmword_249C40FC0));
  v81 = vmulq_f32(v80, v80);
  v81.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).u64[0];
  v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 0);
  v82.i32[3] = 0;
  v83 = vrsqrteq_f32(v82);
  v84 = vmulq_f32(v83, vrsqrtsq_f32(v82, vmulq_f32(v83, v83)));
  v85 = (int8x16_t)vmulq_f32(v80, vmulq_f32(v84, vrsqrtsq_f32(v82, vmulq_f32(v84, v84))));
  v86 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v81.f32[0] != 0.0)), 0x1FuLL));
  v86.i32[3] = 0;
  v87 = vmulq_f32(a21, a21);
  v87.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).u64[0];
  v88 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 0);
  v88.i32[3] = 0;
  v89 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v86), v85, (int8x16_t)v80);
  v90 = vrsqrteq_f32(v88);
  v91 = vmulq_f32(v90, vrsqrtsq_f32(v88, vmulq_f32(v90, v90)));
  v92 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v87.f32[0] != 0.0)), 0x1FuLL));
  v92.i32[3] = 0;
  v93 = vmulq_f32(a21, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v92), (int8x16_t)vmulq_f32(v91, vrsqrtsq_f32(v88, vmulq_f32(v91, v91))), _Q5));
  v146 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v93, (int32x4_t)v93), (int8x16_t)v93, 0xCuLL), vnegq_f32(v89)), v93, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v89, (int32x4_t)v89), (int8x16_t)v89, 0xCuLL));
  v148 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v146, (int32x4_t)v146), (int8x16_t)v146, 0xCuLL);
  v94 = vmulq_f32(v93, v89);
  v95 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v94, 2), vaddq_f32(v94, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v94.f32, 1))).f32[0]);
  v96 = vmulq_f32(v146, v146);
  v96.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), v96)).u64[0];
  v97 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 0);
  v97.i32[3] = 0;
  v98 = vrsqrteq_f32(v97);
  v99 = vmulq_f32(v98, vrsqrtsq_f32(v97, vmulq_f32(v98, v98)));
  v100 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v96.f32[0] != 0.0)), 0x1FuLL));
  v100.i32[3] = 0;
  v149 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v100), (int8x16_t)vmulq_f32(vmulq_f32(v99, vrsqrtsq_f32(v97, vmulq_f32(v99, v99))), v148), (int8x16_t)v148);
  v101 = __sincosf_stret((float)(v95 * a20) * 0.5);
  v102 = vmulq_n_f32(v149, v101.__sinval);
  v103 = v102;
  v103.i32[3] = LODWORD(v101.__cosval);
  v104 = vmulq_f32(v103, (float32x4_t)xmmword_249C41030);
  v105 = (int32x4_t)vnegq_f32(v104);
  v106 = (int8x16_t)vtrn2q_s32((int32x4_t)v104, vtrn1q_s32((int32x4_t)v104, v105));
  v107 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v104, (int8x16_t)v105, 8uLL), *(float32x2_t *)a21.f32, 1), (float32x4_t)vextq_s8(v106, v106, 8uLL), a21.f32[0]);
  v108 = (float32x4_t)vrev64q_s32((int32x4_t)v104);
  v108.i32[0] = v105.i32[1];
  v108.i32[3] = v105.i32[2];
  v109 = vmlaq_laneq_f32(v107, v108, a21, 2);
  v110 = (int32x4_t)vnegq_f32(v109);
  v111 = (int8x16_t)vtrn2q_s32((int32x4_t)v109, vtrn1q_s32((int32x4_t)v109, v110));
  v112 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v109, (int8x16_t)v110, 8uLL), *(float32x2_t *)v102.f32, 1), (float32x4_t)vextq_s8(v111, v111, 8uLL), v102.f32[0]);
  v113 = (float32x4_t)vrev64q_s32((int32x4_t)v109);
  v113.i32[0] = v110.i32[1];
  v113.i32[3] = v110.i32[2];
  v114 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v109, v103, 3), v113, v102, 2), v112);
  v115 = vmulq_f32(v114, v114);
  v115.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u64[0];
  v116 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 0);
  v116.i32[3] = 0;
  v117 = vrsqrteq_f32(v116);
  v118 = vmulq_f32(v117, vrsqrtsq_f32(v116, vmulq_f32(v117, v117)));
  v119 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v115.f32[0] != 0.0)), 0x1FuLL));
  v119.i32[3] = 0;
  v162 = vmulq_f32(v114, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v119), (int8x16_t)vmulq_f32(v118, vrsqrtsq_f32(v116, vmulq_f32(v118, v118))), v164));
  v120 = vfx_script_clock_simulation_index();
  v121 = 277803737
       * (((747796405 * (v120 + v46) - 745064565) >> (((747796405 * (v120 + v46) - 745064565) >> 28)
                                                                  + 4)) ^ (747796405 * (v120 + v46) - 745064565));
  v122 = (float)(a22 - a23)
       + (float)((float)(COERCE_FLOAT((v121 >> 31) ^ (v121 >> 9) | 0x3F800000) + -1.0)
               * (float)((float)(a22 + a23) - (float)(a22 - a23)));
  *(float *)&v150 = v122;
  v123 = vmulq_f32(v162, v162);
  v124 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v123, 2), vaddq_f32(v123, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v123.f32, 1))).u64[0];
  v125 = *(float *)v124.i32 != 0.0;
  if (a24 == 1)
    v126 = 0.0;
  else
    v126 = v122;
  v127 = v122 * 0.5;
  v128 = (float32x4_t)vdupq_lane_s32(v124, 0);
  v128.i32[3] = 0;
  v129 = vrsqrteq_f32(v128);
  v130 = vmulq_f32(v129, vrsqrtsq_f32(v128, vmulq_f32(v129, v129)));
  v131 = (int8x16_t)vmulq_f32(v130, vrsqrtsq_f32(v128, vmulq_f32(v130, v130)));
  v132 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v125)), 0x1FuLL));
  v132.i32[3] = 0;
  v155 = vmulq_f32(v162, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v132), v131, v164));
  if (a24 == 1)
    v133 = v127;
  else
    v133 = 0.0;
  v134 = __sincosf_stret(v133);
  v135 = vmulq_n_f32(v155, v134.__sinval);
  v135.i32[3] = LODWORD(v134.__cosval);
  v156 = v135;
  v136 = vmulq_f32(a25, a25);
  v136.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v136, 2), vaddq_f32(v136, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v136.f32, 1))).u64[0];
  v137 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v136.f32, 0);
  v137.i32[3] = 0;
  v138 = vrsqrteq_f32(v137);
  v139 = vmulq_f32(v138, vrsqrtsq_f32(v137, vmulq_f32(v138, v138)));
  v140 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v136.f32[0] != 0.0)), 0x1FuLL));
  v140.i32[3] = 0;
  v165 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v140), (int8x16_t)vmulq_f32(v139, vrsqrtsq_f32(v137, vmulq_f32(v139, v139))), v164), a25);
  v141 = vfx_script_clock_simulation_index();
  v142 = 277803737
       * (((747796405 * (v141 + v46) - 745064565) >> (((747796405 * (v141 + v46) - 745064565) >> 28)
                                                                  + 4)) ^ (747796405 * (v141 + v46) - 745064565));
  v166 = vmulq_n_f32(v165, (float)(a26 - a27)+ (float)((float)(COERCE_FLOAT((v142 >> 31) ^ (v142 >> 9) | 0x3F800000) + -1.0)* (float)((float)(a26 + a27) - (float)(a26 - a27))));
  vfx_script_clock_time();
  *(float *)&v143 = *(double *)&v143;
  *a30 = v168;
  *a31 = v168;
  *a32 = v154;
  *a34 = LODWORD(v152);
  *a36 = v126;
  *a37 = v156;
  DWORD1(v143) = a28;
  *((float *)&v143 + 2) = (float)a29;
  *a38 = v166;
  *a39 = v143;
  *(_QWORD *)&v143 = __PAIR64__(LODWORD(a6), LODWORD(a5));
  *((_QWORD *)&v143 + 1) = __PAIR64__(LODWORD(v152), LODWORD(v158));
  *a33 = v143;
  result = (__n128)v162;
  result.n128_u32[3] = v150;
  *a35 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_3()
{
  vfx_script_get_iteration_range();
  return vfx_script_get_arguments_buffer();
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_65(int8x16_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, int a10, int a11, int a12, int a13, int a14, int a15, uint64_t a16, float a17, uint64_t a18, unint64_t a19, unint64_t a20,float a21,uint64_t a22,float32x4_t a23,float a24,float a25,uint64_t a26,int8x16_t *a27,int8x16_t *a28,int8x16_t *a29,_OWORD *a30,_DWORD *a31,__n128 *a32,float *a33,float32x4_t *a34,__int128 *a35)
{
  int v39;
  float v40;
  int v41;
  int v42;
  unsigned int v43;
  unint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  int v50;
  unsigned int v51;
  float v52;
  unsigned int v53;
  unsigned int v54;
  float v55;
  unsigned int v56;
  float v57;
  int8x16_t v58;
  int8x16_t v59;
  unsigned int v60;
  int8x16_t v61;
  unsigned int v62;
  int8x16_t v63;
  __int32 v64;
  uint32x2_t v65;
  uint32x2_t v66;
  float32x2_t v72;
  float32x4_t v74;
  unsigned int v75;
  float32x4_t v76;
  float32x4_t v78;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  int8x16_t v85;
  int32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  int32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  int32x4_t v100;
  __float2 v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  int32x4_t v105;
  int8x16_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  int32x4_t v110;
  int8x16_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  int32x4_t v119;
  float v120;
  int v121;
  unsigned int v122;
  float v123;
  float32x4_t v124;
  int32x2_t v125;
  unsigned int v126;
  float v127;
  float v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  int8x16_t v132;
  int32x4_t v133;
  float v134;
  __float2 v135;
  float32x4_t v136;
  __int128 v137;
  __n128 result;
  float32x4_t v142;
  float32x4_t v144;
  float32x4_t v145;
  unsigned __int32 v146;
  int8x16_t v148;
  float v150;
  int8x16_t v152;
  float v153;
  __int128 v154;
  float32x4_t v158;
  int8x16_t v160;
  float32x4_t v161;
  float32x4_t v162;

  v154 = *a35;
  v39 = vfx_script_clock_simulation_index();
  v40 = fminf(a8 - a17, a8 + a17);
  v41 = vfx_script_clock_simulation_index();
  v42 = a11 + a10;
  v43 = 277803737
      * (((747796405 * (v41 + v42) + 1492984298) >> (((747796405 * (v41 + v42) + 1492984298) >> 28)
                                                                 + 4)) ^ (747796405 * (v41 + v42) + 1492984298));
  v44 = a18 * a16;
  v45 = fmaxf((float)v44, 1.0);
  v153 = (float)((float)(v40
                       + (float)((float)(COERCE_FLOAT((v43 >> 31) ^ (v43 >> 9) | 0x3F800000) + -1.0)
                               * (float)(fmaxf(a8 - a17, a8 + a17) - v40)))
               / v45)
       * 0.999;
  v46 = (float)a19 - (float)a20;
  v47 = (float)a19 + (float)a20;
  v48 = fminf(v46, v47);
  v49 = fmaxf(v46, v47);
  v50 = vfx_script_clock_simulation_index();
  v51 = 277803737
      * (((747796405 * (v50 + v42) + 1492984298) >> (((747796405 * (v50 + v42) + 1492984298) >> 28)
                                                                 + 4)) ^ (747796405 * (v50 + v42) + 1492984298));
  v52 = fmaxf(v48 + (float)((float)(COERCE_FLOAT((v51 >> 31) ^ (v51 >> 9) | 0x3F800000) + -1.0) * (float)(v49 - v48)), 0.0)/ v45;
  v53 = 747796405 * (v42 + v39) - 478131083;
  v54 = 277803737 * ((v53 >> ((v53 >> 28) + 4)) ^ v53);
  v55 = COERCE_FLOAT((v54 >> 31) ^ (v54 >> 9) | 0x3F800000) + -1.0;
  v56 = 277803737
      * (((747796405 * v53 - 1403630843) >> (((747796405 * v53 - 1403630843) >> 28) + 4)) ^ (747796405 * v53 - 1403630843));
  v57 = COERCE_FLOAT((v56 >> 31) ^ (v56 >> 9) | 0x3F800000) + -1.0;
  if (!a14)
    v57 = 0.0;
  v58 = (int8x16_t)vmlaq_n_f32(a4, vsubq_f32(a5, a4), v57);
  if (!a12)
    v55 = 0.0;
  v59 = (int8x16_t)vmlaq_n_f32(a2, vsubq_f32(a3, a2), v55);
  if (a13)
    v60 = -1;
  else
    v60 = 0;
  v61 = vbslq_s8((int8x16_t)vdupq_n_s32(v60), a1, v59);
  v148 = v61;
  if (a15)
    v62 = -1;
  else
    v62 = 0;
  v63 = vbslq_s8((int8x16_t)vdupq_n_s32(v62), v58, v61);
  if (v44 <= 1)
    v52 = 0.0;
  v150 = v52;
  v152 = v63;
  v64 = 747796405 * (vfx_script_clock_simulation_index() + v42) + 85864716;
  v65.i32[0] = v64;
  v65.i32[1] = 747796405 * v64 - 1403630843;
  v66 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v65, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v65, 0x1CuLL))), (int8x8_t)v65), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  v72 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v74.f32 = vadd_f32(v72, _D1);
  v75 = 277803737
      * (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v64
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v74.f32[2] = COERCE_FLOAT((v75 >> 31) ^ (v75 >> 9) | 0x3F800000) + -1.0;
  v74.i32[3] = 0;
  v76 = vmaxnmq_f32(v74, (float32x4_t)0);
  v76.i32[3] = 0;
  __asm { FMOV            V5.4S, #1.0 }
  v160 = _Q5;
  v78.i64[0] = 0x4000000040000000;
  v78.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  v80 = vmlaq_f32(_Q2, v78, vminnmq_f32(v76, (float32x4_t)xmmword_249C40FC0));
  v81 = vmulq_f32(v80, v80);
  v81.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).u64[0];
  v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 0);
  v82.i32[3] = 0;
  v83 = vrsqrteq_f32(v82);
  v84 = vmulq_f32(v83, vrsqrtsq_f32(v82, vmulq_f32(v83, v83)));
  v85 = (int8x16_t)vmulq_f32(v80, vmulq_f32(v84, vrsqrtsq_f32(v82, vmulq_f32(v84, v84))));
  v86 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v81.f32[0] != 0.0)), 0x1FuLL));
  v86.i32[3] = 0;
  v87 = vmulq_f32(a23, a23);
  v87.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).u64[0];
  v88 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 0);
  v88.i32[3] = 0;
  v89 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v86), v85, (int8x16_t)v80);
  v90 = vrsqrteq_f32(v88);
  v91 = vmulq_f32(v90, vrsqrtsq_f32(v88, vmulq_f32(v90, v90)));
  v92 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v87.f32[0] != 0.0)), 0x1FuLL));
  v92.i32[3] = 0;
  v93 = vmulq_f32(a23, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v92), (int8x16_t)vmulq_f32(v91, vrsqrtsq_f32(v88, vmulq_f32(v91, v91))), _Q5));
  v142 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v93, (int32x4_t)v93), (int8x16_t)v93, 0xCuLL), vnegq_f32(v89)), v93, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v89, (int32x4_t)v89), (int8x16_t)v89, 0xCuLL));
  v144 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v142, (int32x4_t)v142), (int8x16_t)v142, 0xCuLL);
  v94 = vmulq_f32(v93, v89);
  v95 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v94, 2), vaddq_f32(v94, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v94.f32, 1))).f32[0]);
  v96 = vmulq_f32(v142, v142);
  v96.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), v96)).u64[0];
  v97 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 0);
  v97.i32[3] = 0;
  v98 = vrsqrteq_f32(v97);
  v99 = vmulq_f32(v98, vrsqrtsq_f32(v97, vmulq_f32(v98, v98)));
  v100 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v96.f32[0] != 0.0)), 0x1FuLL));
  v100.i32[3] = 0;
  v145 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v100), (int8x16_t)vmulq_f32(vmulq_f32(v99, vrsqrtsq_f32(v97, vmulq_f32(v99, v99))), v144), (int8x16_t)v144);
  v101 = __sincosf_stret((float)(v95 * a21) * 0.5);
  v102 = vmulq_n_f32(v145, v101.__sinval);
  v103 = v102;
  v103.i32[3] = LODWORD(v101.__cosval);
  v104 = vmulq_f32(v103, (float32x4_t)xmmword_249C41030);
  v105 = (int32x4_t)vnegq_f32(v104);
  v106 = (int8x16_t)vtrn2q_s32((int32x4_t)v104, vtrn1q_s32((int32x4_t)v104, v105));
  v107 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v104, (int8x16_t)v105, 8uLL), *(float32x2_t *)a23.f32, 1);
  v108 = (float32x4_t)vrev64q_s32((int32x4_t)v104);
  v108.i32[0] = v105.i32[1];
  v108.i32[3] = v105.i32[2];
  v109 = vmlaq_laneq_f32(vmlaq_n_f32(v107, (float32x4_t)vextq_s8(v106, v106, 8uLL), a23.f32[0]), v108, a23, 2);
  v110 = (int32x4_t)vnegq_f32(v109);
  v111 = (int8x16_t)vtrn2q_s32((int32x4_t)v109, vtrn1q_s32((int32x4_t)v109, v110));
  v112 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v109, (int8x16_t)v110, 8uLL), *(float32x2_t *)v102.f32, 1), (float32x4_t)vextq_s8(v111, v111, 8uLL), v102.f32[0]);
  v113 = (float32x4_t)vrev64q_s32((int32x4_t)v109);
  v113.i32[0] = v110.i32[1];
  v113.i32[3] = v110.i32[2];
  v114 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v109, v103, 3), v113, v102, 2), v112);
  v115 = vmulq_f32(v114, v114);
  v115.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u64[0];
  v116 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 0);
  v116.i32[3] = 0;
  v117 = vrsqrteq_f32(v116);
  v118 = vmulq_f32(v117, vrsqrtsq_f32(v116, vmulq_f32(v117, v117)));
  v119 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v115.f32[0] != 0.0)), 0x1FuLL));
  v119.i32[3] = 0;
  v158 = vmulq_f32(v114, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v119), (int8x16_t)vmulq_f32(v118, vrsqrtsq_f32(v116, vmulq_f32(v118, v118))), v160));
  v120 = fminf(a24 - a25, a24 + a25);
  v121 = vfx_script_clock_simulation_index();
  v122 = 277803737
       * (((747796405 * (v121 + v42) + 1492984298) >> (((747796405 * (v121 + v42)
                                                                                   + 1492984298) >> 28)
                                                                   + 4)) ^ (747796405 * (v121 + v42) + 1492984298));
  v123 = v120
       + (float)((float)(COERCE_FLOAT((v122 >> 31) ^ (v122 >> 9) | 0x3F800000) + -1.0)
               * (float)(fmaxf(a24 - a25, a24 + a25) - v120));
  v146 = LODWORD(v123);
  v124 = vmulq_f32(v158, v158);
  v125 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v124, 2), vaddq_f32(v124, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v124.f32, 1))).u64[0];
  v126 = *(float *)v125.i32 != 0.0;
  if (a26 == 1)
    v127 = 0.0;
  else
    v127 = v123;
  v128 = v123 * 0.5;
  v129 = (float32x4_t)vdupq_lane_s32(v125, 0);
  v129.i32[3] = 0;
  v130 = vrsqrteq_f32(v129);
  v131 = vmulq_f32(v130, vrsqrtsq_f32(v129, vmulq_f32(v130, v130)));
  v132 = (int8x16_t)vmulq_f32(v131, vrsqrtsq_f32(v129, vmulq_f32(v131, v131)));
  v133 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v126)), 0x1FuLL));
  v133.i32[3] = 0;
  v161 = vmulq_f32(v158, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v133), v132, v160));
  if (a26 == 1)
    v134 = v128;
  else
    v134 = 0.0;
  v135 = __sincosf_stret(v134);
  v136 = vmulq_n_f32(v161, v135.__sinval);
  v136.i32[3] = LODWORD(v135.__cosval);
  v162 = v136;
  vfx_script_clock_time();
  *(float *)&v137 = *(double *)&v137;
  *a27 = v148;
  *a28 = v148;
  *a29 = v152;
  *a31 = LODWORD(v150);
  *a33 = v127;
  *(_QWORD *)((char *)&v137 + 4) = *(_QWORD *)((char *)&v154 + 4);
  *a34 = v162;
  *a35 = v137;
  *(_QWORD *)&v137 = __PAIR64__(LODWORD(a7), LODWORD(a6));
  *((_QWORD *)&v137 + 1) = __PAIR64__(LODWORD(v150), LODWORD(v153));
  *a30 = v137;
  result = (__n128)v158;
  result.n128_u32[3] = v146;
  *a32 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_65()
{
  vfx_script_get_iteration_range();
  return vfx_script_get_arguments_buffer();
}

void ParticleUpdate_comAppleRealitykitVfxGeneral_particleUpdate_19(float32x4_t a1, float32x4_t a2, float a3, __n128 a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, float32x4_t *a13, float *a14, float *a15, float32x4_t *a16, float32x4_t a17, float *a18)
{
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float v30;
  double v31;
  float v32;
  float32x4_t v33;
  unsigned int v34;
  float v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  uint16x4_t v40;
  int32x4_t v41;
  int8x16_t v42;
  int8x16_t v43;
  __float2 v49;
  float32x4_t v50;
  float v51;
  float32x4_t v54;
  float32x4_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v58 = 1.0 - a3;
  v59 = a3;
  v60 = sinf(a3 * 3.1416);
  v61 = v60 * v60;
  v62 = v59 * v59;
  v63 = 1.0 - (float)(v59 * v59);
  v64 = 1065353216;
  v27 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), powf(v59, a4.n128_f32[1]));
  v28 = fminf(fmaxf(v27.f32[3], 0.0), 1.0) * *(&v58 + (unint64_t)a4.n128_f32[2]);
  v29 = vmulq_n_f32(v27, v28);
  v29.f32[3] = v28;
  v54 = v29;
  v30 = a5.f32[1] + (float)((float)(vmuls_lane_f32(a6, *(float32x2_t *)a5.f32, 1) - a5.f32[1]) * powf(v59, a7));
  vfx_script_clock_time();
  *(float *)&v31 = v31;
  v32 = *(float *)&v31 - a4.n128_f32[0];
  v33 = vmulq_f32(a17, a17);
  v33.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u64[0];
  v34 = v33.f32[0] != 0.0;
  v35 = (float)(a17.f32[3] + (float)((float)(*(float *)&v31 - a4.n128_f32[0]) * a5.f32[0])) * 0.5;
  v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
  v36.i32[3] = 0;
  v37 = vrsqrteq_f32(v36);
  v38 = vmulq_f32(v37, vrsqrtsq_f32(v36, vmulq_f32(v37, v37)));
  v39 = vrsqrtsq_f32(v36, vmulq_f32(v38, v38));
  v40 = (uint16x4_t)vdup_n_s16(v34);
  if (a11 == 1)
    a8 = 0.0;
  v41 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16(v40), 0x1FuLL));
  v41.i32[3] = 0;
  v42 = (int8x16_t)vmulq_f32(v38, v39);
  v43 = (int8x16_t)vcltzq_s32(v41);
  __asm { FMOV            V3.4S, #1.0 }
  v57 = vmulq_f32((float32x4_t)vbslq_s8(v43, v42, _Q3), a17);
  if (!_ZF)
    v35 = 0.0;
  v49 = __sincosf_stret(v35);
  v50 = vmulq_n_f32(v57, v49.__sinval);
  v50.i32[3] = LODWORD(v49.__cosval);
  v51 = vmuls_lane_f32(v32, a5, 2);
  if (!a12)
    v51 = 0.0;
  *a13 = v54;
  *a14 = v30;
  *a15 = a8;
  *a16 = v50;
  *a18 = a5.f32[3] + v51;
}

void __vfx_script_comAppleRealitykitVfxGeneral_particleUpdate_19()
{
  vfx_script_get_iteration_range();
  vfx_script_get_arguments_buffer();
}

void ParticleUpdate_comAppleRealitykitVfxGeneral_particleUpdate_12(float32x4_t a1, float32x4_t a2, float a3, float a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, float32x4_t *a14, float *a15, float *a16, float a17, uint64_t a18, float32x4_t a19, float *a20,float32x4_t *a21)
{
  float32x4_t v30;
  float v31;
  float32x4_t v32;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float32x4_t v38;
  unsigned int v39;
  float v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  uint16x4_t v45;
  float v46;
  int32x4_t v47;
  int8x16_t v48;
  int8x16_t v49;
  __float2 v55;
  float32x4_t v56;
  float32x4_t v59;
  float32x4_t v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v63 = 1.0 - a3;
  v64 = a3;
  v65 = sinf(a3 * 3.1416);
  v66 = v65 * v65;
  v67 = v64 * v64;
  v68 = 1.0 - (float)(v64 * v64);
  v69 = 1065353216;
  v30 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), powf(v64, a4));
  v31 = fminf(fmaxf(v30.f32[3], 0.0), 1.0) * *(&v63 + a11);
  v32 = vmulq_n_f32(v30, v31);
  v32.f32[3] = v31;
  v59 = v32;
  v33 = a5.f32[1] + (float)((float)(vmuls_lane_f32(a6, *(float32x2_t *)a5.f32, 1) - a5.f32[1]) * powf(v64, a7));
  vfx_script_clock_time();
  *(float *)&v34 = v34;
  v35 = *(float *)&v34 - a8;
  v36 = vmuls_lane_f32(v35, a5, 2);
  if (!a12)
    v36 = 0.0;
  v37 = a5.f32[3] + v36;
  v38 = vmulq_f32(a19, a19);
  v38.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).u64[0];
  v39 = v38.f32[0] != 0.0;
  v40 = (float)(a19.f32[3] + (float)(v35 * a5.f32[0])) * 0.5;
  v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 0);
  v41.i32[3] = 0;
  v42 = vrsqrteq_f32(v41);
  v43 = vmulq_f32(v42, vrsqrtsq_f32(v41, vmulq_f32(v42, v42)));
  v44 = vrsqrtsq_f32(v41, vmulq_f32(v43, v43));
  v45 = (uint16x4_t)vdup_n_s16(v39);
  if (a13 == 1)
    v46 = 0.0;
  else
    v46 = a17;
  v47 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16(v45), 0x1FuLL));
  v47.i32[3] = 0;
  v48 = (int8x16_t)vmulq_f32(v43, v44);
  v49 = (int8x16_t)vcltzq_s32(v47);
  __asm { FMOV            V3.4S, #1.0 }
  v62 = vmulq_f32((float32x4_t)vbslq_s8(v49, v48, _Q3), a19);
  if (!_ZF)
    v40 = 0.0;
  v55 = __sincosf_stret(v40);
  v56 = vmulq_n_f32(v62, v55.__sinval);
  v56.i32[3] = LODWORD(v55.__cosval);
  *a14 = v59;
  *a15 = v33;
  *a16 = v37;
  *a20 = v46;
  *a21 = v56;
}

void __vfx_script_comAppleRealitykitVfxGeneral_particleUpdate_12()
{
  vfx_script_get_iteration_range();
  vfx_script_get_arguments_buffer();
}

char **__vfx_get_script_table_comAppleRealitykitVfxGeneral()
{
  return &__vfx_get_script_table_comAppleRealitykitVfxGeneral::scriptTable;
}

void Spawn_comAppleVfxConfetti_graph_5(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;

  if (a2 >= a3)
    v4 = a3;
  else
    v4 = a2;
  if (a2 <= a3)
    v5 = a3;
  else
    v5 = a2;
  *a4 = v4;
  a4[1] = v5;
}

uint64_t __vfx_script_comAppleVfxConfetti_graph_5(uint64_t a1)
{
  uint64_t result;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  unsafe_script_context = a1;
  vfx_script_clock_time();
  vfx_script_clock_delta_time();
  result = vfx_script_get_arguments_buffer();
  v2 = *(_QWORD **)(result + 24);
  v3 = **(_QWORD **)(result + 8);
  v4 = **(_QWORD **)(result + 16);
  if (v3 >= v4)
    v5 = **(_QWORD **)(result + 16);
  else
    v5 = **(_QWORD **)(result + 8);
  if (v3 <= v4)
    v3 = **(_QWORD **)(result + 16);
  *v2 = v5;
  v2[1] = v3;
  return result;
}

uint64_t sub_249C3DC00()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6B0);
  sub_249C40CD4();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_249C41000;
  result = sub_249C40CB0();
  off_2578CE640 = (_UNKNOWN *)v0;
  return result;
}

id sub_249C3DC98()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3DD48((uint64_t)v1);
  v2 = sub_249C40C5C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    v4 = (void *)sub_249C40C44();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
  }
  return v4;
}

uint64_t sub_249C3DD48@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for comAppleVfxConfetti();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_249C40D04();
  v5 = (void *)sub_249C40D04();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_249C40C50();

    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

_QWORD *sub_249C3DE64()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_249C40C5C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  sub_249C3DD48((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_249C3E7DC((uint64_t)v2);
    v10 = (_QWORD *)sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v11 = 0xD00000000000001ALL;
    v11[1] = 0x8000000249C41840;
    (*(void (**)(_QWORD *, _QWORD, _QWORD *))(*(v10 - 1) + 104))(v11, *MEMORY[0x24BEBFA78], v10);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v10 = objc_allocWithZone((Class)sub_249C40CEC());
    v12 = sub_249C40CA4();
    if (!v0)
      v10 = (_QWORD *)v12;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

id sub_249C3E03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, (uint64_t (*)(void))sub_249C3DE64);
}

uint64_t sub_249C3E048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_249C40C5C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3DD48((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_249C3E7DC((uint64_t)v4);
    v9 = sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v10 = 0xD00000000000001ALL;
    v10[1] = 0x8000000249C41840;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v10, *MEMORY[0x24BEBFA78], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v11 = objc_msgSend(objc_allocWithZone((Class)sub_249C40CEC()), sel_init);
    v12 = sub_249C40CE0();
    if (!v0)
      v1 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  }
  return v1;
}

id sub_249C3E200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, sub_249C3E048);
}

id sub_249C3E20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return (id)a4();
}

id sub_249C3E27C()
{
  sub_249C3E7A4(0, &qword_2578CE6B8);
  return (id)sub_249C40D1C();
}

id sub_249C3E2B8()
{
  void *v0;

  sub_249C3E3F8();
  sub_249C3E7A4(0, &qword_2578CE6A8);
  v0 = (void *)sub_249C40CF8();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_249C3E320()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleVfxConfetti();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __vfx_get_effect_class_comAppleVfxConfetti()
{
  type metadata accessor for comAppleVfxConfetti();
  return swift_getObjCClassFromMetadata();
}

uint64_t __vfx_get_effect_class_comAppleVfxConfetti()()
{
  return type metadata accessor for comAppleVfxConfetti();
}

uint64_t type metadata accessor for comAppleVfxConfetti()
{
  uint64_t result;

  result = qword_2578CE658;
  if (!qword_2578CE658)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249C3E3B4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_249C3E3F0()
{
  return type metadata accessor for comAppleVfxConfetti();
}

uint64_t sub_249C3E3F8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  uint64_t v40;
  _QWORD *v41;

  v0 = sub_249C40CD4();
  v40 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2578CE638 != -1)
LABEL_29:
    swift_once();
  v3 = (char *)off_2578CE640;
  v4 = *((_QWORD *)off_2578CE640 + 2);
  if (v4)
  {
    v5 = (void *)objc_opt_self();
    v6 = &v3[(*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80)];
    v36 = *(_QWORD *)(v40 + 72);
    v38 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v39 = v5;
    v34 = v3;
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    v35 = v0;
    v37 = v2;
    while (1)
    {
      v10 = v7;
      v38(v2, v6, v0);
      swift_bridgeObjectRetain();
      v11 = sub_249C40CBC();
      v13 = v12;
      v14 = objc_msgSend(v39, sel_valueWithPointer_, sub_249C40CC8());
      if (!v14)
      {
        swift_bridgeObjectRetain();
        v24 = sub_249C40130(v11, v13);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v41 = v10;
          v7 = v10;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_249C40734();
            v7 = v41;
          }
          swift_bridgeObjectRelease();
          v28 = *(void **)(v7[7] + 8 * v24);
          sub_249C40480(v24, (uint64_t)v7);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v10;
        }
        goto LABEL_6;
      }
      v15 = v14;
      v16 = swift_isUniquelyReferenced_nonNull_native();
      v41 = v10;
      v2 = (char *)v10;
      v18 = sub_249C40130(v11, v13);
      v19 = v10[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v0 = v17;
      if (v10[3] >= v21)
      {
        if ((v16 & 1) != 0)
        {
          v7 = v41;
          if ((v17 & 1) == 0)
            goto LABEL_19;
        }
        else
        {
          v2 = (char *)&v41;
          sub_249C40734();
          v7 = v41;
          if ((v0 & 1) == 0)
            goto LABEL_19;
        }
      }
      else
      {
        sub_249C40194(v21, v16);
        v2 = (char *)v41;
        v22 = sub_249C40130(v11, v13);
        if ((v0 & 1) != (v23 & 1))
        {
          result = sub_249C40D58();
          __break(1u);
          return result;
        }
        v18 = v22;
        v7 = v41;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          v7[(v18 >> 6) + 8] |= 1 << v18;
          v29 = (uint64_t *)(v7[6] + 16 * v18);
          *v29 = v11;
          v29[1] = v13;
          *(_QWORD *)(v7[7] + 8 * v18) = v15;
          v30 = v7[2];
          v31 = __OFADD__(v30, 1);
          v32 = v30 + 1;
          if (v31)
            goto LABEL_28;
          v7[2] = v32;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      v8 = v7[7];
      v9 = *(void **)(v8 + 8 * v18);
      *(_QWORD *)(v8 + 8 * v18) = v15;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v0 = v35;
LABEL_6:
      v2 = v37;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v0);
      swift_bridgeObjectRelease();
      v6 += v36;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v7;
      }
    }
  }
  return MEMORY[0x24BEE4B00];
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD00F7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_249C3E7A4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_249C3E7DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_249C3E81C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578CE6C8;
  if (!qword_2578CE6C8)
  {
    v1 = sub_249C40C98();
    result = MEMORY[0x24BD00F88](MEMORY[0x24BEBFA88], v1);
    atomic_store(result, (unint64_t *)&qword_2578CE6C8);
  }
  return result;
}

void sub_249C3E868(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *v3;
  _DWORD *v4;
  _BYTE *v5;
  __int128 *v6;
  float32x4_t *v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  __float2 v11;
  float32x4_t v12;
  __int128 v13;
  float32x4_t v14;
  __int128 v15;

  qword_2578CE6D0 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6D8 = LODWORD(v1);
  sub_249C40C74();
  dword_2578CE6DC = v2;
  v3 = (_QWORD *)sub_249C40C8C();
  if (!v3[1])
  {
    __break(1u);
    goto LABEL_10;
  }
  v4 = (_DWORD *)v3[2];
  if (!v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = (_BYTE *)v3[3];
  if (!v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v6 = (__int128 *)v3[4];
  if (!v6)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v7 = (float32x4_t *)v3[5];
  if (!v7)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v15 = *v6;
  v8 = vrsqrteq_f32((float32x4_t)xmmword_249C40FC0);
  v9 = vmulq_f32(v8, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v8, v8)));
  v14 = vmulq_f32(vmulq_f32(v9, vrsqrtsq_f32((float32x4_t)xmmword_249C40FC0, vmulq_f32(v9, v9))), (float32x4_t)xmmword_249C40FD0);
  v10 = 1.5708;
  if (!*v5)
    v10 = 0.0;
  v11 = __sincosf_stret(v10);
  v12 = vmulq_n_f32(v14, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  LODWORD(v13) = v15;
  DWORD1(v13) = *v4;
  *v7 = v12;
  *((_QWORD *)&v13 + 1) = __PAIR64__(1.0, DWORD2(v15));
  *v6 = v13;
}

uint64_t sub_249C3E988()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6B0);
  sub_249C40CD4();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_249C410B0;
  sub_249C40CB0();
  sub_249C40CB0();
  sub_249C40CB0();
  sub_249C40CB0();
  result = sub_249C40CB0();
  off_2578CE6E0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_249C3EAE4(uint64_t a1)
{
  double v1;
  uint64_t result;
  int v3;
  _DWORD *v4;
  _DWORD *v5;

  qword_2578CE6E8 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6F0 = LODWORD(v1);
  result = qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_249C40C74();
  dword_2578CE6F4 = v3;
  result = qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = sub_249C40C8C();
  v4 = *(_DWORD **)(result + 8);
  if (!v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v5 = *(_DWORD **)(result + 16);
  if (!v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (qword_2578CE6E8)
  {
    *v5 = *v4;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_249C3EB6C(uint64_t a1)
{
  double v1;
  uint64_t result;
  int v3;
  _QWORD *v4;
  float *v5;
  float v6;
  float v7;

  qword_2578CE6E8 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6F0 = LODWORD(v1);
  result = qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_249C40C74();
  dword_2578CE6F4 = v3;
  result = qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = sub_249C40C8C();
  v4 = *(_QWORD **)(result + 8);
  if (!v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v5 = *(float **)(result + 16);
  if (!v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (qword_2578CE6E8)
  {
    v6 = COERCE_FLOAT(*v4) / 3.1416;
    v7 = COERCE_FLOAT(HIDWORD(*v4)) / 3.1416;
    *v5 = fminf(v6, v7);
    v5[1] = fmaxf(v6, v7);
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

_QWORD *sub_249C3EC14(uint64_t a1)
{
  double v1;
  _QWORD *result;
  int v3;
  _DWORD *v4;
  int *v5;
  _DWORD *v6;
  _DWORD *v7;
  int v8;

  qword_2578CE6E8 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6F0 = LODWORD(v1);
  result = (_QWORD *)qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
    __break(1u);
    goto LABEL_10;
  }
  sub_249C40C74();
  dword_2578CE6F4 = v3;
  result = (_QWORD *)qword_2578CE6E8;
  if (!qword_2578CE6E8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  result = (_QWORD *)sub_249C40C8C();
  v4 = (_DWORD *)result[1];
  if (!v4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = (int *)result[2];
  if (!v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v6 = (_DWORD *)result[3];
  if (!v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v7 = (_DWORD *)result[4];
  if (!v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (qword_2578CE6E8)
  {
    v8 = *v5;
    *v6 = *v4;
    *v7 = v8;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

float sub_249C3ECBC(uint64_t a1)
{
  double v1;
  int v2;
  float result;

  qword_2578CE6E8 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6F0 = LODWORD(v1);
  if (!qword_2578CE6E8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_249C40C74();
  dword_2578CE6F4 = v2;
  if (!qword_2578CE6E8)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
  }
  sub_249C40C80();
  if (!qword_2578CE6E8)
    goto LABEL_9;
  if (!*(_QWORD *)(sub_249C40C8C() + 8))
    goto LABEL_10;
  return result;
}

_QWORD *sub_249C3EDD0(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *result;

  qword_2578CE6E8 = a1;
  sub_249C40C68();
  *(float *)&v1 = v1;
  dword_2578CE6F0 = LODWORD(v1);
  if (!qword_2578CE6E8)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_249C40C74();
  dword_2578CE6F4 = v2;
  if (!qword_2578CE6E8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_249C40C80();
  if (!qword_2578CE6E8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = (_QWORD *)sub_249C40C8C();
  if (!result[1])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!result[2])
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!result[3])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!result[4])
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (!result[5])
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (!result[6])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (!result[7])
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!result[8])
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  if (!result[9])
    goto LABEL_25;
  return result;
}

id sub_249C3F018()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3F0C8((uint64_t)v2);
  v3 = sub_249C40C5C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    v5 = (void *)sub_249C40C44();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return v5;
}

uint64_t sub_249C3F0C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for comAppleSystemEnvironmentsRain();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_249C40D04();
  v5 = (void *)sub_249C40D04();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_249C40C50();

    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

_QWORD *sub_249C3F1E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_249C40C5C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  sub_249C3F0C8((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249C3E7DC((uint64_t)v3);
    v11 = (_QWORD *)sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v12 = 0xD000000000000026;
    v12[1] = 0x8000000249C419C0;
    (*(void (**)(_QWORD *, _QWORD, _QWORD *))(*(v11 - 1) + 104))(v12, *MEMORY[0x24BEBFA78], v11);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v11 = objc_allocWithZone((Class)sub_249C40CEC());
    v13 = sub_249C40CA4();
    if (!v0)
      v11 = (_QWORD *)v13;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v11;
}

id sub_249C3F3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, (uint64_t (*)(void))sub_249C3F1E4);
}

uint64_t sub_249C3F3C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_249C40C5C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3F0C8((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_249C3E7DC((uint64_t)v4);
    v9 = sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v10 = 0xD000000000000026;
    v10[1] = 0x8000000249C419C0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v10, *MEMORY[0x24BEBFA78], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v11 = objc_msgSend(objc_allocWithZone((Class)sub_249C40CEC()), sel_init);
    v12 = sub_249C40CE0();
    if (!v0)
      v1 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  }
  return v1;
}

id sub_249C3F580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, sub_249C3F3C8);
}

id sub_249C3F58C()
{
  sub_249C3E7A4(0, &qword_2578CE6B8);
  return (id)sub_249C40D1C();
}

id sub_249C3F5C8()
{
  void *v0;

  sub_249C3F6E4();
  sub_249C3E7A4(0, &qword_2578CE6A8);
  v0 = (void *)sub_249C40CF8();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_249C3F62C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleSystemEnvironmentsRain();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for comAppleSystemEnvironmentsRain()
{
  uint64_t result;

  result = qword_2578CE6F8;
  if (!qword_2578CE6F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249C3F6A0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_249C3F6DC()
{
  return type metadata accessor for comAppleSystemEnvironmentsRain();
}

uint64_t sub_249C3F6E4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  uint64_t v40;
  _QWORD *v41;

  v0 = sub_249C40CD4();
  v40 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2578CE648 != -1)
LABEL_29:
    swift_once();
  v3 = (char *)off_2578CE6E0;
  v4 = *((_QWORD *)off_2578CE6E0 + 2);
  if (v4)
  {
    v5 = (void *)objc_opt_self();
    v6 = &v3[(*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80)];
    v36 = *(_QWORD *)(v40 + 72);
    v38 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v39 = v5;
    v34 = v3;
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    v35 = v0;
    v37 = v2;
    while (1)
    {
      v10 = v7;
      v38(v2, v6, v0);
      swift_bridgeObjectRetain();
      v11 = sub_249C40CBC();
      v13 = v12;
      v14 = objc_msgSend(v39, sel_valueWithPointer_, sub_249C40CC8());
      if (!v14)
      {
        swift_bridgeObjectRetain();
        v24 = sub_249C40130(v11, v13);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v41 = v10;
          v7 = v10;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_249C40734();
            v7 = v41;
          }
          swift_bridgeObjectRelease();
          v28 = *(void **)(v7[7] + 8 * v24);
          sub_249C40480(v24, (uint64_t)v7);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v10;
        }
        goto LABEL_6;
      }
      v15 = v14;
      v16 = swift_isUniquelyReferenced_nonNull_native();
      v41 = v10;
      v2 = (char *)v10;
      v18 = sub_249C40130(v11, v13);
      v19 = v10[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v0 = v17;
      if (v10[3] >= v21)
      {
        if ((v16 & 1) != 0)
        {
          v7 = v41;
          if ((v17 & 1) == 0)
            goto LABEL_19;
        }
        else
        {
          v2 = (char *)&v41;
          sub_249C40734();
          v7 = v41;
          if ((v0 & 1) == 0)
            goto LABEL_19;
        }
      }
      else
      {
        sub_249C40194(v21, v16);
        v2 = (char *)v41;
        v22 = sub_249C40130(v11, v13);
        if ((v0 & 1) != (v23 & 1))
        {
          result = sub_249C40D58();
          __break(1u);
          return result;
        }
        v18 = v22;
        v7 = v41;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          v7[(v18 >> 6) + 8] |= 1 << v18;
          v29 = (uint64_t *)(v7[6] + 16 * v18);
          *v29 = v11;
          v29[1] = v13;
          *(_QWORD *)(v7[7] + 8 * v18) = v15;
          v30 = v7[2];
          v31 = __OFADD__(v30, 1);
          v32 = v30 + 1;
          if (v31)
            goto LABEL_28;
          v7[2] = v32;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      v8 = v7[7];
      v9 = *(void **)(v8 + 8 * v18);
      *(_QWORD *)(v8 + 8 * v18) = v15;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v0 = v35;
LABEL_6:
      v2 = v37;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v0);
      swift_bridgeObjectRelease();
      v6 += v36;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v7;
      }
    }
  }
  return MEMORY[0x24BEE4B00];
}

uint64_t type metadata accessor for comAppleVfxPrivateRemoteEdition()
{
  uint64_t result;

  result = qword_2578CE750;
  if (!qword_2578CE750)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249C3FA8C()
{
  return swift_initClassMetadata2();
}

void sub_249C3FAC8()
{
  off_2578CE748 = (_UNKNOWN *)MEMORY[0x24BEE4AF8];
}

id sub_249C3FADC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3FB8C((uint64_t)v2);
  v3 = sub_249C40C5C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    v5 = (void *)sub_249C40C44();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return v5;
}

uint64_t sub_249C3FB8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for comAppleVfxPrivateRemoteEdition();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_249C40D04();
  v5 = (void *)sub_249C40D04();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_249C40C50();

    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_249C40C5C();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

_QWORD *sub_249C3FCA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_249C40C5C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  sub_249C3FB8C((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249C3E7DC((uint64_t)v3);
    v11 = (_QWORD *)sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v12 = 0xD000000000000027;
    v12[1] = 0x8000000249C41A20;
    (*(void (**)(_QWORD *, _QWORD, _QWORD *))(*(v11 - 1) + 104))(v12, *MEMORY[0x24BEBFA78], v11);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v11 = objc_allocWithZone((Class)sub_249C40CEC());
    v13 = sub_249C40CA4();
    if (!v0)
      v11 = (_QWORD *)v13;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v11;
}

id sub_249C3FE80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, (uint64_t (*)(void))sub_249C3FCA8);
}

uint64_t sub_249C3FE8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE6C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_249C40C5C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249C3FB8C((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_249C3E7DC((uint64_t)v4);
    v9 = sub_249C40C98();
    sub_249C3E81C();
    swift_allocError();
    *v10 = 0xD000000000000027;
    v10[1] = 0x8000000249C41A20;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v10, *MEMORY[0x24BEBFA78], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v11 = objc_msgSend(objc_allocWithZone((Class)sub_249C40CEC()), sel_init);
    v12 = sub_249C40CE0();
    if (!v0)
      v1 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  }
  return v1;
}

id sub_249C40044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249C3E20C(a1, a2, a3, sub_249C3FE8C);
}

id sub_249C40050()
{
  sub_249C3E7A4(0, &qword_2578CE6B8);
  return (id)sub_249C40D1C();
}

id sub_249C4008C()
{
  void *v0;

  sub_249C408CC();
  sub_249C3E7A4(0, &qword_2578CE6A8);
  v0 = (void *)sub_249C40CF8();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_249C400F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleVfxPrivateRemoteEdition();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_249C40128()
{
  return type metadata accessor for comAppleVfxPrivateRemoteEdition();
}

unint64_t sub_249C40130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_249C40D64();
  sub_249C40D10();
  v4 = sub_249C40D70();
  return sub_249C40654(a1, a2, v4);
}

uint64_t sub_249C40194(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE7A0);
  v38 = a2;
  v6 = sub_249C40D40();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v36;
        if ((v38 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v37 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v30 = v29;
    }
    sub_249C40D64();
    sub_249C40D10();
    result = sub_249C40D70();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v33 = v17 == v32;
        if (v17 == v32)
          v17 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_249C40480(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_249C40D28();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_249C40D64();
        swift_bridgeObjectRetain();
        sub_249C40D10();
        v9 = sub_249C40D70();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_249C40654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_249C40D4C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_249C40D4C() & 1) == 0);
    }
  }
  return v6;
}

id sub_249C40734()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578CE7A0);
  v2 = *v0;
  v3 = sub_249C40D34();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_249C408CC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  uint64_t v40;
  _QWORD *v41;

  v0 = sub_249C40CD4();
  v40 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2578CE650 != -1)
LABEL_29:
    swift_once();
  v3 = (char *)off_2578CE748;
  v4 = *((_QWORD *)off_2578CE748 + 2);
  if (v4)
  {
    v5 = (void *)objc_opt_self();
    v6 = &v3[(*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80)];
    v36 = *(_QWORD *)(v40 + 72);
    v38 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v39 = v5;
    v34 = v3;
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    v35 = v0;
    v37 = v2;
    while (1)
    {
      v10 = v7;
      v38(v2, v6, v0);
      swift_bridgeObjectRetain();
      v11 = sub_249C40CBC();
      v13 = v12;
      v14 = objc_msgSend(v39, sel_valueWithPointer_, sub_249C40CC8());
      if (!v14)
      {
        swift_bridgeObjectRetain();
        v24 = sub_249C40130(v11, v13);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v41 = v10;
          v7 = v10;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_249C40734();
            v7 = v41;
          }
          swift_bridgeObjectRelease();
          v28 = *(void **)(v7[7] + 8 * v24);
          sub_249C40480(v24, (uint64_t)v7);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v10;
        }
        goto LABEL_6;
      }
      v15 = v14;
      v16 = swift_isUniquelyReferenced_nonNull_native();
      v41 = v10;
      v2 = (char *)v10;
      v18 = sub_249C40130(v11, v13);
      v19 = v10[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v0 = v17;
      if (v10[3] >= v21)
      {
        if ((v16 & 1) != 0)
        {
          v7 = v41;
          if ((v17 & 1) == 0)
            goto LABEL_19;
        }
        else
        {
          v2 = (char *)&v41;
          sub_249C40734();
          v7 = v41;
          if ((v0 & 1) == 0)
            goto LABEL_19;
        }
      }
      else
      {
        sub_249C40194(v21, v16);
        v2 = (char *)v41;
        v22 = sub_249C40130(v11, v13);
        if ((v0 & 1) != (v23 & 1))
        {
          sub_249C40D58();
          __break(1u);
          return sub_249C40C38();
        }
        v18 = v22;
        v7 = v41;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          v7[(v18 >> 6) + 8] |= 1 << v18;
          v29 = (uint64_t *)(v7[6] + 16 * v18);
          *v29 = v11;
          v29[1] = v13;
          *(_QWORD *)(v7[7] + 8 * v18) = v15;
          v30 = v7[2];
          v31 = __OFADD__(v30, 1);
          v32 = v30 + 1;
          if (v31)
            goto LABEL_28;
          v7[2] = v32;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      v8 = v7[7];
      v9 = *(void **)(v8 + 8 * v18);
      *(_QWORD *)(v8 + 8 * v18) = v15;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v0 = v35;
LABEL_6:
      v2 = v37;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v0);
      swift_bridgeObjectRelease();
      v6 += v36;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v7;
      }
    }
  }
  return MEMORY[0x24BEE4B00];
}

uint64_t sub_249C40C38()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_249C40C44()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_249C40C50()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_249C40C5C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_249C40C68()
{
  return MEMORY[0x24BEBFA28]();
}

uint64_t sub_249C40C74()
{
  return MEMORY[0x24BEBFA50]();
}

uint64_t sub_249C40C80()
{
  return MEMORY[0x24BEBFA68]();
}

uint64_t sub_249C40C8C()
{
  return MEMORY[0x24BEBFA70]();
}

uint64_t sub_249C40C98()
{
  return MEMORY[0x24BEBFA80]();
}

uint64_t sub_249C40CA4()
{
  return MEMORY[0x24BEBFA90]();
}

uint64_t sub_249C40CB0()
{
  return MEMORY[0x24BEBFAA0]();
}

uint64_t sub_249C40CBC()
{
  return MEMORY[0x24BEBFAA8]();
}

uint64_t sub_249C40CC8()
{
  return MEMORY[0x24BEBFAB0]();
}

uint64_t sub_249C40CD4()
{
  return MEMORY[0x24BEBFAB8]();
}

uint64_t sub_249C40CE0()
{
  return MEMORY[0x24BEBFAF0]();
}

uint64_t sub_249C40CEC()
{
  return MEMORY[0x24BEBFB00]();
}

uint64_t sub_249C40CF8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_249C40D04()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_249C40D10()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_249C40D1C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_249C40D28()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_249C40D34()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_249C40D40()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_249C40D4C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_249C40D58()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_249C40D64()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_249C40D70()
{
  return MEMORY[0x24BEE4328]();
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t vfx_script_clock_delta_time()
{
  return MEMORY[0x24BEBFB60]();
}

uint64_t vfx_script_clock_simulation_index()
{
  return MEMORY[0x24BEBFB68]();
}

uint64_t vfx_script_clock_time()
{
  return MEMORY[0x24BEBFB70]();
}

uint64_t vfx_script_get_arguments_buffer()
{
  return MEMORY[0x24BEBFBA8]();
}

