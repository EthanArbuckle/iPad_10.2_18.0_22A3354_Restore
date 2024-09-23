@implementation PSUICarrierSpaceUsageSection

- (BOOL)isSharedPlan
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PSUICarrierSpaceUsageSection primaryMetrics](self, "primaryMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PSUICarrierSpaceUsageSection otherMetrics](self, "otherMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;

  v18 = (void *)MEMORY[0x24BDD17C8];
  -[PSUICarrierSpaceUsageSection sharedPlanIdentifier](self, "sharedPlanIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Single Plan");
  if (v3)
    v5 = (const __CFString *)v3;
  v17 = v5;
  -[PSUICarrierSpaceUsageSection primaryMetrics](self, "primaryMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpaceUsageSection accountMetrics](self, "accountMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkUsageLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpaceUsageSection accountMetrics](self, "accountMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "deviceType");
  -[PSUICarrierSpaceUsageSection accountMetrics](self, "accountMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "localDevice"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  -[PSUICarrierSpaceUsageSection otherMetrics](self, "otherMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpaceUsageSection barCategories](self, "barCategories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Shared ID: %@\nPrimary Metrics: %@\nAccount Metrics=<Network Usage Label: %@\nDevice Type: %d\nIs Local Device: %@>\nOther Metrics: %@\nBar Categories: %@"), v17, v6, v8, v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)sharedPlanIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedPlanIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CTCarrierSpaceUsagePlanMetrics)primaryMetrics
{
  return (CTCarrierSpaceUsagePlanMetrics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CTCarrierSpaceUsageAccountMetrics)accountMetrics
{
  return (CTCarrierSpaceUsageAccountMetrics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)otherMetrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOtherMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)barCategories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBarCategories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barCategories, 0);
  objc_storeStrong((id *)&self->_otherMetrics, 0);
  objc_storeStrong((id *)&self->_accountMetrics, 0);
  objc_storeStrong((id *)&self->_primaryMetrics, 0);
  objc_storeStrong((id *)&self->_sharedPlanIdentifier, 0);
}

@end
