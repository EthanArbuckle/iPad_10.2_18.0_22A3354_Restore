@implementation ORCHSchemaORCHDeviceDynamicContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setThermalState:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_thermalState = a3;
}

- (BOOL)hasThermalState
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasThermalState:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteThermalState
{
  -[ORCHSchemaORCHDeviceDynamicContext setThermalState:](self, "setThermalState:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setMotionActivity:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_motionActivity = a3;
}

- (BOOL)hasMotionActivity
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasMotionActivity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteMotionActivity
{
  -[ORCHSchemaORCHDeviceDynamicContext setMotionActivity:](self, "setMotionActivity:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setTimeSinceAssistantDaemonStartedInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeSinceAssistantDaemonStartedInMs = a3;
}

- (BOOL)hasTimeSinceAssistantDaemonStartedInMs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasTimeSinceAssistantDaemonStartedInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteTimeSinceAssistantDaemonStartedInMs
{
  -[ORCHSchemaORCHDeviceDynamicContext setTimeSinceAssistantDaemonStartedInMs:](self, "setTimeSinceAssistantDaemonStartedInMs:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHeadGesturesSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_headGesturesSupported = a3;
}

- (BOOL)hasHeadGesturesSupported
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasHeadGesturesSupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteHeadGesturesSupported
{
  -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesSupported:](self, "setHeadGesturesSupported:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHeadGesturesEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_headGesturesEnabled = a3;
}

- (BOOL)hasHeadGesturesEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasHeadGesturesEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteHeadGesturesEnabled
{
  -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesEnabled:](self, "setHeadGesturesEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAcceptProceedGesture:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_acceptProceedGesture = a3;
}

- (BOOL)hasAcceptProceedGesture
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAcceptProceedGesture:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAcceptProceedGesture
{
  -[ORCHSchemaORCHDeviceDynamicContext setAcceptProceedGesture:](self, "setAcceptProceedGesture:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setDeclineDismissGesture:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_declineDismissGesture = a3;
}

- (BOOL)hasDeclineDismissGesture
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasDeclineDismissGesture:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteDeclineDismissGesture
{
  -[ORCHSchemaORCHDeviceDynamicContext setDeclineDismissGesture:](self, "setDeclineDismissGesture:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setIsWifiEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isWifiEnabled = a3;
}

- (BOOL)hasIsWifiEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsWifiEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteIsWifiEnabled
{
  -[ORCHSchemaORCHDeviceDynamicContext setIsWifiEnabled:](self, "setIsWifiEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setBluetoothState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_bluetoothState = a3;
}

- (BOOL)hasBluetoothState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasBluetoothState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteBluetoothState
{
  -[ORCHSchemaORCHDeviceDynamicContext setBluetoothState:](self, "setBluetoothState:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setFlashlightLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_flashlightLevel = a3;
}

- (BOOL)hasFlashlightLevel
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasFlashlightLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteFlashlightLevel
{
  -[ORCHSchemaORCHDeviceDynamicContext setFlashlightLevel:](self, "setFlashlightLevel:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHDeviceDynamicContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $60797D9E33E375427476670BB1D51047 has;
  unsigned int v6;
  int thermalState;
  int v8;
  int motionActivity;
  int v10;
  unint64_t timeSinceAssistantDaemonStartedInMs;
  int v12;
  int headGesturesSupported;
  int v14;
  int headGesturesEnabled;
  int v16;
  int acceptProceedGesture;
  int v18;
  int declineDismissGesture;
  int v20;
  int isWifiEnabled;
  int v22;
  int bluetoothState;
  int v24;
  int flashlightLevel;
  BOOL v26;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    thermalState = self->_thermalState;
    if (thermalState != objc_msgSend(v4, "thermalState"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_42;
  if (v8)
  {
    motionActivity = self->_motionActivity;
    if (motionActivity != objc_msgSend(v4, "motionActivity"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_42;
  if (v10)
  {
    timeSinceAssistantDaemonStartedInMs = self->_timeSinceAssistantDaemonStartedInMs;
    if (timeSinceAssistantDaemonStartedInMs != objc_msgSend(v4, "timeSinceAssistantDaemonStartedInMs"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_42;
  if (v12)
  {
    headGesturesSupported = self->_headGesturesSupported;
    if (headGesturesSupported != objc_msgSend(v4, "headGesturesSupported"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_42;
  if (v14)
  {
    headGesturesEnabled = self->_headGesturesEnabled;
    if (headGesturesEnabled != objc_msgSend(v4, "headGesturesEnabled"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_42;
  if (v16)
  {
    acceptProceedGesture = self->_acceptProceedGesture;
    if (acceptProceedGesture != objc_msgSend(v4, "acceptProceedGesture"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_42;
  if (v18)
  {
    declineDismissGesture = self->_declineDismissGesture;
    if (declineDismissGesture != objc_msgSend(v4, "declineDismissGesture"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_42;
  if (v20)
  {
    isWifiEnabled = self->_isWifiEnabled;
    if (isWifiEnabled != objc_msgSend(v4, "isWifiEnabled"))
      goto LABEL_42;
    has = self->_has;
    v6 = v4[24];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_42;
  if (v22)
  {
    bluetoothState = self->_bluetoothState;
    if (bluetoothState == objc_msgSend(v4, "bluetoothState"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_38;
    }
LABEL_42:
    v26 = 0;
    goto LABEL_43;
  }
LABEL_38:
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_42;
  if (v24)
  {
    flashlightLevel = self->_flashlightLevel;
    if (flashlightLevel != objc_msgSend(v4, "flashlightLevel"))
      goto LABEL_42;
  }
  v26 = 1;
LABEL_43:

  return v26;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_thermalState;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_motionActivity;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
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
    v5 = 2654435761u * self->_timeSinceAssistantDaemonStartedInMs;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_headGesturesSupported;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_headGesturesEnabled;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_acceptProceedGesture;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_declineDismissGesture;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_isWifiEnabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_bluetoothState;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_flashlightLevel;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;
  unsigned int v22;
  const __CFString *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = -[ORCHSchemaORCHDeviceDynamicContext acceptProceedGesture](self, "acceptProceedGesture");
    if (v5 == 1)
      v6 = CFSTR("ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE");
    else
      v6 = CFSTR("ORCHHEADGESTUREMAPPING_UNKNOWN");
    if (v5 == 2)
      v7 = CFSTR("ORCHHEADGESTUREMAPPING_UP_AND_DOWN");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("acceptProceedGesture"));
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v8 = -[ORCHSchemaORCHDeviceDynamicContext bluetoothState](self, "bluetoothState") - 1;
  if (v8 > 5)
    v9 = CFSTR("ORCHBLUETOOTHSTATE_UNKNOWN");
  else
    v9 = off_1E5632600[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bluetoothState"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_17:
  v10 = -[ORCHSchemaORCHDeviceDynamicContext declineDismissGesture](self, "declineDismissGesture");
  if (v10 == 1)
    v11 = CFSTR("ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE");
  else
    v11 = CFSTR("ORCHHEADGESTUREMAPPING_UNKNOWN");
  if (v10 == 2)
    v12 = CFSTR("ORCHHEADGESTUREMAPPING_UP_AND_DOWN");
  else
    v12 = v11;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("declineDismissGesture"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
LABEL_24:
    v13 = -[ORCHSchemaORCHDeviceDynamicContext flashlightLevel](self, "flashlightLevel") - 1;
    if (v13 > 4)
      v14 = CFSTR("ORCHFLASHLIGHTLEVEL_UNKNOWN");
    else
      v14 = off_1E5632630[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("flashlightLevel"));
    has = (__int16)self->_has;
  }
LABEL_28:
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext headGesturesEnabled](self, "headGesturesEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("headGesturesEnabled"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_30:
      if ((has & 0x80) == 0)
        goto LABEL_31;
      goto LABEL_38;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext headGesturesSupported](self, "headGesturesSupported"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("headGesturesSupported"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_31:
    if ((has & 2) == 0)
      goto LABEL_32;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext isWifiEnabled](self, "isWifiEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isWifiEnabled"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_32:
    if ((has & 1) == 0)
      goto LABEL_33;
LABEL_43:
    v22 = -[ORCHSchemaORCHDeviceDynamicContext thermalState](self, "thermalState") - 1;
    if (v22 > 3)
      v23 = CFSTR("DEVICETHERMALSTATE_UNKNOWN");
    else
      v23 = off_1E5632680[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("thermalState"));
    if ((*(_WORD *)&self->_has & 4) != 0)
      goto LABEL_34;
    goto LABEL_35;
  }
LABEL_39:
  v20 = -[ORCHSchemaORCHDeviceDynamicContext motionActivity](self, "motionActivity") - 1;
  if (v20 > 4)
    v21 = CFSTR("ORCHMOTIONACTIVITY_UNKNOWN");
  else
    v21 = off_1E5632658[v20];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("motionActivity"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_43;
LABEL_33:
  if ((has & 4) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ORCHSchemaORCHDeviceDynamicContext timeSinceAssistantDaemonStartedInMs](self, "timeSinceAssistantDaemonStartedInMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("timeSinceAssistantDaemonStartedInMs"));

  }
LABEL_35:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHDeviceDynamicContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHDeviceDynamicContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHDeviceDynamicContext *v5;
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
    self = -[ORCHSchemaORCHDeviceDynamicContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHDeviceDynamicContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHDeviceDynamicContext *v5;
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
  void *v16;
  ORCHSchemaORCHDeviceDynamicContext *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ORCHSchemaORCHDeviceDynamicContext;
  v5 = -[ORCHSchemaORCHDeviceDynamicContext init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thermalState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setThermalState:](v5, "setThermalState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionActivity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setMotionActivity:](v5, "setMotionActivity:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAssistantDaemonStartedInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setTimeSinceAssistantDaemonStartedInMs:](v5, "setTimeSinceAssistantDaemonStartedInMs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headGesturesSupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesSupported:](v5, "setHeadGesturesSupported:", objc_msgSend(v9, "BOOLValue"));
    v19 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headGesturesEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesEnabled:](v5, "setHeadGesturesEnabled:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acceptProceedGesture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setAcceptProceedGesture:](v5, "setAcceptProceedGesture:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("declineDismissGesture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setDeclineDismissGesture:](v5, "setDeclineDismissGesture:", objc_msgSend(v12, "intValue"));
    v20 = v8;
    v21 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWifiEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setIsWifiEnabled:](v5, "setIsWifiEnabled:", objc_msgSend(v13, "BOOLValue"));
    v14 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bluetoothState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setBluetoothState:](v5, "setBluetoothState:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flashlightLevel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHDeviceDynamicContext setFlashlightLevel:](v5, "setFlashlightLevel:", objc_msgSend(v16, "intValue"));
    v17 = v5;

  }
  return v5;
}

- (int)thermalState
{
  return self->_thermalState;
}

- (int)motionActivity
{
  return self->_motionActivity;
}

- (unint64_t)timeSinceAssistantDaemonStartedInMs
{
  return self->_timeSinceAssistantDaemonStartedInMs;
}

- (BOOL)headGesturesSupported
{
  return self->_headGesturesSupported;
}

- (BOOL)headGesturesEnabled
{
  return self->_headGesturesEnabled;
}

- (int)acceptProceedGesture
{
  return self->_acceptProceedGesture;
}

- (int)declineDismissGesture
{
  return self->_declineDismissGesture;
}

- (BOOL)isWifiEnabled
{
  return self->_isWifiEnabled;
}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (int)flashlightLevel
{
  return self->_flashlightLevel;
}

@end
