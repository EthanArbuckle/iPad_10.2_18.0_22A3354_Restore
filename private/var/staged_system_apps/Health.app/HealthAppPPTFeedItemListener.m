@implementation HealthAppPPTFeedItemListener

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _TtC6Health28HealthAppPPTFeedItemListener *v5;

  v4 = a3;
  v5 = self;
  sub_10003F098(v4);

}

- (_TtC6Health28HealthAppPPTFeedItemListener)init
{
  _TtC6Health28HealthAppPPTFeedItemListener *result;

  result = (_TtC6Health28HealthAppPPTFeedItemListener *)_swift_stdlib_reportUnimplementedInitializer("Health.HealthAppPPTFeedItemListener", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->context[OBJC_IVAR____TtC6Health28HealthAppPPTFeedItemListener_changesMade]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6Health28HealthAppPPTFeedItemListener_fetchedResultsController));
}

@end
