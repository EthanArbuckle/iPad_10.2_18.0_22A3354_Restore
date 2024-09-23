@implementation PVMatrix44Double

+ (id)matrix
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)isMatrix:(id)a3 equivalentTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  char v9;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 == v6 || !(v5 | v6))
    goto LABEL_3;
  if (v5 && v6)
  {
    v9 = objc_msgSend((id)v5, "isEqual:", v6);
LABEL_9:
    v8 = v9;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)v5, "isIdentity") & 1) == 0)
  {
    v9 = objc_msgSend(v7, "isIdentity");
    goto LABEL_9;
  }
LABEL_3:
  v8 = 1;
LABEL_10:

  return v8;
}

+ (id)matrixWithSIMDFloat4x4:(double)a3
{
  return (id)objc_msgSend([a1 alloc], "initWithSIMDFloat4x4:", a2, a3, a4, a5);
}

+ (id)matrixWithSIMDDouble4x4:(_OWORD *)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[8];

  v4 = [a1 alloc];
  v5 = a3[5];
  v10[4] = a3[4];
  v10[5] = v5;
  v6 = a3[7];
  v10[6] = a3[6];
  v10[7] = v6;
  v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  v8 = a3[3];
  v10[2] = a3[2];
  v10[3] = v8;
  return (id)objc_msgSend(v4, "initWithSIMDDouble4x4:", v10);
}

- (PVMatrix44Double)init
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[8];

  v2 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  v7[5] = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 96);
  v7[7] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 16);
  v7[0] = *MEMORY[0x1E0C83FD8];
  v7[1] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 32);
  v7[3] = v5;
  return -[PVMatrix44Double initWithSIMDDouble4x4:](self, "initWithSIMDDouble4x4:", v7);
}

- (void)initWithSIMDFloat4x4:(double)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a1, "init");
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setSIMDFloat4x4:", a2, a3, a4, a5);
  return v6;
}

- (__n128)initWithSIMDDouble4x4:(uint64_t)a3
{
  PVMatrix44Double *v4;
  __n128 result;
  PVMatrix44Double v6;
  PVMatrix44Double v7;
  PVMatrix44Double v8;
  PVMatrix44Double v9;
  PVMatrix44Double v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)PVMatrix44Double;
  v4 = -[PVMatrix44Double init](&v11, sel_init);
  if (v4)
  {
    v6 = *(PVMatrix44Double *)a3;
    v7 = *(PVMatrix44Double *)(a3 + 16);
    v8 = *(PVMatrix44Double *)(a3 + 48);
    v4[3] = *(PVMatrix44Double *)(a3 + 32);
    v4[4] = v8;
    v4[1] = v6;
    v4[2] = v7;
    result = *(__n128 *)(a3 + 64);
    v9 = *(PVMatrix44Double *)(a3 + 80);
    v10 = *(PVMatrix44Double *)(a3 + 112);
    v4[7] = *(PVMatrix44Double *)(a3 + 96);
    v4[8] = v10;
    v4[5] = (PVMatrix44Double)result;
    v4[6] = v9;
  }
  return result;
}

- (double)SIMDFloat4x4
{
  double result;

  *(_QWORD *)&result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[1]), a1[2]).u64[0];
  return result;
}

- (float64x2_t)setSIMDFloat4x4:(float32x4_t)a3
{
  float64x2_t result;

  a1[1] = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  a1[2] = vcvt_hight_f64_f32(a2);
  a1[3] = vcvtq_f64_f32(*(float32x2_t *)a3.f32);
  a1[4] = vcvt_hight_f64_f32(a3);
  a1[5] = vcvtq_f64_f32(*(float32x2_t *)a4.f32);
  a1[6] = vcvt_hight_f64_f32(a4);
  result = vcvt_hight_f64_f32(a5);
  a1[7] = vcvtq_f64_f32(*(float32x2_t *)a5.f32);
  a1[8] = result;
  return result;
}

- (double)valueAtCol:(unint64_t)a3 row:(unint64_t)a4
{
  return *((double *)&self[2 * a3 + 1].super.isa + (a4 & 3));
}

- (void)setValue:(double)a3 col:(unint64_t)a4 row:(unint64_t)a5
{
  *((double *)&self[2 * a4 + 1].super.isa + a5) = a3;
}

