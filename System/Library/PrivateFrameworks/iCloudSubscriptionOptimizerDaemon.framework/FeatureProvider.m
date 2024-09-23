@implementation FeatureProvider

- (NSSet)featureNames
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DB96D10();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setFeatureNames:(id)a3
{
  uint64_t v4;

  v4 = sub_21DB96D1C();
  swift_beginAccess();
  *(_QWORD *)self->featureNames = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)featureValueForName:(id)a3
{
  id v4;

  sub_21DB96B78();
  swift_retain();
  if (sub_21DB542BC((uint64_t)&unk_24E18F678) == 55)
  {
    swift_release();
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v4 = *(id *)((*((uint64_t (**)(void))self->super.isa + 50))() + 24);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v4;
}

@end
