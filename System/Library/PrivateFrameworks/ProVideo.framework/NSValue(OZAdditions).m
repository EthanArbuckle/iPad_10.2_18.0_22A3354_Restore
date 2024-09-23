@implementation NSValue(OZAdditions)

- (double)oz_CGSizeValue
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

+ (uint64_t)oz_valueWithCGSize:()OZAdditions
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "[2d]");
}

- (double)oz_SIMDFloat2Value
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v2, 8);
  return *(double *)v2;
}

- (double)oz_SIMDDouble2Value
{
  double v2[3];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return v2[0];
}

+ (uint64_t)oz_valueWithSIMDFloat2:()OZAdditions
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  *(double *)v2 = a1;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v2, "[2f]");
}

+ (uint64_t)oz_valueWithSIMDDouble2:()OZAdditions
{
  __n128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v2, "[2d]");
}

- (double)oz_SIMDFloat3Value
{
  double v2[3];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v2, 12);
  return v2[0];
}

- (__n128)oz_SIMDDouble3Value
{
  __n128 result;
  __n128 v4;
  __n128 v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", &v5, 24);
  result = v5;
  v4.n128_u64[0] = v6;
  *a2 = v5;
  a2[1] = v4;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat3:()OZAdditions
{
  unint64_t v2;
  unsigned __int32 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = a1.n128_u64[0];
  v3 = a1.n128_u32[2];
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v2, "[3f]");
}

+ (uint64_t)oz_valueWithSIMDDouble3:()OZAdditions
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *((_QWORD *)a3 + 2);
  v5 = *a3;
  v6 = v3;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v5, "[3d]");
}

- (__n64)oz_SIMDFloat3x3Value
{
  __n64 result;
  _DWORD v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v2, 36);
  result.n64_u32[0] = v2[0];
  result.n64_u32[1] = *(_DWORD *)((unint64_t)v2 | 0xC);
  return result;
}

- (__n128)oz_SIMDDouble3x3Value
{
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v9, 72);
  result.n128_u64[0] = v9[0];
  *(_QWORD *)&v3 = v9[1];
  result.n128_u64[1] = v9[3];
  *((_QWORD *)&v3 + 1) = v9[4];
  *(_QWORD *)&v5 = v9[6];
  *(_QWORD *)&v6 = v9[7];
  *(_QWORD *)&v7 = v9[2];
  *(_QWORD *)&v8 = v9[8];
  *((_QWORD *)&v7 + 1) = v9[5];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v8;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat3x3:()OZAdditions
{
  int32x2_t v3;
  _QWORD v5[4];
  unsigned __int32 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = vzip2_s32(*(int32x2_t *)a2.i8, (int32x2_t)a3.n128_u64[0]);
  v6 = a3.n128_u32[2];
  a3.n128_u32[1] = a1.u32[1];
  v5[0] = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  v5[1] = a3.n128_u64[0];
  v5[2] = v3;
  v5[3] = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL));
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "[9f]");
}

+ (uint64_t)oz_valueWithSIMDDouble3x3:()OZAdditions
{
  int64x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  int64x2_t v7;
  int64x2_t v8;
  _OWORD v10[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3[1];
  v4 = a3[2];
  v5 = a3[3];
  v6 = vzip1q_s64(*a3, v4);
  v7 = a3[4];
  v8 = vzip2q_s64(v4, v7);
  v7.i64[1] = a3->i64[1];
  v10[0] = v6;
  v10[1] = v7;
  v10[2] = v8;
  v10[3] = vzip1q_s64(v3, v5);
  v11 = a3[5].i64[0];
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v10, "[9d]");
}

- (double)oz_SIMDFloat4x4Value
{
  __int128 v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", &v2, 64);
  return COERCE_DOUBLE(__PAIR64__(v3, v2));
}

- (__n128)oz_SIMDDouble4x4Value
{
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[17];

  v11[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getValue:size:", v11, 128);
  result.n128_u64[0] = v11[0];
  *(_QWORD *)&v3 = v11[1];
  result.n128_u64[1] = v11[4];
  *(_QWORD *)&v5 = v11[8];
  *(_QWORD *)&v6 = v11[9];
  *((_QWORD *)&v5 + 1) = v11[12];
  *((_QWORD *)&v3 + 1) = v11[5];
  *((_QWORD *)&v6 + 1) = v11[13];
  *(_QWORD *)&v7 = v11[2];
  *(_QWORD *)&v8 = v11[3];
  *((_QWORD *)&v7 + 1) = v11[6];
  *(_QWORD *)&v9 = v11[10];
  *(_QWORD *)&v10 = v11[11];
  *((_QWORD *)&v9 + 1) = v11[14];
  *((_QWORD *)&v8 + 1) = v11[7];
  *((_QWORD *)&v10 + 1) = v11[15];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v9;
  *(_OWORD *)(a2 + 96) = v8;
  *(_OWORD *)(a2 + 112) = v10;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat4x4:()OZAdditions
{
  int8x8_t v4;
  int8x8_t v5;
  uint64_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v10;
  unsigned __int32 v11;
  unint64_t v12;
  int32x2_t v13;
  int8x8_t v14;
  int32x2_t v15;
  uint64_t v16;
  int32x2_t v17;
  unsigned __int32 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  v4 = (int8x8_t)vextq_s8(a1, a1, 8uLL).u64[0];
  v5 = vext_s8(*(int8x8_t *)a4.i8, v4, 4uLL);
  LODWORD(v6) = vextq_s8(a4, a4, 8uLL).u32[0];
  v18 = a4.u32[3];
  a4.i32[1] = a1.i32[1];
  v12 = a4.i64[0];
  v13 = vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8);
  v11 = a3.i32[0];
  v14 = v5;
  v7 = (int32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  v8 = (int32x2_t)vextq_s8(a2, a2, 8uLL).u64[0];
  HIDWORD(v6) = v4.i32[1];
  v15 = vzip1_s32(v8, v7);
  v16 = v6;
  v17 = vzip2_s32(v8, v7);
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v10, "[16f]");
}

+ (uint64_t)oz_valueWithSIMDDouble4x4:()OZAdditions
{
  int8x16_t v3;
  int8x16_t v4;
  int64x2_t v5;
  int64x2_t v6;
  int64x2_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int8x16_t v10;
  int8x16_t v11;
  uint64_t v13;
  int64x2_t v14;
  int8x16_t v15;
  int64x2_t v16;
  int8x16_t v17;
  int64x2_t v18;
  uint64_t v19;
  int64x2_t v20;
  int64x2_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(int8x16_t *)a3;
  v3 = *((int8x16_t *)a3 + 1);
  v13 = *(_QWORD *)a3;
  v6 = *((int64x2_t *)a3 + 2);
  v5 = *((int64x2_t *)a3 + 3);
  v7 = *((int64x2_t *)a3 + 4);
  v8 = *((int64x2_t *)a3 + 5);
  v14 = vzip1q_s64(v6, v7);
  v10 = *((int8x16_t *)a3 + 6);
  v9 = *((int64x2_t *)a3 + 7);
  v11 = vextq_s8(v10, v3, 8uLL);
  v10.i64[1] = v4.i64[1];
  v15 = v10;
  v16 = vzip2q_s64(v6, v7);
  v17 = v11;
  v18 = vzip1q_s64(v5, v8);
  v19 = v9.i64[0];
  v20 = vzip2q_s64((int64x2_t)v3, v5);
  v21 = vzip2q_s64(v8, v9);
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v13, "[16d]");
}

@end
