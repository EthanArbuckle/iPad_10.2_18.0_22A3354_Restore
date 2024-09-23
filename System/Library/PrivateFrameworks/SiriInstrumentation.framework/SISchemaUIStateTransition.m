@implementation SISchemaUIStateTransition

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
  v13.super_class = (Class)SISchemaUIStateTransition;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUIStateTransition presenting](self, "presenting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUIStateTransition deletePresenting](self, "deletePresenting");
  -[SISchemaUIStateTransition dismissed](self, "dismissed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaUIStateTransition deleteDismissed](self, "deleteDismissed");

  return v5;
}

- (void)setCurrentState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentState = a3;
}

- (BOOL)hasCurrentState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCurrentState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCurrentState
{
  -[SISchemaUIStateTransition setCurrentState:](self, "setCurrentState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPreviousState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_previousState = a3;
}

- (BOOL)hasPreviousState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPreviousState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePreviousState
{
  -[SISchemaUIStateTransition setPreviousState:](self, "setPreviousState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSiriPresentationType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_siriPresentationType = a3;
}

- (BOOL)hasSiriPresentationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSiriPresentationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSiriPresentationType
{
  -[SISchemaUIStateTransition setSiriPresentationType:](self, "setSiriPresentationType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setDismissalReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dismissalReason = a3;
}

- (BOOL)hasDismissalReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasDismissalReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteDismissalReason
{
  -[SISchemaUIStateTransition setDismissalReason:](self, "setDismissalReason:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setPresenting:(id)a3
{
  SISchemaUIStatePresenting *v4;
  SISchemaUIStateDismissed *dismissed;
  unint64_t v6;
  SISchemaUIStatePresenting *presenting;

  v4 = (SISchemaUIStatePresenting *)a3;
  dismissed = self->_dismissed;
  self->_dismissed = 0;

  v6 = 5;
  if (!v4)
    v6 = 0;
  self->_whichPresentationstate = v6;
  presenting = self->_presenting;
  self->_presenting = v4;

}

- (SISchemaUIStatePresenting)presenting
{
  if (self->_whichPresentationstate == 5)
    return self->_presenting;
  else
    return (SISchemaUIStatePresenting *)0;
}

- (void)deletePresenting
{
  SISchemaUIStatePresenting *presenting;

  if (self->_whichPresentationstate == 5)
  {
    self->_whichPresentationstate = 0;
    presenting = self->_presenting;
    self->_presenting = 0;

  }
}

- (void)setDismissed:(id)a3
{
  SISchemaUIStateDismissed *v4;
  SISchemaUIStatePresenting *presenting;
  unint64_t v6;
  SISchemaUIStateDismissed *dismissed;

  v4 = (SISchemaUIStateDismissed *)a3;
  presenting = self->_presenting;
  self->_presenting = 0;

  v6 = 6;
  if (!v4)
    v6 = 0;
  self->_whichPresentationstate = v6;
  dismissed = self->_dismissed;
  self->_dismissed = v4;

}

- (SISchemaUIStateDismissed)dismissed
{
  if (self->_whichPresentationstate == 6)
    return self->_dismissed;
  else
    return (SISchemaUIStateDismissed *)0;
}

- (void)deleteDismissed
{
  SISchemaUIStateDismissed *dismissed;

  if (self->_whichPresentationstate == 6)
  {
    self->_whichPresentationstate = 0;
    dismissed = self->_dismissed;
    self->_dismissed = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUIStateTransitionReadFrom(self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
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
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  -[SISchemaUIStateTransition presenting](self, "presenting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaUIStateTransition presenting](self, "presenting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUIStateTransition dismissed](self, "dismissed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[SISchemaUIStateTransition dismissed](self, "dismissed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichPresentationstate;
  $31C648D173A714BF8700D96CFC0F0632 has;
  unsigned int v7;
  int currentState;
  int v9;
  int previousState;
  int v11;
  int siriPresentationType;
  int v13;
  int dismissalReason;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichPresentationstate = self->_whichPresentationstate;
  if (whichPresentationstate != objc_msgSend(v4, "whichPresentationstate"))
    goto LABEL_28;
  has = self->_has;
  v7 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_28;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    currentState = self->_currentState;
    if (currentState != objc_msgSend(v4, "currentState"))
      goto LABEL_28;
    has = self->_has;
    v7 = v4[40];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      previousState = self->_previousState;
      if (previousState != objc_msgSend(v4, "previousState"))
        goto LABEL_28;
      has = self->_has;
      v7 = v4[40];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v7 >> 2) & 1))
    {
      if (v11)
      {
        siriPresentationType = self->_siriPresentationType;
        if (siriPresentationType != objc_msgSend(v4, "siriPresentationType"))
          goto LABEL_28;
        has = self->_has;
        v7 = v4[40];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 != ((v7 >> 3) & 1))
        goto LABEL_28;
      if (v13)
      {
        dismissalReason = self->_dismissalReason;
        if (dismissalReason != objc_msgSend(v4, "dismissalReason"))
          goto LABEL_28;
      }
      -[SISchemaUIStateTransition presenting](self, "presenting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presenting");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v15 == 0) == (v16 != 0))
        goto LABEL_27;
      -[SISchemaUIStateTransition presenting](self, "presenting");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        -[SISchemaUIStateTransition presenting](self, "presenting");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "presenting");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (!v21)
          goto LABEL_28;
      }
      else
      {

      }
      -[SISchemaUIStateTransition dismissed](self, "dismissed");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v15 == 0) != (v16 != 0))
      {
        -[SISchemaUIStateTransition dismissed](self, "dismissed");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {

LABEL_31:
          v27 = 1;
          goto LABEL_29;
        }
        v23 = (void *)v22;
        -[SISchemaUIStateTransition dismissed](self, "dismissed");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dismissed");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_31;
      }
      else
      {
LABEL_27:

      }
    }
  }
