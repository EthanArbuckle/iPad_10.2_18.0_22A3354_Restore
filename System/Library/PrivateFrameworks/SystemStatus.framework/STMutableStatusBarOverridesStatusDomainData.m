@implementation STMutableStatusBarOverridesStatusDomainData

- (STMutableStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4
{
  id v6;
  void *v7;
  STMutableStatusBarOverridesStatusDomainData *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  v8 = (STMutableStatusBarOverridesStatusDomainData *)-[STStatusBarOverridesStatusDomainData _initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:]((id *)&self->super.super.isa, v6, v7);

  return v8;
}

- (void)setEntry:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableSet *editedKeys;
  NSMutableSet *v10;
  NSMutableSet *v11;
  STStatusBarData *v12;
  STStatusBarData *customOverrides;

  v6 = a4;
  v7 = a3;
  v8 = v6;
  if (self)
  {
    editedKeys = self->_editedKeys;
    if (!editedKeys)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_editedKeys;
      self->_editedKeys = v10;

      editedKeys = self->_editedKeys;
    }
    -[NSMutableSet addObject:](editedKeys, "addObject:", v8);
  }

  -[STStatusBarData dataByReplacingEntry:forKey:](self->super._customOverrides, "dataByReplacingEntry:forKey:", v7, v8);
  v12 = (STStatusBarData *)objc_claimAutoreleasedReturnValue();

  customOverrides = self->super._customOverrides;
  self->super._customOverrides = v12;

}

- (void)suppressBackgroundActivityWithIdentifier:(id)a3
{
  STListData *suppressedBackgroundActivityIdentifierListData;
  STMutableListData *v5;
  STListData *v6;
  id v7;

  v7 = a3;
  -[STMutableStatusBarOverridesStatusDomainData _addEditedIdentifier:]((uint64_t)self, v7);
  suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  if (!suppressedBackgroundActivityIdentifierListData)
  {
    v5 = objc_alloc_init(STMutableListData);
    v6 = self->super._suppressedBackgroundActivityIdentifierListData;
    self->super._suppressedBackgroundActivityIdentifierListData = &v5->super;

    suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  }
  -[STListData addObject:](suppressedBackgroundActivityIdentifierListData, "addObject:", v7);

}

- (void)_addEditedIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)stopSuppressingBackgroundActivityWithIdentifier:(id)a3
{
  STListData *suppressedBackgroundActivityIdentifierListData;
  STMutableListData *v5;
  STListData *v6;
  id v7;

  v7 = a3;
  -[STMutableStatusBarOverridesStatusDomainData _addEditedIdentifier:]((uint64_t)self, v7);
  suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  if (!suppressedBackgroundActivityIdentifierListData)
  {
    v5 = objc_alloc_init(STMutableListData);
    v6 = self->super._suppressedBackgroundActivityIdentifierListData;
    self->super._suppressedBackgroundActivityIdentifierListData = &v5->super;

    suppressedBackgroundActivityIdentifierListData = self->super._suppressedBackgroundActivityIdentifierListData;
  }
  -[STListData removeObject:](suppressedBackgroundActivityIdentifierListData, "removeObject:", v7);

}

- (NSSet)editedKeys
{
  return (NSSet *)self->_editedKeys;
}

- (NSSet)editedIdentifiers
{
  return (NSSet *)self->_editedIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STStatusBarOverridesStatusDomainData initWithData:](+[STStatusBarOverridesStatusDomainData allocWithZone:](STStatusBarOverridesStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

- (STMutableListData)suppressedBackgroundActivityIdentifierListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableStatusBarOverridesStatusDomainData;
  -[STStatusBarOverridesStatusDomainData suppressedBackgroundActivityIdentifierListData](&v3, sel_suppressedBackgroundActivityIdentifierListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedIdentifiers, 0);
  objc_storeStrong((id *)&self->_editedKeys, 0);
}

@end
