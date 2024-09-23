TXRImageIndependent *newScaledImageWithLancosFilter(void *a1, void *a2, uint64_t a3, _QWORD *a4, __n128 a5)
{
  id v8;
  id v9;
  unsigned int v10;
  const __CFString *v11;
  uint64_t v12;
  TXRImageIndependent *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int32x2_t v23;
  __int128 v24;
  int8x8_t v25;
  int8x8_t v26;
  int8x8_t v27;
  uint64_t v28;
  vImage_Error v29;
  uint64_t v31;
  TXRDefaultBufferAllocator *v32;
  id v33;
  void *v34;
  vImage_Flags flags;
  void *v36;
  int8x8_t v37;
  vImage_Buffer src;
  vImage_Buffer dest;

  v8 = a1;
  v9 = a2;
  objc_msgSend(v8, "dimensions");
  if (v10 < 2)
  {
    if (+[TXRPixelFormatInfo isCompressed:](TXRPixelFormatInfo, "isCompressed:", objc_msgSend(v8, "pixelFormat")))
    {
      if (a4)
      {
        v11 = CFSTR("Cannot scale image with pixel format");
        v12 = 8;
        goto LABEL_7;
      }
LABEL_8:
      v13 = 0;
      goto LABEL_19;
    }
    if (a3)
    {
      if (a3 != 1)
        newScaledImageWithLancosFilter_cold_1();
      flags = 32;
    }
    else
    {
      flags = 0;
    }
    v14 = +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:](TXRPixelFormatInfo, "packedMemoryLayoutForFormat:dimensions:", objc_msgSend(v8, "pixelFormat"), a5.n128_f64[0]);
    v16 = v15;
    v17 = (void *)objc_msgSend(v9, "newBufferWithLength:", v15);
    objc_msgSend(v17, "map");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v36, "bytes");
    objc_msgSend(v8, "buffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "map");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "bytes");
    v22 = objc_msgSend(v8, "offset");
    dest.data = v18;
    v23 = vrev64_s32((int32x2_t)a5.n128_u64[0]);
    *(_QWORD *)&v24 = v23.u32[0];
    *((_QWORD *)&v24 + 1) = v23.u32[1];
    *(_OWORD *)&dest.height = v24;
    dest.rowBytes = v14;
    src.data = (void *)(v21 + v22);
    objc_msgSend(v8, "dimensions");
    v37 = v25;
    objc_msgSend(v8, "dimensions");
    v27 = vext_s8(v37, v26, 4uLL);
    *(_QWORD *)&v24 = v27.u32[0];
    *((_QWORD *)&v24 + 1) = v27.u32[1];
    *(_OWORD *)&src.height = v24;
    src.rowBytes = objc_msgSend(v8, "bytesPerRow");
    v28 = objc_msgSend(v8, "pixelFormat");
    if (v28 == 80 || v28 == 70)
    {
      v29 = vImageScale_ARGB8888(&src, &dest, 0, flags);
    }
    else if (objc_msgSend(v8, "pixelFormat") == 110)
    {
      v29 = vImageScale_ARGB16U(&src, &dest, 0, flags);
    }
    else if (objc_msgSend(v8, "pixelFormat") == 112)
    {
      v29 = vImageScale_ARGB16S(&src, &dest, 0, flags);
    }
    else if (objc_msgSend(v8, "pixelFormat") == 125)
    {
      v29 = vImageScale_ARGBFFFF(&src, &dest, 0, flags);
    }
    else if (objc_msgSend(v8, "pixelFormat") == 55)
    {
      v29 = vImageScale_PlanarF(&src, &dest, 0, flags);
    }
    else
    {
      v31 = objc_msgSend(v8, "pixelFormat");
      if (v31 != 10 && v31 != 1)
      {
        v32 = objc_alloc_init(TXRDefaultBufferAllocator);
        v33 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:", v8, 125, v32, 0, 1, a4);
        newScaledImageWithLancosFilter(v33, v9, a3, a4, a5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:", v34, objc_msgSend(v8, "pixelFormat"), v9, 0, 1, a4);
LABEL_18:

        goto LABEL_19;
      }
      v29 = vImageScale_Planar8(&src, &dest, 0, flags);
    }
    if (v29)
      newScaledImageWithLancosFilter_cold_2();
    v13 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:]([TXRImageIndependent alloc], "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", objc_msgSend(v8, "pixelFormat"), objc_msgSend(v8, "alphaInfo"), v14, v16, v17, 0, a5.n128_f64[0]);
    goto LABEL_18;
  }
  if (!a4)
    goto LABEL_8;
  v11 = CFSTR("Mipmap Generation of 3D textures not suppoted");
  v12 = 0;
LABEL_7:
  _newTXRErrorWithCodeAndErrorString(v12, (uint64_t)v11);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v13;
}

id _newTXRErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("TXRErrorKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TXRErrorDomain"), a1, v3);

  return v4;
}

id _newTXRErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:code:userInfo:", CFSTR("TXRErrorDomain"), a1, v4);

  return v5;
}

id _newTXRErrorWithCode(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TXRErrorDomain"), a1, 0);
}

uint64_t fastConvert(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *__dst, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a1)
  {
    if (a2)
      return fastConvertWithOptions<true,true>(a3, a4, a5, __dst, a7, a8, a9, a10);
    else
      return fastConvertWithOptions<true,false>(a3, a4, a5, __dst, a7, a8, a9, a10);
  }
  else if (a2)
  {
    return fastConvertWithOptions<false,true>(a3, a4, a5, (int)__dst, a7, a8, a9, a10);
  }
  else
  {
    return fastConvertWithOptions<false,false>(a3, a4, a5, __dst, a7, a8, a9, a10);
  }
}

#error "1D41A5D48: too big function (funcsize=0)"

#error "1D41D0060: too big function (funcsize=0)"

#error "1D41EFE5C: too big function (funcsize=0)"

#error "1D4216B6C: too big function (funcsize=0)"

float convertFromFloat4Fast<(TXRPixelFormat)71,true>(uint64_t a1, float32x4_t a2)
{
  float32x4_t v8;
  float v9;
  long double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  long double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  long double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  long double v25;
  double v26;
  float v27;
  float result;
  float32x4_t v29;

  __asm { FMOV            V1.4S, #1.0 }
  v8 = vminnmq_f32(vmaxnmq_f32(a2, (float32x4_t)0), _Q1);
  v9 = -v8.f32[0];
  if (v8.f32[0] >= 0.0)
    v9 = v8.f32[0];
  v10 = v9;
  v29 = v8;
  if (v10 <= 0.003131)
  {
    v11 = v10 * 12.92;
  }
  else
  {
    v11 = pow(v10, 0.416666667) * 1.055 + -0.055;
    v8 = v29;
  }
  v12 = v11;
  if (v8.f32[0] < 0.0)
    v12 = -v12;
  **(_BYTE **)a1 = (int)(float)(v12 * 255.0);
  v13 = v8.f32[1];
  v14 = -v8.f32[1];
  if (v8.f32[1] >= 0.0)
    v14 = v8.f32[1];
  v15 = v14;
  if (v15 <= 0.003131)
  {
    v16 = v15 * 12.92;
  }
  else
  {
    v16 = pow(v15, 0.416666667) * 1.055 + -0.055;
    v8.i64[1] = v29.i64[1];
  }
  v17 = v16;
  if (v13 < 0.0)
    v17 = -v17;
  *(_BYTE *)(*(_QWORD *)a1 + 1) = (int)(float)(v17 * 255.0);
  v18 = v8.f32[2];
  v19 = -v8.f32[2];
  if (v8.f32[2] >= 0.0)
    v19 = v8.f32[2];
  v20 = v19;
  if (v20 <= 0.003131)
  {
    v21 = v20 * 12.92;
  }
  else
  {
    v21 = pow(v20, 0.416666667) * 1.055 + -0.055;
    v8.i32[3] = v29.i32[3];
  }
  v22 = v21;
  if (v18 < 0.0)
    v22 = -v22;
  *(_BYTE *)(*(_QWORD *)a1 + 2) = (int)(float)(v22 * 255.0);
  v23 = v8.f32[3];
  v24 = -v8.f32[3];
  if (v8.f32[3] >= 0.0)
    v24 = v8.f32[3];
  v25 = v24;
  if (v25 <= 0.003131)
    v26 = v25 * 12.92;
  else
    v26 = pow(v25, 0.416666667) * 1.055 + -0.055;
  v27 = v26;
  if (v23 < 0.0)
    v27 = -v27;
  result = v27 * 255.0;
  *(_BYTE *)(*(_QWORD *)a1 + 3) = (int)result;
  *(_QWORD *)a1 += 4;
  return result;
}

float convertFromFloat4Fast<(TXRPixelFormat)81,true>(uint64_t a1, float32x4_t a2)
{
  float32x4_t v8;
  float v9;
  float v10;
  long double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  long double v16;
  double v17;
  float v18;
  float v19;
  long double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  long double v25;
  double v26;
  float v27;
  float result;
  float32x4_t v29;

  __asm { FMOV            V1.4S, #1.0 }
  v8 = vminnmq_f32(vmaxnmq_f32(a2, (float32x4_t)0), _Q1);
  v9 = v8.f32[2];
  v10 = -v8.f32[2];
  if (v8.f32[2] >= 0.0)
    v10 = v8.f32[2];
  v11 = v10;
  v29 = v8;
  if (v11 <= 0.003131)
  {
    v12 = v11 * 12.92;
  }
  else
  {
    v12 = pow(v11, 0.416666667) * 1.055 + -0.055;
    v8 = v29;
  }
  v13 = v12;
  if (v9 < 0.0)
    v13 = -v13;
  **(_BYTE **)a1 = (int)(float)(v13 * 255.0);
  v14 = v8.f32[1];
  v15 = -v8.f32[1];
  if (v8.f32[1] >= 0.0)
    v15 = v8.f32[1];
  v16 = v15;
  if (v16 <= 0.003131)
  {
    v17 = v16 * 12.92;
  }
  else
  {
    v17 = pow(v16, 0.416666667) * 1.055 + -0.055;
    v8 = v29;
  }
  v18 = v17;
  if (v14 < 0.0)
    v18 = -v18;
  *(_BYTE *)(*(_QWORD *)a1 + 1) = (int)(float)(v18 * 255.0);
  v19 = -v8.f32[0];
  if (v8.f32[0] >= 0.0)
    v19 = v8.f32[0];
  v20 = v19;
  if (v20 <= 0.003131)
  {
    v21 = v20 * 12.92;
  }
  else
  {
    v21 = pow(v20, 0.416666667) * 1.055 + -0.055;
    v8 = v29;
  }
  v22 = v21;
  if (v8.f32[0] < 0.0)
    v22 = -v22;
  *(_BYTE *)(*(_QWORD *)a1 + 2) = (int)(float)(v22 * 255.0);
  v23 = v8.f32[3];
  v24 = -v8.f32[3];
  if (v8.f32[3] >= 0.0)
    v24 = v8.f32[3];
  v25 = v24;
  if (v25 <= 0.003131)
    v26 = v25 * 12.92;
  else
    v26 = pow(v25, 0.416666667) * 1.055 + -0.055;
  v27 = v26;
  if (v23 < 0.0)
    v27 = -v27;
  result = v27 * 255.0;
  *(_BYTE *)(*(_QWORD *)a1 + 3) = (int)result;
  *(_QWORD *)a1 += 4;
  return result;
}

uint64_t RGBFloat32ToShareExponent32(int8x16_t a1)
{
  float v1;
  float v2;
  float32x2_t v3;
  float32x2_t v4;
  int8x8_t v5;
  float v6;
  float v7;
  int v8;
  double v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint32x2_t v18;
  int32x2_t v19;
  float32x2_t v21;

  v1 = 65408.0;
  if (*(float *)a1.i32 < 65408.0)
    v1 = *(float *)a1.i32;
  if (*(float *)a1.i32 <= 0.0)
    v2 = 0.0;
  else
    v2 = v1;
  v3 = (float32x2_t)vext_s8(*(int8x8_t *)a1.i8, (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL);
  v4 = (float32x2_t)vdup_n_s32(0x477F8000u);
  v5 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v3, v4), (int8x8_t)v4, (int8x8_t)v3), (int8x8_t)vcgtz_f32(v3));
  v6 = *(float *)&v5.i32[1];
  v21 = (float32x2_t)v5;
  if (*(float *)v5.i32 >= *(float *)&v5.i32[1])
    v6 = *(float *)v5.i32;
  if (v6 <= v2)
    v7 = v2;
  else
    v7 = v6;
  if ((LODWORD(v7) >> 23) - 127 <= 0xFFFFFFF0)
    v8 = -16;
  else
    v8 = (LODWORD(v7) >> 23) - 127;
  v9 = exp2((double)(v8 - 8));
  v10 = vcvtmd_s64_f64(v7 / v9 + 0.5);
  if (v10 == 512)
  {
    v9 = v9 + v9;
    v11 = v8 + 17;
  }
  else
  {
    if (v10 >= 0x200)
      RGBFloat32ToShareExponent32();
    v11 = v8 + 16;
  }
  v12 = vcvtmd_s64_f64(v2 / v9 + 0.5);
  if (v12 >= 0x200)
    RGBFloat32ToShareExponent32();
  __asm { FMOV            V1.2D, #0.5 }
  v18 = (uint32x2_t)vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v21), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v9, 0)), _Q1))));
  if (v18.i32[0] >= 0x200u)
    RGBFloat32ToShareExponent32();
  if (v18.i32[1] >= 0x200u)
    RGBFloat32ToShareExponent32();
  v19 = (int32x2_t)vand_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0x1200000009), (int8x8_t)0x7FC00000003FE00);
  return vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] | (v11 << 27) | v12;
}

