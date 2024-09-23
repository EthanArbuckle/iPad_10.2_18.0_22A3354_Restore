@implementation TitleClassificationModelOutput

- (NSSet)featureNames
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  sub_1D49228D4();
  swift_release();

  v4 = (void *)sub_1D49228C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_1D492261C();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_1D49225F8();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
