@implementation SISchemaPNRFatalError

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
  v16.super_class = (Class)SISchemaPNRFatalError;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaPNRFatalError error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaPNRFatalError deleteError](self, "deleteError");
  -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaPNRFatalError deleteUnderlyingError](self, "deleteUnderlyingError");
  -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaPNRFatalError deleteUnderUnderlyingError](self, "deleteUnderUnderlyingError");

  return v5;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[SISchemaPNRFatalError setError:](self, "setError:", 0);
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (void)deleteUnderlyingError
{
  -[SISchemaPNRFatalError setUnderlyingError:](self, "setUnderlyingError:", 0);
}

- (BOOL)hasUnderUnderlyingError
{
  return self->_underUnderlyingError != 0;
}

- (void)deleteUnderUnderlyingError
{
  -[SISchemaPNRFatalError setUnderUnderlyingError:](self, "setUnderUnderlyingError:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPNRFatalErrorReadFrom(self, (uint64_t)a3);
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
  -[SISchemaPNRFatalError error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaPNRFatalError error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
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
  -[SISchemaPNRFatalError error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaPNRFatalError error](self, "error");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaPNRFatalError error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underUnderlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underUnderlyingError");
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

  v3 = -[SISchemaPNRFatalErrorInfo hash](self->_error, "hash");
  v4 = -[SISchemaPNRFatalErrorInfo hash](self->_underlyingError, "hash") ^ v3;
  return v4 ^ -[SISchemaPNRFatalErrorInfo hash](self->_underUnderlyingError, "hash");
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
  if (self->_error)
  {
    -[SISchemaPNRFatalError error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("error"));

    }
  }
  if (self->_underUnderlyingError)
  {
    -[SISchemaPNRFatalError underUnderlyingError](self, "underUnderlyingError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("underUnderlyingError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("underUnderlyingError"));

    }
  }
  if (self->_underlyingError)
  {
    -[SISchemaPNRFatalError underlyingError](self, "underlyingError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("underlyingError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("underlyingError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaPNRFatalError dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaPNRFatalError)initWithJSON:(id)a3
{
  void *v4;
  SISchemaPNRFatalError *v5;
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
    self = -[SISchemaPNRFatalError initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaPNRFatalError)initWithDictionary:(id)a3
{
  id v4;
  SISchemaPNRFatalError *v5;
  void *v6;
  SISchemaPNRFatalErrorInfo *v7;
  void *v8;
  SISchemaPNRFatalErrorInfo *v9;
  void *v10;
  SISchemaPNRFatalErrorInfo *v11;
  SISchemaPNRFatalError *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaPNRFatalError;
  v5 = -[SISchemaPNRFatalError init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaPNRFatalErrorInfo initWithDictionary:]([SISchemaPNRFatalErrorInfo alloc], "initWithDictionary:", v6);
      -[SISchemaPNRFatalError setError:](v5, "setError:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaPNRFatalErrorInfo initWithDictionary:]([SISchemaPNRFatalErrorInfo alloc], "initWithDictionary:", v8);
      -[SISchemaPNRFatalError setUnderlyingError:](v5, "setUnderlyingError:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underUnderlyingError"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaPNRFatalErrorInfo initWithDictionary:]([SISchemaPNRFatalErrorInfo alloc], "initWithDictionary:", v10);
      -[SISchemaPNRFatalError setUnderUnderlyingError:](v5, "setUnderUnderlyingError:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaPNRFatalErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (SISchemaPNRFatalErrorInfo)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (SISchemaPNRFatalErrorInfo)underUnderlyingError
{
  return self->_underUnderlyingError;
}

- (void)setUnderUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underUnderlyingError, a3);
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  self->_hasUnderlyingError = a3;
}

- (void)setHasUnderUnderlyingError:(BOOL)a3
{
  self->_hasUnderUnderlyingError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underUnderlyingError, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
