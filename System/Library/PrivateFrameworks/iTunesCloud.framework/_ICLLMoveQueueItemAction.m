@implementation _ICLLMoveQueueItemAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLMoveQueueItemAction;
  -[_ICLLMoveQueueItemAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLMoveQueueItemAction dictionaryRepresentation](self, "dictionaryRepresentation");
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
  _ICLLQueueQuery *queueQuery;
  void *v8;

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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_position);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("position"));

  }
  queueQuery = self->_queueQuery;
  if (queueQuery)
  {
    -[_ICLLQueueQuery dictionaryRepresentation](queueQuery, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("queueQuery"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLMoveQueueItemActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_queueQuery)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_revision;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_position;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  v9 = -[_ICLLQueueQuery copyWithZone:](self->_queueQuery, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *itemId;
  _ICLLQueueQuery *queueQuery;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_position != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_17;
  }
  queueQuery = self->_queueQuery;
  if ((unint64_t)queueQuery | *((_QWORD *)v4 + 3))
    v9 = -[_ICLLQueueQuery isEqual:](queueQuery, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_revision;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_itemId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_position;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_ICLLQueueQuery hash](self->_queueQuery, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueQuery, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

@end
