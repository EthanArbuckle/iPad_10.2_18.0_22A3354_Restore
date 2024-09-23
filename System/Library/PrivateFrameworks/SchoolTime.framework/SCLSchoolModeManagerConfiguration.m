@implementation SCLSchoolModeManagerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  SCLSchoolModeManagerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(SCLSchoolModeManagerConfiguration);
  -[SCLSchoolModeManagerConfiguration deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeManagerConfiguration setDeviceRegistry:](v4, "setDeviceRegistry:", v5);

  -[SCLSchoolModeManagerConfiguration service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeManagerConfiguration setService:](v4, "setService:", v6);

  -[SCLSchoolModeManagerConfiguration setManagesSchoolTimeSession:](v4, "setManagesSchoolTimeSession:", -[SCLSchoolModeManagerConfiguration managesSchoolTimeSession](self, "managesSchoolTimeSession"));
  -[SCLSchoolModeManagerConfiguration setAllowsNonTinkerPairing:](v4, "setAllowsNonTinkerPairing:", -[SCLSchoolModeManagerConfiguration allowsNonTinkerPairing](self, "allowsNonTinkerPairing"));
  -[SCLSchoolModeManagerConfiguration workloop](self, "workloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeManagerConfiguration setWorkloop:](v4, "setWorkloop:", v7);

  return v4;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRegistry, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)managesSchoolTimeSession
{
  return self->_managesSchoolTimeSession;
}

- (void)setManagesSchoolTimeSession:(BOOL)a3
{
  self->_managesSchoolTimeSession = a3;
}

- (BOOL)allowsNonTinkerPairing
{
  return self->_allowsNonTinkerPairing;
}

- (void)setAllowsNonTinkerPairing:(BOOL)a3
{
  self->_allowsNonTinkerPairing = a3;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
}

@end
