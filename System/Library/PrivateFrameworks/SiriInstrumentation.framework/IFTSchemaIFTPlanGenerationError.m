@implementation IFTSchemaIFTPlanGenerationError

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
  v9.super_class = (Class)IFTSchemaIFTPlanGenerationError;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IFTSchemaIFTPlanGenerationError deletePlanGenerationModelOutputError](self, "deletePlanGenerationModelOutputError");
  return v5;
}

- (void)setPlanGenerationModelOutputError:(id)a3
{
  self->_whichOneof_Plangenerationerror = a3 != 0;
  objc_storeStrong((id *)&self->_planGenerationModelOutputError, a3);
}

- (IFTSchemaIFTPlanGenerationModelOutputError)planGenerationModelOutputError
{
  if (self->_whichOneof_Plangenerationerror == 1)
    return self->_planGenerationModelOutputError;
  else
    return (IFTSchemaIFTPlanGenerationModelOutputError *)0;
}

- (void)deletePlanGenerationModelOutputError
{
  IFTSchemaIFTPlanGenerationModelOutputError *planGenerationModelOutputError;

  if (self->_whichOneof_Plangenerationerror == 1)
  {
    self->_whichOneof_Plangenerationerror = 0;
    planGenerationModelOutputError = self->_planGenerationModelOutputError;
    self->_planGenerationModelOutputError = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPlanGenerationErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Plangenerationerror;
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
    whichOneof_Plangenerationerror = self->_whichOneof_Plangenerationerror;
    if (whichOneof_Plangenerationerror == objc_msgSend(v4, "whichOneof_Plangenerationerror"))
    {
      -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "planGenerationModelOutputError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "planGenerationModelOutputError");
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
  return -[IFTSchemaIFTPlanGenerationModelOutputError hash](self->_planGenerationModelOutputError, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_planGenerationModelOutputError)
  {
    -[IFTSchemaIFTPlanGenerationError planGenerationModelOutputError](self, "planGenerationModelOutputError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("planGenerationModelOutputError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("planGenerationModelOutputError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTPlanGenerationError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTPlanGenerationError)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTPlanGenerationError *v5;
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
    self = -[IFTSchemaIFTPlanGenerationError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTPlanGenerationError)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTPlanGenerationError *v5;
  void *v6;
  IFTSchemaIFTPlanGenerationModelOutputError *v7;
  IFTSchemaIFTPlanGenerationError *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTPlanGenerationError;
  v5 = -[IFTSchemaIFTPlanGenerationError init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planGenerationModelOutputError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTPlanGenerationModelOutputError initWithDictionary:]([IFTSchemaIFTPlanGenerationModelOutputError alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTPlanGenerationError setPlanGenerationModelOutputError:](v5, "setPlanGenerationModelOutputError:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Plangenerationerror
{
  return self->_whichOneof_Plangenerationerror;
}

- (BOOL)hasPlanGenerationModelOutputError
{
  return self->_hasPlanGenerationModelOutputError;
}

- (void)setHasPlanGenerationModelOutputError:(BOOL)a3
{
  self->_hasPlanGenerationModelOutputError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planGenerationModelOutputError, 0);
}

@end
