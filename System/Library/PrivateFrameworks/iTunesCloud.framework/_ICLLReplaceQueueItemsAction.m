@implementation _ICLLReplaceQueueItemsAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLReplaceQueueItemsAction;
  -[_ICLLReplaceQueueItemsAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLReplaceQueueItemsAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSString *preferredPlayItemId;
  _ICLLQueueQuery *queueQuery;
  void *v14;
  _ICLLAutoPlaySource *autoPlay;
  void *v16;
  _ICLLRadioSource *radio;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_revision);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("revision"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = self->_items;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("items"));
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if (preferredPlayItemId)
    objc_msgSend(v3, "setObject:forKey:", preferredPlayItemId, CFSTR("preferredPlayItemId"));
  queueQuery = self->_queueQuery;
  if (queueQuery)
  {
    -[_ICLLQueueQuery dictionaryRepresentation](queueQuery, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("queueQuery"));

  }
  autoPlay = self->_autoPlay;
  if (autoPlay)
  {
    -[_ICLLAutoPlaySource dictionaryRepresentation](autoPlay, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("autoPlay"));

  }
  radio = self->_radio;
  if (radio)
  {
    -[_ICLLRadioSource dictionaryRepresentation](radio, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("radio"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackGenerationSource);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("trackGenerationSource"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLReplaceQueueItemsActionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_items;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_preferredPlayItemId)
    PBDataWriterWriteStringField();
  if (self->_queueQuery)
    PBDataWriterWriteSubmessage();
  if (self->_autoPlay)
    PBDataWriterWriteSubmessage();
  if (self->_radio)
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
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_trackGenerationSource;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_revision;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_items;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        -[_ICLLReplaceQueueItemsAction addItems:]((uint64_t)v6, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_preferredPlayItemId, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  v16 = -[_ICLLQueueQuery copyWithZone:](self->_queueQuery, "copyWithZone:", a3);
  v17 = (void *)v6[4];
  v6[4] = v16;

  v18 = -[_ICLLAutoPlaySource copyWithZone:](self->_autoPlay, "copyWithZone:", a3);
  v19 = (void *)v6[1];
  v6[1] = v18;

  v20 = -[_ICLLRadioSource copyWithZone:](self->_radio, "copyWithZone:", a3);
  v21 = (void *)v6[5];
  v6[5] = v20;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSString *preferredPlayItemId;
  _ICLLQueueQuery *queueQuery;
  _ICLLAutoPlaySource *autoPlay;
  _ICLLRadioSource *radio;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_trackGenerationSource != *((_DWORD *)v4 + 13))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_revision != *((_DWORD *)v4 + 12))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_22;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 2) && !-[NSMutableArray isEqual:](items, "isEqual:"))
    goto LABEL_22;
  preferredPlayItemId = self->_preferredPlayItemId;
  if ((unint64_t)preferredPlayItemId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](preferredPlayItemId, "isEqual:"))
      goto LABEL_22;
  }
  queueQuery = self->_queueQuery;
  if ((unint64_t)queueQuery | *((_QWORD *)v4 + 4))
  {
    if (!-[_ICLLQueueQuery isEqual:](queueQuery, "isEqual:"))
      goto LABEL_22;
  }
  autoPlay = self->_autoPlay;
  if ((unint64_t)autoPlay | *((_QWORD *)v4 + 1))
  {
    if (!-[_ICLLAutoPlaySource isEqual:](autoPlay, "isEqual:"))
      goto LABEL_22;
  }
  radio = self->_radio;
  if ((unint64_t)radio | *((_QWORD *)v4 + 5))
    v10 = -[_ICLLRadioSource isEqual:](radio, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_trackGenerationSource;
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
  v4 = 2654435761 * self->_revision;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_items, "hash");
  v6 = -[NSString hash](self->_preferredPlayItemId, "hash");
  v7 = v5 ^ v6 ^ -[_ICLLQueueQuery hash](self->_queueQuery, "hash");
  v8 = -[_ICLLAutoPlaySource hash](self->_autoPlay, "hash");
  return v7 ^ v8 ^ -[_ICLLRadioSource hash](self->_radio, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_queueQuery, 0);
  objc_storeStrong((id *)&self->_preferredPlayItemId, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_autoPlay, 0);
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

- (void)clearOneofValuesForTrackGenerationSource
{
  void *v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 56) &= ~2u;
    *(_DWORD *)(a1 + 52) = 0;
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v3 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

  }
}

@end
