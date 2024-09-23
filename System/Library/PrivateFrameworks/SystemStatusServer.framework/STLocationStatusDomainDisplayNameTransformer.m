@implementation STLocationStatusDomainDisplayNameTransformer

- (id)transformedDataForData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  STAttributedEntityBatchResolving *entityResolver;
  STAttributedEntityBatchResolving *v12;
  STAttributedEntityBatchResolving *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  STAttributedEntityBatchResolving *v18;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "attributions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_map:", &__block_literal_global_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      entityResolver = self->_entityResolver;
    else
      entityResolver = 0;
    v12 = entityResolver;
    -[STAttributedEntityBatchResolving resolveEntities:](v12, "resolveEntities:", v10);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2;
    v17[3] = &unk_1E8E183B0;
    v18 = v12;
    v13 = v12;
    objc_msgSend(v9, "bs_map:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0DB0940]);
    v15 = objc_msgSend(v7, "activeDisplayModes");

    objc_msgSend(v8, "setActiveDisplayModes:", v15);
    objc_msgSend(v8, "setAttributions:", v14);

  }
  return v8;
}

id __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "activityAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __71__STLocationStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resolveEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DB0858]);
  objc_msgSend(v6, "attributedEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithAttributedEntity:activeEntity:", v8, v9);

  v11 = objc_alloc(MEMORY[0x1E0DB0908]);
  v12 = objc_msgSend(v3, "locationState");
  v13 = objc_msgSend(v3, "eligibleDisplayModes");

  v14 = (void *)objc_msgSend(v11, "initWithLocationState:activityAttribution:eligibleDisplayModes:", v12, v10, v13);
  return v14;
}

- (STLocationStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3
{
  id v5;
  STLocationStatusDomainDisplayNameTransformer *v6;
  STLocationStatusDomainDisplayNameTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STLocationStatusDomainDisplayNameTransformer;
  v6 = -[STLocationStatusDomainDisplayNameTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entityResolver, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityResolver, 0);
}

@end
