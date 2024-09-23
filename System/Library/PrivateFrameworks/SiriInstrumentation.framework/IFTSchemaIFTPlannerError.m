@implementation IFTSchemaIFTPlannerError

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
  v9.super_class = (Class)IFTSchemaIFTPlannerError;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTPlannerError other](self, "other", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTPlannerError deleteOther](self, "deleteOther");
  return v5;
}

- (void)setOther:(id)a3
{
  self->_failedToPlan = 0;
  self->_whichOneof_Plannererror = a3 != 0;
  objc_storeStrong((id *)&self->_other, a3);
}

- (IFTSchemaIFTIntelligenceFlowError)other
{
  if (self->_whichOneof_Plannererror == 1)
    return self->_other;
  else
    return (IFTSchemaIFTIntelligenceFlowError *)0;
}

- (void)deleteOther
{
  IFTSchemaIFTIntelligenceFlowError *other;

  if (self->_whichOneof_Plannererror == 1)
  {
    self->_whichOneof_Plannererror = 0;
    other = self->_other;
    self->_other = 0;

  }
}

- (void)setFailedToPlan:(BOOL)a3
{
  IFTSchemaIFTIntelligenceFlowError *other;

  other = self->_other;
  self->_other = 0;

  self->_whichOneof_Plannererror = 2;
  self->_failedToPlan = a3;
}

- (BOOL)failedToPlan
{
  return self->_whichOneof_Plannererror == 2 && self->_failedToPlan;
}

- (void)deleteFailedToPlan
{
  if (self->_whichOneof_Plannererror == 2)
  {
    self->_whichOneof_Plannererror = 0;
    self->_failedToPlan = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPlannerErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IFTSchemaIFTPlannerError other](self, "other");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTPlannerError other](self, "other");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_whichOneof_Plannererror == 2)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Plannererror;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int failedToPlan;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichOneof_Plannererror = self->_whichOneof_Plannererror;
    if (whichOneof_Plannererror == objc_msgSend(v4, "whichOneof_Plannererror"))
    {
      -[IFTSchemaIFTPlannerError other](self, "other");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "other");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[IFTSchemaIFTPlannerError other](self, "other");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          failedToPlan = self->_failedToPlan;
          v14 = failedToPlan == objc_msgSend(v4, "failedToPlan");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[IFTSchemaIFTPlannerError other](self, "other");
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
  if (self->_whichOneof_Plannererror == 2)
    v4 = 2654435761 * self->_failedToPlan;
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
  if (self->_whichOneof_Plannererror == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPlannerError failedToPlan](self, "failedToPlan"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("failedToPlan"));

  }
  if (self->_other)
  {
    -[IFTSchemaIFTPlannerError other](self, "other");
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

  -[IFTSchemaIFTPlannerError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTPlannerError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTPlannerError *v5;
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
    self = -[IFTSchemaIFTPlannerError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTPlannerError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTPlannerError *v5;
  void *v6;
  IFTSchemaIFTIntelligenceFlowError *v7;
  void *v8;
  IFTSchemaIFTPlannerError *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTPlannerError;
  v5 = -[IFTSchemaIFTPlannerError init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("other"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTIntelligenceFlowError initWithDictionary:]([IFTSchemaIFTIntelligenceFlowError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTPlannerError setOther:](v5, "setOther:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedToPlan"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPlannerError setFailedToPlan:](v5, "setFailedToPlan:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Plannererror
{
  return self->_whichOneof_Plannererror;
}

- (BOOL)hasOther
{
  return self->_hasOther;
}

- (void)setHasOther:(BOOL)a3
{
  self->_hasOther = a3;
}

- (BOOL)hasFailedToPlan
{
  return self->_hasFailedToPlan;
}

- (void)setHasFailedToPlan:(BOOL)a3
{
  self->_hasFailedToPlan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
}

@end
