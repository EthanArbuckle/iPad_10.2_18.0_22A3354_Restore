@implementation STBackgroundActivitiesStatusDomainData

- (STBackgroundActivitiesStatusDomainData)init
{
  STListData *v3;
  STDictionaryData *v4;
  STBackgroundActivitiesStatusDomainData *v5;

  v3 = objc_alloc_init(STListData);
  v4 = objc_alloc_init(STDictionaryData);
  v5 = -[STBackgroundActivitiesStatusDomainData initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:](self, "initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:", v3, v4);

  return v5;
}

- (STBackgroundActivitiesStatusDomainData)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STBackgroundActivitiesStatusDomainData *v7;

  v4 = a3;
  objc_msgSend(v4, "backgroundActivitiesAttributionListData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualDescriptorsByIdentifierDictionaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STBackgroundActivitiesStatusDomainData initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:](self, "initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:", v5, v6);
  return v7;
}

- (STBackgroundActivitiesStatusDomainData)initWithBackgroundActivitiesAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  STBackgroundActivitiesStatusDomainData *v9;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  v9 = -[STBackgroundActivitiesStatusDomainData _initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:](self, "_initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:", v7, v8);
  return v9;
}

- (id)_initWithBackgroundActivitiesAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v7;
  id v8;
  STBackgroundActivitiesStatusDomainData *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STBackgroundActivitiesStatusDomainData;
  v9 = -[STBackgroundActivitiesStatusDomainData init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backgroundActivitiesAttributionListData, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSArray)attributions
{
  void *v2;
  void *v3;

  -[STBackgroundActivitiesStatusDomainData backgroundActivitiesAttributionListData](self, "backgroundActivitiesAttributionListData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSSet)activeBackgroundActivities
{
  void *v2;
  void *v3;
  void *v4;

  -[STBackgroundActivitiesStatusDomainData attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __68__STBackgroundActivitiesStatusDomainData_activeBackgroundActivities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundActivityIdentifier");
}

- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  return -[STDictionaryData objectForKey:](self->_visualDescriptorsByIdentifierDictionaryData, "objectForKey:", a3);
}

- (NSSet)backgroundActivitiesWithVisualDescriptors
{
  void *v2;
  void *v3;
  void *v4;

  -[STBackgroundActivitiesStatusDomainData visualDescriptorsByIdentifierDictionaryData](self, "visualDescriptorsByIdentifierDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STBackgroundActivitiesStatusDomainData backgroundActivitiesAttributionListData](self, "backgroundActivitiesAttributionListData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__STBackgroundActivitiesStatusDomainData_isEqual___block_invoke;
  v20[3] = &unk_1E91E4AB0;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v20);

  -[STBackgroundActivitiesStatusDomainData visualDescriptorsByIdentifierDictionaryData](self, "visualDescriptorsByIdentifierDictionaryData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = 3221225472;
  v17 = __50__STBackgroundActivitiesStatusDomainData_isEqual___block_invoke_2;
  v18 = &unk_1E91E4AB0;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v11, &v15);

  LOBYTE(v11) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);
  return (char)v11;
}

uint64_t __50__STBackgroundActivitiesStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundActivitiesAttributionListData");
}

uint64_t __50__STBackgroundActivitiesStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visualDescriptorsByIdentifierDictionaryData");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivitiesStatusDomainData backgroundActivitiesAttributionListData](self, "backgroundActivitiesAttributionListData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STBackgroundActivitiesStatusDomainData visualDescriptorsByIdentifierDictionaryData](self, "visualDescriptorsByIdentifierDictionaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (NSString)description
{
  return (NSString *)-[STBackgroundActivitiesStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STBackgroundActivitiesStatusDomainData debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STBackgroundActivitiesStatusDomainData initWithData:](+[STMutableBackgroundActivitiesStatusDomainData allocWithZone:](STMutableBackgroundActivitiesStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBackgroundActivitiesStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STBackgroundActivitiesStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivitiesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
    v9[2] = __90__STBackgroundActivitiesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBackgroundActivitiesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __90__STBackgroundActivitiesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundActivitiesAttributionListData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("backgroundActivities"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "visualDescriptorsByIdentifierDictionaryData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("visualDescriptors"));

}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STBackgroundActivitiesStatusDomainDataDiff diffFromData:toData:](STBackgroundActivitiesStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
      v5 = (void *)-[STBackgroundActivitiesStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STBackgroundActivitiesStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[STBackgroundActivitiesStatusDomainData backgroundActivitiesAttributionListData](self, "backgroundActivitiesAttributionListData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("backgroundActivityAttributions"));

  -[STBackgroundActivitiesStatusDomainData visualDescriptorsByIdentifierDictionaryData](self, "visualDescriptorsByIdentifierDictionaryData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("visualDescriptorsByIdentifier"));

}

- (STBackgroundActivitiesStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  STBackgroundActivitiesStatusDomainData *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundActivityAttributions"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__STBackgroundActivitiesStatusDomainData_initWithCoder___block_invoke_2;
  v14[3] = &unk_1E91E6080;
  v14[4] = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v16 + 24))
    v6 = 0;
  else
    v6 = v5;
  _Block_object_dispose(&v15, 8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualDescriptorsByIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "validateObjectsAndKeysWithValidObjectClasses:keyClasses:", v8, v9);

  if (v6)
    v11 = v10;
  else
    v11 = 0;
  if (v11 == 1)
  {
    self = -[STBackgroundActivitiesStatusDomainData initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:](self, "initWithBackgroundActivitiesAttributionListData:visualDescriptorsByIdentifierDictionaryData:", v6, v7);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __56__STBackgroundActivitiesStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
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

- (STListData)backgroundActivitiesAttributionListData
{
  return self->_backgroundActivitiesAttributionListData;
}

- (STDictionaryData)visualDescriptorsByIdentifierDictionaryData
{
  return self->_visualDescriptorsByIdentifierDictionaryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDescriptorsByIdentifierDictionaryData, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesAttributionListData, 0);
}

@end
