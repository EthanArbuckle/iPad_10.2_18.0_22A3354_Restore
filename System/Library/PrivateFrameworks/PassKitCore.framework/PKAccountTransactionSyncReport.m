@implementation PKAccountTransactionSyncReport

- (PKAccountTransactionSyncReport)initWithItems:(id)a3 accountIdentifier:(id)a4
{
  id v7;
  PKAccountTransactionSyncReport *v8;
  PKAccountTransactionSyncReport *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountTransactionSyncReport;
  v8 = -[PKAccountReport initWithAccountIdentifier:reportType:](&v11, sel_initWithAccountIdentifier_reportType_, a4, 1);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_items, a3);

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountTransactionSyncReport;
  -[PKAccountReport dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PKAccountTransactionSyncReport _itemArrayRepresentation](self, "_itemArrayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelySetObject:forKey:", v5, CFSTR("transactionSyncReport"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransactionSyncReport)initWithCoder:(id)a3
{
  id v4;
  PKAccountTransactionSyncReport *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountTransactionSyncReport;
  v5 = -[PKAccountReport initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountTransactionSyncReport;
  v4 = a3;
  -[PKAccountReport encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_items, CFSTR("items"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *items;
  NSArray *v6;
  BOOL v7;
  char v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountTransactionSyncReport;
  if (-[PKAccountReport isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    items = self->_items;
    v6 = (NSArray *)v4[3];
    if (items)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
      v9 = items == v6;
    else
      v9 = -[NSArray isEqual:](items, "isEqual:");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  v7.receiver = self;
  v7.super_class = (Class)PKAccountTransactionSyncReport;
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

  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAccountTransactionSyncReport;
  v5 = -[PKAccountReport copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)_itemArrayRepresentation
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_items;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "dictionaryRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
