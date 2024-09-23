@implementation SeymourNotificationResponseCoordinator

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)initWithFitnessAppContext:(id)a3
{
  return (_TtC10FitnessApp38SeymourNotificationResponseCoordinator *)sub_100009F5C((char *)a3);
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC10FitnessApp38SeymourNotificationResponseCoordinator *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1004A7E4C(v7, v8, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)init
{
  _TtC10FitnessApp38SeymourNotificationResponseCoordinator *result;

  result = (_TtC10FitnessApp38SeymourNotificationResponseCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.SeymourNotificationResponseCoordinator", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp38SeymourNotificationResponseCoordinator_amsBag));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp38SeymourNotificationResponseCoordinator_eventHub));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp38SeymourNotificationResponseCoordinator_urlNavigator));
}

@end
