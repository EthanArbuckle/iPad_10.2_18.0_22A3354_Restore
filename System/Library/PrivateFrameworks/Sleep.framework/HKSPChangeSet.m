@implementation HKSPChangeSet

- (HKSPChangeSet)init
{
  return -[HKSPChangeSet initWithChangeDictionary:](self, "initWithChangeDictionary:", MEMORY[0x1E0C9AA70]);
}

- (HKSPChangeSet)initWithChangeDictionary:(id)a3
{
  id v4;
  HKSPChangeSet *v5;
  uint64_t v6;
  NSMutableDictionary *changeDictionary;
  HKSPChangeSet *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPChangeSet;
  v5 = -[HKSPChangeSet init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    changeDictionary = v5->_changeDictionary;
    v5->_changeDictionary = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKSPChangeSet *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *changeDictionary;

  v4 = objc_alloc_init(HKSPChangeSet);
  -[HKSPChangeSet changeDictionary](self, "changeDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mutableCopy");
  changeDictionary = v4->_changeDictionary;
  v4->_changeDictionary = (NSMutableDictionary *)v6;

  return v4;
}

- (id)deepCopy
{
  HKSPChangeSet *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *changeDictionary;

  v3 = objc_alloc_init(HKSPChangeSet);
  -[NSMutableDictionary na_dictionaryByMappingValues:](self->_changeDictionary, "na_dictionaryByMappingValues:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");
  changeDictionary = v3->_changeDictionary;
  v3->_changeDictionary = (NSMutableDictionary *)v5;

  return v3;
}

uint64_t __25__HKSPChangeSet_deepCopy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "deepCopy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_changeDictionary, CFSTR("HKSPChanges"));
}

- (HKSPChangeSet)initWithCoder:(id)a3
{
  id v4;
  HKSPChangeSet *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *changeDictionary;
  HKSPChangeSet *v11;
  objc_super v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPChangeSet;
  v5 = -[HKSPChangeSet init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HKSPChanges"));
    v9 = objc_claimAutoreleasedReturnValue();
    changeDictionary = v5->_changeDictionary;
    v5->_changeDictionary = (NSMutableDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKSPChangeSet *v4;
  HKSPChangeSet *v5;
  void *v6;
  NSMutableDictionary *changeDictionary;
  HKSPChangeSet *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  HKSPChangeSet *v13;

  v4 = (HKSPChangeSet *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      changeDictionary = self->_changeDictionary;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __25__HKSPChangeSet_isEqual___block_invoke;
      v12[3] = &unk_1E4E3B0F8;
      v13 = v5;
      v8 = v5;
      v9 = (id)objc_msgSend(v6, "appendObject:counterpart:", changeDictionary, v12);
      v10 = objc_msgSend(v6, "isEqual");

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

uint64_t __25__HKSPChangeSet_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeDictionary");
}

- (void)addChange:(id)a3
{
  NSMutableDictionary *changeDictionary;
  id v4;
  void *v5;
  id v6;

  changeDictionary = self->_changeDictionary;
  v4 = a3;
  objc_msgSend(v4, "property");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](changeDictionary, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)removeAllChanges
{
  -[NSMutableDictionary removeAllObjects](self->_changeDictionary, "removeAllObjects");
}

- (void)applyChangeSet:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__HKSPChangeSet_applyChangeSet___block_invoke;
  v5[3] = &unk_1E4E3B120;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);

}

uint64_t __32__HKSPChangeSet_applyChangeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChange:", a2);
}

- (NSArray)changes
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_changeDictionary, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSSet)topLevelChangeKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_changeDictionary, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)hasChangeForPropertyIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_changeDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)changedValueForPropertyIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_changeDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)originalValueForPropertyIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_changeDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPChangeSet changes](self, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __21__HKSPChangeSet_hash__block_invoke;
  v8[3] = &unk_1E4E3B120;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  v6 = objc_msgSend(v5, "hash");
  return v6;
}

id __21__HKSPChangeSet_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

- (NSString)description
{
  return (NSString *)-[HKSPChangeSet descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPChangeSet descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPChangeSet changes](self, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v7, CFSTR("changes"), v5, 0);

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPChangeSet succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPChangeSet changes](self, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v4, "count"), CFSTR("changes"));

  return v3;
}

- (NSMutableDictionary)changeDictionary
{
  return self->_changeDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDictionary, 0);
}

@end
