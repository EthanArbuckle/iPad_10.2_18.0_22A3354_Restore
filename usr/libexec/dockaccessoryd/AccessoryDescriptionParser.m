@implementation AccessoryDescriptionParser

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _TtC14dockaccessoryd26AccessoryDescriptionParser *v19;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v15;
  }
  if (a6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v16;
  }
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a7, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v18 = a3;
  v19 = self;
  sub_1001C31C4(v12, v14, v17);

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(v17);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  objc_class *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  id v15;
  _TtC14dockaccessoryd26AccessoryDescriptionParser *v16;

  v10 = (objc_class *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v13;
  }
  if (a6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v14;
  }
  v15 = a3;
  v16 = self;
  sub_1001C37C8(v15, v10, v12);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a6);
}

- (_TtC14dockaccessoryd26AccessoryDescriptionParser)init
{
  _TtC14dockaccessoryd26AccessoryDescriptionParser *result;

  result = (_TtC14dockaccessoryd26AccessoryDescriptionParser *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.AccessoryDescriptionParser", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_accessories));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentSystems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentSensors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentActuators));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentAttributes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentSensor));
  v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_identifier;
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_errorRelease(*(Class *)((char *)&self->super.isa
                              + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_error));

}

@end
