@implementation SUIAShockwaveRadialMaskSettings

- (NSString)name
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_247C9FDB4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_name);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)locations
{
  return (NSArray *)sub_247C99128((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SUIAShockwaveRadialMaskSettings_locations, &qword_2576F0C38);
}

- (void)setLocations:(id)a3
{
  sub_247C99218((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_2576F0C38, 0x24BDD16E0, &OBJC_IVAR___SUIAShockwaveRadialMaskSettings_locations);
}

- (NSArray)colors
{
  return (NSArray *)sub_247C99128((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SUIAShockwaveRadialMaskSettings_colors, &qword_2576F0C40);
}

- (void)setColors:(id)a3
{
  sub_247C99218((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_2576F0C40, 0x24BEBD4B8, &OBJC_IVAR___SUIAShockwaveRadialMaskSettings_colors);
}

- (PTSizeSettings)gradientLayerSize
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  return (PTSizeSettings *)*v2;
}

- (void)setGradientLayerSize:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)majorDiameter
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter);
  swift_beginAccess();
  return *v2;
}

- (void)setMajorDiameter:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter);
  swift_beginAccess();
  *v4 = a3;
}

- (double)ringWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setRingWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)blurRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setBlurRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)sampleCount
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount);
  swift_beginAccess();
  return *v2;
}

- (void)setSampleCount:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount);
  swift_beginAccess();
  *v4 = a3;
}

+ (BOOL)ignoresKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (a3)
  {
    v3 = sub_247C9FDB4();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  swift_getObjCClassMetadata();
  v6 = static SUIAShockwaveRadialMaskSettings.ignoresKey(_:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)donut
{
  double v2;

  -[SUIAShockwaveRadialMaskSettings ringWidth](self, sel_ringWidth);
  return v2 > 0.0;
}

- (double)innerRadius
{
  SUIAShockwaveRadialMaskSettings *v2;
  double v3;

  v2 = self;
  v3 = SUIAShockwaveRadialMaskSettings.innerRadius.getter();

  return v3;
}

- (double)outerRadius
{
  SUIAShockwaveRadialMaskSettings *v2;
  double v3;

  v2 = self;
  v3 = SUIAShockwaveRadialMaskSettings.outerRadius.getter();

  return v3;
}

- (double)maximumExtentOfZeroOpacity
{
  SUIAShockwaveRadialMaskSettings *v2;
  double v3;

  v2 = self;
  v3 = SUIAShockwaveRadialMaskSettings.maximumExtentOfZeroOpacity.getter();

  return v3;
}

- (double)radiusOfMaximumOpacity
{
  SUIAShockwaveRadialMaskSettings *v2;
  double v3;

  v2 = self;
  v3 = SUIAShockwaveRadialMaskSettings.radiusOfMaximumOpacity.getter();

  return v3;
}

- (BOOL)validateComputedValuesCorrespondToSourceValues
{
  SUIAShockwaveRadialMaskSettings *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = SUIAShockwaveRadialMaskSettings.validateComputedValuesCorrespondToSourceValues()();

  return v3;
}

- (id)computeDerivativeValuesAndGenerateSource
{
  SUIAShockwaveRadialMaskSettings *v2;
  void *v3;

  v2 = self;
  SUIAShockwaveRadialMaskSettings.computeDerivativeValuesAndGenerateSource()();

  v3 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUIAShockwaveRadialMaskSettings;
  -[PTSettings setDefaultValues](&v2, sel_setDefaultValues);
}

- (void)setDefaultValuesWithName:(id)a3 majorDiameter:(double)a4 ringWidth:(double)a5 blurRadius:(double)a6 sampleCount:(unint64_t)a7 locations:(id)a8 colors:(id)a9 gradientLayerSize:(CGSize)a10
{
  double height;
  double width;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SUIAShockwaveRadialMaskSettings *v20;

  height = a10.height;
  width = a10.width;
  v17 = sub_247C9FDB4();
  v19 = v18;
  sub_247C84B94(0, &qword_2576F0C38);
  sub_247C9FE08();
  sub_247C84B94(0, &qword_2576F0C40);
  sub_247C9FE08();
  v20 = self;
  SUIAShockwaveRadialMaskSettings.setDefaultValuesWithName(_:majorDiameter:ringWidth:blurRadius:sampleCount:locations:colors:gradientLayerSize:)(a4, a5, a6, width, height, v17, v19, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)settingsControllerModule
{
  id v2;

  _sSo31SUIAShockwaveRadialMaskSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
