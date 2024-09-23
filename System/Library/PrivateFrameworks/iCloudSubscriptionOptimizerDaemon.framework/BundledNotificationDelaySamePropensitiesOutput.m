@implementation BundledNotificationDelaySamePropensitiesOutput

- (NSSet)featureNames
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  sub_21DB96D1C();
  swift_release();

  v4 = (void *)sub_21DB96D10();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_21DB96B78();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_21DB96B54();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
