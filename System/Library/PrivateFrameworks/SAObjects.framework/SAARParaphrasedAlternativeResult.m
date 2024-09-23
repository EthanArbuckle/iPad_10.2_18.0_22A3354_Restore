@implementation SAARParaphrasedAlternativeResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alternatives");
}

- (id)encodedClassName
{
  return CFSTR("ParaphrasedAlternativeResult");
}

+ (id)paraphrasedAlternativeResult
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

- (NSString)paraphrasedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("paraphrasedIntent"));
}

- (void)setParaphrasedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("paraphrasedIntent"), a3);
}

@end
