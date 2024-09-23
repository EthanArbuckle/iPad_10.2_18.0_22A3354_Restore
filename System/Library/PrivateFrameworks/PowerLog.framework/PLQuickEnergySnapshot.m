@implementation PLQuickEnergySnapshot

- (PLQuickEnergySnapshot)initWithEnergies:(double)a3 andNetworkEnergy:(double)a4
{
  PLQuickEnergySnapshot *v6;
  PLQuickEnergySnapshot *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLQuickEnergySnapshot;
  v6 = -[PLQuickEnergySnapshot init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PLQuickEnergySnapshot setCpuEnergy:](v6, "setCpuEnergy:", a3);
    -[PLQuickEnergySnapshot setNetworkEnergy:](v7, "setNetworkEnergy:", a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLQuickEnergySnapshot setTimestamp:](v7, "setTimestamp:", v8);

  }
  return v7;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[PLQuickEnergySnapshot cpuEnergy](self, "cpuEnergy");
  v6 = v5;
  objc_msgSend(v4, "cpuEnergy");
  v8 = v6 - v7;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  v10 = v8 + v9;
  objc_msgSend(v4, "networkEnergy");
  v12 = v11;

  return v10 - v12;
}

- (double)networkEnergy
{
  return self->_networkEnergy;
}

- (double)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setNetworkEnergy:(double)a3
{
  self->_networkEnergy = a3;
}

- (void)setCpuEnergy:(double)a3
{
  self->_cpuEnergy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (double)getTotalEnergy
{
  double v3;
  double v4;
  double v5;

  -[PLQuickEnergySnapshot cpuEnergy](self, "cpuEnergy");
  v4 = v3;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  return v4 + v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLQuickEnergySnapshot timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLQuickEnergySnapshot cpuEnergy](self, "cpuEnergy");
  v6 = v5;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("timestamp=%@, cpuEnergy=%f, networkEnergy=%f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

@end
