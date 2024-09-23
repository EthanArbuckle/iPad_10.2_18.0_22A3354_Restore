@implementation MSDRapportDevice

- (MSDRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v4;
  MSDRapportDevice *v5;
  MSDRapportDevice *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDRapportDevice;
  v5 = -[MSDRapportDevice init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDRapportDevice setRpDevice:](v5, "setRpDevice:", v4);
    -[MSDRapportDevice setPairingMode:](v6, "setPairingMode:", ((unint64_t)objc_msgSend(v4, "statusFlags") >> 31) & 1);
    -[MSDRapportDevice setAuthenticated:](v6, "setAuthenticated:", ((unint64_t)objc_msgSend(v4, "statusFlags") >> 15) & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[MSDRapportDevice setDeviceName:](v6, "setDeviceName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
    if (v8)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicIdentifier"));
    v10 = (void *)v9;
    -[MSDRapportDevice setIdentifier:](v6, "setIdentifier:", v9);

    -[MSDRapportDevice setDroppedByRapport:](v6, "setDroppedByRapport:", 0);
  }

  return v6;
}

- (MSDRapportDevice)initWithIncomingOptions:(id)a3
{
  id v4;
  MSDRapportDevice *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Int64;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDRapportDevice;
  v5 = -[MSDRapportDevice init](&v13, "init");
  if (v5)
  {
    v6 = objc_alloc_init((Class)RPCompanionLinkDevice);
    v7 = RPOptionSenderIDSDeviceID;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
    objc_msgSend(v6, "setIdentifier:", v8);

    Int64 = CFDictionaryGetInt64(v4, RPOptionStatusFlags, 0);
    -[MSDRapportDevice setRpDevice:](v5, "setRpDevice:", v6);
    -[MSDRapportDevice setPairingMode:](v5, "setPairingMode:", (Int64 >> 31) & 1);
    -[MSDRapportDevice setAuthenticated:](v5, "setAuthenticated:", (Int64 >> 15) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderDeviceName")));
    -[MSDRapportDevice setDeviceName:](v5, "setDeviceName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
    -[MSDRapportDevice setIdentifier:](v5, "setIdentifier:", v11);

  }
  return v5;
}

- (BOOL)isEqualToRPCompanionLinkDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDevice identifier](self, "identifier"));
  if (v5)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicIdentifier"));
  v8 = (void *)v7;

  v9 = objc_msgSend(v6, "isEqualToString:", v8);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDevice identifier](self, "identifier"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDevice identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDevice identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDevice deviceName](self, "deviceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d>"), v5, self, v6, v7, -[MSDRapportDevice pairingMode](self, "pairingMode"), -[MSDRapportDevice authenticated](self, "authenticated")));

  return v8;
}

- (RPCompanionLinkDevice)rpDevice
{
  return self->_rpDevice;
}

- (void)setRpDevice:(id)a3
{
  objc_storeStrong((id *)&self->_rpDevice, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (BOOL)pairingMode
{
  return self->_pairingMode;
}

- (void)setPairingMode:(BOOL)a3
{
  self->_pairingMode = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)droppedByRapport
{
  return self->_droppedByRapport;
}

- (void)setDroppedByRapport:(BOOL)a3
{
  self->_droppedByRapport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rpDevice, 0);
}

@end
