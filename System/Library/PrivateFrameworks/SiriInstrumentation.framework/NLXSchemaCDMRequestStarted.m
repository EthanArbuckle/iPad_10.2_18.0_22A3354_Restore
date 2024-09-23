@implementation NLXSchemaCDMRequestStarted

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMRequestStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
    -[NLXSchemaCDMRequestStarted deleteLoggableSharedUserId](self, "deleteLoggableSharedUserId");
  -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMRequestStarted deleteCurrentTurnInput](self, "deleteCurrentTurnInput");

  return v5;
}

- (BOOL)hasCurrentTurnInput
{
  return self->_currentTurnInput != 0;
}

- (void)deleteCurrentTurnInput
{
  -[NLXSchemaCDMRequestStarted setCurrentTurnInput:](self, "setCurrentTurnInput:", 0);
}

- (void)setServiceGraphName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceGraphName = a3;
}

- (BOOL)hasServiceGraphName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteServiceGraphName
{
  -[NLXSchemaCDMRequestStarted setServiceGraphName:](self, "setServiceGraphName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteLoggableSharedUserId
{
  -[NLXSchemaCDMRequestStarted setLoggableSharedUserId:](self, "setLoggableSharedUserId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NLXSchemaCDMRequestStarted loggableSharedUserId](self, "loggableSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int serviceGraphName;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurnInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTurnInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    serviceGraphName = self->_serviceGraphName;
    if (serviceGraphName != objc_msgSend(v4, "serviceGraphName"))
      goto LABEL_15;
  }
  -[NLXSchemaCDMRequestStarted loggableSharedUserId](self, "loggableSharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggableSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMRequestStarted loggableSharedUserId](self, "loggableSharedUserId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[NLXSchemaCDMRequestStarted loggableSharedUserId](self, "loggableSharedUserId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggableSharedUserId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[NLXSchemaCDMTurnInput hash](self->_currentTurnInput, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_serviceGraphName;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_loggableSharedUserId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentTurnInput)
  {
    -[NLXSchemaCDMRequestStarted currentTurnInput](self, "currentTurnInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTurnInput"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentTurnInput"));

    }
  }
  if (self->_loggableSharedUserId)
  {
    -[NLXSchemaCDMRequestStarted loggableSharedUserId](self, "loggableSharedUserId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("loggableSharedUserId"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = -[NLXSchemaCDMRequestStarted serviceGraphName](self, "serviceGraphName") - 1;
    if (v9 > 6)
      v10 = CFSTR("CDMSERVICEGRAPHNAME_UNKNOWN");
    else
      v10 = off_1E5631C08[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("serviceGraphName"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMRequestStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMRequestStarted)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMRequestStarted *v5;
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
    self = -[NLXSchemaCDMRequestStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMRequestStarted)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMRequestStarted *v5;
  void *v6;
  NLXSchemaCDMTurnInput *v7;
  void *v8;
  void *v9;
  void *v10;
  NLXSchemaCDMRequestStarted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMRequestStarted;
  v5 = -[NLXSchemaCDMRequestStarted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTurnInput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLXSchemaCDMTurnInput initWithDictionary:]([NLXSchemaCDMTurnInput alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMRequestStarted setCurrentTurnInput:](v5, "setCurrentTurnInput:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceGraphName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRequestStarted setServiceGraphName:](v5, "setServiceGraphName:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggableSharedUserId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[NLXSchemaCDMRequestStarted setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NLXSchemaCDMTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
}

- (void)setCurrentTurnInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurnInput, a3);
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasCurrentTurnInput:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
}

@end
