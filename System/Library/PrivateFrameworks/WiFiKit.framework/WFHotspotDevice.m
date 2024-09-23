@implementation WFHotspotDevice

- (WFHotspotDevice)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFHotspotDevice init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (WFHotspotDevice)initWithHotspotDevice:(id)a3
{
  id v5;
  WFHotspotDevice *v6;
  WFHotspotDevice *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  WFHotspotDevice *ssid;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFHotspotDevice;
  v6 = -[WFHotspotDevice init](&v13, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_hotspotDevice, a3);
    -[SFRemoteHotspotDevice deviceName](v7->_hotspotDevice, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x21)
    {
      objc_msgSend(v8, "substringWithRange:", 0, 32);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = objc_msgSend(v8, "copy");
    ssid = (WFHotspotDevice *)v7->_ssid;
    v7->_ssid = (NSString *)v10;
  }
  else
  {
    ssid = v6;
    v7 = 0;
  }

  return v7;
}

- (int64_t)securityMode
{
  return 8;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[WFHotspotDevice _isEqualToHotspotDevice:](self, "_isEqualToHotspotDevice:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[WFHotspotDevice _isEqualToNetwork:](self, "_isEqualToNetwork:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)_isEqualToHotspotDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[WFHotspotDevice ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hotspotDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v10))
    {
      -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "signalStrength");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v19, "integerValue");
      objc_msgSend(v4, "hotspotDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "signalStrength");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v12, "integerValue"))
      {
        -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "networkType");
        objc_msgSend(v4, "hotspotDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13 == objc_msgSend(v14, "networkType");

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_isEqualToNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  char v8;
  BOOL v9;

  v4 = a3;
  -[WFHotspotDevice ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
  {

    goto LABEL_7;
  }
  v7 = -[WFHotspotDevice securityMode](self, "securityMode");
  if (v7 != objc_msgSend(v4, "securityMode"))
  {
    v8 = objc_msgSend(v4, "iOSHotspot");

    if ((v8 & 1) != 0)
      goto LABEL_6;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }

LABEL_6:
  v9 = 1;
LABEL_8:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[WFHotspotDevice securityMode](self, "securityMode") ^ v5;
  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalStrength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ objc_msgSend(v8, "integerValue");
  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "networkType");

  return v11;
}

- (SFRemoteHotspotDevice)hotspotDevice
{
  return self->_hotspotDevice;
}

- (void)setHotspotDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotDevice, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_hotspotDevice, 0);
}

- (BOOL)isHotspot20
{
  return 0;
}

- (id)title
{
  void *v2;
  void *v3;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (int64_t)rssi
{
  return 0;
}

- (float)scaledRSSI
{
  return 1.0;
}

- (BOOL)isSecure
{
  return 1;
}

- (BOOL)iOSHotspot
{
  return 1;
}

- (BOOL)isInstantHotspot
{
  return 1;
}

- (BOOL)isUnconfiguredAccessory
{
  return 0;
}

- (id)hotspotBatteryLife
{
  void *v2;
  void *v3;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batteryLife");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hotspotSignalStrength
{
  void *v2;
  void *v3;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signalStrength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hotspotCellularProtocol
{
  void *v2;
  void *v3;

  -[WFHotspotDevice hotspotDevice](self, "hotspotDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellularProtocolString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtitle
{
  return 0;
}

- (BOOL)canBeDisplayedAsCurrent
{
  return 1;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (unint64_t)signalBars
{
  -[WFHotspotDevice scaledRSSI](self, "scaledRSSI");
  return WFSignalBarsFromScaledRSSI();
}

- (BOOL)prominentDisplay
{
  return 1;
}

- (BOOL)isPopular
{
  return 0;
}

- (BOOL)isKnown
{
  return 0;
}

- (BOOL)isEquivalentRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WFHotspotDevice ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[WFHotspotDevice uniqueIdentifier](self, "uniqueIdentifier");
      v9 = v8 == objc_msgSend(v5, "uniqueIdentifier");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastJoinedDate
{
  return 0;
}

- (BOOL)shouldShowInMyNetworkList
{
  return 1;
}

- (BOOL)shouldShowInKnownNetworkList
{
  return 0;
}

@end
