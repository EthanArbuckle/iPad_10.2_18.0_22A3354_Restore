@implementation RBAllEntitlementPredicate

- (RBAllEntitlementPredicate)initWithDictionary:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
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
  NSDictionary *v20;
  NSDictionary *predicate;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x24BDBCED8];
  v14 = a3;
  objc_msgSend(v13, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke;
  v26 = &unk_24DD46EF0;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v30 = v15;
  v16 = v15;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v23);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v16, v23, v24, v25, v26);
  v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v20;

  return self;
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __objc2_class *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = RBAllEntitlementPredicate;
LABEL_11:
      v16 = *(void **)(a1 + 56);
      -[__objc2_class predicateForObject:forDomain:attribute:errors:](v7, "predicateForObject:forDomain:attribute:errors:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v6, v17);

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = RBAnyEntitlementPredicate;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v6, v5);
      goto LABEL_12;
    }
    rbs_general_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains entitlement name of wrong type: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *MEMORY[0x24BDD0FD8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = &v20;
      v13 = &v19;
      goto LABEL_8;
    }
  }
  else
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2();

    if (*(_QWORD *)(a1 + 48))
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains entitlement value of wrong type: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = (void **)v22;
      v13 = &v21;
LABEL_8:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
    }
  }
LABEL_12:

}

- (BOOL)matchesEntitlements:(id)a3
{
  id v4;
  NSDictionary *predicate;
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
  v14 = 1;
  predicate = self->_predicate;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke;
  v8[3] = &unk_24DD46F18;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(predicate) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)predicate;
}

void __49__RBAllEntitlementPredicate_matchesEntitlements___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v6, "matchesEntitlements:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasEntitlement:", v6) & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_6:

}

- (unint64_t)count
{
  NSDictionary *predicate;
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
  v5[2] = __34__RBAllEntitlementPredicate_count__block_invoke;
  v5[3] = &unk_24DD46F40;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __34__RBAllEntitlementPredicate_count__block_invoke(uint64_t a1, void *a2)
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
  NSDictionary *predicate;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  predicate = self->_predicate;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__RBAllEntitlementPredicate_allEntitlements__block_invoke;
  v8[3] = &unk_24DD46F68;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](predicate, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __44__RBAllEntitlementPredicate_allEntitlements__block_invoke(uint64_t a1, void *a2)
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
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NSDictionary allKeys](self->_predicate, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" && "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("(%@)"), v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement name of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

void __75__RBAllEntitlementPredicate_initWithDictionary_forDomain_attribute_errors___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains entitlement value of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

@end
