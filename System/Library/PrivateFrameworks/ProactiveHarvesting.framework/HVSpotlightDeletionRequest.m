@implementation HVSpotlightDeletionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_domainSelection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 domainSelection:(id)a4
{
  id v7;
  HVSpotlightDeletionRequest *v8;
  uint64_t v9;
  _PASDomainSelection *domainSelection;
  void *v12;

  v7 = a4;
  v8 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a3);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("HVSpotlightDeletionRequest.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainSelection"));

    }
    v9 = objc_msgSend(v7, "copy");
    domainSelection = v8->_domainSelection;
    v8->_domainSelection = (_PASDomainSelection *)v9;

  }
  return v8;
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3
{
  id v5;
  HVSpotlightDeletionRequest *v6;
  HVSpotlightDeletionRequest *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (self
    && (v12.receiver = self,
        v12.super_class = (Class)HVSpotlightDeletionRequest,
        (v6 = -[HVSpotlightDeletionRequest init](&v12, sel_init)) != 0))
  {
    v7 = v6;
    v6->_isPurge = 0;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("HVSpotlightDeletionRequest.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    }
    v8 = objc_msgSend(v5, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 incontrovertiblyDeletedUniqueIdentifiersBlock:(id)a5 purgedUniqueIdentifiersBlock:(id)a6
{
  void (**v10)(id, NSString *);
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void (**v15)(id, NSString *);

  v15 = (void (**)(id, NSString *))a3;
  v10 = (void (**)(id, NSString *))a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (self->_domainSelection)
  {
    v10[2](v10, self->_bundleIdentifier);
  }
  else if (self->_uniqueIdentifiers)
  {
    if (!self->_isPurge)
      v12 = v11;
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22074FF64](v12);
    ((void (**)(_QWORD, NSString *, NSSet *))v14)[2](v14, self->_bundleIdentifier, self->_uniqueIdentifiers);

  }
  else
  {
    v15[2](v15, self->_bundleIdentifier);
  }

}

- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 uniqueIdentifiersBlock:(id)a5
{
  -[HVSpotlightDeletionRequest accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:](self, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:", a3, a4, a5, a5);
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4
{
  id v7;
  HVSpotlightDeletionRequest *v8;
  uint64_t v9;
  NSSet *uniqueIdentifiers;
  void *v12;

  v7 = a4;
  v8 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a3);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("HVSpotlightDeletionRequest.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifiers"));

    }
    v9 = objc_msgSend(v7, "copy");
    uniqueIdentifiers = v8->_uniqueIdentifiers;
    v8->_uniqueIdentifiers = (NSSet *)v9;

  }
  return v8;
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 purgedUniqueIdentifiers:(id)a4
{
  HVSpotlightDeletionRequest *result;

  result = -[HVSpotlightDeletionRequest initWithBundleIdentifier:uniqueIdentifiers:](self, "initWithBundleIdentifier:uniqueIdentifiers:", a3, a4);
  if (result)
    result->_isPurge = 1;
  return result;
}

- (BOOL)matchesBloomFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x22074FDF0]();
  -[HVSpotlightDeletionRequest bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v6, &stru_24DD7F8A8, 0x62u, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "getWithHashes:", v7))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v8 = MEMORY[0x24BDAC760];
    v18 = &v20;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke;
    v19[3] = &unk_24DD7DE48;
    v19[4] = &v20;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_2;
    v15[3] = &unk_24DD7DE70;
    v16 = v4;
    v17 = v7;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_3;
    v11[3] = &unk_24DD7DE98;
    v14 = &v20;
    v12 = v16;
    v13 = v17;
    -[HVSpotlightDeletionRequest accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:](self, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v19, v15, v11);
    v9 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HVSpotlightDeletionRequest *v4;
  HVSpotlightDeletionRequest *v5;
  id *v6;
  id *v7;
  NSString *bundleIdentifier;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  _PASDomainSelection *domainSelection;
  _PASDomainSelection *v14;
  _PASDomainSelection *v15;
  _PASDomainSelection *v16;
  char v17;
  NSSet *uniqueIdentifiers;
  NSSet *v19;
  NSSet *v20;
  NSSet *v21;
  char v22;

  v4 = (HVSpotlightDeletionRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (!self)
        {
LABEL_20:

          goto LABEL_21;
        }
        bundleIdentifier = self->_bundleIdentifier;
        v9 = (NSString *)v6[1];
        if (bundleIdentifier == v9)
        {

        }
        else
        {
          v10 = v9;
          v11 = bundleIdentifier;
          v12 = -[NSString isEqual:](v11, "isEqual:", v10);

          if ((v12 & 1) == 0)
            goto LABEL_17;
        }
        domainSelection = self->_domainSelection;
        v14 = (_PASDomainSelection *)v7[2];
        if (domainSelection == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = domainSelection;
          v17 = -[_PASDomainSelection isEqual:](v16, "isEqual:", v15);

          if ((v17 & 1) == 0)
            goto LABEL_17;
        }
        uniqueIdentifiers = self->_uniqueIdentifiers;
        v19 = (NSSet *)v7[3];
        if (uniqueIdentifiers == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = uniqueIdentifiers;
          v22 = -[NSSet isEqual:](v21, "isEqual:", v20);

          if ((v22 & 1) == 0)
          {
LABEL_17:
            LOBYTE(self) = 0;
            goto LABEL_20;
          }
        }
        LOBYTE(self) = self->_isPurge == *((unsigned __int8 *)v7 + 32);
        goto LABEL_20;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_21:

  return (char)self;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[_PASDomainSelection hash](self->_domainSelection, "hash") - v3 + 32 * v3;
  v5 = -[NSSet hash](self->_uniqueIdentifiers, "hash");
  return self->_isPurge - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (id)description
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__HVSpotlightDeletionRequest_description__block_invoke;
  v10[3] = &unk_24DD7DE48;
  v10[4] = &v11;
  v8[4] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_2;
  v9[3] = &unk_24DD7DEC0;
  v9[4] = &v11;
  v7[4] = &v11;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_3;
  v8[3] = &unk_24DD7DEE8;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_4;
  v7[3] = &unk_24DD7DEE8;
  -[HVSpotlightDeletionRequest accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:](self, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:", v10, v9, v8, v7);
  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@ %@>"), v4, v12[5]);

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  void *v5;
  id v6;

  bundleIdentifier = self->_bundleIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", bundleIdentifier, CFSTR("b"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_domainSelection, CFSTR("d"));
  -[NSSet allObjects](self->_uniqueIdentifiers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("u"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_isPurge, CFSTR("p"));
}

- (HVSpotlightDeletionRequest)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  HVSpotlightDeletionRequest *v8;
  void *v9;
  void *v10;
  HVSpotlightDeletionRequest *v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVSpotlightDeletionRequest.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:domainSelection:](self, "initWithBundleIdentifier:domainSelection:", v6, v7);
  }
  else
  {
    objc_msgSend(v5, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("u"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v9);
      if (objc_msgSend(v5, "decodeBoolForKey:", CFSTR("p")))
        v11 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:purgedUniqueIdentifiers:](self, "initWithBundleIdentifier:purgedUniqueIdentifiers:", v6, v10);
      else
        v11 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:uniqueIdentifiers:](self, "initWithBundleIdentifier:uniqueIdentifiers:", v6, v10);
      v8 = v11;

    }
    else
    {
      v8 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v6);
    }

  }
  return v8;
}