BOOL writeContentsJsonAtPath(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = a1;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@/Contents.json"), v6);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", v8, 0);
  objc_msgSend(v9, "open");
  v10 = objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", v7, v9, 1, a3);

  objc_msgSend(v9, "close");
  return v10 != 0;
}

uint64_t pixelBytes(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (a1 <= 551)
  {
    v1 = a1 - 1;
    result = 1;
    switch(v1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        return result;
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 39:
      case 40:
      case 41:
      case 42:
        return 2;
      case 52:
      case 53:
      case 54:
      case 59:
      case 61:
      case 62:
      case 63:
      case 64:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 79:
      case 80:
      case 89:
      case 90:
      case 91:
      case 92:
        return 4;
      case 102:
      case 103:
      case 104:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
        return 8;
      case 122:
      case 123:
      case 124:
        return 16;
      default:
        goto LABEL_11;
    }
  }
  if ((unint64_t)(a1 - 552) < 2)
    return 8;
  if ((unint64_t)(a1 - 554) < 2)
    return 4;
  if ((unint64_t)(a1 - 2147483649) >= 2)
LABEL_11:
    pixelBytes_cold_1();
  return 3;
}

uint64_t componentsPerPixel(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (a1 <= 551)
  {
    v1 = a1 - 1;
    result = 1;
    switch(v1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 52:
      case 53:
      case 54:
        return result;
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 59:
      case 61:
      case 62:
      case 63:
      case 64:
      case 102:
      case 103:
      case 104:
        return 2;
      case 39:
      case 91:
      case 92:
        return 3;
      case 40:
      case 41:
      case 42:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 79:
      case 80:
      case 89:
      case 90:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
      case 122:
      case 123:
      case 124:
        return 4;
      default:
        goto LABEL_9;
    }
  }
  if ((unint64_t)(a1 - 552) < 2)
    return 4;
  if ((unint64_t)(a1 - 554) >= 2 && (unint64_t)(a1 - 2147483649) >= 2)
LABEL_9:
    componentsPerPixel_cold_1();
  return 3;
}

uint64_t isSRGB(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if (a1 <= 552)
  {
    if (((unint64_t)(a1 - 150) > 0x32 || ((1 << (a1 + 106)) & 0x7FDF2A002A809) == 0)
      && ((unint64_t)(a1 - 81) > 0x36 || ((1 << (a1 - 81)) & 0x54100400001801) == 0))
    {
      v3 = a1 - 11;
      if (v3 > 0x3C || ((1 << v3) & 0x1040100000104001) == 0)
        return 0;
    }
  }
  else
  {
    if (a1 <= 2147483669)
    {
      if (a1 == 553 || a1 == 555)
        return result;
      return 0;
    }
    if (a1 != 2147483670 && a1 != 2147483686)
      return 0;
  }
  return result;
}

uint64_t pixelBytes_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (a1 <= 551)
  {
    v1 = a1 - 1;
    result = 1;
    switch(v1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        return result;
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 39:
      case 40:
      case 41:
      case 42:
        return 2;
      case 52:
      case 53:
      case 54:
      case 59:
      case 61:
      case 62:
      case 63:
      case 64:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 79:
      case 80:
      case 89:
      case 90:
      case 91:
      case 92:
        return 4;
      case 102:
      case 103:
      case 104:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
        return 8;
      case 122:
      case 123:
      case 124:
        return 16;
      default:
        goto LABEL_11;
    }
  }
  if ((unint64_t)(a1 - 552) < 2)
    return 8;
  if ((unint64_t)(a1 - 554) < 2)
    return 4;
  if ((unint64_t)(a1 - 2147483649) >= 2)
LABEL_11:
    pixelBytes_cold_1();
  return 3;
}

uint64_t isGammaEncoded(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if (a1 <= 152)
  {
    if ((unint64_t)(a1 - 81) > 0x36 || ((1 << (a1 - 81)) & 0x54000000000001) == 0)
    {
      v3 = a1 - 11;
      if (v3 > 0x3C || ((1 << v3) & 0x1000000000100001) == 0)
        return 0;
    }
  }
  else if (((unint64_t)(a1 - 153) > 0x2F || ((1 << (a1 + 103)) & 0xFFBE54005501) == 0)
         && a1 != 553
         && a1 != 555)
  {
    return 0;
  }
  return result;
}

unint64_t getMemoryLayout(uint64_t a1, float a2)
{
  BOOL v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  v2 = (unint64_t)(a1 - 130) > 0xD || ((1 << (a1 + 126)) & 0x3C3F) == 0;
  if (!v2 || (unint64_t)(a1 - 150) < 4 || (a1 & 0xFFFFFFFFFFFFFFF8) == 0xA0)
  {
LABEL_5:
    v3 = 17040392;
    switch(a1)
    {
      case 130:
      case 131:
      case 140:
      case 141:
      case 162:
      case 163:
      case 166:
      case 167:
      case 170:
      case 172:
      case 180:
      case 181:
      case 182:
      case 183:
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 132:
      case 133:
      case 134:
      case 135:
      case 142:
      case 143:
      case 150:
      case 151:
      case 152:
      case 153:
      case 174:
      case 176:
      case 178:
      case 179:
      case 186:
      case 204:
        v3 = 17040400;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 160:
      case 161:
      case 164:
      case 165:
        goto LABEL_26;
      case 187:
      case 205:
        v3 = 17040656;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 188:
      case 206:
        v3 = 17106192;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 189:
      case 207:
        v3 = 17106448;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 190:
      case 208:
        v3 = 17171984;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 192:
      case 210:
        v3 = 17106960;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 193:
      case 211:
        v5 = 17171984;
        goto LABEL_15;
      case 194:
      case 212:
        v3 = 17303568;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 195:
      case 213:
        v3 = 17104912;
        return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
      case 196:
      case 214:
        v3 = 17171984;
LABEL_26:
        v3 += 1024;
        break;
      case 197:
      case 215:
        v3 = 17304080;
        break;
      case 198:
      case 216:
        v3 = 17435152;
        break;
      case 199:
      case 217:
        v5 = 17435152;
LABEL_15:
        v3 = v5 + 512;
        break;
      case 200:
      case 218:
        v3 = 17566736;
        break;
      default:
        +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:].cold.1();
    }
    return (LODWORD(a2) + ((v3 >> 8) & 0xF) - 1) / ((v3 >> 8) & 0xF) * (unint64_t)(v3 & 0x18);
  }
  else
  {
    if (a1 <= 551)
    {
      v4 = 1;
      switch(a1)
      {
        case 1:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
          return v4 * (unint64_t)LODWORD(a2);
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 40:
        case 41:
        case 42:
        case 43:
          v4 = 2;
          return v4 * (unint64_t)LODWORD(a2);
        case 53:
        case 54:
        case 55:
        case 60:
        case 62:
        case 63:
        case 64:
        case 65:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 80:
        case 81:
        case 90:
        case 91:
        case 92:
        case 93:
          goto LABEL_11;
        case 103:
        case 104:
        case 105:
        case 110:
        case 112:
        case 113:
        case 114:
        case 115:
          goto LABEL_34;
        case 123:
        case 124:
        case 125:
          v4 = 16;
          return v4 * (unint64_t)LODWORD(a2);
        case 170:
        case 172:
        case 174:
        case 176:
        case 178:
        case 179:
        case 180:
        case 181:
        case 182:
        case 183:
        case 186:
        case 187:
        case 188:
        case 189:
        case 190:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
          goto LABEL_5;
        default:
          goto LABEL_38;
      }
    }
    if ((unint64_t)(a1 - 552) < 2)
    {
LABEL_34:
      v4 = 8;
    }
    else if ((unint64_t)(a1 - 554) < 2)
    {
LABEL_11:
      v4 = 4;
    }
    else
    {
      if ((unint64_t)(a1 - 2147483649) >= 2)
LABEL_38:
        pixelBytes_cold_1();
      v4 = 3;
    }
    return v4 * (unint64_t)LODWORD(a2);
  }
}

