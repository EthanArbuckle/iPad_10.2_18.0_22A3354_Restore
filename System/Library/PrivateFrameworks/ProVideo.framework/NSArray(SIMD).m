@implementation NSArray(SIMD)

+ (id)arrayWithSIMDFloat2:()SIMD
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  int v6;
  _QWORD v7[3];

  v6 = HIDWORD(a1);
  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  HIDWORD(v2) = v6;
  LODWORD(v2) = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)arrayWithSIMDFloat3:()SIMD
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)arrayWithSIMDFloat4:()SIMD
{
  void *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)arrayWithSIMDFloat8:()SIMD
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v15 = *a3;
  v16 = a3[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  HIDWORD(v4) = DWORD1(v15);
  LODWORD(v4) = DWORD1(v15);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v15), DWORD2(v15))));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v15), HIDWORD(v15))));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v8;
  HIDWORD(v9) = DWORD1(v16);
  LODWORD(v9) = DWORD1(v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v16), DWORD2(v16))));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v16), HIDWORD(v16))));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)arrayWithSIMDFloat16:()SIMD
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[18];

  v28[16] = *MEMORY[0x1E0C80C00];
  v26 = a3[2];
  v27 = a3[3];
  v24 = *a3;
  v25 = a3[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  HIDWORD(v3) = DWORD1(v24);
  LODWORD(v3) = DWORD1(v24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v24), DWORD2(v24))));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v24), HIDWORD(v24))));
  *(_QWORD *)&v24 = objc_claimAutoreleasedReturnValue();
  v28[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v20;
  HIDWORD(v4) = DWORD1(v25);
  LODWORD(v4) = DWORD1(v25);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v25), DWORD2(v25))));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v25), HIDWORD(v25))));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v6;
  HIDWORD(v7) = DWORD1(v26);
  LODWORD(v7) = DWORD1(v26);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v26), DWORD2(v26))));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v26), HIDWORD(v26))));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v11;
  HIDWORD(v12) = DWORD1(v27);
  LODWORD(v12) = DWORD1(v27);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[13] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v27), DWORD2(v27))));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[14] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v27), HIDWORD(v27))));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[15] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)arrayWithSIMDDouble2:()SIMD
{
  void *v1;
  void *v2;
  void *v3;
  double v5;
  _QWORD v6[3];

  v5 = a1.n128_f64[1];
  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1.n128_u64[0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)arrayWithSIMDDouble3:()SIMD
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9 = *(_OWORD *)a3;
  v3 = a3[2];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(_QWORD *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v9 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayWithSIMDDouble4:()SIMD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  double v10[3];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v9 = *a3;
  *(_OWORD *)v10 = a3[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(_QWORD *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v9 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10[1]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)arrayWithSIMDDouble8:()SIMD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16[3];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v15 = a3[2];
  *(_OWORD *)v16 = a3[3];
  v13 = *a3;
  v14 = a3[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(_QWORD *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v13 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v14 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v15 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)arrayWithSIMDFloat3x3:()SIMD
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v20[10];

  v20[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2.n128_f64[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.n128_f64[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v5;
  HIDWORD(v6) = a1.n128_u32[1];
  LODWORD(v6) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v7;
  HIDWORD(v8) = a2.n128_u32[1];
  LODWORD(v8) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  HIDWORD(v10) = a3.n128_u32[1];
  LODWORD(v10) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)arrayWithSIMDDouble3x3:()SIMD
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[4], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[9]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[2]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)arrayWithSIMDFloat4x4:()SIMD
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v30[18];

  v30[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2.n128_f64[0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3.n128_f64[0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4.n128_f64[0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v22;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v21;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v20;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v19;
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[13] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[14] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[15] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)arrayWithSIMDDouble4x4:()SIMD
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[18];

  v22[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[4]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[12]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[1]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[9]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[13]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[14]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[3]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[11]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[15]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)arrayWithSIMDQuatD:()SIMD
{
  __int128 v3;
  _OWORD v5[2];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  objc_msgSend(a1, "arrayWithSIMDDouble4:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__n128)SIMDFloat2
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  int v6;
  __int128 v8;
  __int128 v9;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  *(_QWORD *)&v8 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "floatValue");
  v5 = v8;
  DWORD1(v5) = v6;
  v9 = v5;

  return (__n128)v9;
}

- (__n128)SIMDFloat3
{
  id v1;
  void *v2;
  unsigned __int32 v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  __n128 result;
  unsigned __int32 v9;
  unsigned __int32 v10;
  unsigned __int32 v11;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v11 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v10 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

- (__n128)SIMDFloat4
{
  id v1;
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v14 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "floatValue");
  *(_QWORD *)&v9 = __PAIR64__(v13, v14);
  *((_QWORD *)&v9 + 1) = __PAIR64__(v10, v12);
  v15 = v9;

  return (__n128)v15;
}

- (void)SIMDFloat8
{
  id v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  __int128 v18;
  unsigned int v19;
  __int128 v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v27 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v26 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v25 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v24 = v10;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v23 = v12;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v22 = v14;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v21 = v16;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "floatValue");
  *(_QWORD *)&v18 = __PAIR64__(v22, v23);
  *((_QWORD *)&v18 + 1) = __PAIR64__(v19, v21);
  *(_QWORD *)&v20 = __PAIR64__(v26, v27);
  *((_QWORD *)&v20 + 1) = __PAIR64__(v24, v25);
  *a2 = v20;
  a2[1] = v18;

}

- (void)SIMDFloat16
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  __int128 v27;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v48 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "floatValue");
  v46 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "floatValue");
  v45 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "floatValue");
  v43 = v7;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "floatValue");
  v42 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "floatValue");
  v41 = v9;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "floatValue");
  v40 = v10;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  v39 = v11;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v38 = v13;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v37 = v15;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v36 = v17;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v35 = v19;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v34 = v21;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v33 = v23;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v32 = v25;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "floatValue");
  *(_QWORD *)&v27 = __PAIR64__(v33, v34);
  *((_QWORD *)&v27 + 1) = __PAIR64__(v28, v32);
  v29 = v27;
  *(_QWORD *)&v30 = __PAIR64__(v46, v48);
  *((_QWORD *)&v30 + 1) = __PAIR64__(v43, v45);
  *(_QWORD *)&v27 = __PAIR64__(v41, v42);
  *((_QWORD *)&v27 + 1) = __PAIR64__(v39, v40);
  *(_QWORD *)&v31 = __PAIR64__(v37, v38);
  *((_QWORD *)&v31 + 1) = __PAIR64__(v35, v36);
  *a2 = v30;
  a2[1] = v27;
  a2[2] = v31;
  a2[3] = v29;

}

