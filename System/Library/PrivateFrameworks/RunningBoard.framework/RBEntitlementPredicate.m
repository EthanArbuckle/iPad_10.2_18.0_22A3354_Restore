@implementation RBEntitlementPredicate

+ (id)predicateForObject:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  RBAnyEntitlementPredicate *v13;
  RBAnyEntitlementPredicate *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[RBAnyEntitlementPredicate initWithArray:forDomain:attribute:errors:]([RBAnyEntitlementPredicate alloc], "initWithArray:forDomain:attribute:errors:", v9, v10, v11, v12);
      goto LABEL_6;
    }
    if (v12)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains bundle properties of wrong type: %@"), v10, v11, v9, *MEMORY[0x24BDD0FD8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "addObject:", v18);
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v13 = -[RBAllEntitlementPredicate initWithDictionary:forDomain:attribute:errors:]([RBAllEntitlementPredicate alloc], "initWithDictionary:forDomain:attribute:errors:", v9, v10, v11, v12);
LABEL_6:
  v14 = v13;
LABEL_10:

  return v14;
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)matchesEntitlements:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

- (id)allEntitlements
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

@end
