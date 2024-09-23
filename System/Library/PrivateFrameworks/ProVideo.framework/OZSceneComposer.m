@implementation OZSceneComposer

+ (unint64_t)sceneMeshCategoryBitMask
{
  return 2;
}

- (__n128)doIntersectionFrom:(uint64_t)a3 lookingAt:(uint64_t)a4 scene:(void *)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int32x4_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x4_t v13;
  float32x4_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t i;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  __int128 v32;
  __int128 v34;
  __int128 v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[4];
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a5, "rootNode");
  v6 = *MEMORY[0x1E0CD5AB0];
  v43[0] = *MEMORY[0x1E0CD5AC0];
  v43[1] = v6;
  v44[0] = &unk_1E66492E8;
  v44[1] = MEMORY[0x1E0C9AAA0];
  v7 = *MEMORY[0x1E0CD5AA8];
  v43[2] = *MEMORY[0x1E0CD5AB8];
  v43[3] = v7;
  v44[2] = &unk_1E6649300;
  v44[3] = MEMORY[0x1E0C9AAA0];
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v9 = (int32x4_t)vmulq_f32(a2, a2);
  v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
  v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
  v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
  v12 = vmul_f32(v11, v11);
  v13 = vmulq_f32(vmulq_n_f32(a2, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], v12)).f32[0]), (float32x4_t)vdupq_n_s32(0x466A6000u));
  v14 = vaddq_f32(a1, v13);
  v12.i32[0] = a1.i32[2];
  v13.i32[0] = a1.i32[1];
  LODWORD(v15) = v14.i32[1];
  LODWORD(v16) = v14.i32[2];
  v17 = (void *)objc_msgSend(v5, "hitTestWithSegmentFromPoint:toPoint:options:", v8, *(double *)a1.i64, *(double *)v13.i64, *(double *)&v12, *(double *)v14.i64, v15, v16);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    v21 = 3.4028e38;
    __asm { FMOV            V0.4S, #1.0 }
    v34 = _Q0;
    v36 = 0u;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "simdWorldCoordinates", v34);
        v29 = vsubq_f32(v28, a1);
        v30 = vmulq_f32(v29, v29);
        v31 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1))).f32[0];
        if (v31 < v21)
        {
          *(_QWORD *)&v32 = v28.i64[0];
          *((_QWORD *)&v32 + 1) = __PAIR64__(HIDWORD(v34), v28.u32[2]);
          v36 = v32;
          v21 = v31;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }
  return (__n128)v36;
}

- (uint64_t)calcFloorPositionBeneath:(double)a3 scene:
{
  return objc_msgSend(a1, "doIntersectionFrom:lookingAt:scene:", a3, -0.0078125);
}

@end
