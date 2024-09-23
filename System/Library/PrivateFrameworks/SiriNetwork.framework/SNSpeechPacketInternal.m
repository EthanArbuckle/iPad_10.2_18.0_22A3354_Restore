@implementation SNSpeechPacketInternal

- (NSString)internalAceId
{
  return (NSString *)@objc SpeechPacket.internalAceId.getter((uint64_t)self, (uint64_t)a2, SpeechPacket.internalAceId.getter);
}

- (void)setInternalAceId:(id)a3
{
  @objc SpeechPacket.internalAceId.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))SpeechPacket.internalAceId.setter);
}

- (NSString)internalRefId
{
  return (NSString *)@objc SpeechPacket.internalAceId.getter((uint64_t)self, (uint64_t)a2, SpeechPacket.internalRefId.getter);
}

- (void)setInternalRefId:(id)a3
{
  @objc SpeechPacket.internalAceId.setter(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))SpeechPacket.internalRefId.setter);
}

- (NSArray)packets
{
  Class isa;

  SpeechPacket.packets.getter();
  type metadata accessor for NSData();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setPackets:(id)a3
{
  uint64_t v4;
  SNSpeechPacketInternal *v5;

  type metadata accessor for NSData();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  SpeechPacket.packets.setter(v4);

}

- (int64_t)packetNumber
{
  int64_t result;

  SpeechPacket.packetNumber.getter();
  return result;
}

- (void)setPacketNumber:(int64_t)a3
{
  SpeechPacket.packetNumber.setter(a3);
}

- (SNSpeechPacketInternal)init
{
  return (SNSpeechPacketInternal *)SpeechPacket.init()();
}

- (id)serializedAceDataAndReturnError:(id *)a3
{
  SNSpeechPacketInternal *v3;
  void *v4;

  v3 = self;
  v4 = (void *)SpeechPacket.serializedAceData()();

  return v4;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)isRetryable
{
  return 1;
}

- (BOOL)isRestartable
{
  return 0;
}

- (BOOL)isProvisional
{
  return 0;
}

- (id)sessionRequestId
{
  return 0;
}

- (void)setSessionRequestId:(id)a3
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
