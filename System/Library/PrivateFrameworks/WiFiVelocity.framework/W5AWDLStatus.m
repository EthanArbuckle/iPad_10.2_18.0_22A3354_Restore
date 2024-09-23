@implementation W5AWDLStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5AWDLStatus;
  -[W5AWDLStatus dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  NSData *awdlSyncEnabled;
  const char *v6;
  unint64_t v7;
  NSData *awdlStrategy;
  const __CFString *v9;
  NSData *awdlSyncChannelSequence;
  const __CFString *v11;
  NSData *awdlOpMode;
  const char *v13;
  const char *v14;
  NSData *awdlSyncState;
  const __CFString *v16;
  NSData *awdlSyncParameters;
  const __CFString *v18;
  NSData *awdlMasterChannel;
  uint64_t v20;
  NSData *awdlSecondaryMasterChannel;
  uint64_t v22;
  NSData *awdlElectionParameters;
  const __CFString *v24;
  NSData *awdlPeerDatabase;
  NSData *awdlSidecarDiagnostics;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("MAC Address: %@ (hw=%@)\n"), self->_macAddress, self->_hardwareMACAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("Interface Name: %@\n"), self->_interfaceName);
  if (self->_power)
    v4 = "On";
  else
    v4 = "Off";
  objc_msgSend(v3, "appendFormat:", CFSTR("Power: %s\n"), v4);
  awdlSyncEnabled = self->_awdlSyncEnabled;
  if (awdlSyncEnabled)
  {
    if (*(_DWORD *)(-[NSData bytes](awdlSyncEnabled, "bytes") + 8))
      v6 = "ENABLED";
    else
      v6 = "DISABLED";
  }
  else
  {
    v6 = "n/a";
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("AWDL is %s\n"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6 Address: %@\n"), -[NSArray firstObject](self->_ipv6Addresses, "firstObject"));
  if (-[NSArray count](self->_ipv6Addresses, "count") >= 2)
  {
    v7 = 1;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("              %@\n"), -[NSArray objectAtIndexedSubscript:](self->_ipv6Addresses, "objectAtIndexedSubscript:", v7++));
    while (v7 < -[NSArray count](self->_ipv6Addresses, "count"));
  }
  awdlStrategy = self->_awdlStrategy;
  if (awdlStrategy)
    v9 = W5DescriptionForAWDLScheduleState(*(unsigned int *)(-[NSData bytes](awdlStrategy, "bytes") + 8));
  else
    v9 = CFSTR("n/a");
  objc_msgSend(v3, "appendFormat:", CFSTR("Schedule State: %@\n"), v9);
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if (awdlSyncChannelSequence)
    v11 = (const __CFString *)W5DebugDescriptionForAWDLSyncChannelSequence((uint64_t)-[NSData bytes](awdlSyncChannelSequence, "bytes"));
  else
    v11 = CFSTR("n/a");
  objc_msgSend(v3, "appendFormat:", CFSTR("Channel Sequence: %@\n"), v11);
  awdlOpMode = self->_awdlOpMode;
  if (awdlOpMode)
  {
    if (*(_DWORD *)(-[NSData bytes](awdlOpMode, "bytes") + 4) <= 2u)
      v13 = (&off_24C23D990)[*(unsigned int *)(-[NSData bytes](self->_awdlOpMode, "bytes") + 4)];
    else
      v13 = "UNKNOWN";
  }
  else
  {
    v13 = "n/a";
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Op Mode: %s\n"), v13);
  if (self->_isAWDLRealTimeMode)
    v14 = "Yes";
  else
    v14 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR("Real Time Mode: %s\n"), v14);
  awdlSyncState = self->_awdlSyncState;
  if (awdlSyncState)
    v16 = W5DescriptionForAWDLSyncState((const __CFString *)-[NSData bytes](awdlSyncState, "bytes"));
  else
    v16 = CFSTR("n/a");
  objc_msgSend(v3, "appendFormat:", CFSTR("Sync State: %@\n"), v16);
  awdlSyncParameters = self->_awdlSyncParameters;
  if (awdlSyncParameters)
    v18 = (const __CFString *)W5DescriptionForAWDLSyncParameters((unsigned int *)-[NSData bytes](awdlSyncParameters, "bytes"));
  else
    v18 = CFSTR("n/a");
  objc_msgSend(v3, "appendFormat:", CFSTR("Sync Params:\n%@"), v18);
  awdlMasterChannel = self->_awdlMasterChannel;
  if (awdlMasterChannel)
    v20 = *(unsigned int *)(-[NSData bytes](awdlMasterChannel, "bytes") + 4);
  else
    v20 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("Master Channel: %u\n"), v20);
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if (awdlSecondaryMasterChannel)
    v22 = *(unsigned int *)(-[NSData bytes](awdlSecondaryMasterChannel, "bytes") + 4);
  else
    v22 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("Secondary Master Channel: %u\n"), v22);
  awdlElectionParameters = self->_awdlElectionParameters;
  if (awdlElectionParameters)
    v24 = (const __CFString *)W5DescriptionForAWDLElectionParameters((uint64_t)-[NSData bytes](awdlElectionParameters, "bytes"));
  else
    v24 = CFSTR("n/a");
  objc_msgSend(v3, "appendFormat:", CFSTR("Election Params:\n%@"), v24);
  objc_msgSend(v3, "appendFormat:", CFSTR("AirDrop Discoverable Mode: %@\n"), W5DescriptionForAirDropDiscoverableMode(self->_airDropDiscoverableMode));
  awdlPeerDatabase = self->_awdlPeerDatabase;
  if (awdlPeerDatabase)
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer DB Count: %ld peers\n"), *(unsigned int *)(-[NSData bytes](awdlPeerDatabase, "bytes") + 4));
  awdlSidecarDiagnostics = self->_awdlSidecarDiagnostics;
  if (awdlSidecarDiagnostics)
    objc_msgSend(v3, "appendFormat:", CFSTR("Sidecar Tx Latency: %ld ms\n"), *(unsigned int *)(-[NSData bytes](awdlSidecarDiagnostics, "bytes") + 4));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5AWDLStatus;
  if (-[W5AWDLStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToAWDLStatus:(id)a3
{
  NSString *macAddress;
  NSString *hardwareMACAddress;
  NSString *interfaceName;
  int power;
  NSArray *ipv6Addresses;
  int isAWDLRealTimeMode;
  int64_t airDropDiscoverableMode;

  macAddress = self->_macAddress;
  if (!macAddress)
  {
    if (!objc_msgSend(a3, "macAddress"))
      goto LABEL_5;
    macAddress = self->_macAddress;
  }
  if (!-[NSString isEqual:](macAddress, "isEqual:", objc_msgSend(a3, "macAddress")))
    return 0;
LABEL_5:
  hardwareMACAddress = self->_hardwareMACAddress;
  if (!hardwareMACAddress)
  {
    if (!objc_msgSend(a3, "hardwareMACAddress"))
      goto LABEL_9;
    hardwareMACAddress = self->_hardwareMACAddress;
  }
  if (!-[NSString isEqual:](hardwareMACAddress, "isEqual:", objc_msgSend(a3, "hardwareMACAddress")))
    return 0;
LABEL_9:
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    if (!objc_msgSend(a3, "interfaceName"))
      goto LABEL_13;
    interfaceName = self->_interfaceName;
  }
  if (!-[NSString isEqual:](interfaceName, "isEqual:", objc_msgSend(a3, "interfaceName")))
    return 0;
LABEL_13:
  power = self->_power;
  if (power != objc_msgSend(a3, "power"))
    return 0;
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses)
    goto LABEL_17;
  if (objc_msgSend(a3, "ipv6Addresses"))
  {
    ipv6Addresses = self->_ipv6Addresses;
LABEL_17:
    if (!-[NSArray isEqual:](ipv6Addresses, "isEqual:", objc_msgSend(a3, "ipv6Addresses")))
      return 0;
  }
  isAWDLRealTimeMode = self->_isAWDLRealTimeMode;
  if (isAWDLRealTimeMode == objc_msgSend(a3, "isAWDLRealTimeMode"))
  {
    airDropDiscoverableMode = self->_airDropDiscoverableMode;
    if (airDropDiscoverableMode == objc_msgSend(a3, "airDropDiscoverableMode")
      && -[NSData isEqualToData:](self->_awdlSyncEnabled, "isEqualToData:", objc_msgSend(a3, "awdlSyncEnabled"))
      && -[NSData isEqualToData:](self->_awdlOpMode, "isEqualToData:", objc_msgSend(a3, "awdlOpMode"))
      && -[NSData isEqualToData:](self->_awdlSyncState, "isEqualToData:", objc_msgSend(a3, "awdlSyncState"))
      && -[NSData isEqualToData:](self->_awdlStrategy, "isEqualToData:", objc_msgSend(a3, "awdlStrategy"))
      && -[NSData isEqualToData:](self->_awdlMasterChannel, "isEqualToData:", objc_msgSend(a3, "awdlMasterChannel"))
      && -[NSData isEqualToData:](self->_awdlSecondaryMasterChannel, "isEqualToData:", objc_msgSend(a3, "awdlSecondaryMasterChannel"))&& -[NSData isEqualToData:](self->_awdlSyncParameters, "isEqualToData:", objc_msgSend(a3, "awdlSyncParameters"))&& -[NSData isEqualToData:](self->_awdlElectionParameters, "isEqualToData:", objc_msgSend(a3, "awdlElectionParameters"))&& -[NSData isEqualToData:](self->_awdlSyncChannelSequence, "isEqualToData:", objc_msgSend(a3, "awdlSyncChannelSequence"))&& -[NSData isEqualToData:](self->_awdlPeerDatabase, "isEqualToData:", objc_msgSend(a3, "awdlPeerDatabase")))
    {
      return -[NSData isEqualToData:](self->_awdlSidecarDiagnostics, "isEqualToData:", objc_msgSend(a3, "awdlSidecarDiagnostics"));
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5AWDLStatus isEqualToAWDLStatus:](self, "isEqualToAWDLStatus:", a3);
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5AWDLStatus *v4;

  v4 = -[W5AWDLStatus init](+[W5AWDLStatus allocWithZone:](W5AWDLStatus, "allocWithZone:", a3), "init");
  -[W5AWDLStatus setMacAddress:](v4, "setMacAddress:", self->_macAddress);
  -[W5AWDLStatus setHardwareMACAddress:](v4, "setHardwareMACAddress:", self->_hardwareMACAddress);
  -[W5AWDLStatus setInterfaceName:](v4, "setInterfaceName:", self->_interfaceName);
  -[W5AWDLStatus setIpv6Addresses:](v4, "setIpv6Addresses:", self->_ipv6Addresses);
  -[W5AWDLStatus setPower:](v4, "setPower:", self->_power);
  -[W5AWDLStatus setAwdlSecondaryMasterChannel:](v4, "setAwdlSecondaryMasterChannel:", self->_awdlSecondaryMasterChannel);
  -[W5AWDLStatus setAwdlOpMode:](v4, "setAwdlOpMode:", self->_awdlOpMode);
  -[W5AWDLStatus setAwdlMasterChannel:](v4, "setAwdlMasterChannel:", self->_awdlMasterChannel);
  -[W5AWDLStatus setAwdlElectionParameters:](v4, "setAwdlElectionParameters:", self->_awdlElectionParameters);
  -[W5AWDLStatus setAwdlSyncState:](v4, "setAwdlSyncState:", self->_awdlSyncState);
  -[W5AWDLStatus setAwdlSyncParameters:](v4, "setAwdlSyncParameters:", self->_awdlSyncParameters);
  -[W5AWDLStatus setAwdlSyncEnabled:](v4, "setAwdlSyncEnabled:", self->_awdlSyncEnabled);
  -[W5AWDLStatus setAwdlSyncChannelSequence:](v4, "setAwdlSyncChannelSequence:", self->_awdlSyncChannelSequence);
  -[W5AWDLStatus setAwdlStrategy:](v4, "setAwdlStrategy:", self->_awdlStrategy);
  -[W5AWDLStatus setIsAWDLRealTimeMode:](v4, "setIsAWDLRealTimeMode:", self->_isAWDLRealTimeMode);
  -[W5AWDLStatus setAirDropDiscoverableMode:](v4, "setAirDropDiscoverableMode:", self->_airDropDiscoverableMode);
  -[W5AWDLStatus setAwdlPeerDatabase:](v4, "setAwdlPeerDatabase:", self->_awdlPeerDatabase);
  -[W5AWDLStatus setAwdlSidecarDiagnostics:](v4, "setAwdlSidecarDiagnostics:", self->_awdlSidecarDiagnostics);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_macAddress, CFSTR("_macAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_hardwareMACAddress, CFSTR("_hardwareMACAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_interfaceName, CFSTR("_interfaceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ipv6Addresses, CFSTR("_ipv6Addresses"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_power, CFSTR("_power"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isAWDLRealTimeMode, CFSTR("_isAWDLRealTimeMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSyncState, CFSTR("_awdlSyncState"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSyncEnabled, CFSTR("_awdlSyncEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSyncChannelSequence, CFSTR("_awdlSyncChannelSequence"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlStrategy, CFSTR("_awdlStrategy"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlElectionParameters, CFSTR("_awdlElectionParameters"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlMasterChannel, CFSTR("_awdlMasterChannel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSecondaryMasterChannel, CFSTR("_awdlSecondaryMasterChannel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlOpMode, CFSTR("_awdlOpMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSyncParameters, CFSTR("_awdlSyncParameters"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlPeerDatabase, CFSTR("_awdlPeerDatabase"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_airDropDiscoverableMode, CFSTR("_airDropDiscoverableMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdlSidecarDiagnostics, CFSTR("_awdlSidecarDiagnostics"));
}

- (W5AWDLStatus)initWithCoder:(id)a3
{
  W5AWDLStatus *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5AWDLStatus;
  v4 = -[W5AWDLStatus init](&v8, sel_init);
  if (v4)
  {
    v4->_macAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_macAddress")), "copy");
    v4->_hardwareMACAddress = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareMACAddress")), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interfaceName")), "copy");
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_ipv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_ipv6Addresses")), "copy");
    v4->_power = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_power"));
    v4->_isAWDLRealTimeMode = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isAWDLRealTimeMode"));
    v4->_awdlSyncState = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSyncState")), "copy");
    v4->_awdlSyncEnabled = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSyncEnabled")), "copy");
    v4->_awdlSyncChannelSequence = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSyncChannelSequence")), "copy");
    v4->_awdlStrategy = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlStrategy")), "copy");
    v4->_awdlElectionParameters = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlElectionParameters")), "copy");
    v4->_awdlMasterChannel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlMasterChannel")), "copy");
    v4->_awdlSecondaryMasterChannel = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSecondaryMasterChannel")), "copy");
    v4->_awdlOpMode = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlOpMode")), "copy");
    v4->_awdlSyncParameters = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSyncParameters")), "copy");
    v4->_awdlPeerDatabase = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlPeerDatabase")), "copy");
    v4->_airDropDiscoverableMode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_airDropDiscoverableMode"));
    v4->_awdlSidecarDiagnostics = (NSData *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdlSidecarDiagnostics")), "copy");
  }
  return v4;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)hardwareMACAddress
{
  return self->_hardwareMACAddress;
}

- (void)setHardwareMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)power
{
  return self->_power;
}

- (void)setPower:(BOOL)a3
{
  self->_power = a3;
}

- (NSData)awdlSyncEnabled
{
  return self->_awdlSyncEnabled;
}

- (void)setAwdlSyncEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)awdlSyncState
{
  return self->_awdlSyncState;
}

- (void)setAwdlSyncState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)awdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence;
}

- (void)setAwdlSyncChannelSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)awdlStrategy
{
  return self->_awdlStrategy;
}

- (void)setAwdlStrategy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)awdlElectionParameters
{
  return self->_awdlElectionParameters;
}

- (void)setAwdlElectionParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)awdlMasterChannel
{
  return self->_awdlMasterChannel;
}

- (void)setAwdlMasterChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)awdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel;
}

- (void)setAwdlSecondaryMasterChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)awdlOpMode
{
  return self->_awdlOpMode;
}

- (void)setAwdlOpMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)awdlSyncParameters
{
  return self->_awdlSyncParameters;
}

- (void)setAwdlSyncParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)awdlPeerDatabase
{
  return self->_awdlPeerDatabase;
}

- (void)setAwdlPeerDatabase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)awdlSidecarDiagnostics
{
  return self->_awdlSidecarDiagnostics;
}

- (void)setAwdlSidecarDiagnostics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isAWDLRealTimeMode
{
  return self->_isAWDLRealTimeMode;
}

- (void)setIsAWDLRealTimeMode:(BOOL)a3
{
  self->_isAWDLRealTimeMode = a3;
}

- (int64_t)airDropDiscoverableMode
{
  return self->_airDropDiscoverableMode;
}

- (void)setAirDropDiscoverableMode:(int64_t)a3
{
  self->_airDropDiscoverableMode = a3;
}

@end
