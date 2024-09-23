@implementation _UISliderFluidTickConfiguration

- (int64_t)behavior
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration__behavior);
}

- (NSArray)ticks
{
  void *v2;

  sub_1851F9080(0, qword_1EDD7D690);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int64_t)tickStyle
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickStyle);
}

- (void)setTickStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickStyle) = (Class)a3;
}

- (UIColor)tickColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor));
}

- (void)setTickColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor) = (Class)a3;
  v3 = a3;

}

- (float)snappingDistance
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_snappingDistance);
}

- (void)setSnappingDistance:(float)a3
{
  *(float *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_snappingDistance) = a3;
}

- (_UISliderFluidTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4
{
  uint64_t v5;

  sub_1851F9080(0, qword_1EDD7D690);
  v5 = sub_186507654();
  return (_UISliderFluidTickConfiguration *)_UISliderFluidTickConfiguration.init(ticks:behavior:)(v5, a4);
}

- (_UISliderFluidTickConfiguration)init
{
  void *v3;
  _UISliderFluidTickConfiguration *v4;

  sub_1851F9080(0, qword_1EDD7D690);
  v3 = (void *)sub_18650763C();
  v4 = -[_UISliderFluidTickConfiguration initWithTicks:behavior:](self, sel_initWithTicks_behavior_, v3, 0);

  return v4;
}

- (_UISliderFluidTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4
{
  void *v6;
  _UISliderFluidTickConfiguration *v7;

  sub_1856C746C(a3);
  sub_1851F9080(0, qword_1EDD7D690);
  v6 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  v7 = -[_UISliderFluidTickConfiguration initWithTicks:behavior:](self, sel_initWithTicks_behavior_, v6, a4);

  return v7;
}

- (id)copyWithZone:(void *)a3
{
  _UISliderFluidTickConfiguration *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  _UISliderFluidTickConfiguration.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0Tm(v7, v7[3]);
  v5 = (void *)sub_186507FB4();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _UISliderFluidTickConfiguration *v4;
  _UISliderFluidTickConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = _UISliderFluidTickConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1855BDE94((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6
{
  _UISliderFluidTickConfiguration *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  BOOL v14;

  v10 = self;
  sub_1856C7614(v10, a3);
  if ((v13 & 0x100000000) == 0)
  {
    if (!a4)
    {
      __break(1u);
      return v11;
    }
    *(_DWORD *)a4 = v11;
    if (a5)
      *(_DWORD *)a5 = v12;
    if (a6)
      *(_DWORD *)a6 = v13;
  }
  v14 = (v13 & 0x100000000) == 0;

  LOBYTE(v11) = v14;
  return v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
