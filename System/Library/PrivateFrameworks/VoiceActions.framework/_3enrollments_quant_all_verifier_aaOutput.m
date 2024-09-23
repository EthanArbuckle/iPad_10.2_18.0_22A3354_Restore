@implementation _3enrollments_quant_all_verifier_aaOutput

- (NSSet)featureNames
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  sub_24A216068();
  swift_release();

  v4 = (void *)sub_24A21605C();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_24A215CB4();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_24A215C90();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end
