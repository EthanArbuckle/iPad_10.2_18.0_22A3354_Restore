@implementation OTDeviceInformation

- (id)initForContainerName:(id)a3 contextID:(id)a4 epoch:(unint64_t)a5 machineID:(id)a6 modelID:(id)a7 deviceName:(id)a8 serialNumber:(id)a9 osVersion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  OTDeviceInformation *v23;
  OTDeviceInformation *v24;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v26.receiver = self;
  v26.super_class = (Class)OTDeviceInformation;
  v23 = -[OTDeviceInformation init](&v26, "init");
  v24 = v23;
  if (v23)
  {
    -[OTDeviceInformation setContainerName:](v23, "setContainerName:", v16);
    -[OTDeviceInformation setContextID:](v24, "setContextID:", v17);
    -[OTDeviceInformation setEpoch:](v24, "setEpoch:", a5);
    -[OTDeviceInformation setMachineID:](v24, "setMachineID:", v18);
    -[OTDeviceInformation setModelID:](v24, "setModelID:", v19);
    -[OTDeviceInformation setDeviceName:](v24, "setDeviceName:", v20);
    -[OTDeviceInformation setSerialNumber:](v24, "setSerialNumber:", v21);
    -[OTDeviceInformation setOsVersion:](v24, "setOsVersion:", v22);
  }

  return v24;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMachineID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)modelID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModelID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

+ (BOOL)isFullPeer:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&off_10030B810, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&off_10030B810);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(&off_10030B810, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

@end
