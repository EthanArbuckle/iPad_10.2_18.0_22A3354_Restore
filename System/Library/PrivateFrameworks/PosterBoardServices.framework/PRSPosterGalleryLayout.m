@implementation PRSPosterGalleryLayout

- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4
{
  return -[PRSPosterGalleryLayout initWithSections:locale:source:](self, "initWithSections:locale:source:", a3, a4, 0);
}

- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4 source:(int64_t)a5
{
  id v8;
  id v9;
  PRSPosterGalleryLayout *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSLocale *v14;
  NSLocale *locale;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterGalleryLayout;
  v10 = -[PRSPosterGalleryLayout init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_sections, v13);

    if (v9)
    {
      v14 = (NSLocale *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v14 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    }
    locale = v10->_locale;
    v10->_locale = v14;

    v10->_source = a5;
  }

  return v10;
}

- (PRSPosterGalleryLayout)initWithProactiveRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PRSPosterGalleryLayout *v9;

  v4 = a3;
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "source");

  v9 = -[PRSPosterGalleryLayout initWithSections:locale:source:](self, "initWithSections:locale:source:", v6, v7, v8 != 0);
  return v9;
}

uint64_t __58__PRSPosterGalleryLayout_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E08]), "initWithPosterBoardRepresentation:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSections:locale:source:", self->_sections, self->_locale, self->_source);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGalleryLayout *v4;
  uint64_t v5;
  PRSPosterGalleryLayout *v6;
  PRSPosterGalleryLayout *v7;
  char v8;
  PRSPosterGalleryLayout *v9;
  void *v10;
  NSArray *sections;
  uint64_t v12;
  PRSPosterGalleryLayout *v13;
  id v14;
  NSLocale *locale;
  PRSPosterGalleryLayout *v16;
  id v17;
  int64_t source;
  id v19;
  _QWORD v21[4];
  PRSPosterGalleryLayout *v22;
  _QWORD v23[4];
  PRSPosterGalleryLayout *v24;
  _QWORD v25[4];
  PRSPosterGalleryLayout *v26;

  v4 = (PRSPosterGalleryLayout *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sections = self->_sections;
      v12 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke;
      v25[3] = &unk_1E4D426A0;
      v13 = v9;
      v26 = v13;
      v14 = (id)objc_msgSend(v10, "appendObject:counterpart:", sections, v25);
      locale = self->_locale;
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke_2;
      v23[3] = &unk_1E4D426A0;
      v16 = v13;
      v24 = v16;
      v17 = (id)objc_msgSend(v10, "appendObject:counterpart:", locale, v23);
      source = self->_source;
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke_3;
      v21[3] = &unk_1E4D426F0;
      v22 = v16;
      v19 = (id)objc_msgSend(v10, "appendInteger:counterpart:", source, v21);
      v8 = objc_msgSend(v10, "isEqual");

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __34__PRSPosterGalleryLayout_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __34__PRSPosterGalleryLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __34__PRSPosterGalleryLayout_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8++), (_QWORD)v14);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = (id)objc_msgSend(v3, "appendObject:", self->_locale);
  v11 = (id)objc_msgSend(v3, "appendInteger:", self->_source);
  v12 = objc_msgSend(v3, "hash");

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryLayout)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PRSPosterGalleryLayout *v13;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_sections);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_locale);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_source);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  v13 = -[PRSPosterGalleryLayout initWithSections:locale:source:](self, "initWithSections:locale:source:", v7, v10, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sections;
  id v5;
  void *v6;
  NSLocale *locale;
  void *v8;
  int64_t source;
  id v10;

  sections = self->_sections;
  v5 = a3;
  NSStringFromSelector(sel_sections);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sections, v6);

  locale = self->_locale;
  NSStringFromSelector(sel_locale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", locale, v8);

  source = self->_source;
  NSStringFromSelector(sel_source);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", source, v10);

}

- (NSArray)sections
{
  return self->_sections;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
