@implementation FMAccessoryDiscoveryAccessoryCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy33FMAccessoryDiscoveryAccessoryCell *v9;
  Class isa;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  v11 = (objc_class *)type metadata accessor for FMAccessoryDiscoveryAccessoryCell();
  v14.receiver = v9;
  v14.super_class = v11;
  -[FMAccessoryDiscoveryAccessoryCell _bridgedUpdateConfigurationUsingState:](&v14, "_bridgedUpdateConfigurationUsingState:", isa);

  if ((UICellConfigurationState.isSelected.getter(v12) & 1) != 0)
    v13 = 3;
  else
    v13 = 0;
  -[FMAccessoryDiscoveryAccessoryCell setAccessoryType:](v9, "setAccessoryType:", v13);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC6FindMy33FMAccessoryDiscoveryAccessoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC6FindMy33FMAccessoryDiscoveryAccessoryCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAccessoryCell();
  v9 = -[FMAccessoryDiscoveryAccessoryCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC6FindMy33FMAccessoryDiscoveryAccessoryCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryAccessoryCell();
  return -[FMAccessoryDiscoveryAccessoryCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
