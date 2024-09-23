@implementation EmitNavigationEventWrapper

+ (void)generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:(id)a3 title:(id)a4 localizedNavigationComponents:(id)a5 deepLink:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;

  v7 = sub_22E056590();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22E056650();
  v13 = v12;
  sub_22E0544F4();
  v14 = sub_22E056668();
  sub_22E056584();
  v15 = a4;
  sub_22E054348(v11, v13, v15, v14, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC17GeneralSettingsUI26EmitNavigationEventWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmitNavigationEventWrapper();
  return -[EmitNavigationEventWrapper init](&v3, sel_init);
}

@end
