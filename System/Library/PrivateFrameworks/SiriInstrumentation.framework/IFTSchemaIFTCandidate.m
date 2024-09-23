@implementation IFTSchemaIFTCandidate

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
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTCandidate;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTCandidate statementId](self, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTCandidate deleteStatementId](self, "deleteStatementId");
  -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTCandidate deletePromptStatus](self, "deletePromptStatus");
  -[IFTSchemaIFTCandidate value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTCandidate deleteValue](self, "deleteValue");

  return v5;
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteStatementId
{
  -[IFTSchemaIFTCandidate setStatementId:](self, "setStatementId:", 0);
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSource
{
  -[IFTSchemaIFTCandidate setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasPromptStatus
{
  return self->_promptStatus != 0;
}

- (void)deletePromptStatus
{
  -[IFTSchemaIFTCandidate setPromptStatus:](self, "setPromptStatus:", 0);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteValue
{
  -[IFTSchemaIFTCandidate setValue:](self, "setValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCandidateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[IFTSchemaIFTCandidate statementId](self, "statementId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTCandidate statementId](self, "statementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTCandidate value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[IFTSchemaIFTCandidate value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int source;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[IFTSchemaIFTCandidate statementId](self, "statementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[IFTSchemaIFTCandidate statementId](self, "statementId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTCandidate statementId](self, "statementId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    source = self->_source;
    if (source != objc_msgSend(v4, "source"))
      goto LABEL_20;
  }
  -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promptStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promptStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[IFTSchemaIFTCandidate value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTCandidate value](self, "value");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[IFTSchemaIFTCandidate value](self, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[IFTSchemaIFTStatementId hash](self->_statementId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_source;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[IFTSchemaIFTCandidatePromptStatus hash](self->_promptStatus, "hash");
  return v5 ^ v6 ^ -[IFTSchemaIFTTypedValue hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_promptStatus)
  {
    -[IFTSchemaIFTCandidate promptStatus](self, "promptStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("promptStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("promptStatus"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[IFTSchemaIFTCandidate source](self, "source") - 1;
    if (v7 > 7)
      v8 = CFSTR("IFTCANDIDATESOURCE_UNKNOWN");
    else
      v8 = off_1E563DAC0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("source"));
  }
  if (self->_statementId)
  {
    -[IFTSchemaIFTCandidate statementId](self, "statementId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("statementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("statementId"));

    }
  }
  if (self->_value)
  {
    -[IFTSchemaIFTCandidate value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("value"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTCandidate dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTCandidate)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTCandidate *v5;
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
    self = -[IFTSchemaIFTCandidate initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTCandidate)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTCandidate *v5;
  void *v6;
  IFTSchemaIFTStatementId *v7;
  void *v8;
  void *v9;
  IFTSchemaIFTCandidatePromptStatus *v10;
  void *v11;
  IFTSchemaIFTTypedValue *v12;
  IFTSchemaIFTCandidate *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTCandidate;
  v5 = -[IFTSchemaIFTCandidate init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTCandidate setStatementId:](v5, "setStatementId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTCandidate setSource:](v5, "setSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IFTSchemaIFTCandidatePromptStatus initWithDictionary:]([IFTSchemaIFTCandidatePromptStatus alloc], "initWithDictionary:", v9);
      -[IFTSchemaIFTCandidate setPromptStatus:](v5, "setPromptStatus:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[IFTSchemaIFTTypedValue initWithDictionary:]([IFTSchemaIFTTypedValue alloc], "initWithDictionary:", v11);
      -[IFTSchemaIFTCandidate setValue:](v5, "setValue:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_statementId, a3);
}

- (int)source
{
  return self->_source;
}

- (IFTSchemaIFTCandidatePromptStatus)promptStatus
{
  return self->_promptStatus;
}

- (void)setPromptStatus:(id)a3
{
  objc_storeStrong((id *)&self->_promptStatus, a3);
}

- (IFTSchemaIFTTypedValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setHasStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPromptStatus:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_promptStatus, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

@end
