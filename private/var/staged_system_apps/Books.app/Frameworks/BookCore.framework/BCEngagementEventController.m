@implementation BCEngagementEventController

- (BCEngagementEventDataProvider)dataProvider
{
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider);
  swift_beginAccess((char *)self + OBJC_IVAR___BCEngagementEventController_dataProvider, v4, 0, 0);
  return (BCEngagementEventDataProvider *)(id)swift_unknownObjectRetain(*v2);
}

- (void)setDataProvider:(id)a3
{
  id *v4;
  id v5;
  char v6[24];

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider);
  swift_beginAccess((char *)self + OBJC_IVAR___BCEngagementEventController_dataProvider, v6, 1, 0);
  v5 = *v4;
  *v4 = a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v5);
}

- (BCEngagementEventController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EngagementEventController();
  return -[BCEngagementEventController init](&v3, "init");
}

- (void)submitEvent:(id)a3 :(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BCEngagementEventController *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v9 = self;
  sub_198D10(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a4);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider));
}

@end
