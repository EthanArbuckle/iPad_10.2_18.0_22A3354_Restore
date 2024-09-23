@implementation NLXSchemaCDMServiceSetupMetric

- (void)setStartLogicalTimestampInNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startLogicalTimestampInNs = a3;
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (void)setEndLogicalTimestampInNs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endLogicalTimestampInNs = a3;
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
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:

}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
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
  -[NLXSchemaCDMServiceSetupMetric setServiceType:](self, "setServiceType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasStartLogicalTimestampInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStartLogicalTimestampInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStartLogicalTimestampInNs
{
  -[NLXSchemaCDMServiceSetupMetric setStartLogicalTimestampInNs:](self, "setStartLogicalTimestampInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasEndLogicalTimestampInNs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndLogicalTimestampInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEndLogicalTimestampInNs
{
  -[NLXSchemaCDMServiceSetupMetric setEndLogicalTimestampInNs:](self, "setEndLogicalTimestampInNs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setFailureReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_failureReason = a3;
}

- (BOOL)hasFailureReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteFailureReason
{
  -[NLXSchemaCDMServiceSetupMetric setFailureReason:](self, "setFailureReason:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteErrorCode
{
  -[NLXSchemaCDMServiceSetupMetric setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMServiceSetupMetricReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $CFE2407D56422EF2167B42C498633834 has;
  unsigned int v6;
  int serviceType;
  int v8;
  int64_t startLogicalTimestampInNs;
  int v10;
  int64_t endLogicalTimestampInNs;
  int v12;
  int failureReason;
  int v14;
  unsigned int errorCode;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    serviceType = self->_serviceType;
    if (serviceType != objc_msgSend(v4, "serviceType"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    startLogicalTimestampInNs = self->_startLogicalTimestampInNs;
    if (startLogicalTimestampInNs != objc_msgSend(v4, "startLogicalTimestampInNs"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[40];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    endLogicalTimestampInNs = self->_endLogicalTimestampInNs;
    if (endLogicalTimestampInNs != objc_msgSend(v4, "endLogicalTimestampInNs"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[40];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    failureReason = self->_failureReason;
    if (failureReason == objc_msgSend(v4, "failureReason"))
    {
      has = self->_has;
      v6 = v4[40];
      goto LABEL_18;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v14)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_serviceType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_startLogicalTimestampInNs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_endLogicalTimestampInNs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_failureReason;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NLXSchemaCDMServiceSetupMetric endLogicalTimestampInNs](self, "endLogicalTimestampInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endLogicalTimestampInNs"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMServiceSetupMetric errorCode](self, "errorCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_16:
    v12 = -[NLXSchemaCDMServiceSetupMetric serviceType](self, "serviceType") - 1;
    if (v12 > 0x24)
      v13 = CFSTR("CDMSERVICETYPE_UNKNOWN");
    else
      v13 = off_1E563ADD8[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("serviceType"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_7;
  }
LABEL_10:
  v9 = -[NLXSchemaCDMServiceSetupMetric failureReason](self, "failureReason");
  v10 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_UNKNOWN");
  if (v9 == 1)
    v10 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_TIMED_OUT");
  if (v9 == 2)
    v11 = CFSTR("CDMSERVICESETUPATTEMPTFAILUREREASON_ERROR_DURING_SETUP");
  else
    v11 = v10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failureReason"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_16;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NLXSchemaCDMServiceSetupMetric startLogicalTimestampInNs](self, "startLogicalTimestampInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startLogicalTimestampInNs"));

  }
LABEL_7:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMServiceSetupMetric dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMServiceSetupMetric)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMServiceSetupMetric *v5;
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
    self = -[NLXSchemaCDMServiceSetupMetric initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMServiceSetupMetric)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMServiceSetupMetric *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NLXSchemaCDMServiceSetupMetric *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMServiceSetupMetric;
  v5 = -[NLXSchemaCDMServiceSetupMetric init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMServiceSetupMetric setServiceType:](v5, "setServiceType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startLogicalTimestampInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMServiceSetupMetric setStartLogicalTimestampInNs:](v5, "setStartLogicalTimestampInNs:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endLogicalTimestampInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMServiceSetupMetric setEndLogicalTimestampInNs:](v5, "setEndLogicalTimestampInNs:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMServiceSetupMetric setFailureReason:](v5, "setFailureReason:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMServiceSetupMetric setErrorCode:](v5, "setErrorCode:", objc_msgSend(v10, "unsignedIntValue"));
    v11 = v5;

  }
  return v5;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (int64_t)startLogicalTimestampInNs
{
  return self->_startLogicalTimestampInNs;
}

- (int64_t)endLogicalTimestampInNs
{
  return self->_endLogicalTimestampInNs;
}

- (int)failureReason
{
  return self->_failureReason;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

@end