void slowConvert(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, float32x4_t _Q1, int8x16_t _Q2, __n128 a12, uint64_t a13, uint16x4_t *a14)
{
  int v16;
  int v18;
  unsigned __int32 v19;
  float32x4_t v20;
  float32x4_t v21;
  float v22;
  int v24;
  unsigned __int32 v25;
  uint64_t v26;
  uint16x4_t *v27;
  int8x8_t v28;
  uint32x2_t v30;
  double v31;
  double v32;
  double v33;
  unsigned int v34;
  unsigned int v37;
  unsigned __int32 v38;
  unsigned int v39;
  int v40;
  float v41;
  uint64_t v42;
  int32x2_t v43;
  float32x2_t v44;
  double v45;
  unsigned __int32 v46;
  int v47;
  float v48;
  double v49;
  __int32 v50;
  int v51;
  int v52;
  float v53;
  double v54;
  uint32x2_t v55;
  unsigned __int32 v56;
  int v57;
  uint32x4_t v58;
  int v59;
  uint32x2_t v61;
  double v62;
  long double v63;
  double v64;
  unsigned __int32 v65;
  unsigned __int32 v66;
  unsigned __int32 v67;
  int32x4_t v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned __int32 v73;
  int v74;
  double v75;
  double v76;
  double v77;
  double v78;
  float v79;
  double v80;
  float v81;
  __int32 v82;
  int v83;
  float v84;
  float v85;
  double v86;
  float v87;
  float v88;
  float v89;
  double v90;
  double v91;
  float v92;
  int v93;
  float v94;
  float v95;
  double v96;
  float v97;
  int v98;
  float v99;
  float v100;
  double v101;
  double v102;
  float32_t v103;
  float32_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  double v109;
  double v110;
  float32_t v111;
  float32_t v112;
  unsigned int v113;
  int v114;
  float v115;
  unsigned int v116;
  unsigned int v117;
  int v118;
  int v119;
  int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  int v126;
  char v127;
  float v129;
  float v130;
  float v131;
  long double v132;
  float32x2_t v133;
  float v134;
  float v135;
  long double v136;
  float v137;
  uint64_t v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v142;
  float v143;
  float v144;
  long double v145;
  int32x2_t v147;
  int v148;
  int v149;
  float v150;
  long double v151;
  float v152;
  float v153;
  float32x2_t v154;
  float32x2_t v155;
  int8x8_t v156;
  float v157;
  float v158;
  int v159;
  double v160;
  unsigned int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  float v166;
  float v167;
  float v168;
  unsigned int v170;
  int v172;
  unsigned int v173;
  int v174;
  float v175;
  int32x2_t v176;
  unsigned int v177;
  int32x2_t v178;
  int v179;
  float v180;
  float v181;
  long double v182;
  __int16 v183;
  int v184;
  float32x4_t v187;
  float v188;
  long double v189;
  float v190;
  float v191;
  float v192;
  long double v193;
  float v194;
  int v195;
  float v196;
  float v197;
  long double v198;
  float v199;
  int v200;
  float v201;
  float v202;
  long double v203;
  float v204;
  float v205;
  long double v206;
  float v207;
  unsigned int v208;
  float v209;
  long double v210;
  float v211;
  int v212;
  float v213;
  float v214;
  long double v215;
  float v216;
  float v217;
  float v219;
  float v220;
  float v221;
  long double v222;
  int v223;
  float v224;
  float v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v229;
  unsigned int v230;
  unsigned __int32 v231;
  unsigned int v233;
  float v234;
  float v235;
  float v236;
  long double v237;
  float v238;
  float v239;
  float v240;
  long double v241;
  float v242;
  float v243;
  float v244;
  long double v245;
  float v246;
  float v247;
  long double v248;
  unsigned __int32 v249;
  int v251;
  float32x4_t v254;
  int8x16_t v255;
  int8x16_t v256;
  unsigned __int32 v257;
  unint64_t v258;
  unsigned __int32 v259;
  float32x2_t v262;
  unsigned __int32 v263;
  int v265;
  unint64_t v266;
  float32x4_t v267;
  uint64_t v268;
  uint16x4_t *v269;
  float32x4_t v270;
  float32x4_t v271;
  int8x16_t v272;
  __n128 v273;
  __n128 v274;
  int8x16_t v275;
  int8x16_t v276;
  float32x4_t v277;
  __int32 v278;
  float32x4_t v279;
  float32x4_t v280;
  float32x2_t v281;
  uint64_t v282;
  float32x4_t v283;

  v249 = a9.n128_u32[2];
  if (a9.n128_u32[2])
  {
    v16 = a2;
    v18 = 0;
    v263 = a9.n128_u32[1];
    v19 = a9.n128_u32[0];
    v258 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    v259 = a9.n128_u32[0];
    if (a9.n128_u32[0] <= 1)
      v19 = 1;
    v257 = v19;
    v20 = 0uLL;
    v21.i64[1] = 0x3F80000000000000;
    v22 = -1.0;
    v262 = (float32x2_t)vdup_n_s32(0x437F0000u);
    v266 = a3 - 2147483649;
    v21.i64[0] = 0x3F80000000000000;
    v267 = v21;
    _Q0 = (float32x4_t)xmmword_1D423FF20;
    while (1)
    {
      v251 = v18;
      if (v263)
        break;
LABEL_544:
      a6 += a5;
      a14 = (uint16x4_t *)((char *)a14 + a13);
      v18 = v251 + 1;
      if (v251 + 1 == v249)
        return;
    }
    v24 = 0;
    v269 = a14;
    v268 = a6;
    while (1)
    {
      v265 = v24;
      if (v259)
        break;
LABEL_543:
      v268 += a4;
      v269 = (uint16x4_t *)((char *)v269 + a8);
      v24 = v265 + 1;
      if (v265 + 1 == v263)
        goto LABEL_544;
    }
    if (a7 <= 64)
    {
      if ((unint64_t)a7 <= 0x3E)
      {
        v25 = v257;
        v26 = v268;
        v27 = v269;
        if (((1 << a7) & 0x50800F01C2501C02) != 0)
          goto LABEL_16;
      }
LABEL_551:
      slowConvert_cold_1();
    }
    if ((unint64_t)(a7 - 65) > 0x3C
      || (v25 = v257, v26 = v268, v27 = v269, ((1 << (a7 - 65)) & 0x1004A1001A0180E1) == 0))
    {
      v25 = v257;
      v26 = v268;
      v27 = v269;
      if ((unint64_t)(a7 - 552) >= 4)
      {
        v25 = v257;
        v26 = v268;
        v27 = v269;
        if ((unint64_t)(a7 - 2147483649) > 1)
          goto LABEL_551;
      }
    }
LABEL_16:
    while (a7 > 59)
    {
      if (a7 <= 92)
      {
        if (a7 <= 79)
        {
          switch(a7)
          {
            case '<':
              v30.i32[0] = v27->u16[0];
              v30.i32[1] = v27->u16[1];
              *(int32x2_t *)_Q1.f32 = vdup_n_s32(0x477FFF00u);
              *(float32x2_t *)_Q4.f32 = vdiv_f32(vcvt_f32_u32(v30), *(float32x2_t *)_Q1.f32);
              goto LABEL_65;
            case '>':
              v43.i32[0] = v27->i16[0];
              v43.i32[1] = v27->i16[1];
              v44 = vdiv_f32(vcvt_f32_s32(v43), (float32x2_t)vdup_n_s32(0x46FFFE00u));
              __asm { FMOV            V1.2S, #-1.0 }
              *(int32x2_t *)_Q2.i8 = vcgt_f32(*(float32x2_t *)_Q1.f32, v44);
              *(int8x8_t *)_Q4.f32 = vbsl_s8(*(int8x8_t *)_Q2.i8, *(int8x8_t *)_Q1.f32, (int8x8_t)v44);
              goto LABEL_65;
            case 'A':
              _Q0.i32[0] = v27->i32[0];
              _Q4.i64[0] = vcvtq_f32_f16(*(float16x4_t *)_Q0.f32).u64[0];
LABEL_65:
              _Q0 = v267;
              _Q4.i64[1] = v267.i64[0];
              goto LABEL_228;
            case 'F':
              _Q0.i32[0] = v27->i32[0];
              _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
              _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              goto LABEL_91;
            case 'G':
              _Q0.i32[0] = v27->i32[0];
              _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
              _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              _Q4 = vdivq_f32(_Q0, _Q1);
              if (!v16)
                goto LABEL_228;
              v45 = _Q4.f32[0];
              v272 = (int8x16_t)_Q4;
              if (_Q4.f32[0] <= 0.04045)
              {
                v33 = v45 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v45 + 0.055) / 1.055, 2.4);
                _Q4 = (float32x4_t)v272;
                v33 = *(double *)_Q0.i64;
              }
              v75 = _Q4.f32[1];
              if (_Q4.f32[1] <= 0.04045)
              {
                v76 = v75 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v75 + 0.055) / 1.055, 2.4);
                _Q4.i64[1] = v272.i64[1];
                v76 = *(double *)_Q0.i64;
              }
              v77 = _Q4.f32[2];
              if (_Q4.f32[2] <= 0.04045)
              {
                v78 = v77 / 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow((v77 + 0.055) / 1.055, 2.4);
                _Q4.i32[3] = v272.i32[3];
                v78 = *(double *)_Q0.i64;
              }
              v79 = _Q4.f32[3];
              goto LABEL_178;
            case 'H':
              _Q0.i32[0] = v27->i32[0];
              _Q0 = vdivq_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)_Q0.f32))), (float32x4_t)vdupq_n_s32(0x42FE0000u));
              __asm { FMOV            V1.4S, #-1.0 }
              _Q2 = (int8x16_t)vcgtq_f32(_Q1, _Q0);
              _Q4 = (float32x4_t)vbslq_s8(_Q2, (int8x16_t)_Q1, (int8x16_t)_Q0);
              goto LABEL_228;
            default:
              goto LABEL_62;
          }
        }
        if (a7 > 89)
        {
          if (a7 == 90)
          {
            _Q1.i32[0] = v27->i32[0];
            _Q1.i32[1] = (unsigned __int32)v27->i32[0] >> 10;
            _Q1.i32[2] = (unsigned __int32)v27->i32[0] >> 20;
            _Q2.i64[0] = 0x300000003;
            _Q2.i64[1] = 0x300000003;
            v58 = (uint32x4_t)vandq_s8((int8x16_t)_Q1, _Q2);
            v58.i32[3] = vshrq_n_u32((uint32x4_t)vdupq_n_s32(*(_DWORD *)v27), 0x1EuLL).i32[3];
            _Q0 = vcvtq_f32_u32(v58);
            _Q1 = (float32x4_t)xmmword_1D423F040;
LABEL_91:
            _Q4 = vdivq_f32(_Q0, _Q1);
            goto LABEL_228;
          }
          if (a7 != 92)
          {
LABEL_62:
            _Q4 = *(float32x4_t *)v27->i8;
            v42 = 16;
            goto LABEL_229;
          }
          v37 = v27->i32[0];
          v38 = (unsigned __int32)v27->i32[0] >> 21;
          v39 = v38 & 0x3F;
          v40 = v38 & 0x7C0;
          if ((v38 & 0x7C0) != 0)
          {
            if (v40 == 1792)
            {
              v41 = NAN;
              if ((v38 & 0x3F) == 0)
                v41 = INFINITY;
LABEL_206:
              v113 = (v37 >> 11) & 0x3F;
              v114 = (v37 >> 11) & 0x7C0;
              if (v114)
              {
                if (v114 == 1792)
                {
                  v115 = NAN;
                  _Q2.i32[0] = 2139095040;
                  if (!v113)
                    v115 = INFINITY;
                  goto LABEL_219;
                }
                v120 = (v114 << 17) + 939524096;
              }
              else
              {
                v116 = __clz(v113);
                v117 = v37 >> 11 << (v116 - 25);
                v118 = 1157627904 - (v116 << 23);
                v119 = v117 & 0x3E;
                if (v113)
                  v120 = v118;
                else
                  v120 = 0;
                if (v113)
                  v113 = v119;
                else
                  v113 = 0;
              }
              LODWORD(v115) = v120 | (v113 << 17);
LABEL_219:
              v121 = v27->i32[0] & 0x1F;
              if ((v37 & 0x3E0) != 0)
              {
                v122 = ((v27->i32[0] & 0x3E0) << 18) + 939524096;
              }
              else
              {
                v123 = __clz(v121);
                v124 = v37 << (v123 - 26);
                v125 = 1166016512 - (v123 << 23);
                v126 = v124 & 0x1E;
                if (v121)
                  v122 = v125;
                else
                  v122 = 0;
                if (v121)
                  v121 = v126;
                else
                  v121 = 0;
              }
              __asm { FMOV            V4.4S, #1.0 }
              _Q4.i64[0] = __PAIR64__(LODWORD(v115), LODWORD(v41));
              _Q0.i32[0] = v122 | (v121 << 18);
              _Q4.i32[2] = _Q0.i32[0];
              goto LABEL_228;
            }
            v74 = (v40 << 17) + 939524096;
          }
          else if ((v38 & 0x3F) != 0)
          {
            v72 = __clz(v39);
            v73 = v38 << (v72 - 25);
            v74 = 1157627904 - (v72 << 23);
            v39 = v73 & 0x3E;
          }
          else
          {
            v74 = 0;
          }
          LODWORD(v41) = v74 | (v39 << 17);
          goto LABEL_206;
        }
        if (a7 == 80)
        {
          _Q0.i32[0] = v27->i32[0];
          _Q1 = (float32x4_t)vdupq_n_s32(0x437F0000u);
          _Q0 = (float32x4_t)vrev64q_s32((int32x4_t)vdivq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32))), _Q1));
          goto LABEL_120;
        }
        if (a7 != 81)
          goto LABEL_62;
        _Q0.i32[0] = v27->i32[0];
        _Q0 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)_Q0.f32)));
        _Q1 = vdivq_f32(_Q0, (float32x4_t)vdupq_n_s32(0x437F0000u));
        if (!v16)
        {
          _Q0 = (float32x4_t)vrev64q_s32((int32x4_t)_Q1);
LABEL_120:
          _Q4 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 0xCuLL);
