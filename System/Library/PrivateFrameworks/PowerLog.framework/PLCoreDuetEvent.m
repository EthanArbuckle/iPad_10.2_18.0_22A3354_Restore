@implementation PLCoreDuetEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLCoreDuetEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreDuetEvent processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreDuetEvent eventIntervals](self, "eventIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreDuetEvent childBundleIDToWeight](self, "childBundleIDToWeight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bundleID=%@, processName=%@, eventIntervals=%@, childBundleIDToWeight=%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unsigned __int8)a3
{
  self->_updateType = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)childBundleIDToWeight
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChildBundleIDToWeight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)eventIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventIntervals:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIntervals, 0);
  objc_storeStrong((id *)&self->_childBundleIDToWeight, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
