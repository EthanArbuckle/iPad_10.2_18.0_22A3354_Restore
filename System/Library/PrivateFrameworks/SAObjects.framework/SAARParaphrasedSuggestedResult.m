@implementation SAARParaphrasedSuggestedResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alternatives");
}

- (id)encodedClassName
{
  return CFSTR("ParaphrasedSuggestedResult");
}

+ (id)paraphrasedSuggestedResult
{
  return objc_alloc_init((Class)a1);
}

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("command"));
}

- (void)setCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("command"), a3);
}

- (NSString)displayText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayText"));
}

- (void)setDisplayText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayText"), a3);
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("rank"));
}

- (void)setRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("rank"), a3);
}

@end
