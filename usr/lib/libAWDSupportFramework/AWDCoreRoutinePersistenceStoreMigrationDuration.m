@implementation AWDCoreRoutinePersistenceStoreMigrationDuration

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStoreType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_storeType = a3;
}

- (void)setHasStoreType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStoreType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMigrationTimeInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_migrationTimeInterval = a3;
}

- (void)setHasMigrationTimeInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMigrationTimeInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDidVacuum:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_didVacuum = a3;
}

- (void)setHasDidVacuum:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasDidVacuum
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setDeviceClass:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deviceClass = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPreviousModelVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_previousModelVersion = a3;
}

- (void)setHasPreviousModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPreviousModelVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNextModelVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_nextModelVersion = a3;
}

- (void)setHasNextModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNextModelVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setByteSize:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_byteSize = a3;
}

- (void)setHasByteSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasByteSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceStoreMigrationDuration;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutinePersistenceStoreMigrationDuration description](&v3, sel_description), -[AWDCoreRoutinePersistenceStoreMigrationDuration dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_storeType), CFSTR("storeType"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_migrationTimeInterval), CFSTR("migrationTimeInterval"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didVacuum), CFSTR("didVacuum"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceClass), CFSTR("deviceClass"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_nextModelVersion), CFSTR("nextModelVersion"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_previousModelVersion), CFSTR("previousModelVersion"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 4) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_byteSize), CFSTR("byteSize"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceStoreMigrationDurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      return;
LABEL_17:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_storeType;
  *((_BYTE *)a3 + 48) |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_migrationTimeInterval;
  *((_BYTE *)a3 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)a3 + 44) = self->_didVacuum;
  *((_BYTE *)a3 + 48) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 7) = self->_deviceClass;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_previousModelVersion;
  *((_BYTE *)a3 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      return;
LABEL_17:
    *((_DWORD *)a3 + 6) = self->_byteSize;
    *((_BYTE *)a3 + 48) |= 4u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 8) = self->_nextModelVersion;
  *((_BYTE *)a3 + 48) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_storeType;
  *((_BYTE *)result + 48) |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_migrationTimeInterval;
  *((_BYTE *)result + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 44) = self->_didVacuum;
  *((_BYTE *)result + 48) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_deviceClass;
  *((_BYTE *)result + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_previousModelVersion;
  *((_BYTE *)result + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_nextModelVersion;
  *((_BYTE *)result + 48) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 6) = self->_byteSize;
  *((_BYTE *)result + 48) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x40) == 0 || self->_storeType != *((_DWORD *)a3 + 10))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_migrationTimeInterval != *((double *)a3 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x80) == 0)
      goto LABEL_19;
LABEL_44:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 48) & 0x80) == 0)
    goto LABEL_44;
  if (self->_didVacuum)
  {
    if (!*((_BYTE *)a3 + 44))
      goto LABEL_44;
    goto LABEL_19;
  }
  if (*((_BYTE *)a3 + 44))
    goto LABEL_44;
LABEL_19:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_deviceClass != *((_DWORD *)a3 + 7))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_previousModelVersion != *((_DWORD *)a3 + 9))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_nextModelVersion != *((_DWORD *)a3 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_byteSize != *((_DWORD *)a3 + 6))
      goto LABEL_44;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  uint64_t v5;
  double migrationTimeInterval;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_storeType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  migrationTimeInterval = self->_migrationTimeInterval;
  v7 = -migrationTimeInterval;
  if (migrationTimeInterval >= 0.0)
    v7 = self->_migrationTimeInterval;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if (has < 0)
  {
    v11 = 2654435761 * self->_didVacuum;
    if ((has & 8) == 0)
    {
LABEL_15:
      v12 = 0;
      if ((has & 0x20) != 0)
        goto LABEL_16;
      goto LABEL_21;
    }
  }
  else
  {
    v11 = 0;
    if ((has & 8) == 0)
      goto LABEL_15;
  }
  v12 = 2654435761 * self->_deviceClass;
  if ((has & 0x20) != 0)
  {
LABEL_16:
    v13 = 2654435761 * self->_previousModelVersion;
    if ((has & 0x10) != 0)
      goto LABEL_17;
LABEL_22:
    v14 = 0;
    if ((has & 4) != 0)
      goto LABEL_18;
LABEL_23:
    v15 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  v13 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_22;
LABEL_17:
  v14 = 2654435761 * self->_nextModelVersion;
  if ((has & 4) == 0)
    goto LABEL_23;
LABEL_18:
  v15 = 2654435761 * self->_byteSize;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_storeType = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_migrationTimeInterval = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_didVacuum = *((_BYTE *)a3 + 44);
  *(_BYTE *)&self->_has |= 0x80u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_deviceClass = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_previousModelVersion = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      return;
LABEL_17:
    self->_byteSize = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_16:
  self->_nextModelVersion = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 48) & 4) != 0)
    goto LABEL_17;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)storeType
{
  return self->_storeType;
}

- (double)migrationTimeInterval
{
  return self->_migrationTimeInterval;
}

- (BOOL)didVacuum
{
  return self->_didVacuum;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)previousModelVersion
{
  return self->_previousModelVersion;
}

- (int)nextModelVersion
{
  return self->_nextModelVersion;
}

- (int)byteSize
{
  return self->_byteSize;
}

@end
