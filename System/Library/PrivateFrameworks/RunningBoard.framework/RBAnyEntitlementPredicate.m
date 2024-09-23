@implementation RBAnyEntitlementPredicate

- (RBAnyEntitlementPredicate)initWithArray:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSArray *v20;
  NSArray *predicate;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x24BDBCEB8];
  v14 = a3;
  objc_msgSend(v13, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke;
  v26 = &unk_24DD46E50;
  v27 = v15;
  v28 = v10;
  v29 = v11;
  v30 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v23);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v19, v23, v24, v25, v26);
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v20;

  return self;
}

void __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __objc2_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = RBAllEntitlementPredicate;
LABEL_5:
    v5 = *(void **)(a1 + 32);
    -[__objc2_class predicateForObject:forDomain:attribute:errors:](v4, "predicateForObject:forDomain:attribute:errors:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = RBAnyEntitlementPredicate;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 56))
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains entitlement value of wrong type: %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, *MEMORY[0x24BDD0FD8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    }
  }
LABEL_6:

}

- (BOOL)matchesEntitlements:(id)a3
{
  id v4;
  NSArray *predicate;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  predicate = self->_predicate;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__RBAnyEntitlementPredicate_matchesEntitlements___block_invoke;
  v8[3] = &unk_24DD46E78;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSArray enumerateObjectsUsingBlock:](predicate, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(predicate) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)predicate;
}

void __49__RBAnyEntitlementPredicate_matchesEntitlements___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v6, "matchesEntitlements:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasEntitlement:", v6))
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_6:

}

- (unint64_t)count
{
  NSArray *predicate;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  predicate = self->_predicate;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__RBAnyEntitlementPredicate_count__block_invoke;
  v5[3] = &unk_24DD46EA0;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](predicate, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__RBAnyEntitlementPredicate_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v4, "count");
  else
    v3 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v3;

}

- (id)allEntitlements
{
  void *v3;
  NSArray *predicate;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  predicate = self->_predicate;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__RBAnyEntitlementPredicate_allEntitlements__block_invoke;
  v8[3] = &unk_24DD46EC8;
  v9 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](predicate, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __44__RBAnyEntitlementPredicate_allEntitlements__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "allEntitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
  else
  {
    objc_msgSend(v4, "addObject:", v6);
  }

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NSArray componentsJoinedByString:](self->_predicate, "componentsJoinedByString:", CFSTR(" || "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("(%@)"), v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

void __70__RBAnyEntitlementPredicate_initWithArray_forDomain_attribute_errors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement value of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

@end
