@implementation SettingsService

- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost
{
  swift_beginAccess();
  return (_TtP8Settings27SettingsHostServiceProvider_ *)(id)swift_unknownObjectRetain();
}

- (void)setServiceHost:(id)a3
{
  swift_beginAccess();
  *(_QWORD *)self->serviceHost = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)getSidebarItems:(id)a3
{
  sub_1DB437F30((int)self, (int)a2, a3, (uint64_t)&unk_1EA2C5C08, (uint64_t)sub_1DB438904, (void (*)(uint64_t, uint64_t))sub_1DB437930);
}

- (void)isAvailable:(id)a3
{
  sub_1DB437F30((int)self, (int)a2, a3, (uint64_t)&unk_1EA2C5BE0, (uint64_t)sub_1DB4388FC, (void (*)(uint64_t, uint64_t))sub_1DB43797C);
}

- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = _Block_copy(a5);
  v6 = sub_1DB4A1644();
  v8 = v7;
  v9 = sub_1DB4A16C8();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v5;
  swift_retain();
  sub_1DB437B8C(v6, v8, v9, (void (*)())sub_1DB4388F4, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getSidebarSections:(id)a3
{
  sub_1DB437F30((int)self, (int)a2, a3, (uint64_t)&unk_1EA2C5B90, (uint64_t)sub_1DB4388EC, (void (*)(uint64_t, uint64_t))sub_1DB437E88);
}

- (void)openURL:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1DB437FB0((uint64_t)v3);

  swift_release();
}

@end
