@implementation PTVFXRenderEffectBinding

- (PTVFXRenderEffectBinding)initWithHumanDetections:(id)a3
{
  id v5;
  PTVFXRenderEffectBinding *v6;
  PTVFXRenderEffectBinding *v7;
  uint64_t v8;
  NSNumber *faceDetectionGroupId;
  PTVFXRenderEffectBinding *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTVFXRenderEffectBinding;
  v6 = -[PTVFXRenderEffectBinding init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_duration = 7.0;
    v6->_forceFadeOutStart = 3.4028e38;
    v6->_active = 1;
    objc_storeStrong((id *)&v6->_humanDetections, a3);
    -[PTVFXRenderEffectBinding singleDetectionGroupId](v7, "singleDetectionGroupId");
    v8 = objc_claimAutoreleasedReturnValue();
    faceDetectionGroupId = v7->_faceDetectionGroupId;
    v7->_faceDetectionGroupId = (NSNumber *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)singleDetectionGroupId
{
  PTHumanDetection *v3;
  int *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t groupId;
  uint64_t v9;
  unsigned int v10;
  void *v11;

  v3 = -[PTHumanDetections detectionsFiltered](self->_humanDetections, "detectionsFiltered");
  v4 = -[PTHumanDetections faceDetectionsFilteredState:](self->_humanDetections, "faceDetectionsFilteredState:", 0);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  groupId = 0;
  v9 = 0;
  do
  {
    v10 = v4[v5];
    if (v10 >= 2)
    {
      if (v10 == 2)
      {
        groupId = v3->groupId;
        ++v6;
      }
    }
    else
    {
      v9 = v3->groupId;
      ++v7;
    }
    ++v5;
    v3 += 36;
  }
  while (v5 != 4);
  if (v7 == 1 || (v11 = 0, !v7) && (v9 = groupId, v6 == 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (uint64_t)screenSpaceToCameraSpace:(float64x2_t)a3 videoRect:(float64_t)a4
{
  if (a5.f64[0] > 0.0 && a6 > 0.0)
  {
    a5.f64[1] = a6;
    a3.f64[1] = a4;
    *(float32x2_t *)&a3.f64[0] = vcvt_f32_f64(a3);
    a2 = vdiv_f32(vsub_f32(a2, *(float32x2_t *)&a3.f64[0]), vcvt_f32_f64(a5));
  }
  LODWORD(a3.f64[0]) = *(_DWORD *)(a1 + 48);
  return +[PTEffectUtil screenSpaceToCameraSpace:zValue:inverseProjection:](PTEffectUtil, "screenSpaceToCameraSpace:zValue:inverseProjection:", *(double *)&a2, a3.f64[0], *(double *)(a1 + 128), *(double *)(a1 + 144), *(double *)(a1 + 160), *(double *)(a1 + 176));
}

- (int)updateWithEvent:(id)a3 renderRequest:(id)a4 videoRect:(CGRect)a5 time:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  VFXBinding *headPositionBinding;
  PTHumanDetection *v16;
  int *v17;
  uint64_t v18;
  double *p_groupId;
  int v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  void *v27;
  void *v28;
  VFXBinding *durationBinding;
  id v30;
  float32x4_t v31;
  void *v32;
  double v33;
  float duration;
  float v35;
  double v36;
  double forceFadeOutStart;
  float v38;
  float v39;
  NSData *v40;
  NSData *opacityValue;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v48;
  float32x4_t v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float32x4_t v55;
  _BYTE v56[128];
  uint64_t v57;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v57 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  if (!self->_active)
    goto LABEL_37;
  v48 = v13;
  headPositionBinding = self->_headPositionBinding;
  if (self->_faceDetectionGroupId)
  {
    if (headPositionBinding)
    {
      v16 = -[PTHumanDetections detectionsFiltered](self->_humanDetections, "detectionsFiltered");
      v17 = -[PTHumanDetections faceDetectionsFilteredState:](self->_humanDetections, "faceDetectionsFilteredState:", 0);
      v18 = 0;
      p_groupId = (double *)&v16[4].groupId;
      do
      {
        v20 = *((_DWORD *)p_groupId - 4);
        if (v20 == -[NSNumber intValue](self->_faceDetectionGroupId, "intValue") && v17[v18] != 3)
        {
          +[PTVFXRenderEffect transformVideoRectToCropCoordinates:effectRenderRequest:](PTVFXRenderEffect, "transformVideoRectToCropCoordinates:effectRenderRequest:", v14, *p_groupId);
          v50 = *(double *)v21.i64;
          *(float32x2_t *)v21.i8 = vmla_f32(*(float32x2_t *)v21.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL));
          *(float *)&v21.i32[1] = 1.0 - *(float *)&v21.i32[1];
          -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:", *(double *)v21.i64, x, y, width, height);
          v49 = v22;
          -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:", v50, x, y, width, height);
          v24 = vsubq_f32(v49, v23);
          v25 = vmulq_f32(v24, v24);
          v26 = v49;
          v26.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
          v55 = v26;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v55, 16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v27, self->_headPositionBinding);

        }
        p_groupId += 18;
        ++v18;
      }
      while (v18 != 4);
    }
  }
  else if (headPositionBinding)
  {
    v55 = 0uLL;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v55, 16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v28, self->_headPositionBinding);

  }
  durationBinding = self->_durationBinding;
  if (durationBinding)
  {
    -[VFXBinding rawValue](durationBinding, "rawValue");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_duration = *(float *)objc_msgSend(v30, "bytes");

  }
  v13 = v48;
  if (v48 && self->_positionBinding)
  {
    objc_msgSend(v48, "position");
    +[PTVFXRenderEffect transformVideoPositionToCropCoordinates:effectRenderRequest:flipYAxis:](PTVFXRenderEffect, "transformVideoPositionToCropCoordinates:effectRenderRequest:flipYAxis:", v14, 1);
    -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:");
    v55 = v31;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v55, 16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v32, self->_positionBinding);

  }
  v33 = a6 - self->_creationTimeSeconds;
  duration = self->_duration;
  self->_active = v33 < duration;
  v35 = 0.0;
  if (v33 < duration && self->_useBackgroundDimming)
  {
    if (v33 >= 0.660000026)
    {
      v35 = 1.0;
      if (v33 < (float)(duration + -2.0))
        goto LABEL_24;
      v36 = (duration - v33) * 0.5;
    }
    else
    {
      v36 = v33 / 0.660000026;
    }
    v35 = v36;
  }
LABEL_24:
  self->_dimmingFactor = v35;
  forceFadeOutStart = self->_forceFadeOutStart;
  if (forceFadeOutStart < a6)
  {
    v38 = a6 - forceFadeOutStart + a6 - forceFadeOutStart;
    if (v38 <= 1.0)
    {
      v39 = 1.0 - v38;
      v55.f32[0] = v39;
      if (v35 >= v39)
        v35 = v39;
    }
    else
    {
      self->_active = 0;
      v55.i32[0] = 0;
      v35 = 0.0;
    }
    self->_dimmingFactor = v35;
    v40 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v55, 4);
    opacityValue = self->_opacityValue;
    self->_opacityValue = v40;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v42 = self->_opacityBindings;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "setRawValue:", self->_opacityValue);
        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v44);
    }

  }
