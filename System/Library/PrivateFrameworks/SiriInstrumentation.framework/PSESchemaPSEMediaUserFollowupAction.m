@implementation PSESchemaPSEMediaUserFollowupAction

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
  v9.super_class = (Class)PSESchemaPSEMediaUserFollowupAction;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PSESchemaPSEMediaUserFollowupAction deleteMediaEntitySimilarity](self, "deleteMediaEntitySimilarity");
  return v5;
}

- (void)setState:(int)a3
{
  *(&self->_isSubscriber + 1) |= 1u;
  self->_state = a3;
}

- (BOOL)hasState
{
  return *(&self->_isSubscriber + 1);
}

- (void)setHasState:(BOOL)a3
{
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFE | a3;
}

- (void)deleteState
{
  -[PSESchemaPSEMediaUserFollowupAction setState:](self, "setState:", 0);
  *(&self->_isSubscriber + 1) &= ~1u;
}

- (void)setMediaContentDurationBucket:(int)a3
{
  *(&self->_isSubscriber + 1) |= 2u;
  self->_mediaContentDurationBucket = a3;
}

- (BOOL)hasMediaContentDurationBucket
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 1) & 1;
}

- (void)setHasMediaContentDurationBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFD | v3;
}

- (void)deleteMediaContentDurationBucket
{
  -[PSESchemaPSEMediaUserFollowupAction setMediaContentDurationBucket:](self, "setMediaContentDurationBucket:", 0);
  *(&self->_isSubscriber + 1) &= ~2u;
}

- (void)setIsSameAppUsed:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 4u;
  self->_isSameAppUsed = a3;
}

- (BOOL)hasIsSameAppUsed
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 2) & 1;
}

- (void)setHasIsSameAppUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xFB | v3;
}

- (void)deleteIsSameAppUsed
{
  -[PSESchemaPSEMediaUserFollowupAction setIsSameAppUsed:](self, "setIsSameAppUsed:", 0);
  *(&self->_isSubscriber + 1) &= ~4u;
}

- (void)setIsFirstPartyAppUsedForFollowup:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 8u;
  self->_isFirstPartyAppUsedForFollowup = a3;
}

- (BOOL)hasIsFirstPartyAppUsedForFollowup
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 3) & 1;
}

- (void)setHasIsFirstPartyAppUsedForFollowup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xF7 | v3;
}

- (void)deleteIsFirstPartyAppUsedForFollowup
{
  -[PSESchemaPSEMediaUserFollowupAction setIsFirstPartyAppUsedForFollowup:](self, "setIsFirstPartyAppUsedForFollowup:", 0);
  *(&self->_isSubscriber + 1) &= ~8u;
}

- (BOOL)hasMediaEntitySimilarity
{
  return self->_mediaEntitySimilarity != 0;
}

- (void)deleteMediaEntitySimilarity
{
  -[PSESchemaPSEMediaUserFollowupAction setMediaEntitySimilarity:](self, "setMediaEntitySimilarity:", 0);
}

- (void)setIsAirPlay:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 0x10u;
  self->_isAirPlay = a3;
}

- (BOOL)hasIsAirPlay
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 4) & 1;
}

- (void)setHasIsAirPlay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xEF | v3;
}

- (void)deleteIsAirPlay
{
  -[PSESchemaPSEMediaUserFollowupAction setIsAirPlay:](self, "setIsAirPlay:", 0);
  *(&self->_isSubscriber + 1) &= ~0x10u;
}

- (void)setMediaType:(int)a3
{
  *(&self->_isSubscriber + 1) |= 0x20u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 5) & 1;
}

- (void)setHasMediaType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xDF | v3;
}

- (void)deleteMediaType
{
  -[PSESchemaPSEMediaUserFollowupAction setMediaType:](self, "setMediaType:", 0);
  *(&self->_isSubscriber + 1) &= ~0x20u;
}

- (void)setIsSubscriber:(BOOL)a3
{
  *(&self->_isSubscriber + 1) |= 0x40u;
  self->_isSubscriber = a3;
}

- (BOOL)hasIsSubscriber
{
  return (*((unsigned __int8 *)&self->_isSubscriber + 1) >> 6) & 1;
}

- (void)setHasIsSubscriber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isSubscriber + 1) = *(&self->_isSubscriber + 1) & 0xBF | v3;
}

