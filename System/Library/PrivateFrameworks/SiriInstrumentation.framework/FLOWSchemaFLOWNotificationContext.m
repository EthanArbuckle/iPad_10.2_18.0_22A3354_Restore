@implementation FLOWSchemaFLOWNotificationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsLongNotification:(BOOL)a3
{
  *(&self->_isHighlight + 1) |= 1u;
  self->_isLongNotification = a3;
}

- (BOOL)hasIsLongNotification
{
  return *(&self->_isHighlight + 1);
}

- (void)setHasIsLongNotification:(BOOL)a3
{
  *(&self->_isHighlight + 1) = *(&self->_isHighlight + 1) & 0xFE | a3;
}

- (void)deleteIsLongNotification
{
  -[FLOWSchemaFLOWNotificationContext setIsLongNotification:](self, "setIsLongNotification:", 0);
  *(&self->_isHighlight + 1) &= ~1u;
}

- (void)setIsSummarized:(BOOL)a3
{
  *(&self->_isHighlight + 1) |= 2u;
  self->_isSummarized = a3;
}

- (BOOL)hasIsSummarized
{
  return (*((unsigned __int8 *)&self->_isHighlight + 1) >> 1) & 1;
}

- (void)setHasIsSummarized:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isHighlight + 1) = *(&self->_isHighlight + 1) & 0xFD | v3;
}

- (void)deleteIsSummarized
{
  -[FLOWSchemaFLOWNotificationContext setIsSummarized:](self, "setIsSummarized:", 0);
  *(&self->_isHighlight + 1) &= ~2u;
}

- (void)setIsHighlight:(BOOL)a3
{
  *(&self->_isHighlight + 1) |= 4u;
  self->_isHighlight = a3;
}

- (BOOL)hasIsHighlight
{
  return (*((unsigned __int8 *)&self->_isHighlight + 1) >> 2) & 1;
}

- (void)setHasIsHighlight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isHighlight + 1) = *(&self->_isHighlight + 1) & 0xFB | v3;
}

- (void)deleteIsHighlight
{
  -[FLOWSchemaFLOWNotificationContext setIsHighlight:](self, "setIsHighlight:", 0);
  *(&self->_isHighlight + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWNotificationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_isHighlight + 1);
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    if ((*(&self->_isHighlight + 1) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(&self->_isHighlight + 1) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  v5 = *(&self->_isHighlight + 1);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isLongNotification;
  int v8;
  int isSummarized;
  int v10;
  int isHighlight;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = *((unsigned __int8 *)&self->_isHighlight + 1);
  v6 = v4[11];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_14;
  if ((v5 & 1) != 0)
  {
    isLongNotification = self->_isLongNotification;
    if (isLongNotification != objc_msgSend(v4, "isLongNotification"))
      goto LABEL_14;
    v5 = *((unsigned __int8 *)&self->_isHighlight + 1);
    v6 = v4[11];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    isSummarized = self->_isSummarized;
    if (isSummarized == objc_msgSend(v4, "isSummarized"))
    {
      v5 = *((unsigned __int8 *)&self->_isHighlight + 1);
      v6 = v4[11];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    isHighlight = self->_isHighlight;
    if (isHighlight != objc_msgSend(v4, "isHighlight"))
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

  if (!*(&self->_isHighlight + 1))
  {
    v2 = 0;
    if ((*(&self->_isHighlight + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(&self->_isHighlight + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isLongNotification;
  if ((*(&self->_isHighlight + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isSummarized;
  if ((*(&self->_isHighlight + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_isHighlight;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isHighlight + 1);
  if ((v4 & 4) == 0)
  {
    if (!*(&self->_isHighlight + 1))
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWNotificationContext isLongNotification](self, "isLongNotification"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isLongNotification"));

    if ((*(&self->_isHighlight + 1) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWNotificationContext isHighlight](self, "isHighlight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isHighlight"));

  v4 = *(&self->_isHighlight + 1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWNotificationContext isSummarized](self, "isSummarized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isSummarized"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWNotificationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWNotificationContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWNotificationContext *v5;
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
    self = -[FLOWSchemaFLOWNotificationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWNotificationContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWNotificationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  FLOWSchemaFLOWNotificationContext *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWNotificationContext;
  v5 = -[FLOWSchemaFLOWNotificationContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLongNotification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWNotificationContext setIsLongNotification:](v5, "setIsLongNotification:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSummarized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWNotificationContext setIsSummarized:](v5, "setIsSummarized:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWNotificationContext setIsHighlight:](v5, "setIsHighlight:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)isLongNotification
{
  return self->_isLongNotification;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

@end
