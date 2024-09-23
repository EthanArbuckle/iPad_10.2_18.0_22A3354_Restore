@implementation PFARepackagingExecution

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
  v16.super_class = (Class)PFARepackagingExecution;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PFARepackagingExecution deleteClockIdentifier](self, "deleteClockIdentifier");
  -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PFARepackagingExecution deleteEnvelopeStatistics](self, "deleteEnvelopeStatistics");
  -[PFARepackagingExecution result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PFARepackagingExecution deleteResult](self, "deleteResult");

  return v5;
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (void)deleteClockIdentifier
{
  -[PFARepackagingExecution setClockIdentifier:](self, "setClockIdentifier:", 0);
}

- (BOOL)hasEnvelopeStatistics
{
  return self->_envelopeStatistics != 0;
}

- (void)deleteEnvelopeStatistics
{
  -[PFARepackagingExecution setEnvelopeStatistics:](self, "setEnvelopeStatistics:", 0);
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteResult
{
  -[PFARepackagingExecution setResult:](self, "setResult:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PFARepackagingExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFARepackagingExecution result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PFARepackagingExecution result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clockIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "envelopeStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "envelopeStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PFARepackagingExecution result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PFARepackagingExecution result](self, "result");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PFARepackagingExecution result](self, "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaUUID hash](self->_clockIdentifier, "hash");
  v4 = -[PFAClockEnvelopeStatistics hash](self->_envelopeStatistics, "hash") ^ v3;
  return v4 ^ -[PFARepackagingExecutionResult hash](self->_result, "hash");
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
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clockIdentifier)
  {
    -[PFARepackagingExecution clockIdentifier](self, "clockIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clockIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clockIdentifier"));

    }
  }
  if (self->_envelopeStatistics)
  {
    -[PFARepackagingExecution envelopeStatistics](self, "envelopeStatistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("envelopeStatistics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("envelopeStatistics"));

    }
  }
  if (self->_result)
  {
    -[PFARepackagingExecution result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("result"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("result"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFARepackagingExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFARepackagingExecution)initWithJSON:(id)a3
{
  void *v4;
  PFARepackagingExecution *v5;
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
    self = -[PFARepackagingExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFARepackagingExecution)initWithDictionary:(id)a3
{
  id v4;
  PFARepackagingExecution *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PFAClockEnvelopeStatistics *v9;
  void *v10;
  PFARepackagingExecutionResult *v11;
  PFARepackagingExecution *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFARepackagingExecution;
  v5 = -[PFARepackagingExecution init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PFARepackagingExecution setClockIdentifier:](v5, "setClockIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("envelopeStatistics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PFAClockEnvelopeStatistics initWithDictionary:]([PFAClockEnvelopeStatistics alloc], "initWithDictionary:", v8);
      -[PFARepackagingExecution setEnvelopeStatistics:](v5, "setEnvelopeStatistics:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PFARepackagingExecutionResult initWithDictionary:]([PFARepackagingExecutionResult alloc], "initWithDictionary:", v10);
      -[PFARepackagingExecution setResult:](v5, "setResult:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clockIdentifier, a3);
}

- (PFAClockEnvelopeStatistics)envelopeStatistics
{
  return self->_envelopeStatistics;
}

- (void)setEnvelopeStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_envelopeStatistics, a3);
}

- (PFARepackagingExecutionResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  self->_hasClockIdentifier = a3;
}

- (void)setHasEnvelopeStatistics:(BOOL)a3
{
  self->_hasEnvelopeStatistics = a3;
}

- (void)setHasResult:(BOOL)a3
{
  self->_hasResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_envelopeStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

@end
