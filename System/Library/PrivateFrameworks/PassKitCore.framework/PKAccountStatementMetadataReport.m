@implementation PKAccountStatementMetadataReport

- (PKAccountStatementMetadataReport)initWithItems:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5 openingDate:(id)a6 closingDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKAccountStatementMetadataReport *v17;
  PKAccountStatementMetadataReport *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountStatementMetadataReport;
  v17 = -[PKAccountReport initWithAccountIdentifier:reportType:](&v20, sel_initWithAccountIdentifier_reportType_, a4, 2);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_statementIdentifier, a5);
    objc_storeStrong((id *)&v18->_openingDate, a6);
    objc_storeStrong((id *)&v18->_closingDate, a7);
    objc_storeStrong((id *)&v18->_items, a3);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "safelySetObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  PKISO8601DateStringFromDate(self->_openingDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v4, CFSTR("openingDate"));

  PKISO8601DateStringFromDate(self->_closingDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v5, CFSTR("closingDate"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_items;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safelyAddObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "safelySetObject:forKey:", v6, CFSTR("items"));
  v17.receiver = self;
  v17.super_class = (Class)PKAccountStatementMetadataReport;
  -[PKAccountReport dictionaryRepresentation](&v17, sel_dictionaryRepresentation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "safelySetObject:forKey:", v3, CFSTR("statementMetadataReport"));
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadataReport)initWithCoder:(id)a3
{
  id v4;
  PKAccountStatementMetadataReport *v5;
  uint64_t v6;
  NSString *statementIdentifier;
  uint64_t v8;
  NSDate *openingDate;
  uint64_t v10;
  NSDate *closingDate;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *items;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountStatementMetadataReport;
  v5 = -[PKAccountReport initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("items"));
    v15 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountStatementMetadataReport;
  v4 = a3;
  -[PKAccountReport encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_items, CFSTR("items"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  NSArray *items;
  NSArray *v12;
  BOOL v13;
  char v14;
  NSDate *openingDate;
  NSDate *v16;
  NSDate *closingDate;
  NSDate *v18;
  char v19;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_27;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountStatementMetadataReport;
  if (!-[PKAccountReport isEqual:](&v21, sel_isEqual_, v4))
    goto LABEL_27;
  v5 = (void *)v4[3];
  v6 = self->_statementIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

      goto LABEL_27;
    }
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_27;
  }
  items = self->_items;
  v12 = (NSArray *)v4[6];
  if (items)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (items != v12)
      goto LABEL_27;
  }
  else
  {
    v14 = -[NSArray isEqual:](items, "isEqual:");
    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  openingDate = self->_openingDate;
  v16 = (NSDate *)v4[4];
  if (!openingDate || !v16)
  {
    if (openingDate == v16)
      goto LABEL_23;
LABEL_27:
    v19 = 0;
    goto LABEL_28;
  }
  if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
    goto LABEL_27;
LABEL_23:
  closingDate = self->_closingDate;
  v18 = (NSDate *)v4[5];
  if (closingDate && v18)
    v19 = -[NSDate isEqual:](closingDate, "isEqual:");
  else
    v19 = closingDate == v18;
LABEL_28:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_statementIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_closingDate);
  v7.receiver = self;
  v7.super_class = (Class)PKAccountStatementMetadataReport;
  v4 = -[PKAccountReport hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountReport accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), v4);

  PKAccountReportTypeToString(-[PKAccountReport reportType](self, "reportType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("reportType: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("statementIdentifier: '%@'; "), self->_statementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), self->_openingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), self->_closingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataReport;
  v5 = -[PKAccountReport copyWithZone:](&v15, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_statementIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v10 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSDate copyWithZone:](self->_closingDate, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  return v5;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end
