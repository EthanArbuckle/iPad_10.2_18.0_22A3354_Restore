@implementation IFTSchemaIFTSessionCoordinatorError

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
  v13.super_class = (Class)IFTSchemaIFTSessionCoordinatorError;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTSessionCoordinatorError deleteOther](self, "deleteOther");
  -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTSessionCoordinatorError deleteFailedToWriteTranscript](self, "deleteFailedToWriteTranscript");

  return v5;
}

- (void)setOther:(id)a3
{
  IFTSchemaIFTIntelligenceFlowError *v4;
  IFTSchemaIFTIntelligenceFlowError *failedToWriteTranscript;
  IFTSchemaIFTIntelligenceFlowError *other;

  v4 = (IFTSchemaIFTIntelligenceFlowError *)a3;
  failedToWriteTranscript = self->_failedToWriteTranscript;
  self->_failedToWriteTranscript = 0;

  self->_whichOneof_Sessioncoordinatorerror = v4 != 0;
  other = self->_other;
  self->_other = v4;

}

- (IFTSchemaIFTIntelligenceFlowError)other
{
  if (self->_whichOneof_Sessioncoordinatorerror == 1)
    return self->_other;
  else
    return (IFTSchemaIFTIntelligenceFlowError *)0;
}

- (void)deleteOther
{
  IFTSchemaIFTIntelligenceFlowError *other;

  if (self->_whichOneof_Sessioncoordinatorerror == 1)
  {
    self->_whichOneof_Sessioncoordinatorerror = 0;
    other = self->_other;
    self->_other = 0;

  }
}

- (void)setFailedToWriteTranscript:(id)a3
{
  IFTSchemaIFTIntelligenceFlowError *v4;
  IFTSchemaIFTIntelligenceFlowError *other;
  IFTSchemaIFTIntelligenceFlowError *failedToWriteTranscript;

  v4 = (IFTSchemaIFTIntelligenceFlowError *)a3;
  other = self->_other;
  self->_other = 0;

  self->_whichOneof_Sessioncoordinatorerror = 2 * (v4 != 0);
  failedToWriteTranscript = self->_failedToWriteTranscript;
  self->_failedToWriteTranscript = v4;

}

- (IFTSchemaIFTIntelligenceFlowError)failedToWriteTranscript
{
  if (self->_whichOneof_Sessioncoordinatorerror == 2)
    return self->_failedToWriteTranscript;
  else
    return (IFTSchemaIFTIntelligenceFlowError *)0;
}

- (void)deleteFailedToWriteTranscript
{
  IFTSchemaIFTIntelligenceFlowError *failedToWriteTranscript;

  if (self->_whichOneof_Sessioncoordinatorerror == 2)
  {
    self->_whichOneof_Sessioncoordinatorerror = 0;
    failedToWriteTranscript = self->_failedToWriteTranscript;
    self->_failedToWriteTranscript = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSessionCoordinatorErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Sessioncoordinatorerror;
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
    goto LABEL_13;
  whichOneof_Sessioncoordinatorerror = self->_whichOneof_Sessioncoordinatorerror;
  if (whichOneof_Sessioncoordinatorerror != objc_msgSend(v4, "whichOneof_Sessioncoordinatorerror"))
    goto LABEL_13;
  -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "other");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "other");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failedToWriteTranscript");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failedToWriteTranscript");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IFTSchemaIFTIntelligenceFlowError hash](self->_other, "hash");
  return -[IFTSchemaIFTIntelligenceFlowError hash](self->_failedToWriteTranscript, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_failedToWriteTranscript)
  {
    -[IFTSchemaIFTSessionCoordinatorError failedToWriteTranscript](self, "failedToWriteTranscript");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("failedToWriteTranscript"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("failedToWriteTranscript"));

    }
  }
  if (self->_other)
  {
    -[IFTSchemaIFTSessionCoordinatorError other](self, "other");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("other"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("other"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTSessionCoordinatorError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTSessionCoordinatorError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTSessionCoordinatorError *v5;
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
    self = -[IFTSchemaIFTSessionCoordinatorError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTSessionCoordinatorError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTSessionCoordinatorError *v5;
  void *v6;
  IFTSchemaIFTIntelligenceFlowError *v7;
  void *v8;
  IFTSchemaIFTIntelligenceFlowError *v9;
  IFTSchemaIFTSessionCoordinatorError *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTSessionCoordinatorError;
  v5 = -[IFTSchemaIFTSessionCoordinatorError init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("other"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTIntelligenceFlowError initWithDictionary:]([IFTSchemaIFTIntelligenceFlowError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTSessionCoordinatorError setOther:](v5, "setOther:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedToWriteTranscript"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTIntelligenceFlowError initWithDictionary:]([IFTSchemaIFTIntelligenceFlowError alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTSessionCoordinatorError setFailedToWriteTranscript:](v5, "setFailedToWriteTranscript:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Sessioncoordinatorerror
{
  return self->_whichOneof_Sessioncoordinatorerror;
}

- (BOOL)hasOther
{
  return self->_hasOther;
}

- (void)setHasOther:(BOOL)a3
{
  self->_hasOther = a3;
}

- (BOOL)hasFailedToWriteTranscript
{
  return self->_hasFailedToWriteTranscript;
}

- (void)setHasFailedToWriteTranscript:(BOOL)a3
{
  self->_hasFailedToWriteTranscript = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedToWriteTranscript, 0);
  objc_storeStrong((id *)&self->_other, 0);
}

@end
