@implementation _ICLLQueueQuery

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLQueueQuery;
  -[_ICLLQueueQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLQueueQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _ICLLQueue *queue;
  void *v5;
  NSString *queueContext;
  void *v7;
  _ICLLPlaybackControlSettings *controlSettings;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  if (queue)
  {
    -[_ICLLQueue dictionaryRepresentation](queue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("queue"));

  }
  queueContext = self->_queueContext;
  if (queueContext)
    objc_msgSend(v3, "setObject:forKey:", queueContext, CFSTR("queueContext"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_revision);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("revision"));

  }
  controlSettings = self->_controlSettings;
  if (controlSettings)
  {
    -[_ICLLPlaybackControlSettings dictionaryRepresentation](controlSettings, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("controlSettings"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLQueueQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_queue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queueContext)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_controlSettings)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_ICLLQueue copyWithZone:](self->_queue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_queueContext, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_revision;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v10 = -[_ICLLPlaybackControlSettings copyWithZone:](self->_controlSettings, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _ICLLQueue *queue;
  NSString *queueContext;
  _ICLLPlaybackControlSettings *controlSettings;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  queue = self->_queue;
  if ((unint64_t)queue | *((_QWORD *)v4 + 2))
  {
    if (!-[_ICLLQueue isEqual:](queue, "isEqual:"))
      goto LABEL_13;
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](queueContext, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_revision != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  controlSettings = self->_controlSettings;
  if ((unint64_t)controlSettings | *((_QWORD *)v4 + 1))
    v8 = -[_ICLLPlaybackControlSettings isEqual:](controlSettings, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[_ICLLQueue hash](self->_queue, "hash");
  v4 = -[NSString hash](self->_queueContext, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_revision;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_ICLLPlaybackControlSettings hash](self->_controlSettings, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controlSettings, 0);
}

@end
