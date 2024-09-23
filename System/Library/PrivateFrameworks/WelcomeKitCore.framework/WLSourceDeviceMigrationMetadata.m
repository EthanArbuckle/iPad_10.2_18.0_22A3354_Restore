@implementation WLSourceDeviceMigrationMetadata

- (NSDate)communicationDate
{
  return self->_communicationDate;
}

- (void)setCommunicationDate:(id)a3
{
  objc_storeStrong((id *)&self->_communicationDate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (void)setCrashCount:(unint64_t)a3
{
  self->_crashCount = a3;
}

- (NSString)deviceOSVersion
{
  return self->_deviceOSVersion;
}

- (void)setDeviceOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOSVersion, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceOSVersion, 0);
  objc_storeStrong((id *)&self->_communicationDate, 0);
}

@end
