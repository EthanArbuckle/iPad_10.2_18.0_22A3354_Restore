@implementation POMMESSchemaPOMMESDeviceState

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCompanionName
{
  return self->_companionName != 0;
}

- (void)deleteCompanionName
{
  -[POMMESSchemaPOMMESDeviceState setCompanionName:](self, "setCompanionName:", 0);
}

- (void)setIsCarDoNotDisturbModeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 1u;
  self->_isCarDoNotDisturbModeEnabled = a3;
}

- (BOOL)hasIsCarDoNotDisturbModeEnabled
{
  return *(&self->_isVoiceTriggerEnabled + 1);
}

- (void)setHasIsCarDoNotDisturbModeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsCarDoNotDisturbModeEnabled
{
  -[POMMESSchemaPOMMESDeviceState setIsCarDoNotDisturbModeEnabled:](self, "setIsCarDoNotDisturbModeEnabled:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~1u;
}

- (void)setIsCarPlayEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 2u;
  self->_isCarPlayEnabled = a3;
}

- (BOOL)hasIsCarPlayEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 1) & 1;
}

- (void)setHasIsCarPlayEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFD | v3;
}

- (void)deleteIsCarPlayEnabled
{
  -[POMMESSchemaPOMMESDeviceState setIsCarPlayEnabled:](self, "setIsCarPlayEnabled:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~2u;
}

- (void)setIsEyesFreeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 4u;
  self->_isEyesFreeEnabled = a3;
}

- (BOOL)hasIsEyesFreeEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 2) & 1;
}

- (void)setHasIsEyesFreeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFB | v3;
}

- (void)deleteIsEyesFreeEnabled
{
  -[POMMESSchemaPOMMESDeviceState setIsEyesFreeEnabled:](self, "setIsEyesFreeEnabled:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~4u;
}

- (void)setIsLockedWithPasscode:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 8u;
  self->_isLockedWithPasscode = a3;
}

- (BOOL)hasIsLockedWithPasscode
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 3) & 1;
}

- (void)setHasIsLockedWithPasscode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xF7 | v3;
}

- (void)deleteIsLockedWithPasscode
{
  -[POMMESSchemaPOMMESDeviceState setIsLockedWithPasscode:](self, "setIsLockedWithPasscode:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~8u;
}

- (void)setIsMultiUserDevice:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x10u;
  self->_isMultiUserDevice = a3;
}

- (BOOL)hasIsMultiUserDevice
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 4) & 1;
}

- (void)setHasIsMultiUserDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xEF | v3;
}

- (void)deleteIsMultiUserDevice
{
  -[POMMESSchemaPOMMESDeviceState setIsMultiUserDevice:](self, "setIsMultiUserDevice:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x10u;
}

- (void)setIsTextToSpeechEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x20u;
  self->_isTextToSpeechEnabled = a3;
}

- (BOOL)hasIsTextToSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 5) & 1;
}

- (void)setHasIsTextToSpeechEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xDF | v3;
}

- (void)deleteIsTextToSpeechEnabled
{
  -[POMMESSchemaPOMMESDeviceState setIsTextToSpeechEnabled:](self, "setIsTextToSpeechEnabled:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x20u;
}

- (void)setIsVoiceTriggerEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x40u;
  self->_isVoiceTriggerEnabled = a3;
}

- (BOOL)hasIsVoiceTriggerEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 6) & 1;
}

- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xBF | v3;
}

- (void)deleteIsVoiceTriggerEnabled
{
  -[POMMESSchemaPOMMESDeviceState setIsVoiceTriggerEnabled:](self, "setIsVoiceTriggerEnabled:", 0);
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESDeviceStateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[POMMESSchemaPOMMESDeviceState companionName](self, "companionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = *(&self->_isVoiceTriggerEnabled + 1);
  }
  v6 = v7;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v7;
    v5 = *(&self->_isVoiceTriggerEnabled + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v6 = v7;
  v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  v6 = v7;
  v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
LABEL_17:
    PBDataWriterWriteBOOLField();
    v6 = v7;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v6 = v7;
  v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 0x20) != 0)
    goto LABEL_17;