- (BOOL)isFinite
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v7[8];

  v2 = (__int128)self[6];
  v7[4] = (__int128)self[5];
  v7[5] = v2;
  v3 = (__int128)self[8];
  v7[6] = (__int128)self[7];
  v7[7] = v3;
  v4 = (__int128)self[2];
  v7[0] = (__int128)self[1];
  v7[1] = v4;
  v5 = (__int128)self[4];
  v7[2] = (__int128)self[3];
  v7[3] = v5;
  return pv_is_finite(v7);
}

- (BOOL)isIdentity
{
  float64x2_t v2;
  int64x2_t v3;

  v2 = (float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL);
  v3 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[3], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[1], *MEMORY[0x1E0C83FD8]))), vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[5], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[7], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[4], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48))), (int8x16_t)vcgeq_f64(
                                     v2,
                                     vabdq_f64((float64x2_t)self[2], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16)))),
                      vandq_s8((int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[6], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80))), (int8x16_t)vcgeq_f64(v2, vabdq_f64((float64x2_t)self[8], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112))))));
  return vandq_s8((int8x16_t)v3, (int8x16_t)vdupq_laneq_s64(v3, 1)).u64[0] >> 63;
}

- (void)makeIdentity
{
  PVMatrix44Double *v2;
  PVMatrix44Double v3;
  PVMatrix44Double v4;
  PVMatrix44Double v5;
  PVMatrix44Double v6;

  v2 = (PVMatrix44Double *)MEMORY[0x1E0C83FD8];
  v3 = *(PVMatrix44Double *)(MEMORY[0x1E0C83FD8] + 80);
  self[5] = *(PVMatrix44Double *)(MEMORY[0x1E0C83FD8] + 64);
  self[6] = v3;
  v4 = v2[7];
  self[7] = v2[6];
  self[8] = v4;
  v5 = v2[1];
  self[1] = *v2;
  self[2] = v5;
  v6 = v2[3];
  self[3] = v2[2];
  self[4] = v6;
}

- (void)transpose
{
  const double *v2;
  const double *v3;
  float64x2x4_t v4;
  float64x2x4_t v5;

  v2 = (const double *)&self[1];
  v4 = vld4q_f64(v2);
  v3 = (const double *)&self[5];
  v5 = vld4q_f64(v3);
  self[1] = (PVMatrix44Double)v4.val[0];
  self[2] = (PVMatrix44Double)v5.val[0];
  self[3] = (PVMatrix44Double)v4.val[1];
  self[4] = (PVMatrix44Double)v5.val[1];
  self[5] = (PVMatrix44Double)v4.val[2];
  self[6] = (PVMatrix44Double)v5.val[2];
  self[7] = (PVMatrix44Double)v4.val[3];
  self[8] = (PVMatrix44Double)v5.val[3];
}

