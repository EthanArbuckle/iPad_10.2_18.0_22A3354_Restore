@implementation NLXSchemaCDMSingleServiceSetupAttemptFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (BOOL)hasServiceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteServiceType
{
  -[NLXSchemaCDMSingleServiceSetupAttemptFailed setServiceType:](self, "setServiceType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRetryNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_retryNumber = a3;
}

- (BOOL)hasRetryNumber
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRetryNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRetryNumber
{
  -[NLXSchemaCDMSingleServiceSetupAttemptFailed setRetryNumber:](self, "setRetryNumber:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteReason
{
  -[NLXSchemaCDMSingleServiceSetupAttemptFailed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteErrorCode
{
  -[NLXSchemaCDMSingleServiceSetupAttemptFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSingleServiceSetupAttemptFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8F5C2E41CBBBDFEB7D4EDF60B14B0D67 has;
  unsigned int v6;
  int serviceType;
  int v8;
  unsigned int retryNumber;
  int v10;
  int reason;
  int v12;
  unsigned int errorCode;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    serviceType = self->_serviceType;
    if (serviceType != objc_msgSend(v4, "serviceType"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    retryNumber = self->_retryNumber;
    if (retryNumber != objc_msgSend(v4, "retryNumber"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    reason = self->_reason;
    if (reason == objc_msgSend(v4, "reason"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_serviceType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_retryNumber;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_reason;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMSingleServiceSetupAttemptFailed errorCode](self, "errorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMSingleServiceSetupAttemptFailed retryNumber](self, "retryNumber"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("retryNumber"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = -[NLXSchemaCDMSingleServiceSetupAttemptFailed reason](self, "reason");
  v7 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_UNKNOWN");
  if (v6 == 1)
    v7 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_TIMED_OUT");
  if (v6 == 2)
    v8 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_ERROR_DURING_SETUP");
  else
    v8 = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_4:
  if ((has & 1) == 0)
    goto LABEL_18;
LABEL_14:
  v10 = -[NLXSchemaCDMSingleServiceSetupAttemptFailed serviceType](self, "serviceType") - 1;
  if (v10 > 0x24)
    v11 = CFSTR("CDMSERVICETYPE_UNKNOWN");
  else
    v11 = off_1E5631DB8[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("serviceType"));
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMSingleServiceSetupAttemptFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *v5;
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
    self = -[NLXSchemaCDMSingleServiceSetupAttemptFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMSingleServiceSetupAttemptFailed;
  v5 = -[NLXSchemaCDMSingleServiceSetupAttemptFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setServiceType:](v5, "setServiceType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retryNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setRetryNumber:](v5, "setRetryNumber:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setReason:](v5, "setReason:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (unsigned)retryNumber
{
  return self->_retryNumber;
}

- (int)reason
{
  return self->_reason;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

@end
