@implementation TVRMSBeginPairingMessage

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasPasscode
{
  return self->_passcode != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVRMSBeginPairingMessage;
  -[TVRMSBeginPairingMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSBeginPairingMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appName;
  NSString *deviceName;
  NSString *deviceModel;
  NSString *passcode;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appName = self->_appName;
  if (appName)
    objc_msgSend(v3, "setObject:forKey:", appName, CFSTR("appName"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v4, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  passcode = self->_passcode;
  if (passcode)
    objc_msgSend(v4, "setObject:forKey:", passcode, CFSTR("passcode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSBeginPairingMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_appName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_passcode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_appName)
  {
    objc_msgSend(v4, "setAppName:");
    v4 = v5;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v5, "setDeviceName:");
    v4 = v5;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v5, "setDeviceModel:");
    v4 = v5;
  }
  if (self->_passcode)
  {
    objc_msgSend(v5, "setPasscode:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_passcode, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *appName;
  NSString *deviceName;
  NSString *deviceModel;
  NSString *passcode;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((appName = self->_appName, !((unint64_t)appName | v4[1]))
     || -[NSString isEqual:](appName, "isEqual:"))
    && ((deviceName = self->_deviceName, !((unint64_t)deviceName | v4[3]))
     || -[NSString isEqual:](deviceName, "isEqual:"))
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[2]))
     || -[NSString isEqual:](deviceModel, "isEqual:")))
  {
    passcode = self->_passcode;
    if ((unint64_t)passcode | v4[4])
      v9 = -[NSString isEqual:](passcode, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_appName, "hash");
  v4 = -[NSString hash](self->_deviceName, "hash") ^ v3;
  v5 = -[NSString hash](self->_deviceModel, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_passcode, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[TVRMSBeginPairingMessage setAppName:](self, "setAppName:");
  if (v4[3])
    -[TVRMSBeginPairingMessage setDeviceName:](self, "setDeviceName:");
  if (v4[2])
    -[TVRMSBeginPairingMessage setDeviceModel:](self, "setDeviceModel:");
  if (v4[4])
    -[TVRMSBeginPairingMessage setPasscode:](self, "setPasscode:");

}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
