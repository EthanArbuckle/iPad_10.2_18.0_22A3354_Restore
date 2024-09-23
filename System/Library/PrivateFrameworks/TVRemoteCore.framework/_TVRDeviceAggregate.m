@implementation _TVRDeviceAggregate

- (BOOL)isEmpty
{
  return !self->_homeKit && !self->_rapport && self->_remoteMediaService == 0;
}

- (id)bestImpl
{
  __objc2_class *v2;
  void *v3;

  if (self->_rapport)
  {
    v2 = TVRCRapportDeviceImpl;
  }
  else
  {
    if (self->_homeKit)
    {
      +[TVRCMatchPointDeviceImpl implWithService:](TVRCMatchPointDeviceImpl, "implWithService:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (!self->_remoteMediaService)
      return 0;
    v2 = _TVRCRMSDeviceImpl;
  }
  -[__objc2_class implWithDevice:](v2, "implWithDevice:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (TVRCRPCompanionLinkClientWrapper)rapport
{
  return self->_rapport;
}

- (void)setRapport:(id)a3
{
  objc_storeStrong((id *)&self->_rapport, a3);
}

- (_TVRCRMSDeviceWrapper)remoteMediaService
{
  return self->_remoteMediaService;
}

- (void)setRemoteMediaService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMediaService, a3);
}

- (TVRCHMServiceWrapper)homeKit
{
  return self->_homeKit;
}

- (void)setHomeKit:(id)a3
{
  objc_storeStrong((id *)&self->_homeKit, a3);
}

- (TVRXDevice)publicDevice
{
  return self->_publicDevice;
}

- (void)setPublicDevice:(id)a3
{
  objc_storeStrong((id *)&self->_publicDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicDevice, 0);
  objc_storeStrong((id *)&self->_homeKit, 0);
  objc_storeStrong((id *)&self->_remoteMediaService, 0);
  objc_storeStrong((id *)&self->_rapport, 0);
}

@end
