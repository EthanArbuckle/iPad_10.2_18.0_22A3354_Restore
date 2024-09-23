@implementation _ICLLPlayNowQueueItemsAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlayNowQueueItemsAction;
  -[_ICLLPlayNowQueueItemsAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlayNowQueueItemsAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *preferredPlayItemId;
  _ICLLQueueQuery *queueQuery;
  void *v16;
  _ICLLRadioSource *radioSource;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_revision);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("revision"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_position);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("position"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = self->_items;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("items"));
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if (preferredPlayItemId)
    objc_msgSend(v3, "setObject:forKey:", preferredPlayItemId, CFSTR("preferredPlayItemId"));
  queueQuery = self->_queueQuery;
  if (queueQuery)
  {
    -[_ICLLQueueQuery dictionaryRepresentation](queueQuery, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("queueQuery"));

  }
  radioSource = self->_radioSource;
  if (radioSource)
  {
    -[_ICLLRadioSource dictionaryRepresentation](radioSource, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("radioSource"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlayNowQueueItemsActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_items;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_preferredPlayItemId)
    PBDataWriterWriteStringField();
  if (self->_queueQuery)
    PBDataWriterWriteSubmessage();
  if (self->_radioSource)
    PBDataWriterWriteSubmessage();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_revision;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_position;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_items;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        -[_ICLLPlayNowQueueItemsAction addItems:]((uint64_t)v6, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_preferredPlayItemId, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  v16 = -[_ICLLQueueQuery copyWithZone:](self->_queueQuery, "copyWithZone:", a3);
  v17 = (void *)v6[4];
  v6[4] = v16;

  v18 = -[_ICLLRadioSource copyWithZone:](self->_radioSource, "copyWithZone:", a3);
  v19 = (void *)v6[5];
  v6[5] = v18;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSString *preferredPlayItemId;
  _ICLLQueueQuery *queueQuery;
  _ICLLRadioSource *radioSource;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 12))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_position != *((_DWORD *)v4 + 4))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_20;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 1) && !-[NSMutableArray isEqual:](items, "isEqual:"))
    goto LABEL_20;
  preferredPlayItemId = self->_preferredPlayItemId;
  if ((unint64_t)preferredPlayItemId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](preferredPlayItemId, "isEqual:"))
      goto LABEL_20;
  }
  queueQuery = self->_queueQuery;
  if ((unint64_t)queueQuery | *((_QWORD *)v4 + 4))
  {
    if (!-[_ICLLQueueQuery isEqual:](queueQuery, "isEqual:"))
      goto LABEL_20;
  }
  radioSource = self->_radioSource;
  if ((unint64_t)radioSource | *((_QWORD *)v4 + 5))
    v9 = -[_ICLLRadioSource isEqual:](radioSource, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_revision;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_position;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_items, "hash");
  v6 = -[NSString hash](self->_preferredPlayItemId, "hash");
  v7 = v5 ^ v6 ^ -[_ICLLQueueQuery hash](self->_queueQuery, "hash");
  return v7 ^ -[_ICLLRadioSource hash](self->_radioSource, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioSource, 0);
  objc_storeStrong((id *)&self->_queueQuery, 0);
  objc_storeStrong((id *)&self->_preferredPlayItemId, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)addItems:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
