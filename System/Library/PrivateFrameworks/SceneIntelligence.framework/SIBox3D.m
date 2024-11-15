@implementation SIBox3D

- (SIBox3D)initWithTransform:(__n128)a3 extent:(__n128)a4
{
  SIBox3D *v6;
  SIBox3D *v7;
  SIBox3D *v8;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)SIBox3D;
  v6 = -[SIBox3D init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    *(__n128 *)v6[1]._extent = a3;
    *(__n128 *)&v6[2].super.isa = a4;
    *(__n128 *)v6[2]._extent = a5;
    *(__n128 *)v6->_extent = a6;
    *(__n128 *)&v6[1].super.isa = a2;
    v8 = v6;
  }

  return v7;
}

- (uint64_t)initWithCornerTransform:(float32x4_t)a3 extent:(float32x4_t)a4
{
  float32x4_t v6;

  v6.i64[0] = 0x3F0000003F000000;
  v6.i64[1] = 0x3F0000003F000000;
  return objc_msgSend(a1, "initWithTransform:extent:", translateTransform(a2, a3, a4, a5, (__n128)vmulq_f32(a6, v6)));
}

- (double)transformFromBoxCorner
{
  float32x4_t v1;

  v1.i64[0] = 0xBF000000BF000000;
  v1.i64[1] = 0xBF000000BF000000;
  return translateTransform(a1[2], a1[3], a1[4], a1[5], (__n128)vmulq_f32(a1[1], v1));
}

- (__n128)getCentroid
{
  return a1[5];
}

+ (SIBox3D)transformToNewCoordinate:(float32x4_t)a3 current:(float32x4_t)a4
{
  id v7;
  SIBox3D *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  SIBox3D *v15;
  double v18;
  double v20;
  double v22;
  double v24;
  _OWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v7 = a7;
  v8 = [SIBox3D alloc];
  objc_msgSend(v7, "transform");
  v9 = 0;
  v25[0] = v10;
  v25[1] = v11;
  v25[2] = v12;
  v25[3] = v13;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  do
  {
    *(__int128 *)((char *)&v26 + v9 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v25[v9])), a2, *(float32x2_t *)&v25[v9], 1), a3, (float32x4_t)v25[v9], 2), a4, (float32x4_t)v25[v9], 3);
    ++v9;
  }
  while (v9 != 4);
  v22 = *(double *)&v28;
  v24 = *(double *)&v29;
  v18 = *(double *)&v26;
  v20 = *(double *)&v27;
  objc_msgSend(v7, "extent");
  v15 = -[SIBox3D initWithTransform:extent:](v8, "initWithTransform:extent:", v18, v20, v22, v24, v14);

  return v15;
}

- (double)transformToNewCoordinate:(float32x4_t)a3
{
  uint64_t v5;
  __int128 v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = 0;
  v6 = a1[5];
  v11[2] = a1[4];
  v11[3] = v6;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  do
  {
    *(__int128 *)((char *)&v12 + v5 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v11[v5])), a3, *(float32x2_t *)&v11[v5], 1), a4, (float32x4_t)v11[v5], 2), a5, (float32x4_t)v11[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  result = *(double *)&v12;
  v8 = v13;
  v9 = v14;
  v10 = v15;
  a1[2] = v12;
  a1[3] = v8;
  a1[4] = v9;
  a1[5] = v10;
  return result;
}