LABEL_228:
          v42 = 4;
          goto LABEL_229;
        }
        v32 = _Q1.f32[2];
        v271 = _Q1;
        if (_Q1.f32[2] <= 0.04045)
        {
          v33 = v32 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v32 + 0.055) / 1.055, 2.4);
          _Q1 = v271;
          v33 = *(double *)_Q0.i64;
        }
        v80 = _Q1.f32[1];
        if (_Q1.f32[1] <= 0.04045)
        {
          v76 = v80 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v80 + 0.055) / 1.055, 2.4);
          _Q1 = v271;
          v76 = *(double *)_Q0.i64;
        }
        v91 = _Q1.f32[0];
        if (_Q1.f32[0] <= 0.04045)
        {
          v78 = v91 / 12.92;
        }
        else
        {
          *(double *)_Q0.i64 = pow((v91 + 0.055) / 1.055, 2.4);
          _Q1 = v271;
          v78 = *(double *)_Q0.i64;
        }
        v79 = _Q1.f32[3];
LABEL_178:
        v102 = v79;
        if (v102 <= 0.04045)
          *(double *)_Q0.i64 = v102 / 12.92;
        else
          *(double *)_Q0.i64 = pow((v102 + 0.055) / 1.055, 2.4);
        _Q4.f32[0] = v33;
        v103 = v76;
        _Q4.f32[1] = v103;
        v104 = v78;
        _Q4.f32[2] = v104;
        _Q0.f32[0] = *(double *)_Q0.i64;
        _Q4.i32[3] = _Q0.i32[0];
        v42 = 4;
        v20 = 0uLL;
        v22 = -1.0;
      }
      else
      {
        if (a7 <= 551)
        {
          if (a7 > 109)
          {
            switch(a7)
            {
              case 'n':
                _Q0 = vcvtq_f32_u32(vmovl_u16(*v27));
                _Q1 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
                _Q4 = vdivq_f32(_Q0, _Q1);
                break;
              case 'p':
                _Q0 = vdivq_f32(vcvtq_f32_s32(vmovl_s16((int16x4_t)*v27)), (float32x4_t)vdupq_n_s32(0x46FFFE00u));
                __asm { FMOV            V1.4S, #-1.0 }
                _Q2 = (int8x16_t)vcgtq_f32(_Q1, _Q0);
                _Q4 = (float32x4_t)vbslq_s8(_Q2, (int8x16_t)_Q1, (int8x16_t)_Q0);
                break;
              case 's':
                *(uint16x4_t *)_Q0.f32 = *v27;
                _Q4 = vcvtq_f32_f16((float16x4_t)*v27);
                break;
              default:
                goto LABEL_62;
            }
LABEL_193:
            v42 = 8;
            goto LABEL_229;
          }
          if (a7 != 93)
          {
            if (a7 != 105)
              goto LABEL_62;
            *(uint16x4_t *)_Q4.f32 = *v27;
            _Q0 = v267;
            _Q4.i64[1] = v267.i64[0];
            goto LABEL_193;
          }
          v56 = v27->i32[0];
          *(double *)_Q0.i64 = ldexp(1.0, ((unsigned __int32)v27->i32[0] >> 27) - 24);
          v20 = 0uLL;
          _Q0.f32[0] = *(double *)_Q0.i64;
          _Q1.i32[0] = v56;
          _Q1.i32[1] = v56 >> 9;
          _Q2.i64[0] = 0x100000001;
          *(float32x2_t *)_Q1.f32 = vcvt_f32_s32((int32x2_t)vand_s8(*(int8x8_t *)_Q1.f32, (int8x8_t)0x100000001));
          *(float32x2_t *)_Q4.f32 = vmul_n_f32(*(float32x2_t *)_Q1.f32, _Q0.f32[0]);
          v57 = (v56 >> 18) & 0x1FF;
          v16 = a2;
          _Q0.f32[0] = _Q0.f32[0] * (float)v57;
LABEL_88:
          _Q4.i32[2] = _Q0.i32[0];
          goto LABEL_89;
        }
        switch(a7)
        {
          case 552:
            v28.i32[0] = v27->i32[1];
            v28.i32[1] = HIWORD(v27->i32[0]);
            *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(vadd_s32((int32x2_t)vand_s8(v28, (int8x8_t)0x300000003), vdup_n_s32(0xFFFFFE80)));
            *(int32x2_t *)_Q1.f32 = vdup_n_s32(0x43FF0000u);
            *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, *(float32x2_t *)_Q1.f32);
            _Q4.f32[2] = (float)((v27->i32[0] & 0x3FF) - 384) / 510.0;
            _Q0.f32[0] = (float)((HIWORD(v27->i32[1]) & 0x3FF) - 384);
            goto LABEL_187;
          case 553:
            v46 = v27->u32[1];
            v47 = (v46 & 0x3FF) - 384;
            a12.n128_f32[0] = (float)v47 / 510.0;
            if (v16)
            {
              v48 = -a12.n128_f32[0];
              if (a12.n128_f32[0] >= 0.0)
                v48 = (float)v47 / 510.0;
              v49 = v48;
              if (v49 <= 0.04045)
              {
                *(double *)_Q0.i64 = v49 / 12.92;
              }
              else
              {
                v273 = a12;
                *(double *)_Q0.i64 = pow((v49 + 0.055) / 1.055, 2.4);
                a12 = v273;
              }
              v81 = *(double *)_Q0.i64;
              if (a12.n128_f32[0] >= 0.0)
                *(float *)_Q2.i32 = v81;
              else
                *(float *)_Q2.i32 = -v81;
              v82 = v27->i32[0];
              v83 = (HIWORD(v27->i32[0]) & 0x3FF) - 384;
              v84 = (float)v83 / 510.0;
              v85 = -v84;
              if (v84 >= 0.0)
                v85 = (float)v83 / 510.0;
              v86 = v85;
              v275 = _Q2;
              if (v86 <= 0.04045)
                *(double *)_Q0.i64 = v86 / 12.92;
              else
                *(double *)_Q0.i64 = pow((v86 + 0.055) / 1.055, 2.4);
              v92 = *(double *)_Q0.i64;
              if (v84 >= 0.0)
                *(float *)_Q2.i32 = v92;
              else
                *(float *)_Q2.i32 = -v92;
              v93 = (v82 & 0x3FF) - 384;
              v94 = (float)v93 / 510.0;
              v95 = -v94;
              if (v94 >= 0.0)
                v95 = (float)v93 / 510.0;
              v96 = v95;
              if (v96 <= 0.04045)
              {
                *(double *)_Q0.i64 = v96 / 12.92;
              }
              else
              {
                v255 = _Q2;
                *(double *)_Q0.i64 = pow((v96 + 0.055) / 1.055, 2.4);
                _Q2 = v255;
              }
              _Q1 = (float32x4_t)v275;
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v275.u32[0]);
              v105 = *(double *)_Q0.i64;
              if (v94 < 0.0)
                v105 = -v105;
              _Q4.f32[2] = v105;
              v20 = 0uLL;
            }
            else
            {
              _Q4.f32[0] = (float)v47 / 510.0;
              _Q4.f32[1] = (float)((HIWORD(v27->i32[0]) & 0x3FF) - 384) / 510.0;
              _Q4.f32[2] = (float)((v27->i32[0] & 0x3FF) - 384) / 510.0;
            }
            _Q0.f32[0] = (float)(int)((HIWORD(v46) & 0x3FF) - 384);
LABEL_187:
            v106 = _Q0.f32[0] / 510.0;
            v107 = 0.0;
            if (v106 >= 0.0)
              v107 = v106;
            _Q2.i32[0] = 1.0;
            if (v106 <= 1.0)
              _Q0.f32[0] = v107;
            else
              _Q0.f32[0] = 1.0;
            _Q4.i32[3] = _Q0.i32[0];
            goto LABEL_193;
          case 554:
            *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(vadd_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v27->i32[0]), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003), vdup_n_s32(0xFFFFFE80)));
            *(int32x2_t *)_Q1.f32 = vdup_n_s32(0x43FF0000u);
            *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, *(float32x2_t *)_Q1.f32);
            _Q0.f32[0] = (float)((v27->i32[0] & 0x3FF) - 384) / 510.0;
            goto LABEL_88;
          case 555:
            v50 = v27->i32[0];
            v51 = (((unsigned __int32)v27->i32[0] >> 20) & 0x3FF) - 384;
            a12.n128_f32[0] = (float)v51 / 510.0;
            v52 = ((unsigned __int32)v27->i32[0] >> 10) & 0x3FF;
            if (v16)
            {
              v53 = -a12.n128_f32[0];
              if (a12.n128_f32[0] >= 0.0)
                v53 = (float)v51 / 510.0;
              v54 = v53;
              if (v54 <= 0.04045)
              {
                *(double *)_Q0.i64 = v54 / 12.92;
              }
              else
              {
                v274 = a12;
                *(double *)_Q0.i64 = pow((v54 + 0.055) / 1.055, 2.4);
                a12 = v274;
              }
              v87 = *(double *)_Q0.i64;
              if (a12.n128_f32[0] >= 0.0)
                *(float *)_Q2.i32 = v87;
              else
                *(float *)_Q2.i32 = -v87;
              v88 = (float)(v52 - 384) / 510.0;
              v89 = -v88;
              if (v88 >= 0.0)
                v89 = (float)(v52 - 384) / 510.0;
              v90 = v89;
              v276 = _Q2;
              if (v90 <= 0.04045)
                *(double *)_Q0.i64 = v90 / 12.92;
              else
                *(double *)_Q0.i64 = pow((v90 + 0.055) / 1.055, 2.4);
              v97 = *(double *)_Q0.i64;
              if (v88 >= 0.0)
                *(float *)_Q2.i32 = v97;
              else
                *(float *)_Q2.i32 = -v97;
              v98 = (v50 & 0x3FF) - 384;
              v99 = (float)v98 / 510.0;
              v100 = -v99;
              if (v99 >= 0.0)
                v100 = (float)v98 / 510.0;
              v101 = v100;
              if (v101 <= 0.04045)
              {
                *(double *)_Q0.i64 = v101 / 12.92;
              }
              else
              {
                v256 = _Q2;
                *(double *)_Q0.i64 = pow((v101 + 0.055) / 1.055, 2.4);
                _Q2 = v256;
              }
              _Q1 = (float32x4_t)v276;
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v276.u32[0]);
              v108 = *(double *)_Q0.i64;
              if (v99 < 0.0)
                v108 = -v108;
              _Q4.f32[2] = v108;
              v20 = 0uLL;
            }
            else
            {
              *(float *)_Q2.i32 = (float)((v27->i32[0] & 0x3FF) - 384);
              _Q4.f32[0] = (float)v51 / 510.0;
              _Q4.f32[1] = (float)(v52 - 384) / 510.0;
              _Q4.f32[2] = *(float *)_Q2.i32 / 510.0;
            }
            goto LABEL_89;
          default:
            if (a7 == 2147483649)
            {
              v55.i32[0] = v27->u8[0];
              v55.i32[1] = v27->u8[1];
              *(float32x2_t *)_Q0.f32 = vcvt_f32_u32(v55);
              _Q1.i32[1] = v262.i32[1];
              *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, v262);
              _Q0.i8[0] = v27->i8[2];
              _Q4.f32[2] = (float)_Q0.u32[0] / 255.0;
              _Q0.i32[0] = 1.0;
              _Q4.i32[3] = 1.0;
            }
            else
            {
              if (a7 != 2147483650)
                goto LABEL_62;
              _Q0.i8[0] = v27->i8[2];
              *(float *)&v34 = (float)_Q0.u32[0] / 255.0;
              _Q2.i8[0] = v27->i8[1];
              *(float *)_Q2.i32 = (float)_Q2.u32[0] / 255.0;
              __asm { FMOV            V4.4S, #1.0 }
              _Q4.i64[0] = __PAIR64__(_Q2.u32[0], v34);
              LOBYTE(v34) = v27->i8[0];
              _Q0.f32[0] = (float)v34 / 255.0;
              _Q4.i32[2] = _Q0.i32[0];
            }
            v42 = 3;
            break;
        }
      }
