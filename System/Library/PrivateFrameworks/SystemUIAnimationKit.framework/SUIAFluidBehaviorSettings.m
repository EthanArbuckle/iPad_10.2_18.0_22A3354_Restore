@implementation SUIAFluidBehaviorSettings

- (int64_t)behaviorType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  return *v2;
}

- (void)setBehaviorType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)name
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_name;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_247C9FDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_name);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)dampingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)response
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_response);
  swift_beginAccess();
  return *v2;
}

- (void)setResponse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_response);
  swift_beginAccess();
  *v4 = a3;
}

- (double)retargetImpulse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setRetargetImpulse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingDampingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingResponse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingRetargetImpulse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (double)dampingRatioSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)responseSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setResponseSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingDampingRatioSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingResponseSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)inertialTargetSmoothingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)inertialProjectionDeceleration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  *v4 = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  return (PTFrameRateRangeSettings *)*v2;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setDefaultValues
{
  SUIAFluidBehaviorSettings *v2;

  v2 = self;
  SUIAFluidBehaviorSettings.setDefaultValues()();

}

- (void)setDefaultCriticallyDampedValues
{
  SUIAFluidBehaviorSettings *v2;

  v2 = self;
  -[SUIAFluidBehaviorSettings setDefaultValues](v2, sel_setDefaultValues);
  -[SUIAFluidBehaviorSettings setDampingRatio:](v2, sel_setDampingRatio_, 1.0);
  -[SUIAFluidBehaviorSettings setResponse:](v2, sel_setResponse_, 0.336);

}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  SUIAFluidBehaviorSettings *v8;
  double v9;
  $6E732EA7D3E0C9EC9CEEF7385E7E4683 *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;

  v8 = self;
  SUIAFluidBehaviorSettings.parametersForTransition(from:to:)(a4, a5, (uint64_t)&v14);
  LOBYTE(a5) = v15;
  LOBYTE(a4) = v16;
  v9 = v20;

  v11 = v17;
  v12 = v18;
  v13 = v19;
  *(_OWORD *)&retstr->var0 = v14;
  retstr->var2 = a5;
  retstr->var3 = a4;
  *(_OWORD *)&retstr->var4 = v11;
  *(_OWORD *)&retstr->var6 = v12;
  *(_OWORD *)&retstr->var8 = v13;
  retstr->var10 = v9;
  return result;
}

- (id)BSAnimationSettings
{
  SUIAFluidBehaviorSettings *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  double v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = 0.0;
  v9[0] = 0.0;
  v2 = self;
  -[SUIAFluidBehaviorSettings dampingRatio](v2, sel_dampingRatio);
  v4 = v3;
  -[SUIAFluidBehaviorSettings response](v2, sel_response);
  SUIAConvertDampingRatioAndResponseToTensionAndFriction(v9, &v8, v4, v5);
  v6 = objc_msgSend((id)objc_opt_self(), sel_settingsWithMass_stiffness_damping_, 1.0, v9[0], v8);

  return v6;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;
  float preferred;
  float maximum;
  float minimum;
  SUIAFluidBehaviorSettings *v8;
  PTFrameRateRangeSettings *v9;
  double v10;
  double v11;
  double v12;
  PTFrameRateRangeSettings *v13;

  v4 = *(_QWORD *)&a4;
  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  v8 = self;
  v9 = -[SUIAFluidBehaviorSettings preferredFrameRateRange](v8, sel_preferredFrameRateRange);
  if (v9)
  {
    v13 = v9;
    *(float *)&v10 = minimum;
    *(float *)&v11 = maximum;
    *(float *)&v12 = preferred;
    -[PTFrameRateRangeSettings setFrameRateRange:highFrameRateReason:](v9, sel_setFrameRateRange_highFrameRateReason_, v4, v10, v11, v12);

  }
  else
  {
    __break(1u);
  }
}

- (CAFrameRateRange)frameRateRange
{
  SUIAFluidBehaviorSettings *v2;
  PTFrameRateRangeSettings *v3;
  float v4;
  float v5;
  float v6;
  PTFrameRateRangeSettings *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  CAFrameRateRange result;

  v2 = self;
  v3 = -[SUIAFluidBehaviorSettings preferredFrameRateRange](v2, sel_preferredFrameRateRange);
  if (v3)
  {
    v7 = v3;
    -[PTFrameRateRangeSettings frameRateRange](v3, sel_frameRateRange);
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v4 = v9;
    v5 = v11;
    v6 = v13;
  }
  else
  {
    __break(1u);
  }
  result.preferred = v6;
  result.maximum = v5;
  result.minimum = v4;
  return result;
}

+ (id)settingsControllerModule
{
  void *v3;
  id v4;

  v3 = (void *)sub_247C9FDA8();
  v4 = objc_msgSend(a1, sel__moduleWithSectionTitle_, v3);

  return v4;
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
    sub_247C9FDB4();
  _sSo25SUIAFluidBehaviorSettingsC20SystemUIAnimationKitE7_module16withSectionTitleSo8PTModuleCSgSSSg_tFZ_0();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

- (NSString)description
{
  SUIAFluidBehaviorSettings *v2;
  void *v3;

  v2 = self;
  SUIAFluidBehaviorSettings.description.getter();

  v3 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copy
{
  SUIAFluidBehaviorSettings *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  SUIAFluidBehaviorSettings.copy()(v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_247C9FF28();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUIAFluidBehaviorSettings *v4;
  SUIAFluidBehaviorSettings *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_247C9FE98();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SUIAFluidBehaviorSettings.isEqual(_:)((uint64_t)v8);

  sub_247C89618((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  SUIAFluidBehaviorSettings *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  SUIAFluidBehaviorSettings.hash.getter();
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
