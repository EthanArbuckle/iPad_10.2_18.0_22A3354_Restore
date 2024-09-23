@implementation PFAPreprocessorExecutionFailed

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
  v9.super_class = (Class)PFAPreprocessorExecutionFailed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PFAPreprocessorExecutionFailed deletePreprocessorExecutionMetrics](self, "deletePreprocessorExecutionMetrics");
  return v5;
}

- (BOOL)hasPreprocessorExecutionMetrics
{
  return self->_preprocessorExecutionMetrics != 0;
}

- (void)deletePreprocessorExecutionMetrics
{
  -[PFAPreprocessorExecutionFailed setPreprocessorExecutionMetrics:](self, "setPreprocessorExecutionMetrics:", 0);
}

- (void)setFailedAtStep:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_failedAtStep = a3;
}

- (BOOL)hasFailedAtStep
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFailedAtStep:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFailedAtStep
{
  -[PFAPreprocessorExecutionFailed setFailedAtStep:](self, "setFailedAtStep:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorExecutionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int failedAtStep;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessorExecutionMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preprocessorExecutionMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    failedAtStep = self->_failedAtStep;
    if (failedAtStep != objc_msgSend(v4, "failedAtStep"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PFAPreprocessorExecutionMetrics hash](self->_preprocessorExecutionMetrics, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_failedAtStep;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[PFAPreprocessorExecutionFailed failedAtStep](self, "failedAtStep") - 1;
    if (v4 > 3)
      v5 = CFSTR("PREPROCESSOREXECUTIONSTEP_UNKNOWN");
    else
      v5 = off_1E563D558[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("failedAtStep"));
  }
  if (self->_preprocessorExecutionMetrics)
  {
    -[PFAPreprocessorExecutionFailed preprocessorExecutionMetrics](self, "preprocessorExecutionMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("preprocessorExecutionMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("preprocessorExecutionMetrics"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAPreprocessorExecutionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAPreprocessorExecutionFailed)initWithJSON:(id)a3
{
  void *v4;
  PFAPreprocessorExecutionFailed *v5;
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
    self = -[PFAPreprocessorExecutionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAPreprocessorExecutionFailed)initWithDictionary:(id)a3
{
  id v4;
  PFAPreprocessorExecutionFailed *v5;
  void *v6;
  PFAPreprocessorExecutionMetrics *v7;
  void *v8;
  PFAPreprocessorExecutionFailed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPreprocessorExecutionFailed;
  v5 = -[PFAPreprocessorExecutionFailed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preprocessorExecutionMetrics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PFAPreprocessorExecutionMetrics initWithDictionary:]([PFAPreprocessorExecutionMetrics alloc], "initWithDictionary:", v6);
      -[PFAPreprocessorExecutionFailed setPreprocessorExecutionMetrics:](v5, "setPreprocessorExecutionMetrics:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedAtStep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPreprocessorExecutionFailed setFailedAtStep:](v5, "setFailedAtStep:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (PFAPreprocessorExecutionMetrics)preprocessorExecutionMetrics
{
  return self->_preprocessorExecutionMetrics;
}

- (void)setPreprocessorExecutionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_preprocessorExecutionMetrics, a3);
}

- (int)failedAtStep
{
  return self->_failedAtStep;
}

- (void)setHasPreprocessorExecutionMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessorExecutionMetrics, 0);
}

@end
