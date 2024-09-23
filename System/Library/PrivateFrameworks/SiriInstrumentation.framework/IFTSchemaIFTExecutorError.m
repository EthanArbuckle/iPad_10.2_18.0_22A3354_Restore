@implementation IFTSchemaIFTExecutorError

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
  v9.super_class = (Class)IFTSchemaIFTExecutorError;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTExecutorError other](self, "other", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTExecutorError deleteOther](self, "deleteOther");
  return v5;
}

- (void)setOther:(id)a3
{
  self->_failedToExecute = 0;
  self->_whichOneof_Executorerror = a3 != 0;
  objc_storeStrong((id *)&self->_other, a3);
}

- (IFTSchemaIFTIntelligenceFlowError)other
{
  if (self->_whichOneof_Executorerror == 1)
    return self->_other;
  else
    return (IFTSchemaIFTIntelligenceFlowError *)0;
}

- (void)deleteOther
{
  IFTSchemaIFTIntelligenceFlowError *other;

  if (self->_whichOneof_Executorerror == 1)
  {
    self->_whichOneof_Executorerror = 0;
    other = self->_other;
    self->_other = 0;

  }
}

- (void)setFailedToExecute:(BOOL)a3
{
  IFTSchemaIFTIntelligenceFlowError *other;

  other = self->_other;
  self->_other = 0;

  self->_whichOneof_Executorerror = 2;
  self->_failedToExecute = a3;
}

- (BOOL)failedToExecute
{
  return self->_whichOneof_Executorerror == 2 && self->_failedToExecute;
}

- (void)deleteFailedToExecute
{
  if (self->_whichOneof_Executorerror == 2)
  {
    self->_whichOneof_Executorerror = 0;
    self->_failedToExecute = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTExecutorErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IFTSchemaIFTExecutorError other](self, "other");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTExecutorError other](self, "other");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_whichOneof_Executorerror == 2)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Executorerror;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int failedToExecute;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichOneof_Executorerror = self->_whichOneof_Executorerror;
    if (whichOneof_Executorerror == objc_msgSend(v4, "whichOneof_Executorerror"))
    {
      -[IFTSchemaIFTExecutorError other](self, "other");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "other");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[IFTSchemaIFTExecutorError other](self, "other");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          failedToExecute = self->_failedToExecute;
          v14 = failedToExecute == objc_msgSend(v4, "failedToExecute");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[IFTSchemaIFTExecutorError other](self, "other");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "other");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[IFTSchemaIFTIntelligenceFlowError hash](self->_other, "hash");
  if (self->_whichOneof_Executorerror == 2)
    v4 = 2654435761 * self->_failedToExecute;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_whichOneof_Executorerror == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTExecutorError failedToExecute](self, "failedToExecute"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("failedToExecute"));

  }
  if (self->_other)
  {
    -[IFTSchemaIFTExecutorError other](self, "other");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("other"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("other"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTExecutorError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTExecutorError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTExecutorError *v5;
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
    self = -[IFTSchemaIFTExecutorError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTExecutorError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTExecutorError *v5;
  void *v6;
  IFTSchemaIFTIntelligenceFlowError *v7;
  void *v8;
  IFTSchemaIFTExecutorError *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTExecutorError;
  v5 = -[IFTSchemaIFTExecutorError init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("other"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTIntelligenceFlowError initWithDictionary:]([IFTSchemaIFTIntelligenceFlowError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTExecutorError setOther:](v5, "setOther:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedToExecute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTExecutorError setFailedToExecute:](v5, "setFailedToExecute:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Executorerror
{
  return self->_whichOneof_Executorerror;
}

- (BOOL)hasOther
{
  return self->_hasOther;
}

- (void)setHasOther:(BOOL)a3
{
  self->_hasOther = a3;
}

- (BOOL)hasFailedToExecute
{
  return self->_hasFailedToExecute;
}

- (void)setHasFailedToExecute:(BOOL)a3
{
  self->_hasFailedToExecute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
}

@end
