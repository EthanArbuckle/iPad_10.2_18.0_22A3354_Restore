@implementation PFARepackagingExecutionResult

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
  v9.super_class = (Class)PFARepackagingExecutionResult;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFARepackagingExecutionResult failure](self, "failure", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PFARepackagingExecutionResult deleteFailure](self, "deleteFailure");
  return v5;
}

- (void)setSamplingResult:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_samplingResult = a3;
}

- (BOOL)hasSamplingResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSamplingResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSamplingResult
{
  -[PFARepackagingExecutionResult setSamplingResult:](self, "setSamplingResult:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSuccess:(BOOL)a3
{
  PFARepackagingExecutionFailure *failure;

  failure = self->_failure;
  self->_failure = 0;

  self->_whichSuccessorfail = 101;
  self->_success = a3;
}

- (BOOL)success
{
  return self->_whichSuccessorfail == 101 && self->_success;
}

- (void)deleteSuccess
{
  if (self->_whichSuccessorfail == 101)
  {
    self->_whichSuccessorfail = 0;
    self->_success = 0;
  }
}

- (void)setFailure:(id)a3
{
  unint64_t v3;

  self->_success = 0;
  v3 = 102;
  if (!a3)
    v3 = 0;
  self->_whichSuccessorfail = v3;
  objc_storeStrong((id *)&self->_failure, a3);
}

- (PFARepackagingExecutionFailure)failure
{
  if (self->_whichSuccessorfail == 102)
    return self->_failure;
  else
    return (PFARepackagingExecutionFailure *)0;
}

- (void)deleteFailure
{
  PFARepackagingExecutionFailure *failure;

  if (self->_whichSuccessorfail == 102)
  {
    self->_whichSuccessorfail = 0;
    failure = self->_failure;
    self->_failure = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PFARepackagingExecutionResultReadFrom(self, (uint64_t)a3);
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
  if (self->_whichSuccessorfail == 101)
    PBDataWriterWriteBOOLField();
  -[PFARepackagingExecutionResult failure](self, "failure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[PFARepackagingExecutionResult failure](self, "failure");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichSuccessorfail;
  int samplingResult;
  int success;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichSuccessorfail = self->_whichSuccessorfail;
    if (whichSuccessorfail == objc_msgSend(v4, "whichSuccessorfail") && (*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (samplingResult = self->_samplingResult, samplingResult == objc_msgSend(v4, "samplingResult")))
      {
        success = self->_success;
        if (success == objc_msgSend(v4, "success"))
        {
          -[PFARepackagingExecutionResult failure](self, "failure");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failure");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            -[PFARepackagingExecutionResult failure](self, "failure");
            v11 = objc_claimAutoreleasedReturnValue();
            if (!v11)
            {

LABEL_15:
              v16 = 1;
              goto LABEL_13;
            }
            v12 = (void *)v11;
            -[PFARepackagingExecutionResult failure](self, "failure");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "failure");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) != 0)
              goto LABEL_15;
          }
          else
          {

          }
        }
      }
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_samplingResult;
  else
    v2 = 0;
  if (self->_whichSuccessorfail == 101)
    v3 = 2654435761 * self->_success;
  else
    v3 = 0;
  return v3 ^ v2 ^ -[PFARepackagingExecutionFailure hash](self->_failure, "hash");
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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_failure)
  {
    -[PFARepackagingExecutionResult failure](self, "failure");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("failure"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("failure"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[PFARepackagingExecutionResult samplingResult](self, "samplingResult");
    v8 = CFSTR("UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("Sampled");
    if (v7 == 2)
      v9 = CFSTR("NotSampled");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("samplingResult"));
  }
  if (self->_whichSuccessorfail == 101)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFARepackagingExecutionResult success](self, "success"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("success"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFARepackagingExecutionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFARepackagingExecutionResult)initWithJSON:(id)a3
{
  void *v4;
  PFARepackagingExecutionResult *v5;
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
    self = -[PFARepackagingExecutionResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFARepackagingExecutionResult)initWithDictionary:(id)a3
{
  id v4;
  PFARepackagingExecutionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  PFARepackagingExecutionFailure *v9;
  PFARepackagingExecutionResult *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFARepackagingExecutionResult;
  v5 = -[PFARepackagingExecutionResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("samplingResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFARepackagingExecutionResult setSamplingResult:](v5, "setSamplingResult:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("success"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFARepackagingExecutionResult setSuccess:](v5, "setSuccess:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PFARepackagingExecutionFailure initWithDictionary:]([PFARepackagingExecutionFailure alloc], "initWithDictionary:", v8);
      -[PFARepackagingExecutionResult setFailure:](v5, "setFailure:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichSuccessorfail
{
  return self->_whichSuccessorfail;
}

- (int)samplingResult
{
  return self->_samplingResult;
}

- (BOOL)hasSuccess
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasSuccess:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasFailure
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasFailure:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
}

@end
