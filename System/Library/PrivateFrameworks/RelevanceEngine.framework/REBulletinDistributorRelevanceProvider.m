@implementation REBulletinDistributorRelevanceProvider

- (REBulletinDistributorRelevanceProvider)initWithBulletinSectionIdentifier:(id)a3
{
  id v4;
  REBulletinDistributorRelevanceProvider *v5;
  uint64_t v6;
  NSString *bulletinSectionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REBulletinDistributorRelevanceProvider;
  v5 = -[RERelevanceProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bulletinSectionIdentifier = v5->_bulletinSectionIdentifier;
    v5->_bulletinSectionIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("bulletin_distributor");
}

- (REBulletinDistributorRelevanceProvider)initWithDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  REBulletinDistributorRelevanceProvider *v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bulletin_section"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24CF92178;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = -[REBulletinDistributorRelevanceProvider initWithBulletinSectionIdentifier:](self, "initWithBulletinSectionIdentifier:", v7);
  return v8;
}

- (id)dictionaryEncoding
{
  NSString *bulletinSectionIdentifier;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  bulletinSectionIdentifier = self->_bulletinSectionIdentifier;
  v4 = CFSTR("bulletin_section");
  v5[0] = bulletinSectionIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REBulletinDistributorRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_bulletinSectionIdentifier, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REBulletinDistributorRelevanceProvider *v4;
  char v5;
  objc_super v7;

  v4 = (REBulletinDistributorRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REBulletinDistributorRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = -[NSString isEqual:](v4->_bulletinSectionIdentifier, "isEqual:", self->_bulletinSectionIdentifier);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REBulletinDistributorRelevanceProvider;
  v3 = -[RERelevanceProvider _hash](&v5, sel__hash);
  return -[NSString hash](self->_bulletinSectionIdentifier, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)REBulletinDistributorRelevanceProvider;
  -[REBulletinDistributorRelevanceProvider description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <identifier=%ld>"), v4, self->_bulletinSectionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)bulletinSectionIdentifier
{
  return self->_bulletinSectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinSectionIdentifier, 0);
}

@end
