@implementation pet2word_pf4dt5d4p3_10000Output

- (NSSet)featureNames
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  sub_24A01F024();
  swift_release();

  v4 = (void *)sub_24A01F018();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_24A01EE68();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_24A01EE44();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
