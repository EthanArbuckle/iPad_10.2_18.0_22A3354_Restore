@implementation RBLessThanConditionDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v6, "systemState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", self->_condition);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "integerValue") >= self->_value)
    {
      if (a4)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = *MEMORY[0x24BE80E58];
        v15 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("System condition %@ has value %lld, which is not less than %lld"), self->_condition, objc_msgSend(v9, "integerValue"), self->_value);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v13);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      LOBYTE(a4) = 1;
    }

  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (id)_initWithCondition:(id)a3 value:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBLessThanConditionDomainRestriction;
  v7 = -[RBDomainRestriction _init](&v12, sel__init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[1];
    v7[1] = v8;

    v7[2] = a4;
    v10 = v7;
  }

  return v7;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Condition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("Value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          a4 = -[RBLessThanConditionDomainRestriction _initWithCondition:value:]([RBLessThanConditionDomainRestriction alloc], "_initWithCondition:value:", v6, objc_msgSend(v7, "integerValue"));
LABEL_15:

          goto LABEL_16;
        }
      }
      if (!a4)
        goto LABEL_15;
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBLessThanConditionDomainRestriction doesn't specify value: %@"), v5, *MEMORY[0x24BDD0FD8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v18;
      v12 = &v17;
    }
    else
    {
      if (!a4)
        goto LABEL_15;
      v8 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBLessThanConditionDomainRestriction doesn't specify condition: %@"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = (void **)v20;
      v12 = &v19;
    }
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    *a4 = v15;

    a4 = 0;
    goto LABEL_15;
  }
  if (domainRestrictionForDictionary_withError__onceToken_183 != -1)
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_183, &__block_literal_global_185);
  a4 = (id *)(id)domainRestrictionForDictionary_withError__singleton_184;
LABEL_16:

  return a4;
}

void __81__RBLessThanConditionDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RBLessThanConditionDomainRestriction _initWithCondition:value:]([RBLessThanConditionDomainRestriction alloc], "_initWithCondition:value:", CFSTR("FFDisabled"), 0);
  v1 = (void *)domainRestrictionForDictionary_withError__singleton_184;
  domainRestrictionForDictionary_withError__singleton_184 = (uint64_t)v0;

}

- (id)allEntitlements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)isEqual:(id)a3
{
  RBLessThanConditionDomainRestriction *v4;
  uint64_t v5;
  BOOL v6;
  NSString *condition;
  NSString *v8;
  BOOL v9;

  v4 = (RBLessThanConditionDomainRestriction *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && ((condition = self->_condition, v8 = v4->_condition, condition == v8)
       || (condition ? (v9 = v8 == 0) : (v9 = 1), !v9 && -[NSString isEqual:](condition, "isEqual:")))
      && self->_value == v4->_value;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_value ^ -[NSString hash](self->_condition, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@:%lld>"), v4, self->_condition, self->_value);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
