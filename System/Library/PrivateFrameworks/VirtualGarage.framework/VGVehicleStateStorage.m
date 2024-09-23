@implementation VGVehicleStateStorage

- (void)setDateOfUpdate:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dateOfUpdate = a3;
}

- (void)setHasDateOfUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDateOfUpdate
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)origin
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOrigin
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 < 3)
    return off_24C2FB1D0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IAP2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SIRIINTENTS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setBatteryPercentage:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_batteryPercentage = a3;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBatteryPercentage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCurrentEVRange:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_currentEVRange = a3;
}

- (void)setHasCurrentEVRange:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCurrentEVRange
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxEVRange:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_maxEVRange = a3;
}

- (void)setHasMaxEVRange:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMaxEVRange
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMinBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_minBatteryCapacity = a3;
}

- (void)setHasMinBatteryCapacity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMinBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCurrentBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_currentBatteryCapacity = a3;
}

- (void)setHasCurrentBatteryCapacity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCurrentBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMaxBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxBatteryCapacity = a3;
}

- (void)setHasMaxBatteryCapacity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasConsumptionArguments
{
  return self->_consumptionArguments != 0;
}

- (BOOL)hasChargingArguments
{
  return self->_chargingArguments != 0;
}

- (void)setIsCharging:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isCharging = a3;
}

- (void)setHasIsCharging:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsCharging
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)activeConnector
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_activeConnector;
  else
    return 0;
}

- (void)setActiveConnector:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_activeConnector = a3;
}

- (void)setHasActiveConnector:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasActiveConnector
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)activeConnectorAsString:(int)a3
{
  if (a3 < 0xA)
    return off_24C2FB1E8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveConnector:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("J1772")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCS1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCS2")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHADEMO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GBT_AC")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GBT_DC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NACS_DC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MENNEKES")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NACS_AC")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier != 0;
}

- (BOOL)hasPairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)VGVehicleStateStorage;
  -[VGVehicleStateStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGVehicleStateStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  __int16 has;
  void *v7;
  NSString *consumptionArguments;
  NSString *chargingArguments;
  __int16 v10;
  void *v11;
  uint64_t activeConnector;
  __CFString *v13;
  void *v14;
  uint64_t origin;
  __CFString *v16;
  NSData *pairedAppInstallSessionIdentifier;
  NSString *pairedAppInstallDeviceIdentifier;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_dateOfUpdate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("dateOfUpdate"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  origin = self->_origin;
  if (origin >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_origin);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_24C2FB1D0[origin];
  }
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("origin"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_batteryPercentage);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("batteryPercentage"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_currentEVRange);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("currentEVRange"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxEVRange);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("maxEVRange"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minBatteryCapacity);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("minBatteryCapacity"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_currentBatteryCapacity);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("currentBatteryCapacity"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxBatteryCapacity);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("maxBatteryCapacity"));

  }
LABEL_12:
  consumptionArguments = self->_consumptionArguments;
  if (consumptionArguments)
    objc_msgSend(v4, "setObject:forKey:", consumptionArguments, CFSTR("consumptionArguments"));
  chargingArguments = self->_chargingArguments;
  if (chargingArguments)
    objc_msgSend(v4, "setObject:forKey:", chargingArguments, CFSTR("chargingArguments"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCharging);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("isCharging"));

    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    activeConnector = self->_activeConnector;
    if (activeConnector >= 0xA)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activeConnector);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24C2FB1E8[activeConnector];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("activeConnector"));

  }
  pairedAppInstallSessionIdentifier = self->_pairedAppInstallSessionIdentifier;
  if (pairedAppInstallSessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", pairedAppInstallSessionIdentifier, CFSTR("pairedAppInstallSessionIdentifier"));
  pairedAppInstallDeviceIdentifier = self->_pairedAppInstallDeviceIdentifier;
  if (pairedAppInstallDeviceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", pairedAppInstallDeviceIdentifier, CFSTR("pairedAppInstallDeviceIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VGVehicleStateStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  void *v5;
  __int16 v6;
  id v7;

  v7 = a3;
  PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  v5 = v7;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v5 = v7;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v5 = v7;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    v5 = v7;
  }
LABEL_12:
  if (self->_consumptionArguments)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }
  if (self->_chargingArguments)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v7;
  }
  if (self->_pairedAppInstallSessionIdentifier)
  {
    PBDataWriterWriteDataField();
    v5 = v7;
  }
  if (self->_pairedAppInstallDeviceIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  __int16 has;
  __int16 v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setIdentifier:", self->_identifier);
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v7 + 4) = *(_QWORD *)&self->_dateOfUpdate;
    *((_WORD *)v7 + 62) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 24) = self->_origin;
  *((_WORD *)v7 + 62) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v7 + 1) = *(_QWORD *)&self->_batteryPercentage;
  *((_WORD *)v7 + 62) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v7 + 3) = *(_QWORD *)&self->_currentEVRange;
  *((_WORD *)v7 + 62) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v7 + 6) = *(_QWORD *)&self->_maxEVRange;
  *((_WORD *)v7 + 62) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v7 + 7) = *(_QWORD *)&self->_minBatteryCapacity;
  *((_WORD *)v7 + 62) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_29:
  *((_QWORD *)v7 + 2) = *(_QWORD *)&self->_currentBatteryCapacity;
  *((_WORD *)v7 + 62) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *((_QWORD *)v7 + 5) = *(_QWORD *)&self->_maxBatteryCapacity;
    *((_WORD *)v7 + 62) |= 0x10u;
  }
