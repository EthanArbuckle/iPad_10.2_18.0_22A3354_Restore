@implementation SAPhoneIncomingCallSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("IncomingCallSearchResult");
}

+ (id)incomingCallSearchResult
{
  return objc_alloc_init((Class)a1);
}

- (SAPersonAttribute)caller
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("caller"));
}

- (void)setCaller:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("caller"), a3);
}

- (NSString)incomingCallType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("incomingCallType"));
}

- (void)setIncomingCallType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("incomingCallType"), a3);
}

@end
