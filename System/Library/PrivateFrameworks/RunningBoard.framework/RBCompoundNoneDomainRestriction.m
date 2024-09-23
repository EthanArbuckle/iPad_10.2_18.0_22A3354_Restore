@implementation RBCompoundNoneDomainRestriction

- (id)_initWithRestrictions:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBCompoundNoneDomainRestriction;
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
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Restrictions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            +[RBDomainRestriction domainRestrictionForDictionary:withError:](RBDomainRestriction, "domainRestrictionForDictionary:withError:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12), a4);
            v13 = objc_claimAutoreleasedReturnValue();
            if (!v13)
            {

              v15 = 0;
              goto LABEL_16;
            }
            v14 = (void *)v13;
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            continue;
          break;
        }
      }

      v15 = -[RBCompoundNoneDomainRestriction _initWithRestrictions:]([RBCompoundNoneDomainRestriction alloc], "_initWithRestrictions:", v7);
      goto LABEL_16;
    }
  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBCompoundNoneDomainRestriction doesn't specify restrictions: %@"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_retainAutorelease(v19);
    v15 = 0;
    *a4 = v7;
LABEL_16:

    goto LABEL_17;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  NSArray *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self->_restrictions;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  v10 = v9 == 0;
  if (!v9)
    goto LABEL_18;
  v11 = v9;
  v23 = v9 == 0;
  v12 = *(_QWORD *)v25;
  v10 = 1;
  v13 = 1;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "allowsContext:withError:", v6, 0);
      v10 &= v16 ^ 1;
      if (a4 && v16)
      {
        if ((v13 & 1) == 0)
          objc_msgSend(v7, "appendString:", CFSTR(" AND "));
        objc_msgSend(v15, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v17);

        v10 = 0;
        v13 = 0;
      }
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  }
  while (v11);

  if (a4)
    v18 = v10;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR(")"));
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BE80E58];
    v28 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not allowed because it has %@"), v7);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v23;
LABEL_18:

  }
  return v10;
}

- (id)allEntitlements
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_restrictions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "allEntitlements", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  RBCompoundNoneDomainRestriction *v4;
  uint64_t v5;
  char v6;
  NSArray *restrictions;
  NSArray *v8;
  BOOL v9;

  v4 = (RBCompoundNoneDomainRestriction *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  restrictions = self->_restrictions;
  v8 = v4->_restrictions;
  if (restrictions == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (restrictions)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[NSArray isEqual:](restrictions, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_restrictions, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_restrictions);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictions, 0);
}

@end