LABEL_10:
  if (self->_consumptionArguments)
  {
    objc_msgSend(v7, "setConsumptionArguments:");
    v4 = v7;
  }
  if (self->_chargingArguments)
  {
    objc_msgSend(v7, "setChargingArguments:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    v4[120] = self->_isCharging;
    *((_WORD *)v4 + 62) |= 0x200u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_activeConnector;
    *((_WORD *)v4 + 62) |= 0x80u;
  }
  if (self->_pairedAppInstallSessionIdentifier)
  {
    objc_msgSend(v7, "setPairedAppInstallSessionIdentifier:");
    v4 = v7;
  }
  if (self->_pairedAppInstallDeviceIdentifier)
  {
    objc_msgSend(v7, "setPairedAppInstallDeviceIdentifier:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_dateOfUpdate;
    *(_WORD *)(v5 + 124) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_origin;
  *(_WORD *)(v5 + 124) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 8) = self->_batteryPercentage;
  *(_WORD *)(v5 + 124) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 24) = self->_currentEVRange;
  *(_WORD *)(v5 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 48) = self->_maxEVRange;
  *(_WORD *)(v5 + 124) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 56) = self->_minBatteryCapacity;
  *(_WORD *)(v5 + 124) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  *(double *)(v5 + 16) = self->_currentBatteryCapacity;
  *(_WORD *)(v5 + 124) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *(double *)(v5 + 40) = self->_maxBatteryCapacity;
    *(_WORD *)(v5 + 124) |= 0x10u;
  }
LABEL_10:
  v9 = -[NSString copyWithZone:](self->_consumptionArguments, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_chargingArguments, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 120) = self->_isCharging;
    *(_WORD *)(v5 + 124) |= 0x200u;
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_activeConnector;
    *(_WORD *)(v5 + 124) |= 0x80u;
  }
  v14 = -[NSData copyWithZone:](self->_pairedAppInstallSessionIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v14;

  v16 = -[NSString copyWithZone:](self->_pairedAppInstallDeviceIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  __int16 has;
  __int16 v7;
  NSString *consumptionArguments;
  NSString *chargingArguments;
  __int16 v10;
  __int16 v11;
  NSData *pairedAppInstallSessionIdentifier;
  NSString *pairedAppInstallDeviceIdentifier;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_65;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 62);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dateOfUpdate != *((double *)v4 + 4))
      goto LABEL_65;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_origin != *((_DWORD *)v4 + 24))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_batteryPercentage != *((double *)v4 + 1))
      goto LABEL_65;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_currentEVRange != *((double *)v4 + 3))
      goto LABEL_65;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_maxEVRange != *((double *)v4 + 6))
      goto LABEL_65;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_minBatteryCapacity != *((double *)v4 + 7))
      goto LABEL_65;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_currentBatteryCapacity != *((double *)v4 + 2))
      goto LABEL_65;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_maxBatteryCapacity != *((double *)v4 + 5))
      goto LABEL_65;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  consumptionArguments = self->_consumptionArguments;
  if ((unint64_t)consumptionArguments | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](consumptionArguments, "isEqual:"))
  {
    goto LABEL_65;
  }
  chargingArguments = self->_chargingArguments;
  if ((unint64_t)chargingArguments | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](chargingArguments, "isEqual:"))
      goto LABEL_65;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 62);
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    {
      if (self->_isCharging)
      {
        if (!*((_BYTE *)v4 + 120))
          goto LABEL_65;
        goto LABEL_56;
      }
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_56;
    }
LABEL_65:
    v14 = 0;
    goto LABEL_66;
  }
  if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    goto LABEL_65;
