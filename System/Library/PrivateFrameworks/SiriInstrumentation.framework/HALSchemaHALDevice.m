@implementation HALSchemaHALDevice

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HALSchemaHALDevice;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[HALSchemaHALDevice deleteMediaPlayerContext](self, "deleteMediaPlayerContext");
  -[HALSchemaHALDevice alarmContext](self, "alarmContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[HALSchemaHALDevice deleteAlarmContext](self, "deleteAlarmContext");
  -[HALSchemaHALDevice timerContext](self, "timerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[HALSchemaHALDevice deleteTimerContext](self, "deleteTimerContext");
  -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[HALSchemaHALDevice deleteVoiceTriggerContext](self, "deleteVoiceTriggerContext");

  return v5;
}

- (void)setDeviceProximity:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceProximity = a3;
}

- (BOOL)hasDeviceProximity
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceProximity:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeviceProximity
{
  -[HALSchemaHALDevice setDeviceProximity:](self, "setDeviceProximity:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDeviceFamily:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deviceFamily = a3;
}

- (BOOL)hasDeviceFamily
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDeviceFamily:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDeviceFamily
{
  -[HALSchemaHALDevice setDeviceFamily:](self, "setDeviceFamily:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[HALSchemaHALDevice setSystemBuild:](self, "setSystemBuild:", 0);
}

- (void)setSiriInputLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_siriInputLocale = a3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSiriInputLocale
{
  -[HALSchemaHALDevice setSiriInputLocale:](self, "setSiriInputLocale:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasMediaPlayerContext
{
  return self->_mediaPlayerContext != 0;
}

- (void)deleteMediaPlayerContext
{
  -[HALSchemaHALDevice setMediaPlayerContext:](self, "setMediaPlayerContext:", 0);
}

- (BOOL)hasAlarmContext
{
  return self->_alarmContext != 0;
}

- (void)deleteAlarmContext
{
  -[HALSchemaHALDevice setAlarmContext:](self, "setAlarmContext:", 0);
}

- (BOOL)hasTimerContext
{
  return self->_timerContext != 0;
}

- (void)deleteTimerContext
{
  -[HALSchemaHALDevice setTimerContext:](self, "setTimerContext:", 0);
}

- (BOOL)hasVoiceTriggerContext
{
  return self->_voiceTriggerContext != 0;
}

- (void)deleteVoiceTriggerContext
{
  -[HALSchemaHALDevice setVoiceTriggerContext:](self, "setVoiceTriggerContext:", 0);
}

- (void)setPowerState:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_powerState = a3;
}

- (BOOL)hasPowerState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasPowerState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deletePowerState
{
  -[HALSchemaHALDevice setPowerState:](self, "setPowerState:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALDeviceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[HALSchemaHALDevice systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALDevice alarmContext](self, "alarmContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HALSchemaHALDevice alarmContext](self, "alarmContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALDevice timerContext](self, "timerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HALSchemaHALDevice timerContext](self, "timerContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $AD3AB2ED704B40CE4732714BDC82807E has;
  unsigned int v6;
  int deviceProximity;
  int v8;
  int deviceFamily;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int siriInputLocale;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  BOOL v39;
  int v41;
  int powerState;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  has = self->_has;
  v6 = v4[68];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_37;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    deviceProximity = self->_deviceProximity;
    if (deviceProximity != objc_msgSend(v4, "deviceProximity"))
      goto LABEL_37;
    has = self->_has;
    v6 = v4[68];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_37;
  if (v8)
  {
    deviceFamily = self->_deviceFamily;
    if (deviceFamily != objc_msgSend(v4, "deviceFamily"))
      goto LABEL_37;
  }
  -[HALSchemaHALDevice systemBuild](self, "systemBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_36;
  -[HALSchemaHALDevice systemBuild](self, "systemBuild");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[HALSchemaHALDevice systemBuild](self, "systemBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  v17 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v17 != ((v4[68] >> 2) & 1))
    goto LABEL_37;
  if (v17)
  {
    siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != objc_msgSend(v4, "siriInputLocale"))
      goto LABEL_37;
  }
  -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_36;
  -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_37;
  }
  else
  {

  }
  -[HALSchemaHALDevice alarmContext](self, "alarmContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_36;
  -[HALSchemaHALDevice alarmContext](self, "alarmContext");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[HALSchemaHALDevice alarmContext](self, "alarmContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_37;
  }
  else
  {

  }
  -[HALSchemaHALDevice timerContext](self, "timerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_36;
  -[HALSchemaHALDevice timerContext](self, "timerContext");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[HALSchemaHALDevice timerContext](self, "timerContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_37;
  }
  else
  {

  }
  -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceTriggerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceTriggerContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_37;
  }
  else
  {

  }
  v41 = (*(_BYTE *)&self->_has >> 3) & 1;
  if (v41 == ((v4[68] >> 3) & 1))
  {
    if (!v41 || (powerState = self->_powerState, powerState == objc_msgSend(v4, "powerState")))
    {
      v39 = 1;
      goto LABEL_38;
    }
  }
LABEL_37:
  v39 = 0;
LABEL_38:

  return v39;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_deviceProximity;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_deviceFamily;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_systemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_siriInputLocale;
  else
    v6 = 0;
  v7 = -[HALSchemaHALMediaPlayerContext hash](self->_mediaPlayerContext, "hash");
  v8 = -[HALSchemaHALAlarmContext hash](self->_alarmContext, "hash");
  v9 = -[HALSchemaHALTimerContext hash](self->_timerContext, "hash");
  v10 = -[HALSchemaHALVoiceTriggerContext hash](self->_voiceTriggerContext, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_powerState;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  unsigned int v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alarmContext)
  {
    -[HALSchemaHALDevice alarmContext](self, "alarmContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alarmContext"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = -[HALSchemaHALDevice deviceFamily](self, "deviceFamily") - 1;
    if (v8 > 7)
      v9 = CFSTR("DEVICEFAMILY_UNKNOWN");
    else
      v9 = off_1E562F638[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceFamily"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v10 = -[HALSchemaHALDevice deviceProximity](self, "deviceProximity") - 1;
    if (v10 > 3)
      v11 = CFSTR("HALDEVICEPROXIMITY_UNKNOWN");
    else
      v11 = off_1E562F678[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceProximity"));
  }
  if (self->_mediaPlayerContext)
  {
    -[HALSchemaHALDevice mediaPlayerContext](self, "mediaPlayerContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("mediaPlayerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("mediaPlayerContext"));

    }
  }
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    v16 = -[HALSchemaHALDevice powerState](self, "powerState") - 1;
    if (v16 > 2)
      v17 = CFSTR("HALPOWERSTATE_UNKNOWN");
    else
      v17 = off_1E562F698[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("powerState"));
    v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    v18 = -[HALSchemaHALDevice siriInputLocale](self, "siriInputLocale") - 1;
    if (v18 > 0x3D)
      v19 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v19 = off_1E562F6B0[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("siriInputLocale"));
  }
  if (self->_systemBuild)
  {
    -[HALSchemaHALDevice systemBuild](self, "systemBuild");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("systemBuild"));

  }
  if (self->_timerContext)
  {
    -[HALSchemaHALDevice timerContext](self, "timerContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("timerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("timerContext"));

    }
  }
  if (self->_voiceTriggerContext)
  {
    -[HALSchemaHALDevice voiceTriggerContext](self, "voiceTriggerContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("voiceTriggerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("voiceTriggerContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALDevice dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALDevice)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALDevice *v5;
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
    self = -[HALSchemaHALDevice initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALDevice)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HALSchemaHALMediaPlayerContext *v12;
  void *v13;
  HALSchemaHALAlarmContext *v14;
  void *v15;
  HALSchemaHALTimerContext *v16;
  void *v17;
  HALSchemaHALVoiceTriggerContext *v18;
  void *v19;
  HALSchemaHALDevice *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HALSchemaHALDevice;
  v5 = -[HALSchemaHALDevice init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceProximity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALDevice setDeviceProximity:](v5, "setDeviceProximity:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceFamily"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALDevice setDeviceFamily:](v5, "setDeviceFamily:", objc_msgSend(v7, "intValue"));
    v23 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[HALSchemaHALDevice setSystemBuild:](v5, "setSystemBuild:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALDevice setSiriInputLocale:](v5, "setSiriInputLocale:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[HALSchemaHALMediaPlayerContext initWithDictionary:]([HALSchemaHALMediaPlayerContext alloc], "initWithDictionary:", v11);
      -[HALSchemaHALDevice setMediaPlayerContext:](v5, "setMediaPlayerContext:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[HALSchemaHALAlarmContext initWithDictionary:]([HALSchemaHALAlarmContext alloc], "initWithDictionary:", v13);
      -[HALSchemaHALDevice setAlarmContext:](v5, "setAlarmContext:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timerContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[HALSchemaHALTimerContext initWithDictionary:]([HALSchemaHALTimerContext alloc], "initWithDictionary:", v15);
      -[HALSchemaHALDevice setTimerContext:](v5, "setTimerContext:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[HALSchemaHALVoiceTriggerContext initWithDictionary:]([HALSchemaHALVoiceTriggerContext alloc], "initWithDictionary:", v17);
      -[HALSchemaHALDevice setVoiceTriggerContext:](v5, "setVoiceTriggerContext:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("powerState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALDevice setPowerState:](v5, "setPowerState:", objc_msgSend(v19, "intValue"));
    v20 = v5;

  }
  return v5;
}

- (int)deviceProximity
{
  return self->_deviceProximity;
}

- (int)deviceFamily
{
  return self->_deviceFamily;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (HALSchemaHALMediaPlayerContext)mediaPlayerContext
{
  return self->_mediaPlayerContext;
}

- (void)setMediaPlayerContext:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerContext, a3);
}

- (HALSchemaHALAlarmContext)alarmContext
{
  return self->_alarmContext;
}

- (void)setAlarmContext:(id)a3
{
  objc_storeStrong((id *)&self->_alarmContext, a3);
}

- (HALSchemaHALTimerContext)timerContext
{
  return self->_timerContext;
}

- (void)setTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_timerContext, a3);
}

- (HALSchemaHALVoiceTriggerContext)voiceTriggerContext
{
  return self->_voiceTriggerContext;
}

- (void)setVoiceTriggerContext:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerContext, a3);
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMediaPlayerContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAlarmContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasTimerContext:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasVoiceTriggerContext:(BOOL)a3
{
  self->_hasMediaPlayerContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerContext, 0);
  objc_storeStrong((id *)&self->_timerContext, 0);
  objc_storeStrong((id *)&self->_alarmContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerContext, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

@end
