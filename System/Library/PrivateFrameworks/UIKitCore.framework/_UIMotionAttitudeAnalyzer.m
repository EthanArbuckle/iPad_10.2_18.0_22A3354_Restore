@implementation _UIMotionAttitudeAnalyzer

- (void)reset
{
  void *v3;

  self->_referenceQuaternion = self->_absoluteQuaternion;
  -[_UIMotionAttitudeAnalyzer _resetDirectionalLockWithViewerOffset:](self, "_resetDirectionalLockWithViewerOffset:", 0.0, 0.0);
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reset");

  self->_idleStartTime = 1.79769313e308;
}

- (void)updateHistory
{
  UIOffset *p_lastAppliedViewerOffset;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  float v7;
  float v8;
  float v9;
  float v10;

  if (!self->_hasHistory)
  {
    self->_hasHistory = 1;
    self->_isApplyingHysteresis = 0;
    self->_relativeQuaternionOnHysteresisEntry = (_GLKQuaternion)xmmword_18667DA30;
  }
  p_lastAppliedViewerOffset = &self->_lastAppliedViewerOffset;
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewerOffset");
  p_lastAppliedViewerOffset->horizontal = v5;
  self->_lastAppliedViewerOffset.vertical = v6;

  -[_UIMotionAttitudeAnalyzer _relativeQuaternion](self, "_relativeQuaternion");
  self->_lastAppliedRelativeQuaternion.x = v7;
  self->_lastAppliedRelativeQuaternion.y = v8;
  self->_lastAppliedRelativeQuaternion.z = v9;
  self->_lastAppliedRelativeQuaternion.w = v10;
}

- (void)updateWithEvent:(id)a3
{
  id v4;
  char isKindOfClass;
  float32x4_t v6;
  float32x4_t v7;
  double v8;
  float y;
  double v10;
  float z;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;

  v4 = a3;
  if (v4)
  {
    v31 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v31;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v31, "attitude");
      v7.f32[0] = *(double *)v7.i64;
      y = v8;
      z = v10;
      *(float *)&v12 = v12;
      LODWORD(self->_absoluteQuaternion.x) = v7.i32[0];
      self->_absoluteQuaternion.y = y;
      self->_absoluteQuaternion.z = z;
      self->_absoluteQuaternion.w = *(float *)&v12;
      if (!self->_hasReferenceQuaternion)
      {
        -[_UIMotionAttitudeAnalyzer reset](self, "reset");
        self->_hasReferenceQuaternion = 1;
        v7.i32[0] = LODWORD(self->_absoluteQuaternion.x);
        y = self->_absoluteQuaternion.y;
        z = self->_absoluteQuaternion.z;
        *(float *)&v12 = self->_absoluteQuaternion.w;
      }
      v6.i32[0] = LODWORD(self->_referenceQuaternion.x);
      v13 = _RelativeQuaternionFromReference(v7, y, z, *(int32x2_t *)&v12, v6, self->_referenceQuaternion.y, self->_referenceQuaternion.z, self->_referenceQuaternion.w);
      v14 = LODWORD(v13);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[_UIMotionAttitudeAnalyzer _currentRawOffset:](self, "_currentRawOffset:");
      v22 = v21;
      v24 = v23;
      -[_UIMotionAttitudeAnalyzer _updateSmoothedOffsetForRawOffset:](self, "_updateSmoothedOffsetForRawOffset:");
      objc_msgSend(v31, "timestamp");
      -[_UIMotionAttitudeAnalyzer _updateIdleStateForRawOffset:timestamp:](self, "_updateIdleStateForRawOffset:timestamp:", v22, v24, v25);
      objc_msgSend(v31, "timestamp");
      v27 = v26;
      LODWORD(v26) = v14;
      LODWORD(v28) = v16;
      LODWORD(v29) = v18;
      LODWORD(v30) = v20;
      -[_UIMotionAttitudeAnalyzer _updateReferenceAttitude:timestamp:](self, "_updateReferenceAttitude:timestamp:", v26, v28, v29, v30, v27);
      v4 = v31;
    }
  }

}

- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7
{
  _BOOL4 v8;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  BOOL v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  int v28;

  v8 = a5;
  v12 = a7;
  if (!self->_hasHistory)
  {
    v19 = 0;
    goto LABEL_27;
  }
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewerOffset");
  v15 = v14;
  v17 = v16;

  v18 = v8
     && -[_UIMotionAttitudeAnalyzer _shouldSuspendApplicationForHysteresisGivenNewViewerOffset:wasSuspendingApplicationForHysteresis:](self, "_shouldSuspendApplicationForHysteresisGivenNewViewerOffset:wasSuspendingApplicationForHysteresis:", self->_isApplyingHysteresis, v15, v17);
  v20 = sqrt((self->_lastAppliedViewerOffset.horizontal - v15) * (self->_lastAppliedViewerOffset.horizontal - v15)+ (self->_lastAppliedViewerOffset.vertical - v17) * (self->_lastAppliedViewerOffset.vertical - v17));
  if (!v18)
  {
    v21 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectAccumulationThreshold, (uint64_t)CFSTR("UIMotionEffectAccumulationThreshold"));
    v24 = *(double *)&qword_1EDDA81C0;
    HIDWORD(v25) = 1066317905;
    if (v21)
      v24 = 0.015;
    v19 = v20 < v24;
    if (self->_isApplyingHysteresis)
    {
      self->_isApplyingHysteresis = 0;
      *(float *)&v24 = self->_relativeQuaternionOnHysteresisEntry.x;
      *(float *)&v25 = self->_relativeQuaternionOnHysteresisEntry.y;
      *(float *)&v22 = self->_relativeQuaternionOnHysteresisEntry.z;
      *(float *)&v23 = self->_relativeQuaternionOnHysteresisEntry.w;
      if (a6 && v8)
        *a6 = 1;
    }
    else
    {
      v26 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76720, (uint64_t)CFSTR("UIMotionEffectOldEventTimeInterval"));
      v27 = *(double *)&qword_1ECD76728;
      if (v26)
        v27 = 0.25;
      if (v27 > a4)
        goto LABEL_21;
      v28 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76730, (uint64_t)CFSTR("UIMotionEffectOldEventSuppressionThreshold"));
      v24 = *(double *)&qword_1ECD76738;
      HIDWORD(v25) = 1066695393;
      if (v28)
        v24 = 0.02;
      if (v20 < v24)
        goto LABEL_21;
      *(float *)&v24 = self->_lastAppliedRelativeQuaternion.x;
      *(float *)&v25 = self->_lastAppliedRelativeQuaternion.y;
      *(float *)&v22 = self->_lastAppliedRelativeQuaternion.z;
      *(float *)&v23 = self->_lastAppliedRelativeQuaternion.w;
    }
    -[_UIMotionAttitudeAnalyzer _shiftReferenceToYieldRelativeQuaternion:](self, "_shiftReferenceToYieldRelativeQuaternion:", v24, v25, v22, v23);
    goto LABEL_27;
  }
  v19 = 1;
  if (!self->_isApplyingHysteresis)
  {
    self->_isApplyingHysteresis = 1;
    self->_relativeQuaternionOnHysteresisEntry = self->_lastAppliedRelativeQuaternion;
  }
LABEL_21:
  if (a3 > 0.0 && v12 && !objc_msgSend((id)UIApp, "applicationState"))
    objc_msgSend(v12, "recordMotionMagnitude:atTimestamp:", v20, a3);
LABEL_27:

  return v19;
}

- (void)_updateSmoothedOffsetForRawOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double lockValue;
  double smoothingDegree;
  double v25;
  double v26;
  void *v27;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewerOffset");
  v8 = v7;
  v10 = v9;

  -[_UIMotionAnalyzer settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "directionalLockEnabled");

  if (v12)
  {
    -[_UIMotionAnalyzer settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "directionalLockStickiness");
    v15 = v14 * 0.05 + 0.95;

    self->_lockValue = vabdd_f64(v8, horizontal) + v15 * self->_lockValue - vabdd_f64(v10, vertical);
    -[_UIMotionAnalyzer settings](self, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "directionalLockThreshold");
    v18 = v17;

    -[_UIMotionAnalyzer settings](self, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "directionalLockSharpness");
    v21 = v20;

    v22 = fmin((fabs(self->_lockValue) - v18) / v18 / (1.0 - v21 + 0.00000011920929), 1.0);
    if (v22 < 0.0)
      v22 = 0.0;
    self->_lockStrength = v22;
    lockValue = self->_lockValue;
    if (lockValue <= v18)
    {
      if (lockValue < -v18)
        horizontal = v8 * v22 + horizontal * (1.0 - v22);
    }
    else
    {
      vertical = v10 * v22 + vertical * (1.0 - v22);
    }
    -[_UIMotionAttitudeAnalyzer _updateDirectionalLockIndicators](self, "_updateDirectionalLockIndicators");
  }
  smoothingDegree = self->_smoothingDegree;
  v25 = v8 * smoothingDegree + horizontal * (1.0 - smoothingDegree);
  v26 = v10 * smoothingDegree + vertical * (1.0 - smoothingDegree);
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setViewerOffset:", v25, v26);

  -[_UIMotionAttitudeAnalyzer _updateAcceleratedOutputRangeFixingOffset:](self, "_updateAcceleratedOutputRangeFixingOffset:", v25, v26);
}

