@implementation PTPrecomputeRandom

+ (PTUnitDisk)computeUnitDiskPoints:numberOfPatternCircles:
{
  void *v0;
  int v1;
  int v2;
  id v3;
  float v5;
  int v6;
  double v7;
  int v8;
  float v9;
  int v10;
  double v11;
  double v12;
  _WORD *v13;
  float v14;
  __float2 v15;
  void *v21;
  uint64_t v22;
  unint64_t v24;
  MTLBuffer *v25;
  _DWORD v26[94];
  uint64_t v27;
  PTUnitDisk result;

  v2 = v1;
  v27 = *MEMORY[0x1E0C80C00];
  v3 = v0;
  v26[0] = 0;
  if (v2 < 1)
  {
    v6 = 1;
  }
  else
  {
    v5 = 0.0;
    v6 = 1;
    v7 = 1.0;
    v8 = 1;
    do
    {
      _D0 = round(3.14159265 / asin(v7 / ((float)v8 + (float)v8)));
      v9 = _D0;
      if (v9 > 0.0)
      {
        v10 = 0;
        if ((v8 & 1) != 0)
          v11 = -1.0;
        else
          v11 = v7;
        v12 = v5;
        v13 = (_WORD *)&v26[v6] + 1;
        v14 = (float)v8 / (float)v2;
        do
        {
          v5 = v12 + (double)v10 * 6.28318531 / v9 * v11;
          v15 = __sincosf_stret(v5);
          _S1 = v14 * v15.__cosval;
          __asm { FCVT            H1, S1 }
          *(v13 - 1) = LOWORD(_S1);
          *(float *)&_D0 = v14 * v15.__sinval;
          __asm { FCVT            H0, S0 }
          *v13 = LOWORD(_D0);
          *(float *)&_D0 = (float)++v10;
          v13 += 2;
        }
        while ((float)v10 < v9);
        v6 += v10;
        v7 = 1.0;
      }
    }
    while (v8++ != v2);
  }
  objc_msgSend(v3, "device", _D0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "newBufferWithBytes:length:options:", v26, 4 * v6, 0);

  _D0 = 0.5 / (double)v2;
  __asm { FCVT            H0, D0 }
  v24 = v6 | ((unint64_t)LOWORD(_D0) << 32);
  v25 = (MTLBuffer *)v22;
  result.rayCount = v24;
  result.xy = v25;
  return result;
}

+ (id)computeRandomUChars:(id)a3 rayCount:(int)a4
{
  id v5;
  uint64_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  PTRandom *v17;
  PTRandom *v18;
  unint64_t v19;
  signed int v20;
  char v21;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0;
  v7 = (int32x4_t)xmmword_1C9343720;
  v8 = (int32x4_t)xmmword_1C9343730;
  v9 = (int32x4_t)xmmword_1C9343740;
  v10 = (int32x4_t)xmmword_1C9343750;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = vdupq_n_s32(a4);
  v26 = 0u;
  v27 = 0u;
  v12.i64[0] = 0x1000000010;
  v12.i64[1] = 0x1000000010;
  do
  {
    v13 = vmulq_s32(v10, v11);
    v14 = vmulq_s32(v9, v11);
    v15 = vmulq_s32(v8, v11);
    v16 = vmulq_s32(v7, v11);
    *(uint16x4_t *)v13.i8 = vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v13, (uint32x4_t)vcltzq_s32(v13), 0x19uLL)), 7uLL);
    v13.u64[1] = (unint64_t)vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v14, (uint32x4_t)vcltzq_s32(v14), 0x19uLL)), 7uLL);
    *(uint16x4_t *)v14.i8 = vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v15, (uint32x4_t)vcltzq_s32(v15), 0x19uLL)), 7uLL);
    v14.u64[1] = (unint64_t)vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v16, (uint32x4_t)vcltzq_s32(v16), 0x19uLL)), 7uLL);
    *(__int128 *)((char *)&v26 + v6) = (__int128)vuzp1q_s8((int8x16_t)v13, (int8x16_t)v14);
    v6 += 16;
    v10 = vaddq_s32(v10, v12);
    v9 = vaddq_s32(v9, v12);
    v8 = vaddq_s32(v8, v12);
    v7 = vaddq_s32(v7, v12);
  }
  while (v6 != 128);
  v17 = [PTRandom alloc];
  v18 = -[PTRandom initWithSeed:](v17, "initWithSeed:", 0x7FFFFFFFLL, v26, v27, v28, v29, v30, v31, v32, v33);
  v19 = 127;
  do
  {
    v20 = -[PTRandom nextUint:](v18, "nextUint:", v19);
    v21 = *((_BYTE *)&v26 + v19);
    *((_BYTE *)&v26 + v19) = *((_BYTE *)&v26 + v20);
    *((_BYTE *)&v26 + v20) = v21;
  }
  while (v19-- > 1);
  objc_msgSend(v5, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "newBufferWithBytes:length:options:", &v26, 128, 0);

  return v24;
}

+ (id)computeGaussian:(id)a3 sideLength:(int)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  PTRandom *v9;
  _WORD *v10;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];

  v5 = a3;
  LODWORD(v6) = a4 * a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (2 * a4 * a4));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "bytes");
  v9 = -[PTRandom initWithSeed:]([PTRandom alloc], "initWithSeed:", 2354123123);
  if (a4)
  {
    if (v6 <= 1)
      v6 = 1;
    else
      v6 = v6;
    v10 = (_WORD *)v8;
    do
    {
      -[PTRandom nextGauss](v9, "nextGauss");
      __asm { FCVT            H0, D0 }
      *v10++ = _D0;
      --v6;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, a4, a4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUsage:", 1);
  objc_msgSend(v5, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newTextureWithDescriptor:", v16);

  memset(v20, 0, 24);
  v20[3] = a4;
  v20[4] = a4;
  v20[5] = 1;
  objc_msgSend(v18, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v20, 0, v8, 2 * a4);

  return v18;
}

@end
