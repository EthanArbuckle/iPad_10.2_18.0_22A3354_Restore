@implementation UpdateTabItemsEventMonitorController

- (void)appDocumentDidReceiveEvent:(id)a3
{
  id v4;
  _TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9A43AEC(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)appDocumentHasBecomeActive
{
  _TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController *v2;

  v2 = self;
  sub_1D9A43DBC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController)init
{
  sub_1D9A446A4();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController_registrationHandler));
  swift_bridgeObjectRelease();
  sub_1D970F43C((uint64_t)self+ OBJC_IVAR____TtC8VideosUIP33_A69B2854CB390679C506AD8487E2C37E36UpdateTabItemsEventMonitorController_lastRefreshOrRegistrationTime, (uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_2_1();
}

@end
