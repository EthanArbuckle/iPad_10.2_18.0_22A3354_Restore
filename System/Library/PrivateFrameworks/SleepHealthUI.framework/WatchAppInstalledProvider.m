@implementation WatchAppInstalledProvider

- (_TtC13SleepHealthUI25WatchAppInstalledProvider)init
{
  return (_TtC13SleepHealthUI25WatchAppInstalledProvider *)WatchAppInstalledProvider.init()();
}

- (void)dealloc
{
  _TtC13SleepHealthUI25WatchAppInstalledProvider *v3;
  _TtC13SleepHealthUI25WatchAppInstalledProvider *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13SleepHealthUI25WatchAppInstalledProvider_watchAppStateObserver))
  {
    v3 = self;
    swift_retain();
    sub_1A9CE6D80();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WatchAppInstalledProvider();
  -[WatchAppInstalledProvider dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI25WatchAppInstalledProvider__isWatchAppInstalled;
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB456F0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
