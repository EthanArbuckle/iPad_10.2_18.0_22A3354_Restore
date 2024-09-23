@implementation POMMESSchemaPOMMESSiriPegasusMetadata

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESSiriPegasusMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESSiriPegasusMetadata deleteDeviceState](self, "deleteDeviceState");
  return v5;
}

- (void)setInteractionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_interactionType = a3;
}

- (BOOL)hasInteractionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInteractionType
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setInteractionType:](self, "setInteractionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsCarplay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isCarplay = a3;
}

- (BOOL)hasIsCarplay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsCarplay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsCarplay
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setIsCarplay:](self, "setIsCarplay:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMovieRestriction:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_movieRestriction = a3;
}

- (BOOL)hasMovieRestriction
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMovieRestriction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMovieRestriction
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setMovieRestriction:](self, "setMovieRestriction:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setTvRestriction:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tvRestriction = a3;
}

- (BOOL)hasTvRestriction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTvRestriction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTvRestriction
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setTvRestriction:](self, "setTvRestriction:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsInRestrictedSharingMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isInRestrictedSharingMode = a3;
}

- (BOOL)hasIsInRestrictedSharingMode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsInRestrictedSharingMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsInRestrictedSharingMode
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setIsInRestrictedSharingMode:](self, "setIsInRestrictedSharingMode:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isExplicitContentAllowed = a3;
}

- (BOOL)hasIsExplicitContentAllowed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsExplicitContentAllowed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsExplicitContentAllowed
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setIsExplicitContentAllowed:](self, "setIsExplicitContentAllowed:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setIsWebContentDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isWebContentDisabled = a3;
}

