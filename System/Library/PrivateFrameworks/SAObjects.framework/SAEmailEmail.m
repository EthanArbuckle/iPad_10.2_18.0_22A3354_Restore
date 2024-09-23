@implementation SAEmailEmail

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("Email");
}

+ (id)email
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attachments
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("attachments"), v3);
}

- (void)setAttachments:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attachments"), (uint64_t)a3);
}

- (NSDate)dateSent
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateSent"));
}

- (void)setDateSent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateSent"), a3);
}

- (SAPersonAttribute)fromEmail
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("fromEmail"));
}

- (void)setFromEmail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("fromEmail"), a3);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
}

- (NSString)messagePreview
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("messagePreview"));
}

- (void)setMessagePreview:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("messagePreview"), a3);
}

- (NSNumber)outgoing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outgoing"));
}

- (void)setOutgoing:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outgoing"), a3);
}

- (NSArray)receivingAddresses
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("receivingAddresses"));
}

- (void)setReceivingAddresses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("receivingAddresses"), a3);
}

- (NSArray)recipientsBcc
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recipientsBcc"), v3);
}

- (void)setRecipientsBcc:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recipientsBcc"), (uint64_t)a3);
}

- (NSArray)recipientsCc
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recipientsCc"), v3);
}

- (void)setRecipientsCc:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recipientsCc"), (uint64_t)a3);
}

- (NSArray)recipientsTo
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recipientsTo"), v3);
}

- (void)setRecipientsTo:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recipientsTo"), (uint64_t)a3);
}

- (NSURL)referenceId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("referenceId"));
}

- (void)setReferenceId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("referenceId"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
