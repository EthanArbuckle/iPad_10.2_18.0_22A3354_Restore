@implementation SARemembersGetAppMatchesForIntent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.remembers");
}

- (id)encodedClassName
{
  return CFSTR("GetAppMatchesForIntent");
}

+ (id)getAppMatchesForIntent
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)candidateBundleIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("candidateBundleIDs"));
}

- (void)setCandidateBundleIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("candidateBundleIDs"), a3);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (SAIntentGroupProtobufMessage)protoEncodedIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("protoEncodedIntent"));
}

- (void)setProtoEncodedIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("protoEncodedIntent"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
