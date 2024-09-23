@implementation POMMESSchemaPOMMESRequestEnded

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
  v9.super_class = (Class)POMMESSchemaPOMMESRequestEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESRequestEnded result](self, "result", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESRequestEnded deleteResult](self, "deleteResult");
  return v5;
}

- (void)setIsHandledByPreflight:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isHandledByPreflight = a3;
}

- (BOOL)hasIsHandledByPreflight
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsHandledByPreflight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsHandledByPreflight
{
  -[POMMESSchemaPOMMESRequestEnded setIsHandledByPreflight:](self, "setIsHandledByPreflight:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteResult
{
  -[POMMESSchemaPOMMESRequestEnded setResult:](self, "setResult:", 0);
}

- (BOOL)hasPreflightClientHandlerIdentifier
{
  return self->_preflightClientHandlerIdentifier != 0;
}

- (void)deletePreflightClientHandlerIdentifier
{
  -[POMMESSchemaPOMMESRequestEnded setPreflightClientHandlerIdentifier:](self, "setPreflightClientHandlerIdentifier:", 0);
}

- (void)setPommesSearchReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pommesSearchReason = a3;
}

- (BOOL)hasPommesSearchReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPommesSearchReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePommesSearchReason
{
  -[POMMESSchemaPOMMESRequestEnded setPommesSearchReason:](self, "setPommesSearchReason:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[POMMESSchemaPOMMESRequestEnded result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POMMESSchemaPOMMESRequestEnded result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESRequestEnded preflightClientHandlerIdentifier](self, "preflightClientHandlerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isHandledByPreflight;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v20;
  unsigned int pommesSearchReason;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[36] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isHandledByPreflight = self->_isHandledByPreflight;
    if (isHandledByPreflight != objc_msgSend(v4, "isHandledByPreflight"))
      goto LABEL_15;
  }
  -[POMMESSchemaPOMMESRequestEnded result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[POMMESSchemaPOMMESRequestEnded result](self, "result");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESRequestEnded result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESRequestEnded preflightClientHandlerIdentifier](self, "preflightClientHandlerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preflightClientHandlerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[POMMESSchemaPOMMESRequestEnded preflightClientHandlerIdentifier](self, "preflightClientHandlerIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[POMMESSchemaPOMMESRequestEnded preflightClientHandlerIdentifier](self, "preflightClientHandlerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preflightClientHandlerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  v20 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20
      || (pommesSearchReason = self->_pommesSearchReason,
          pommesSearchReason == objc_msgSend(v4, "pommesSearchReason")))
    {
      v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isHandledByPreflight;
  else
    v3 = 0;
  v4 = -[POMMESSchemaPOMMESRequestResult hash](self->_result, "hash");
  v5 = -[NSString hash](self->_preflightClientHandlerIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_pommesSearchReason;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESRequestEnded isHandledByPreflight](self, "isHandledByPreflight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isHandledByPreflight"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESRequestEnded pommesSearchReason](self, "pommesSearchReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pommesSearchReason"));

  }
  if (self->_preflightClientHandlerIdentifier)
  {
    -[POMMESSchemaPOMMESRequestEnded preflightClientHandlerIdentifier](self, "preflightClientHandlerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("preflightClientHandlerIdentifier"));

  }
  if (self->_result)
  {
    -[POMMESSchemaPOMMESRequestEnded result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("result"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("result"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESRequestEnded *v5;
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
    self = -[POMMESSchemaPOMMESRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESRequestEnded *v5;
  void *v6;
  void *v7;
  POMMESSchemaPOMMESRequestResult *v8;
  void *v9;
  void *v10;
  void *v11;
  POMMESSchemaPOMMESRequestEnded *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)POMMESSchemaPOMMESRequestEnded;
  v5 = -[POMMESSchemaPOMMESRequestEnded init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHandledByPreflight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESRequestEnded setIsHandledByPreflight:](v5, "setIsHandledByPreflight:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[POMMESSchemaPOMMESRequestResult initWithDictionary:]([POMMESSchemaPOMMESRequestResult alloc], "initWithDictionary:", v7);
      -[POMMESSchemaPOMMESRequestEnded setResult:](v5, "setResult:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preflightClientHandlerIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[POMMESSchemaPOMMESRequestEnded setPreflightClientHandlerIdentifier:](v5, "setPreflightClientHandlerIdentifier:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesSearchReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESRequestEnded setPommesSearchReason:](v5, "setPommesSearchReason:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (BOOL)isHandledByPreflight
{
  return self->_isHandledByPreflight;
}

- (POMMESSchemaPOMMESRequestResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)preflightClientHandlerIdentifier
{
  return self->_preflightClientHandlerIdentifier;
}

- (void)setPreflightClientHandlerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)pommesSearchReason
{
  return self->_pommesSearchReason;
}

- (void)setHasResult:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPreflightClientHandlerIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightClientHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
