@implementation CAMeshTransform(PUPerspectiveTransform)

+ (id)pu_meshTransformApplyingNormalizedPerspectiveTransform:()PUPerspectiveTransform
{
  id v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v12;
  void *v13;
  float32x4_t v15;
  __int128 v19;
  float64x2_t v20;
  uint64_t v21;

  v3 = objc_alloc_init(MEMORY[0x1E0CD27F0]);
  v15 = vmulq_f32(a1, (float32x4_t)0);
  v4 = (int32x4_t)vaddq_f32(a3, vmlaq_f32(v15, (float32x4_t)0, a2));
  v19 = 0uLL;
  v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v4.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2)));
  v21 = 0;
  objc_msgSend(v3, "addVertex:", &v19);
  v5 = (int32x4_t)vaddq_f32(a3, vaddq_f32(a2, v15));
  v19 = xmmword_1AB0EF2E0;
  v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v5.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2)));
  v21 = 0;
  objc_msgSend(v3, "addVertex:", &v19);
  v6 = (int32x4_t)vaddq_f32(a3, vaddq_f32(a2, a1));
  __asm { FMOV            V1.2D, #1.0 }
  v19 = _Q1;
  v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2)));
  v21 = 0;
  objc_msgSend(v3, "addVertex:", &v19);
  v12 = (int32x4_t)vaddq_f32(a3, vmlaq_f32(a1, (float32x4_t)0, a2));
  v19 = xmmword_1AB0EF450;
  v20 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v12.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2)));
  v21 = 0;
  objc_msgSend(v3, "addVertex:", &v19);
  v19 = xmmword_1AB0EF460;
  v20 = 0uLL;
  objc_msgSend(v3, "addFace:", &v19);
  objc_msgSend(v3, "setSubdivisionSteps:", 0);
  objc_msgSend(v3, "setDepthNormalization:", *MEMORY[0x1E0CD2A88]);
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

@end
