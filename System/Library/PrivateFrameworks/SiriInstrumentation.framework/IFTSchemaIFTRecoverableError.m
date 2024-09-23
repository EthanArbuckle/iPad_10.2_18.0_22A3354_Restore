@implementation IFTSchemaIFTRecoverableError

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
  v9.super_class = (Class)IFTSchemaIFTRecoverableError;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTRecoverableError deletePlanGenerationError](self, "deletePlanGenerationError");
  return v5;
}

- (void)setPlanGenerationError:(id)a3
{
  self->_whichOneof_Recoverableerror = a3 != 0;
  objc_storeStrong((id *)&self->_planGenerationError, a3);
}

- (IFTSchemaIFTPlanGenerationError)planGenerationError
{
  if (self->_whichOneof_Recoverableerror == 1)
    return self->_planGenerationError;
  else
    return (IFTSchemaIFTPlanGenerationError *)0;
}

- (void)deletePlanGenerationError
{
  IFTSchemaIFTPlanGenerationError *planGenerationError;

  if (self->_whichOneof_Recoverableerror == 1)
  {
    self->_whichOneof_Recoverableerror = 0;
    planGenerationError = self->_planGenerationError;
    self->_planGenerationError = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRecoverableErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Recoverableerror;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichOneof_Recoverableerror = self->_whichOneof_Recoverableerror;
    if (whichOneof_Recoverableerror == objc_msgSend(v4, "whichOneof_Recoverableerror"))
    {
      -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "planGenerationError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "planGenerationError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
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
  return -[IFTSchemaIFTPlanGenerationError hash](self->_planGenerationError, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_planGenerationError)
  {
    -[IFTSchemaIFTRecoverableError planGenerationError](self, "planGenerationError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("planGenerationError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("planGenerationError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTRecoverableError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTRecoverableError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTRecoverableError *v5;
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
    self = -[IFTSchemaIFTRecoverableError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTRecoverableError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTRecoverableError *v5;
  void *v6;
  IFTSchemaIFTPlanGenerationError *v7;
  IFTSchemaIFTRecoverableError *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTRecoverableError;
  v5 = -[IFTSchemaIFTRecoverableError init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planGenerationError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTPlanGenerationError initWithDictionary:]([IFTSchemaIFTPlanGenerationError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTRecoverableError setPlanGenerationError:](v5, "setPlanGenerationError:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Recoverableerror
{
  return self->_whichOneof_Recoverableerror;
}

- (BOOL)hasPlanGenerationError
{
  return self->_hasPlanGenerationError;
}

- (void)setHasPlanGenerationError:(BOOL)a3
{
  self->_hasPlanGenerationError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planGenerationError, 0);
}

@end
