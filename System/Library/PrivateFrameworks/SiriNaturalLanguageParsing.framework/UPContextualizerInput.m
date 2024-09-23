@implementation UPContextualizerInput

- (UPContextualizerInput)initWithDomainResult:(id)a3 coreResult:(id)a4 modelIdentifier:(id)a5 query:(id)a6 dialogAct:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UPContextualizerInput *v17;
  UPContextualizerInput *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UPContextualizerInput;
  v17 = -[UPContextualizerInput init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domainResult, a3);
    objc_storeStrong((id *)&v18->_coreResult, a4);
    objc_storeStrong((id *)&v18->_modelIdentifier, a5);
    objc_storeStrong((id *)&v18->_query, a6);
    objc_storeStrong((id *)&v18->_dialogAct, a7);
  }

  return v18;
}

- (UPResult)domainResult
{
  return self->_domainResult;
}

- (UPResult)coreResult
{
  return self->_coreResult;
}

- (UPModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (UPQuery)query
{
  return self->_query;
}

- (UPDialogAct)dialogAct
{
  return self->_dialogAct;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogAct, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_coreResult, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);
}

@end
