@implementation SIRINLUEXTERNALResponseStatus

- (int)code
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_code;
  else
    return 0;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)codeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 299)
  {
    if (a3)
    {
      if (a3 == 100)
      {
        return CFSTR("INPUT");
      }
      else if (a3 == 101)
      {
        return CFSTR("EMPTY_NLU_REQUEST");
      }
      else
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
    }
    else
    {
      return CFSTR("SUCCESS");
    }
  }
  else
  {
    switch(a3)
    {
      case 300:
        v3 = CFSTR("PROCESSING");
        return v3;
      case 301:
        result = CFSTR("INTERNAL_ERROR");
        break;
      case 302:
        result = CFSTR("INITIALISATION_ERROR");
        break;
      case 303:
        result = CFSTR("FEATURE_EXTRACTION_ERROR");
        break;
      default:
        if (a3 != 500)
          goto LABEL_17;
        result = CFSTR("COMMUNICATION");
        break;
    }
  }
  return result;
}

- (int)StringAsCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INPUT")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMPTY_NLU_REQUEST")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCESSING")) & 1) != 0)
  {
    v4 = 300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_ERROR")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INITIALISATION_ERROR")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_EXTRACTION_ERROR")) & 1) != 0)
  {
    v4 = 303;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUNICATION")))
  {
    v4 = 500;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDescriptionA
{
  return self->_descriptionA != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALResponseStatus;
  -[SIRINLUEXTERNALResponseStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALResponseStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int code;
  __CFString *v5;
  NSString *descriptionA;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    code = self->_code;
    if (code <= 299)
    {
      if (code)
      {
        if (code == 100)
        {
          v5 = CFSTR("INPUT");
        }
        else if (code == 101)
        {
          v5 = CFSTR("EMPTY_NLU_REQUEST");
        }
        else
        {
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_code);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v5 = CFSTR("SUCCESS");
      }
    }
    else
    {
      switch(code)
      {
        case 300:
          v5 = CFSTR("PROCESSING");
          break;
        case 301:
          v5 = CFSTR("INTERNAL_ERROR");
          break;
        case 302:
          v5 = CFSTR("INITIALISATION_ERROR");
          break;
        case 303:
          v5 = CFSTR("FEATURE_EXTRACTION_ERROR");
          break;
        default:
          if (code != 500)
            goto LABEL_16;
          v5 = CFSTR("COMMUNICATION");
          break;
      }
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("code"));

  }
  descriptionA = self->_descriptionA;
  if (descriptionA)
    objc_msgSend(v3, "setObject:forKey:", descriptionA, CFSTR("description_a"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALResponseStatusReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_descriptionA)
  {
    PBDataWriterWriteStringField();
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
    v4[2] = self->_code;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_descriptionA)
  {
    v5 = v4;
    objc_msgSend(v4, "setDescriptionA:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_descriptionA, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *descriptionA;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  descriptionA = self->_descriptionA;
  if ((unint64_t)descriptionA | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](descriptionA, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_code;
  else
    v2 = 0;
  return -[NSString hash](self->_descriptionA, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_code = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[SIRINLUEXTERNALResponseStatus setDescriptionA:](self, "setDescriptionA:");
    v4 = v5;
  }

}

- (NSString)descriptionA
{
  return self->_descriptionA;
}

- (void)setDescriptionA:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionA, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionA, 0);
}

@end