- (void)getTransformInfo:(_OWORD *)a3@<X8>
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a2)
    *a2 = 0;
  a3[4] = xmmword_1B304F040;
  a3[5] = unk_1B304F050;
  a3[6] = xmmword_1B304F060;
  a3[7] = unk_1B304F070;
  *a3 = pv_transform_info_identity;
  a3[1] = *(_OWORD *)algn_1B304F010;
  a3[2] = xmmword_1B304F020;
  a3[3] = unk_1B304F030;
  v5 = a1[6];
  v15[4] = a1[5];
  v15[5] = v5;
  v6 = a1[8];
  v15[6] = a1[7];
  v15[7] = v6;
  v7 = a1[2];
  v15[0] = a1[1];
  v15[1] = v7;
  v8 = a1[4];
  v15[2] = a1[3];
  v15[3] = v8;
  v9 = pv_transform_info_make((uint64_t)v15, (uint64_t)a3);
  if (a2)
  {
    if (!v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "compactDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to get transformInfo for matrix: %p %@"), a1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVMatrix"), 1, v14);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVMatrix44Double)initWithCoder:(id)a3
{
  id v4;
  PCMatrix44Double *v5;
  PVMatrix44Double *v6;
  PVMatrix44Double *v7;
  uint64_t v9;

  v4 = a3;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("kPVMatrixKey")))
  {
    v5 = -[PCMatrix44Double initWithCoder:]([PCMatrix44Double alloc], "initWithCoder:", v4);

    if (v5)
    {
      v6 = -[PVMatrix44Double initWithPCMatrix44Double:](self, "initWithPCMatrix44Double:", v5);
      goto LABEL_6;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPVMatrixKey"));
  v5 = (PCMatrix44Double *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  -[PCMatrix44Double SIMDDouble4x4Value](v5, "SIMDDouble4x4Value");
  v6 = -[PVMatrix44Double initWithSIMDDouble4x4:](self, "initWithSIMDDouble4x4:", &v9);
LABEL_6:
  self = v6;

  v7 = self;
LABEL_8:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  PVMatrix44Double v4;
  PVMatrix44Double v5;
  PVMatrix44Double v6;
  PVMatrix44Double v7;
  id v8;
  void *v9;
  PVMatrix44Double v10;
  PVMatrix44Double v11;
  PVMatrix44Double v12;
  PVMatrix44Double v13;
  PVMatrix44Double v14;
  PVMatrix44Double v15;
  PVMatrix44Double v16;
  PVMatrix44Double v17;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  v4 = self[6];
  v14 = self[5];
  v15 = v4;
  v5 = self[8];
  v16 = self[7];
  v17 = v5;
  v6 = self[2];
  v10 = self[1];
  v11 = v6;
  v7 = self[4];
  v12 = self[3];
  v13 = v7;
  v8 = a3;
  objc_msgSend(v3, "valueWithSIMDDouble4x4:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v9, CFSTR("kPVMatrixKey"), v10, v11, v12, v13, v14, v15, v16, v17);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PVMatrix44Double v3;
  PVMatrix44Double v4;
  PVMatrix44Double v5;
  PVMatrix44Double v6;
  _OWORD v8[8];

  v3 = self[6];
  v8[4] = self[5];
  v8[5] = v3;
  v4 = self[8];
  v8[6] = self[7];
  v8[7] = v4;
  v5 = self[2];
  v8[0] = self[1];
  v8[1] = v5;
  v6 = self[4];
  v8[2] = self[3];
  v8[3] = v6;
  +[PVMatrix44Double matrixWithSIMDDouble4x4:](PVMatrix44Double, "matrixWithSIMDDouble4x4:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  unint64_t v13;
  float64x2_t v14;
  int64x2_t v15;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "SIMDDouble4x4");
      v5 = v17;
      v6 = v18;
      v7 = v19;
      v8 = v20;
      v9 = v21;
      v10 = v22;
      v11 = v23;
      v12 = v24;
    }
    else
    {
      v11 = 0uLL;
      v12 = 0uLL;
      v9 = 0uLL;
      v10 = 0uLL;
      v7 = 0uLL;
      v8 = 0uLL;
      v5 = 0uLL;
      v6 = 0uLL;
    }
    v14 = (float64x2_t)vdupq_n_s64(0x3F1A36E2EB1C432DuLL);
    v15 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[3], v7)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[1], v5))), vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[5], v9)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[7], v11)))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[4], v8)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[2], v6))), vandq_s8((int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[6], v10)), (int8x16_t)vcgeq_f64(v14, vabdq_f64((float64x2_t)self[8], v12)))));
    v13 = vandq_s8((int8x16_t)v15, (int8x16_t)vdupq_laneq_s64(v15, 1)).u64[0] >> 63;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
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
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[1].super.isa);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v35, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[1]._anon_8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v34, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[2].super.isa);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v33, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[2]._anon_8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[3].super.isa);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[3]._anon_8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[4].super.isa);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[4]._anon_8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[5].super.isa);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v27, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[5]._anon_8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[6].super.isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[6]._anon_8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[7].super.isa);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[7]._anon_8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self[8].super.isa);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)self[8]._anon_8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15 ^ v23 ^ objc_msgSend(v24, "hash");

  return v25;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)PVMatrix44Double;
  -[PVMatrix44Double description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVMatrix44Double compactDescription](self, "compactDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%@"), v4, v5);

  return v6;
}