LABEL_28:
  v27 = 0;
LABEL_29:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_currentState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_previousState;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_siriPresentationType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_dismissalReason;
LABEL_10:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUIStatePresenting hash](self->_presenting, "hash");
  return v7 ^ -[SISchemaUIStateDismissed hash](self->_dismissed, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  unsigned int v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[SISchemaUIStateTransition currentState](self, "currentState") - 1;
    if (v5 > 4)
      v6 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
    else
      v6 = off_1E5637850[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentState"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = -[SISchemaUIStateTransition dismissalReason](self, "dismissalReason") - 1;
    if (v7 > 0x31)
      v8 = CFSTR("DISMISSALREASON_UNKNOWN_DISMISSAL_REASON");
    else
      v8 = off_1E56376C0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dismissalReason"));
  }
  if (self->_dismissed)
  {
    -[SISchemaUIStateTransition dismissed](self, "dismissed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dismissed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dismissed"));

    }
  }
  if (self->_presenting)
  {
    -[SISchemaUIStateTransition presenting](self, "presenting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("presenting"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("presenting"));

    }
  }
  v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    v16 = -[SISchemaUIStateTransition previousState](self, "previousState") - 1;
    if (v16 > 4)
      v17 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
    else
      v17 = off_1E5637850[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("previousState"));
    v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    v18 = -[SISchemaUIStateTransition siriPresentationType](self, "siriPresentationType") - 1;
    if (v18 > 6)
      v19 = CFSTR("SIRIPRESENTATIONTYPE_UNKNOWN_SIRI_PRESENTATION_TYPE");
    else
      v19 = off_1E5637878[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("siriPresentationType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUIStateTransition dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUIStateTransition)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUIStateTransition *v5;
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
    self = -[SISchemaUIStateTransition initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUIStateTransition)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUIStateTransition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUIStatePresenting *v11;
  void *v12;
  SISchemaUIStateDismissed *v13;
  SISchemaUIStateTransition *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaUIStateTransition;
  v5 = -[SISchemaUIStateTransition init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUIStateTransition setCurrentState:](v5, "setCurrentState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUIStateTransition setPreviousState:](v5, "setPreviousState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriPresentationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUIStateTransition setSiriPresentationType:](v5, "setSiriPresentationType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissalReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUIStateTransition setDismissalReason:](v5, "setDismissalReason:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("presenting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUIStatePresenting initWithDictionary:]([SISchemaUIStatePresenting alloc], "initWithDictionary:", v10);
      -[SISchemaUIStateTransition setPresenting:](v5, "setPresenting:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUIStateDismissed initWithDictionary:]([SISchemaUIStateDismissed alloc], "initWithDictionary:", v12);
      -[SISchemaUIStateTransition setDismissed:](v5, "setDismissed:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichPresentationstate
{
  return self->_whichPresentationstate;
}

- (int)currentState
{
  return self->_currentState;
}

- (int)previousState
{
  return self->_previousState;
}

- (int)siriPresentationType
{
  return self->_siriPresentationType;
}

- (int)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)hasPresenting
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasPresenting:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasDismissed
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasDismissed:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissed, 0);
  objc_storeStrong((id *)&self->_presenting, 0);
}

@end
