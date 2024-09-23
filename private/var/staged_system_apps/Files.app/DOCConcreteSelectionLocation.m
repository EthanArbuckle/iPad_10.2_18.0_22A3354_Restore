@implementation DOCConcreteSelectionLocation

- (_TtC5Files28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 node:(id)a4
{
  objc_super v7;

  *(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return -[DOCConcreteSelectionLocation initWithSourceIdentifier:node:](&v7, "initWithSourceIdentifier:node:", a3, a4);
}

- (_TtC5Files28DOCConcreteSelectionLocation)initWithSourceIdentifier:(id)a3 title:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  _TtC5Files28DOCConcreteSelectionLocation *v10;
  objc_super v12;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  *(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v8 = a3;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  v10 = -[DOCConcreteSelectionLocation initWithSourceIdentifier:title:](&v12, "initWithSourceIdentifier:title:", v8, v9);

  return v10;
}

- (_TtC5Files28DOCConcreteSelectionLocation)initWithTaggedItemsSourceRepresentedTag:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return -[DOCConcreteSelectionLocation initWithTaggedItemsSourceRepresentedTag:](&v5, "initWithTaggedItemsSourceRepresentedTag:", a3);
}

- (_TtC5Files28DOCConcreteSelectionLocation)init
{
  objc_super v3;

  *(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return -[DOCConcreteSelectionLocation init](&v3, "init");
}

- (_TtC5Files28DOCConcreteSelectionLocation)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes] = _swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCConcreteSelectionLocation();
  return -[DOCConcreteSelectionLocation initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->DOCConcreteLocation_opaque[OBJC_IVAR____TtC5Files28DOCConcreteSelectionLocation_selectedNodes]);
}

@end
