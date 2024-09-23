@implementation W5Status

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5Status;
  -[W5Status dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("WiFi=>\n%@"), self->_wifi);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nAWDL=>\n%@"), self->_awdl);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nBluetooth=>\n%@"), self->_bluetooth);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nNetwork=>\n%@"), self->_network);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nPower=>\n%@"), self->_power);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nDiagnostics Modes=>\n%@"), self->_diagnosticsModes);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nLastHr Faults=>\n%@"), self->_lastHrFaults);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nLastHr LinkTests=>\n%@"), self->_lastHrLinkTests);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nLastHr Recoveries=>\n%@"), self->_lastHrRecoveries);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5Status;
  if (-[W5Status conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToStatus:(id)a3
{
  W5WiFiStatus *wifi;
  int v6;
  W5AWDLStatus *awdl;
  W5BluetoothStatus *bluetooth;
  W5NetworkStatus *network;
  W5PowerStatus *power;
  NSArray *diagnosticsModes;
  W5SummaryFaults *lastHrFaults;
  W5SummaryLinkTests *lastHrLinkTests;
  W5SummaryRecoveries *lastHrRecoveries;

  wifi = self->_wifi;
  if (!wifi)
  {
    if (!objc_msgSend(a3, "wifi"))
      goto LABEL_5;
    wifi = self->_wifi;
  }
  v6 = -[W5WiFiStatus isEqual:](wifi, "isEqual:", objc_msgSend(a3, "wifi"));
  if (!v6)
    return v6;
LABEL_5:
  awdl = self->_awdl;
  if (!awdl)
  {
    if (!objc_msgSend(a3, "awdl"))
      goto LABEL_9;
    awdl = self->_awdl;
  }
  v6 = -[W5AWDLStatus isEqual:](awdl, "isEqual:", objc_msgSend(a3, "awdl"));
  if (!v6)
    return v6;
LABEL_9:
  bluetooth = self->_bluetooth;
  if (!bluetooth)
  {
    if (!objc_msgSend(a3, "bluetooth"))
      goto LABEL_13;
    bluetooth = self->_bluetooth;
  }
  v6 = -[W5BluetoothStatus isEqual:](bluetooth, "isEqual:", objc_msgSend(a3, "bluetooth"));
  if (!v6)
    return v6;
LABEL_13:
  network = self->_network;
  if (!network)
  {
    if (!objc_msgSend(a3, "network"))
      goto LABEL_17;
    network = self->_network;
  }
  v6 = -[W5NetworkStatus isEqual:](network, "isEqual:", objc_msgSend(a3, "network"));
  if (!v6)
    return v6;
LABEL_17:
  power = self->_power;
  if (!power)
  {
    if (!objc_msgSend(a3, "power"))
      goto LABEL_21;
    power = self->_power;
  }
  v6 = -[W5PowerStatus isEqual:](power, "isEqual:", objc_msgSend(a3, "power"));
  if (!v6)
    return v6;
LABEL_21:
  diagnosticsModes = self->_diagnosticsModes;
  if (!diagnosticsModes)
  {
    if (!objc_msgSend(a3, "diagnosticsModes"))
      goto LABEL_25;
    diagnosticsModes = self->_diagnosticsModes;
  }
  v6 = -[NSArray isEqual:](diagnosticsModes, "isEqual:", objc_msgSend(a3, "diagnosticsModes"));
  if (!v6)
    return v6;
LABEL_25:
  lastHrFaults = self->_lastHrFaults;
  if (!lastHrFaults)
  {
    if (!objc_msgSend(a3, "lastHrFaults"))
      goto LABEL_29;
    lastHrFaults = self->_lastHrFaults;
  }
  v6 = -[W5SummaryFaults isEqual:](lastHrFaults, "isEqual:", objc_msgSend(a3, "lastHrFaults"));
  if (!v6)
    return v6;
LABEL_29:
  lastHrLinkTests = self->_lastHrLinkTests;
  if (lastHrLinkTests)
    goto LABEL_32;
  if (objc_msgSend(a3, "lastHrLinkTests"))
  {
    lastHrLinkTests = self->_lastHrLinkTests;
LABEL_32:
    v6 = -[W5SummaryLinkTests isEqual:](lastHrLinkTests, "isEqual:", objc_msgSend(a3, "lastHrLinkTests"));
    if (!v6)
      return v6;
  }
  lastHrRecoveries = self->_lastHrRecoveries;
  if (!lastHrRecoveries)
  {
    if (!objc_msgSend(a3, "lastHrRecoveries"))
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    lastHrRecoveries = self->_lastHrRecoveries;
  }
  LOBYTE(v6) = -[W5SummaryRecoveries isEqual:](lastHrRecoveries, "isEqual:", objc_msgSend(a3, "lastHrRecoveries"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5Status isEqualToStatus:](self, "isEqualToStatus:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[W5WiFiStatus hash](self->_wifi, "hash");
  v4 = -[W5AWDLStatus hash](self->_awdl, "hash") ^ v3;
  v5 = -[W5BluetoothStatus hash](self->_bluetooth, "hash");
  v6 = v4 ^ v5 ^ -[W5NetworkStatus hash](self->_network, "hash");
  v7 = -[W5PowerStatus hash](self->_power, "hash");
  v8 = v7 ^ -[NSArray hash](self->_diagnosticsModes, "hash");
  v9 = v6 ^ v8 ^ -[W5SummaryFaults hash](self->_lastHrFaults, "hash");
  v10 = -[W5SummaryLinkTests hash](self->_lastHrLinkTests, "hash");
  return v9 ^ v10 ^ -[W5SummaryRecoveries hash](self->_lastHrRecoveries, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5Status *v4;

  v4 = -[W5Status init](+[W5Status allocWithZone:](W5Status, "allocWithZone:", a3), "init");
  -[W5Status setWifi:](v4, "setWifi:", self->_wifi);
  -[W5Status setAwdl:](v4, "setAwdl:", self->_awdl);
  -[W5Status setBluetooth:](v4, "setBluetooth:", self->_bluetooth);
  -[W5Status setNetwork:](v4, "setNetwork:", self->_network);
  -[W5Status setPower:](v4, "setPower:", self->_power);
  -[W5Status setDiagnosticsModes:](v4, "setDiagnosticsModes:", -[NSArray copy](self->_diagnosticsModes, "copy"));
  -[W5Status setLastHrFaults:](v4, "setLastHrFaults:", self->_lastHrFaults);
  -[W5Status setLastHrLinkTests:](v4, "setLastHrLinkTests:", self->_lastHrLinkTests);
  -[W5Status setLastHrRecoveries:](v4, "setLastHrRecoveries:", self->_lastHrRecoveries);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_wifi, CFSTR("_wifi"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_awdl, CFSTR("_awdl"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bluetooth, CFSTR("_bluetooth"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_network, CFSTR("_network"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_power, CFSTR("_power"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_diagnosticsModes, 1, 0), CFSTR("_diagnosticsModes"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastHrFaults, CFSTR("_lastHrFaults"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastHrLinkTests, CFSTR("_lastHrLinkTests"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lastHrRecoveries, CFSTR("_lastHrRecoveries"));
}

- (W5Status)initWithCoder:(id)a3
{
  W5Status *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)W5Status;
  v4 = -[W5Status init](&v10, sel_init);
  if (v4)
  {
    v4->_wifi = (W5WiFiStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wifi")), "copy");
    v4->_awdl = (W5AWDLStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_awdl")), "copy");
    v4->_bluetooth = (W5BluetoothStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bluetooth")), "copy");
    v4->_network = (W5NetworkStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_network")), "copy");
    v4->_power = (W5PowerStatus *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_power")), "copy");
    v5 = (void *)MEMORY[0x24BDD1620];
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v4->_diagnosticsModes = (NSArray *)objc_msgSend((id)objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_diagnosticsModes")), 0), "copy");
    v4->_lastHrFaults = (W5SummaryFaults *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastHrFaults")), "copy");
    v4->_lastHrLinkTests = (W5SummaryLinkTests *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastHrLinkTests")), "copy");
    v4->_lastHrRecoveries = (W5SummaryRecoveries *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastHrRecoveries")), "copy");
  }
  return v4;
}

- (W5WiFiStatus)wifi
{
  return self->_wifi;
}

- (void)setWifi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (W5AWDLStatus)awdl
{
  return self->_awdl;
}

- (void)setAwdl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (W5BluetoothStatus)bluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (W5NetworkStatus)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (W5PowerStatus)power
{
  return self->_power;
}

- (void)setPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)diagnosticsModes
{
  return self->_diagnosticsModes;
}

- (void)setDiagnosticsModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (W5SummaryFaults)lastHrFaults
{
  return self->_lastHrFaults;
}

- (void)setLastHrFaults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (W5SummaryLinkTests)lastHrLinkTests
{
  return self->_lastHrLinkTests;
}

- (void)setLastHrLinkTests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (W5SummaryRecoveries)lastHrRecoveries
{
  return self->_lastHrRecoveries;
}

- (void)setLastHrRecoveries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
