@implementation CLHawkeyeTask

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHawkeyeTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HawkeyeTask <%p>, Type:%@, id:%@"), self, sub_1014F7274(-[CLHawkeyeTask hawkeyeOpcode](self, "hawkeyeOpcode")), -[CLDurianTask uuid](self, "uuid"));
}

- (id)opcodeDescription
{
  return (id)sub_1014F7274(-[CLHawkeyeTask hawkeyeOpcode](self, "hawkeyeOpcode"));
}

- (BOOL)isConfigurationControlPointTask
{
  unsigned int v3;

  v3 = -[CBUUID isEqual:](self->_serviceUUID, "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
  if (v3)
    LOBYTE(v3) = -[CBUUID isEqual:](self->_characteristicUUID, "isEqual:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
  return v3;
}

- (BOOL)isNonOwnerControlPointTask
{
  unsigned int v3;

  v3 = -[CBUUID isEqual:](self->_serviceUUID, "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
  if (v3)
    LOBYTE(v3) = -[CBUUID isEqual:](self->_characteristicUUID, "isEqual:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
  return v3;
}

- (BOOL)isPairedOwnerInformationControlPointTask
{
  unsigned int v3;

  v3 = -[CBUUID isEqual:](self->_serviceUUID, "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
  if (v3)
    LOBYTE(v3) = -[CBUUID isEqual:](self->_characteristicUUID, "isEqual:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID"));
  return v3;
}

- (BOOL)isDebugControlPointTask
{
  unsigned int v3;

  v3 = -[CBUUID isEqual:](self->_serviceUUID, "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
  if (v3)
    LOBYTE(v3) = -[CBUUID isEqual:](self->_characteristicUUID, "isEqual:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID"));
  return v3;
}

- (BOOL)isPreciseFindingControlPointTask
{
  unsigned int v3;

  v3 = -[CBUUID isEqual:](self->_serviceUUID, "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
  if (v3)
    LOBYTE(v3) = -[CBUUID isEqual:](self->_characteristicUUID, "isEqual:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
  return v3;
}

- (CBUUID)serviceUUID
{
  return (CBUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setServiceUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CBUUID)characteristicUUID
{
  return (CBUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCharacteristicUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)hawkeyeOpcode
{
  return self->_hawkeyeOpcode;
}

- (void)setHawkeyeOpcode:(unsigned __int16)a3
{
  self->_hawkeyeOpcode = a3;
}

- (NSData)hawkeyePayload
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHawkeyePayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
