@implementation PLUsageSnapshot

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLUsageSnapshot timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUsageSnapshot cpuUsage](self, "cpuUsage");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PLUsageSnapshot (%@: %f)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(double)a3
{
  self->_cpuUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
