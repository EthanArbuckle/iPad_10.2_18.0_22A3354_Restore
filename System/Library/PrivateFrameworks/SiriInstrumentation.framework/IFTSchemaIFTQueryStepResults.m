@implementation IFTSchemaIFTQueryStepResults

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTQueryStepResults;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTQueryStepResults deleteOriginProgramStatementId](self, "deleteOriginProgramStatementId");
  -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTQueryStepResults deleteQueryResults](self, "deleteQueryResults");

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTQueryStepResults setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
}

- (void)deleteOriginProgramStatementId
{
  -[IFTSchemaIFTQueryStepResults setOriginProgramStatementId:](self, "setOriginProgramStatementId:", 0);
}

- (BOOL)hasQueryResults
{
  return self->_queryResults != 0;
}

- (void)deleteQueryResults
{
  -[IFTSchemaIFTQueryStepResults setQueryResults:](self, "setQueryResults:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTQueryStepResultsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
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
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_15;
  }
  -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originProgramStatementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originProgramStatementId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryResults");
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
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[IFTSchemaIFTStatementId hash](self->_originProgramStatementId, "hash") ^ v3;
  return v4 ^ -[IFTSchemaIFTQueryResults hash](self->_queryResults, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTQueryStepResults exists](self, "exists"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exists"));

  }
  if (self->_originProgramStatementId)
  {
    -[IFTSchemaIFTQueryStepResults originProgramStatementId](self, "originProgramStatementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originProgramStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originProgramStatementId"));

    }
  }
  if (self->_queryResults)
  {
    -[IFTSchemaIFTQueryStepResults queryResults](self, "queryResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("queryResults"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("queryResults"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTQueryStepResults dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTQueryStepResults)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTQueryStepResults *v5;
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
    self = -[IFTSchemaIFTQueryStepResults initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTQueryStepResults)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTQueryStepResults *v5;
  void *v6;
  void *v7;
  IFTSchemaIFTStatementId *v8;
  void *v9;
  IFTSchemaIFTQueryResults *v10;
  IFTSchemaIFTQueryStepResults *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTQueryStepResults;
  v5 = -[IFTSchemaIFTQueryStepResults init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTQueryStepResults setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originProgramStatementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v7);
      -[IFTSchemaIFTQueryStepResults setOriginProgramStatementId:](v5, "setOriginProgramStatementId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IFTSchemaIFTQueryResults initWithDictionary:]([IFTSchemaIFTQueryResults alloc], "initWithDictionary:", v9);
      -[IFTSchemaIFTQueryStepResults setQueryResults:](v5, "setQueryResults:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (void)setOriginProgramStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_originProgramStatementId, a3);
}

- (IFTSchemaIFTQueryResults)queryResults
{
  return self->_queryResults;
}

- (void)setQueryResults:(id)a3
{
  objc_storeStrong((id *)&self->_queryResults, a3);
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasQueryResults:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResults, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
}

@end
