@implementation RBDomainRestriction

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[11];
  _QWORD v31[12];

  v31[11] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Class"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v30[0] = CFSTR("OriginatorEntitlement");
      v31[0] = objc_opt_class();
      v30[1] = CFSTR("OriginatorExtensionPoint");
      v31[1] = objc_opt_class();
      v30[2] = CFSTR("TargetEntitlement");
      v31[2] = objc_opt_class();
      v30[3] = CFSTR("TargetExtensionPoint");
      v31[3] = objc_opt_class();
      v30[4] = CFSTR("CompoundAny");
      v31[4] = objc_opt_class();
      v30[5] = CFSTR("CompoundAll");
      v31[5] = objc_opt_class();
      v30[6] = CFSTR("CompoundNone");
      v31[6] = objc_opt_class();
      v30[7] = CFSTR("TargetProperty");
      v31[7] = objc_opt_class();
      v30[8] = CFSTR("TargetsSelf");
      v31[8] = objc_opt_class();
      v30[9] = CFSTR("TargetsHosted");
      v31[9] = objc_opt_class();
      v30[10] = CFSTR("LessThanCondition");
      v31[10] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 11);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "objectForKey:", v6);
      if (v8)
      {
        objc_msgSend(v8, "domainRestrictionForDictionary:withError:", v5, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4)
        {
          v18 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBDomainRestriction invalid class name: %@"), v6, *MEMORY[0x24BDD0FD8]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_retainAutorelease(v21);
          *a4 = v22;

        }
        v9 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        v9 = 0;
        goto LABEL_14;
      }
      v14 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBDomainRestriction doesn't specify class: %@"), v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_retainAutorelease(v17);
      v9 = 0;
      *a4 = v7;
    }

LABEL_14:
    goto LABEL_15;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBDomainRestriction malformed: %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v13);
    v9 = 0;
    *a4 = v6;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBDomainRestriction;
  return -[RBDomainRestriction init](&v3, sel_init);
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@>"), v3);

  return v4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
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
