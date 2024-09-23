@implementation RBTargetsHostedDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "targetProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pid");
  objc_msgSend(v6, "originatorProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "rbs_pid");
  if (a4 && v10 != v12)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE80D88];
    v15 = *MEMORY[0x24BDD0FD8];
    v21[0] = CFSTR("Target not hosted by originator");
    v16 = *MEMORY[0x24BE80D80];
    v20[0] = v15;
    v20[1] = v16;
    -[RBTargetsHostedDomainRestriction description](self, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10 == v12;
}

- (id)_init
{
  id v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBTargetsHostedDomainRestriction;
  v2 = -[RBDomainRestriction _init](&v6, sel__init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken_173 != -1)
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_173, &__block_literal_global_174);
  return (id)domainRestrictionForDictionary_withError__singleton_172;
}

void __77__RBTargetsHostedDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RBTargetsHostedDomainRestriction _init]([RBTargetsHostedDomainRestriction alloc], "_init");
  v1 = (void *)domainRestrictionForDictionary_withError__singleton_172;
  domainRestrictionForDictionary_withError__singleton_172 = (uint64_t)v0;

}

- (id)allEntitlements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_restrictions, "hash");
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@|>"), v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end
