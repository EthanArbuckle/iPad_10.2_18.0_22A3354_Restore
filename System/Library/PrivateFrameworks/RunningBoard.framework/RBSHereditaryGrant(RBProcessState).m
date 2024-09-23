@implementation RBSHereditaryGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "targetIsSystem"))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE80D88];
      v9 = *MEMORY[0x24BDD0FD8];
      v44[0] = CFSTR("Hereditary grants may not target the system");
      v10 = *MEMORY[0x24BE80D80];
      v43[0] = v9;
      v43[1] = v10;
      objc_msgSend(a1, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v11;
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = v44;
      v14 = v43;
LABEL_18:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v20);
      v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v6, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "originatorEntitlements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodedEndowment");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17
        && (v18 = (void *)v17, v19 = objc_msgSend(v11, "hasEntitlementDomain:", 16), v18, (v19 & 1) == 0))
      {
        if (!a4)
        {
          v25 = 0;
          goto LABEL_25;
        }
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BE80D88];
        v30 = *MEMORY[0x24BDD0FD8];
        v40[0] = CFSTR("Required client entitlement is missing");
        v31 = *MEMORY[0x24BE80D80];
        v39[0] = v30;
        v39[1] = v31;
        objc_msgSend(a1, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 2, v32);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(a1, "attributes", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (!v21)
        {
          v25 = 1;
          goto LABEL_24;
        }
        v22 = v21;
        v23 = *(_QWORD *)v35;
LABEL_9:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "isValidForContext:withError:", v6, a4))break;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            v25 = 1;
            if (v22)
              goto LABEL_9;
            goto LABEL_24;
          }
        }
      }
      v25 = 0;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE80D88];
      v26 = *MEMORY[0x24BDD0FD8];
      v42[0] = CFSTR("Hereditary grants must specify a target environment");
      v27 = *MEMORY[0x24BE80D80];
      v41[0] = v26;
      v41[1] = v27;
      objc_msgSend(a1, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v11;
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = v42;
      v14 = v41;
      goto LABEL_18;
    }
  }
  v25 = 0;
LABEL_26:

  return v25;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke;
  v12[3] = &unk_24DD46F90;
  v12[4] = a1;
  v13 = v9;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v11, v12);
  objc_msgSend(v11, "popActiveDueToInheritedEndowment");

}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
  objc_msgSend(v8, "setHasHereditaryGrant:", 1);
  objc_msgSend(a1, "sourceEnvironment");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "sourceEnvironments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke;
  v14[3] = &unk_24DD46F90;
  v14[4] = a1;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v11, v14);
  objc_msgSend(v11, "popActiveDueToInheritedEndowment");

}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "pushActiveDueToInheritedEndowment");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke;
  v12[3] = &unk_24DD46F90;
  v12[4] = a1;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v10, v12);
  objc_msgSend(v10, "popActiveDueToInheritedEndowment");

}

- (id)effectiveAttributesWithContext:()RBProcessState
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushActiveDueToInheritedEndowment");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke;
  v11[3] = &unk_24DD46FE0;
  v11[4] = a1;
  v6 = v5;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  -[RBSHereditaryGrant _withEndowmentFromContext:block:](a1, v7, v11);
  objc_msgSend(v6, "addObject:", a1);
  objc_msgSend(v7, "popActiveDueToInheritedEndowment");
  v8 = v13;
  v9 = v6;

  return v9;
}

@end