LABEL_10:
  if ((v5 & 0x40) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
LABEL_12:

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
  unsigned int v13;
  unsigned int v14;
  int isCarDoNotDisturbModeEnabled;
  int v16;
  int isCarPlayEnabled;
  int v18;
  int isEyesFreeEnabled;
  int v20;
  int isLockedWithPasscode;
  int v22;
  int isMultiUserDevice;
  int v24;
  int isTextToSpeechEnabled;
  int v26;
  int isVoiceTriggerEnabled;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[POMMESSchemaPOMMESDeviceState companionName](self, "companionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_36;
  }
  -[POMMESSchemaPOMMESDeviceState companionName](self, "companionName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESDeviceState companionName](self, "companionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companionName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_36;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
  v14 = v4[23];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_36:
    v28 = 0;
    goto LABEL_37;
  }
  if ((v13 & 1) != 0)
  {
    isCarDoNotDisturbModeEnabled = self->_isCarDoNotDisturbModeEnabled;
    if (isCarDoNotDisturbModeEnabled != objc_msgSend(v4, "isCarDoNotDisturbModeEnabled"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    v14 = v4[23];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_36;
  if (v16)
  {
    isCarPlayEnabled = self->_isCarPlayEnabled;
    if (isCarPlayEnabled != objc_msgSend(v4, "isCarPlayEnabled"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    v14 = v4[23];
  }
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_36;
  if (v18)
  {
    isEyesFreeEnabled = self->_isEyesFreeEnabled;
    if (isEyesFreeEnabled != objc_msgSend(v4, "isEyesFreeEnabled"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    v14 = v4[23];
  }
  v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_36;
  if (v20)
  {
    isLockedWithPasscode = self->_isLockedWithPasscode;
    if (isLockedWithPasscode != objc_msgSend(v4, "isLockedWithPasscode"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    v14 = v4[23];
  }
  v22 = (v13 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_36;
  if (v22)
  {
    isMultiUserDevice = self->_isMultiUserDevice;
    if (isMultiUserDevice != objc_msgSend(v4, "isMultiUserDevice"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    v14 = v4[23];
  }
  v24 = (v13 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_36;
  if (v24)
  {
    isTextToSpeechEnabled = self->_isTextToSpeechEnabled;
    if (isTextToSpeechEnabled == objc_msgSend(v4, "isTextToSpeechEnabled"))
    {
      v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
      v14 = v4[23];
      goto LABEL_32;
    }
    goto LABEL_36;
  }
LABEL_32:
  v26 = (v13 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_36;
  if (v26)
  {
    isVoiceTriggerEnabled = self->_isVoiceTriggerEnabled;
    if (isVoiceTriggerEnabled != objc_msgSend(v4, "isVoiceTriggerEnabled"))
      goto LABEL_36;
  }
  v28 = 1;
LABEL_37:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_companionName, "hash");
  if (*(&self->_isVoiceTriggerEnabled + 1))
  {
    v4 = 2654435761 * self->_isCarDoNotDisturbModeEnabled;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isCarPlayEnabled;
      if ((*(&self->_isVoiceTriggerEnabled + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isEyesFreeEnabled;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isLockedWithPasscode;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isMultiUserDevice;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  v8 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_isTextToSpeechEnabled;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v10 = 2654435761 * self->_isVoiceTriggerEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_companionName)
  {
    -[POMMESSchemaPOMMESDeviceState companionName](self, "companionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("companionName"));

  }
  v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isCarDoNotDisturbModeEnabled](self, "isCarDoNotDisturbModeEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isCarDoNotDisturbModeEnabled"));

    v6 = *(&self->_isVoiceTriggerEnabled + 1);
    if ((v6 & 2) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isCarPlayEnabled](self, "isCarPlayEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isCarPlayEnabled"));

  v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isEyesFreeEnabled](self, "isEyesFreeEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isEyesFreeEnabled"));

  v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isLockedWithPasscode](self, "isLockedWithPasscode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isLockedWithPasscode"));

  v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0)
      goto LABEL_9;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isTextToSpeechEnabled"));

    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isMultiUserDevice](self, "isMultiUserDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isMultiUserDevice"));

  v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 0x20) != 0)
    goto LABEL_17;
LABEL_9:
  if ((v6 & 0x40) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isVoiceTriggerEnabled"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESDeviceState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESDeviceState)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESDeviceState *v5;
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
    self = -[POMMESSchemaPOMMESDeviceState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESDeviceState)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESDeviceState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  POMMESSchemaPOMMESDeviceState *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)POMMESSchemaPOMMESDeviceState;
  v5 = -[POMMESSchemaPOMMESDeviceState init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("companionName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[POMMESSchemaPOMMESDeviceState setCompanionName:](v5, "setCompanionName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarDoNotDisturbModeEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsCarDoNotDisturbModeEnabled:](v5, "setIsCarDoNotDisturbModeEnabled:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarPlayEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsCarPlayEnabled:](v5, "setIsCarPlayEnabled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEyesFreeEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsEyesFreeEnabled:](v5, "setIsEyesFreeEnabled:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLockedWithPasscode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsLockedWithPasscode:](v5, "setIsLockedWithPasscode:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMultiUserDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsMultiUserDevice:](v5, "setIsMultiUserDevice:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTextToSpeechEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsTextToSpeechEnabled:](v5, "setIsTextToSpeechEnabled:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVoiceTriggerEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESDeviceState setIsVoiceTriggerEnabled:](v5, "setIsVoiceTriggerEnabled:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (NSString)companionName
{
  return self->_companionName;
}

- (void)setCompanionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isCarDoNotDisturbModeEnabled
{
  return self->_isCarDoNotDisturbModeEnabled;
}

- (BOOL)isCarPlayEnabled
{
  return self->_isCarPlayEnabled;
}

- (BOOL)isEyesFreeEnabled
{
  return self->_isEyesFreeEnabled;
}

- (BOOL)isLockedWithPasscode
{
  return self->_isLockedWithPasscode;
}

- (BOOL)isMultiUserDevice
{
  return self->_isMultiUserDevice;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (void)setHasCompanionName:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionName, 0);
}

@end
