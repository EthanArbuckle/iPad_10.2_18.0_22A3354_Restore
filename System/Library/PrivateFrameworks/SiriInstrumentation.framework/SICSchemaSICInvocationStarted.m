@implementation SICSchemaSICInvocationStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsMuted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMuted = a3;
}

- (BOOL)hasIsMuted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsMuted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsMuted
{
  -[SICSchemaSICInvocationStarted setIsMuted:](self, "setIsMuted:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCallType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_callType = a3;
}

- (BOOL)hasCallType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCallType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCallType
{
  -[SICSchemaSICInvocationStarted setCallType:](self, "setCallType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCallState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_callState = a3;
}

- (BOOL)hasCallState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCallState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCallState
{
  -[SICSchemaSICInvocationStarted setCallState:](self, "setCallState:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCallAppType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_callAppType = a3;
}

- (BOOL)hasCallAppType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCallAppType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCallAppType
{
  -[SICSchemaSICInvocationStarted setCallAppType:](self, "setCallAppType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setParticipantCountBucket:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_participantCountBucket = a3;
}

- (BOOL)hasParticipantCountBucket
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasParticipantCountBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteParticipantCountBucket
{
  -[SICSchemaSICInvocationStarted setParticipantCountBucket:](self, "setParticipantCountBucket:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return SICSchemaSICInvocationStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $41D7D76F82648DAA234CB09B73C423E1 has;
  unsigned int v6;
  int isMuted;
  int v8;
  int callType;
  int v10;
  int callState;
  int v12;
  int callAppType;
  int v14;
  int participantCountBucket;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isMuted = self->_isMuted;
    if (isMuted != objc_msgSend(v4, "isMuted"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    callType = self->_callType;
    if (callType != objc_msgSend(v4, "callType"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    callState = self->_callState;
    if (callState != objc_msgSend(v4, "callState"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    callAppType = self->_callAppType;
    if (callAppType == objc_msgSend(v4, "callAppType"))
    {
      has = self->_has;
      v6 = v4[28];
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
    participantCountBucket = self->_participantCountBucket;
    if (participantCountBucket != objc_msgSend(v4, "participantCountBucket"))
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
    v2 = 2654435761 * self->_isMuted;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_callType;
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
    v4 = 2654435761 * self->_callState;
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
  v5 = 2654435761 * self->_callAppType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_participantCountBucket;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = -[SICSchemaSICInvocationStarted callAppType](self, "callAppType") - 1;
    if (v5 > 2)
      v6 = CFSTR("CALLAPPTYPE_UNKNOWN");
    else
      v6 = off_1E5633DD0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("callAppType"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[SICSchemaSICInvocationStarted callState](self, "callState") - 1;
  if (v7 > 4)
    v8 = CFSTR("CALLSTATE_UNKNOWN");
  else
    v8 = off_1E5633DE8[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("callState"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SICSchemaSICInvocationStarted isMuted](self, "isMuted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isMuted"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_22;
  }
LABEL_15:
  v9 = -[SICSchemaSICInvocationStarted callType](self, "callType");
  v10 = CFSTR("CALLTYPE_UNKNOWN");
  if (v9 == 1)
    v10 = CFSTR("CALLTYPE_AUDIO");
  if (v9 == 2)
    v11 = CFSTR("CALLTYPE_VIDEO");
  else
    v11 = v10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("callType"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_5:
  if ((has & 0x10) == 0)
    goto LABEL_26;
LABEL_22:
  v13 = -[SICSchemaSICInvocationStarted participantCountBucket](self, "participantCountBucket") - 1;
  if (v13 > 5)
    v14 = CFSTR("SICPARTICIPANTCOUNTBUCKET_UNKNOWN");
  else
    v14 = off_1E5633E10[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("participantCountBucket"));
LABEL_26:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SICSchemaSICInvocationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SICSchemaSICInvocationStarted)initWithJSON:(id)a3
{
  void *v4;
  SICSchemaSICInvocationStarted *v5;
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
    self = -[SICSchemaSICInvocationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SICSchemaSICInvocationStarted)initWithDictionary:(id)a3
{
  id v4;
  SICSchemaSICInvocationStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SICSchemaSICInvocationStarted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SICSchemaSICInvocationStarted;
  v5 = -[SICSchemaSICInvocationStarted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMuted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SICSchemaSICInvocationStarted setIsMuted:](v5, "setIsMuted:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SICSchemaSICInvocationStarted setCallType:](v5, "setCallType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SICSchemaSICInvocationStarted setCallState:](v5, "setCallState:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callAppType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SICSchemaSICInvocationStarted setCallAppType:](v5, "setCallAppType:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participantCountBucket"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SICSchemaSICInvocationStarted setParticipantCountBucket:](v5, "setParticipantCountBucket:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (int)callType
{
  return self->_callType;
}

- (int)callState
{
  return self->_callState;
}

- (int)callAppType
{
  return self->_callAppType;
}

- (int)participantCountBucket
{
  return self->_participantCountBucket;
}

@end