- (BOOL)hasIsWebContentDisabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasIsWebContentDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteIsWebContentDisabled
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setIsWebContentDisabled:](self, "setIsWebContentDisabled:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasDeviceState
{
  return self->_deviceState != 0;
}

- (void)deleteDeviceState
{
  -[POMMESSchemaPOMMESSiriPegasusMetadata setDeviceState:](self, "setDeviceState:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESSiriPegasusMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
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
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B8A71575146586EC048264BA4BA2D3EB has;
  unsigned int v6;
  int interactionType;
  int v8;
  int isCarplay;
  int v10;
  unsigned int movieRestriction;
  int v12;
  unsigned int tvRestriction;
  int v14;
  int isInRestrictedSharingMode;
  int v16;
  int isExplicitContentAllowed;
  int v18;
  int isWebContentDisabled;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    interactionType = self->_interactionType;
    if (interactionType != objc_msgSend(v4, "interactionType"))
      goto LABEL_34;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      isCarplay = self->_isCarplay;
      if (isCarplay != objc_msgSend(v4, "isCarplay"))
        goto LABEL_34;
      has = self->_has;
      v6 = v4[40];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        movieRestriction = self->_movieRestriction;
        if (movieRestriction != objc_msgSend(v4, "movieRestriction"))
          goto LABEL_34;
        has = self->_has;
        v6 = v4[40];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          tvRestriction = self->_tvRestriction;
          if (tvRestriction != objc_msgSend(v4, "tvRestriction"))
            goto LABEL_34;
          has = self->_has;
          v6 = v4[40];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            isInRestrictedSharingMode = self->_isInRestrictedSharingMode;
            if (isInRestrictedSharingMode != objc_msgSend(v4, "isInRestrictedSharingMode"))
              goto LABEL_34;
            has = self->_has;
            v6 = v4[40];
          }
          v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              isExplicitContentAllowed = self->_isExplicitContentAllowed;
              if (isExplicitContentAllowed != objc_msgSend(v4, "isExplicitContentAllowed"))
                goto LABEL_34;
              has = self->_has;
              v6 = v4[40];
            }
            v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 == ((v6 >> 6) & 1))
            {
              if (!v18
                || (isWebContentDisabled = self->_isWebContentDisabled,
                    isWebContentDisabled == objc_msgSend(v4, "isWebContentDisabled")))
              {
                -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "deviceState");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if ((v20 == 0) != (v21 != 0))
                {
                  -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (!v23)
                  {

LABEL_37:
                    v28 = 1;
                    goto LABEL_35;
                  }
                  v24 = (void *)v23;
                  -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "deviceState");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v25, "isEqual:", v26);

                  if ((v27 & 1) != 0)
                    goto LABEL_37;
                }
                else
                {

                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  v28 = 0;
LABEL_35:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_interactionType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isCarplay;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
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
    v4 = 2654435761 * self->_movieRestriction;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_tvRestriction;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isInRestrictedSharingMode;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[POMMESSchemaPOMMESDeviceState hash](self->_deviceState, "hash");
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_isExplicitContentAllowed;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_isWebContentDisabled;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[POMMESSchemaPOMMESDeviceState hash](self->_deviceState, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceState)
  {
    -[POMMESSchemaPOMMESSiriPegasusMetadata deviceState](self, "deviceState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceState"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = -[POMMESSchemaPOMMESSiriPegasusMetadata interactionType](self, "interactionType");
    v9 = CFSTR("POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_UNKNOWN");
    if (v8 == 1)
      v9 = CFSTR("POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_DIALOG_DRIVEN");
    if (v8 == 2)
      v10 = CFSTR("POMMESSIRIPEGASUSCONTEXTINTERACTIONTYPE_DISPLAY_DRIVEN");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("interactionType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isCarplay](self, "isCarplay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isCarplay"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isExplicitContentAllowed](self, "isExplicitContentAllowed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isExplicitContentAllowed"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isInRestrictedSharingMode](self, "isInRestrictedSharingMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isInRestrictedSharingMode"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESSiriPegasusMetadata movieRestriction](self, "movieRestriction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("movieRestriction"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESSiriPegasusMetadata isWebContentDisabled](self, "isWebContentDisabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isWebContentDisabled"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_18:
  if ((has & 8) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESSiriPegasusMetadata tvRestriction](self, "tvRestriction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tvRestriction"));

  }
LABEL_20:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESSiriPegasusMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESSiriPegasusMetadata *v5;
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
    self = -[POMMESSchemaPOMMESSiriPegasusMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESSiriPegasusMetadata)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESSiriPegasusMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  POMMESSchemaPOMMESDeviceState *v14;
  POMMESSchemaPOMMESSiriPegasusMetadata *v15;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)POMMESSchemaPOMMESSiriPegasusMetadata;
  v5 = -[POMMESSchemaPOMMESSiriPegasusMetadata init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setInteractionType:](v5, "setInteractionType:", objc_msgSend(v6, "intValue"));
    v17 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarplay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsCarplay:](v5, "setIsCarplay:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("movieRestriction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setMovieRestriction:](v5, "setMovieRestriction:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tvRestriction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setTvRestriction:](v5, "setTvRestriction:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInRestrictedSharingMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsInRestrictedSharingMode:](v5, "setIsInRestrictedSharingMode:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExplicitContentAllowed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsExplicitContentAllowed:](v5, "setIsExplicitContentAllowed:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWebContentDisabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESSiriPegasusMetadata setIsWebContentDisabled:](v5, "setIsWebContentDisabled:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[POMMESSchemaPOMMESDeviceState initWithDictionary:]([POMMESSchemaPOMMESDeviceState alloc], "initWithDictionary:", v13);
      -[POMMESSchemaPOMMESSiriPegasusMetadata setDeviceState:](v5, "setDeviceState:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (BOOL)isCarplay
{
  return self->_isCarplay;
}

- (unsigned)movieRestriction
{
  return self->_movieRestriction;
}

- (unsigned)tvRestriction
{
  return self->_tvRestriction;
}

- (BOOL)isInRestrictedSharingMode
{
  return self->_isInRestrictedSharingMode;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_isExplicitContentAllowed;
}

- (BOOL)isWebContentDisabled
{
  return self->_isWebContentDisabled;
}

- (POMMESSchemaPOMMESDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
}

- (void)setHasDeviceState:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
