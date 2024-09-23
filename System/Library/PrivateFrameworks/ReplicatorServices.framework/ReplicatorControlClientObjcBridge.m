@implementation ReplicatorControlClientObjcBridge

- (id)devices
{
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v2;
  void *v3;

  v2 = self;
  sub_2453BCAB8();

  sub_2453BDD3C();
  v3 = (void *)sub_245443E8C();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEnabled
{
  return sub_2453BD000(self);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v4;

  v4 = self;
  sub_2453BCD58(a3);

}

- (BOOL)isAllowListEnabled
{
  return sub_2453BD000(self);
}

- (id)allowList
{
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_2453BD080();

  if (v3)
  {
    sub_245443B14();
    v4 = (void *)sub_245443E8C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setAllowList:(id)a3
{
  void *v4;
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v5;
  Swift::OpaquePointer v6;

  if (a3)
  {
    sub_245443B14();
    v4 = (void *)sub_245443E98();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  v6._rawValue = v4;
  sub_2453BD1C0(v6);

  swift_bridgeObjectRelease();
}

- (id)pushToken:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v4 = sub_245443B14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245443AFC();
  v8 = self;
  v9 = sub_2453BD478();
  v11 = v10;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = 0;
  if (v11 >> 60 != 15)
  {
    v12 = (void *)sub_245443A6C();
    sub_2453BDCE4(v9, v11);
  }
  return v12;
}

- (_TtC18ReplicatorServices33ReplicatorControlClientObjcBridge)init
{
  uint64_t v3;
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC18ReplicatorServices33ReplicatorControlClientObjcBridge_controlClient;
  type metadata accessor for ReplicatorControlClient();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)ReplicatorControlClient.init()();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ReplicatorControlClientObjcBridge();
  return -[ReplicatorControlClientObjcBridge init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
