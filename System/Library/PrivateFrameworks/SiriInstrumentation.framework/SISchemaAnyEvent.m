@implementation SISchemaAnyEvent

- (SISchemaAnyEvent)initWithAnyEventType:(int)a3 payload:(id)a4
{
  uint64_t v4;
  id v6;
  SISchemaAnyEvent *v7;
  SISchemaAnyEvent *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaAnyEvent;
  v7 = -[SISchemaAnyEvent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SISchemaAnyEvent setAnyEventType:](v7, "setAnyEventType:", v4);
    -[SISchemaAnyEvent setPayload:](v8, "setPayload:", v6);
  }

  return v8;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAnyEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_anyEventType = a3;
}

- (id)unwrap
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = -[SISchemaAnyEvent topLevelUnionTypeClass](self, "topLevelUnionTypeClass");
  if (v3)
  {
    v4 = [v3 alloc];
    -[SISchemaAnyEvent payload](self, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSData)payload
{
  return self->_payload;
}

- (Class)topLevelUnionTypeClass
{
  int v2;
  void *v3;

  v2 = -[SISchemaAnyEvent anyEventType](self, "anyEventType");
  v3 = 0;
  switch(v2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (Class)v3;
  }
  return (Class)v3;
}

- (int)anyEventType
{
  return self->_anyEventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)willProduceDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SISchemaAnyEvent unwrap](self, "unwrap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("payload"));

}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)unwrapMessageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SISchemaAnyEvent unwrap](self, "unwrap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "unwrapMessageWithCompletion:", v4);
  else
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);

}

- (BOOL)hasAnyEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAnyEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAnyEventType
{
  -[SISchemaAnyEvent setAnyEventType:](self, "setAnyEventType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)deletePayload
{
  -[SISchemaAnyEvent setPayload:](self, "setPayload:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnyEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaAnyEvent payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int anyEventType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (anyEventType = self->_anyEventType, anyEventType == objc_msgSend(v4, "anyEventType")))
      {
        -[SISchemaAnyEvent payload](self, "payload");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "payload");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[SISchemaAnyEvent payload](self, "payload");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[SISchemaAnyEvent payload](self, "payload");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "payload");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_anyEventType;
  else
    v2 = 0;
  return -[NSData hash](self->_payload, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SISchemaAnyEvent anyEventType](self, "anyEventType") - 1;
    if (v4 > 0x64)
      v5 = CFSTR("UNKNOWN_EVENT");
    else
      v5 = off_1E5633EC8[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anyEventType"));
  }
  if (self->_payload)
  {
    -[SISchemaAnyEvent payload](self, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("payload"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("payload"));

    }
  }
  -[SISchemaAnyEvent willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaAnyEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SISchemaAnyEvent)initWithJSON:(id)a3
{
  void *v4;
  SISchemaAnyEvent *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[SISchemaAnyEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaAnyEvent)initWithDictionary:(id)a3
{
  id v4;
  SISchemaAnyEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaAnyEvent *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaAnyEvent;
  v5 = -[SISchemaAnyEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anyEventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAnyEvent setAnyEventType:](v5, "setAnyEventType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
      -[SISchemaAnyEvent setPayload:](v5, "setPayload:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (void)setHasPayload:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

@end
