@implementation SATTSSpeechSynthesisWordTimingInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisWordTimingInfo");
}

+ (id)speechSynthesisWordTimingInfo
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)length
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("length"));
}

- (void)setLength:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("length"), a3);
}

- (int64_t)offset
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("offset"));
}

- (void)setOffset:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("offset"), a3);
}

- (NSNumber)sampleIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sampleIndex"));
}

- (void)setSampleIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sampleIndex"), a3);
}

- (float)timestamp
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("timestamp"));
}

- (void)setTimestamp:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("timestamp"), a3);
}

- (NSString)word
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("word"));
}

- (void)setWord:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("word"), a3);
}

@end
