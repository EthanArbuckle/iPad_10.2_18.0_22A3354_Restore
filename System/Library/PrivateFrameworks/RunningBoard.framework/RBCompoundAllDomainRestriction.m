@implementation RBCompoundAllDomainRestriction

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
  v10.super_class = (Class)RBCompoundAllDomainRestriction;
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

      v15 = -[RBCompoundAllDomainRestriction _initWithRestrictions:]([RBCompoundAllDomainRestriction alloc], "_initWithRestrictions:", v7);
      goto LABEL_16;
    }
  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBCompoundAllDomainRestriction doesn't specify restrictions: %@"), v5);
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
  NSArray *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  NSArray *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_restrictions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  v8 = v7 == 0;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v9 = v7;
  v24 = v7 == 0;
  v10 = 0;
  v11 = *(_QWORD *)v30;
  v25 = *MEMORY[0x24BDD0FD8];
  v8 = 1;
  v12 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      v14 = v10;
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      v28 = v10;
      v16 = objc_msgSend(v15, "allowsContext:withError:", v27, &v28);
      v10 = v28;

      v8 &= v16;
      if ((v16 & 1) == 0 && a4)
      {
        if ((v12 & 1) == 0)
          objc_msgSend(v26, "appendString:", CFSTR(" AND "));
        objc_msgSend(v10, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "appendString:", v18);

        v8 = 0;
        v12 = 0;
      }
    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v9);

  if (a4)
    v19 = v8;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    objc_msgSend(v26, "appendString:", CFSTR(")"));
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BE80E58];
    v33 = v25;
    v6 = (NSArray *)objc_msgSend(v26, "copy");
    v34 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v24;
LABEL_19:

  }
  return v8;
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
  RBCompoundAllDomainRestriction *v4;
  uint64_t v5;
  char v6;
  NSArray *restrictions;
  NSArray *v8;
  BOOL v9;

  v4 = (RBCompoundAllDomainRestriction *)a3;
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
