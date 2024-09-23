@implementation PKPassDetailSection

- (PKPassDetailSection)initWithRows:(id)a3
{
  id v5;
  PKPassDetailSection *v6;
  PKPassDetailSection *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassDetailSection;
  v6 = -[PKPassDetailSection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rows, a3);
    -[NSArray componentsJoinedByString:](v7->_rows, "componentsJoinedByString:", CFSTR("|"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

  }
  return v7;
}

- (PKPassDetailSection)initWithDictionary:(id)a3 allowedRows:(id)a4 bundle:(id)a5 privateBundle:(id)a6
{
  id *v6;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PKPassDetailSection *v20;
  void *v21;
  uint64_t v22;
  NSString *header;
  void *v24;
  uint64_t v25;
  NSString *footer;
  uint64_t v27;
  NSString *insertAfterSection;
  void **p_identifier;
  uint64_t v30;
  void *v31;
  PKPassDetailSection *v32;
  objc_super v34;
  _QWORD v35[4];
  _QWORD v36[2];

  v11 = (unint64_t)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend((id)v11, "PKStringForKey:", CFSTR("identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("rows"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E0CB3880];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __75__PKPassDetailSection_initWithDictionary_allowedRows_bundle_privateBundle___block_invoke;
    v35[3] = &unk_1E2AD1148;
    v6 = (id *)v36;
    v36[0] = v12;
    v36[1] = v15;
    objc_msgSend(v17, "predicateWithBlock:", v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "filteredArrayUsingPredicate:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = v19;
  }
  if (!(v11 | v16))
  {
    v16 = 0;
    v32 = 0;
    if (!v12)
      goto LABEL_11;
LABEL_10:

    goto LABEL_11;
  }
  v34.receiver = self;
  v34.super_class = (Class)PKPassDetailSection;
  v20 = -[PKPassDetailSection init](&v34, sel_init);
  if (v20)
  {
    objc_msgSend((id)v11, "PKStringForKey:", CFSTR("header"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v21, v13, v14);
    v22 = objc_claimAutoreleasedReturnValue();
    header = v20->_header;
    v20->_header = (NSString *)v22;

    objc_msgSend((id)v11, "PKStringForKey:", CFSTR("footer"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v24, v13, v14);
    v25 = objc_claimAutoreleasedReturnValue();
    footer = v20->_footer;
    v20->_footer = (NSString *)v25;

    objc_msgSend((id)v11, "PKStringForKey:", CFSTR("insertAfterSection"));
    v27 = objc_claimAutoreleasedReturnValue();
    insertAfterSection = v20->_insertAfterSection;
    v20->_insertAfterSection = (NSString *)v27;

    objc_storeStrong((id *)&v20->_rows, (id)v16);
    v20->_hidden = objc_msgSend((id)v11, "PKBoolForKey:", CFSTR("hidden"));
    p_identifier = (void **)&v20->_identifier;
    objc_storeStrong((id *)&v20->_identifier, v15);
    if (!v20->_identifier)
    {
      -[NSArray componentsJoinedByString:](v20->_rows, "componentsJoinedByString:", CFSTR("|"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *p_identifier;
      *p_identifier = (void *)v30;

    }
  }
  self = v20;
  v32 = self;
  if (v12)
    goto LABEL_10;
LABEL_11:

  return v32;
}

uint64_t __75__PKPassDetailSection_initWithDictionary_allowedRows_bundle_privateBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if ((v4 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Dropping row in section %@: %@ is not expected/allowed.", (uint8_t *)&v8, 0x16u);
    }

  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_header, "hash");
  v4 = -[NSString hash](self->_footer, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_insertAfterSection, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_rows, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_identifier, "hash");
  return self->_hidden - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6) + 0x38349EF51;
}

- (PKPassDetailSection)initWithCoder:(id)a3
{
  id v4;
  PKPassDetailSection *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *footer;
  uint64_t v10;
  NSString *insertAfterSection;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *rows;
  uint64_t v17;
  NSString *identifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassDetailSection;
  v5 = -[PKPassDetailSection init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("header"));
    v6 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footer"));
    v8 = objc_claimAutoreleasedReturnValue();
    footer = v5->_footer;
    v5->_footer = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insertAfterSection"));
    v10 = objc_claimAutoreleasedReturnValue();
    insertAfterSection = v5->_insertAfterSection;
    v5->_insertAfterSection = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("rows"));
    v15 = objc_claimAutoreleasedReturnValue();
    rows = v5->_rows;
    v5->_rows = (NSArray *)v15;

    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *header;
  id v5;

  header = self->_header;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", header, CFSTR("header"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_footer, CFSTR("footer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_insertAfterSection, CFSTR("insertAfterSection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rows, CFSTR("rows"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hidden, CFSTR("hidden"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassDetailSection *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *footer;
  uint64_t v10;
  NSString *insertAfterSection;
  uint64_t v12;
  NSArray *rows;
  uint64_t v14;
  NSString *identifier;

  v5 = -[PKPassDetailSection init](+[PKPassDetailSection allocWithZone:](PKPassDetailSection, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_header, "copyWithZone:", a3);
  header = v5->_header;
  v5->_header = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_footer, "copyWithZone:", a3);
  footer = v5->_footer;
  v5->_footer = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_insertAfterSection, "copyWithZone:", a3);
  insertAfterSection = v5->_insertAfterSection;
  v5->_insertAfterSection = (NSString *)v10;

  v12 = -[NSArray copyWithZone:](self->_rows, "copyWithZone:", a3);
  rows = v5->_rows;
  v5->_rows = (NSArray *)v12;

  v5->_hidden = self->_hidden;
  v14 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v14;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("header: '%@'; "), self->_header);
  objc_msgSend(v3, "appendFormat:", CFSTR("footer: '%@'; "), self->_footer);
  objc_msgSend(v3, "appendFormat:", CFSTR("insertAfterSection: '%@'; "), self->_insertAfterSection);
  objc_msgSend(v3, "appendFormat:", CFSTR("rows: '%@'; "), self->_rows);
  if (self->_hidden)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("hidden: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@';"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_header, CFSTR("header"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_footer, CFSTR("footer"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_insertAfterSection, CFSTR("insertAfterSection"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rows, CFSTR("rows"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hidden"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (NSString)insertAfterSection
{
  return self->_insertAfterSection;
}

- (void)setInsertAfterSection:(id)a3
{
  objc_storeStrong((id *)&self->_insertAfterSection, a3);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_insertAfterSection, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
