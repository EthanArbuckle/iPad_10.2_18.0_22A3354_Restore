@implementation VCUserDefaults

- (_TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults)initWithSuiteName:(id)a3
{
  void *v3;
  uint64_t v4;

  if (a3)
  {
    v3 = (void *)sub_24A259190();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults *)sub_24A252CEC(v3, v4);
}

- (id)objectForKey:(id)a3
{
  _TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  objc_super v14[2];
  objc_super v15;
  _QWORD v16[3];
  uint64_t v17;

  sub_24A259190();
  v4 = self;
  v5 = (void *)sub_24A259184();
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for VCUserDefaults();
  v6 = -[VCUserDefaults objectForKey:](&v15, sel_objectForKey_, v5);

  if (v6)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_24A258600((uint64_t)v14, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v7 = v17;
  if (!v17)
    return 0;
  v8 = __swift_project_boxed_opaque_existential_0(v16, v17);
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v8, v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  v12 = (void *)sub_24A259244();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v12;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults *v7;
  id v8;
  _TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_24A259190();

  sub_24A252FEC((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_24A25905C((uint64_t)v10, &qword_25791DE18);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
