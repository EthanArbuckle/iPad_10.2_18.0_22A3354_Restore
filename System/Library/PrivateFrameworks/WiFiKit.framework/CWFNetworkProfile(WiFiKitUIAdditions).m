@implementation CWFNetworkProfile(WiFiKitUIAdditions)

- (uint64_t)canBeDisplayedAsCurrent
{
  return 0;
}

- (uint64_t)hotspotBatteryLife
{
  return 0;
}

- (uint64_t)hotspotCellularProtocol
{
  return 0;
}

- (uint64_t)hotspotSignalStrength
{
  return 0;
}

- (uint64_t)isAdhoc
{
  return 0;
}

- (uint64_t)isEnterprise
{
  if ((objc_msgSend(a1, "isEAP") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isPSK");
}

- (BOOL)isEquivalentRecord:()WiFiKitUIAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "networkName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = objc_msgSend(a1, "uniqueIdentifier");
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

- (uint64_t)isInstantHotspot
{
  return 0;
}

- (uint64_t)isKnown
{
  return 1;
}

- (uint64_t)isPopular
{
  return 0;
}

- (uint64_t)isSecure
{
  return objc_msgSend(a1, "isOpen") ^ 1;
}

- (uint64_t)isUnconfiguredAccessory
{
  return 0;
}

- (uint64_t)prominentDisplay
{
  return 0;
}

- (uint64_t)rssi
{
  return 0;
}

- (float)scaledRSSI
{
  return 1.0;
}

- (uint64_t)signalBars
{
  objc_msgSend(a1, "scaledRSSI");
  return WFSignalBarsFromScaledRSSI();
}

- (uint64_t)subtitle
{
  return 0;
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  if (!objc_msgSend(a1, "isPasspoint"))
    goto LABEL_6;
  objc_msgSend(a1, "displayedOperatorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(a1, "domainName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "domainName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_6:
    objc_msgSend(a1, "ssid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  objc_msgSend(a1, "displayedOperatorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

@end
