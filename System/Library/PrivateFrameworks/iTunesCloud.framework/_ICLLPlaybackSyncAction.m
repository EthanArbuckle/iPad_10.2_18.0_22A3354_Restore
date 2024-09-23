@implementation _ICLLPlaybackSyncAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackSyncAction;
  -[_ICLLPlaybackSyncAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlaybackSyncAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *participantState;
  NSString *transportControlState;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  participantState = self->_participantState;
  if (participantState)
    objc_msgSend(v3, "setObject:forKey:", participantState, CFSTR("participantState"));
  transportControlState = self->_transportControlState;
  if (transportControlState)
    objc_msgSend(v4, "setObject:forKey:", transportControlState, CFSTR("transportControlState"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_payload);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("payload"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackSyncActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_participantState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_transportControlState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_payload;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_participantState, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_transportControlState, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *participantState;
  NSString *transportControlState;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  participantState = self->_participantState;
  if ((unint64_t)participantState | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](participantState, "isEqual:"))
  {
    goto LABEL_11;
  }
  transportControlState = self->_transportControlState;
  if ((unint64_t)transportControlState | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](transportControlState, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_payload;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_participantState, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_transportControlState, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportControlState, 0);
  objc_storeStrong((id *)&self->_participantState, 0);
}

- (void)clearOneofValuesForPayload
{
  void *v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 32) &= ~1u;
    *(_DWORD *)(a1 + 16) = 0;
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

@end
