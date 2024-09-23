@implementation WiFiUsageInterfaceCapabilities

- (unint64_t)maxInterfacePHYRate
{
  unint64_t result;
  uint64_t v4;

  result = self->_maxPHYRate;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[WiFiUsageInterfaceCapabilities supportedPhyModes](self, "supportedPhyModes"))
    {
      if (-[WiFiUsageInterfaceCapabilities deviceSupports:](self, "deviceSupports:", 94))
        v4 = 160;
      else
        v4 = 80;
      result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:](WiFiUsageLQMTransformations, "getMaxPhyrateWithNss:Bw:Phy:", 2, v4, self->_supportedPhyModes);
      self->_maxPHYRate = result;
    }
    else
    {
      return self->_maxPHYRate;
    }
  }
  return result;
}

- (WiFiUsageInterfaceCapabilities)initWithInterfaceName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *interfaceName;
  uint64_t v7;
  uint64_t v8;
  WiFiUsageInterfaceCapabilities *v9;
  objc_super v11;

  v4 = a3;
  if (!v4)
  {
    NSLog(CFSTR("%s - Cannot create InterfaceCapabilities (invalid interfaceName:%@)"), "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", 0);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageInterfaceCapabilities;
  self = -[WiFiUsageInterfaceCapabilities init](&v11, sel_init);
  v5 = (NSString *)objc_msgSend(v4, "copy");
  interfaceName = self->_interfaceName;
  self->_interfaceName = v5;

  v7 = Apple80211Open();
  if ((_DWORD)v7)
  {
    NSLog(CFSTR("%s: Apple80211Open returned err %d"), "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", v7);
    goto LABEL_6;
  }
  v8 = Apple80211BindToInterface();
  if ((_DWORD)v8)
  {
    NSLog(CFSTR("%s: Apple80211BindToInterface returned err %d"), "-[WiFiUsageInterfaceCapabilities initWithInterfaceName:]", v8);
    goto LABEL_6;
  }
  self->_maxPHYRate = 0x7FFFFFFFFFFFFFFFLL;
  self->_supportedPhyModes = 0;
  self = self;
  v9 = self;
LABEL_7:

  return v9;
}

- (int)supportedPhyModes
{
  int result;
  void *v4;
  uint64_t v5;
  void *v6;

  result = self->_supportedPhyModes;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = Apple80211Get();
    if ((_DWORD)v5)
    {
      NSLog(CFSTR("%s: Apple80211CopyValue returned err %d"), "-[WiFiUsageInterfaceCapabilities supportedPhyModes]", v5);
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("PHYMODE_SUPPORTED"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportedPhyModes = objc_msgSend(v6, "unsignedIntValue");

    }
    return self->_supportedPhyModes;
  }
  return result;
}

- (unint64_t)currentNumberOfSpatialStreams
{
  uint64_t v2;

  v2 = Apple80211CopyValue();
  if ((_DWORD)v2)
    NSLog(CFSTR("%s: Apple80211CopyValue returned err %d"), "-[WiFiUsageInterfaceCapabilities currentNumberOfSpatialStreams]", v2);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSSet)deviceCapabilities
{
  NSSet *deviceCapabilities;
  uint64_t v4;
  NSSet *v5;
  NSSet *v6;

  deviceCapabilities = self->_deviceCapabilities;
  if (!deviceCapabilities)
  {
    v4 = Apple80211CopyValue();
    if ((_DWORD)v4)
    {
      NSLog(CFSTR("%s: Apple80211CopyValue returned err %d"), "-[WiFiUsageInterfaceCapabilities deviceCapabilities]", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", 0);
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v6 = self->_deviceCapabilities;
      self->_deviceCapabilities = v5;

    }
    deviceCapabilities = self->_deviceCapabilities;
  }
  return deviceCapabilities;
}

- (BOOL)deviceSupports:(int)a3
{
  uint64_t v3;
  void *v5;
  NSSet *deviceCapabilities;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[WiFiUsageInterfaceCapabilities deviceCapabilities](self, "deviceCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  deviceCapabilities = self->_deviceCapabilities;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceCapabilities) = -[NSSet containsObject:](deviceCapabilities, "containsObject:", v7);

  return (char)deviceCapabilities;
}

- (id)description
{
  void *v3;
  NSString *interfaceName;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  interfaceName = self->_interfaceName;
  +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", -[WiFiUsageInterfaceCapabilities supportedPhyModes](self, "supportedPhyModes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", self->_supportedPhyModes));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: supportedPhyModes:%@ maxPhyMode:%@ maxPHYRate:%d"), interfaceName, v5, v6, -[WiFiUsageInterfaceCapabilities maxInterfacePHYRate](self, "maxInterfacePHYRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_a11Ref)
    Apple80211Close();
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageInterfaceCapabilities;
  -[WiFiUsageInterfaceCapabilities dealloc](&v3, sel_dealloc);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_Apple80211)a11Ref
{
  return self->_a11Ref;
}

- (void)setA11Ref:(_Apple80211 *)a3
{
  self->_a11Ref = a3;
}

- (unint64_t)maxPHYRate
{
  return self->_maxPHYRate;
}

- (void)setMaxPHYRate:(unint64_t)a3
{
  self->_maxPHYRate = a3;
}

- (void)setSupportedPhyModes:(int)a3
{
  self->_supportedPhyModes = a3;
}

- (void)setDeviceCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
