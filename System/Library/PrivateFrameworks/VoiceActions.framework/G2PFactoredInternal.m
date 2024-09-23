@implementation G2PFactoredInternal

- (id)getPronounciationStringWithWord:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  G2PFactoredInternal *v9;
  void *v10;

  v5 = sub_24A215CB4();
  v7 = v6;
  v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x68);
  v9 = self;
  v8(v5, v7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_24A215C90();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)getPronounciationWithWord:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  G2PFactoredInternal *v9;
  void *v10;

  v5 = sub_24A215CB4();
  v7 = v6;
  v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x68);
  v9 = self;
  v8(v5, v7);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_24A215E94();
  swift_bridgeObjectRelease();
  return v10;
}

- (G2PFactoredInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for G2PFactored();
  return -[G2PFactoredInternal init](&v3, sel_init);
}

@end