LABEL_229:
      if (a1)
      {
        _Q0 = vmulq_laneq_f32(_Q4, _Q4, 3);
        _Q0.i32[3] = _Q4.i32[3];
        _Q4 = _Q0;
      }
      if ((unint64_t)a3 <= 0x3E)
      {
        if (((1 << a3) & 0x10000F00C0100C02) != 0)
          goto LABEL_239;
        if (((1 << a3) & 0x4000000100401000) != 0)
          goto LABEL_237;
      }
      v127 = a3 - 70;
      if ((unint64_t)(a3 - 70) <= 0x2A)
      {
        if (((1 << v127) & 0x10000100C03) != 0)
          goto LABEL_239;
        if (((1 << v127) & 0x40000000004) != 0)
        {
LABEL_237:
          __asm { FMOV            V0.4S, #-1.0 }
          _Q0 = vmaxnmq_f32(_Q4, _Q0);
          goto LABEL_240;
        }
      }
      if (v266 < 2)
      {
LABEL_239:
        _Q0 = vmaxnmq_f32(_Q4, v20);
LABEL_240:
        __asm { FMOV            V1.4S, #1.0 }
LABEL_241:
        _Q4 = vminnmq_f32(_Q0, _Q1);
        goto LABEL_242;
      }
      if (v258 == 553)
      {
        _Q0 = vmaxnmq_f32(_Q4, (float32x4_t)xmmword_1D423F020);
        _Q1 = (float32x4_t)xmmword_1D423F030;
        goto LABEL_241;
      }
      if (v258 == 552)
      {
        _Q0 = vmaxnmq_f32(_Q4, (float32x4_t)xmmword_1D423FF30);
        _Q1 = (float32x4_t)xmmword_1D423FF40;
        goto LABEL_241;
      }
LABEL_242:
      if (a3 <= 79)
      {
        if (a3 > 19)
        {
          switch(a3)
          {
            case 20:
              v134 = 65535.0;
              goto LABEL_363;
            case 21:
            case 23:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
              goto LABEL_550;
            case 22:
              v134 = 32767.0;
LABEL_363:
              _Q0.f32[0] = v134 * _Q4.f32[0];
              v179 = (int)_Q0.f32[0];
              goto LABEL_378;
            case 25:
              __asm { FCVT            H0, S4; jumptable 00000001D423B3A0 case 25 }
              *(_WORD *)v26 = _Q0.i16[0];
              goto LABEL_521;
            case 30:
              v180 = 255.0;
              goto LABEL_372;
            case 31:
              if (v16)
              {
                v181 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0)
                  v181 = _Q4.f32[0];
                v182 = v181;
                if (v182 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v182 * 12.92;
                }
                else
                {
                  v282 = _Q4.i64[0];
                  *(double *)_Q0.i64 = pow(v182, 0.416666667);
                  _Q4.i64[0] = v282;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v234 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0)
                  v234 = -v234;
                *(_BYTE *)v26 = (int)(float)(v234 * 255.0);
                v235 = _Q4.f32[1];
                v236 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0)
                  v236 = _Q4.f32[1];
                v237 = v236;
                if (v237 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v237 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v237, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v20 = 0uLL;
                v224 = *(double *)_Q0.i64;
                if (v235 < 0.0)
                  v224 = -v224;
              }
              else
              {
                *(_BYTE *)v26 = (int)(float)(_Q4.f32[0] * 255.0);
                v224 = _Q4.f32[1];
              }
              _Q0.f32[0] = v224 * 255.0;
              goto LABEL_520;
            case 32:
              v180 = 127.0;
LABEL_372:
              *(_BYTE *)v26 = (int)(float)(v180 * _Q4.f32[0]);
              _Q0.f32[0] = vmuls_lane_f32(v180, *(float32x2_t *)_Q4.f32, 1);
LABEL_520:
              *(_BYTE *)(v26 + 1) = (int)_Q0.f32[0];
              goto LABEL_521;
            case 40:
              _Q1.i32[1] = 11;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)_Q4.f32), (float32x2_t)0x41F80000427C0000)), (uint32x2_t)0xB00000005);
              v179 = _Q0.i32[0] | (int)vmuls_lane_f32(31.0, _Q4, 2) | _Q0.i32[1];
              goto LABEL_378;
            case 41:
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              __asm { FMOV            V1.2S, #31.0 }
              *(int32x2_t *)_Q0.f32 = vcvt_s32_f32(vmul_f32((float32x2_t)vzip1_s32(*(int32x2_t *)_Q4.f32, *(int32x2_t *)_Q0.f32), *(float32x2_t *)_Q1.f32));
              _Q1.i32[1] = 1;
              *(uint32x2_t *)_Q0.f32 = vshl_u32(*(uint32x2_t *)_Q0.f32, (uint32x2_t)0x10000000BLL);
              v183 = _Q0.i16[2];
              v179 = (int)_Q4.f32[3] | ((int)vmuls_lane_f32(31.0, *(float32x2_t *)_Q4.f32, 1) << 6);
              goto LABEL_377;
            case 42:
              v179 = (int)(float)(15.0 * _Q4.f32[0]) << 12;
              v184 = (int)vmuls_lane_f32(15.0, _Q4, 3);
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q4.i32[0] = _Q0.i32[0];
              __asm { FMOV            V0.2S, #15.0 }
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, *(float32x2_t *)_Q0.f32)), (uint32x2_t)0x800000004), (int8x8_t)__PAIR64__(v184, v179));
              *(int32x2_t *)_Q1.f32 = vdup_lane_s32(*(int32x2_t *)_Q0.f32, 1);
              *(int8x8_t *)_Q0.f32 = vorr_s8(*(int8x8_t *)_Q0.f32, *(int8x8_t *)_Q1.f32);
              LOWORD(v179) = _Q0.i16[0];
              goto LABEL_378;
            case 43:
              __asm { FMOV            V0.2S, #31.0 }
              _Q1.i32[1] = 5;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, _D0)), (uint32x2_t)0x50000000ALL);
              v183 = _Q0.i16[2];
              v179 = (int)vmuls_lane_f32(31.0, _Q4, 2) | ((int)_Q4.f32[3] << 15);
LABEL_377:
              LOWORD(v179) = v179 | _Q0.i16[0] | v183;
LABEL_378:
              *(_WORD *)v26 = v179;
