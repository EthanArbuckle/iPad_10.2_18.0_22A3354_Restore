@implementation PFARepackagingExecutionFailure

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
  v13.super_class = (Class)PFARepackagingExecutionFailure;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PFARepackagingExecutionFailure deleteFbfFailure](self, "deleteFbfFailure");
  -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PFARepackagingExecutionFailure deleteSandboxError](self, "deleteSandboxError");

  return v5;
}

- (void)setFbfFailure:(id)a3
{
  PFARepackagingExecutionFBFFailure *v4;
  PFARepackagingExecutionSandboxError *sandboxError;
  PFARepackagingExecutionFBFFailure *fbfFailure;

  v4 = (PFARepackagingExecutionFBFFailure *)a3;
  sandboxError = self->_sandboxError;
  self->_sandboxError = 0;

  self->_whichKind = v4 != 0;
  fbfFailure = self->_fbfFailure;
  self->_fbfFailure = v4;

}

- (PFARepackagingExecutionFBFFailure)fbfFailure
{
  if (self->_whichKind == 1)
    return self->_fbfFailure;
  else
    return (PFARepackagingExecutionFBFFailure *)0;
}

- (void)deleteFbfFailure
{
  PFARepackagingExecutionFBFFailure *fbfFailure;

  if (self->_whichKind == 1)
  {
    self->_whichKind = 0;
    fbfFailure = self->_fbfFailure;
    self->_fbfFailure = 0;

  }
}

- (void)setSandboxError:(id)a3
{
  PFARepackagingExecutionSandboxError *v4;
  PFARepackagingExecutionFBFFailure *fbfFailure;
  PFARepackagingExecutionSandboxError *sandboxError;

  v4 = (PFARepackagingExecutionSandboxError *)a3;
  fbfFailure = self->_fbfFailure;
  self->_fbfFailure = 0;

  self->_whichKind = 2 * (v4 != 0);
  sandboxError = self->_sandboxError;
  self->_sandboxError = v4;

}

- (PFARepackagingExecutionSandboxError)sandboxError
{
  if (self->_whichKind == 2)
    return self->_sandboxError;
  else
    return (PFARepackagingExecutionSandboxError *)0;
}

- (void)deleteSandboxError
{
  PFARepackagingExecutionSandboxError *sandboxError;

  if (self->_whichKind == 2)
  {
    self->_whichKind = 0;
    sandboxError = self->_sandboxError;
    self->_sandboxError = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PFARepackagingExecutionFailureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichKind;
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
  whichKind = self->_whichKind;
  if (whichKind != objc_msgSend(v4, "whichKind"))
    goto LABEL_13;
  -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbfFailure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbfFailure");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sandboxError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sandboxError");
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

  v3 = -[PFARepackagingExecutionFBFFailure hash](self->_fbfFailure, "hash");
  return -[PFARepackagingExecutionSandboxError hash](self->_sandboxError, "hash") ^ v3;
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
  if (self->_fbfFailure)
  {
    -[PFARepackagingExecutionFailure fbfFailure](self, "fbfFailure");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fbfFailure"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("fbfFailure"));

    }
  }
  if (self->_sandboxError)
  {
    -[PFARepackagingExecutionFailure sandboxError](self, "sandboxError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sandboxError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sandboxError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFARepackagingExecutionFailure dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFARepackagingExecutionFailure)initWithJSON:(id)a3
{
  void *v4;
  PFARepackagingExecutionFailure *v5;
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
    self = -[PFARepackagingExecutionFailure initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFARepackagingExecutionFailure)initWithDictionary:(id)a3
{
  id v4;
  PFARepackagingExecutionFailure *v5;
  void *v6;
  PFARepackagingExecutionFBFFailure *v7;
  void *v8;
  PFARepackagingExecutionSandboxError *v9;
  PFARepackagingExecutionFailure *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFARepackagingExecutionFailure;
  v5 = -[PFARepackagingExecutionFailure init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fbfFailure"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PFARepackagingExecutionFBFFailure initWithDictionary:]([PFARepackagingExecutionFBFFailure alloc], "initWithDictionary:", v6);
      -[PFARepackagingExecutionFailure setFbfFailure:](v5, "setFbfFailure:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sandboxError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PFARepackagingExecutionSandboxError initWithDictionary:]([PFARepackagingExecutionSandboxError alloc], "initWithDictionary:", v8);
      -[PFARepackagingExecutionFailure setSandboxError:](v5, "setSandboxError:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichKind
{
  return self->_whichKind;
}

- (BOOL)hasFbfFailure
{
  return self->_hasFbfFailure;
}

- (void)setHasFbfFailure:(BOOL)a3
{
  self->_hasFbfFailure = a3;
}

- (BOOL)hasSandboxError
{
  return self->_hasSandboxError;
}

- (void)setHasSandboxError:(BOOL)a3
{
  self->_hasSandboxError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxError, 0);
  objc_storeStrong((id *)&self->_fbfFailure, 0);
}

@end
