@implementation PKAccountScheduledTransferList

- (PKAccountScheduledTransferList)init
{
  return -[PKAccountScheduledTransferList initWithScheduledTransfer:](self, "initWithScheduledTransfer:", 0);
}

- (PKAccountScheduledTransferList)initWithScheduledTransfer:(id)a3
{
  id v4;
  PKAccountScheduledTransferList *v5;
  uint64_t v6;
  NSMutableArray *scheduledTransfers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountScheduledTransferList;
  v5 = -[PKAccountScheduledTransferList init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    scheduledTransfers = v5->_scheduledTransfers;
    v5->_scheduledTransfers = (NSMutableArray *)v6;

    -[NSMutableArray safelyAddObject:](v5->_scheduledTransfers, "safelyAddObject:", v4);
  }

  return v5;
}

- (NSArray)scheduledTransfers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_scheduledTransfers, "copy");
}

- (void)addScheduledTransfer:(id)a3
{
  -[NSMutableArray safelyAddObject:](self->_scheduledTransfers, "safelyAddObject:", a3);
}

- (id)jsonArrayRepresentation
{
  void *v3;
  NSMutableArray *v4;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_scheduledTransfers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "jsonDictionaryRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)scheduledTransferOfFundingSourceType:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_scheduledTransfers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "externalAccount", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");

        if (v11 == a3)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountScheduledTransferList)initWithCoder:(id)a3
{
  id v4;
  PKAccountScheduledTransferList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledTransferList;
  v5 = -[PKAccountScheduledTransferList init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scheduledTransfers"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_scheduledTransfers, CFSTR("scheduledTransfers"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledTransfers, 0);
}

@end