- (float)signedDistanceFunction:(SIBox3D *)self
{
  float32x4_t v2;
  int32x4_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;

  v3 = *(int32x4_t *)self[1]._extent;
  v4 = *(int32x4_t *)&self[2].super.isa;
  v5 = *(int32x4_t *)&self[1].super.isa;
  v6 = vzip1q_s32(v5, v4);
  v7 = vzip2q_s32(v5, v4);
  v8 = vzip1q_s32(v3, (int32x4_t)0);
  v9 = (float32x4_t)vzip2q_s32(v3, (int32x4_t)xmmword_21074C2A0);
  v10 = (float32x4_t)vzip1q_s32(v6, v8);
  v11 = (float32x4_t)vzip2q_s32(v6, v8);
  v12 = (float32x4_t)vzip1q_s32(v7, (int32x4_t)v9);
  v13 = vabdq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, v2.f32[0]), v11, *(float32x2_t *)v2.f32, 1), v12, v2, 2), vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(*(_OWORD *)self[2]._extent)), v11, *(float32x2_t *)self[2]._extent, 1), v12, *(float32x4_t *)self[2]._extent, 2), (float32x4_t)vzip2q_s32(v7, (int32x4_t)v9), *(float32x4_t *)self[2]._extent, 3));
  v9.i64[0] = 0xBF000000BF000000;
  v9.i64[1] = 0xBF000000BF000000;
  v14 = vmlaq_f32(v13, v9, *(float32x4_t *)self->_extent);
  v9.i32[0] = v14.i32[1];
  *(float *)v7.i32 = fmaxf(v14.f32[0], v14.f32[2]);
  v14.i32[3] = 0;
  v15 = vmaxnmq_f32(v14, (float32x4_t)0);
  v16 = vmulq_f32(v15, v15);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0])+ fminf(fmaxf(*(float *)v7.i32, v9.f32[0]), 0.0);
}

- (double)closestPoint:(float32x4_t *)a1
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t v22;
  float32x4_t v28;
  float32x4_t v30;
  float32x4_t v31;
  double result;
  float32x4_t v33;

  v3 = a1[3];
  v2 = a1[4];
  v4 = a1[5];
  v6 = a1[1];
  v5 = a1[2];
  v7 = vzip1q_s32((int32x4_t)v5, (int32x4_t)v2);
  v8 = vzip2q_s32((int32x4_t)v5, (int32x4_t)v2);
  v9 = vzip1q_s32((int32x4_t)v3, (int32x4_t)0);
  v10 = vzip2q_s32((int32x4_t)v3, (int32x4_t)xmmword_21074C2A0);
  v11 = (float32x4_t)vzip1q_s32(v7, v9);
  v12 = (float32x4_t)vzip2q_s32(v7, v9);
  v13 = (float32x4_t)vzip1q_s32(v8, v10);
  v14 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v4.f32[0]), v12, *(float32x2_t *)v4.f32, 1), v13, v4, 2), (float32x4_t)vzip2q_s32(v8, v10), v4, 3);
  v15 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, a2.f32[0]), v12, *(float32x2_t *)a2.f32, 1), v13, a2, 2);
  v16 = vsubq_f32(v15, v14);
  v17 = vabdq_f32(v15, v14);
  v15.i64[0] = 0xBF000000BF000000;
  v15.i64[1] = 0xBF000000BF000000;
  v18 = vmlaq_f32(v17, v15, v6);
  v18.i32[3] = 0;
  v19 = vminnmq_f32(v18, (float32x4_t)0);
  v20 = *(_QWORD *)&vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgeq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1)))) & 1;
  v33 = v19;
  if (*(float *)((unint64_t)&v33 & 0xFFFFFFFFFFFFFFFBLL | (4 * v20)) < v19.f32[2])
    v21 = 2;
  else
    v21 = v20;
  *(_DWORD *)((unint64_t)&v33 | (4 * v21)) = 0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  __asm { FMOV            V17.4S, #1.0 }
  v28 = (float32x4_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v16), (int8x16_t)vcgtzq_f32(v16)), vorrq_s8(vandq_s8((int8x16_t)v16, v22), _Q17), (int8x16_t)0);
  v22.i64[0] = 0x4000000040000000;
  v22.i64[1] = 0x4000000040000000;
  __asm { FMOV            V16.4S, #-1.0 }
  v30 = vsubq_f32((float32x4_t)v22, vabsq_f32(vmlaq_f32(_Q16, (float32x4_t)v22, v28)));
  v22.i64[0] = 0x3F0000003F000000;
  v22.i64[1] = 0x3F0000003F000000;
  v31 = vmulq_f32(vmlaq_f32(v33, (float32x4_t)v22, v6), v30);
  *(_QWORD *)&result = vaddq_f32(v4, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, v31.f32[0]), v3, *(float32x2_t *)v31.f32, 1), v2, v31, 2)).u64[0];
  return result;
}

- (__n128)extent
{
  return a1[1];
}

- (void)setExtent:(SIBox3D *)self
{
  __int128 v2;

  *(_OWORD *)self->_extent = v2;
}

- (__n128)transform
{
  return a1[2];
}

- (__n128)setTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

@end
