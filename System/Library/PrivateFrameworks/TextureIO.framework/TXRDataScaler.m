@implementation TXRDataScaler

+ (id)newImageFromSourceImage:(id)a3 bufferAllocattor:(id)a4 filter:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  int32x4_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  void *v19;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "dimensions");
  v15.i32[0] = 0;
  v13 = (int32x4_t)vshrq_n_u32(v12, 1uLL);
  v14 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v13, v15), 0);
  v15.i64[0] = 0x100000001;
  v16.i32[0] = 1;
  v16.i32[1] = v13.i32[1];
  v16.i64[1] = v13.u32[2] | 0x100000000;
  v17 = vbslq_s8(v14, v16, (int8x16_t)v13);
  v18 = v17;
  if (!v17.i32[1])
  {
    v15.i32[0] = v17.i32[0];
    v15.i64[1] = __PAIR64__(v13.u32[3], v17.u32[2]);
    v18 = (int8x16_t)v15;
  }
  if (!v18.i32[2])
    v15.i64[0] = v18.i64[0];
  v19 = (void *)objc_msgSend(a1, "newImageFromSourceImage:scaledDimensions:bufferAllocattor:filter:error:", v11, v10, a5, a6, *(double *)v18.i64, *(double *)v15.i64);

  return v19;
}

+ (id)newImageFromSourceImage:(id)a3 scaledDimensions:(id)a4 bufferAllocattor:(unint64_t)a5 filter:(id *)a6 error:
{
  __n128 v6;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  __n128 v14;
  unsigned __int32 v15;
  unsigned __int32 v16;
  BOOL v17;
  unsigned __int32 v18;
  unsigned __int32 v19;
  unint64_t v20;
  void *v21;
  __n128 v23;

  v23 = v6;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "dimensions");
  v13 = v12;
  v14 = v23;
  if (v13 >= v23.n128_u32[0] && (objc_msgSend(v10, "dimensions"), v16 = v15, v14 = v23, v16 >= v23.n128_u32[1]))
  {
    objc_msgSend(v10, "dimensions");
    v19 = v18;
    v14 = v23;
    v17 = v19 < v23.n128_u32[2];
  }
  else
  {
    v17 = 1;
  }
  if (a5 == 2 && v17)
    v20 = 0;
  else
    v20 = a5;
  if (v20 > 1)
  {
    if (v20 == 2)
      +[TXRDataScaler newImageFromSourceImage:scaledDimensions:bufferAllocattor:filter:error:].cold.1(v10, v11);
    if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Unsupported filter"));
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    newScaledImageWithLancosFilter(v10, v11, v20, a6, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (void)newImageFromSourceImage:(void *)a1 scaledDimensions:(void *)a2 bufferAllocattor:filter:error:.cold.1(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a1;
  v4 = a2;
  __assert_rtn("newScaledImageWithBoxFilter", "TXRDataScaler.m", 382, "!\"TODO:Box filter needs implementation\");
}

@end
