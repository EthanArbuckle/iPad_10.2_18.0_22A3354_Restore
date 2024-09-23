@implementation HAPCharacteristicWriteRequestTuple

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8
{
  return objc_msgSend(a1, "writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:contextData:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)writeRequestTupleForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 timedWrite:(BOOL)a6 responseValue:(BOOL)a7 type:(unint64_t)a8 contextData:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  HAPCharacteristicWriteRequestTuple *v18;
  HAPCharacteristicWriteRequestTuple *v19;

  v10 = a7;
  v11 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  v18 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  v19 = v18;
  if (v18)
  {
    -[HAPCharacteristicWriteRequestTuple setCharacteristic:](v18, "setCharacteristic:", v14);
    -[HAPCharacteristicWriteRequestTuple setValue:](v19, "setValue:", v15);
    -[HAPCharacteristicWriteRequestTuple setAuthorizationData:](v19, "setAuthorizationData:", v16);
    -[HAPCharacteristicWriteRequestTuple setTimedWrite:](v19, "setTimedWrite:", v11);
    -[HAPCharacteristicWriteRequestTuple setIncludeResponseValue:](v19, "setIncludeResponseValue:", v10);
    -[HAPCharacteristicWriteRequestTuple setWriteType:](v19, "setWriteType:", a8);
    -[HAPCharacteristicWriteRequestTuple setContextData:](v19, "setContextData:", v17);
  }

  return v19;
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

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setAuthorizationData:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationData, a3);
}

- (BOOL)timedWrite
{
  return self->_timedWrite;
}

- (void)setTimedWrite:(BOOL)a3
{
  self->_timedWrite = a3;
}

- (unint64_t)writeType
{
  return self->_writeType;
}

- (void)setWriteType:(unint64_t)a3
{
  self->_writeType = a3;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (void)setIncludeResponseValue:(BOOL)a3
{
  self->_includeResponseValue = a3;
}

- (NSNumber)enableEvents
{
  return self->_enableEvents;
}

- (void)setEnableEvents:(id)a3
{
  objc_storeStrong((id *)&self->_enableEvents, a3);
}

- (NSData)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_enableEvents, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end
