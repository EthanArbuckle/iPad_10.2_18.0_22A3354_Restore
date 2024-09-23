@implementation PKActivityEvent

+ (id)eventsWithTransactions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "transactionType", (_QWORD)v15) == 3)
          v11 = off_1E2A9E368;
        else
          v11 = off_1E2A9E370;
        v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithTransaction:unread:", v10, 0);
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (PKActivityEvent)initWithIdentifier:(id)a3 date:(id)a4 unread:(BOOL)a5
{
  id v8;
  id v9;
  PKActivityEvent *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSDate *date;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKActivityEvent;
  v10 = -[PKActivityEvent init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_unread = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSDate hash](self->_date, "hash") - v3 + 32 * v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_unread);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4 + 506447;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PKActivityEvent isEqualToActivityEvent:](self, "isEqualToActivityEvent:", v4);

  return v5;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  _BYTE *v4;
  NSDate *date;
  NSDate *v6;
  NSString *identifier;
  NSString *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_unread == (v4[8] == 0))
    goto LABEL_10;
  date = self->_date;
  v6 = (NSDate *)*((_QWORD *)v4 + 4);
  if (!date || !v6)
  {
    if (date == v6)
      goto LABEL_6;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0)
    goto LABEL_10;
LABEL_6:
  identifier = self->_identifier;
  v8 = (NSString *)*((_QWORD *)v4 + 3);
  if (identifier && v8)
    v9 = -[NSString isEqual:](identifier, "isEqual:");
  else
    v9 = identifier == v8;
LABEL_11:

  return v9;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
