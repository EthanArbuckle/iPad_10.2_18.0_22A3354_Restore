@implementation PKAccountScheduledPaymentList

- (PKAccountScheduledPaymentList)init
{
  return -[PKAccountScheduledPaymentList initWithScheduledPayment:](self, "initWithScheduledPayment:", 0);
}

- (PKAccountScheduledPaymentList)initWithScheduledPayment:(id)a3
{
  id v4;
  PKAccountScheduledPaymentList *v5;
  uint64_t v6;
  NSMutableArray *scheduledPayments;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountScheduledPaymentList;
  v5 = -[PKAccountScheduledPaymentList init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    scheduledPayments = v5->_scheduledPayments;
    v5->_scheduledPayments = (NSMutableArray *)v6;

    -[NSMutableArray safelyAddObject:](v5->_scheduledPayments, "safelyAddObject:", v4);
  }

  return v5;
}

- (NSArray)scheduledPayments
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_scheduledPayments, "copy");
}

- (void)addScheduledPayment:(id)a3
{
  -[NSMutableArray safelyAddObject:](self->_scheduledPayments, "safelyAddObject:", a3);
}

- (id)jsonArrayRepresentationWithCertificatesResponse:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_scheduledPayments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "jsonDictionaryRepresentationWithCertificatesResponse:", v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safelyAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)scheduledPaymentOfFundingSourceType:(int64_t)a3
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
  v4 = self->_scheduledPayments;
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
        objc_msgSend(v9, "fundingSource", (_QWORD)v14);
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

- (PKAccountScheduledPaymentList)initWithCoder:(id)a3
{
  id v4;
  PKAccountScheduledPaymentList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledPaymentList;
  v5 = -[PKAccountScheduledPaymentList init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scheduledPayments"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_scheduledPayments, CFSTR("scheduledPayments"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledPayments, 0);
}

@end
