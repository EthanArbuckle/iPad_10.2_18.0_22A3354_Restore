@implementation POMMESSchemaPOMMESCacheLookupEnded

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
  v9.super_class = (Class)POMMESSchemaPOMMESCacheLookupEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESCacheLookupEnded deleteResult](self, "deleteResult");
  return v5;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStatus
{
  -[POMMESSchemaPOMMESCacheLookupEnded setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasResultDomain
{
  return self->_resultDomain != 0;
}

- (void)deleteResultDomain
{
  -[POMMESSchemaPOMMESCacheLookupEnded setResultDomain:](self, "setResultDomain:", 0);
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteResult
{
  -[POMMESSchemaPOMMESCacheLookupEnded setResult:](self, "setResult:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheLookupEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[POMMESSchemaPOMMESCacheLookupEnded resultDomain](self, "resultDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int status;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_15;
  }
  -[POMMESSchemaPOMMESCacheLookupEnded resultDomain](self, "resultDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[POMMESSchemaPOMMESCacheLookupEnded resultDomain](self, "resultDomain");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESCacheLookupEnded resultDomain](self, "resultDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_resultDomain, "hash") ^ v3;
  return v4 ^ -[POMMESSchemaPOMMESCacheEntry hash](self->_result, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_result)
  {
    -[POMMESSchemaPOMMESCacheLookupEnded result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("result"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("result"));

    }
  }
  if (self->_resultDomain)
  {
    -[POMMESSchemaPOMMESCacheLookupEnded resultDomain](self, "resultDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("resultDomain"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = -[POMMESSchemaPOMMESCacheLookupEnded status](self, "status") - 1;
    if (v9 > 2)
      v10 = CFSTR("POMMESCACHELOOKUPENDEDSTATUS_UNKNOWN");
    else
      v10 = off_1E563A808[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("status"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESCacheLookupEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESCacheLookupEnded)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESCacheLookupEnded *v5;
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
    self = -[POMMESSchemaPOMMESCacheLookupEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESCacheLookupEnded)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESCacheLookupEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  POMMESSchemaPOMMESCacheEntry *v10;
  POMMESSchemaPOMMESCacheLookupEnded *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)POMMESSchemaPOMMESCacheLookupEnded;
  v5 = -[POMMESSchemaPOMMESCacheLookupEnded init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheLookupEnded setStatus:](v5, "setStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[POMMESSchemaPOMMESCacheLookupEnded setResultDomain:](v5, "setResultDomain:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[POMMESSchemaPOMMESCacheEntry initWithDictionary:]([POMMESSchemaPOMMESCacheEntry alloc], "initWithDictionary:", v9);
      -[POMMESSchemaPOMMESCacheLookupEnded setResult:](v5, "setResult:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)status
{
  return self->_status;
}

- (NSString)resultDomain
{
  return self->_resultDomain;
}

- (void)setResultDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (POMMESSchemaPOMMESCacheEntry)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setHasResultDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultDomain, 0);
}

@end