- (id)compactDescription
{
  PVMatrix44Double v2;
  PVMatrix44Double v3;
  PVMatrix44Double v4;
  PVMatrix44Double v5;
  _OWORD v7[8];

  v2 = self[6];
  v7[4] = self[5];
  v7[5] = v2;
  v3 = self[8];
  v7[6] = self[7];
  v7[7] = v3;
  v4 = self[2];
  v7[0] = self[1];
  v7[1] = v4;
  v5 = self[4];
  v7[2] = self[3];
  v7[3] = v5;
  NSStringFromSIMDDouble4x4((uint64_t)v7, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extendedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11[8];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  -[PVMatrix44Double getTransformInfo:](self, "getTransformInfo:", &v12);
  v3 = v12;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PVMatrix44Double description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\nExtended Description Failed: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n    "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v17;
    v11[5] = v18;
    v11[6] = v19;
    v11[7] = v20;
    v11[0] = v13;
    v11[1] = v14;
    v11[2] = v15;
    v11[3] = v16;
    NSStringFromPVTransformInfo(v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n%@"), v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (__n128)SIMDDouble4x4
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setSIMDDouble4x4:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 48) = a3[2];
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 112) = a3[6];
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v7;
  return result;
}

+ (id)matrixWithPCMatrix44Double:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPCMatrix44Double:", v4);

  return v5;
}

- (PVMatrix44Double)initWithPCMatrix44Double:(id)a3
{
  id v4;
  void *v5;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  PVMatrix44Double *v13;
  _BYTE v15[48];
  __int128 v16;
  __int128 v17;
  _BYTE v18[48];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (__int128 *)objc_msgSend(v4, "pcMatrix");
    v7 = *v6;
    v8 = v6[1];
    v9 = v6[3];
    *(_OWORD *)&v15[32] = v6[2];
    v16 = v9;
    *(_OWORD *)v15 = v7;
    *(_OWORD *)&v15[16] = v8;
    v10 = v6[4];
    v11 = v6[5];
    v12 = v6[7];
    *(_OWORD *)&v18[16] = v6[6];
    *(_OWORD *)&v18[32] = v12;
    v17 = v10;
    *(_OWORD *)v18 = v11;
  }
  else
  {
    *(_QWORD *)&v18[40] = 0x3FF0000000000000;
    *(_QWORD *)v18 = 0x3FF0000000000000;
    *(_QWORD *)&v15[40] = 0x3FF0000000000000;
    *(_QWORD *)v15 = 0x3FF0000000000000;
    memset(&v15[8], 0, 32);
    v16 = 0u;
    v17 = 0u;
    memset(&v18[8], 0, 32);
  }
  v13 = -[PVMatrix44Double initWithPCMatrix44d:](self, "initWithPCMatrix44d:", v15);

  return v13;
}

- (id)pcMatrix44Double
{
  __int128 v3[8];
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = 0x3FF0000000000000;
  v10 = 0x3FF0000000000000;
  v7 = 0x3FF0000000000000;
  v4 = 0x3FF0000000000000;
  v5 = 0u;
  v6 = 0u;
  v8 = 0u;
  v9 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PVMatrix44Double SIMDDouble4x4](self, "SIMDDouble4x4");
  pv_PCMatrix44d_from_simd_double4x4(v3, (uint64_t)&v4);
  return -[PCMatrix44Double initWithPCMatrix:]([PCMatrix44Double alloc], "initWithPCMatrix:", &v4);
}

- (void)setPCMatrix44Double:(id)a3
{
  id v4;

  v4 = a3;
  -[PVMatrix44Double setPCMatrix44d:](self, "setPCMatrix44d:", objc_msgSend(v4, "pcMatrix"));

}

+ (id)matrixWithPCMatrix44d:(const void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPCMatrix44d:", a3);
}

- (PVMatrix44Double)initWithPCMatrix44d:(const void *)a3
{
  PVMatrix44Double *v4;
  PVMatrix44Double *v5;

  v4 = -[PVMatrix44Double init](self, "init");
  v5 = v4;
  if (v4)
    -[PVMatrix44Double setPCMatrix44d:](v4, "setPCMatrix44d:", a3);
  return v5;
}

- (void)getPCMatrix44d:(void *)a3
{
  __int128 v4[8];

  -[PVMatrix44Double SIMDDouble4x4](self, "SIMDDouble4x4");
  pv_PCMatrix44d_from_simd_double4x4(v4, (uint64_t)a3);
}

- (void)setPCMatrix44d:(const void *)a3
{
  __n128 v3[8];

  -[PVMatrix44Double setSIMDDouble4x4:](self, "setSIMDDouble4x4:", v3, pv_simd_double4x4_from_PCMatrix44d((unint64_t *)a3, v3).n128_f64[0]);
}

@end
