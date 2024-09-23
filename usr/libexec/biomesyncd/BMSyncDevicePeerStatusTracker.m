@implementation BMSyncDevicePeerStatusTracker

- (BMSyncDevicePeerStatusTracker)initWithDatabase:(id)a3
{
  id v5;
  BMSyncDevicePeerStatusTracker *v6;
  BMSyncDevicePeerStatusTracker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncDevicePeerStatusTracker;
  v6 = -[BMSyncDevicePeerStatusTracker init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

- (id)localDeviceIdentifierCreatingIfNecessary
{
  uint64_t v3;
  BMSyncDevicePeer *v4;
  BMSyncDevicePeer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase localDevice](self->_database, "localDevice"));
  if (v3)
  {
    v4 = (BMSyncDevicePeer *)v3;
  }
  else
  {
    v5 = [BMSyncDevicePeer alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncDevicePeerMetadata devicePeerMetadata](BMSyncDevicePeerMetadata, "devicePeerMetadata"));
    v4 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:](v5, "initWithDeviceIdentifier:metadata:protocolVersion:", v7, v8, 0);

    -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v4, 1);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer deviceIdentifier](v4, "deviceIdentifier"));

  return v9;
}

- (id)localDeviceUpdatingIfNeccesaryWithProtocolVersion:(unint64_t)a3
{
  BMSyncDevicePeer *v5;
  void *v6;
  void *v7;
  BMSyncDevicePeer *v8;
  void *v9;
  BMSyncDevicePeer *v10;
  BMSyncDevicePeer *v11;

  v5 = (BMSyncDevicePeer *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase localDevice](self->_database, "localDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer deviceIdentifier](v5, "deviceIdentifier"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  }
  v8 = [BMSyncDevicePeer alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncDevicePeerMetadata devicePeerMetadata](BMSyncDevicePeerMetadata, "devicePeerMetadata"));
  v10 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:](v8, "initWithDeviceIdentifier:metadata:protocolVersion:", v6, v9, a3);

  if (!-[BMSyncDevicePeer isEqual:](v5, "isEqual:", v10)
    && -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v10, 1))
  {
    v11 = v10;

    v5 = v11;
  }

  return v5;
}

- (BOOL)upsertSyncDevicePeer:(id)a3
{
  return -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", a3, 0);
}

- (id)deviceWithIdentifier:(id)a3
{
  return -[BMSyncDatabase deviceWithIdentifier:](self->_database, "deviceWithIdentifier:", a3);
}

- (id)lastSyncDateFromAnyDevice
{
  return -[BMSyncDatabase lastSyncDateFromAnyDevice](self->_database, "lastSyncDateFromAnyDevice");
}

- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3
{
  return -[BMSyncDatabase lastSyncDateOfDeviceWithIdentifier:](self->_database, "lastSyncDateOfDeviceWithIdentifier:", a3);
}

- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4
{
  uint64_t v6;
  NSObject *v7;

  if (a4)
    return -[BMSyncDatabase setLastSyncDate:forDeviceWithIdentifier:](self->_database, "setLastSyncDate:forDeviceWithIdentifier:", a3);
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_100044A6C((uint64_t)self, v7);

  return 0;
}

- (void)setLocalDeviceIdentifier:(id)a3
{
  id v4;
  BMSyncDevicePeer *v5;
  BMSyncDevicePeerMetadata *v6;

  v4 = a3;
  v6 = -[BMSyncDevicePeerMetadata initWithName:model:platform:]([BMSyncDevicePeerMetadata alloc], "initWithName:model:platform:", 0, &stru_100069AC0, 0);
  v5 = -[BMSyncDevicePeer initWithDeviceIdentifier:metadata:protocolVersion:]([BMSyncDevicePeer alloc], "initWithDeviceIdentifier:metadata:protocolVersion:", v4, v6, 0);

  -[BMSyncDatabase upsertSyncDevicePeer:isMe:](self->_database, "upsertSyncDevicePeer:isMe:", v5, 1);
}

- (id)allPeers
{
  return -[BMSyncDatabase allPeers](self->_database, "allPeers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
