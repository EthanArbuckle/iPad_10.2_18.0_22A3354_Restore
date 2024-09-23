@implementation RTISupplementalLexicon

- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconForIdentifier:(id)a4
{
  id v6;
  id v7;
  RTISupplementalLexicon *v8;
  uint64_t v9;
  TISupplementalLexicon *lexicon;
  uint64_t v11;
  NSDictionary *iconForIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTISupplementalLexicon;
  v8 = -[RTISupplementalLexicon init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    lexicon = v8->_lexicon;
    v8->_lexicon = (TISupplementalLexicon *)v9;

    v11 = objc_msgSend(v7, "copy");
    iconForIdentifier = v8->_iconForIdentifier;
    v8->_iconForIdentifier = (NSDictionary *)v11;

  }
  return v8;
}

- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconProvider:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  RTISupplementalLexicon *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  if (v7)
  {
    v21 = v6;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v7[2](v7, objc_msgSend(v16, "identifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "identifier"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKey:", v17, v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v6 = v21;
  }
  v19 = -[RTISupplementalLexicon initWithTISupplementalLexicon:iconForIdentifier:](self, "initWithTISupplementalLexicon:iconForIdentifier:", v6, v10);

  return v19;
}

- (void)enumerateSupplementalItems:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[RTISupplementalLexicon lexicon](self, "lexicon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "identifier");
          -[RTISupplementalLexicon iconForIdentifier](self, "iconForIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v4[2](v4, v11, v15);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
}

- (id)iconForIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[RTISupplementalLexicon iconForIdentifier](self, "iconForIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)identifier
{
  return -[TISupplementalLexicon identifier](self->_lexicon, "identifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lexicon, CFSTR("suppLex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_iconForIdentifier, CFSTR("iconForId"));

}

- (RTISupplementalLexicon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  if (self)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("iconForId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suppLex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[RTISupplementalLexicon initWithTISupplementalLexicon:iconForIdentifier:](self, "initWithTISupplementalLexicon:iconForIdentifier:", v9, v8);

  }
  return self;
}

- (unint64_t)hash
{
  return -[TISupplementalLexicon identifier](self->_lexicon, "identifier");
}

- (BOOL)isEqual:(id)a3
{
  RTISupplementalLexicon *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (RTISupplementalLexicon *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RTISupplementalLexicon lexicon](self, "lexicon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTISupplementalLexicon lexicon](v4, "lexicon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToSupplementalLexicon:", v6))
      {
        -[RTISupplementalLexicon iconForIdentifier](self, "iconForIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTISupplementalLexicon iconForIdentifier](v4, "iconForIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier=%llu"),
    objc_opt_class(),
    self,
    -[RTISupplementalLexicon identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTISupplementalLexicon lexicon](self, "lexicon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", lexicon=%@"), v4);

  -[RTISupplementalLexicon iconForIdentifier](self, "iconForIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", iconForIdentifier=%@>"), v5);

  return v3;
}

- (TISupplementalLexicon)lexicon
{
  return self->_lexicon;
}

- (NSDictionary)iconForIdentifier
{
  return self->_iconForIdentifier;
}

- (void)setIconForIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iconForIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconForIdentifier, 0);
  objc_storeStrong((id *)&self->_lexicon, 0);
}

@end
