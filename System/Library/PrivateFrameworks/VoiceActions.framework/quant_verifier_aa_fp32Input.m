@implementation quant_verifier_aa_fp32Input

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_24A18C830((uint64_t)&unk_251B9BAA8);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_24A21605C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = sub_24A215CB4();
  v5 = v4;
  swift_retain();
  v6 = sub_24A18FDE4(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
