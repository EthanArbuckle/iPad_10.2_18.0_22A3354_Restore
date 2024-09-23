@implementation SASmsSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)end
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("end"));
}

- (void)setEnd:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("end"), a3);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
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

- (NSArray)senders
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("senders"), v3);
}

- (void)setSenders:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("senders"), (uint64_t)a3);
}

- (SASmsGroupName)smsGroup
{
  return (SASmsGroupName *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("smsGroup"));
}

- (void)setSmsGroup:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("smsGroup"), a3);
}

- (NSDate)start
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("start"));
}

- (void)setStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("start"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (NSNumber)unread
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("unread"));
}

- (void)setUnread:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("unread"), a3);
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
