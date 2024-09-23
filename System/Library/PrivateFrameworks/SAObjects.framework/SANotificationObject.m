@implementation SANotificationObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.notification");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (NSString)applicationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationId"));
}

- (void)setApplicationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationId"), a3);
}

- (NSDate)date
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("date"));
}

- (void)setDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("date"), a3);
}

- (NSNumber)dateIsAllDay
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dateIsAllDay"));
}

- (void)setDateIsAllDay:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dateIsAllDay"), a3);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (NSString)notificationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationId"));
}

- (void)setNotificationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationId"), a3);
}

- (NSNumber)previewRestricted
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previewRestricted"));
}

- (void)setPreviewRestricted:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previewRestricted"), a3);
}

- (NSString)priority
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("priority"));
}

- (void)setPriority:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("priority"), a3);
}

- (NSDate)recencyDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recencyDate"));
}

- (void)setRecencyDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recencyDate"), a3);
}

- (NSString)source
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("source"));
}

- (void)setSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("source"), a3);
}

- (NSString)threadIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("threadIdentifier"));
}

- (void)setThreadIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("threadIdentifier"), a3);
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
