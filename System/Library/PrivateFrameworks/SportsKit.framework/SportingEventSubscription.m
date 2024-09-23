@implementation SportingEventSubscription

- (_TtC9SportsKit25SportingEventSubscription)init
{
  SportingEventSubscription.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  v3 = (char *)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_updatedAt;
  v4 = OUTLINED_FUNCTION_43_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_2302ED664((uint64_t)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_metadata, &qword_25405B030);
  OUTLINED_FUNCTION_65_0((uint64_t)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_eventStateURL);
  OUTLINED_FUNCTION_65_0((uint64_t)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_fullPayloadBaseURL);
  OUTLINED_FUNCTION_65_0((uint64_t)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_imageServiceBaseURL);
  v5 = OUTLINED_FUNCTION_164((uint64_t)self + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_view);
  sub_2302E5A10(v5, v6, v7, v8, v9, v10, v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_23_1();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails));

}

@end