- (id)copyWithBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v5 = MEMORY[0x24BDAC760];
  v26 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke;
  v18[3] = &unk_24DD7E968;
  v20 = &v21;
  v19 = v4;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_2;
  v15[3] = &unk_24DD7E990;
  v17 = &v21;
  v16 = v19;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_3;
  v12[3] = &unk_24DD7E9E0;
  v14 = &v21;
  v13 = v16;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_4;
  v9[3] = &unk_24DD7E9E0;
  v11 = &v21;
  v6 = v13;
  v10 = v6;
  -[HVSpotlightDeletionRequest accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:](self, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:", v18, v15, v12, v9);
  v7 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v7;
}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke(uint64_t a1)
{
  HVSpotlightDeletionRequest *v2;
  uint64_t v3;
  void *v4;

  v2 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HVSpotlightDeletionRequest *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:domainSelection:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:domainSelection:", *(_QWORD *)(a1 + 32), v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HVSpotlightDeletionRequest *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:uniqueIdentifiers:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:uniqueIdentifiers:", *(_QWORD *)(a1 + 32), v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HVSpotlightDeletionRequest *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:purgedUniqueIdentifiers:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:purgedUniqueIdentifiers:", *(_QWORD *)(a1 + 32), v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __41__HVSpotlightDeletionRequest_description__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("bundleIdentifier: %@"), v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __41__HVSpotlightDeletionRequest_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("bundleIdentifier: %@, domainSelection: %@"), v7, v6);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __41__HVSpotlightDeletionRequest_description__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("bundleIdentifier: %@, incontrovertiblyDeletedUniqueIdentifiers: %@"), v7, v6);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __41__HVSpotlightDeletionRequest_description__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("bundleIdentifier: %@, purgedUniqueIdentifiers: %@"), v7, v6);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (id)_hashArrayForBundleIdentifier:(void *)a3 xIdentifier:(unsigned __int8)a4 typeOfX:(void *)a5 inBloomFilter:(void *)a6 hashArrayForReuse:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = a2;
  v14 = objc_opt_self();
  v15 = (void *)MEMORY[0x22074FDF0](v14);
  _PASRepairString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _PASRepairString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@\n%c\n%@"), v16, a4, v17);
  _PASRepairString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "computeHashesForString:reuse:", v19, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  return v20;
}

uint64_t __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "allDomains", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * i), 0x64u, v11, *(void **)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "getWithHashes:", v12);

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_11:

}

void __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * i), 0x75u, v11, *(void **)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "getWithHashes:", v12, (_QWORD)v13);

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_11:

}

+ (void)addDeletableContentWithBundleIdentifier:(id)a3 domainIdentifier:(id)a4 uniqueIdentifier:(id)a5 toBloomFilter:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x22074FDF0]();
  +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, &stru_24DD7F8A8, 0x62u, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithHashes:", v14);
  +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, v11, 0x75u, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v12, "setWithHashes:", v15);
  if (v10)
  {
    while (1)
    {
      v17 = v15;
      v18 = (void *)MEMORY[0x22074FDF0](v16);
      +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, v10, 0x64u, v12, v15);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setWithHashes:", v15);
      v19 = objc_msgSend(v10, "rangeOfString:options:", CFSTR("."), 6);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v10, "substringToIndex:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v18);
      v10 = (id)v20;
      if (!v20)
        goto LABEL_6;
    }

    objc_autoreleasePoolPop(v18);
  }
LABEL_6:

  objc_autoreleasePoolPop(v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