LABEL_56:
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_activeConnector != *((_DWORD *)v4 + 16))
      goto LABEL_65;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  pairedAppInstallSessionIdentifier = self->_pairedAppInstallSessionIdentifier;
  if ((unint64_t)pairedAppInstallSessionIdentifier | *((_QWORD *)v4 + 14)
    && !-[NSData isEqual:](pairedAppInstallSessionIdentifier, "isEqual:"))
  {
    goto LABEL_65;
  }
  pairedAppInstallDeviceIdentifier = self->_pairedAppInstallDeviceIdentifier;
  if ((unint64_t)pairedAppInstallDeviceIdentifier | *((_QWORD *)v4 + 13))
    v14 = -[NSString isEqual:](pairedAppInstallDeviceIdentifier, "isEqual:");
  else
    v14 = 1;
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double dateOfUpdate;
  double v6;
  long double v7;
  double v8;
  double batteryPercentage;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double currentEVRange;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double maxEVRange;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double minBatteryCapacity;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double currentBatteryCapacity;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double maxBatteryCapacity;
  double v36;
  long double v37;
  double v38;
  NSUInteger v39;
  NSUInteger v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v47;
  NSUInteger v48;

  v48 = -[NSString hash](self->_identifier, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    dateOfUpdate = self->_dateOfUpdate;
    v6 = -dateOfUpdate;
    if (dateOfUpdate >= 0.0)
      v6 = self->_dateOfUpdate;
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
  if ((has & 0x100) != 0)
  {
    v47 = 2654435761 * self->_origin;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
  v47 = 0;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_11:
  batteryPercentage = self->_batteryPercentage;
  v10 = -batteryPercentage;
  if (batteryPercentage >= 0.0)
    v10 = self->_batteryPercentage;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    currentEVRange = self->_currentEVRange;
    v16 = -currentEVRange;
    if (currentEVRange >= 0.0)
      v16 = self->_currentEVRange;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x20) != 0)
  {
    maxEVRange = self->_maxEVRange;
    v21 = -maxEVRange;
    if (maxEVRange >= 0.0)
      v21 = self->_maxEVRange;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    minBatteryCapacity = self->_minBatteryCapacity;
    v26 = -minBatteryCapacity;
    if (minBatteryCapacity >= 0.0)
      v26 = self->_minBatteryCapacity;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 2) != 0)
  {
    currentBatteryCapacity = self->_currentBatteryCapacity;
    v31 = -currentBatteryCapacity;
    if (currentBatteryCapacity >= 0.0)
      v31 = self->_currentBatteryCapacity;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 0x10) != 0)
  {
    maxBatteryCapacity = self->_maxBatteryCapacity;
    v36 = -maxBatteryCapacity;
    if (maxBatteryCapacity >= 0.0)
      v36 = self->_maxBatteryCapacity;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v39 = -[NSString hash](self->_consumptionArguments, "hash");
  v40 = -[NSString hash](self->_chargingArguments, "hash");
  v41 = (__int16)self->_has;
  if ((v41 & 0x200) != 0)
  {
    v42 = 2654435761 * self->_isCharging;
    if ((v41 & 0x80) != 0)
      goto LABEL_61;
LABEL_63:
    v43 = 0;
    goto LABEL_64;
  }
  v42 = 0;
  if ((v41 & 0x80) == 0)
    goto LABEL_63;
LABEL_61:
  v43 = 2654435761 * self->_activeConnector;
LABEL_64:
  v44 = v4 ^ v48 ^ v47 ^ v13 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v40 ^ v42 ^ v43;
  v45 = -[NSData hash](self->_pairedAppInstallSessionIdentifier, "hash");
  return v44 ^ v45 ^ -[NSString hash](self->_pairedAppInstallDeviceIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[VGVehicleStateStorage setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 8) != 0)
  {
    self->_dateOfUpdate = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_27;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_5;
  }
  self->_origin = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  self->_batteryPercentage = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  self->_currentEVRange = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  self->_maxEVRange = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  self->_minBatteryCapacity = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_31:
  self->_currentBatteryCapacity = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 62) & 0x10) != 0)
  {
LABEL_11:
    self->_maxBatteryCapacity = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 10))
  {
    -[VGVehicleStateStorage setConsumptionArguments:](self, "setConsumptionArguments:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[VGVehicleStateStorage setChargingArguments:](self, "setChargingArguments:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x200) != 0)
  {
    self->_isCharging = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x200u;
    v6 = *((_WORD *)v4 + 62);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_activeConnector = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[VGVehicleStateStorage setPairedAppInstallSessionIdentifier:](self, "setPairedAppInstallSessionIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[VGVehicleStateStorage setPairedAppInstallDeviceIdentifier:](self, "setPairedAppInstallDeviceIdentifier:");
    v4 = v7;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)dateOfUpdate
{
  return self->_dateOfUpdate;
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (double)currentEVRange
{
  return self->_currentEVRange;
}

- (double)maxEVRange
{
  return self->_maxEVRange;
}

- (double)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (double)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (double)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
  objc_storeStrong((id *)&self->_consumptionArguments, a3);
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
  objc_storeStrong((id *)&self->_chargingArguments, a3);
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (NSData)pairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier;
}

- (void)setPairedAppInstallSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, a3);
}

- (NSString)pairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier;
}

- (void)setPairedAppInstallDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
}

@end
