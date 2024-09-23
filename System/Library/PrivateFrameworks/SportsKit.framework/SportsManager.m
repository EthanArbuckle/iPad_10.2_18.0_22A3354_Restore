@implementation SportsManager

- (_TtP9SportsKit21SportsManagerDelegate_)delegate
{
  return (_TtP9SportsKit21SportsManagerDelegate_ *)(id)sub_23030FDD8();
}

- (void)setDelegate:(id)a3
{
  _TtC9SportsKit13SportsManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23030FE64();

}

- (_TtC9SportsKit13SportsManager)init
{
  return (_TtC9SportsKit13SportsManager *)SportsManager.init()();
}

- (int64_t)activitiesCount
{
  _TtC9SportsKit13SportsManager *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_230312DB4();
  v4 = v3;

  return v4;
}

- (void)getEventForCanonicalId:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9SportsKit13SportsManager *v9;

  v5 = _Block_copy(a4);
  v6 = sub_23037A5C8();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_230312E30(v6, v8, (uint64_t)v9, v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_dataStore);
  OUTLINED_FUNCTION_78_2();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_xpcConnectionProvider);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_78_2();
  swift_bridgeObjectRelease();
  sub_230319F60((uint64_t)self + OBJC_IVAR____TtC9SportsKit13SportsManager_delegate);
  OUTLINED_FUNCTION_78_2();
  OUTLINED_FUNCTION_78_2();
  OUTLINED_FUNCTION_58_1();
}

@end
