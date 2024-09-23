@implementation PLAccountingDistributionDependency

- (void)setRange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLAccountingDistributionDependency distributionEvent](self, "distributionEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRange:", v4);

}

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionDependency distributionEvent](self, "distributionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingDistributionEventEntry)distributionEvent
{
  return (PLAccountingDistributionEventEntry *)objc_getProperty(self, a2, 40, 1);
}

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionDependency distributionEvent](self, "distributionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distributionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingDistributionDependency)initWithDistributionEvent:(id)a3
{
  id v5;
  PLAccountingDistributionDependency *v6;
  PLAccountingDistributionDependency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingDistributionDependency;
  v6 = -[PLAccountingDistributionDependency init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_distributionEvent, a3);

  return v7;
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingDistributionDependency distributionEvent](self, "distributionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributionEvent, 0);
}

- (void)setDistributionEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
