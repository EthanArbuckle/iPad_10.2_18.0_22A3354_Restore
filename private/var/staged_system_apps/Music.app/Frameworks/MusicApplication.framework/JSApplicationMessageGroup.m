@implementation JSApplicationMessageGroup

- (_TtC16MusicApplication25JSApplicationMessageGroup)init
{
  NSString v3;
  _TtC16MusicApplication25JSApplicationMessageGroup *v4;
  objc_super v6;

  v3 = String._bridgeToObjectiveC()();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSApplicationMessageGroup();
  v4 = -[JSApplicationMessageGroup initWithGroupIdentifier:](&v6, "initWithGroupIdentifier:", v3);

  return v4;
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 1;
}

- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4
{
  id v7;
  id v8;
  id v9;
  _TtC16MusicApplication25JSApplicationMessageGroup *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(double (*)(void **), uint64_t);
  id v15;
  _QWORD *v16;
  id v17;

  v7 = objc_allocWithZone((Class)type metadata accessor for JSApplicationMessage());
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = (void *)JSApplicationMessage.init(from:)(v8);
  v12 = (_QWORD *)*JSBridge.shared.unsafeMutableAddressor();
  v13 = swift_allocObject(&unk_137D3E0, 32, 7);
  *(_QWORD *)(v13 + 16) = v11;
  *(_QWORD *)(v13 + 24) = v9;
  v14 = *(void (**)(double (*)(void **), uint64_t))&stru_B8.segname[(swift_isaMask & *v12) + 16];
  v15 = v9;
  v16 = v12;
  v17 = v11;
  v14(sub_72AF8C, v13);

  swift_release(v13);
}

- (_TtC16MusicApplication25JSApplicationMessageGroup)initWithGroupIdentifier:(id)a3
{
  id v3;
  _TtC16MusicApplication25JSApplicationMessageGroup *result;

  v3 = a3;
  result = (_TtC16MusicApplication25JSApplicationMessageGroup *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSApplicationMessageGroup", 42, "init(groupIdentifier:)", 22, 0);
  __break(1u);
  return result;
}

@end
