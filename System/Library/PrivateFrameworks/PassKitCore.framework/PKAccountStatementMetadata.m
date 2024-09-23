@implementation PKAccountStatementMetadata

- (PKAccountStatementMetadata)initWithArray:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAccountStatementMetadata *v11;
  PKAccountStatementMetadata *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKAccountStatementMetadataItem *v19;
  uint64_t v20;
  NSArray *items;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountStatementMetadata;
  v11 = -[PKAccountStatementMetadata init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    v23 = v9;
    objc_storeStrong((id *)&v11->_accountIdentifier, a4);
    objc_storeStrong((id *)&v12->_statementIdentifier, a5);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = -[PKAccountStatementMetadataItem initWithDictionary:]([PKAccountStatementMetadataItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
          objc_msgSend(v13, "safelyAddObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      v20 = objc_msgSend(v13, "copy");
      items = v12->_items;
      v12->_items = (NSArray *)v20;
    }
    else
    {
      items = v12->_items;
      v12->_items = 0;
    }
    v9 = v23;

  }
  return v12;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "safelySetObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  PKAccountTypeToString(self->_accountType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v4, CFSTR("accountType"));

  objc_msgSend(v3, "safelySetObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  PKMediumDateString(self->_openingDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v5, CFSTR("openingDate"));

  PKMediumDateString(self->_closingDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v6, CFSTR("closingDate"));

  PKISO8601DateStringFromDate(self->_lastReportDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v7, CFSTR("lastReportDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasBeenProcessed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v8, CFSTR("hasBeenProcessed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reportCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v9, CFSTR("reportCount"));

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_items;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "dictionaryRepresentation", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "safelyAddObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v3, "safelySetObject:forKey:", v10, CFSTR("items"));
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (id)itemsMissingFromDevice
{
  return -[NSArray pk_objectsPassingTest:](self->_items, "pk_objectsPassingTest:", &__block_literal_global_60);
}

BOOL __52__PKAccountStatementMetadata_itemsMissingFromDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") != 1;
}

- (id)reportForMissingItems
{
  void *v3;
  PKAccountStatementMetadataReport *v4;

  -[PKAccountStatementMetadata itemsMissingFromDevice](self, "itemsMissingFromDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[PKAccountStatementMetadataReport initWithItems:accountIdentifier:statementIdentifier:openingDate:closingDate:]([PKAccountStatementMetadataReport alloc], "initWithItems:accountIdentifier:statementIdentifier:openingDate:closingDate:", v3, self->_accountIdentifier, self->_statementIdentifier, self->_openingDate, self->_closingDate);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadata)initWithCoder:(id)a3
{
  id v4;
  PKAccountStatementMetadata *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *statementIdentifier;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDate *closingDate;
  uint64_t v14;
  NSDate *lastReportDate;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *items;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountStatementMetadata;
  v5 = -[PKAccountStatementMetadata init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v5->_accountType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastReportDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastReportDate = v5->_lastReportDate;
    v5->_lastReportDate = (NSDate *)v14;

    v5->_hasBeenProcessed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBeenProcessed"));
    v5->_reportCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reportCount"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("items"));
    v19 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountType, CFSTR("accountType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastReportDate, CFSTR("lastReportDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBeenProcessed, CFSTR("hasBeenProcessed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reportCount, CFSTR("reportCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("items"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  _BOOL4 v12;
  BOOL v13;
  NSArray *items;
  NSArray *v16;
  NSDate *openingDate;
  NSDate *v18;
  NSDate *closingDate;
  NSDate *v20;
  NSDate *lastReportDate;
  NSDate *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v5 = (void *)v4[2];
  v6 = self->_accountIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_13;
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_14;
  }
  v10 = (void *)v4[4];
  v6 = self->_statementIdentifier;
  v11 = v10;
  if (v6 != v11)
  {
    v8 = v11;
    if (v6 && v11)
    {
      v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

      if (!v12)
        goto LABEL_14;
      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_17:
  items = self->_items;
  v16 = (NSArray *)v4[9];
  if (items && v16)
  {
    if ((-[NSArray isEqual:](items, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (items != v16)
  {
    goto LABEL_14;
  }
  openingDate = self->_openingDate;
  v18 = (NSDate *)v4[5];
  if (openingDate && v18)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (openingDate != v18)
  {
    goto LABEL_14;
  }
  closingDate = self->_closingDate;
  v20 = (NSDate *)v4[6];
  if (closingDate && v20)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (closingDate != v20)
  {
    goto LABEL_14;
  }
  lastReportDate = self->_lastReportDate;
  v22 = (NSDate *)v4[7];
  if (lastReportDate && v22)
  {
    if ((-[NSDate isEqual:](lastReportDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (lastReportDate != v22)
  {
    goto LABEL_14;
  }
  if (self->_accountType == v4[3] && self->_reportCount == v4[8])
  {
    v13 = self->_hasBeenProcessed == *((unsigned __int8 *)v4 + 8);
    goto LABEL_15;
  }
LABEL_14:
  v13 = 0;
LABEL_15:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_statementIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_closingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastReportDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_accountType - v4 + 32 * v4;
  v6 = self->_reportCount - v5 + 32 * v5;
  v7 = self->_hasBeenProcessed - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  PKAccountTypeToString(self->_accountType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountType: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("statementIdentifier: '%@'; "), self->_statementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), self->_openingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), self->_closingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastReportDate: '%@'; "), self->_lastReportDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("reportCount: %ld; "), self->_reportCount);
  if (self->_hasBeenProcessed)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasBeenProcessed: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_statementIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSDate copyWithZone:](self->_closingDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSDate copyWithZone:](self->_lastReportDate, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  *(_QWORD *)(v5 + 64) = self->_reportCount;
  *(_QWORD *)(v5 + 24) = self->_accountType;
  *(_BYTE *)(v5 + 8) = self->_hasBeenProcessed;
  return (id)v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasBeenProcessed
{
  return self->_hasBeenProcessed;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->_hasBeenProcessed = a3;
}

- (NSDate)lastReportDate
{
  return self->_lastReportDate;
}

- (void)setLastReportDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)reportCount
{
  return self->_reportCount;
}

- (void)setReportCount:(int64_t)a3
{
  self->_reportCount = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_lastReportDate, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
