@implementation VGExpressionIsEyesForwardLookAtFilter

- (int)rejectionReason
{
  return 19;
}

- (VGExpressionIsEyesForwardLookAtFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4
{
  VGExpressionIsEyesForwardLookAtFilter *v6;
  VGExpressionIsEyesForwardLookAtFilter *v7;
  VGExpressionIsEyesForwardLookAtFilter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsEyesForwardLookAtFilter;
  v6 = -[VGExpressionIsEyesForwardLookAtFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_eyesForwardYawSensitivityInRadians = a3;
    v6->_eyesForwardPitchSensitivityInRadians = a4;
    v8 = v6;
  }

  return v7;
}

- (float)filter:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float v16;
  float v17;
  NSObject *v18;
  float v19;
  double eyesForwardYawSensitivityInRadians;
  double eyesForwardPitchSensitivityInRadians;
  float v22;
  float32x4_t v24;
  float32x4_t v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tracked_faces"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("smooth_data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("animation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("gaze"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vg_float3ByInvokingFloatValue");
      v24 = v12;

      v13 = (int32x4_t)vmulq_f32(v24, v24);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      v25 = vmulq_n_f32(v24, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
      v16 = atan2f(v25.f32[0], v25.f32[2]);
      v17 = asinf(v25.f32[1]);
      __VGLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -v17;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        eyesForwardYawSensitivityInRadians = self->_eyesForwardYawSensitivityInRadians;
        eyesForwardPitchSensitivityInRadians = self->_eyesForwardPitchSensitivityInRadians;
        *(_DWORD *)buf = 134284289;
        v27 = v16;
        v28 = 2049;
        v29 = v19;
        v30 = 2049;
        v31 = eyesForwardYawSensitivityInRadians;
        v32 = 2049;
        v33 = eyesForwardPitchSensitivityInRadians;
        _os_log_impl(&dword_249CAD000, v18, OS_LOG_TYPE_DEBUG, " Look-at gaze (yaw/pitch radians): %{private}g %{private}g [abs value threshold (yaw/pitch radians): %{private}g %{private}g] ", buf, 0x2Au);
      }

      v22 = fabsf(v19);
      v6 = 0.0;
      if (v22 < self->_eyesForwardPitchSensitivityInRadians)
      {
        if (fabsf(v16) >= self->_eyesForwardYawSensitivityInRadians)
          v6 = 0.0;
        else
          v6 = 1.0;
      }

    }
  }

  return v6;
}

@end
