@implementation PLAccountingCorrectionDependency

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionDependency energyEvent](self, "energyEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionDependency energyEvent](self, "energyEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingEnergyEventEntry)energyEvent
{
  return (PLAccountingEnergyEventEntry *)objc_getProperty(self, a2, 40, 1);
}

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionDependency energyEvent](self, "energyEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingCorrectionDependency)initWithEnergyEvent:(id)a3
{
  id v5;
  PLAccountingCorrectionDependency *v6;
  PLAccountingCorrectionDependency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingCorrectionDependency;
  v6 = -[PLAccountingCorrectionDependency init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_energyEvent, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyEvent, 0);
}

- (void)setEnergyEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
