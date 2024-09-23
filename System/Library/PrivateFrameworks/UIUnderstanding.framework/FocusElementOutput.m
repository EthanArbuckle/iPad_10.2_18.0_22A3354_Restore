@implementation FocusElementOutput

- (NSSet)featureNames
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  sub_24972CD5C();
  swift_release();

  v4 = (void *)sub_24972CD50();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_24972CBB8();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_24972CB94();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
