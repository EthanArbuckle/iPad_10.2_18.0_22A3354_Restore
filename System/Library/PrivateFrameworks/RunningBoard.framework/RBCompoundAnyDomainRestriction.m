@implementation RBCompoundAnyDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t j;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  id *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = self->_restrictions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "allowsContext:withError:", v6, 0) & 1) != 0)
        {
          v31 = 1;
          goto LABEL_24;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (a4)
  {
    v33 = a4;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = self->_restrictions;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    v14 = *MEMORY[0x24BDD0FD8];
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v36;
      v17 = 1;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((v17 & 1) == 0)
            -[NSArray appendString:](v7, "appendString:", CFSTR(" AND "));
          v34 = 0;
          v20 = objc_msgSend(v19, "allowsContext:withError:", v6, &v34);
          v21 = v34;
          if (v20)
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.1();
          v22 = v21;
          if (!v21)
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.2();
          objc_msgSend(v21, "userInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
            -[RBCompoundAnyDomainRestriction allowsContext:withError:].cold.3();

          objc_msgSend(v22, "userInfo");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v14);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray appendString:](v7, "appendString:", v26);

          v17 = 0;
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        v17 = 0;
      }
      while (v15);
    }

    -[NSArray appendString:](v7, "appendString:", CFSTR(")"));
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BE80E58];
    v43 = v14;
    v29 = (void *)-[NSArray copy](v7, "copy");
    v44 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 1, v30);
    *v33 = (id)objc_claimAutoreleasedReturnValue();

    v31 = 0;
LABEL_24:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

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
  v10.super_class = (Class)RBCompoundAnyDomainRestriction;
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

      v15 = -[RBCompoundAnyDomainRestriction _initWithRestrictions:]([RBCompoundAnyDomainRestriction alloc], "_initWithRestrictions:", v7);
      goto LABEL_16;
    }
  }
  if (a4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBCompoundAnyDomainRestriction doesn't specify restrictions: %@"), v5);
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
  RBCompoundAnyDomainRestriction *v4;
  uint64_t v5;
  char v6;
  NSArray *restrictions;
  NSArray *v8;
  BOOL v9;

  v4 = (RBCompoundAnyDomainRestriction *)a3;
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

- (void)allowsContext:withError:.cold.1()
{
  __assert_rtn("-[RBCompoundAnyDomainRestriction allowsContext:withError:]", "RBDomainRestriction.m", 517, "![restriction allowsContext:context withError:&internalError]");
}

- (void)allowsContext:withError:.cold.2()
{
  __assert_rtn("-[RBCompoundAnyDomainRestriction allowsContext:withError:]", "RBDomainRestriction.m", 518, "internalError");
}

- (void)allowsContext:withError:.cold.3()
{
  __assert_rtn("-[RBCompoundAnyDomainRestriction allowsContext:withError:]", "RBDomainRestriction.m", 519, "[[internalError userInfo] objectForKey:NSLocalizedFailureReasonErrorKey]");
}

@end
