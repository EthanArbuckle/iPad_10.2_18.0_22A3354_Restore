@implementation RBAssertionStateResolver

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (id)resolveForAssertions:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[RBAssertionResolutionContext initWithAssertions:]([RBAssertionResolutionContext alloc], v4);

  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  -[RBAssertionResolutionContext setSystemState:]((uint64_t)v5, self->_systemState);
  -[RBAssertionResolutionContext resolve]((uint64_t)v5);
  return v5;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  _QWORD *v5;
  void *v6;
  RBAssertionCollection *assertionCollection;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v5 = -[RBAssertionResolutionContext initWithAssertions:]([RBAssertionResolutionContext alloc], 0);
  -[RBAssertionResolutionContext setAssertionCollection:]((uint64_t)v5, self->_assertionCollection);
  -[RBAssertionResolutionContext setProcessIndex:]((uint64_t)v5, self->_processIndex);
  -[RBAssertionResolutionContext setStateMap:]((uint64_t)v5, self->_stateMap);
  -[RBAssertionResolutionContext setDomainAttributeManager:]((uint64_t)v5, self->_domainAttributeManager);
  -[RBAssertionResolutionContext setBundlePropertiesManager:]((uint64_t)v5, self->_bundlePropertiesManager);
  -[RBAssertionResolutionContext setEntitlementManager:]((uint64_t)v5, self->_entitlementManager);
  -[RBAssertionResolutionContext setSavedEndowments:]((uint64_t)v5, self->_savedEndowments);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  assertionCollection = self->_assertionCollection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke;
  v13[3] = &unk_24DD47668;
  v16 = a3;
  v14 = v5;
  v8 = v6;
  v15 = v8;
  v9 = v5;
  -[RBAssertionCollection enumerateAssertionsWithBlock:](assertionCollection, "enumerateAssertionsWithBlock:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v15 = a2;
  if (objc_msgSend(v15, "isActive"))
  {
    objc_msgSend(v15, "target");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBAssertionResolutionContext _createContextForAssertion:](*(_QWORD **)(a1 + 32), v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2;
      v16[3] = &unk_24DD46FB8;
      v7 = v5;
      v17 = v7;
      v18 = v6;
      v8 = v6;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
      v9 = v7;

      v4 = v9;
    }
    v10 = (void *)MEMORY[0x24BE80B18];
    objc_msgSend(v15, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createRBSTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "explanation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptorWithIdentifier:target:explanation:attributes:", v11, v12, v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  }

}

void __72__RBAssertionStateResolver_assertionDescriptorsWithFlattenedAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "effectiveAttributesWithContext:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (RBAssertionCollection)assertionCollection
{
  return self->_assertionCollection;
}

- (void)setAssertionCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assertionCollection, a3);
}

- (RBProcessIndex)processIndex
{
  return self->_processIndex;
}

- (void)setProcessIndex:(id)a3
{
  objc_storeStrong((id *)&self->_processIndex, a3);
}

- (RBProcessMap)stateMap
{
  return self->_stateMap;
}

- (void)setStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_stateMap, a3);
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setDomainAttributeManager:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributeManager, a3);
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (void)setBundlePropertiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePropertiesManager, a3);
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (void)setEntitlementManager:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementManager, a3);
}

- (NSMapTable)savedEndowments
{
  return self->_savedEndowments;
}

- (void)setSavedEndowments:(id)a3
{
  objc_storeStrong((id *)&self->_savedEndowments, a3);
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_assertionCollection, 0);
}

@end
