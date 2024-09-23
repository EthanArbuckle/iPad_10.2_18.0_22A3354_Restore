@implementation ASRSchemaASRCancelled

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
  v9.super_class = (Class)ASRSchemaASRCancelled;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRCancelled metrics](self, "metrics", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASRCancelled deleteMetrics](self, "deleteMetrics");
  return v5;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[ASRSchemaASRCancelled setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasMetrics
{
  return self->_metrics != 0;
}

- (void)deleteMetrics
{
  -[ASRSchemaASRCancelled setMetrics:](self, "setMetrics:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRCancelledReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[ASRSchemaASRCancelled metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[ASRSchemaASRCancelled metrics](self, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int reason;
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
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (reason = self->_reason, reason == objc_msgSend(v4, "reason")))
      {
        -[ASRSchemaASRCancelled metrics](self, "metrics");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metrics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[ASRSchemaASRCancelled metrics](self, "metrics");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[ASRSchemaASRCancelled metrics](self, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "metrics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_reason;
  else
    v2 = 0;
  return -[ASRSchemaASRRecognitionMetrics hash](self->_metrics, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_metrics)
  {
    -[ASRSchemaASRCancelled metrics](self, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("metrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("metrics"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[ASRSchemaASRCancelled reason](self, "reason");
    v8 = CFSTR("ASRCANCELREASON_UNKNOWN");
    if (v7 == 2)
      v8 = CFSTR("ASRCANCELREASON_RECOGNITION_CANCELLED");
    if (v7 == 3)
      v9 = CFSTR("ASRCANCELREASON_RECOGNITION_REJECTED");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRCancelled dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRCancelled)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRCancelled *v5;
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
    self = -[ASRSchemaASRCancelled initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRCancelled)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRCancelled *v5;
  void *v6;
  void *v7;
  ASRSchemaASRRecognitionMetrics *v8;
  ASRSchemaASRCancelled *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASRSchemaASRCancelled;
  v5 = -[ASRSchemaASRCancelled init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRCancelled setReason:](v5, "setReason:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[ASRSchemaASRRecognitionMetrics initWithDictionary:]([ASRSchemaASRRecognitionMetrics alloc], "initWithDictionary:", v7);
      -[ASRSchemaASRCancelled setMetrics:](v5, "setMetrics:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)reason
{
  return self->_reason;
}

- (ASRSchemaASRRecognitionMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void)setHasMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
