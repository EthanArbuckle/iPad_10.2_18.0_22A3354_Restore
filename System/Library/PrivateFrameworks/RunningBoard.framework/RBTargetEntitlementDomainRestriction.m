@implementation RBTargetEntitlementDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "targetEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", self->_entitlement);

  if (a4 && (v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80E58];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("target is not running or doesn't have entitlement %@"), self->_entitlement, *MEMORY[0x24BDD0FD8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_initWithEntitlement:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBTargetEntitlementDomainRestriction;
  v5 = -[RBDomainRestriction _init](&v10, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Entitlement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = -[RBTargetEntitlementDomainRestriction _initWithEntitlement:]([RBTargetEntitlementDomainRestriction alloc], "_initWithEntitlement:", v6);
  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBTargetEntitlementDomainRestriction doesn't specify entitlement: %@"), v5, *MEMORY[0x24BDD0FD8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    *a4 = v11;

    a4 = 0;
  }

  return a4;
}

- (id)allEntitlements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", self->_entitlement);
}

- (BOOL)isEqual:(id)a3
{
  RBTargetEntitlementDomainRestriction *v4;
  uint64_t v5;
  char v6;
  NSString *entitlement;
  NSString *v8;
  BOOL v9;

  v4 = (RBTargetEntitlementDomainRestriction *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  entitlement = self->_entitlement;
  v8 = v4->_entitlement;
  if (entitlement == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (entitlement)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[NSString isEqual:](entitlement, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_entitlement, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_entitlement);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
}

@end