- (int64_t)_directionLockStatus
{
  void *v3;
  double v4;
  double v5;
  double lockValue;

  -[_UIMotionAnalyzer settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLockThreshold");
  v5 = v4;

  lockValue = self->_lockValue;
  if (lockValue > v5)
    return 1;
  else
    return 2 * (lockValue < -v5);
}

- (void)_updateReferenceAttitude:(_GLKQuaternion)a3 timestamp:(double)a4
{
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  float v10;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  __float2 v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int8x16_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  int32x4_t v47;
  double v48;
  double lastUpdate;
  double v50;
  float v51;
  double v52;
  float v53;
  float v54;
  __float2 v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  int8x16_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  int32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  int32x4_t v70;

  v8 = v7;
  v10 = (float)(v4 + (float)((float)(*(float *)&a4 * 0.0) + (float)(v6 * 0.0))) - (float)(v5 * 0.0);
  v11 = (float)((float)(v5 * 0.0) + (float)((float)(v4 * 0.0) + (float)(v6 * 0.0))) - *(float *)&a4;
  v12 = (float)((float)(*(float *)&a4 * 0.0) + (float)(v6 + (float)(v5 * 0.0))) - (float)(v4 * 0.0);
  v13 = (float)((float)((float)(v6 * 0.0) - (float)(*(float *)&a4 * 0.0)) - (float)(v4 * 0.0)) - v5;
  *((float *)&a4 + 1) = v4;
  v14 = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v15 = vmulq_f32(*(float32x4_t *)&a4, *(float32x4_t *)&a4);
  v15.i64[0] = vpaddq_f32(v15, v15).u64[0];
  v16 = (float32x4_t)veorq_s8((int8x16_t)vmulq_n_f32(*(float32x4_t *)&a4, 1.0 / vpadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32).f32[0]), (int8x16_t)xmmword_186681AD0);
  v15.f32[0] = (float)(vmuls_lane_f32(v11, v16, 2) + (float)((float)(v13 * v16.f32[0]) + vmuls_lane_f32(v10, v16, 3)))
             - vmuls_lane_f32(v12, *(float32x2_t *)v16.f32, 1);
  v17 = (float)((float)(v12 * v16.f32[0])
              + (float)(vmuls_lane_f32(v13, *(float32x2_t *)v16.f32, 1) + vmuls_lane_f32(v11, v16, 3)))
      - vmuls_lane_f32(v10, v16, 2);
  v16.f32[0] = (float)(vmuls_lane_f32(v10, *(float32x2_t *)v16.f32, 1)
                     + (float)(vmuls_lane_f32(v13, v16, 2) + vmuls_lane_f32(v12, v16, 3)))
             - (float)(v11 * v16.f32[0]);
  v18 = 1.0 / sqrtf((float)(v16.f32[0] * v16.f32[0]) + (float)((float)(v15.f32[0] * v15.f32[0]) + (float)(v17 * v17)));
  v19 = v15.f32[0] * v18;
  v20 = v17 * v18;
  v21 = v16.f32[0] * v18;
  v22 = acosf(v16.f32[0] * v18);
  v23 = (float)(v21 * 0.0) - v20;
  v24 = v19 - (float)(v21 * 0.0);
  v25 = (float)(v20 * 0.0) - (float)(v19 * 0.0);
  v26 = sqrtf((float)(v25 * v25) + (float)((float)(v23 * v23) + (float)(v24 * v24)));
  if (v26 <= 0.00000011921)
  {
    if (-[_UIMotionAttitudeAnalyzer _isIdleGivenTimestamp:](self, "_isIdleGivenTimestamp:", v8))
      self->_referenceQuaternion = self->_absoluteQuaternion;
  }
  else
  {
    v27 = 1.0 / v26;
    v28 = v23 * v27;
    v29 = v24 * v27;
    v30 = v25 * v27;
    if (-[_UIMotionAttitudeAnalyzer _isIdleGivenTimestamp:](self, "_isIdleGivenTimestamp:", v8)
      && self->_jumpThreshold < v22)
    {
      v31 = v22 + -1.57079633 + v22 + -1.57079633;
      v32 = __sincosf_stret(v31 * 0.5);
      v33.f32[0] = v32.__sinval * v28;
      v33.f32[1] = v32.__sinval * v29;
      v33.f32[2] = v32.__sinval * v30;
      v33.i32[3] = LODWORD(v32.__cosval);
      v34 = vmulq_f32(v33, v33);
      v34.i64[0] = vpaddq_f32(v34, v34).u64[0];
      v35 = vmulq_n_f32(v33, 1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v34.f32, *(float32x2_t *)v34.f32).f32[0]));
      v36.i32[0] = LODWORD(self->_referenceQuaternion.x);
      v33.i64[0] = *(_QWORD *)&self->_referenceQuaternion.q[1];
      v37 = vmulq_n_f32(v35, self->_referenceQuaternion.w);
      v38 = (float32x4_t)vextq_s8(vextq_s8(v36, v36, 4uLL), (int8x16_t)v33, 0xCuLL);
      v38.i32[3] = v38.i32[0];
      v39 = vmulq_f32(v38, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v35, 3), (int8x16_t)v35, 4uLL));
      v40 = vaddq_f32(v37, v39);
      v41 = vsubq_f32(v37, v39);
      v42 = vuzp2q_s32((int32x4_t)v33, vzip1q_s32((int32x4_t)v33, (int32x4_t)v33));
      v43 = (float32x4_t)v42;
      v43.i32[1] = v36.i32[0];
      v43.i32[3] = v42.i32[2];
      v44 = v35;
      v44.i32[3] = v35.i32[1];
      v45 = vmulq_f32(v43, v44);
      v46 = vaddq_f32(v40, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v45, (int8x16_t)v45, 4uLL), (int32x4_t)v45));
      v46.i32[3] = vsubq_f32(v41, v45).i32[3];
      v41.i64[0] = v33.i64[0];
      v41.i64[1] = __PAIR64__(v33.u32[1], v36.u32[0]);
      v35.i32[3] = v35.i32[2];
      v47 = (int32x4_t)vmulq_f32(v41, v35);
      self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v46, (float32x4_t)vzip2q_s32(vzip1q_s32(v47, (int32x4_t)vextq_s8((int8x16_t)v47, (int8x16_t)v47, 0xCuLL)), v47));
      v22 = v22 - v31;
    }
    v48 = v22;
    if (v22 >= 1.57079633)
    {
      v22 = 3.14159265 - v48;
      v28 = -v28;
      v29 = -v29;
      v30 = -v30;
      v48 = v22;
    }
    lastUpdate = self->_lastUpdate;
    v50 = v8 - lastUpdate;
    *(float *)&lastUpdate = v22;
    -[_UIMotionAttitudeAnalyzer _referenceShiftRadiansPerSecondForAngle:](self, "_referenceShiftRadiansPerSecondForAngle:", lastUpdate);
    v52 = v50 * v51;
    if (v52 <= v48)
    {
      v53 = v52;
      v54 = v53;
    }
    else
    {
      v54 = v22;
    }
    v55 = __sincosf_stret(v54 * 0.5);
    v56.f32[0] = v28 * v55.__sinval;
    v56.f32[1] = v29 * v55.__sinval;
    v56.f32[2] = v30 * v55.__sinval;
    v56.i32[3] = LODWORD(v55.__cosval);
    v57 = vmulq_f32(v56, v56);
    v57.i64[0] = vpaddq_f32(v57, v57).u64[0];
    v58 = vmulq_n_f32(v56, 1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v57.f32, *(float32x2_t *)v57.f32).f32[0]));
    v59.i32[0] = LODWORD(self->_referenceQuaternion.x);
    v56.i64[0] = *(_QWORD *)&self->_referenceQuaternion.q[1];
    v60 = vmulq_n_f32(v58, self->_referenceQuaternion.w);
    v61 = (float32x4_t)vextq_s8(vextq_s8(v59, v59, 4uLL), (int8x16_t)v56, 0xCuLL);
    v61.i32[3] = v61.i32[0];
    v62 = vmulq_f32(v61, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v58, 3), (int8x16_t)v58, 4uLL));
    v63 = vuzp2q_s32((int32x4_t)v56, vzip1q_s32((int32x4_t)v56, (int32x4_t)v56));
    v64 = (float32x4_t)v63;
    v64.i32[1] = v59.i32[0];
    v64.i32[3] = v63.i32[2];
    v65 = vaddq_f32(v60, v62);
    v66 = vsubq_f32(v60, v62);
    v67 = v58;
    v67.i32[3] = v58.i32[1];
    v68 = vmulq_f32(v64, v67);
    v69 = vaddq_f32(v65, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v68, (int8x16_t)v68, 4uLL), (int32x4_t)v68));
    v69.i32[3] = vsubq_f32(v66, v68).i32[3];
    v66.i64[0] = v56.i64[0];
    v66.i64[1] = __PAIR64__(v56.u32[1], v59.u32[0]);
    v58.i32[3] = v58.i32[2];
    v70 = (int32x4_t)vmulq_f32(v66, v58);
    self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v69, (float32x4_t)vzip2q_s32(vzip1q_s32(v70, (int32x4_t)vextq_s8((int8x16_t)v70, (int8x16_t)v70, 0xCuLL)), v70));
  }
  self->_lastUpdate = v8;
}

