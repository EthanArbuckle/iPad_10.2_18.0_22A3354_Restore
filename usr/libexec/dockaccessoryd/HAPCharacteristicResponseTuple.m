@implementation HAPCharacteristicResponseTuple

+ (id)responseTupleForCharacteristic:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  HAPCharacteristicResponseTuple *v7;
  HAPCharacteristicResponseTuple *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(HAPCharacteristicResponseTuple);
  v8 = v7;
  if (v7)
  {
    -[HAPCharacteristicResponseTuple setCharacteristic:](v7, "setCharacteristic:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    -[HAPCharacteristicResponseTuple setValue:](v8, "setValue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueUpdatedTime"));
    -[HAPCharacteristicResponseTuple setValueUpdatedTime:](v8, "setValueUpdatedTime:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateNumber"));
    -[HAPCharacteristicResponseTuple setStateNumber:](v8, "setStateNumber:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationContext"));
    -[HAPCharacteristicResponseTuple setNotificationContext:](v8, "setNotificationContext:", v12);

    -[HAPCharacteristicResponseTuple setError:](v8, "setError:", v6);
  }

  return v8;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_stateNumber, a3);
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (void)setValueUpdatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_valueUpdatedTime, a3);
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void)setNotificationContext:(id)a3
{
  objc_storeStrong((id *)&self->_notificationContext, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end