LABEL_37:

  return 0;
}

- (int)updateBackgroundDimming:(float)a3
{
  void *v4;
  float v6;

  v6 = a3;
  if (self->_backgroundDimmingBinding)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTVFXRenderEffectBinding setRawValue:onBinding:](PTVFXRenderEffectBinding, "setRawValue:onBinding:", v4, self->_backgroundDimmingBinding);

  }
  return 0;
}

- (void)forceFadeOut:(double)a3
{
  float v3;

  v3 = a3;
  self->_forceFadeOutStart = v3;
}

+ (void)setRawValue:(id)a3 onBinding:(id)a4
{
  objc_msgSend(a4, "setRawValue:", a3);
}

- (float)dimmingFactor
{
  return self->_dimmingFactor;
}

- (BOOL)active
{
  return self->_active;
}

- (_TtC3VFX9VFXEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (VFXBinding)positionBinding
{
  return self->_positionBinding;
}

- (void)setPositionBinding:(id)a3
{
  objc_storeStrong((id *)&self->_positionBinding, a3);
}

- (VFXBinding)headPositionBinding
{
  return self->_headPositionBinding;
}

- (void)setHeadPositionBinding:(id)a3
{
  objc_storeStrong((id *)&self->_headPositionBinding, a3);
}

- (VFXBinding)backgroundDimmingBinding
{
  return self->_backgroundDimmingBinding;
}

- (void)setBackgroundDimmingBinding:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDimmingBinding, a3);
}

- (NSMutableArray)opacityBindings
{
  return self->_opacityBindings;
}

- (void)setOpacityBindings:(id)a3
{
  objc_storeStrong((id *)&self->_opacityBindings, a3);
}

- (NSData)opacityValue
{
  return self->_opacityValue;
}

- (void)setOpacityValue:(id)a3
{
  objc_storeStrong((id *)&self->_opacityValue, a3);
}

- (BOOL)useBackgroundDimming
{
  return self->_useBackgroundDimming;
}

- (void)setUseBackgroundDimming:(BOOL)a3
{
  self->_useBackgroundDimming = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (VFXBinding)durationBinding
{
  return self->_durationBinding;
}

- (void)setDurationBinding:(id)a3
{
  objc_storeStrong((id *)&self->_durationBinding, a3);
}

- (double)creationTimeSeconds
{
  return self->_creationTimeSeconds;
}

- (void)setCreationTimeSeconds:(double)a3
{
  self->_creationTimeSeconds = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (float)emitZValue
{
  return self->_emitZValue;
}

- (void)setEmitZValue:(float)a3
{
  self->_emitZValue = a3;
}

- (double)inverseCameraProjection
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 128), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setInverseCameraProjection:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 128), v5, 64, 1, 0);
}

- (BOOL)useCircularGradient
{
  return self->_useCircularGradient;
}

- (void)setUseCircularGradient:(BOOL)a3
{
  self->_useCircularGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationBinding, 0);
  objc_storeStrong((id *)&self->_opacityValue, 0);
  objc_storeStrong((id *)&self->_opacityBindings, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingBinding, 0);
  objc_storeStrong((id *)&self->_headPositionBinding, 0);
  objc_storeStrong((id *)&self->_positionBinding, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_faceDetectionGroupId, 0);
  objc_storeStrong((id *)&self->_humanDetections, 0);
}

@end
