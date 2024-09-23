@implementation WBSTrackingCapableThirdParty

- (WBSTrackingCapableThirdParty)init
{
  return -[WBSTrackingCapableThirdParty initWithDomain:firstParties:](self, "initWithDomain:firstParties:", &stru_1E5449658, MEMORY[0x1E0C9AA60]);
}

- (WBSTrackingCapableThirdParty)initWithDomain:(id)a3 firstParties:(id)a4
{
  id v6;
  id v7;
  WBSTrackingCapableThirdParty *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSArray *firstParties;
  WBSTrackingCapableThirdParty *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSTrackingCapableThirdParty;
  v8 = -[WBSTrackingCapableThirdParty init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    firstParties = v8->_firstParties;
    v8->_firstParties = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_domain);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_domain, "hash");
}

- (NSString)domain
{
  return self->_domain;
}

- (NSArray)firstParties
{
  return self->_firstParties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstParties, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
