@implementation PLPidAndProcessName

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLPidAndProcessName pid](self, "pid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPidAndProcessName processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)pid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
}

@end
