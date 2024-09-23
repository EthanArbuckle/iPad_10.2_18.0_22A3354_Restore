@implementation BiEncoderCNNInput

- (NSSet)featureNames
{
  void *v2;

  sub_2496FD7F4((uint64_t)&unk_251AA6DE8);
  swift_arrayDestroy();
  v2 = (void *)sub_24972CD50();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_24972CBB8() == 0x68736E6565726373 && v4 == 0xEA0000000000746FLL || (sub_24972D1DC() & 1) != 0)
  {
    v5 = *(_QWORD *)self->screenshot;
    v6 = (void *)objc_opt_self();
    swift_retain();
    v7 = objc_msgSend(v6, sel_featureValueWithPixelBuffer_, v5);
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
