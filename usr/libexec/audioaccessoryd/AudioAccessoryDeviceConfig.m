@implementation AudioAccessoryDeviceConfig

- (id)xpcObjectRepresentation
{
  xpc_object_t v3;
  void *v4;
  uint64_t autoANCStrength;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  autoANCStrength = self->_autoANCStrength;
  if ((_DWORD)autoANCStrength)
    xpc_dictionary_set_uint64(v3, "aaSt", autoANCStrength);
  if (self->_enableSiriMultitone)
    xpc_dictionary_set_uint64(v4, "esmt", self->_enableSiriMultitone);
  if (self->_enableHeartRateMonitor)
    xpc_dictionary_set_uint64(v4, "hrmt", self->_enableHeartRateMonitor);
  return v4;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (unsigned)enableSiriMultitone
{
  return self->_enableSiriMultitone;
}

- (void)setEnableSiriMultitone:(unsigned __int8)a3
{
  self->_enableSiriMultitone = a3;
}

- (unsigned)enableHeartRateMonitor
{
  return self->_enableHeartRateMonitor;
}

- (void)setEnableHeartRateMonitor:(unsigned __int8)a3
{
  self->_enableHeartRateMonitor = a3;
}

@end