- (void)_updateIdleStateForRawOffset:(UIOffset)a3 timestamp:(double)a4
{
  double idleLeeway;

  idleLeeway = self->_idleLeeway;
  if (vabdd_f64(a3.horizontal, self->_idleStartOffset.horizontal) > idleLeeway
    || vabdd_f64(a3.vertical, self->_idleStartOffset.vertical) > idleLeeway)
  {
    self->_idleStartTime = a4;
  }
  self->_idleStartOffset = a3;
  -[_UIMotionAttitudeAnalyzer _showIdleUI:](self, "_showIdleUI:", -[_UIMotionAttitudeAnalyzer _isIdleGivenTimestamp:](self, "_isIdleGivenTimestamp:", a4));
}

- (BOOL)_isIdleGivenTimestamp:(double)a3
{
  return a3 - self->_idleStartTime > self->_secondsBeforeIdle;
}

- (void)_updateDirectionalLockIndicators
{
  int64_t v3;
  UIView *horizontalLockIndicator;
  int *v5;
  UIView *verticalLockIndicator;
  float v7;
  double v8;

  v3 = -[_UIMotionAttitudeAnalyzer _directionLockStatus](self, "_directionLockStatus");
  if (v3 == 2)
  {
    -[UIView setHidden:](self->_verticalLockIndicator, "setHidden:", 0);
    verticalLockIndicator = self->_verticalLockIndicator;
    v7 = self->_lockStrength * 25.0;
    v8 = ceilf(v7);
    -[UIView bounds](verticalLockIndicator, "bounds");
    -[UIView setBounds:](verticalLockIndicator, "setBounds:", 0.0, 0.0, v8);
    v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__horizontalLockIndicator;
  }
  else if (v3 == 1)
  {
    -[UIView setHidden:](self->_horizontalLockIndicator, "setHidden:", 0);
    horizontalLockIndicator = self->_horizontalLockIndicator;
    -[UIView bounds](horizontalLockIndicator, "bounds");
    -[UIView setBounds:](horizontalLockIndicator, "setBounds:", 0.0, 0.0);
    v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__verticalLockIndicator;
  }
  else
  {
    v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__verticalLockIndicator;
    -[UIView setHidden:](self->_horizontalLockIndicator, "setHidden:", 1);
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "setHidden:", 1);
}

- (void)_updateAcceleratedOutputRangeFixingOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  id v10;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v6 = -[_UIMotionAttitudeAnalyzer _directionLockStatus](self, "_directionLockStatus");
  if (v6 == 2)
  {
    v9 = 0.0;
    v8 = 1.0;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    if (v6 == 1)
      v8 = 0.0;
    else
      v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v6 == 1)
      v9 = 1.0;
    else
      v9 = *MEMORY[0x1E0C9D538];
  }
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setAcceleration:fixingOutputForViewerOffset:", v9, v8, horizontal, vertical);

}

- (void)_showIdleUI:(BOOL)a3
{
  -[UIView setHidden:](self->_idleIndicator, "setHidden:", !a3);
}

- (UIOffset)_currentRawOffset:(_GLKQuaternion)a3
{
  float32x4_t v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  double v11;
  double v12;
  double v13;
  UIOffset result;

  v7 = (float)(v5 * 0.0) + (float)(v6 * 0.0);
  v3.f32[1] = v4;
  v3.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = vmulq_f32(v3, v3);
  v8.i64[0] = vpaddq_f32(v8, v8).u64[0];
  v9 = (float32x4_t)veorq_s8((int8x16_t)vmulq_n_f32(v3, 1.0 / vpadd_f32(*(float32x2_t *)v8.f32, *(float32x2_t *)v8.f32).f32[0]), (int8x16_t)xmmword_186681AD0);
  v10 = (float)(vmuls_lane_f32((float)((float)(v4 * 0.0) + (float)((float)(v3.f32[0] * 0.0) + (float)(v6 * 0.0))) - v5, *(float32x2_t *)v9.f32, 1)+ (float)(vmuls_lane_f32((float)((float)((float)(v6 * 0.0) - (float)(v3.f32[0] * 0.0)) - v4) - (float)(v5 * 0.0), v9, 2)+ vmuls_lane_f32((float)(v3.f32[0] + v7) - (float)(v4 * 0.0), v9, 3)))- (float)((float)((float)((float)(v5 * 0.0) + (float)(v6 + (float)(v4 * 0.0))) - (float)(v3.f32[0] * 0.0))* v9.f32[0]);
  v11 = acosf((float)(vmuls_lane_f32((float)((float)(v4 * 0.0) + (float)(v6 + (float)(v3.f32[0] * 0.0))) - (float)(v5 * 0.0), *(float32x2_t *)v9.f32, 1)+ (float)(vmuls_lane_f32((float)((float)((float)(v6 * 0.0) - v3.f32[0]) - (float)(v4 * 0.0)) - (float)(v5 * 0.0), v9, 2)+ vmuls_lane_f32((float)((float)(v3.f32[0] * 0.0) + v7) - v4, v9, 3)))- (float)((float)((float)(v5 + (float)((float)(v4 * 0.0) + (float)(v6 * 0.0))) - (float)(v3.f32[0] * 0.0))* v9.f32[0]))/ 1.57079633+ -1.0;
  v12 = -(acosf(v10) / 1.57079633 + -1.0);
  v13 = v11;
  result.vertical = v12;
  result.horizontal = v13;
  return result;
}

- (float)_referenceShiftRadiansPerSecondForAngle:(float)a3
{
  float v3;

  v3 = a3 / 3.14159265;
  return self->_referenceShiftSpeed + self->_referenceShiftSpeed * self->_distanceMultiplier * v3;
}

- (void)_resetDirectionalLockWithViewerOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  id v5;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  self->_lockValue = 0.0;
  self->_lockStrength = 0.0;
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAcceleration:fixingOutputForViewerOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), horizontal, vertical);

}

- (_GLKQuaternion)_relativeQuaternion
{
  float32x4_t v2;
  int32x2_t v3;
  float32x4_t v4;
  uint64_t v5;
  uint64_t v6;
  _GLKQuaternion result;

  v2.i32[0] = LODWORD(self->_absoluteQuaternion.x);
  v3.i32[0] = LODWORD(self->_absoluteQuaternion.w);
  v4.i32[0] = LODWORD(self->_referenceQuaternion.x);
  _RelativeQuaternionFromReference(v2, self->_absoluteQuaternion.y, self->_absoluteQuaternion.z, v3, v4, self->_referenceQuaternion.y, self->_referenceQuaternion.z, self->_referenceQuaternion.w);
  *(_QWORD *)&result.q[2] = v6;
  *(_QWORD *)&result.x = v5;
  return result;
}

