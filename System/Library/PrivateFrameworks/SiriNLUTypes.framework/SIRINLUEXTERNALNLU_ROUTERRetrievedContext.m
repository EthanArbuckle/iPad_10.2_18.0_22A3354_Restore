@implementation SIRINLUEXTERNALNLU_ROUTERRetrievedContext

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("CONTEXT_TYPE_UNKNOWN");
    case 50:
      return CFSTR("CONTEXT_TYPE_OTHER");
    case 1:
      v3 = CFSTR("CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTEXT_TYPE_OTHER")))
  {
    v4 = 50;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTypedValue
{
  return self->_typedValue != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERRetrievedContext;
  -[SIRINLUEXTERNALNLU_ROUTERRetrievedContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERRetrievedContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int type;
  __CFString *v5;
  SIRINLUEXTERNALNLU_ROUTERTypedValue *typedValue;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type)
    {
      if (type == 50)
      {
        v5 = CFSTR("CONTEXT_TYPE_OTHER");
      }
      else if (type == 1)
      {
        v5 = CFSTR("CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("CONTEXT_TYPE_UNKNOWN");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  typedValue = self->_typedValue;
  if (typedValue)
  {
    -[SIRINLUEXTERNALNLU_ROUTERTypedValue dictionaryRepresentation](typedValue, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("typed_value"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_typedValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_type;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_typedValue)
  {
    v5 = v4;
    objc_msgSend(v4, "setTypedValue:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_type;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[SIRINLUEXTERNALNLU_ROUTERTypedValue copyWithZone:](self->_typedValue, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALNLU_ROUTERTypedValue *typedValue;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  typedValue = self->_typedValue;
  if ((unint64_t)typedValue | *((_QWORD *)v4 + 2))
    v6 = -[SIRINLUEXTERNALNLU_ROUTERTypedValue isEqual:](typedValue, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_type;
  else
    v2 = 0;
  return -[SIRINLUEXTERNALNLU_ROUTERTypedValue hash](self->_typedValue, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  SIRINLUEXTERNALNLU_ROUTERTypedValue *typedValue;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  typedValue = self->_typedValue;
  v7 = v5[2];
  if (typedValue)
  {
    if (v7)
    {
      v8 = v5;
      -[SIRINLUEXTERNALNLU_ROUTERTypedValue mergeFrom:](typedValue, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[SIRINLUEXTERNALNLU_ROUTERRetrievedContext setTypedValue:](self, "setTypedValue:");
    goto LABEL_8;
  }

}

- (SIRINLUEXTERNALNLU_ROUTERTypedValue)typedValue
{
  return self->_typedValue;
}

- (void)setTypedValue:(id)a3
{
  objc_storeStrong((id *)&self->_typedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typedValue, 0);
}

@end