- (void)deleteIsSubscriber
{
  -[PSESchemaPSEMediaUserFollowupAction setIsSubscriber:](self, "setIsSubscriber:", 0);
  *(&self->_isSubscriber + 1) &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMediaUserFollowupActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_isSubscriber + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(&self->_isSubscriber + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isSubscriber + 1) & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(&self->_isSubscriber + 1);
  if ((v7 & 0x10) == 0)
  {
    if ((*(&self->_isSubscriber + 1) & 0x20) == 0)
      goto LABEL_10;
LABEL_18:
    PBDataWriterWriteInt32Field();
    if ((*(&self->_isSubscriber + 1) & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v7 = *(&self->_isSubscriber + 1);
  if ((v7 & 0x20) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v7 & 0x40) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int state;
  int v8;
  int mediaContentDurationBucket;
  int v10;
  int isSameAppUsed;
  int v12;
  int isFirstPartyAppUsedForFollowup;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int isAirPlay;
  int v26;
  int mediaType;
  int v28;
  int isSubscriber;
  BOOL v30;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
  v6 = v4[41];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_35;
  if ((v5 & 1) != 0)
  {
    state = self->_state;
    if (state != objc_msgSend(v4, "state"))
      goto LABEL_35;
    v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    v6 = v4[41];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_35;
  if (v8)
  {
    mediaContentDurationBucket = self->_mediaContentDurationBucket;
    if (mediaContentDurationBucket != objc_msgSend(v4, "mediaContentDurationBucket"))
      goto LABEL_35;
    v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    v6 = v4[41];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_35;
  if (v10)
  {
    isSameAppUsed = self->_isSameAppUsed;
    if (isSameAppUsed != objc_msgSend(v4, "isSameAppUsed"))
      goto LABEL_35;
    v5 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    v6 = v4[41];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_35;
  if (v12)
  {
    isFirstPartyAppUsedForFollowup = self->_isFirstPartyAppUsedForFollowup;
    if (isFirstPartyAppUsedForFollowup != objc_msgSend(v4, "isFirstPartyAppUsedForFollowup"))
      goto LABEL_35;
  }
  -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaEntitySimilarity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 == 0) == (v15 != 0))
  {

    goto LABEL_35;
  }
  -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaEntitySimilarity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_35;
  }
  else
  {

  }
  v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
  v23 = (v22 >> 4) & 1;
  v24 = v4[41];
  if (v23 != ((v24 >> 4) & 1))
  {
LABEL_35:
    v30 = 0;
    goto LABEL_36;
  }
  if (v23)
  {
    isAirPlay = self->_isAirPlay;
    if (isAirPlay != objc_msgSend(v4, "isAirPlay"))
      goto LABEL_35;
    v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
    v24 = v4[41];
  }
  v26 = (v22 >> 5) & 1;
  if (v26 != ((v24 >> 5) & 1))
    goto LABEL_35;
  if (v26)
  {
    mediaType = self->_mediaType;
    if (mediaType == objc_msgSend(v4, "mediaType"))
    {
      v22 = *((unsigned __int8 *)&self->_isSubscriber + 1);
      v24 = v4[41];
      goto LABEL_31;
    }
    goto LABEL_35;
  }
LABEL_31:
  v28 = (v22 >> 6) & 1;
  if (v28 != ((v24 >> 6) & 1))
    goto LABEL_35;
  if (v28)
  {
    isSubscriber = self->_isSubscriber;
    if (isSubscriber != objc_msgSend(v4, "isSubscriber"))
      goto LABEL_35;
  }
  v30 = 1;
LABEL_36:

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(&self->_isSubscriber + 1))
  {
    v3 = 2654435761 * self->_state;
    if ((*(&self->_isSubscriber + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_mediaContentDurationBucket;
      if ((*(&self->_isSubscriber + 1) & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(&self->_isSubscriber + 1) & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(&self->_isSubscriber + 1) & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(&self->_isSubscriber + 1) & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_isSameAppUsed;
  if ((*(&self->_isSubscriber + 1) & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_isFirstPartyAppUsedForFollowup;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[PSESchemaPSEMediaEntitySimilarity hash](self->_mediaEntitySimilarity, "hash");
  if ((*(&self->_isSubscriber + 1) & 0x10) == 0)
  {
    v8 = 0;
    if ((*(&self->_isSubscriber + 1) & 0x20) != 0)
      goto LABEL_12;
LABEL_15:
    v9 = 0;
    if ((*(&self->_isSubscriber + 1) & 0x40) != 0)
      goto LABEL_13;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v7;
  }
  v8 = 2654435761 * self->_isAirPlay;
  if ((*(&self->_isSubscriber + 1) & 0x20) == 0)
    goto LABEL_15;
LABEL_12:
  v9 = 2654435761 * self->_mediaType;
  if ((*(&self->_isSubscriber + 1) & 0x40) == 0)
    goto LABEL_16;
LABEL_13:
  v10 = 2654435761 * self->_isSubscriber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  unsigned int v15;
  const __CFString *v16;
  unsigned int v17;
  const __CFString *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isAirPlay](self, "isAirPlay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isAirPlay"));

    v4 = *(&self->_isSubscriber + 1);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isSubscriber + 1) & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isFirstPartyAppUsedForFollowup](self, "isFirstPartyAppUsedForFollowup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isFirstPartyAppUsedForFollowup"));

  v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isSameAppUsed](self, "isSameAppUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSameAppUsed"));

  v4 = *(&self->_isSubscriber + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_15;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PSESchemaPSEMediaUserFollowupAction isSubscriber](self, "isSubscriber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSubscriber"));

  if ((*(&self->_isSubscriber + 1) & 2) == 0)
    goto LABEL_15;
LABEL_11:
  v9 = -[PSESchemaPSEMediaUserFollowupAction mediaContentDurationBucket](self, "mediaContentDurationBucket") - 1;
  if (v9 > 0x10)
    v10 = CFSTR("PSEMEDIACONTENTDURATIONBUCKET_UNKNOWN");
  else
    v10 = off_1E5639D80[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("mediaContentDurationBucket"));
LABEL_15:
  if (self->_mediaEntitySimilarity)
  {
    -[PSESchemaPSEMediaUserFollowupAction mediaEntitySimilarity](self, "mediaEntitySimilarity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("mediaEntitySimilarity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("mediaEntitySimilarity"));

    }
  }
  v14 = *(&self->_isSubscriber + 1);
  if ((v14 & 0x20) != 0)
  {
    v15 = -[PSESchemaPSEMediaUserFollowupAction mediaType](self, "mediaType") - 1;
    if (v15 > 6)
      v16 = CFSTR("MEDIATYPE_UNKNOWN");
    else
      v16 = off_1E5639E08[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaType"));
    v14 = *(&self->_isSubscriber + 1);
  }
  if ((v14 & 1) != 0)
  {
    v17 = -[PSESchemaPSEMediaUserFollowupAction state](self, "state") - 1;
    if (v17 > 5)
      v18 = CFSTR("MEDIAPLAYBACKSTATE_UNKNOWN");
    else
      v18 = off_1E5639E40[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("state"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEMediaUserFollowupAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEMediaUserFollowupAction)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEMediaUserFollowupAction *v5;
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
    self = -[PSESchemaPSEMediaUserFollowupAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEMediaUserFollowupAction)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEMediaUserFollowupAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PSESchemaPSEMediaEntitySimilarity *v11;
  void *v12;
  void *v13;
  void *v14;
  PSESchemaPSEMediaUserFollowupAction *v15;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSESchemaPSEMediaUserFollowupAction;
  v5 = -[PSESchemaPSEMediaUserFollowupAction init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setState:](v5, "setState:", objc_msgSend(v6, "intValue"));
    v17 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaContentDurationBucket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setMediaContentDurationBucket:](v5, "setMediaContentDurationBucket:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSameAppUsed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setIsSameAppUsed:](v5, "setIsSameAppUsed:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstPartyAppUsedForFollowup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setIsFirstPartyAppUsedForFollowup:](v5, "setIsFirstPartyAppUsedForFollowup:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEntitySimilarity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PSESchemaPSEMediaEntitySimilarity initWithDictionary:]([PSESchemaPSEMediaEntitySimilarity alloc], "initWithDictionary:", v10);
      -[PSESchemaPSEMediaUserFollowupAction setMediaEntitySimilarity:](v5, "setMediaEntitySimilarity:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAirPlay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setIsAirPlay:](v5, "setIsAirPlay:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setMediaType:](v5, "setMediaType:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSubscriber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMediaUserFollowupAction setIsSubscriber:](v5, "setIsSubscriber:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (int)state
{
  return self->_state;
}

- (int)mediaContentDurationBucket
{
  return self->_mediaContentDurationBucket;
}

- (BOOL)isSameAppUsed
{
  return self->_isSameAppUsed;
}

- (BOOL)isFirstPartyAppUsedForFollowup
{
  return self->_isFirstPartyAppUsedForFollowup;
}

- (PSESchemaPSEMediaEntitySimilarity)mediaEntitySimilarity
{
  return self->_mediaEntitySimilarity;
}

- (void)setMediaEntitySimilarity:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitySimilarity, a3);
}

- (BOOL)isAirPlay
{
  return self->_isAirPlay;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)isSubscriber
{
  return self->_isSubscriber;
}

- (void)setHasMediaEntitySimilarity:(BOOL)a3
{
  *(&self->_isSubscriber + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntitySimilarity, 0);
}

@end