LABEL_521:
              v138 = 2;
              goto LABEL_542;
            default:
              switch(a3)
              {
                case '<':
                  v137 = 65535.0;
                  goto LABEL_380;
                case '=':
                case '?':
                case '@':
                case 'B':
                case 'C':
                case 'D':
                case 'E':
                  goto LABEL_550;
                case '>':
                  v137 = 32767.0;
LABEL_380:
                  *(_WORD *)v26 = (int)(float)(v137 * _Q4.f32[0]);
                  _Q0.f32[0] = vmuls_lane_f32(v137, *(float32x2_t *)_Q4.f32, 1);
                  *(_WORD *)(v26 + 2) = (int)_Q0.f32[0];
                  goto LABEL_541;
                case 'A':
                  __asm { FCVT            H0, S4; jumptable 00000001D423B478 case 65 }
                  *(_WORD *)v26 = _H0;
                  _Q0.i32[0] = _Q4.i32[1];
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)(v26 + 2) = _Q0.i16[0];
                  goto LABEL_541;
                case 'F':
                  v187 = (float32x4_t)vdupq_n_s32(0x437F0000u);
                  goto LABEL_389;
                case 'G':
                  if (!v16)
                  {
                    *(_BYTE *)v26 = (int)(float)(_Q4.f32[0] * 255.0);
                    *(_BYTE *)(v26 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                    v167 = vmuls_lane_f32(255.0, _Q4, 2);
                    goto LABEL_474;
                  }
                  v188 = -_Q4.f32[0];
                  if (_Q4.f32[0] >= 0.0)
                    v188 = _Q4.f32[0];
                  v189 = v188;
                  v283 = _Q4;
                  if (v189 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v189 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v189, 0.416666667);
                    _Q4 = v283;
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  v238 = *(double *)_Q0.i64;
                  if (_Q4.f32[0] < 0.0)
                    v238 = -v238;
                  *(_BYTE *)v26 = (int)(float)(v238 * 255.0);
                  v239 = _Q4.f32[1];
                  v240 = -_Q4.f32[1];
                  if (_Q4.f32[1] >= 0.0)
                    v240 = _Q4.f32[1];
                  v241 = v240;
                  if (v241 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v241 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v241, 0.416666667);
                    _Q4.i64[1] = v283.i64[1];
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  v242 = *(double *)_Q0.i64;
                  if (v239 < 0.0)
                    v242 = -v242;
                  *(_BYTE *)(v26 + 1) = (int)(float)(v242 * 255.0);
                  v243 = _Q4.f32[2];
                  v244 = -_Q4.f32[2];
                  if (_Q4.f32[2] >= 0.0)
                    v244 = _Q4.f32[2];
                  v245 = v244;
                  if (v245 <= 0.003131)
                  {
                    *(double *)_Q0.i64 = v245 * 12.92;
                  }
                  else
                  {
                    *(double *)_Q0.i64 = pow(v245, 0.416666667);
                    _Q4.i32[3] = v283.i32[3];
                    _Q1.i32[1] = -1079236363;
                    *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                  }
                  v216 = *(double *)_Q0.i64;
                  v217 = -v216;
                  _NF = v243 < 0.0;
                  break;
                case 'H':
                  v187 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
LABEL_389:
                  _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, v187));
                  *(int16x4_t *)_Q0.f32 = vmovn_s32((int32x4_t)_Q0);
                  goto LABEL_390;
                default:
                  if (a3 != 55)
                    goto LABEL_550;
                  *(_DWORD *)v26 = _Q4.i32[0];
                  goto LABEL_541;
              }
              goto LABEL_531;
          }
        }
        if (a3 > 10)
        {
          if (a3 == 11)
          {
            if (v16)
            {
              v135 = -_Q4.f32[0];
              if (_Q4.f32[0] >= 0.0)
                v135 = _Q4.f32[0];
              v136 = v135;
              _Q1.i32[1] = 1063888430;
              if (v136 <= 0.003131)
              {
                *(double *)_Q0.i64 = v136 * 12.92;
              }
              else
              {
                v278 = _Q4.i32[0];
                *(double *)_Q0.i64 = pow(v136, 0.416666667);
                _Q4.i32[0] = v278;
                v20 = 0uLL;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              v166 = *(double *)_Q0.i64;
              if (_Q4.f32[0] >= 0.0)
                _Q4.f32[0] = v166;
              else
                _Q4.f32[0] = -v166;
            }
            _Q0.f32[0] = _Q4.f32[0] * 255.0;
          }
          else
          {
            if (a3 != 12)
              goto LABEL_550;
            v129 = 127.0;
LABEL_266:
            _Q0.f32[0] = v129 * _Q4.f32[0];
          }
        }
        else
        {
          if (a3 != 1)
          {
            if (a3 != 10)
              goto LABEL_550;
            v129 = 255.0;
            goto LABEL_266;
          }
          _Q0.f32[0] = vmuls_lane_f32(255.0, _Q4, 3);
        }
        *(_BYTE *)v26 = (int)_Q0.f32[0];
        v138 = 1;
        goto LABEL_542;
      }
      if (a3 > 114)
      {
        if (a3 > 551)
        {
          switch(a3)
          {
            case 552:
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q1 = _Q0;
              _Q1.i32[1] = _Q4.i32[0];
              *(int32x2_t *)_Q2.i8 = vdup_n_s32(0x43FF0000u);
              v133 = (float32x2_t)vdup_n_s32(0x43C00000u);
              *(uint32x2_t *)_Q1.f32 = vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32(v133, *(float32x2_t *)_Q2.i8, *(float32x2_t *)_Q1.f32)), (uint32x2_t)0x300000003);
              a12.n128_u64[0] = (unint64_t)vmla_f32(v133, *(float32x2_t *)_Q2.i8, (float32x2_t)vzip2_s32(*(int32x2_t *)_Q4.f32, *(int32x2_t *)_Q0.f32));
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)vmin_u32((uint32x2_t)vcvt_s32_f32((float32x2_t)a12.n128_u64[0]), (uint32x2_t)0x300000003), 0x10uLL), *(int8x8_t *)_Q1.f32);
              goto LABEL_336;
            case 553:
              v143 = _Q4.f32[2];
              if (v16)
              {
                v144 = -_Q4.f32[2];
                if (_Q4.f32[2] >= 0.0)
                  v144 = _Q4.f32[2];
                v145 = v144;
                v279 = _Q4;
                if (v145 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v145 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v145, 0.416666667);
                  _Q4 = v279;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v194 = *(double *)_Q0.i64;
                if (v143 < 0.0)
                  v194 = -v194;
                if ((int)(float)((float)(v194 * 510.0) + 384.0) >= 0x3FF)
                  v195 = 1023;
                else
                  v195 = (int)(float)((float)(v194 * 510.0) + 384.0);
                v196 = _Q4.f32[1];
                v197 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0)
                  v197 = _Q4.f32[1];
                v198 = v197;
                if (v198 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v198 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v198, 0.416666667);
                  _Q4 = v279;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v207 = *(double *)_Q0.i64;
                if (v196 < 0.0)
                  v207 = -v207;
                v208 = (int)(float)((float)(v207 * 510.0) + 384.0);
                if (v208 >= 0x3FF)
                  v208 = 1023;
                *(_DWORD *)v26 = v195 | (v208 << 16);
                v209 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0)
                  v209 = _Q4.f32[0];
                v210 = v209;
                if (v210 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v210 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v210, 0.416666667);
                  _Q4 = v279;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v219 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0)
                  v219 = -v219;
                if ((int)(float)((float)(v219 * 510.0) + 384.0) >= 0x3FF)
                  v174 = 1023;
                else
                  v174 = (int)(float)((float)(v219 * 510.0) + 384.0);
                v220 = _Q4.f32[3];
                v221 = -_Q4.f32[3];
                if (_Q4.f32[3] >= 0.0)
                  v221 = _Q4.f32[3];
                v222 = v221;
                if (v222 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v222 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v222, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v20 = 0uLL;
                v168 = *(double *)_Q0.i64;
                if (v220 < 0.0)
                  v168 = -v168;
              }
              else
              {
                v168 = _Q4.f32[3];
                _S2 = 1140785152;
                v170 = (int)(float)((float)(_Q4.f32[2] * 510.0) + 384.0);
                if (v170 >= 0x3FF)
                  v170 = 1023;
                __asm { FMLA            S3, S2, V4.S[1] }
                v172 = (int)_S3;
                if ((int)_S3 >= 0x3FF)
                  v172 = 1023;
                *(_DWORD *)v26 = v170 | (v172 << 16);
                v173 = (int)vmlas_n_f32(384.0, 510.0, _Q4.f32[0]);
                if (v173 >= 0x3FF)
                  v174 = 1023;
                else
                  v174 = v173;
              }
              _Q2.i32[0] = 1140785152;
              _Q0.f32[0] = (float)(v168 * 510.0) + 384.0;
              v223 = (int)_Q0.f32[0];
              if ((int)_Q0.f32[0] >= 0x3FF)
                v223 = 1023;
              *(_DWORD *)(v26 + 4) = v174 | (v223 << 16);
              v138 = 8;
              goto LABEL_542;
            case 554:
              _S0 = 1140785152;
              __asm { FMLA            S2, S0, V4.S[2] }
              v147 = (int32x2_t)vshl_u32(vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32((float32x2_t)vdup_n_s32(0x43C00000u), (float32x2_t)vdup_n_s32(0x43FF0000u), *(float32x2_t *)_Q4.f32)), (uint32x2_t)0x300000003), (uint32x2_t)0xA00000014);
              *(int32x2_t *)_Q1.f32 = vdup_lane_s32(v147, 1);
              *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)v147, *(int8x8_t *)_Q1.f32);
              v148 = (int)*(float *)_Q2.i32;
              if ((int)*(float *)_Q2.i32 >= 0x3FF)
                v148 = 1023;
              v149 = _Q0.i32[0] | v148;
              goto LABEL_501;
            case 555:
              if (v16)
              {
                v150 = -_Q4.f32[0];
                if (_Q4.f32[0] >= 0.0)
                  v150 = _Q4.f32[0];
                v151 = v150;
                v280 = _Q4;
                if (v151 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v151 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v151, 0.416666667);
                  _Q4 = v280;
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v199 = *(double *)_Q0.i64;
                if (_Q4.f32[0] < 0.0)
                  v199 = -v199;
                if ((int)(float)((float)(v199 * 510.0) + 384.0) >= 0x3FF)
                  v200 = 1023;
                else
                  v200 = (int)(float)((float)(v199 * 510.0) + 384.0);
                v201 = _Q4.f32[1];
                v202 = -_Q4.f32[1];
                if (_Q4.f32[1] >= 0.0)
                  v202 = _Q4.f32[1];
                v203 = v202;
                if (v203 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v203 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v203, 0.416666667);
                  _Q4.i32[2] = v280.i32[2];
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v211 = *(double *)_Q0.i64;
                if (v201 < 0.0)
                  v211 = -v211;
                if ((int)(float)((float)(v211 * 510.0) + 384.0) >= 0x3FF)
                  v212 = 1023;
                else
                  v212 = (int)(float)((float)(v211 * 510.0) + 384.0);
                v213 = _Q4.f32[2];
                v214 = -_Q4.f32[2];
                if (_Q4.f32[2] >= 0.0)
                  v214 = _Q4.f32[2];
                v215 = v214;
                if (v215 <= 0.003131)
                {
                  *(double *)_Q0.i64 = v215 * 12.92;
                }
                else
                {
                  *(double *)_Q0.i64 = pow(v215, 0.416666667);
                  _Q1.i32[1] = -1079236363;
                  *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
                }
                v20 = 0uLL;
                v165 = (v200 << 20) | (v212 << 10);
                v175 = *(double *)_Q0.i64;
                if (v213 < 0.0)
                  v175 = -v175;
                v16 = a2;
              }
              else
              {
                v175 = _Q4.f32[2];
                v176 = (int32x2_t)vshl_u32(vmin_u32((uint32x2_t)vcvt_s32_f32(vmla_f32((float32x2_t)vdup_n_s32(0x43C00000u), (float32x2_t)vdup_n_s32(0x43FF0000u), *(float32x2_t *)_Q4.f32)), (uint32x2_t)0x300000003), (uint32x2_t)0xA00000014);
                *(int32x2_t *)_Q2.i8 = vdup_lane_s32(v176, 1);
                *(int8x8_t *)_Q1.f32 = vorr_s8((int8x8_t)v176, *(int8x8_t *)_Q2.i8);
                v165 = _Q1.i32[0];
              }
              _Q2.i32[0] = 1140785152;
              _Q0.f32[0] = (float)(v175 * 510.0) + 384.0;
              v164 = (int)_Q0.f32[0];
              if ((int)_Q0.f32[0] >= 0x3FF)
                v164 = 1023;
              goto LABEL_465;
            default:
              if (a3 == 2147483649)
              {
                *(_BYTE *)v26 = (int)(float)(255.0 * _Q4.f32[0]);
                *(_BYTE *)(v26 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                _Q0.f32[0] = vmuls_lane_f32(255.0, _Q4, 2);
              }
              else
              {
                if (a3 != 2147483650)
                  goto LABEL_550;
                *(_BYTE *)v26 = (int)vmuls_lane_f32(255.0, _Q4, 2);
                *(_BYTE *)(v26 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
                _Q0.f32[0] = 255.0 * _Q4.f32[0];
              }
              *(_BYTE *)(v26 + 2) = (int)_Q0.f32[0];
              v138 = 3;
              break;
          }
          goto LABEL_542;
        }
        if (a3 != 115)
        {
          if (a3 != 125)
            goto LABEL_550;
          *(float32x4_t *)v26 = _Q4;
          v138 = 16;
          goto LABEL_542;
        }
        *(float16x4_t *)_Q0.f32 = vcvt_f16_f32(_Q4);
      }
      else
      {
        if (a3 <= 92)
        {
          if (a3 > 89)
          {
            if (a3 == 90)
            {
              v163 = (int)(float)(1023.0 * _Q4.f32[0]);
              _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 8uLL);
              _Q4.i32[0] = _Q0.i32[1];
              _Q1.i32[1] = 10;
              *(uint32x2_t *)_Q0.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32(vmul_f32(*(float32x2_t *)_Q4.f32, (float32x2_t)0x447FC00040400000)), (uint32x2_t)0xA0000001ELL);
              v164 = _Q0.i32[1];
              v165 = _Q0.i32[0] | (v163 << 20) | v163;
LABEL_465:
              v149 = v165 | v164;
            }
            else
            {
              if (a3 != 92)
                goto LABEL_550;
              if (_Q4.i32[2] < 0)
              {
                v142 = 0;
              }
              else
              {
                v139 = _Q4.i32[2] & 0x7F800000;
                v140 = _Q4.i32[2] & 0x7FFFFF;
                if ((_Q4.i32[2] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v139 >= 0x38000001)
                    v142 = ((v139 - 939524096) | v140) >> 18;
                  else
                    v142 = v140 >> (((939524096 - v139) >> 23) + 19);
                }
                else if (v139 != 2139095040 || v140 == 0)
                {
                  v142 = 992;
                }
                else
                {
                  v142 = 1023;
                }
              }
              if (_Q4.i32[1] < 0)
              {
                v229 = 0;
              }
              else
              {
                v226 = _Q4.i32[1] & 0x7F800000;
                v227 = _Q4.i32[1] & 0x7FFFFF;
                if ((_Q4.i32[1] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v226 >= 0x38000001)
                    v229 = ((v226 - 939524096) | v227) >> 17;
                  else
                    v229 = v227 >> (((939524096 - v226) >> 23) + 18);
                }
                else if (v226 != 2139095040 || v227 == 0)
                {
                  v229 = 1984;
                }
                else
                {
                  v229 = 2047;
                }
              }
              if (_Q4.i32[0] < 0)
              {
                v233 = 0;
              }
              else
              {
                v230 = _Q4.i32[0] & 0x7F800000;
                v231 = _Q4.i32[0] & 0x7FFFFF;
                if ((_Q4.i32[0] & 0x7F800000u) <= 0x477FFFFF)
                {
                  if (v230 >= 0x38000001)
                    v233 = ((v230 - 939524096) | v231) >> 17;
                  else
                    v233 = v231 >> (((939524096 - v230) >> 23) + 18);
                }
                else if (v230 != 2139095040 || v231 == 0)
                {
                  v233 = 1984;
                }
                else
                {
                  v233 = 2047;
                }
              }
              v149 = (v142 << 22) | (v229 << 11) | v233;
            }
LABEL_501:
            *(_DWORD *)v26 = v149;
          }
          else if (a3 == 80)
          {
            _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x437F0000u)));
            *(int16x4_t *)_Q0.f32 = vrev32_s16(vmovn_s32((int32x4_t)_Q0));
            *(int8x8_t *)_Q0.f32 = vext_s8(*(int8x8_t *)_Q0.f32, *(int8x8_t *)_Q0.f32, 6uLL);
