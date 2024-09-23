@implementation TestDevice

- (_TtC12SidecarRelay10TestDevice)init
{
  return (_TtC12SidecarRelay10TestDevice *)sub_100050B90();
}

- (_TtC12SidecarRelay10TestDevice)initWithCoder:(id)a3
{
  sub_100050C5C();
}

- (NSString)description
{
  return (NSString *)sub_100051C88(self, (uint64_t)a2, sub_100050CCC);
}

- (NSString)identifier
{
  _TtC12SidecarRelay10TestDevice *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100050DE8((uint64_t)v2);
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC12SidecarRelay10TestDevice *v6;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_100050E5C((uint64_t)v6, v5);

}

- (NSString)idsDeviceIdentifier
{
  return (NSString *)sub_100051C88(self, (uint64_t)a2, (void (*)(void))sub_100050DE8);
}

- (NSString)model
{
  _TtC12SidecarRelay10TestDevice *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100050ED0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)name
{
  NSString v2;

  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE900000000000074);
  return (NSString *)v2;
}

- (unint64_t)statusFlags
{
  return 4;
}

- (_TtC12SidecarRelay10TestDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    if (!a5)
    {
LABEL_3:
      if (!a6)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  if (!a6)
LABEL_4:
    sub_100050F60();
LABEL_7:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  sub_100050F60();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12SidecarRelay10TestDevice_uuid;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
