@implementation _SVDMutableDeviceUnit

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCommunalDevice
{
  return self->_isCommunalDevice;
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->_isCommunalDevice = a3;
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