LABEL_390:
            *(int8x8_t *)_Q0.f32 = vmovn_s16((int16x8_t)_Q0);
            *(_DWORD *)v26 = _Q0.i32[0];
          }
          else
          {
            if (a3 != 81)
              goto LABEL_550;
            v130 = _Q4.f32[2];
            if (v16)
            {
              v131 = -_Q4.f32[2];
              if (_Q4.f32[2] >= 0.0)
                v131 = _Q4.f32[2];
              v132 = v131;
              v277 = _Q4;
              if (v132 <= 0.003131)
              {
                *(double *)_Q0.i64 = v132 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v132, 0.416666667);
                _Q4 = v277;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              v190 = *(double *)_Q0.i64;
              if (v130 < 0.0)
                v190 = -v190;
              *(_BYTE *)v26 = (int)(float)(v190 * 255.0);
              v191 = _Q4.f32[1];
              v192 = -_Q4.f32[1];
              if (_Q4.f32[1] >= 0.0)
                v192 = _Q4.f32[1];
              v193 = v192;
              if (v193 <= 0.003131)
              {
                *(double *)_Q0.i64 = v193 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v193, 0.416666667);
                _Q4 = v277;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              v204 = *(double *)_Q0.i64;
              if (v191 < 0.0)
                v204 = -v204;
              *(_BYTE *)(v26 + 1) = (int)(float)(v204 * 255.0);
              v205 = -_Q4.f32[0];
              if (_Q4.f32[0] >= 0.0)
                v205 = _Q4.f32[0];
              v206 = v205;
              if (v206 <= 0.003131)
              {
                *(double *)_Q0.i64 = v206 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v206, 0.416666667);
                _Q4 = v277;
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              v216 = *(double *)_Q0.i64;
              v217 = -v216;
              _NF = _Q4.f32[0] < 0.0;
LABEL_531:
              if (_NF)
                v216 = v217;
              *(_BYTE *)(v26 + 2) = (int)(float)(v216 * 255.0);
              v246 = _Q4.f32[3];
              v247 = -_Q4.f32[3];
              if (_Q4.f32[3] >= 0.0)
                v247 = _Q4.f32[3];
              v248 = v247;
              if (v248 <= 0.003131)
              {
                *(double *)_Q0.i64 = v248 * 12.92;
              }
              else
              {
                *(double *)_Q0.i64 = pow(v248, 0.416666667);
                _Q1.i32[1] = -1079236363;
                *(double *)_Q0.i64 = *(double *)_Q0.i64 * 1.055 + -0.055;
              }
              v20 = 0uLL;
              v225 = *(double *)_Q0.i64;
              if (v246 < 0.0)
                v225 = -v225;
            }
            else
            {
              *(_BYTE *)v26 = (int)(float)(_Q4.f32[2] * 255.0);
              *(_BYTE *)(v26 + 1) = (int)vmuls_lane_f32(255.0, *(float32x2_t *)_Q4.f32, 1);
              v167 = 255.0 * _Q4.f32[0];
LABEL_474:
              *(_BYTE *)(v26 + 2) = (int)v167;
              v225 = _Q4.f32[3];
            }
            _Q0.f32[0] = v225 * 255.0;
            *(_BYTE *)(v26 + 3) = (int)_Q0.f32[0];
          }
LABEL_541:
          v138 = 4;
          goto LABEL_542;
        }
        if (a3 <= 109)
        {
          if (a3 == 93)
          {
            v152 = 65408.0;
            if (_Q4.f32[0] < 65408.0)
              v152 = _Q4.f32[0];
            if (_Q4.f32[0] <= 0.0)
              v153 = 0.0;
            else
              v153 = v152;
            v154 = (float32x2_t)vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 4uLL).u64[0];
            v155 = (float32x2_t)vdup_n_s32(0x477F8000u);
            v156 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v154, v155), (int8x8_t)v155, (int8x8_t)v154), (int8x8_t)vcgtz_f32(v154));
            v157 = *(float *)&v156.i32[1];
            v281 = (float32x2_t)v156;
            if (*(float *)v156.i32 >= *(float *)&v156.i32[1])
              v157 = *(float *)v156.i32;
            if (v157 <= v153)
              v158 = v153;
            else
              v158 = v157;
            if ((LODWORD(v158) >> 23) - 127 <= 0xFFFFFFF0)
              v159 = -16;
            else
              v159 = (LODWORD(v158) >> 23) - 127;
            v160 = exp2((double)(v159 - 8));
            _Q2.i64[0] = 0.5;
            v161 = vcvtmd_s64_f64(v158 / v160 + 0.5);
            if (v161 == 512)
            {
              v160 = v160 + v160;
              v162 = v159 + 17;
            }
            else
            {
              if (v161 >= 0x200)
                RGBFloat32ToShareExponent32();
              v162 = v159 + 16;
            }
            v177 = vcvtmd_s64_f64(v153 / v160 + 0.5);
            v16 = a2;
            if (v177 >= 0x200)
              RGBFloat32ToShareExponent32();
            __asm { FMOV            V1.2D, #0.5 }
            _Q0 = (float32x4_t)vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v281), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v160, 0)), (float64x2_t)_Q1)));
            *(int32x2_t *)_Q0.f32 = vmovn_s64((int64x2_t)_Q0);
            if (_Q0.i32[0] >= 0x200u)
              RGBFloat32ToShareExponent32();
            if (_Q0.i32[1] >= 0x200u)
              RGBFloat32ToShareExponent32();
            v178 = (int32x2_t)vand_s8((int8x8_t)vshl_u32(*(uint32x2_t *)_Q0.f32, (uint32x2_t)0x1200000009), (int8x8_t)0x7FC00000003FE00);
            *(int32x2_t *)_Q1.f32 = vdup_lane_s32(v178, 1);
            *(int8x8_t *)_Q0.f32 = vorr_s8((int8x8_t)v178, *(int8x8_t *)_Q1.f32);
            *(_DWORD *)v26 = _Q0.i32[0] | (v162 << 27) | v177;
            v138 = 4;
            v20 = 0uLL;
            goto LABEL_542;
          }
          if (a3 != 105)
            goto LABEL_550;
          *(_QWORD *)v26 = _Q4.i64[0];
          goto LABEL_337;
        }
        if (a3 == 110)
        {
          _Q0 = (float32x4_t)vcvtq_u32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x477FFF00u)));
        }
        else
        {
          if (a3 != 112)
LABEL_550:
            slowConvert_cold_2();
          _Q0 = (float32x4_t)vcvtq_s32_f32(vmulq_f32(_Q4, (float32x4_t)vdupq_n_s32(0x46FFFE00u)));
        }
        *(int16x4_t *)_Q0.f32 = vmovn_s32((int32x4_t)_Q0);
      }
LABEL_336:
      *(_QWORD *)v26 = _Q0.i64[0];
LABEL_337:
      v138 = 8;
