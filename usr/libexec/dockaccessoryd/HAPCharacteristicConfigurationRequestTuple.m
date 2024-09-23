@implementation HAPCharacteristicConfigurationRequestTuple

+ (id)configurationTupleForCharacteristic:(id)a3 broadcastEnable:(BOOL)a4 broadcastInterval:(unint64_t)a5
{
  _BOOL8 v6;
  id v7;
  HAPCharacteristicConfigurationRequestTuple *v8;
  HAPCharacteristicConfigurationRequestTuple *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HAPCharacteristicConfigurationRequestTuple);
  v9 = v8;
  if (v8)
  {
    -[HAPCharacteristicConfigurationRequestTuple setCharacteristic:](v8, "setCharacteristic:", v7);
    -[HAPCharacteristicConfigurationRequestTuple setBroadcastEnable:](v9, "setBroadcastEnable:", v6);
    -[HAPCharacteristicConfigurationRequestTuple setBroadcastInterval:](v9, "setBroadcastInterval:", a5);
  }

  return v9;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (BOOL)broadcastEnable
{
  return self->_broadcastEnable;
}

- (void)setBroadcastEnable:(BOOL)a3
{
  self->_broadcastEnable = a3;
}

- (unint64_t)broadcastInterval
{
  return self->_broadcastInterval;
}

- (void)setBroadcastInterval:(unint64_t)a3
{
  self->_broadcastInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end
