@implementation PGRelatedComputerOptions

- (PGRelatedComputerOptions)init
{
  PGRelatedComputerOptions *v2;
  uint64_t v3;
  NSSet *filteringLocalIdentifiers;
  NSString *referenceAssetIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGRelatedComputerOptions;
  v2 = -[PGRelatedComputerOptions init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    filteringLocalIdentifiers = v2->_filteringLocalIdentifiers;
    v2->_filteringLocalIdentifiers = (NSSet *)v3;

    *(_WORD *)&v2->_useDiversity = 1;
    referenceAssetIdentifier = v2->_referenceAssetIdentifier;
    v2->_fetchLimit = 64;
    v2->_referenceAssetIdentifier = 0;

  }
  return v2;
}

- (PGRelatedComputerOptions)initWithOptions:(id)a3
{
  id v4;
  PGRelatedComputerOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *referenceAssetIdentifier;

  v4 = a3;
  v5 = -[PGRelatedComputerOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionIsDiversityEnabledKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5->_useDiversity = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionFetchLimitKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v5->_fetchLimit = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionShouldIncludeContainingEventKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v5->_shouldIncludeContainingEventKey = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionFilteringLocalIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)&v5->_filteringLocalIdentifiers, v12);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHRelatedOptionReferenceAssetIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    referenceAssetIdentifier = v5->_referenceAssetIdentifier;
    v5->_referenceAssetIdentifier = (NSString *)v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PGRelatedComputerOptions *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(PGRelatedComputerOptions);
  v5 = (void *)-[NSSet copy](self->_filteringLocalIdentifiers, "copy");
  -[PGRelatedComputerOptions setFilteringLocalIdentifiers:](v4, "setFilteringLocalIdentifiers:", v5);

  -[PGRelatedComputerOptions setFetchLimit:](v4, "setFetchLimit:", self->_fetchLimit);
  -[PGRelatedComputerOptions setUseDiversity:](v4, "setUseDiversity:", self->_useDiversity);
  -[PGRelatedComputerOptions setShouldIncludeContainingEventKey:](v4, "setShouldIncludeContainingEventKey:", self->_shouldIncludeContainingEventKey);
  v6 = (void *)-[NSString copy](self->_referenceAssetIdentifier, "copy");
  -[PGRelatedComputerOptions setReferenceAssetIdentifier:](v4, "setReferenceAssetIdentifier:", v6);

  return v4;
}

- (NSSet)filteringLocalIdentifiers
{
  return self->_filteringLocalIdentifiers;
}

- (void)setFilteringLocalIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (BOOL)useDiversity
{
  return self->_useDiversity;
}

- (void)setUseDiversity:(BOOL)a3
{
  self->_useDiversity = a3;
}

- (BOOL)shouldIncludeContainingEventKey
{
  return self->_shouldIncludeContainingEventKey;
}

- (void)setShouldIncludeContainingEventKey:(BOOL)a3
{
  self->_shouldIncludeContainingEventKey = a3;
}

- (NSString)referenceAssetIdentifier
{
  return self->_referenceAssetIdentifier;
}

- (void)setReferenceAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_filteringLocalIdentifiers, 0);
}

@end
