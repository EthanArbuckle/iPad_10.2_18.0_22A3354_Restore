@implementation ODDSiriSchemaODDHeadGestureProperties

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHeadGesturesSupported:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_headGesturesSupported = a3;
}

- (BOOL)hasHeadGesturesSupported
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHeadGesturesSupported:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHeadGesturesSupported
{
  -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesSupported:](self, "setHeadGesturesSupported:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHeadGesturesEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_headGesturesEnabled = a3;
}

- (BOOL)hasHeadGesturesEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHeadGesturesEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHeadGesturesEnabled
{
  -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesEnabled:](self, "setHeadGesturesEnabled:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAcceptProceedGesture:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_acceptProceedGesture = a3;
}

- (BOOL)hasAcceptProceedGesture
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAcceptProceedGesture:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAcceptProceedGesture
{
  -[ODDSiriSchemaODDHeadGestureProperties setAcceptProceedGesture:](self, "setAcceptProceedGesture:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setDeclineDismissGesture:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_declineDismissGesture = a3;
}

- (BOOL)hasDeclineDismissGesture
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasDeclineDismissGesture:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteDeclineDismissGesture
{
  -[ODDSiriSchemaODDHeadGestureProperties setDeclineDismissGesture:](self, "setDeclineDismissGesture:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDHeadGesturePropertiesReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteBOOLField();
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
  $EBBC5CA33C8B6F6C181474580A7557F4 has;
  unsigned int v6;
  int headGesturesSupported;
  int v8;
  int headGesturesEnabled;
  int v10;
  int acceptProceedGesture;
  int v12;
  int declineDismissGesture;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    headGesturesSupported = self->_headGesturesSupported;
    if (headGesturesSupported != objc_msgSend(v4, "headGesturesSupported"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    headGesturesEnabled = self->_headGesturesEnabled;
    if (headGesturesEnabled != objc_msgSend(v4, "headGesturesEnabled"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[20];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    acceptProceedGesture = self->_acceptProceedGesture;
    if (acceptProceedGesture == objc_msgSend(v4, "acceptProceedGesture"))
    {
      has = self->_has;
      v6 = v4[20];
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
    declineDismissGesture = self->_declineDismissGesture;
    if (declineDismissGesture != objc_msgSend(v4, "declineDismissGesture"))
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
    v2 = 2654435761 * self->_headGesturesSupported;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_headGesturesEnabled;
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
  v4 = 2654435761 * self->_acceptProceedGesture;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_declineDismissGesture;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = -[ODDSiriSchemaODDHeadGestureProperties acceptProceedGesture](self, "acceptProceedGesture");
    if (v5 == 1)
      v6 = CFSTR("ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE");
    else
      v6 = CFSTR("ORCHHEADGESTUREMAPPING_UNKNOWN");
    if (v5 == 2)
      v7 = CFSTR("ORCHHEADGESTUREMAPPING_UP_AND_DOWN");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("acceptProceedGesture"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v8 = -[ODDSiriSchemaODDHeadGestureProperties declineDismissGesture](self, "declineDismissGesture");
    if (v8 == 1)
      v9 = CFSTR("ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE");
    else
      v9 = CFSTR("ORCHHEADGESTUREMAPPING_UNKNOWN");
    if (v8 == 2)
      v10 = CFSTR("ORCHHEADGESTUREMAPPING_UP_AND_DOWN");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("declineDismissGesture"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDHeadGestureProperties headGesturesEnabled](self, "headGesturesEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("headGesturesEnabled"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDHeadGestureProperties headGesturesSupported](self, "headGesturesSupported"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("headGesturesSupported"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDHeadGestureProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDHeadGestureProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDHeadGestureProperties *v5;
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
    self = -[ODDSiriSchemaODDHeadGestureProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDHeadGestureProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDHeadGestureProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ODDSiriSchemaODDHeadGestureProperties *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDHeadGestureProperties;
  v5 = -[ODDSiriSchemaODDHeadGestureProperties init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headGesturesSupported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesSupported:](v5, "setHeadGesturesSupported:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headGesturesEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesEnabled:](v5, "setHeadGesturesEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acceptProceedGesture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDHeadGestureProperties setAcceptProceedGesture:](v5, "setAcceptProceedGesture:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("declineDismissGesture"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDHeadGestureProperties setDeclineDismissGesture:](v5, "setDeclineDismissGesture:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)headGesturesSupported
{
  return self->_headGesturesSupported;
}

- (BOOL)headGesturesEnabled
{
  return self->_headGesturesEnabled;
}

- (int)acceptProceedGesture
{
  return self->_acceptProceedGesture;
}

- (int)declineDismissGesture
{
  return self->_declineDismissGesture;
}

@end
