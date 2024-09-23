@implementation SISchemaSiriResponseContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasDialogPhase
{
  return self->_dialogPhase != 0;
}

- (void)deleteDialogPhase
{
  -[SISchemaSiriResponseContext setDialogPhase:](self, "setDialogPhase:", 0);
}

- (void)setPresentationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_presentationType = a3;
}

- (BOOL)hasPresentationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPresentationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePresentationType
{
  -[SISchemaSiriResponseContext setPresentationType:](self, "setPresentationType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSiriResponseMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_siriResponseMode = a3;
}

- (BOOL)hasSiriResponseMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSiriResponseMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSiriResponseMode
{
  -[SISchemaSiriResponseContext setSiriResponseMode:](self, "setSiriResponseMode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSiriResponseContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaSiriResponseContext dialogPhase](self, "dialogPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $9F74CAB219D0F06C20453967A4BBB7C6 has;
  unsigned int v14;
  int presentationType;
  int v16;
  int siriResponseMode;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[SISchemaSiriResponseContext dialogPhase](self, "dialogPhase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogPhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[SISchemaSiriResponseContext dialogPhase](self, "dialogPhase");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaSiriResponseContext dialogPhase](self, "dialogPhase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogPhase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    presentationType = self->_presentationType;
    if (presentationType == objc_msgSend(v4, "presentationType"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    siriResponseMode = self->_siriResponseMode;
    if (siriResponseMode != objc_msgSend(v4, "siriResponseMode"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_dialogPhase, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_presentationType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_siriResponseMode;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dialogPhase)
  {
    -[SISchemaSiriResponseContext dialogPhase](self, "dialogPhase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dialogPhase"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = -[SISchemaSiriResponseContext presentationType](self, "presentationType") - 1;
    if (v7 > 6)
      v8 = CFSTR("SIRIPRESENTATIONTYPE_UNKNOWN_SIRI_PRESENTATION_TYPE");
    else
      v8 = off_1E56371A0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("presentationType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = -[SISchemaSiriResponseContext siriResponseMode](self, "siriResponseMode") - 1;
    if (v9 > 6)
      v10 = CFSTR("SIRIRESPONSEMODE_UNKNOWN_SIRI_RESPONSE_MODE");
    else
      v10 = off_1E56371D8[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("siriResponseMode"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaSiriResponseContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaSiriResponseContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaSiriResponseContext *v5;
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
    self = -[SISchemaSiriResponseContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaSiriResponseContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaSiriResponseContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaSiriResponseContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaSiriResponseContext;
  v5 = -[SISchemaSiriResponseContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogPhase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaSiriResponseContext setDialogPhase:](v5, "setDialogPhase:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("presentationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSiriResponseContext setPresentationType:](v5, "setPresentationType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResponseMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaSiriResponseContext setSiriResponseMode:](v5, "setSiriResponseMode:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (void)setDialogPhase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)presentationType
{
  return self->_presentationType;
}

- (int)siriResponseMode
{
  return self->_siriResponseMode;
}

- (void)setHasDialogPhase:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogPhase, 0);
}

@end
