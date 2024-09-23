@implementation ZN12

int32x4_t *___ZN12_GLOBAL__N_117NeighborMapHelper7ComputeERKNSt3__113unordered_mapIDv3_iiN5utils8SimdHashIS3_EENS4_9SimdEqualIS3_EENS1_9allocatorINS1_4pairIKS3_iEEEEEERKNS1_6vectorIS3_NS9_IS3_EEEEjib_block_invoke(int32x4_t *result, uint64_t a2, int32x4_t a3)
{
  int32x4_t *v3;
  int32x4_t v4;
  const float *v5;
  unsigned __int32 *v6;
  unsigned __int32 *v7;
  uint64_t v8;
  __int32 *v9;
  __int32 *v10;
  __int32 *v11;
  __int32 *v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;

  v3 = result;
  v4 = *(int32x4_t *)(*(_QWORD *)result[2].i64[1] + 16 * a2);
  if (!result[5].i8[8])
  {
    v5 = (const float *)&result[5].i32[1];
    a3 = (int32x4_t)vld1q_dup_f32(v5);
    v4 = vmulq_s32(a3, v4);
  }
  v6 = (unsigned __int32 *)result[3].i64[0];
  v7 = (unsigned __int32 *)result[3].i64[1];
  if (v6 != v7)
  {
    v8 = result[5].i32[0] * a2 * result[5].i32[0] * result[5].i32[0];
    v16 = v4;
    do
    {
      v9 = (__int32 *)v3[3].i64[0];
      v10 = (__int32 *)v3[3].i64[1];
      if (v9 != v10)
      {
        a3.i32[0] = *v6;
        v15 = a3;
        do
        {
          v11 = (__int32 *)v3[3].i64[0];
          v12 = (__int32 *)v3[3].i64[1];
          if (v11 != v12)
          {
            v13 = v15;
            v13.i32[1] = *v9;
            v13.i32[2] = v15.i32[2];
            v17 = v13;
            do
            {
              v14 = v17;
              v14.i32[2] = *v11;
              v18 = vaddq_s32(v14, v4);
              result = _ZNKSt3__112__hash_tableINS_17__hash_value_typeIDv3_iiEENS_22__unordered_map_hasherIS2_S3_N5utils8SimdHashIS2_EENS5_9SimdEqualIS2_EELb1EEENS_21__unordered_map_equalIS2_S3_S9_S7_Lb1EEENS_9allocatorIS3_EEE4findIS2_EENS_21__hash_const_iteratorIPNS_11__hash_nodeIS3_PvEEEERKT_((_QWORD *)v3[4].i64[1], &v18);
              if (result)
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3[2].i64[0] + 8) + 48) + 4 * v8) = result[2].i32[0];
              ++v8;
              ++v11;
              v4 = v16;
            }
            while (v11 != v12);
          }
          ++v9;
        }
        while (v9 != v10);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return result;
}

@end
