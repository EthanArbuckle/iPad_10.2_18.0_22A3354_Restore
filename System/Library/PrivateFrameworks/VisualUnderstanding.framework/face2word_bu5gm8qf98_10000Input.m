@implementation face2word_bu5gm8qf98_10000Input

- (NSSet)featureNames
{
  void *v2;

  sub_24A01C274((uint64_t)&unk_251B67E28);
  swift_arrayDestroy();
  v2 = (void *)sub_24A01F018();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_24A01EE68() == 0xD000000000000011 && v4 == 0x800000024A021CF0 || (sub_24A01F45C() & 1) != 0)
  {
    v5 = *(_QWORD *)self->subject_embedding;
    v6 = (void *)objc_opt_self();
    swift_retain();
    v7 = objc_msgSend(v6, sel_featureValueWithMultiArray_, v5);
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

@end
