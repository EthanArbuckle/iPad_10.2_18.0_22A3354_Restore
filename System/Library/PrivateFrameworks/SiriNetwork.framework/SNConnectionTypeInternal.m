@implementation SNConnectionTypeInternal

- (id)init:(int64_t)a3
{
  return ConnectionTypeWrapper.init(_:)(a3);
}

- (int64_t)connectionTypeRawValue
{
  return ConnectionTypeWrapper.connectionTypeRawValue()();
}

- (id)connectionTypeStringRawValue
{
  uint64_t countAndFlagsBits;
  void *v3;

  countAndFlagsBits = ConnectionTypeWrapper.connectionTypeStringRawValue()()._countAndFlagsBits;
  v3 = (void *)MEMORY[0x24956D034](countAndFlagsBits);
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isWWAN
{
  return ConnectionTypeWrapper.isWWAN()();
}

- (BOOL)isEdge
{
  return ConnectionTypeWrapper.isEdge()();
}

- (BOOL)canUseWiFiDirectly
{
  return ConnectionTypeWrapper.canUseWiFiDirectly()();
}

- (int64_t)diagnosticConnectionType
{
  return ConnectionTypeWrapper.diagnosticConnectionType()();
}

- (unint64_t)aggregatorConnectionType
{
  return ConnectionTypeWrapper.aggregatorConnectionType()();
}

- (SNConnectionTypeInternal)init
{
  ConnectionTypeWrapper.init()();
}

@end
