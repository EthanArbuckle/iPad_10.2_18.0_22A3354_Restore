@implementation AADeviceRecord

- (NSString)bluetoothAddress
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig);
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig) = a3;
}

- (char)allowNoiseManagementOff
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff);
}

- (void)setAllowNoiseManagementOff:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff) = a3;
}

- (unsigned)declineDismissSkipConfig
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig);
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig) = a3;
}

- (char)headGestureMode
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode);
}

- (void)setHeadGestureMode:(char)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode) = a3;
}

- (NSString)description
{
  _TtC15audioaccessoryd14AADeviceRecord *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  AADeviceRecord.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  _TtC15audioaccessoryd14AADeviceRecord *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[AADeviceRecord description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (_TtC15audioaccessoryd14AADeviceRecord)initWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t ObjectType;
  uint64_t v14;

  v6 = type metadata accessor for UUID(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  UUID.init()(v9);
  v10 = objc_allocWithZone((Class)type metadata accessor for AADeviceRecord(0));
  v11 = sub_100107508((uint64_t)v8, 0, 0xC000000000000000, v9);
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return (_TtC15audioaccessoryd14AADeviceRecord *)v11;
}

- (_TtC15audioaccessoryd14AADeviceRecord)init
{
  _TtC15audioaccessoryd14AADeviceRecord *result;

  result = (_TtC15audioaccessoryd14AADeviceRecord *)_swift_stdlib_reportUnimplementedInitializer("audioaccessoryd.AADeviceRecord", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_1000A103C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata), *(_QWORD *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata]);
  v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_bluetoothAddress]);
  v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_lastModifiedDate;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
