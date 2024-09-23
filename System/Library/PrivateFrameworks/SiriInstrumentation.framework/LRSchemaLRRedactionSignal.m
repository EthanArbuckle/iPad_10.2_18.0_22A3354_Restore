@implementation LRSchemaLRRedactionSignal

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
  v13.super_class = (Class)LRSchemaLRRedactionSignal;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LRSchemaLRRedactionSignal deleteTimeSpan](self, "deleteTimeSpan");
  -[LRSchemaLRRedactionSignal componentId](self, "componentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LRSchemaLRRedactionSignal deleteComponentId](self, "deleteComponentId");

  return v5;
}

- (void)setSensitivityState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sensitivityState = a3;
}

- (BOOL)hasSensitivityState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSensitivityState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSensitivityState
{
  -[LRSchemaLRRedactionSignal setSensitivityState:](self, "setSensitivityState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSignalTimeNanosecondsSinceBoot:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signalTimeNanosecondsSinceBoot = a3;
}

- (BOOL)hasSignalTimeNanosecondsSinceBoot
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSignalTimeNanosecondsSinceBoot:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSignalTimeNanosecondsSinceBoot
{
  -[LRSchemaLRRedactionSignal setSignalTimeNanosecondsSinceBoot:](self, "setSignalTimeNanosecondsSinceBoot:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsEntireClockAffected:(BOOL)a3
{
  LRSchemaLRTimespanRedactionSignal *timeSpan;
  LRSchemaLRComponentIdentifierRedactionSignal *componentId;

  timeSpan = self->_timeSpan;
  self->_timeSpan = 0;

  componentId = self->_componentId;
  self->_componentId = 0;

  self->_whichSignal = 101;
  self->_isEntireClockAffected = a3;
}

- (BOOL)isEntireClockAffected
{
  return self->_whichSignal == 101 && self->_isEntireClockAffected;
}

- (void)deleteIsEntireClockAffected
{
  if (self->_whichSignal == 101)
  {
    self->_whichSignal = 0;
    self->_isEntireClockAffected = 0;
  }
}

- (void)setTimeSpan:(id)a3
{
  LRSchemaLRTimespanRedactionSignal *v4;
  LRSchemaLRComponentIdentifierRedactionSignal *componentId;
  unint64_t v6;
  LRSchemaLRTimespanRedactionSignal *timeSpan;

  v4 = (LRSchemaLRTimespanRedactionSignal *)a3;
  self->_isEntireClockAffected = 0;
  componentId = self->_componentId;
  self->_componentId = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichSignal = v6;
  timeSpan = self->_timeSpan;
  self->_timeSpan = v4;

}

- (LRSchemaLRTimespanRedactionSignal)timeSpan
{
  if (self->_whichSignal == 102)
    return self->_timeSpan;
  else
    return (LRSchemaLRTimespanRedactionSignal *)0;
}

- (void)deleteTimeSpan
{
  LRSchemaLRTimespanRedactionSignal *timeSpan;

  if (self->_whichSignal == 102)
  {
    self->_whichSignal = 0;
    timeSpan = self->_timeSpan;
    self->_timeSpan = 0;

  }
}

- (void)setComponentId:(id)a3
{
  LRSchemaLRComponentIdentifierRedactionSignal *v4;
  LRSchemaLRTimespanRedactionSignal *timeSpan;
  unint64_t v6;
  LRSchemaLRComponentIdentifierRedactionSignal *componentId;

  v4 = (LRSchemaLRComponentIdentifierRedactionSignal *)a3;
  self->_isEntireClockAffected = 0;
  timeSpan = self->_timeSpan;
  self->_timeSpan = 0;

  v6 = 103;
  if (!v4)
    v6 = 0;
  self->_whichSignal = v6;
  componentId = self->_componentId;
  self->_componentId = v4;

}

- (LRSchemaLRComponentIdentifierRedactionSignal)componentId
{
  if (self->_whichSignal == 103)
    return self->_componentId;
  else
    return (LRSchemaLRComponentIdentifierRedactionSignal *)0;
}

- (void)deleteComponentId
{
  LRSchemaLRComponentIdentifierRedactionSignal *componentId;

  if (self->_whichSignal == 103)
  {
    self->_whichSignal = 0;
    componentId = self->_componentId;
    self->_componentId = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRRedactionSignalReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_whichSignal == 101)
    PBDataWriterWriteBOOLField();
  -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LRSchemaLRRedactionSignal componentId](self, "componentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[LRSchemaLRRedactionSignal componentId](self, "componentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichSignal;
  $4D05DE1613F598723D23BFC31ECB1551 has;
  unsigned int v7;
  int sensitivityState;
  int v9;
  unint64_t signalTimeNanosecondsSinceBoot;
  int isEntireClockAffected;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  whichSignal = self->_whichSignal;
  if (whichSignal != objc_msgSend(v4, "whichSignal"))
    goto LABEL_21;
  has = self->_has;
  v7 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_21;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sensitivityState = self->_sensitivityState;
    if (sensitivityState != objc_msgSend(v4, "sensitivityState"))
      goto LABEL_21;
    has = self->_has;
    v7 = v4[48];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_21;
  if (v9)
  {
    signalTimeNanosecondsSinceBoot = self->_signalTimeNanosecondsSinceBoot;
    if (signalTimeNanosecondsSinceBoot != objc_msgSend(v4, "signalTimeNanosecondsSinceBoot"))
      goto LABEL_21;
  }
  isEntireClockAffected = self->_isEntireClockAffected;
  if (isEntireClockAffected != objc_msgSend(v4, "isEntireClockAffected"))
    goto LABEL_21;
  -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeSpan");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) == (v13 != 0))
    goto LABEL_20;
  -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeSpan");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[LRSchemaLRRedactionSignal componentId](self, "componentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 == 0) != (v13 != 0))
  {
    -[LRSchemaLRRedactionSignal componentId](self, "componentId");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[LRSchemaLRRedactionSignal componentId](self, "componentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_sensitivityState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_signalTimeNanosecondsSinceBoot;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  if (self->_whichSignal == 101)
    v5 = 2654435761 * self->_isEntireClockAffected;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[LRSchemaLRTimespanRedactionSignal hash](self->_timeSpan, "hash");
  return v6 ^ -[LRSchemaLRComponentIdentifierRedactionSignal hash](self->_componentId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_componentId)
  {
    -[LRSchemaLRRedactionSignal componentId](self, "componentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("componentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("componentId"));

    }
  }
  if (self->_whichSignal == 101)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LRSchemaLRRedactionSignal isEntireClockAffected](self, "isEntireClockAffected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isEntireClockAffected"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v9 = -[LRSchemaLRRedactionSignal sensitivityState](self, "sensitivityState") - 1;
    if (v9 > 7)
      v10 = CFSTR("DEVICE_SENSITIVITY_STATE_DEFAULT");
    else
      v10 = off_1E563A428[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sensitivityState"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LRSchemaLRRedactionSignal signalTimeNanosecondsSinceBoot](self, "signalTimeNanosecondsSinceBoot"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("signalTimeNanosecondsSinceBoot"));

  }
  if (self->_timeSpan)
  {
    -[LRSchemaLRRedactionSignal timeSpan](self, "timeSpan");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("timeSpan"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("timeSpan"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LRSchemaLRRedactionSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LRSchemaLRRedactionSignal)initWithJSON:(id)a3
{
  void *v4;
  LRSchemaLRRedactionSignal *v5;
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
    self = -[LRSchemaLRRedactionSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LRSchemaLRRedactionSignal)initWithDictionary:(id)a3
{
  id v4;
  LRSchemaLRRedactionSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LRSchemaLRTimespanRedactionSignal *v10;
  void *v11;
  LRSchemaLRComponentIdentifierRedactionSignal *v12;
  LRSchemaLRRedactionSignal *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LRSchemaLRRedactionSignal;
  v5 = -[LRSchemaLRRedactionSignal init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sensitivityState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRRedactionSignal setSensitivityState:](v5, "setSensitivityState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalTimeNanosecondsSinceBoot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRRedactionSignal setSignalTimeNanosecondsSinceBoot:](v5, "setSignalTimeNanosecondsSinceBoot:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEntireClockAffected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRRedactionSignal setIsEntireClockAffected:](v5, "setIsEntireClockAffected:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSpan"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[LRSchemaLRTimespanRedactionSignal initWithDictionary:]([LRSchemaLRTimespanRedactionSignal alloc], "initWithDictionary:", v9);
      -[LRSchemaLRRedactionSignal setTimeSpan:](v5, "setTimeSpan:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[LRSchemaLRComponentIdentifierRedactionSignal initWithDictionary:]([LRSchemaLRComponentIdentifierRedactionSignal alloc], "initWithDictionary:", v11);
      -[LRSchemaLRRedactionSignal setComponentId:](v5, "setComponentId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (unint64_t)whichSignal
{
  return self->_whichSignal;
}

- (int)sensitivityState
{
  return self->_sensitivityState;
}

- (unint64_t)signalTimeNanosecondsSinceBoot
{
  return self->_signalTimeNanosecondsSinceBoot;
}

- (BOOL)hasIsEntireClockAffected
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasIsEntireClockAffected:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasTimeSpan
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasTimeSpan:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasComponentId
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasComponentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_timeSpan, 0);
}

@end
