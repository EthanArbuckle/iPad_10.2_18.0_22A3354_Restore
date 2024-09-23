@implementation _PSDeferredUpdates

+ (id)deferredUpdatesWithEntries:(id)a3 specifierUpdates:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSearchEntries:specifierUpdates:invalidatedSpecifiers:", v7, v6, 0);

  return v8;
}

+ (id)deferredInvalidationUpdatesWithEntries:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSearchEntries:specifierUpdates:invalidatedSpecifiers:", v4, 0, 1);

  return v5;
}

- (_PSDeferredUpdates)initWithSearchEntries:(id)a3 specifierUpdates:(id)a4 invalidatedSpecifiers:(BOOL)a5
{
  id v8;
  id v9;
  _PSDeferredUpdates *v10;
  uint64_t v11;
  NSMutableSet *searchEntries;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PSDeferredUpdates;
  v10 = -[_PSDeferredUpdates init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
    searchEntries = v10->_searchEntries;
    v10->_searchEntries = (NSMutableSet *)v11;

    objc_storeStrong((id *)&v10->_specifierUpdates, a4);
    v10->_invalidatedSpecifiers = a5;
  }

  return v10;
}

- (NSMutableSet)searchEntries
{
  return self->_searchEntries;
}

- (void)setSearchEntries:(id)a3
{
  objc_storeStrong((id *)&self->_searchEntries, a3);
}

- (PSSpecifierUpdates)specifierUpdates
{
  return self->_specifierUpdates;
}

- (void)setSpecifierUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_specifierUpdates, a3);
}

- (BOOL)invalidatedSpecifiers
{
  return self->_invalidatedSpecifiers;
}

- (void)setInvalidatedSpecifiers:(BOOL)a3
{
  self->_invalidatedSpecifiers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierUpdates, 0);
  objc_storeStrong((id *)&self->_searchEntries, 0);
}

@end
