@implementation TwinEmbeddingTransformerSquareInput

- (NSSet)featureNames
{
  void *v2;

  swift_retain();
  sub_2496FD7F4((uint64_t)&unk_251AA7718);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_24972CD50();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = sub_24972CBB8();
  v5 = v4;
  swift_retain();
  v6 = sub_2496CF2D0(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end
