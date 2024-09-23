@implementation FMAccessoryDiscoverySearchingCell

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCell *v10;
  NSString v11;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCell *v12;
  objc_super v14;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator;
  v9 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  if (v7)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for FMAccessoryDiscoverySearchingCell();
  v12 = -[FMAccessoryDiscoverySearchingCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, v11);

  return v12;
}

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCell *result;

  v5 = OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator;
  v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy33FMAccessoryDiscoverySearchingCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMAccessoryDiscoverySearchingCell.swift", 46, 2, 19, 0);
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy33FMAccessoryDiscoverySearchingCell *v9;
  Class isa;
  objc_class *v11;
  objc_super v12;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  v11 = (objc_class *)type metadata accessor for FMAccessoryDiscoverySearchingCell();
  v12.receiver = v9;
  v12.super_class = v11;
  -[FMAccessoryDiscoverySearchingCell _bridgedUpdateConfigurationUsingState:](&v12, "_bridgedUpdateConfigurationUsingState:", isa);

  sub_10010F5B8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator));
}

@end
