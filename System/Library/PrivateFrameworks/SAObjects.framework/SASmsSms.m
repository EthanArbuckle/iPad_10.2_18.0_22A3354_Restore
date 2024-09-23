@implementation SASmsSms

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("Sms");
}

+ (id)sms
{
  return objc_alloc_init((Class)a1);
}

- (SAAppInfo)appInfo
{
  return (SAAppInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appInfo"));
}

- (void)setAppInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appInfo"), a3);
}

- (NSURL)attachment
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("attachment"));
}

- (void)setAttachment:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("attachment"), a3);
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

- (NSString)chatIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("chatIdentifier"));
}

- (void)setChatIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("chatIdentifier"), a3);
}

- (NSDate)dateLastMessageReadInThread
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateLastMessageReadInThread"));
}

- (void)setDateLastMessageReadInThread:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateLastMessageReadInThread"), a3);
}

- (NSDate)dateReadingStarted
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateReadingStarted"));
}

- (void)setDateReadingStarted:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateReadingStarted"), a3);
}

- (NSDate)dateSent
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateSent"));
}

- (void)setDateSent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateSent"), a3);
}

- (NSString)effect
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("effect"));
}

- (void)setEffect:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("effect"), a3);
}

- (NSString)groupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupName"));
}

- (void)setGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupName"), a3);
}

- (NSString)groupNameId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupNameId"));
}

- (void)setGroupNameId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupNameId"), a3);
}

- (BOOL)hasGroupName
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hasGroupName"));
}

- (void)setHasGroupName:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hasGroupName"), a3);
}

- (NSNumber)isAudioMessage
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isAudioMessage"));
}

- (void)setIsAudioMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isAudioMessage"), a3);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
}

- (NSString)messageType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("messageType"));
}

- (void)setMessageType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("messageType"), a3);
}

- (NSArray)msgRecipients
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("msgRecipients"), v3);
}

- (void)setMsgRecipients:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("msgRecipients"), (uint64_t)a3);
}

- (SAPersonAttribute)msgSender
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("msgSender"));
}

- (void)setMsgSender:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("msgSender"), a3);
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
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recipients"));
}

- (void)setRecipients:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recipients"), a3);
}

- (SASmsSms)referencedMessage
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("referencedMessage"));
}

- (void)setReferencedMessage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("referencedMessage"), a3);
}

- (NSString)sender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sender"));
}

- (void)setSender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sender"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (NSString)timezoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timezoneId"));
}

- (void)setTimezoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timezoneId"), a3);
}

@end
