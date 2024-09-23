@implementation OpenMailboxQuicklyItem

- (NSString)identifier
{
  _TtC10MobileMail22OpenMailboxQuicklyItem *v2;
  uint64_t v3;
  uint64_t v6;
  id v7;

  v2 = self;
  sub_100305E1C();
  v6 = v3;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (NSString)displayName
{
  _TtC10MobileMail22OpenMailboxQuicklyItem *v2;
  uint64_t v3;
  uint64_t v6;
  id v7;

  v2 = self;
  sub_100305ECC();
  v6 = v3;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (NSArray)pathComponents
{
  _TtC10MobileMail22OpenMailboxQuicklyItem *v2;
  uint64_t v5;
  Class isa;

  v2 = self;
  v5 = sub_100305F7C();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSArray *)isa;
}

- (BOOL)isEqual:(id)a3
{
  _TtC10MobileMail22OpenMailboxQuicklyItem *v3;
  char v5;
  _BYTE v8[32];
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v3 = self;
  if (a3)
  {
    _bridgeAnyObjectToAny(_:)();
    sub_1002225E4((uint64_t)v8, (uint64_t)v9);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  v5 = sub_100306E38((uint64_t)v9);
  sub_1001F2578(v9);

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (_TtC10MobileMail22OpenMailboxQuicklyItem)init
{
  return (_TtC10MobileMail22OpenMailboxQuicklyItem *)sub_100307100();
}

- (void).cxx_destruct
{
  sub_1001F0D3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail22OpenMailboxQuicklyItem_identifier);

  sub_1001F0D3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail22OpenMailboxQuicklyItem_displayName);
  sub_1001ED890((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10MobileMail22OpenMailboxQuicklyItem_pathComponents));
  sub_1001F0F44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10MobileMail22OpenMailboxQuicklyItem_tintColor));
}

@end
