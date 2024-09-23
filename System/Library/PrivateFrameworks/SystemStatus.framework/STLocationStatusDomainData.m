@implementation STLocationStatusDomainData

- (NSArray)attributions
{
  void *v2;
  void *v3;

  -[STLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (STLocationStatusDomainData)initWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  STLocationStatusDomainData *v7;

  v4 = a3;
  objc_msgSend(v4, "locationAttributionListData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "activeDisplayModes");

  v7 = -[STLocationStatusDomainData initWithLocationAttributionListData:activeDisplayModes:](self, "initWithLocationAttributionListData:activeDisplayModes:", v5, v6);
  return v7;
}

- (STListData)locationAttributionListData
{
  return self->_locationAttributionListData;
}

- (unint64_t)activeDisplayModes
{
  return self->_activeDisplayModes;
}

- (id)_initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4
{
  id v7;
  STLocationStatusDomainData *v8;
  STLocationStatusDomainData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STLocationStatusDomainData;
  v8 = -[STLocationStatusDomainData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationAttributionListData, a3);
    v9->_activeDisplayModes = a4;
  }

  return v9;
}

- (STLocationStatusDomainData)initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4
{
  void *v6;
  STLocationStatusDomainData *v7;

  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = -[STLocationStatusDomainData _initWithLocationAttributionListData:activeDisplayModes:](self, "_initWithLocationAttributionListData:activeDisplayModes:", v6, a4);

  return v7;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STLocationStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STLocationStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STLocationStatusDomainData initWithData:](+[STMutableLocationStatusDomainData allocWithZone:](STMutableLocationStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STLocationStatusDomainDataDiff diffFromData:toData:](STLocationStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAttributionListData, 0);
}

uint64_t __38__STLocationStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationAttributionListData");
}

- (STLocationStatusDomainData)init
{
  STListData *v3;
  STLocationStatusDomainData *v4;

  v3 = objc_alloc_init(STListData);
  v4 = -[STLocationStatusDomainData initWithLocationAttributionListData:activeDisplayModes:](self, "initWithLocationAttributionListData:activeDisplayModes:", v3, 0);

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocationStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STLocationStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__STLocationStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __78__STLocationStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "locationAttributionListData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, 0);

  v5 = *(void **)(a1 + 32);
  STLocationStatusDomainLocationAttributionDisplayModeMaskDescription(objc_msgSend(*(id *)(a1 + 40), "activeDisplayModes"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("activeDisplayModes"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__STLocationStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E91E4AB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v19);

  v10 = -[STLocationStatusDomainData activeDisplayModes](self, "activeDisplayModes");
  v14 = v7;
  v15 = 3221225472;
  v16 = __38__STLocationStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E91E5108;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, &v14);
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

- (NSArray)locationAttributions
{
  void *v2;
  void *v3;
  void *v4;

  -[STLocationStatusDomainData attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_filter:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_map:", &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

BOOL __50__STLocationStatusDomainData_locationAttributions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationState") == 1;
}

uint64_t __50__STLocationStatusDomainData_locationAttributions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activityAttribution");
}

uint64_t __38__STLocationStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeDisplayModes");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainData activeDisplayModes](self, "activeDisplayModes"));
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STLocationStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STLocationStatusDomainData debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STLocationStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocationStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("locationAttributions"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainData activeDisplayModes](self, "activeDisplayModes"), CFSTR("activeDisplayModes"));
}

- (STLocationStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  STLocationStatusDomainData *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationAttributions"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__STLocationStatusDomainData_initWithCoder___block_invoke_2;
  v10[3] = &unk_1E91E5130;
  v10[4] = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (*((_BYTE *)v12 + 24))
    v6 = 0;
  else
    v6 = v5;
  _Block_object_dispose(&v11, 8);

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeDisplayModes"));
  if (v6)
  {
    self = -[STLocationStatusDomainData initWithLocationAttributionListData:activeDisplayModes:](self, "initWithLocationAttributionListData:activeDisplayModes:", v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __44__STLocationStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end
