@implementation PKApplyFooterContent

- (PKApplyFooterContent)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKApplyFooterContent *v6;
  PKApplyFooterContent *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PKApplyFooterContentLink *v16;
  PKApplyFooterContentLink *v17;
  uint64_t v18;
  NSArray *links;
  PKApplyFooterContent *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("footerText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v26.receiver = self;
    v26.super_class = (Class)PKApplyFooterContent;
    v6 = -[PKApplyFooterContent init](&v26, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_footerText, v5);
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("links"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            v16 = [PKApplyFooterContentLink alloc];
            v17 = -[PKApplyFooterContentLink initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v22);
            objc_msgSend(v9, "safelyAddObject:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v12);
      }

      if (objc_msgSend(v9, "count"))
      {
        v18 = objc_msgSend(v9, "copy");
        links = v7->_links;
        v7->_links = (NSArray *)v18;
      }
      else
      {
        links = v7->_links;
        v7->_links = 0;
      }

    }
    self = v7;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_footerText, CFSTR("footerText"));
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_links, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_230);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("links"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

uint64_t __48__PKApplyFooterContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)termsIdentifiers
{
  id v3;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_links;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "termsIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pk_safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = (void *)objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKApplyFooterContent *v4;
  PKApplyFooterContent *v5;
  PKApplyFooterContent *v6;
  NSString *footerText;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;
  NSArray *links;
  NSArray *v14;

  v4 = (PKApplyFooterContent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        footerText = v6->_footerText;
        v8 = self->_footerText;
        v9 = footerText;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

LABEL_16:
            v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_16;
        }
        links = self->_links;
        v14 = v6->_links;
        if (links && v14)
          v12 = -[NSArray isEqual:](links, "isEqual:");
        else
          v12 = links == v14;
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_footerText);
  objc_msgSend(v3, "safelyAddObject:", self->_links);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_footerText)
    objc_msgSend(v3, "appendFormat:", CFSTR("footerText: '%@'; "), self->_footerText);
  if (-[NSArray count](self->_links, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("links: '%@'; "), self->_links);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyFooterContent)initWithCoder:(id)a3
{
  id v4;
  PKApplyFooterContent *v5;
  uint64_t v6;
  NSString *footerText;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *links;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyFooterContent;
  v5 = -[PKApplyFooterContent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerText"));
    v6 = objc_claimAutoreleasedReturnValue();
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("links"));
    v11 = objc_claimAutoreleasedReturnValue();
    links = v5->_links;
    v5->_links = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *footerText;
  id v5;

  footerText = self->_footerText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", footerText, CFSTR("footerText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_links, CFSTR("links"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyFooterContent *v5;
  uint64_t v6;
  NSString *footerText;
  uint64_t v8;
  NSArray *links;

  v5 = -[PKApplyFooterContent init](+[PKApplyFooterContent allocWithZone:](PKApplyFooterContent, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_footerText, "copyWithZone:", a3);
  footerText = v5->_footerText;
  v5->_footerText = (NSString *)v6;

  v8 = -[NSArray copyWithZone:](self->_links, "copyWithZone:", a3);
  links = v5->_links;
  v5->_links = (NSArray *)v8;

  return v5;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
