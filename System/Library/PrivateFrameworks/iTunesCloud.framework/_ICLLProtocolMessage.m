@implementation _ICLLProtocolMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLProtocolMessage;
  -[_ICLLProtocolMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLProtocolMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *traceId;
  _ICLLCommandMessage *command;
  void *v7;
  _ICLLActionMessage *action;
  void *v9;
  _ICLLErrorMessage *error;
  void *v11;
  _ICLLQueryMessage *query;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  traceId = self->_traceId;
  if (traceId)
    objc_msgSend(v3, "setObject:forKey:", traceId, CFSTR("traceId"));
  command = self->_command;
  if (command)
  {
    -[_ICLLCommandMessage dictionaryRepresentation](command, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("command"));

  }
  action = self->_action;
  if (action)
  {
    -[_ICLLActionMessage dictionaryRepresentation](action, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("action"));

  }
  error = self->_error;
  if (error)
  {
    -[_ICLLErrorMessage dictionaryRepresentation](error, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("error"));

  }
  query = self->_query;
  if (query)
  {
    -[_ICLLQueryMessage dictionaryRepresentation](query, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("query"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  int v24;
  NSString *v25;
  NSString *traceId;
  _ICLLCommandMessage *v27;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        if (v10++ >= 9)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 0u:
          v18 = 0;
          do
          {
            v19 = *v4;
            v20 = *(_QWORD *)((char *)a3 + v19);
            if (v20 == -1 || v20 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
              goto LABEL_41;
            }
            v21 = v20 + 1;
            v22 = *(char *)(*(_QWORD *)((char *)a3 + *v8) + v20);
            *(_QWORD *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0)
              break;
          }
          while (v18++ <= 8);
          goto LABEL_41;
        case 1u:
          PBReaderReadString();
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          traceId = self->_traceId;
          self->_traceId = v25;

          goto LABEL_41;
        case 2u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(_BYTE *)&self->_has |= 1u;
          self->_type = 1;
          v27 = objc_alloc_init(_ICLLCommandMessage);
          objc_storeStrong((id *)&self->_command, v27);
          if (!PBReaderPlaceMark() || (_ICLLCommandMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
            goto LABEL_45;
          goto LABEL_40;
        case 3u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(_BYTE *)&self->_has |= 1u;
          self->_type = 2;
          v27 = objc_alloc_init(_ICLLActionMessage);
          objc_storeStrong((id *)&self->_action, v27);
          if (!PBReaderPlaceMark() || (_ICLLActionMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
            goto LABEL_45;
          goto LABEL_40;
        case 4u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(_BYTE *)&self->_has |= 1u;
          self->_type = 3;
          v27 = objc_alloc_init(_ICLLErrorMessage);
          objc_storeStrong((id *)&self->_error, v27);
          if (!PBReaderPlaceMark() || (_ICLLErrorMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
            goto LABEL_45;
          goto LABEL_40;
        case 5u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(_BYTE *)&self->_has |= 1u;
          self->_type = 4;
          v27 = objc_alloc_init(_ICLLQueryMessage);
          objc_storeStrong((id *)&self->_query, v27);
          if (!PBReaderPlaceMark() || (_ICLLQueryMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
          {
LABEL_45:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_40:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_44;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_41;
      }
    }
  }
LABEL_44:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_traceId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_command)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_traceId, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[_ICLLCommandMessage copyWithZone:](self->_command, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[_ICLLActionMessage copyWithZone:](self->_action, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[_ICLLErrorMessage copyWithZone:](self->_error, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  v15 = -[_ICLLQueryMessage copyWithZone:](self->_query, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *traceId;
  _ICLLCommandMessage *command;
  _ICLLActionMessage *action;
  _ICLLErrorMessage *error;
  _ICLLQueryMessage *query;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  traceId = self->_traceId;
  if ((unint64_t)traceId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](traceId, "isEqual:"))
    goto LABEL_17;
  command = self->_command;
  if ((unint64_t)command | *((_QWORD *)v4 + 2))
  {
    if (!-[_ICLLCommandMessage isEqual:](command, "isEqual:"))
      goto LABEL_17;
  }
  action = self->_action;
  if ((unint64_t)action | *((_QWORD *)v4 + 1))
  {
    if (!-[_ICLLActionMessage isEqual:](action, "isEqual:"))
      goto LABEL_17;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 3))
  {
    if (!-[_ICLLErrorMessage isEqual:](error, "isEqual:"))
      goto LABEL_17;
  }
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 4))
    v10 = -[_ICLLQueryMessage isEqual:](query, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_traceId, "hash") ^ v3;
  v5 = -[_ICLLCommandMessage hash](self->_command, "hash");
  v6 = v4 ^ v5 ^ -[_ICLLActionMessage hash](self->_action, "hash");
  v7 = -[_ICLLErrorMessage hash](self->_error, "hash");
  return v6 ^ v7 ^ -[_ICLLQueryMessage hash](self->_query, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)clearOneofValuesForType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    *(_BYTE *)(a1 + 52) &= ~1u;
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (void)setCommand:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLProtocolMessage clearOneofValuesForType](a1);
    *(_BYTE *)(a1 + 52) |= 1u;
    *(_DWORD *)(a1 + 48) = 1;
    objc_storeStrong((id *)(a1 + 16), a2);
  }

}

- (void)setQuery:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLProtocolMessage clearOneofValuesForType](a1);
    *(_BYTE *)(a1 + 52) |= 1u;
    *(_DWORD *)(a1 + 48) = 4;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)setTraceId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

@end
