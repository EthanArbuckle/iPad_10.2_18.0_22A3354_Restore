@implementation SNNetworkWiFiManager

- (SNNetworkWiFiManager)init
{
  SNNetworkWiFiManager *v2;
  uint64_t v3;
  SNNetworkWiFiManagerInternal *underlyingNetworkWiFiManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNNetworkWiFiManager;
  v2 = -[SNNetworkWiFiManager init](&v6, sel_init);
  if (v2)
  {
    +[SNNetworkWiFiManagerInternal shared](SNNetworkWiFiManagerInternal, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingNetworkWiFiManager = v2->_underlyingNetworkWiFiManager;
    v2->_underlyingNetworkWiFiManager = (SNNetworkWiFiManagerInternal *)v3;

  }
  return v2;
}

- (id)getWiFiRecord
{
  void *v2;
  SNWiFiRecord *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SNNetworkWiFiManagerInternal getWiFiRecordRepresentation](self->_underlyingNetworkWiFiManager, "getWiFiRecordRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(SNWiFiRecord);
    -[SNWiFiRecord setRssi:](v3, "setRssi:", objc_msgSend(v2, "rssi"));
    -[SNWiFiRecord setSnr:](v3, "setSnr:", objc_msgSend(v2, "snr"));
    -[SNWiFiRecord setCca:](v3, "setCca:", objc_msgSend(v2, "cca"));
    objc_msgSend(v2, "channelInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNWiFiRecord setChannelInfo:](v3, "setChannelInfo:", v4);

    objc_msgSend(v2, "phyMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNWiFiRecord setPhyMode:](v3, "setPhyMode:", v5);

    -[SNWiFiRecord setIsCaptive:](v3, "setIsCaptive:", objc_msgSend(v2, "isCaptive"));
    objc_msgSend(v2, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SNWiFiRecord setTimestamp:](v3, "setTimestamp:", v6);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isWiFiEnabled
{
  return -[SNNetworkWiFiManagerInternal isWiFiEnabled](self->_underlyingNetworkWiFiManager, "isWiFiEnabled");
}

- (SNNetworkWiFiManagerInternal)underlyingNetworkWiFiManager
{
  return self->_underlyingNetworkWiFiManager;
}

- (void)setUnderlyingNetworkWiFiManager:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingNetworkWiFiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNetworkWiFiManager, 0);
}

@end
