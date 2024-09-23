@implementation PMExtensionCoordinator

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  swift_beginAccess();
  return (_TtP8Settings20SettingsHostProtocol_ *)(id)swift_unknownObjectRetain();
}

- (void)setSettingsHost:(id)a3
{
  swift_beginAccess();
  *(_QWORD *)self->settingsHost = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)willSelect:(id)a3
{
  _QWORD *v3;
  void (*v4)(_QWORD *);

  v3 = _Block_copy(a3);
  v4 = (void (*)(_QWORD *))v3[2];
  swift_retain();
  v4(v3);
  _Block_release(v3);
  swift_release();
}

@end
