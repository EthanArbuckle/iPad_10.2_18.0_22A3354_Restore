@implementation BMSyncDevicePeer

- (BMSyncDevicePeer)initWithFMResultSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  signed int v10;
  BMSyncDevicePeerMetadata *v11;
  BMSyncDevicePeer *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("device_identifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("ids_device_identifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("name")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("model")));
  v9 = (int)objc_msgSend(v4, "intForColumn:", CFSTR("platform"));
  v10 = objc_msgSend(v4, "intForColumn:", CFSTR("protocol_version"));

  v11 = -[BMSyncDevicePeerMetadata initWithName:model:platform:]([BMSyncDevicePeerMetadata alloc], "initWithName:model:platform:", v7, v8, v9);
  v12 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]([BMSyncDevicePeer alloc], "initWithDeviceIdentifier:metadata:protocolVersion:", v5, v11, v10);
  -[BMSyncDevicePeer setIdsDeviceIdentifier:](v12, "setIdsDeviceIdentifier:", v6);

  return v12;
}

- (BMSyncDevicePeer)initWithDeviceIdentifier:(id)a3 metadata:(id)a4 protocolVersion:(unint64_t)a5
{
  id v9;
  id v10;
  BMSyncDevicePeer *v11;
  BMSyncDevicePeer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSyncDevicePeer;
  v11 = -[BMSyncDevicePeer init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    v12->_protocolVersion = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString *deviceIdentifier;
  void *v9;
  BMSyncDevicePeerMetadata *metadata;
  void *v11;
  id protocolVersion;
  BOOL v13;

  v4 = a3;
  v6 = objc_opt_class(BMSyncDevicePeer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    deviceIdentifier = self->_deviceIdentifier;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceIdentifier"));
    if (-[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v9))
    {
      metadata = self->_metadata;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
      if (-[BMSyncDevicePeerMetadata isEqual:](metadata, "isEqual:", v11))
      {
        protocolVersion = (id)self->_protocolVersion;
        v13 = protocolVersion == objc_msgSend(v7, "protocolVersion");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  v4 = -[BMSyncDevicePeerMetadata hash](self->_metadata, "hash") ^ v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_protocolVersion));
  v6 = v4 ^ (unint64_t)objc_msgSend(v5, "hash");

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  void *v5;
  BMSyncDevicePeerMetadata *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMSyncDevicePeer *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIdentifier")));
  v6 = [BMSyncDevicePeerMetadata alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMetadata")));
  v8 = -[BMSyncDevicePeerMetadata initFromDictionary:](v6, "initFromDictionary:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocolVersion")));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:](self, "initWithDeviceIdentifier:metadata:protocolVersion:", v5, v8, v10);
  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v8[0] = self->_deviceIdentifier;
  v7[0] = CFSTR("deviceIdentifier");
  v7[1] = CFSTR("deviceMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerMetadata dictionaryRepresentation](self->_metadata, "dictionaryRepresentation"));
  v8[1] = v3;
  v7[2] = CFSTR("protocolVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_protocolVersion));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

  return v5;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BMSyncDevicePeerMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