- (__n128)SIMDDouble2
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v8;
  __int128 v9;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v8 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  *(_QWORD *)&v5 = v8;
  *((_QWORD *)&v5 + 1) = v6;
  v9 = v5;

  return (__n128)v9;
}

- (__n128)SIMDDouble3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  __n128 v9;
  __n128 result;
  __n128 v11;
  unint64_t v12;
  unint64_t v13;
  __n128 v14;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v13 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v12 = v7;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  v14 = v9;

  result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)SIMDDouble4
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v15 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v14 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v13 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  *(_QWORD *)&v10 = v13;
  *((_QWORD *)&v10 + 1) = v11;
  *(_QWORD *)&v12 = v15;
  *((_QWORD *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;

}

- (void)SIMDDouble8
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v29 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v28 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v27 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v26 = v10;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v25 = v12;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v24 = v14;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v23 = v16;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "doubleValue");
  *(_QWORD *)&v18 = v23;
  *((_QWORD *)&v18 + 1) = v19;
  *(_QWORD *)&v20 = v29;
  *((_QWORD *)&v20 + 1) = v28;
  *(_QWORD *)&v21 = v27;
  *((_QWORD *)&v21 + 1) = v26;
  *(_QWORD *)&v22 = v25;
  *((_QWORD *)&v22 + 1) = v24;
  *a2 = v20;
  a2[1] = v21;
  a2[2] = v22;
  a2[3] = v18;

}

- (__n128)SIMDFloat3x3
{
  id v1;
  void *v2;
  unsigned __int32 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int32 v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int32 v11;
  void *v12;
  void *v13;
  __n128 result;
  unsigned __int32 v15;
  unsigned __int32 v16;
  unsigned __int32 v17;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v17 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v16 = v7;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v15 = v11;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "floatValue");
  result.n128_u32[0] = v17;
  result.n128_u32[1] = v16;
  result.n128_u32[2] = v15;
  return result;
}

- (void)SIMDDouble3x3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v31 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v30 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v29 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v28 = v10;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v27 = v12;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v26 = v14;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v25 = v16;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v24 = v18;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  *(_QWORD *)&v20 = v31;
  *((_QWORD *)&v20 + 1) = v28;
  *(_QWORD *)&v21 = v30;
  *((_QWORD *)&v21 + 1) = v27;
  *(_QWORD *)&v22 = v29;
  *((_QWORD *)&v22 + 1) = v26;
  *a2 = v20;
  a2[1] = v25;
  a2[2] = v21;
  a2[3] = v24;
  a2[4] = v22;
  a2[5] = v23;

}

- (__n128)SIMDFloat4x4
{
  id v1;
  unsigned int v2;
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  __int128 v28;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v27 = v2;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v19 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v18 = v6;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v17 = v11;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "floatValue");
  *(_QWORD *)&v15 = __PAIR64__(v19, v27);
  *((_QWORD *)&v15 + 1) = __PAIR64__(v17, v18);
  v28 = v15;

  return (__n128)v28;
}

- (void)SIMDDouble4x4
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v3 = a1;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  v52 = v4;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "doubleValue");
  v50 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "doubleValue");
  v49 = v6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "doubleValue");
  v48 = v7;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  v46 = v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  v45 = v9;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  v44 = v10;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  v43 = v11;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v42 = v13;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v41 = v15;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v40 = v17;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v39 = v19;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v38 = v21;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v37 = v23;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v36 = v25;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "doubleValue");
  *(_QWORD *)&v27 = v52;
  *((_QWORD *)&v27 + 1) = v46;
  *(_QWORD *)&v29 = v41;
  *(_QWORD *)&v28 = v42;
  *(_QWORD *)&v30 = v39;
  *((_QWORD *)&v28 + 1) = v38;
  *(_QWORD *)&v31 = v50;
  *((_QWORD *)&v31 + 1) = v45;
  *((_QWORD *)&v29 + 1) = v37;
  *(_QWORD *)&v32 = v49;
  *((_QWORD *)&v32 + 1) = v44;
  *(_QWORD *)&v33 = v40;
  *((_QWORD *)&v33 + 1) = v36;
  *((_QWORD *)&v30 + 1) = v34;
  *(_QWORD *)&v35 = v48;
  *((_QWORD *)&v35 + 1) = v43;
  *a2 = v27;
  a2[1] = v28;
  a2[2] = v31;
  a2[3] = v29;
  a2[4] = v32;
  a2[5] = v33;
  a2[6] = v35;
  a2[7] = v30;

}

- (double)SIMDQuatD
{
  double result;
  __int128 v4;
  __int128 v5;

  objc_msgSend(a1, "SIMDDouble4");
  result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

@end
