@implementation aa_encoder_20240530Input

- (NSSet)featureNames
{
  void *v2;

  sub_24A18C830((uint64_t)&unk_251B9A630);
  swift_arrayDestroy();
  v2 = (void *)sub_24A21605C();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  void *v7;
  id v8;

  if (sub_24A215CB4() == 0x61775F7475706E69 && v4 == 0xE900000000000076 || (sub_24A21659C() & 1) != 0)
  {
    v5 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 11);
    v6 = swift_retain();
    v7 = (void *)v5(v6);
    v8 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, v7);
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = 0;
  }
  return v8;
}

@end
