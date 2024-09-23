@implementation SettingsProtocolDispatch

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  return (_TtP8Settings20SettingsHostProtocol_ *)objc_msgSend(*(id *)self->target, sel_settingsHost);
}

- (void)setSettingsHost:(id)a3
{
  objc_msgSend(*(id *)self->target, sel_setSettingsHost_, a3);
}

- (void)willSelect
{
  sub_1DB4466CC((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1DB44533C);
}

- (void)willSelectWithRevealElementKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v3 = sub_1DB4A1644();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  swift_retain();
  sub_1DB445648(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)willSelectWithNavigationPath:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1DB445A34(v3);

  swift_release();
}

- (void)handshakeWithEndPoint:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1DB449570(v3);

  swift_release();
}

- (void)didUnselect
{
  sub_1DB4466CC((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1DB4463B0);
}

- (void)isCloudSyncEnabled:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_1DB449B34(v4, (void (**)(_QWORD, _QWORD, _QWORD))v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  swift_retain();
  sub_1DB4467A8(a3);
  swift_release();
}

- (void)popNavigationStack
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *oslog;
  uint64_t v9;

  if (qword_1F02E1350 != -1)
    swift_once();
  if (qword_1F02E1358 != -1)
    swift_once();
  v0 = sub_1DB4A0E28();
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02E1D48);
  oslog = sub_1DB4A0E10();
  v1 = sub_1DB4A1824();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = swift_slowAlloc();
    v3 = swift_slowAlloc();
    v9 = v3;
    *(_DWORD *)v2 = 136446978;
    v4 = sub_1DB4A19F8();
    sub_1DB447BF8(v4, v5, &v9);
    sub_1DB4A192C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2048;
    sub_1DB4A192C();
    *(_WORD *)(v2 + 22) = 2082;
    v6 = sub_1DB4A19F8();
    sub_1DB447BF8(v6, v7, &v9);
    sub_1DB4A192C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 32) = 2082;
    sub_1DB447BF8(0, 0xE000000000000000, &v9);
    sub_1DB4A192C();
    _os_log_impl(&dword_1DB433000, oslog, v1, "%{public}s:%ld %{public}s %{public}s", (uint8_t *)v2, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x1DF0AF4DC](v3, -1, -1);
    MEMORY[0x1DF0AF4DC](v2, -1, -1);

  }
  else
  {

  }
}

@end
