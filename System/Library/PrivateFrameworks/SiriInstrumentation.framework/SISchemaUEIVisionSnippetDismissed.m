@implementation SISchemaUEIVisionSnippetDismissed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setStartLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startLocation = a3;
}

- (BOOL)hasStartLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartLocation
{
  -[SISchemaUEIVisionSnippetDismissed setStartLocation:](self, "setStartLocation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setWasMoved:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wasMoved = a3;
}

- (BOOL)hasWasMoved
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasWasMoved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteWasMoved
{
  -[SISchemaUEIVisionSnippetDismissed setWasMoved:](self, "setWasMoved:", 0);
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
  -[SISchemaUEIVisionSnippetDismissed setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIVisionSnippetDismissedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $6D72F207A6105E3206BE1B666323F66D has;
  unsigned int v6;
  int startLocation;
  int v8;
  int wasMoved;
  int v10;
  int reason;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startLocation = self->_startLocation;
    if (startLocation != objc_msgSend(v4, "startLocation"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    wasMoved = self->_wasMoved;
    if (wasMoved == objc_msgSend(v4, "wasMoved"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_startLocation;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_wasMoved;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_10:
    v9 = -[SISchemaUEIVisionSnippetDismissed startLocation](self, "startLocation");
    v10 = CFSTR("UEIVISIONSNIPPETSTARTLOCATION_UNKNOWN");
    if (v9 == 1)
      v10 = CFSTR("UEIVISIONSNIPPETSTARTLOCATION_SYSTEM_DEFAULT");
    if (v9 == 2)
      v11 = CFSTR("UEIVISIONSNIPPETSTARTLOCATION_LAST_USER_SPECIFIED_LOCATION");
    else
      v11 = v10;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startLocation"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  v7 = -[SISchemaUEIVisionSnippetDismissed reason](self, "reason") - 1;
  if (v7 > 0x31)
    v8 = CFSTR("DISMISSALREASON_UNKNOWN_DISMISSAL_REASON");
  else
    v8 = off_1E563B5A0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaUEIVisionSnippetDismissed wasMoved](self, "wasMoved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wasMoved"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIVisionSnippetDismissed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIVisionSnippetDismissed)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIVisionSnippetDismissed *v5;
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
    self = -[SISchemaUEIVisionSnippetDismissed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIVisionSnippetDismissed)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIVisionSnippetDismissed *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUEIVisionSnippetDismissed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEIVisionSnippetDismissed;
  v5 = -[SISchemaUEIVisionSnippetDismissed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIVisionSnippetDismissed setStartLocation:](v5, "setStartLocation:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasMoved"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIVisionSnippetDismissed setWasMoved:](v5, "setWasMoved:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIVisionSnippetDismissed setReason:](v5, "setReason:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)startLocation
{
  return self->_startLocation;
}

- (BOOL)wasMoved
{
  return self->_wasMoved;
}

- (int)reason
{
  return self->_reason;
}

@end
