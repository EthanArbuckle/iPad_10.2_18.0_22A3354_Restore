@implementation SettingsServiceScene.SettingsServiceProtocolDispatch

- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost
{
  return (_TtP8Settings27SettingsHostServiceProvider_ *)objc_msgSend(*(id *)self->target, sel_serviceHost);
}

- (void)setServiceHost:(id)a3
{
  objc_msgSend(*(id *)self->target, sel_setServiceHost_, a3);
}

- (void)openURL:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1DB470614(v3);

  swift_release();
}

- (void)getSidebarItems:(id)a3
{
  sub_1DB470960((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1DB471640);
}

- (void)getSidebarSections:(id)a3
{
  sub_1DB470960((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1DB47179C);
}

- (void)isAvailable:(id)a3
{
  sub_1DB470960((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1DB4718F8);
}

- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = _Block_copy(a5);
  v7 = sub_1DB4A1644();
  v9 = v8;
  v10 = sub_1DB4A16C8();
  _Block_copy(v6);
  swift_retain();
  sub_1DB471A30(v7, v9, v10, (uint64_t)self, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
