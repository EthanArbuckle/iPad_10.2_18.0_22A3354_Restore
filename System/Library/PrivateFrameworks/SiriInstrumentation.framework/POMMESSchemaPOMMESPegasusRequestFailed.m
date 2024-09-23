@implementation POMMESSchemaPOMMESPegasusRequestFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusRequestFailed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESPegasusRequestFailed deleteRequestArguments](self, "deleteRequestArguments");
  return v5;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[POMMESSchemaPOMMESPegasusRequestFailed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasRequestArguments
{
  return self->_requestArguments != 0;
}

- (void)deleteRequestArguments
{
  -[POMMESSchemaPOMMESPegasusRequestFailed setRequestArguments:](self, "setRequestArguments:", 0);
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteErrorCode
{
  -[POMMESSchemaPOMMESPegasusRequestFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int reason;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int errorCode;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_15;
  }
  -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestArguments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_reason;
  else
    v3 = 0;
  v4 = -[POMMESSchemaPOMMESPegasusRequestArguments hash](self->_requestArguments, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusRequestFailed errorCode](self, "errorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[POMMESSchemaPOMMESPegasusRequestFailed reason](self, "reason") - 1;
    if (v6 > 4)
      v7 = CFSTR("POMMESPEGASUSREQUESTFAILUREREASON_UNKNOWN");
    else
      v7 = off_1E5633058[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));
  }
  if (self->_requestArguments)
  {
    -[POMMESSchemaPOMMESPegasusRequestFailed requestArguments](self, "requestArguments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestArguments"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requestArguments"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusRequestFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusRequestFailed)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusRequestFailed *v5;
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
    self = -[POMMESSchemaPOMMESPegasusRequestFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestFailed)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusRequestFailed *v5;
  void *v6;
  void *v7;
  POMMESSchemaPOMMESPegasusRequestArguments *v8;
  void *v9;
  POMMESSchemaPOMMESPegasusRequestFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusRequestFailed;
  v5 = -[POMMESSchemaPOMMESPegasusRequestFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestFailed setReason:](v5, "setReason:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestArguments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[POMMESSchemaPOMMESPegasusRequestArguments initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestArguments alloc], "initWithDictionary:", v7);
      -[POMMESSchemaPOMMESPegasusRequestFailed setRequestArguments:](v5, "setRequestArguments:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (int)reason
{
  return self->_reason;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments
{
  return self->_requestArguments;
}

- (void)setRequestArguments:(id)a3
{
  objc_storeStrong((id *)&self->_requestArguments, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setHasRequestArguments:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestArguments, 0);
}

@end
