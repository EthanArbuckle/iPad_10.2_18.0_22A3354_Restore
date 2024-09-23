@implementation WBSTrackingCapableFirstParty

- (WBSTrackingCapableFirstParty)init
{
  return -[WBSTrackingCapableFirstParty initWithDomain:](self, "initWithDomain:", &stru_1E5449658);
}

- (WBSTrackingCapableFirstParty)initWithDomain:(id)a3
{
  id v4;
  WBSTrackingCapableFirstParty *v5;
  uint64_t v6;
  NSString *domain;
  WBSTrackingCapableFirstParty *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTrackingCapableFirstParty;
  v5 = -[WBSTrackingCapableFirstParty init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[1], "isEqualToString:", self->_domain);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_domain, "hash");
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