- (_UIMotionAttitudeAnalyzer)initWithSettings:(id)a3
{
  _UIMotionAttitudeAnalyzer *v3;
  void *v4;
  _UIMotionAttitudeAnalyzer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIMotionAttitudeAnalyzer;
  v3 = -[_UIMotionAnalyzer initWithSettings:](&v7, sel_initWithSettings_, a3);
  if (v3)
  {
    v3->_lastUpdate = CFAbsoluteTimeGetCurrent();
    v3->_absoluteQuaternion = (_GLKQuaternion)xmmword_18667DA30;
    -[_UIMotionAnalyzer settings](v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addKeyObserver:", v3);

    -[_UIMotionAttitudeAnalyzer _updateSettings](v3, "_updateSettings");
    v5 = v3;
  }

  return v3;
}

- (void)resetHysteresis
{
  if (self->_hasHistory)
    self->_isApplyingHysteresis = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLockIndicator, 0);
  objc_storeStrong((id *)&self->_horizontalLockIndicator, 0);
  objc_storeStrong((id *)&self->_idleIndicator, 0);
  objc_storeStrong((id *)&self->_diagnosticsWindow, 0);
}

- (void)_updateSettings
{
  void *v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;

  -[_UIMotionAnalyzer settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputSmoothingFactor");
  self->_smoothingDegree = v4 * 0.9;

  -[_UIMotionAnalyzer settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "referenceShiftEnabled");

  if (v6)
  {
    -[_UIMotionAnalyzer settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "referenceShiftSpeed");
    self->_referenceShiftSpeed = v8 * 0.1;

    -[_UIMotionAnalyzer settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "referenceShiftDistanceDependence");
    self->_distanceMultiplier = v10 * 10.0;

  }
  else
  {
    self->_distanceMultiplier = 0.0;
    self->_referenceShiftSpeed = 0.0;
  }
  -[_UIMotionAnalyzer settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "referenceShiftEnabled") & 1) == 0)
  {

    goto LABEL_9;
  }
  -[_UIMotionAnalyzer settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "jumpEnabled");

  if (!v13)
  {
LABEL_9:
    self->_jumpThreshold = 3.40282347e38;
    goto LABEL_10;
  }
  -[_UIMotionAnalyzer settings](self, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jumpThreshold");
  self->_jumpThreshold = v15 * 1.57079633 + 1.57079633;

  -[_UIMotionAnalyzer settings](self, "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "playJumpSound");

  if ((v17 & 1) != 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_registerForSystemSounds:", self);
    goto LABEL_11;
  }
LABEL_10:
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_unregisterForSystemSounds:", self);
LABEL_11:

  -[_UIMotionAnalyzer settings](self, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "idleLeeway");
  self->_idleLeeway = v20 * 0.1;

  -[_UIMotionAnalyzer settings](self, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "delayBeforeIdle");
  self->_secondsBeforeIdle = v22 * 1.4 + 0.1;

  -[_UIMotionAnalyzer settings](self, "settings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "showIdleIndicator");

  if (v24)
    -[_UIMotionAttitudeAnalyzer _createIdleIndicator](self, "_createIdleIndicator");
  else
    -[_UIMotionAttitudeAnalyzer _tearDownIdleIndicator](self, "_tearDownIdleIndicator");
  -[_UIMotionAnalyzer settings](self, "settings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "directionalLockEnabled") & 1) != 0)
  {
    -[_UIMotionAnalyzer settings](self, "settings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "showDirectionalLockIndicators");

    if (v27)
    {
      -[_UIMotionAttitudeAnalyzer _createDirectionLockIndicators](self, "_createDirectionLockIndicators");
      return;
    }
  }
  else
  {

  }
  -[_UIMotionAttitudeAnalyzer _tearDownDirectionLockIndicators](self, "_tearDownDirectionLockIndicators");
  if ((v24 & 1) == 0)
    -[_UIMotionAttitudeAnalyzer _tearDownDiagnosticsWindow](self, "_tearDownDiagnosticsWindow");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_UIMotionAnalyzer settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  -[_UIMotionAttitudeAnalyzer _tearDownDiagnosticsWindow](self, "_tearDownDiagnosticsWindow");
  -[_UIMotionAttitudeAnalyzer _tearDownDirectionLockIndicators](self, "_tearDownDirectionLockIndicators");
  -[_UIMotionAttitudeAnalyzer _tearDownIdleIndicator](self, "_tearDownIdleIndicator");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unregisterForSystemSounds:", self);

  v5.receiver = self;
  v5.super_class = (Class)_UIMotionAttitudeAnalyzer;
  -[_UIMotionAttitudeAnalyzer dealloc](&v5, sel_dealloc);
}

- (void)_tearDownIdleIndicator
{
  UILabel *idleIndicator;

  -[UIView removeFromSuperview](self->_idleIndicator, "removeFromSuperview");
  idleIndicator = self->_idleIndicator;
  self->_idleIndicator = 0;

}

- (void)_tearDownDirectionLockIndicators
{
  UIView *horizontalLockIndicator;
  UIView *verticalLockIndicator;

  -[UIView removeFromSuperview](self->_horizontalLockIndicator, "removeFromSuperview");
  horizontalLockIndicator = self->_horizontalLockIndicator;
  self->_horizontalLockIndicator = 0;

  -[UIView removeFromSuperview](self->_verticalLockIndicator, "removeFromSuperview");
  verticalLockIndicator = self->_verticalLockIndicator;
  self->_verticalLockIndicator = 0;

}

- (void)_tearDownDiagnosticsWindow
{
  UIWindow *diagnosticsWindow;

  -[UIWindow setHidden:](self->_diagnosticsWindow, "setHidden:", 1);
  diagnosticsWindow = self->_diagnosticsWindow;
  self->_diagnosticsWindow = 0;

}

- (void)_shiftReferenceToYieldRelativeQuaternion:(_GLKQuaternion)a3
{
  double v3;
  double v4;
  int32x4_t v5;
  double v6;
  float32x4_t v8;
  float32x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  int32x4_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;

  v30 = v6;
  v31 = *(double *)v5.i64;
  v32 = v4;
  v33 = v3;
  v8.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v8.i64[1] = __PAIR64__(LODWORD(v6), v5.u32[0]);
  v9 = vmulq_f32(v8, v8);
  v9.i64[0] = vpaddq_f32(v9, v9).u64[0];
  v10 = (int8x16_t)vmulq_n_f32(v8, 1.0 / vpadd_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v9.f32).f32[0]);
  v11 = (int8x16_t)xmmword_186681AD0;
  v12 = (float32x4_t)veorq_s8(v10, (int8x16_t)xmmword_186681AD0);
  v11.i32[0] = LODWORD(self->_absoluteQuaternion.x);
  v5.i64[0] = *(_QWORD *)&self->_absoluteQuaternion.q[1];
  v13 = vmulq_n_f32(v12, self->_absoluteQuaternion.w);
  v14 = (float32x4_t)vextq_s8(vextq_s8(v11, v11, 4uLL), (int8x16_t)v5, 0xCuLL);
  v14.i32[3] = v14.i32[0];
  v15 = vmulq_f32(v14, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v12, 3), (int8x16_t)v12, 4uLL));
  v16 = vaddq_f32(v13, v15);
  v17 = vsubq_f32(v13, v15);
  v18 = vuzp2q_s32(v5, vzip1q_s32(v5, v5));
  v19 = (float32x4_t)v18;
  v19.i32[1] = v11.i32[0];
  v19.i32[3] = v18.i32[2];
  v20 = v12;
  v20.i32[3] = v12.i32[1];
  v21 = vmulq_f32(v19, v20);
  v22 = vaddq_f32(v16, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 4uLL), (int32x4_t)v21));
  v22.i32[3] = vsubq_f32(v17, v21).i32[3];
  v17.i64[0] = v5.i64[0];
  v17.i64[1] = __PAIR64__(v5.u32[1], v11.u32[0]);
  v12.i32[3] = v12.i32[2];
  v23 = (int32x4_t)vmulq_f32(v17, v12);
  self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v22, (float32x4_t)vzip2q_s32(vzip1q_s32(v23, (int32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v23, 0xCuLL)), v23));
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose", *(_QWORD *)&a3.x, *(_QWORD *)&a3.q[2]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewerOffset");
  -[_UIMotionAttitudeAnalyzer _resetDirectionalLockWithViewerOffset:](self, "_resetDirectionalLockWithViewerOffset:");

  -[_UIMotionAttitudeAnalyzer _currentRawOffset:](self, "_currentRawOffset:", v33, v32, v31, v30);
  v26 = v25;
  v28 = v27;
  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setViewerOffset:", v26, v28);

  -[_UIMotionAnalyzer viewerRelativeDevicePose](self, "viewerRelativeDevicePose");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "viewerOffset");
  -[_UIMotionAttitudeAnalyzer _updateSmoothedOffsetForRawOffset:](self, "_updateSmoothedOffsetForRawOffset:");

}

