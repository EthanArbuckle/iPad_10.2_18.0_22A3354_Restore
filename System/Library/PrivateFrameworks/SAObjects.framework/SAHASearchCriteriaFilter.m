@implementation SAHASearchCriteriaFilter

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("SearchCriteriaFilter");
}

+ (id)searchCriteriaFilter
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)accessoryIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("accessoryIdentifier"));
}

- (void)setAccessoryIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("accessoryIdentifier"), a3);
}

- (NSString)accessoryName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accessoryName"));
}

- (void)setAccessoryName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accessoryName"), a3);
}

- (NSString)attribute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attribute"));
}

- (void)setAttribute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attribute"), a3);
}

- (NSString)entityType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("entityType"));
}

- (void)setEntityType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("entityType"), a3);
}

- (NSString)groupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupName"));
}

- (void)setGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupName"), a3);
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("homeIdentifier"));
}

- (void)setHomeIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("homeIdentifier"), a3);
}

- (NSString)homeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("homeName"));
}

- (void)setHomeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("homeName"), a3);
}

- (NSURL)roomIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("roomIdentifier"));
}

- (void)setRoomIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("roomIdentifier"), a3);
}

- (NSString)roomName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("roomName"));
}

- (void)setRoomName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("roomName"), a3);
}

- (NSURL)sceneIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("sceneIdentifier"));
}

- (void)setSceneIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("sceneIdentifier"), a3);
}

- (NSString)sceneName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sceneName"));
}

- (void)setSceneName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sceneName"), a3);
}

- (NSString)sceneType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sceneType"));
}

- (void)setSceneType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sceneType"), a3);
}

- (NSURL)serviceGroupIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("serviceGroupIdentifier"));
}

- (void)setServiceGroupIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("serviceGroupIdentifier"), a3);
}

- (NSURL)serviceIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("serviceIdentifier"));
}

- (void)setServiceIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("serviceIdentifier"), a3);
}

- (NSString)serviceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceName"));
}

- (void)setServiceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceName"), a3);
}

- (NSString)serviceSubType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceSubType"));
}

- (void)setServiceSubType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceSubType"), a3);
}

- (NSString)serviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceType"));
}

- (void)setServiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceType"), a3);
}

- (NSURL)zoneIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("zoneIdentifier"));
}

- (void)setZoneIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("zoneIdentifier"), a3);
}

- (NSString)zoneName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("zoneName"));
}

- (void)setZoneName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("zoneName"), a3);
}

@end
