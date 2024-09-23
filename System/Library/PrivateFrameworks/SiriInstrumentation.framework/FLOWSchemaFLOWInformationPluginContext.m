@implementation FLOWSchemaFLOWInformationPluginContext

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
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FLOWSchemaFLOWInformationPluginContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v8, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6)
    -[FLOWSchemaFLOWInformationPluginContext deleteExecutedPegasusDomain](self, "deleteExecutedPegasusDomain");
  return v5;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEventType
{
  -[FLOWSchemaFLOWInformationPluginContext setEventType:](self, "setEventType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasExecutedPegasusDomain
{
  return self->_executedPegasusDomain != 0;
}

- (void)deleteExecutedPegasusDomain
{
  -[FLOWSchemaFLOWInformationPluginContext setExecutedPegasusDomain:](self, "setExecutedPegasusDomain:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWInformationPluginContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWInformationPluginContext executedPegasusDomain](self, "executedPegasusDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int eventType;
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
        || (eventType = self->_eventType, eventType == objc_msgSend(v4, "eventType")))
      {
        -[FLOWSchemaFLOWInformationPluginContext executedPegasusDomain](self, "executedPegasusDomain");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "executedPegasusDomain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[FLOWSchemaFLOWInformationPluginContext executedPegasusDomain](self, "executedPegasusDomain");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[FLOWSchemaFLOWInformationPluginContext executedPegasusDomain](self, "executedPegasusDomain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "executedPegasusDomain");
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
    v2 = 2654435761 * self->_eventType;
  else
    v2 = 0;
  return -[NSString hash](self->_executedPegasusDomain, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[FLOWSchemaFLOWInformationPluginContext eventType](self, "eventType");
    v5 = CFSTR("FLOWINFORMATIONPLUGINEVENTTYPE_UNKNOWN");
    if (v4 == 1)
      v5 = CFSTR("FLOWINFORMATIONPLUGINEVENTTYPE_POMMES");
    if (v4 == 2)
      v6 = CFSTR("FLOWINFORMATIONPLUGINEVENTTYPE_MODALITY");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventType"));
  }
  if (self->_executedPegasusDomain)
  {
    -[FLOWSchemaFLOWInformationPluginContext executedPegasusDomain](self, "executedPegasusDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("executedPegasusDomain"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWInformationPluginContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWInformationPluginContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWInformationPluginContext *v5;
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
    self = -[FLOWSchemaFLOWInformationPluginContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWInformationPluginContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWInformationPluginContext *v5;
  void *v6;
  void *v7;
  void *v8;
  FLOWSchemaFLOWInformationPluginContext *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWInformationPluginContext;
  v5 = -[FLOWSchemaFLOWInformationPluginContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWInformationPluginContext setEventType:](v5, "setEventType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executedPegasusDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[FLOWSchemaFLOWInformationPluginContext setExecutedPegasusDomain:](v5, "setExecutedPegasusDomain:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSString)executedPegasusDomain
{
  return self->_executedPegasusDomain;
}

- (void)setExecutedPegasusDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasExecutedPegasusDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executedPegasusDomain, 0);
}

@end