- (double)_directionLockStrength
{
  return self->_lockStrength;
}

- (BOOL)_shouldSuspendApplicationForHysteresisGivenNewViewerOffset:(UIOffset)a3 wasSuspendingApplicationForHysteresis:(BOOL)a4
{
  double vertical;
  double horizontal;
  double v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  double v10;
  int v11;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v6 = self->_lastAppliedViewerOffset.horizontal * self->_lastAppliedViewerOffset.horizontal
     + self->_lastAppliedViewerOffset.vertical * self->_lastAppliedViewerOffset.vertical;
  if (a4)
  {
    v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76710, (uint64_t)CFSTR("UIMotionEffectHysteresisExitThreshold"));
    v8 = qword_1ECD76718;
    v9 = v7 == 0;
    v10 = 0.0075;
  }
  else
  {
    v11 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_21, (uint64_t)CFSTR("UIMotionEffectHysteresisEntranceThreshold"));
    v8 = qword_1ECD76708;
    v9 = v11 == 0;
    v10 = 0.006;
  }
  if (!v9)
    *(double *)&v8 = v10;
  return v6 < *(double *)&v8 && horizontal * horizontal + vertical * vertical < *(double *)&v8;
}

- (void)_createIdleIndicator
{
  double v3;
  double v4;
  UILabel *v5;
  UILabel *idleIndicator;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  -[_UIMotionAttitudeAnalyzer _createDiagnosticsWindow](self, "_createDiagnosticsWindow");
  if (!self->_idleIndicator)
  {
    -[UIView bounds](self->_diagnosticsWindow, "bounds");
    v5 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v3 + -80.0, v4 + -60.0, 60.0, 40.0);
    idleIndicator = self->_idleIndicator;
    self->_idleIndicator = v5;

    v7 = self->_idleIndicator;
    +[UIColor redColor](UIColor, "redColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UIView setAlpha:](self->_idleIndicator, "setAlpha:", 0.7);
    v9 = self->_idleIndicator;
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 18.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = self->_idleIndicator;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setTextAlignment:](self->_idleIndicator, "setTextAlignment:", 1);
    -[UILabel setText:](self->_idleIndicator, "setText:", CFSTR("Idle"));
    -[UIView layer](self->_idleIndicator, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor whiteColor](UIColor, "whiteColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    -[UIView layer](self->_idleIndicator, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderWidth:", 2.0);

    -[UIView layer](self->_idleIndicator, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", 10.0);

    -[UIView addSubview:](self->_diagnosticsWindow, "addSubview:", self->_idleIndicator);
    -[UIView setHidden:](self->_idleIndicator, "setHidden:", 1);
  }
}

