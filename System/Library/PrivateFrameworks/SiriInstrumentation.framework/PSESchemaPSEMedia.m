@implementation PSESchemaPSEMedia

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
  v9.super_class = (Class)PSESchemaPSEMedia;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PSESchemaPSEMedia deleteLastMediaUserFollowupAction](self, "deleteLastMediaUserFollowupAction");
  return v5;
}

- (void)setPlayDurationInSeconds:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playDurationInSeconds = a3;
}

- (BOOL)hasPlayDurationInSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPlayDurationInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePlayDurationInSeconds
{
  -[PSESchemaPSEMedia setPlayDurationInSeconds:](self, "setPlayDurationInSeconds:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMediaContentDurationBucket:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mediaContentDurationBucket = a3;
}

- (BOOL)hasMediaContentDurationBucket
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMediaContentDurationBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMediaContentDurationBucket
{
  -[PSESchemaPSEMedia setMediaContentDurationBucket:](self, "setMediaContentDurationBucket:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasLastMediaUserFollowupAction
{
  return self->_lastMediaUserFollowupAction != 0;
}

- (void)deleteLastMediaUserFollowupAction
{
  -[PSESchemaPSEMedia setLastMediaUserFollowupAction:](self, "setLastMediaUserFollowupAction:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMediaReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $31CD8F6DA8113E2119A665221936E225 has;
  unsigned int v6;
  double playDurationInSeconds;
  double v8;
  int v9;
  int mediaContentDurationBucket;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    playDurationInSeconds = self->_playDurationInSeconds;
    objc_msgSend(v4, "playDurationInSeconds");
    if (playDurationInSeconds != v8)
      goto LABEL_14;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9
      || (mediaContentDurationBucket = self->_mediaContentDurationBucket,
          mediaContentDurationBucket == objc_msgSend(v4, "mediaContentDurationBucket")))
    {
      -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastMediaUserFollowupAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

LABEL_17:
          v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lastMediaUserFollowupAction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double playDurationInSeconds;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    playDurationInSeconds = self->_playDurationInSeconds;
    v6 = -playDurationInSeconds;
    if (playDurationInSeconds >= 0.0)
      v6 = self->_playDurationInSeconds;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_mediaContentDurationBucket;
  else
    v9 = 0;
  return v9 ^ v4 ^ -[PSESchemaPSEMediaUserFollowupAction hash](self->_lastMediaUserFollowupAction, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lastMediaUserFollowupAction)
  {
    -[PSESchemaPSEMedia lastMediaUserFollowupAction](self, "lastMediaUserFollowupAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lastMediaUserFollowupAction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lastMediaUserFollowupAction"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = -[PSESchemaPSEMedia mediaContentDurationBucket](self, "mediaContentDurationBucket") - 1;
    if (v8 > 0x10)
      v9 = CFSTR("PSEMEDIACONTENTDURATIONBUCKET_UNKNOWN");
    else
      v9 = off_1E5639CF8[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mediaContentDurationBucket"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PSESchemaPSEMedia playDurationInSeconds](self, "playDurationInSeconds");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("playDurationInSeconds"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEMedia dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEMedia)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEMedia *v5;
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
    self = -[PSESchemaPSEMedia initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEMedia)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEMedia *v5;
  void *v6;
  void *v7;
  void *v8;
  PSESchemaPSEMediaUserFollowupAction *v9;
  PSESchemaPSEMedia *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEMedia;
  v5 = -[PSESchemaPSEMedia init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playDurationInSeconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PSESchemaPSEMedia setPlayDurationInSeconds:](v5, "setPlayDurationInSeconds:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaContentDurationBucket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEMedia setMediaContentDurationBucket:](v5, "setMediaContentDurationBucket:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastMediaUserFollowupAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PSESchemaPSEMediaUserFollowupAction initWithDictionary:]([PSESchemaPSEMediaUserFollowupAction alloc], "initWithDictionary:", v8);
      -[PSESchemaPSEMedia setLastMediaUserFollowupAction:](v5, "setLastMediaUserFollowupAction:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (double)playDurationInSeconds
{
  return self->_playDurationInSeconds;
}

- (int)mediaContentDurationBucket
{
  return self->_mediaContentDurationBucket;
}

- (PSESchemaPSEMediaUserFollowupAction)lastMediaUserFollowupAction
{
  return self->_lastMediaUserFollowupAction;
}

- (void)setLastMediaUserFollowupAction:(id)a3
{
  objc_storeStrong((id *)&self->_lastMediaUserFollowupAction, a3);
}

- (void)setHasLastMediaUserFollowupAction:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMediaUserFollowupAction, 0);
}

@end
