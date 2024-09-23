@implementation PKPaymentSetupProductSection

- (PKPaymentSetupProductSection)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductSection *v5;
  uint64_t v6;
  NSString *localizedTitle;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKPaymentSetupProductCategory *v14;
  NSArray *categories;
  PKPaymentSetupProductSection *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupProductSection;
  v5 = -[PKPaymentSetupProductSection init](&v22, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = -[PKPaymentSetupProductCategory initWithDictionary:]([PKPaymentSetupProductCategory alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
          if (v14)
            -[NSArray addObject:](v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }
    categories = v5->_categories;
    v5->_categories = v8;

  }
  v16 = v5;
LABEL_15:

  return v16;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedTitle: '%@'; "), self->_localizedTitle);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_categories;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