- (void)_createDirectionLockIndicators
{
  double v3;
  double v4;
  UIView *v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *horizontalLockIndicator;
  UIView *v10;
  void *v11;
  double v12;
  double v13;
  UIView *v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *verticalLockIndicator;
  UIView *v19;
  void *v20;

  -[_UIMotionAttitudeAnalyzer _createDiagnosticsWindow](self, "_createDiagnosticsWindow");
  if (!self->_horizontalLockIndicator)
  {
    -[UIView bounds](self->_diagnosticsWindow, "bounds");
    v4 = v3;
    v5 = [UIView alloc];
    -[UIView bounds](self->_diagnosticsWindow, "bounds");
    v8 = -[UIView initWithFrame:](v5, "initWithFrame:", 0.0, round(v7 + (v6 + -10.0) * 0.5), v4, 10.0);
    horizontalLockIndicator = self->_horizontalLockIndicator;
    self->_horizontalLockIndicator = v8;

    v10 = self->_horizontalLockIndicator;
    +[UIColor redColor](UIColor, "redColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIView setAlpha:](self->_horizontalLockIndicator, "setAlpha:", 0.5);
    -[UIView addSubview:](self->_diagnosticsWindow, "addSubview:", self->_horizontalLockIndicator);
    -[UIView setHidden:](self->_horizontalLockIndicator, "setHidden:", 1);
  }
  if (!self->_verticalLockIndicator)
  {
    -[UIView bounds](self->_diagnosticsWindow, "bounds");
    v13 = v12;
    v14 = [UIView alloc];
    -[UIView bounds](self->_diagnosticsWindow, "bounds");
    v17 = -[UIView initWithFrame:](v14, "initWithFrame:", round(v16 + (v15 + -10.0) * 0.5), 0.0, 10.0, v13);
    verticalLockIndicator = self->_verticalLockIndicator;
    self->_verticalLockIndicator = v17;

    v19 = self->_verticalLockIndicator;
    +[UIColor redColor](UIColor, "redColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIView setAlpha:](self->_verticalLockIndicator, "setAlpha:", 0.5);
    -[UIView addSubview:](self->_diagnosticsWindow, "addSubview:", self->_verticalLockIndicator);
    -[UIView setHidden:](self->_verticalLockIndicator, "setHidden:", 1);
  }
}

- (void)_createDiagnosticsWindow
{
  UIWindow *v3;
  void *v4;
  UIWindow *v5;
  UIWindow *diagnosticsWindow;

  if (!self->_diagnosticsWindow)
  {
    v3 = [UIWindow alloc];
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[UIWindow initWithFrame:](v3, "initWithFrame:");
    diagnosticsWindow = self->_diagnosticsWindow;
    self->_diagnosticsWindow = v5;

    -[UIWindow setWindowLevel:](self->_diagnosticsWindow, "setWindowLevel:", 1051.0);
    -[UIView setUserInteractionEnabled:](self->_diagnosticsWindow, "setUserInteractionEnabled:", 0);
    -[UIWindow setHidden:](self->_diagnosticsWindow, "setHidden:", 0);
  }
}

@end
