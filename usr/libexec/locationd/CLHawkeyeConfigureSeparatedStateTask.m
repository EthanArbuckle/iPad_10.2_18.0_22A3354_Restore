@implementation CLHawkeyeConfigureSeparatedStateTask

- (CLHawkeyeConfigureSeparatedStateTask)initWithConfiguration:(id)a3 currentIndex:(unsigned int)a4
{
  uint64_t v4;
  CLHawkeyeConfigureSeparatedStateTask *v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  objc_super v11;
  _BYTE v12[3];
  unsigned int v13;
  unsigned int v14;

  v4 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)CLHawkeyeConfigureSeparatedStateTask;
  v6 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:](&v11, "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 208, 0), -6, 0, 0, 0);
  if (v6)
  {
    objc_msgSend(objc_msgSend(a3, "desiredKeyRollDate"), "timeIntervalSinceDate:", +[NSDate date](NSDate, "date"));
    v8 = (v7 * 1000.0);
    v9 = objc_msgSend(a3, "nextWildIndex");
    -[CLHawkeyeConfigureSeparatedStateTask setCurrentIndex:](v6, "setCurrentIndex:", v4);
    -[CLHawkeyeTask setServiceUUID:](v6, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    -[CLHawkeyeTask setCharacteristicUUID:](v6, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    -[CLHawkeyeTask setHawkeyeOpcode:](v6, "setHawkeyeOpcode:", 517);
    v12[0] = 1;
    v12[1] = -[CLHawkeyeTask hawkeyeOpcode](v6, "hawkeyeOpcode");
    v12[2] = -[CLHawkeyeTask hawkeyeOpcode](v6, "hawkeyeOpcode") >> 8;
    v13 = v8;
    v14 = v9;
    -[CLHawkeyeTask setHawkeyePayload:](v6, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 11));
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHawkeyeConfigureSeparatedStateTask;
  -[CLHawkeyeTask dealloc](&v3, "dealloc");
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (unsigned)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unsigned int)a3
{
  self->_currentIndex = a3;
}

@end
