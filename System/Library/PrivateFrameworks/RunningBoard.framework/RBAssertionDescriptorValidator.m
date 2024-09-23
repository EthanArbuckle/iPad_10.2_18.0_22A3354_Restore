@implementation RBAssertionDescriptorValidator

- (id)_flattenedAttributesFromAttribute:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v17 = v5;
  if (a1)
  {
    objc_msgSend(v6, "domainAttributeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);
    while (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        objc_msgSend(v11, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "attributesForDomain:andName:context:withError:", v12, v13, v7, 0);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObjectsFromArray:", v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(a1, "addObject:", v10);
          goto LABEL_9;
        }
        v14 = v10;
        objc_msgSend(v14, "attributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v15);

        objc_msgSend(a1, "addObject:", v14);
      }

LABEL_9:
      objc_msgSend(v9, "removeObject:", v10);

    }
  }

  return a1;
}

- (BOOL)isAssertionValidForContext:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char isKindOfClass;
  id v23;
  char v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  SEL v48;
  RBAssertionDescriptorValidator *v49;
  id *v50;
  void *v51;
  void *v52;
  id obj;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(v7, "assertionDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originatorEntitlements");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    if (v9)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionDescriptor"));

    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originatorEntitlements"));

LABEL_5:
  objc_msgSend(v7, "bundlePropertiesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[context bundlePropertiesManager]"));

  }
  objc_msgSend(v7, "domainAttributeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[context domainAttributeManager]"));

  }
  objc_msgSend(v7, "entitlementManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBAssertionDescriptorValidator.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[context entitlementManager]"));

  }
  objc_msgSend(v7, "setAssertionDescriptionValidator:", self);
  objc_msgSend(v8, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v52 = v14;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v16)
    {
      v17 = v16;
      obj = v15;
      v48 = a2;
      v49 = self;
      v50 = a4;
      v51 = v8;
      v18 = 0;
      v19 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v56 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v54 = 0;
          v23 = v7;
          v24 = objc_msgSend(v21, "isValidForContext:withError:", v7, &v54);
          v25 = v54;
          v26 = v25;
          if ((v24 & 1) == 0)
          {
            if (!v25)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v48, v49, CFSTR("RBAssertionDescriptorValidator.m"), 86, CFSTR("attribute failed to return error for validation: %@"), v21);

            }
            v8 = v51;
            if (v50)
              *v50 = objc_retainAutorelease(v26);

            v27 = 0;
            v7 = v23;
            goto LABEL_39;
          }
          v18 |= isKindOfClass;

          v7 = v23;
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v17)
          continue;
        break;
      }

      v8 = v51;
      self = v49;
      a4 = v50;
      if ((v18 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    objc_msgSend(v8, "target");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "processIdentity");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_msgSend(v7, "acquisitionContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "allowAbstractTarget") & 1) == 0)
      {
        v32 = a4;
        v33 = v7;
        objc_msgSend(v8, "target");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "processIdentity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35
          && (objc_msgSend(v10, "hasEntitlementDomain:", 2) & 1) == 0
          && (objc_msgSend(v10, "hasEntitlementDomain:", 4) & 1) == 0)
        {
          v38 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.runningboard.targetidentities"));
          v39 = v34;
          v40 = v38;

          v7 = v33;
          a4 = v32;
          if ((v40 & 1) == 0)
          {
            if (v32)
            {
              -[RBAssertionDescriptorValidator _errorWithDescription:]((uint64_t)self, CFSTR("Client is not entitled to use identities as assertion targets"));
              v27 = 0;
              *v32 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v27 = 0;
            }
            goto LABEL_39;
          }
LABEL_38:
          -[RBAssertionDescriptorValidator _flattenedAttributesFromContext:](self, v7);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = +[RBAssertionDescriptorValidator checkConflictingAttributes:error:](RBAssertionDescriptorValidator, "checkConflictingAttributes:error:", v36, a4);

LABEL_39:
          v14 = v52;
          goto LABEL_40;
        }

        v7 = v33;
        a4 = v32;
      }

    }
    goto LABEL_38;
  }
  if (a4)
  {
    -[RBAssertionDescriptorValidator _errorWithDescription:]((uint64_t)self, CFSTR("Cannot acquire an assertion with no attributes"));
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_40:

  return v27;
}

- (id)_flattenedAttributesFromContext:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "assertionDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "attributes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[RBAssertionDescriptorValidator _flattenedAttributesFromAttribute:context:](a1, *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11), v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unionSet:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)checkConflictingAttributes:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v5;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if (v10 != *(void **)(*((_QWORD *)&v18 + 1) + 8 * j)
                && (!objc_msgSend(v10, "allowedWithAttribute:error:")
                 || !objc_msgSend(v10, "hasMandatoryAttributes:error:", v11, a4)))
              {

                v16 = 0;
                goto LABEL_21;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 1;
    }
    while (v7);
  }
  else
  {
    v16 = 1;
  }
LABEL_21:

  return v16;
}

- (id)_errorWithDescription:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE80D88];
  v9 = *MEMORY[0x24BDD0FD8];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
