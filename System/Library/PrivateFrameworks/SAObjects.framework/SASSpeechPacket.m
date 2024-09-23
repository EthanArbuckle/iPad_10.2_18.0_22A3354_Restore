@implementation SASSpeechPacket

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechPacket");
}

+ (id)speechPacket
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)packetNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("packetNumber"));
}

- (void)setPacketNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("packetNumber"), a3);
}

- (NSArray)packets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("packets"));
}

- (void)setPackets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("packets"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
