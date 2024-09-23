@implementation SISchemaPersonalization

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
  v9.super_class = (Class)SISchemaPersonalization;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaPersonalization voiceSettings](self, "voiceSettings", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaPersonalization deleteVoiceSettings](self, "deleteVoiceSettings");
  return v5;
}

- (void)setPersonalDomainsSetup:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_personalDomainsSetup = a3;
}

- (BOOL)hasPersonalDomainsSetup
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPersonalDomainsSetup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePersonalDomainsSetup
{
  -[SISchemaPersonalization setPersonalDomainsSetup:](self, "setPersonalDomainsSetup:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAppleMusicSubscriber:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_appleMusicSubscriber = a3;
}

- (BOOL)hasAppleMusicSubscriber
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppleMusicSubscriber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAppleMusicSubscriber
{
  -[SISchemaPersonalization setAppleMusicSubscriber:](self, "setAppleMusicSubscriber:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteVoiceSettings
{
  -[SISchemaPersonalization setVoiceSettings:](self, "setVoiceSettings:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPersonalizationReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $4142FBF9193150CF46D88E01D576423E has;
  unsigned int v6;
  int personalDomainsSetup;
  int v8;
  int appleMusicSubscriber;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    personalDomainsSetup = self->_personalDomainsSetup;
    if (personalDomainsSetup != objc_msgSend(v4, "personalDomainsSetup"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (appleMusicSubscriber = self->_appleMusicSubscriber,
          appleMusicSubscriber == objc_msgSend(v4, "appleMusicSubscriber")))
    {
      -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voiceSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "voiceSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_personalDomainsSetup;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SISchemaVoiceSettings hash](self->_voiceSettings, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_appleMusicSubscriber;
  return v3 ^ v2 ^ -[SISchemaVoiceSettings hash](self->_voiceSettings, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaPersonalization appleMusicSubscriber](self, "appleMusicSubscriber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleMusicSubscriber"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaPersonalization personalDomainsSetup](self, "personalDomainsSetup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("personalDomainsSetup"));

  }
  if (self->_voiceSettings)
  {
    -[SISchemaPersonalization voiceSettings](self, "voiceSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("voiceSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("voiceSettings"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaPersonalization dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaPersonalization)initWithJSON:(id)a3
{
  void *v4;
  SISchemaPersonalization *v5;
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
    self = -[SISchemaPersonalization initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaPersonalization)initWithDictionary:(id)a3
{
  id v4;
  SISchemaPersonalization *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaVoiceSettings *v9;
  SISchemaPersonalization *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaPersonalization;
  v5 = -[SISchemaPersonalization init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalDomainsSetup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPersonalization setPersonalDomainsSetup:](v5, "setPersonalDomainsSetup:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleMusicSubscriber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaPersonalization setAppleMusicSubscriber:](v5, "setAppleMusicSubscriber:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaVoiceSettings initWithDictionary:]([SISchemaVoiceSettings alloc], "initWithDictionary:", v8);
      -[SISchemaPersonalization setVoiceSettings:](v5, "setVoiceSettings:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (BOOL)personalDomainsSetup
{
  return self->_personalDomainsSetup;
}

- (BOOL)appleMusicSubscriber
{
  return self->_appleMusicSubscriber;
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSettings, a3);
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSettings, 0);
}

@end
