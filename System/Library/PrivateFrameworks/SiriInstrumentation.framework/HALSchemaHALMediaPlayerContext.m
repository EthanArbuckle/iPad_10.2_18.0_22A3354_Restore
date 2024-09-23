@implementation HALSchemaHALMediaPlayerContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_state = a3;
}

- (BOOL)hasState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteState
{
  -[HALSchemaHALMediaPlayerContext setState:](self, "setState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteType
{
  -[HALSchemaHALMediaPlayerContext setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTimeSinceLastMediaPlaybackInSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeSinceLastMediaPlaybackInSeconds = a3;
}

- (BOOL)hasTimeSinceLastMediaPlaybackInSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTimeSinceLastMediaPlaybackInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTimeSinceLastMediaPlaybackInSeconds
{
  -[HALSchemaHALMediaPlayerContext setTimeSinceLastMediaPlaybackInSeconds:](self, "setTimeSinceLastMediaPlaybackInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALMediaPlayerContextReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $38BB1AD574BD190F97100C1A7C8D0EDD has;
  unsigned int v6;
  int state;
  int v8;
  int type;
  int v10;
  unsigned int timeSinceLastMediaPlaybackInSeconds;
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
    state = self->_state;
    if (state != objc_msgSend(v4, "state"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    type = self->_type;
    if (type == objc_msgSend(v4, "type"))
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
    timeSinceLastMediaPlaybackInSeconds = self->_timeSinceLastMediaPlaybackInSeconds;
    if (timeSinceLastMediaPlaybackInSeconds != objc_msgSend(v4, "timeSinceLastMediaPlaybackInSeconds"))
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
  v2 = 2654435761 * self->_state;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_timeSinceLastMediaPlaybackInSeconds;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HALSchemaHALMediaPlayerContext timeSinceLastMediaPlaybackInSeconds](self, "timeSinceLastMediaPlaybackInSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("timeSinceLastMediaPlaybackInSeconds"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  v5 = -[HALSchemaHALMediaPlayerContext state](self, "state") - 1;
  if (v5 > 5)
    v6 = CFSTR("HALMEDIAPLAYERSTATE_UNKNOWN");
  else
    v6 = off_1E562F8D0[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("state"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_3:
  if ((has & 2) == 0)
    goto LABEL_14;
LABEL_10:
  v8 = -[HALSchemaHALMediaPlayerContext type](self, "type") - 1;
  if (v8 > 0x1B)
    v9 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
  else
    v9 = off_1E562F900[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("type"));
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALMediaPlayerContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALMediaPlayerContext)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALMediaPlayerContext *v5;
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
    self = -[HALSchemaHALMediaPlayerContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALMediaPlayerContext)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALMediaPlayerContext *v5;
  void *v6;
  void *v7;
  void *v8;
  HALSchemaHALMediaPlayerContext *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HALSchemaHALMediaPlayerContext;
  v5 = -[HALSchemaHALMediaPlayerContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALMediaPlayerContext setState:](v5, "setState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALMediaPlayerContext setType:](v5, "setType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastMediaPlaybackInSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALMediaPlayerContext setTimeSinceLastMediaPlaybackInSeconds:](v5, "setTimeSinceLastMediaPlaybackInSeconds:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (int)state
{
  return self->_state;
}

- (int)type
{
  return self->_type;
}

- (unsigned)timeSinceLastMediaPlaybackInSeconds
{
  return self->_timeSinceLastMediaPlaybackInSeconds;
}

@end
