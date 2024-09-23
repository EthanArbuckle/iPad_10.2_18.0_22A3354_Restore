@implementation MTSchemaMTInvocationFailed

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
  v16.super_class = (Class)MTSchemaMTInvocationFailed;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTInvocationFailed error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MTSchemaMTInvocationFailed deleteError](self, "deleteError");
  -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MTSchemaMTInvocationFailed deleteQssSessionId](self, "deleteQssSessionId");
  -[MTSchemaMTInvocationFailed localePair](self, "localePair");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MTSchemaMTInvocationFailed deleteLocalePair](self, "deleteLocalePair");

  return v5;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[MTSchemaMTInvocationFailed setError:](self, "setError:", 0);
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
}

- (void)deleteQssSessionId
{
  -[MTSchemaMTInvocationFailed setQssSessionId:](self, "setQssSessionId:", 0);
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

- (void)deleteLocalePair
{
  -[MTSchemaMTInvocationFailed setLocalePair:](self, "setLocalePair:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTInvocationFailedReadFrom(self, (uint64_t)a3);
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
  -[MTSchemaMTInvocationFailed error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTInvocationFailed error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTInvocationFailed localePair](self, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MTSchemaMTInvocationFailed localePair](self, "localePair");
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
  -[MTSchemaMTInvocationFailed error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[MTSchemaMTInvocationFailed error](self, "error");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MTSchemaMTInvocationFailed error](self, "error");
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
  -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qssSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qssSessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[MTSchemaMTInvocationFailed localePair](self, "localePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MTSchemaMTInvocationFailed localePair](self, "localePair");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[MTSchemaMTInvocationFailed localePair](self, "localePair");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localePair");
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

  v3 = -[MTSchemaMTError hash](self->_error, "hash");
  v4 = -[SISchemaUUID hash](self->_qssSessionId, "hash") ^ v3;
  return v4 ^ -[MTSchemaMTLocalePair hash](self->_localePair, "hash");
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
    -[MTSchemaMTInvocationFailed error](self, "error");
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
  if (self->_localePair)
  {
    -[MTSchemaMTInvocationFailed localePair](self, "localePair");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("localePair"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("localePair"));

    }
  }
  if (self->_qssSessionId)
  {
    -[MTSchemaMTInvocationFailed qssSessionId](self, "qssSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("qssSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("qssSessionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTInvocationFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTInvocationFailed)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTInvocationFailed *v5;
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
    self = -[MTSchemaMTInvocationFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTInvocationFailed)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTInvocationFailed *v5;
  void *v6;
  MTSchemaMTError *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  MTSchemaMTLocalePair *v11;
  MTSchemaMTInvocationFailed *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTSchemaMTInvocationFailed;
  v5 = -[MTSchemaMTInvocationFailed init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[MTSchemaMTError initWithDictionary:]([MTSchemaMTError alloc], "initWithDictionary:", v6);
      -[MTSchemaMTInvocationFailed setError:](v5, "setError:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qssSessionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[MTSchemaMTInvocationFailed setQssSessionId:](v5, "setQssSessionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localePair"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[MTSchemaMTLocalePair initWithDictionary:]([MTSchemaMTLocalePair alloc], "initWithDictionary:", v10);
      -[MTSchemaMTInvocationFailed setLocalePair:](v5, "setLocalePair:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (MTSchemaMTError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (SISchemaUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setQssSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_qssSessionId, a3);
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_storeStrong((id *)&self->_localePair, a3);
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void)setHasQssSessionId:(BOOL)a3
{
  self->_hasQssSessionId = a3;
}

- (void)setHasLocalePair:(BOOL)a3
{
  self->_hasLocalePair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
