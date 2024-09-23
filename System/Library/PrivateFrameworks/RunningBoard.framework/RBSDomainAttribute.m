@implementation RBSDomainAttribute

uint64_t __64__RBSDomainAttribute_RBProcessState__applyToAcquisitionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyToAcquisitionContext:", *(_QWORD *)(a1 + 32));
}

- (uint64_t)_areTargetEntitlementsValidForContext:(_QWORD *)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "domainAttributeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetEntitlementsForDomain:andName:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "targetEntitlements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "matchesEntitlements:", v11);

      if (a3 && (v12 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BE80D88];
        v15 = *MEMORY[0x24BDD0FD8];
        v21[0] = CFSTR("Target is not running or required target entitlement is missing");
        v16 = *MEMORY[0x24BE80D80];
        v20[0] = v15;
        v20[1] = v16;
        objc_msgSend(a1, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v18);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v12 = 0;
      }
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)_doesRestrictionAllowForContext:(uint64_t)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "domainAttributeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restrictionsForDomain:andName:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "allowsContext:withError:", v6, a3);
    else
      v11 = 1;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_areAdditionalRestrictionsValidForContext:(_QWORD *)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v42;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "domainAttributeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "additionalRestrictionsForDomain:andName:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v12)
    {
      v13 = v12;
      v42 = a1;
      v43 = a3;
      v14 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("TargetsSelf"), v42))
          {
            objc_msgSend(v6, "targetIdentity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "originatorProcess");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identity");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "isEqual:", v19);

            if ((v20 & 1) == 0)
            {
              v29 = v43;
              if (v43)
              {
                v25 = v11;
                v30 = (void *)MEMORY[0x24BDD1540];
                v31 = *MEMORY[0x24BE80D88];
                v32 = *MEMORY[0x24BDD0FD8];
                v51[0] = CFSTR("This domain attribute can only target self");
                v33 = *MEMORY[0x24BE80D80];
                v50[0] = v32;
                v50[1] = v33;
                objc_msgSend(v42, "description");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v51[1] = v34;
                v35 = (void *)MEMORY[0x24BDBCE70];
                v36 = v51;
                v37 = v50;
LABEL_20:
                objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 2);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 3, v40);
                *v29 = (id)objc_claimAutoreleasedReturnValue();

                v28 = 0;
                v11 = v25;
                goto LABEL_22;
              }
LABEL_21:
              v28 = 0;
              goto LABEL_22;
            }
          }
          else if (objc_msgSend(v16, "isEqualToString:", CFSTR("TargetsHosted")))
          {
            objc_msgSend(v6, "targetIdentity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hostIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "pid");
            objc_msgSend(v6, "originatorProcess");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v11;
            v26 = objc_msgSend(v24, "rbs_pid");

            v27 = v23 == v26;
            v11 = v25;
            if (!v27)
            {
              v29 = v43;
              if (v43)
              {
                v30 = (void *)MEMORY[0x24BDD1540];
                v31 = *MEMORY[0x24BE80D88];
                v38 = *MEMORY[0x24BDD0FD8];
                v49[0] = CFSTR("This domain attribute can only target processes hosted by the originator");
                v39 = *MEMORY[0x24BE80D80];
                v48[0] = v38;
                v48[1] = v39;
                objc_msgSend(v42, "description");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v49[1] = v34;
                v35 = (void *)MEMORY[0x24BDBCE70];
                v36 = v49;
                v37 = v48;
                goto LABEL_20;
              }
              goto LABEL_21;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v13)
          continue;
        break;
      }
    }
    v28 = 1;
LABEL_22:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (uint64_t)_areOriginatorEntitlementsValidForContext:(_QWORD *)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[4];

  v43[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v32 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v5, "domainAttributeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endowmentNamespaceForDomain:andName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sourceEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {

    if (!v12)
    {
      if (a3)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BE80D88];
        v15 = *MEMORY[0x24BDD0FD8];
        v43[0] = CFSTR("Domain attribute requires a source environment");
        v16 = *MEMORY[0x24BE80D80];
        v42[0] = v15;
        v42[1] = v16;
        objc_msgSend(a1, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v17;
        v42[2] = *MEMORY[0x24BE80D90];
        objc_msgSend(a1, "fullyQualifiedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v18;
        v19 = (void *)MEMORY[0x24BDBCE70];
        v20 = v43;
        v21 = v42;
LABEL_9:
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        v26 = v14;
        v27 = 2;
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }
  else
  {

    if (v12)
    {
      if (a3)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BE80D88];
        v22 = *MEMORY[0x24BDD0FD8];
        v41[0] = CFSTR("Domain attribute specifies a source environment when none is required");
        v23 = *MEMORY[0x24BE80D80];
        v40[0] = v22;
        v40[1] = v23;
        objc_msgSend(a1, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v17;
        v40[2] = *MEMORY[0x24BE80D90];
        objc_msgSend(a1, "fullyQualifiedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v18;
        v19 = (void *)MEMORY[0x24BDBCE70];
        v20 = v41;
        v21 = v40;
        goto LABEL_9;
      }
LABEL_19:
      v32 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v6, "domainAttributeManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "originatorEntitlementsForDomain:andName:", v29, v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v32 = 1;
    goto LABEL_16;
  }
  objc_msgSend(v6, "originatorEntitlements");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v17, "matchesEntitlements:", v31);

  if (!a3 || (v32 & 1) != 0)
    goto LABEL_16;
  v33 = (void *)MEMORY[0x24BDD1540];
  v34 = *MEMORY[0x24BE80D88];
  v35 = *MEMORY[0x24BDD0FD8];
  v39[0] = CFSTR("Required client entitlement is missing");
  v36 = *MEMORY[0x24BE80D80];
  v38[0] = v35;
  v38[1] = v36;
  objc_msgSend(a1, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v33;
  v26 = v34;
  v27 = 3;
LABEL_14:
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v24);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v32 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

  return v32;
}

- (uint64_t)_contextContainsRequiredEndowment:(BOOL *)a3 requiresEndowment:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v5, "domainAttributeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endowmentNamespaceForDomain:andName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "availableInheritances");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allNamespaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v10);

    if (v13)
    {
      objc_msgSend(v6, "availableInheritances");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sourceEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inheritancesForEnvironment:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "endowmentNamespace", (_QWORD)v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v10, "isEqual:", v21);

            if ((v22 & 1) != 0)
            {
              v18 = 1;
              goto LABEL_17;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_17:

    }
    else
    {
      v18 = 0;
    }

    if (!a3)
      goto LABEL_20;
  }
  else
  {
    v18 = 1;
    if (!a3)
      goto LABEL_20;
  }
  *a3 = v10 != 0;
LABEL_20:

LABEL_21:
  return v18;
}

void __80__RBSDomainAttribute_RBProcessState__applyToProcessState_attributePath_context___block_invoke(_QWORD *a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = a1[4];
  v6 = a1[6];
  v7 = a2;
  objc_msgSend(v7, "applyToProcessState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);

}

void __91__RBSDomainAttribute_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke(_QWORD *a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = a1[4];
  v6 = a1[6];
  v7 = a2;
  objc_msgSend(v7, "applyToAssertionTransientState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);

}

void __93__RBSDomainAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke(_QWORD *a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = a1[4];
  v6 = a1[6];
  v7 = a2;
  objc_msgSend(v7, "applyToAssertionIntransientState:attributePath:context:", v5, RBSAttributePathIncrement(v6, a3), a1[5]);

}

void __69__RBSDomainAttribute_RBProcessState__effectiveAttributesWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "effectiveAttributesWithContext:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

@end
