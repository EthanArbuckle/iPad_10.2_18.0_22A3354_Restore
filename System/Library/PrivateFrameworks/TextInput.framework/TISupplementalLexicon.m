@implementation TISupplementalLexicon

- (TISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4
{
  id v6;
  TISupplementalLexicon *v7;
  uint64_t v8;
  NSArray *items;
  uint64_t v10;
  TISupplementalLexicon *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISupplementalLexicon;
  v7 = -[TISupplementalLexicon init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    v10 = ++generateIdentifier_count_8374;
    v7->_searchPrefixes = a4;
    v7->_identifier = v10;
    v11 = v7;
  }

  return v7;
}

- (TISupplementalLexicon)initWithItems:(id)a3
{
  return -[TISupplementalLexicon initWithItems:searchPrefixes:](self, "initWithItems:searchPrefixes:", a3, 1);
}

- (unsigned)searchPrefixCharacter
{
  unint64_t v2;

  v2 = -[TISupplementalLexicon searchPrefixes](self, "searchPrefixes");
  if (v2 == 2)
    return 35;
  else
    return (v2 == 1) << 6;
}

- (BOOL)isEqualToSupplementalLexicon:(id)a3
{
  return self->_identifier == *((_QWORD *)a3 + 3);
}

- (TISupplementalLexicon)initWithCoder:(id)a3
{
  id v4;
  TISupplementalLexicon *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  void *v11;
  TISupplementalLexicon *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TISupplementalLexicon init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_searchPrefixes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("searchPrefixes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v11, "unsignedLongLongValue");

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *items;
  id v5;
  id v6;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", items, CFSTR("items"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_searchPrefixes, CFSTR("searchPrefixes"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_identifier);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  TISupplementalLexicon *v4;
  BOOL v5;

  v4 = (TISupplementalLexicon *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TISupplementalLexicon isEqualToSupplementalLexicon:](self, "isEqualToSupplementalLexicon:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t searchPrefixes;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier=%llu"),
    objc_opt_class(),
    self,
    self->_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_searchPrefixes)
  {
    objc_msgSend(v3, "appendString:", CFSTR(", searchPrefixesScanSet="));
    searchPrefixes = self->_searchPrefixes;
    if ((searchPrefixes & 1) != 0)
    {
      objc_msgSend(v4, "appendString:", CFSTR("@"));
      searchPrefixes = self->_searchPrefixes;
    }
    if ((searchPrefixes & 2) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("#"));
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_items, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_items;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", items={ %@ }>"), v13);

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)searchPrefixes
{
  return self->_searchPrefixes;
}

- (void)setSearchPrefixes:(unint64_t)a3
{
  self->_searchPrefixes = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
