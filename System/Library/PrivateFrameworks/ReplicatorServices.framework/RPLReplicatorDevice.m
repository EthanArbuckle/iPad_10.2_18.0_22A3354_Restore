@implementation RPLReplicatorDevice

- (RPLReplicatorDevice)initWithDeviceID:(id)a3 relationshipID:(id)a4 name:(id)a5 deviceType:(unint64_t)a6 initialDiscoveryDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RPLReplicatorDevice *v16;
  uint64_t v17;
  NSUUID *deviceID;
  uint64_t v19;
  NSUUID *relationshipID;
  uint64_t v21;
  NSString *name;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RPLReplicatorDevice;
  v16 = -[RPLReplicatorDevice init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    deviceID = v16->_deviceID;
    v16->_deviceID = (NSUUID *)v17;

    v19 = objc_msgSend(v13, "copy");
    relationshipID = v16->_relationshipID;
    v16->_relationshipID = (NSUUID *)v19;

    v21 = objc_msgSend(v14, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v21;

    v16->_deviceType = a6;
    objc_storeStrong((id *)&v16->_initialDiscoveryDate, a7);
  }

  return v16;
}

- (id)description
{
  unint64_t deviceType;
  __CFString *v3;

  deviceType = self->_deviceType;
  if (deviceType > 5)
    v3 = 0;
  else
    v3 = off_251654E90[deviceType];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("id: %@; relationshipID: %@; name: %@; deviceType: %@; initialDiscoveryDate: %@"),
               self->_deviceID,
               self->_relationshipID,
               self->_name,
               v3,
               self->_initialDiscoveryDate);
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)initialDiscoveryDate
{
  return self->_initialDiscoveryDate;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
