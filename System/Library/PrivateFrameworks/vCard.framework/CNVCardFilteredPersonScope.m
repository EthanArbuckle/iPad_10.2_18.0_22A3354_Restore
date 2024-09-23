@implementation CNVCardFilteredPersonScope

- (CNVCardFilteredPersonScope)initWithExcludedFields:(id)a3 options:(unint64_t)a4
{
  id v6;
  CNVCardFilteredPersonScope *v7;
  uint64_t v8;
  NSSet *excludedFields;
  CNVCardFilteredPersonScope *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNVCardFilteredPersonScope;
  v7 = -[CNVCardFilteredPersonScope init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    excludedFields = v7->_excludedFields;
    v7->_excludedFields = (NSSet *)v8;

    v7->_filterOptions = a4;
    v10 = v7;
  }

  return v7;
}

- (BOOL)isEmpty
{
  uint64_t v4;
  void *v5;

  if (-[CNVCardFilteredPersonScope filterOptions](self, "filterOptions"))
    return 0;
  v4 = *MEMORY[0x1E0D13840];
  -[CNVCardFilteredPersonScope excludedFields](self, "excludedFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  return v4;
}

- (NSSet)excludedFields
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedFields, 0);
}

@end
