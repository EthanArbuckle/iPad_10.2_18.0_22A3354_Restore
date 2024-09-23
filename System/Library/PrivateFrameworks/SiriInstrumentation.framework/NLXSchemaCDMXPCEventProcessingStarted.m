@implementation NLXSchemaCDMXPCEventProcessingStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setProcessingType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_processingType = a3;
}

- (BOOL)hasProcessingType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProcessingType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProcessingType
{
  -[NLXSchemaCDMXPCEventProcessingStarted setProcessingType:](self, "setProcessingType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setXpcType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_xpcType = a3;
}

- (BOOL)hasXpcType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasXpcType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteXpcType
{
  -[NLXSchemaCDMXPCEventProcessingStarted setXpcType:](self, "setXpcType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setXpcSystemEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_xpcSystemEventType = a3;
}

- (BOOL)hasXpcSystemEventType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasXpcSystemEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteXpcSystemEventType
{
  -[NLXSchemaCDMXPCEventProcessingStarted setXpcSystemEventType:](self, "setXpcSystemEventType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setServiceName:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_serviceName = a3;
}

- (BOOL)hasServiceName
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasServiceName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteServiceName
{
  -[NLXSchemaCDMXPCEventProcessingStarted setServiceName:](self, "setServiceName:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMXPCEventProcessingStartedReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8C2E6E645F17E41EE561DA7A2FAE3C55 has;
  unsigned int v6;
  int processingType;
  int v8;
  int xpcType;
  int v10;
  int xpcSystemEventType;
  int v12;
  int serviceName;
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
    processingType = self->_processingType;
    if (processingType != objc_msgSend(v4, "processingType"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    xpcType = self->_xpcType;
    if (xpcType != objc_msgSend(v4, "xpcType"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    xpcSystemEventType = self->_xpcSystemEventType;
    if (xpcSystemEventType == objc_msgSend(v4, "xpcSystemEventType"))
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
    serviceName = self->_serviceName;
    if (serviceName != objc_msgSend(v4, "serviceName"))
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
    v2 = 2654435761 * self->_processingType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_xpcType;
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
  v4 = 2654435761 * self->_xpcSystemEventType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_serviceName;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if (-[NLXSchemaCDMXPCEventProcessingStarted processingType](self, "processingType") == 1)
      v9 = CFSTR("CDMXPCEVENTPROCESSINGTYPE_OVERRIDES_SETUP");
    else
      v9 = CFSTR("CDMXPCEVENTPROCESSINGTYPE_UNKNOWN");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("processingType"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_20:
      v12 = -[NLXSchemaCDMXPCEventProcessingStarted xpcSystemEventType](self, "xpcSystemEventType") - 1;
      if (v12 > 5)
        v13 = CFSTR("CDMXPCSYSTEMEVENTTYPE_UNKNOWN");
      else
        v13 = off_1E5639240[v12];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("xpcSystemEventType"));
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_11;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = -[NLXSchemaCDMXPCEventProcessingStarted serviceName](self, "serviceName") - 1;
  if (v10 > 0x29)
    v11 = CFSTR("CDMSERVICENAME_UNKNOWN");
  else
    v11 = off_1E56390F0[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("serviceName"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_20;
LABEL_4:
  if ((has & 2) == 0)
    goto LABEL_11;
LABEL_5:
  v5 = -[NLXSchemaCDMXPCEventProcessingStarted xpcType](self, "xpcType");
  v6 = CFSTR("CDMXPCTYPE_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("CDMXPCTYPE_EVENT");
  if (v5 == 2)
    v7 = CFSTR("CDMXPCTYPE_ACTIVITY");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("xpcType"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMXPCEventProcessingStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMXPCEventProcessingStarted)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMXPCEventProcessingStarted *v5;
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
    self = -[NLXSchemaCDMXPCEventProcessingStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMXPCEventProcessingStarted)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMXPCEventProcessingStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLXSchemaCDMXPCEventProcessingStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMXPCEventProcessingStarted;
  v5 = -[NLXSchemaCDMXPCEventProcessingStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processingType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMXPCEventProcessingStarted setProcessingType:](v5, "setProcessingType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpcType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMXPCEventProcessingStarted setXpcType:](v5, "setXpcType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpcSystemEventType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMXPCEventProcessingStarted setXpcSystemEventType:](v5, "setXpcSystemEventType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMXPCEventProcessingStarted setServiceName:](v5, "setServiceName:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)processingType
{
  return self->_processingType;
}

- (int)xpcType
{
  return self->_xpcType;
}

- (int)xpcSystemEventType
{
  return self->_xpcSystemEventType;
}

- (int)serviceName
{
  return self->_serviceName;
}

@end
