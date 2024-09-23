@implementation STUIDataAccessStatusDomainData

uint64_t __55__STUIDataAccessStatusDomainData_activeAttributionData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRecent") ^ 1;
}

uint64_t __54__STUIDataAccessStatusDomainData__sortedAttributions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isRecent");
  v7 = objc_msgSend(v5, "isRecent");
  if (!v6 || v7)
  {
    if ((v6 | v7 ^ 1) == 1)
    {
      if (((v6 | v7) & 1) != 0)
      {
        objc_msgSend(v5, "accessEndDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accessEndDate");
      }
      else
      {
        objc_msgSend(v5, "accessStartDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accessStartDate");
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (STUIDataAccessStatusDomainData)_dataWithAttributionFilter:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  STUIDataAccessStatusDomainData *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "dataAccessAttributions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_filter:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [STUIDataAccessStatusDomainData alloc];
    if (v6)
    {
      v7 = (objc_class *)MEMORY[0x1E0DB0938];
      v8 = v5;
      v9 = objc_alloc_init(v7);
      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObjects:", v10);
      v6 = -[STUIDataAccessStatusDomainData initWithAttributionListData:](v6, "initWithAttributionListData:", v9);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (STUIDataAccessStatusDomainData)initWithAttributionListData:(id)a3
{
  void *v4;
  STUIDataAccessStatusDomainData *v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[STUIDataAccessStatusDomainData _initWithAttributionListData:](self, "_initWithAttributionListData:", v4);

  return v5;
}

- (id)_initWithAttributionListData:(id)a3
{
  id v5;
  STUIDataAccessStatusDomainData *v6;
  STUIDataAccessStatusDomainData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUIDataAccessStatusDomainData;
  v6 = -[STUIDataAccessStatusDomainData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributionListData, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomainData attributionListData](self, "attributionListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__STUIDataAccessStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E8D62FB0;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  LOBYTE(v6) = objc_msgSend(v5, "isEqual");
  return (char)v6;
}

- (NSArray)dataAccessAttributions
{
  void *v2;
  void *v3;

  -[STUIDataAccessStatusDomainData attributionListData](self, "attributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (STListData)attributionListData
{
  return self->_attributionListData;
}

- (STUIDataAccessStatusDomainData)init
{
  id v3;
  STUIDataAccessStatusDomainData *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DB08F0]);
  v4 = -[STUIDataAccessStatusDomainData initWithAttributionListData:](self, "initWithAttributionListData:", v3);

  return v4;
}

- (STUIDataAccessStatusDomainData)initWithData:(id)a3
{
  void *v4;
  STUIDataAccessStatusDomainData *v5;

  objc_msgSend(a3, "attributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUIDataAccessStatusDomainData initWithAttributionListData:](self, "initWithAttributionListData:", v4);

  return v5;
}

uint64_t __42__STUIDataAccessStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attributionListData");
}

uint64_t __55__STUIDataAccessStatusDomainData_recentAttributionData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRecent");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionListData, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
}

- (STUIDataAccessStatusDomainData)recentAttributionData
{
  return -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, &__block_literal_global_6);
}

- (STUIDataAccessStatusDomainData)activeAttributionData
{
  return -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, &__block_literal_global_5);
}

- (NSSet)attributedEntities
{
  void *v2;
  void *v3;

  -[STUIDataAccessStatusDomainData _allEntities](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)_allEntities
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "dataAccessAttributions");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bs_map:", &__block_literal_global_17);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSSet)executableIdentities
{
  void *v2;
  void *v3;
  void *v4;

  -[STUIDataAccessStatusDomainData _allEntities](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __54__STUIDataAccessStatusDomainData_executableIdentities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executableIdentity");
}

- (STUIDataAccessStatusDomainData)dataWithEntitiesThatAreSystemServices:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__STUIDataAccessStatusDomainData_dataWithEntitiesThatAreSystemServices___block_invoke;
  v4[3] = &__block_descriptor_33_e35_B16__0__STUIDataAccessAttribution_8l;
  v5 = a3;
  -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v4);
  return (STUIDataAccessStatusDomainData *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL __72__STUIDataAccessStatusDomainData_dataWithEntitiesThatAreSystemServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 32) == objc_msgSend(v3, "isSystemService");

  return v4;
}

- (STUIDataAccessStatusDomainData)dataWithAttributedEntity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__STUIDataAccessStatusDomainData_dataWithAttributedEntity___block_invoke;
  v8[3] = &unk_1E8D634C8;
  v9 = v4;
  v5 = v4;
  -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (STUIDataAccessStatusDomainData *)v6;
}

uint64_t __59__STUIDataAccessStatusDomainData_dataWithAttributedEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "matchesAttributedEntity:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (STUIDataAccessStatusDomainData)dataWithExecutableIdentity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__STUIDataAccessStatusDomainData_dataWithExecutableIdentity___block_invoke;
  v8[3] = &unk_1E8D634C8;
  v9 = v4;
  v5 = v4;
  -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (STUIDataAccessStatusDomainData *)v6;
}

uint64_t __61__STUIDataAccessStatusDomainData_dataWithExecutableIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "matchesExecutableIdentity:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (STUIDataAccessStatusDomainData)dataWithAccessType:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__STUIDataAccessStatusDomainData_dataWithAccessType___block_invoke;
  v4[3] = &__block_descriptor_40_e35_B16__0__STUIDataAccessAttribution_8l;
  v4[4] = a3;
  -[STUIDataAccessStatusDomainData _dataWithAttributionFilter:](self, v4);
  return (STUIDataAccessStatusDomainData *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL __53__STUIDataAccessStatusDomainData_dataWithAccessType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataAccessType") == *(_QWORD *)(a1 + 32);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomainData attributionListData](self, "attributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (NSString)description
{
  return (NSString *)-[STUIDataAccessStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STUIDataAccessStatusDomainData initWithData:](+[STUIMutableDataAccessStatusDomainData allocWithZone:](STUIMutableDataAccessStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIDataAccessStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIDataAccessStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[STUIDataAccessStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomainData attributionListData](self, "attributionListData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("attributions"));

  return v4;
}

uint64_t __46__STUIDataAccessStatusDomainData__allEntities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributedEntity");
}

- (NSSet)userIdentities
{
  return self->_userIdentities;
}

@end
