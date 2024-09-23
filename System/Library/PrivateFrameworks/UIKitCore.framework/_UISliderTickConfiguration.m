@implementation _UISliderTickConfiguration

- (int64_t)behavior
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration__behavior);
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

- (float)snappingDistance
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration_snappingDistance);
}

- (void)setSnappingDistance:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration_snappingDistance) = a3;
}

- (_UISliderTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4
{
  uint64_t v5;

  sub_1851F9080(0, qword_1EDD7D690);
  v5 = sub_186507654();
  return (_UISliderTickConfiguration *)_UISliderTickConfiguration.init(ticks:behavior:)(v5, a4);
}

- (_UISliderTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4
{
  void *v6;
  _UISliderTickConfiguration *v7;

  sub_1856C746C(a3);
  sub_1851F9080(0, qword_1EDD7D690);
  v6 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  v7 = -[_UISliderTickConfiguration initWithTicks:behavior:](self, sel_initWithTicks_behavior_, v6, a4);

  return v7;
}

- (id)copyWithZone:(void *)a3
{
  _UISliderTickConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  _UISliderTickConfiguration.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  v4 = (void *)sub_186507FB4();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UISliderTickConfiguration *v4;
  _UISliderTickConfiguration *v5;
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
  v6 = _UISliderTickConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1855BDE94((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6
{
  _UISliderTickConfiguration *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v10 = self;
  v11 = sub_1856C7610(a3);
  if ((v12 & 0x100000000) == 0)
  {
    if (!a4)
    {
      __break(1u);
      return v11;
    }
    *(_DWORD *)a4 = v11;
    if (a5)
      *a5 = *((float *)&v11 + 1);
    if (a6)
      *(_DWORD *)a6 = v12;
  }
  v13 = (v12 & 0x100000000) == 0;

  LOBYTE(v11) = v13;
  return v11;
}

- (_UISliderTickConfiguration)init
{
  _UISliderTickConfiguration *result;

  result = (_UISliderTickConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
