@implementation SISchemaMultiUserSetup

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumGuestsAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numGuestsAccepted = a3;
}

- (BOOL)hasNumGuestsAccepted
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumGuestsAccepted:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumGuestsAccepted
{
  -[SISchemaMultiUserSetup setNumGuestsAccepted:](self, "setNumGuestsAccepted:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumParticipantsWithTrust:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numParticipantsWithTrust = a3;
}

- (BOOL)hasNumParticipantsWithTrust
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumParticipantsWithTrust:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteNumParticipantsWithTrust
{
  -[SISchemaMultiUserSetup setNumParticipantsWithTrust:](self, "setNumParticipantsWithTrust:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumUsersWhoSyncedRecognizeMyVoice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numUsersWhoSyncedRecognizeMyVoice = a3;
}

- (BOOL)hasNumUsersWhoSyncedRecognizeMyVoice
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumUsersWhoSyncedRecognizeMyVoice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumUsersWhoSyncedRecognizeMyVoice
{
  -[SISchemaMultiUserSetup setNumUsersWhoSyncedRecognizeMyVoice:](self, "setNumUsersWhoSyncedRecognizeMyVoice:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNumUsersWithRecognizeMyVoiceEnabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numUsersWithRecognizeMyVoiceEnabled = a3;
}

- (BOOL)hasNumUsersWithRecognizeMyVoiceEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumUsersWithRecognizeMyVoiceEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNumUsersWithRecognizeMyVoiceEnabled
{
  -[SISchemaMultiUserSetup setNumUsersWithRecognizeMyVoiceEnabled:](self, "setNumUsersWithRecognizeMyVoiceEnabled:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumVoiceProfilesAvailable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numVoiceProfilesAvailable = a3;
}

- (BOOL)hasNumVoiceProfilesAvailable
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumVoiceProfilesAvailable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumVoiceProfilesAvailable
{
  -[SISchemaMultiUserSetup setNumVoiceProfilesAvailable:](self, "setNumVoiceProfilesAvailable:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumUsersWithPersonalRequestsEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numUsersWithPersonalRequestsEnabled = a3;
}

- (BOOL)hasNumUsersWithPersonalRequestsEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumUsersWithPersonalRequestsEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumUsersWithPersonalRequestsEnabled
{
  -[SISchemaMultiUserSetup setNumUsersWithPersonalRequestsEnabled:](self, "setNumUsersWithPersonalRequestsEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumUsersWithMatchingSiriLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numUsersWithMatchingSiriLanguage = a3;
}

- (BOOL)hasNumUsersWithMatchingSiriLanguage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumUsersWithMatchingSiriLanguage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumUsersWithMatchingSiriLanguage
{
  -[SISchemaMultiUserSetup setNumUsersWithMatchingSiriLanguage:](self, "setNumUsersWithMatchingSiriLanguage:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumUsersWithSiriCloudSyncEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numUsersWithSiriCloudSyncEnabled = a3;
}

- (BOOL)hasNumUsersWithSiriCloudSyncEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumUsersWithSiriCloudSyncEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumUsersWithSiriCloudSyncEnabled
{
  -[SISchemaMultiUserSetup setNumUsersWithSiriCloudSyncEnabled:](self, "setNumUsersWithSiriCloudSyncEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumUsersWithLocationServicesEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numUsersWithLocationServicesEnabled = a3;
}

- (BOOL)hasNumUsersWithLocationServicesEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumUsersWithLocationServicesEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumUsersWithLocationServicesEnabled
{
  -[SISchemaMultiUserSetup setNumUsersWithLocationServicesEnabled:](self, "setNumUsersWithLocationServicesEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaMultiUserSetupReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $0A470813BFCAACBE0680D9256D259B0C has;
  unsigned int v6;
  unsigned int numGuestsAccepted;
  int v8;
  unsigned int numParticipantsWithTrust;
  int v10;
  unsigned int numUsersWhoSyncedRecognizeMyVoice;
  int v12;
  unsigned int numUsersWithRecognizeMyVoiceEnabled;
  int v14;
  unsigned int numVoiceProfilesAvailable;
  int v16;
  int numUsersWithPersonalRequestsEnabled;
  int v18;
  int numUsersWithMatchingSiriLanguage;
  int v20;
  int numUsersWithSiriCloudSyncEnabled;
  int v22;
  int numUsersWithLocationServicesEnabled;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[22];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numGuestsAccepted = self->_numGuestsAccepted;
    if (numGuestsAccepted != objc_msgSend(v4, "numGuestsAccepted"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    numParticipantsWithTrust = self->_numParticipantsWithTrust;
    if (numParticipantsWithTrust != objc_msgSend(v4, "numParticipantsWithTrust"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    numUsersWhoSyncedRecognizeMyVoice = self->_numUsersWhoSyncedRecognizeMyVoice;
    if (numUsersWhoSyncedRecognizeMyVoice != objc_msgSend(v4, "numUsersWhoSyncedRecognizeMyVoice"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    numUsersWithRecognizeMyVoiceEnabled = self->_numUsersWithRecognizeMyVoiceEnabled;
    if (numUsersWithRecognizeMyVoiceEnabled != objc_msgSend(v4, "numUsersWithRecognizeMyVoiceEnabled"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    numVoiceProfilesAvailable = self->_numVoiceProfilesAvailable;
    if (numVoiceProfilesAvailable != objc_msgSend(v4, "numVoiceProfilesAvailable"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    numUsersWithPersonalRequestsEnabled = self->_numUsersWithPersonalRequestsEnabled;
    if (numUsersWithPersonalRequestsEnabled != objc_msgSend(v4, "numUsersWithPersonalRequestsEnabled"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    numUsersWithMatchingSiriLanguage = self->_numUsersWithMatchingSiriLanguage;
    if (numUsersWithMatchingSiriLanguage != objc_msgSend(v4, "numUsersWithMatchingSiriLanguage"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    numUsersWithSiriCloudSyncEnabled = self->_numUsersWithSiriCloudSyncEnabled;
    if (numUsersWithSiriCloudSyncEnabled == objc_msgSend(v4, "numUsersWithSiriCloudSyncEnabled"))
    {
      has = self->_has;
      v6 = v4[22];
      goto LABEL_34;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_38;
  if (v22)
  {
    numUsersWithLocationServicesEnabled = self->_numUsersWithLocationServicesEnabled;
    if (numUsersWithLocationServicesEnabled != objc_msgSend(v4, "numUsersWithLocationServicesEnabled"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_numGuestsAccepted;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numParticipantsWithTrust;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numUsersWhoSyncedRecognizeMyVoice;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numUsersWithRecognizeMyVoiceEnabled;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numVoiceProfilesAvailable;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_numUsersWithPersonalRequestsEnabled;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_numUsersWithMatchingSiriLanguage;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_numUsersWithSiriCloudSyncEnabled;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_numUsersWithLocationServicesEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numGuestsAccepted](self, "numGuestsAccepted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numGuestsAccepted"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numParticipantsWithTrust](self, "numParticipantsWithTrust"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numParticipantsWithTrust"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numUsersWhoSyncedRecognizeMyVoice](self, "numUsersWhoSyncedRecognizeMyVoice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numUsersWhoSyncedRecognizeMyVoice"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithLocationServicesEnabled](self, "numUsersWithLocationServicesEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numUsersWithLocationServicesEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithMatchingSiriLanguage](self, "numUsersWithMatchingSiriLanguage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numUsersWithMatchingSiriLanguage"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithPersonalRequestsEnabled](self, "numUsersWithPersonalRequestsEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numUsersWithPersonalRequestsEnabled"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithSiriCloudSyncEnabled](self, "numUsersWithSiriCloudSyncEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numUsersWithSiriCloudSyncEnabled"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numUsersWithRecognizeMyVoiceEnabled](self, "numUsersWithRecognizeMyVoiceEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numUsersWithRecognizeMyVoiceEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numVoiceProfilesAvailable](self, "numVoiceProfilesAvailable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numVoiceProfilesAvailable"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaMultiUserSetup dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaMultiUserSetup)initWithJSON:(id)a3
{
  void *v4;
  SISchemaMultiUserSetup *v5;
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
    self = -[SISchemaMultiUserSetup initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaMultiUserSetup)initWithDictionary:(id)a3
{
  id v4;
  SISchemaMultiUserSetup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SISchemaMultiUserSetup *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaMultiUserSetup;
  v5 = -[SISchemaMultiUserSetup init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numGuestsAccepted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumGuestsAccepted:](v5, "setNumGuestsAccepted:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numParticipantsWithTrust"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumParticipantsWithTrust:](v5, "setNumParticipantsWithTrust:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWhoSyncedRecognizeMyVoice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWhoSyncedRecognizeMyVoice:](v5, "setNumUsersWhoSyncedRecognizeMyVoice:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWithRecognizeMyVoiceEnabled"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWithRecognizeMyVoiceEnabled:](v5, "setNumUsersWithRecognizeMyVoiceEnabled:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numVoiceProfilesAvailable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumVoiceProfilesAvailable:](v5, "setNumVoiceProfilesAvailable:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWithPersonalRequestsEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWithPersonalRequestsEnabled:](v5, "setNumUsersWithPersonalRequestsEnabled:", objc_msgSend(v11, "intValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWithMatchingSiriLanguage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWithMatchingSiriLanguage:](v5, "setNumUsersWithMatchingSiriLanguage:", objc_msgSend(v12, "intValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWithSiriCloudSyncEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWithSiriCloudSyncEnabled:](v5, "setNumUsersWithSiriCloudSyncEnabled:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUsersWithLocationServicesEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaMultiUserSetup setNumUsersWithLocationServicesEnabled:](v5, "setNumUsersWithLocationServicesEnabled:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (unsigned)numGuestsAccepted
{
  return self->_numGuestsAccepted;
}

- (unsigned)numParticipantsWithTrust
{
  return self->_numParticipantsWithTrust;
}

- (unsigned)numUsersWhoSyncedRecognizeMyVoice
{
  return self->_numUsersWhoSyncedRecognizeMyVoice;
}

- (unsigned)numUsersWithRecognizeMyVoiceEnabled
{
  return self->_numUsersWithRecognizeMyVoiceEnabled;
}

- (unsigned)numVoiceProfilesAvailable
{
  return self->_numVoiceProfilesAvailable;
}

- (int)numUsersWithPersonalRequestsEnabled
{
  return self->_numUsersWithPersonalRequestsEnabled;
}

- (int)numUsersWithMatchingSiriLanguage
{
  return self->_numUsersWithMatchingSiriLanguage;
}

- (int)numUsersWithSiriCloudSyncEnabled
{
  return self->_numUsersWithSiriCloudSyncEnabled;
}

- (int)numUsersWithLocationServicesEnabled
{
  return self->_numUsersWithLocationServicesEnabled;
}

@end
