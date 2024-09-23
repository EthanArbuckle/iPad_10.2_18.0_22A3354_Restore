@implementation SNWiFiRecordInternal

- (int64_t)rssi
{
  return WiFiRecordRepresentation.rssi.getter();
}

- (int64_t)snr
{
  return WiFiRecordRepresentation.snr.getter();
}

- (int64_t)cca
{
  return WiFiRecordRepresentation.cca.getter();
}

- (NSString)channelInfo
{
  return (NSString *)@objc WiFiRecordRepresentation.channelInfo.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))WiFiRecordRepresentation.channelInfo.getter);
}

- (NSString)phyMode
{
  return (NSString *)@objc WiFiRecordRepresentation.channelInfo.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))WiFiRecordRepresentation.phyMode.getter);
}

- (BOOL)isCaptive
{
  return WiFiRecordRepresentation.isCaptive.getter() & 1;
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Class isa;
  uint64_t v8;

  v2 = type metadata accessor for Date();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  WiFiRecordRepresentation.timestamp.getter();
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)isa;
}

- (SNWiFiRecordInternal)initWithRssi:(int64_t)a3 snr:(int64_t)a4 cca:(int64_t)a5 channelInfo:(id)a6 phyMode:(id)a7 isCaptive:(BOOL)a8 timestamp:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _BOOL4 v23;

  v23 = a8;
  v12 = type metadata accessor for Date();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  return (SNWiFiRecordInternal *)WiFiRecordRepresentation.init(rssi:snr:cca:channelInfo:phyMode:isCaptive:timestamp:)(a3, a4, a5, v15, v17, v18, v20, v23, (uint64_t)v14);
}

- (SNWiFiRecordInternal)init
{
  WiFiRecordRepresentation.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SNWiFiRecordInternal_timestamp;
  v4 = OUTLINED_FUNCTION_3_21();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
