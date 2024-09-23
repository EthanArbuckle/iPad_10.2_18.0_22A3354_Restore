@implementation SAUIAudioDescription

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AudioDescription");
}

+ (id)audioDescription
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)bitsPerChannel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bitsPerChannel"));
}

- (void)setBitsPerChannel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bitsPerChannel"), a3);
}

- (NSNumber)bytesPerFrame
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bytesPerFrame"));
}

- (void)setBytesPerFrame:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bytesPerFrame"), a3);
}

- (NSNumber)bytesPerPacket
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bytesPerPacket"));
}

- (void)setBytesPerPacket:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bytesPerPacket"), a3);
}

- (NSNumber)channelsPerFrame
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("channelsPerFrame"));
}

- (void)setChannelsPerFrame:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("channelsPerFrame"), a3);
}

- (NSString)format
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("format"));
}

- (void)setFormat:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("format"), a3);
}

- (NSNumber)formatFlags
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("formatFlags"));
}

- (void)setFormatFlags:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("formatFlags"), a3);
}

- (NSNumber)formatID
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("formatID"));
}

- (void)setFormatID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("formatID"), a3);
}

- (NSNumber)framesPerPacket
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("framesPerPacket"));
}

- (void)setFramesPerPacket:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("framesPerPacket"), a3);
}

- (NSNumber)reserved
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reserved"));
}

- (void)setReserved:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reserved"), a3);
}

- (NSNumber)sampleRate
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sampleRate"));
}

- (void)setSampleRate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sampleRate"), a3);
}

@end
