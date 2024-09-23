@implementation SAMicroblogObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)attachment
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("attachment"));
}

- (void)setAttachment:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("attachment"), a3);
}

- (NSString)content
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("content"));
}

- (void)setContent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("content"), a3);
}

- (NSDate)dateSent
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateSent"));
}

- (void)setDateSent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateSent"), a3);
}

- (NSDictionary)hashtagAlternatives
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashtagAlternatives"));
}

- (void)setHashtagAlternatives:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashtagAlternatives"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSNumber)outgoing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outgoing"));
}

- (void)setOutgoing:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outgoing"), a3);
}

- (NSArray)recipients
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recipients"), v3);
}

- (void)setRecipients:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recipients"), (uint64_t)a3);
}

- (NSURL)refereceId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("refereceId"));
}

- (void)setRefereceId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("refereceId"), a3);
}

- (SAPersonAttribute)sender
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("sender"));
}

- (void)setSender:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("sender"), a3);
}

- (NSString)serviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceType"));
}

- (void)setServiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceType"), a3);
}

- (NSDictionary)socialProfileReferences
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("socialProfileReferences"));
}

- (void)setSocialProfileReferences:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("socialProfileReferences"), a3);
}

- (NSNumber)useLocation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("useLocation"));
}

- (void)setUseLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("useLocation"), a3);
}

@end
