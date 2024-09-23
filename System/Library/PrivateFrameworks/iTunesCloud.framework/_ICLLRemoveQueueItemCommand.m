@implementation _ICLLRemoveQueueItemCommand

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRemoveQueueItemCommand;
  -[_ICLLRemoveQueueItemCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLRemoveQueueItemCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *itemId;
  void *v6;
  NSMutableArray *itemIdsToRemoves;
  NSString *queueContext;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_revision);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("revision"));

  }
  itemId = self->_itemId;
  if (itemId)
    objc_msgSend(v3, "setObject:forKey:", itemId, CFSTR("itemId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_removeType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("removeType"));

  }
  itemIdsToRemoves = self->_itemIdsToRemoves;
  if (itemIdsToRemoves)
    objc_msgSend(v3, "setObject:forKey:", itemIdsToRemoves, CFSTR("itemIdsToRemove"));
  queueContext = self->_queueContext;
  if (queueContext)
    objc_msgSend(v3, "setObject:forKey:", queueContext, CFSTR("queueContext"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLRemoveQueueItemCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_itemId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_itemIdsToRemoves;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_queueContext)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_revision;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_removeType;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_itemIdsToRemoves;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v18);
        -[_ICLLRemoveQueueItemCommand addItemIdsToRemove:](v6, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_queueContext, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *itemId;
  NSMutableArray *itemIdsToRemoves;
  NSString *queueContext;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 9))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:"))
    {
LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_removeType != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_19;
  }
  itemIdsToRemoves = self->_itemIdsToRemoves;
  if ((unint64_t)itemIdsToRemoves | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](itemIdsToRemoves, "isEqual:"))
  {
    goto LABEL_19;
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((_QWORD *)v4 + 3))
    v10 = -[NSString isEqual:](queueContext, "isEqual:");
  else
    v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_revision;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_itemId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_removeType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_itemIdsToRemoves, "hash");
  return v6 ^ -[NSString hash](self->_queueContext, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_itemIdsToRemoves, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

- (void)addItemIdsToRemove:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setItemId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setQueueContext:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

@end
