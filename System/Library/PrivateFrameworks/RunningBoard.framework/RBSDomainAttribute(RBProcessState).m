@implementation RBSDomainAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v6, "domainAttributeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "areTargetPropertiesValidForContext:forAttributeWithDomain:andName:", v6, v14, v15);

  if ((v16 & 1) != 0)
  {
    if (-[RBSDomainAttribute _areOriginatorEntitlementsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _areTargetEntitlementsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _areAdditionalRestrictionsValidForContext:withError:](a1, v6, a4)
      && -[RBSDomainAttribute _doesRestrictionAllowForContext:withError:](a1, v6, (uint64_t)a4))
    {
LABEL_2:
      objc_msgSend(v6, "pushIgnoreRestrictions");
      objc_msgSend(v6, "domainAttributeManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v7, "attributesForDomain:andName:context:withError:", v8, v9, v6, &v31);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v31;

      if (!v11)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = v10;
        v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v28;
          while (2)
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v28 != v24)
                objc_enumerationMutation(v10);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "isValidForContext:withError:", v6, a4, (_QWORD)v27))
              {

                goto LABEL_25;
              }
              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
            if (v23)
              continue;
            break;
          }
        }

        objc_msgSend(v6, "popIgnoreRestrictions");
        v21 = 1;
        goto LABEL_26;
      }
      if (!a4)
      {
LABEL_25:
        v21 = 0;
        goto LABEL_26;
      }
      v12 = objc_retainAutorelease(v11);
      v11 = v12;
LABEL_13:
      v21 = 0;
      *a4 = v12;
LABEL_26:

      goto LABEL_27;
    }
  }
  else if (a4)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BE80D88];
    v19 = *MEMORY[0x24BDD0FD8];
    v34[0] = CFSTR("Target for domain attribute is missing a required plist property");
    v20 = *MEMORY[0x24BE80D80];
    v33[0] = v19;
    v33[1] = v20;
    objc_msgSend(a1, "description");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v34[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 2, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  BOOL v29;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setHasDomainAttribute:", 1);
  objc_msgSend(a1, "sourceEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "sourceEnvironments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@:%@"), v13, v14);

  objc_msgSend(v8, "domainAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v8, "domainAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@,%@"), v18, v15);
    objc_msgSend(v8, "setDomainAttributes:", v19);

  }
  else
  {
    objc_msgSend(v8, "setDomainAttributes:", v15);
  }
  v29 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v29))
  {
    if (v29)
      objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
    objc_msgSend(v9, "domainAttributeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributesForDomain:andName:context:withError:", v21, v22, v9, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __93__RBSDomainAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke;
    v25[3] = &unk_24DD47750;
    v26 = v8;
    v28 = a4;
    v24 = v9;
    v27 = v24;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v25);
    if (v29)
      objc_msgSend(v24, "popActiveDueToInheritedEndowment");

  }
}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, char);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v22 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v22))
  {
    if (v22)
      objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
    objc_msgSend(v9, "domainAttributeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesForDomain:andName:context:withError:", v11, v12, v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __91__RBSDomainAttribute_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke;
    v18 = &unk_24DD47750;
    v19 = v8;
    v21 = a4;
    v14 = v9;
    v20 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v15);
    if (v22)
      objc_msgSend(v14, "popActiveDueToInheritedEndowment", v15, v16, v17, v18, v19);

  }
}

- (void)applyToAcquisitionContext:()RBProcessState
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "daemonContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domainAttributeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesForDomain:andName:context:withError:", v7, v8, 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__RBSDomainAttribute_RBProcessState__applyToAcquisitionContext___block_invoke;
  v11[3] = &unk_24DD47778;
  v12 = v4;
  v9 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, char);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v22 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v22))
  {
    if (v22)
      objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
    objc_msgSend(v9, "domainAttributeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesForDomain:andName:context:withError:", v11, v12, v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __80__RBSDomainAttribute_RBProcessState__applyToProcessState_attributePath_context___block_invoke;
    v18 = &unk_24DD47750;
    v19 = v8;
    v21 = a4;
    v14 = v9;
    v20 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v15);
    if (v22)
      objc_msgSend(v14, "popActiveDueToInheritedEndowment", v15, v16, v17, v18, v19);

  }
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  BOOL v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v24 = 0;
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v9, &v24))
  {
    if (v24)
      objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
    objc_msgSend(v9, "domainAttributeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesForDomain:andName:context:withError:", v11, v12, v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "applyToSystemState:attributePath:context:", v8, RBSAttributePathIncrement(a4, v17 + i), v9, (_QWORD)v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        v17 += i;
      }
      while (v16);
    }

    if (v24)
      objc_msgSend(v9, "popActiveDueToInheritedEndowment");

  }
}

- (id)effectiveAttributesWithContext:()RBProcessState
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RBSDomainAttribute _contextContainsRequiredEndowment:requiresEndowment:](a1, v4, 0))
  {
    objc_msgSend(v4, "domainAttributeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributesForDomain:andName:context:withError:", v7, v8, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __69__RBSDomainAttribute_RBProcessState__effectiveAttributesWithContext___block_invoke;
    v14 = &unk_24DD46FB8;
    v15 = v5;
    v16 = v4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v11);

  }
  objc_msgSend(v5, "addObject:", a1, v11, v12, v13, v14);

  return v5;
}

@end
