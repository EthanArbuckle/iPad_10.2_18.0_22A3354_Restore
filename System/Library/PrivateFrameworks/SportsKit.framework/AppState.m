@implementation AppState

- (_TtC9SportsKit8AppState)init
{
  return (_TtC9SportsKit8AppState *)sub_230372200();
}

- (void)dealloc
{
  _TtC9SportsKit8AppState *v2;

  v2 = self;
  sub_2303723A4();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9SportsKit8AppState__state;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A2F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)applicationWillTerminate
{
  _TtC9SportsKit8AppState *v2;

  v2 = self;
  sub_230372544("AppState - applicationWillTerminate");

}

- (void)applicationDidEnterBackgroundNotification
{
  _TtC9SportsKit8AppState *v2;

  v2 = self;
  sub_230372544("AppState - applicationDidEnterBackgroundNotification");

}

- (void)applicationWillEnterForegroundNotification
{
  _TtC9SportsKit8AppState *v2;

  v2 = self;
  sub_230372544("AppState - applicationWillEnterForegroundNotification");

}

@end
