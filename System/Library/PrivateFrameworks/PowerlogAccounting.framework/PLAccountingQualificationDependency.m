@implementation PLAccountingQualificationDependency

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationDependency qualificationEvent](self, "qualificationEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "qualificationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationDependency qualificationEvent](self, "qualificationEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingQualificationEventEntry)qualificationEvent
{
  return (PLAccountingQualificationEventEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLAccountingQualificationDependency qualificationEvent](self, "qualificationEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRange:", v4);

}

- (PLAccountingQualificationDependency)initWithQualificationEvent:(id)a3
{
  id v5;
  PLAccountingQualificationDependency *v6;
  PLAccountingQualificationDependency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingQualificationDependency;
  v6 = -[PLAccountingQualificationDependency init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_qualificationEvent, a3);

  return v7;
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingQualificationDependency qualificationEvent](self, "qualificationEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setQualificationEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualificationEvent, 0);
}

@end
