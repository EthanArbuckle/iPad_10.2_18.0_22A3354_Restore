@implementation RCPRecorderConfig

- (NSArray)deviceUsagePageArray
{
  return self->_deviceUsagePageArray;
}

- (void)setDeviceUsagePageArray:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUsagePageArray, a3);
}

- (double)maxStreamDuration
{
  return self->_maxStreamDuration;
}

- (void)setMaxStreamDuration:(double)a3
{
  self->_maxStreamDuration = a3;
}

- (BOOL)ignoreSenderProperties
{
  return self->_ignoreSenderProperties;
}

- (void)setIgnoreSenderProperties:(BOOL)a3
{
  self->_ignoreSenderProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUsagePageArray, 0);
}

@end
