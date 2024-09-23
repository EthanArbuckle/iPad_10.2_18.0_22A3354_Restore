@implementation PGTrialConfigurationSource

- (PGTrialConfigurationSource)initWithTrialSession:(id)a3 namespaceType:(unsigned __int16)a4
{
  id v7;
  PGTrialConfigurationSource *v8;
  PGTrialConfigurationSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGTrialConfigurationSource;
  v8 = -[PGTrialConfigurationSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_trialSession, a3);
    v9->_namespaceType = a4;
  }

  return v9;
}

- (id)objectForKey:(id)a3
{
  void *v3;
  void *v4;

  -[PGTrialSession levelForFactorName:withNamespaceType:](self->_trialSession, "levelForFactorName:withNamespaceType:", a3, self->_namespaceType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PGTrialSession)trialSession
{
  return self->_trialSession;
}

- (void)setTrialSession:(id)a3
{
  objc_storeStrong((id *)&self->_trialSession, a3);
}

- (unsigned)namespaceType
{
  return self->_namespaceType;
}

- (void)setNamespaceType:(unsigned __int16)a3
{
  self->_namespaceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialSession, 0);
}

@end
