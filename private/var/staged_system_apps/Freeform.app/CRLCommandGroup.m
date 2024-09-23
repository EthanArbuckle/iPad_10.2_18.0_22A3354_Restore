@implementation CRLCommandGroup

- (BOOL)committed
{
  _TtC8Freeform15CRLCommandGroup *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10074D27C();
  v4 = v3;

  return v4 & 1;
}

- (NSArray)commands
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for CRLCommand();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setCommands:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = type metadata accessor for CRLCommand();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (_TtC8Freeform15CRLCommandGroup)initWithCommands:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  uint64_t *v8;
  uint64_t v9;
  char v11[24];

  v5 = type metadata accessor for CRLCommand();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = -[CRLCommandGroup init](self, "init");
  v8 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess((char *)v7 + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands, v11, 1, 0);
  v9 = *v8;
  *v8 = v6;
  swift_bridgeObjectRelease(v9);
  return v7;
}

- (NSString)actionString
{
  _TtC8Freeform15CRLCommandGroup *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10074D0E8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setActionString:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString);
  v6 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (BOOL)supportsSimultaneousExecutionWithOtherCommands
{
  _TtC8Freeform15CRLCommandGroup *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10074D798();

  return v3;
}

- (BOOL)isEmpty
{
  _TtC8Freeform15CRLCommandGroup *v2;
  char v3;

  v2 = self;
  v3 = sub_10074D90C();

  return v3 & 1;
}

- (void)addCommandIfNotNil:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (a3)
  {
    v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
    swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands, v11, 33, 0);
    v6 = a3;
    v7 = self;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v7);
    v9 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v8 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v9 >= v8 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
    v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v6);
    specialized Array._endMutation()(v10);
    swift_endAccess(v11);

  }
}

- (void)addCommand:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands, v11, 33, 0);
  v6 = a3;
  v7 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v7);
  v9 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v9 >= v8 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
  v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v6);
  specialized Array._endMutation()(v10);
  swift_endAccess(v11);

}

- (void)addCommands:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform15CRLCommandGroup *v7;
  uint64_t v8;
  _BYTE v9[24];

  v5 = type metadata accessor for CRLCommand();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands, v9, 33, 0);
  v7 = self;
  swift_bridgeObjectRetain(v6);
  sub_10061FCEC(v8);
  swift_endAccess(v9);

  swift_bridgeObjectRelease(v6);
}

- (_TtC8Freeform15CRLCommandGroup)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands) = (Class)_swiftEmptyArrayStorage;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString);
  v4 = (objc_class *)type metadata accessor for CRLCommandGroup();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CRLCommand init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform15CRLCommandGroup_commands));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform15CRLCommandGroup__actionString]);
}

@end
