@implementation RBTargetsSelfDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "targetProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatorProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (a4 && (v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE80D88];
    v14 = *MEMORY[0x24BDD0FD8];
    v20[0] = CFSTR("Target isn't originator");
    v15 = *MEMORY[0x24BE80D80];
    v19[0] = v14;
    v19[1] = v15;
    -[RBTargetsSelfDomainRestriction description](self, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_init
{
  id v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBTargetsSelfDomainRestriction;
  v2 = -[RBDomainRestriction _init](&v6, sel__init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  if (domainRestrictionForDictionary_withError__onceToken != -1)
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken, &__block_literal_global_22);
  return (id)domainRestrictionForDictionary_withError__singleton;
}

void __75__RBTargetsSelfDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RBTargetsSelfDomainRestriction _init]([RBTargetsSelfDomainRestriction alloc], "_init");
  v1 = (void *)domainRestrictionForDictionary_withError__singleton;
  domainRestrictionForDictionary_withError__singleton = (uint64_t)v0;

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