LABEL_542:
      v27 = (uint16x4_t *)((char *)v27 + v42);
      v26 += v138;
      if (!--v25)
        goto LABEL_543;
    }
    if (a7 <= 11)
    {
      switch(a7)
      {
        case 1:
          _Q0.i8[0] = v27->i8[0];
          _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
          _Q4.i64[0] = 0;
          _Q4.i32[2] = 0;
          break;
        case 10:
          _Q0.i8[0] = v27->i8[0];
          _Q4.f32[0] = (float)_Q0.u32[0] / 255.0;
LABEL_117:
          _Q4.i32[1] = 0;
          _Q4.i32[2] = 0;
          _Q0.i32[0] = 1.0;
          break;
        case 11:
          _Q0.i8[0] = v27->i8[0];
          _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
          _Q1.i8[4] = 0;
          _Q1.i8[5] = 0;
          _Q1.i8[6] = 0;
          _Q1.i8[7] = 0;
          _Q1.i8[8] = 0;
          _Q1.i8[9] = 0;
          _Q1.i8[10] = 0;
          _Q1.i8[11] = 0;
          _Q1.i8[12] = 0;
          _Q1.i8[13] = 0;
          _Q1.i8[14] = 0;
          _Q1.i8[15] = 0;
          _Q1.i32[0] = _Q0.i32[0];
          if (v16)
          {
            v31 = _Q0.f32[0];
            if (v31 <= 0.04045)
            {
              *(double *)_Q0.i64 = v31 / 12.92;
            }
            else
            {
              v270 = _Q1;
              *(double *)_Q0.i64 = pow((v31 + 0.055) / 1.055, 2.4);
              _Q1 = v270;
              v20 = 0uLL;
            }
            _Q0.f32[0] = *(double *)_Q0.i64;
            _Q1.i32[0] = _Q0.i32[0];
          }
          _Q4 = (float32x4_t)xmmword_1D423FF20;
          _Q4.i32[0] = _Q1.i32[0];
          goto LABEL_129;
        default:
          goto LABEL_62;
      }
      _Q4.i32[3] = _Q0.i32[0];
LABEL_129:
      v42 = 1;
      goto LABEL_229;
    }
    switch(a7)
    {
      case 20:
        _Q0.i16[0] = v27->i16[0];
        _Q4.f32[0] = (float)_Q0.u32[0] / 65535.0;
        goto LABEL_96;
      case 21:
      case 23:
      case 24:
      case 26:
      case 27:
      case 28:
      case 29:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        goto LABEL_62;
      case 22:
        v59 = v27->i16[0];
        if ((float)((float)v59 / 32767.0) >= v22)
          _Q4.f32[0] = (float)v59 / 32767.0;
        else
          _Q4.f32[0] = v22;
        goto LABEL_96;
      case 25:
        _H0 = v27->i16[0];
        __asm { FCVT            S4, H0 }
LABEL_96:
        _Q4.i32[1] = 0;
        goto LABEL_105;
      case 30:
        v61.i32[0] = v27->u8[0];
        v61.i32[1] = v27->u8[1];
        _Q1.i32[1] = v262.i32[1];
        *(float32x2_t *)_Q4.f32 = vdiv_f32(vcvt_f32_u32(v61), v262);
        _Q0 = v267;
        _Q4.i64[1] = v267.i64[0];
        goto LABEL_113;
      case 31:
        _Q0.i8[0] = v27->i8[0];
        _Q0.f32[0] = (float)_Q0.u32[0] / 255.0;
        _Q2.i8[0] = v27->i8[1];
        *(float *)_Q2.i32 = (float)_Q2.u32[0];
        _Q1.f32[0] = *(float *)_Q2.i32 / 255.0;
        _Q4.i32[0] = _Q0.i32[0];
        _Q4.f32[1] = *(float *)_Q2.i32 / 255.0;
        if (v16)
        {
          v62 = _Q0.f32[0];
          if (v62 <= 0.04045)
          {
            v64 = v62 / 12.92;
          }
          else
          {
            v254 = _Q1;
            v63 = pow((v62 + 0.055) / 1.055, 2.4);
            _Q1 = v254;
            v64 = v63;
          }
          v109 = _Q1.f32[0];
          if (_Q1.f32[0] <= 0.04045)
            v110 = v109 / 12.92;
          else
            v110 = pow((v109 + 0.055) / 1.055, 2.4);
          v111 = v64;
          _Q4.f32[0] = v111;
          v112 = v110;
          _Q4.f32[1] = v112;
          v20 = 0uLL;
        }
        _Q0 = (float32x4_t)xmmword_1D423FF20;
        _Q4.i64[1] = 0x3F80000000000000;
        goto LABEL_113;
      case 32:
        if ((float)((float)v27->i8[0] / 127.0) >= v22)
          _Q4.f32[0] = (float)v27->i8[0] / 127.0;
        else
          _Q4.f32[0] = v22;
        _Q4.f32[1] = (float)v27->i8[1] / 127.0;
LABEL_105:
        _Q4.i32[2] = 0;
        goto LABEL_107;
      case 40:
        v65 = v27->u16[0];
        _Q0.i32[0] = v65;
        _Q1.i32[0] = vshr_n_u32(*(uint32x2_t *)_Q0.f32, 0xBuLL).u32[0];
        _Q0.i32[1] = v65 >> 5;
        _Q2.i64[0] = 0x3F0000003FLL;
        _Q1.i32[1] = vand_s8(*(int8x8_t *)&_Q0, (int8x8_t)0x3F0000003FLL).i32[1];
        *(float32x2_t *)_Q0.f32 = vcvt_f32_s32(*(int32x2_t *)_Q1.f32);
        _Q1.i32[1] = 1115422720;
        *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, (float32x2_t)0x427C000041F80000);
        _Q4.f32[2] = (float)(v65 & 0x1F) / 31.0;
LABEL_107:
        _Q0.i32[0] = 1.0;
        goto LABEL_112;
      case 41:
        v71 = v27->u16[0];
        _Q0.f32[0] = (float)(v71 >> 11) / 31.0;
        __asm { FMOV            V2.2S, #31.0 }
        *(float32x2_t *)_Q1.f32 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v71), (uint32x2_t)-6), (int8x8_t)0x1F0000001FLL)), *(float32x2_t *)_Q2.i8);
        _Q0 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 4uLL);
        _Q4 = (float32x4_t)vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q1, 0xCuLL);
        v70 = v71 & 1;
        goto LABEL_111;
      case 42:
        v66 = v27->u16[0];
        _Q0.i32[0] = v66;
        v67 = vshrq_n_u32((uint32x4_t)_Q0, 0xCuLL).u32[0];
        _Q0.i32[1] = v66 >> 8;
        _Q0.i32[2] = v66 >> 4;
        _Q0.i32[3] = v66;
        _Q2.i64[0] = 0xF0000000FLL;
        _Q2.i64[1] = 0xF0000000FLL;
        v68 = (int32x4_t)vandq_s8((int8x16_t)_Q0, _Q2);
        v68.i32[0] = v67;
        _Q0 = vcvtq_f32_s32(v68);
        __asm { FMOV            V1.4S, #15.0 }
        _Q4 = vdivq_f32(_Q0, _Q1);
        goto LABEL_113;
      case 43:
        v69 = v27->u16[0];
        *(float32x2_t *)_Q0.f32 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v69), (uint32x2_t)0xFFFFFFFBFFFFFFF6), (int8x8_t)0x1F0000001FLL));
        __asm { FMOV            V1.2S, #31.0 }
        *(float32x2_t *)_Q4.f32 = vdiv_f32(*(float32x2_t *)_Q0.f32, *(float32x2_t *)_Q1.f32);
        _Q4.f32[2] = (float)(v69 & 0x1F) / 31.0;
        v70 = v69 >> 15;
LABEL_111:
        _Q0.f32[0] = (float)v70;
LABEL_112:
        _Q4.i32[3] = _Q0.i32[0];
LABEL_113:
        v42 = 2;
        goto LABEL_229;
      default:
        if (a7 == 12)
        {
          if ((float)((float)v27->i8[0] / 127.0) >= v22)
            _Q4.f32[0] = (float)v27->i8[0] / 127.0;
          else
            _Q4.f32[0] = v22;
          goto LABEL_117;
        }
        if (a7 != 55)
          goto LABEL_62;
        _Q4.i64[0] = v27->u32[0];
        _Q4.i32[2] = 0;
        break;
    }
LABEL_89:
    _Q0.i32[0] = 1.0;
    _Q4.i32[3] = 1.0;
    goto LABEL_228;
  }
}

void newScaledImageWithLancosFilter_cold_1()
{
  __assert_rtn("newScaledImageWithLancosFilter", "TXRDataScaler.m", 204, "!\"Unrecognized scale filter\"");
}

void newScaledImageWithLancosFilter_cold_2()
{
  __assert_rtn("newScaledImageWithLancosFilter", "TXRDataScaler.m", 268, "!\"VImage scale error\"");
}

void RGBFloat32ToShareExponent32()
{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 121, "rm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 122, "gm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 123, "bm <= MAX_RGB9E5_MANTISSA");
}

{
  __assert_rtn("RGBFloat32ToShareExponent32", "TXRFloatConvert.h", 114, "maxm <= MAX_RGB9E5_MANTISSA");
}

void pixelBytes_cold_1()
{
  __assert_rtn("pixelBytes", "TXRFormatInfoFuncs.h", 518, "!\"Unhandled or compressed format\"");
}

void componentsPerPixel_cold_1()
{
  __assert_rtn("componentsPerPixel", "TXRFormatInfoFuncs.h", 441, "!\"Unhandled format\"");
}

void slowConvert_cold_1()
{
  __assert_rtn("convertToFloat4Slow", "TXRFloatConvert.h", 1130, "!\"Unhandled Format\"");
}

void slowConvert_cold_2()
{
  __assert_rtn("convertFromFloat4Slow", "TXRFloatConvert.h", 773, "!\"Unhandled Format\"");
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1E0C9BF28](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

float at_encoder_compress_texels(at_encoder_t encoder, const at_texel_region_t *src, const at_block_buffer_t *dest, float errorThreshold, at_flags_t flags)
{
  float result;

  MEMORY[0x1E0DE4080](encoder, src, dest, flags, errorThreshold);
  return result;
}

at_encoder_t at_encoder_create(at_texel_format_t texelType, at_alpha_t texelAlphaType, at_block_format_t blockType, at_alpha_t blockAlphaType, const float *backgroundColor)
{
  return (at_encoder_t)MEMORY[0x1E0DE4088](texelType, *(_QWORD *)&texelAlphaType, blockType, *(_QWORD *)&blockAlphaType, backgroundColor);
}

at_error_t at_encoder_decompress_texels(at_encoder_t encoder, const at_block_buffer_t *src, const at_texel_region_t *dest, at_flags_t flags)
{
  return MEMORY[0x1E0DE4090](encoder, src, dest, flags);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DBF0](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGBFFFFtoARGB8888_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, int dither, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8DBF8](src, dest, maxFloat, minFloat, *(_QWORD *)&dither, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC10](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC18](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC20](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC30](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC38](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_ARGB_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC40](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC48](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_FFFF backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC50](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC58](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC60](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC68](src, dest, rotationConstant, *(_QWORD *)&flags, backColor);
}

vImage_Error vImageScale_ARGB16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC70](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC78](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC80](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC88](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC90](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DC98](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCA0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCA8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCB0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCB8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCC0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8DCC8](src, dest, *(_QWORD *)&flags);
}

