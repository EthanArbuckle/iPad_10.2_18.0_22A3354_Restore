@implementation AWDSafariCKBookmarksMigrationStartedEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)migratorType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_migratorType;
  else
    return 0;
}

- (void)setMigratorType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_migratorType = a3;
}

- (void)setHasMigratorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMigratorType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)migratorTypeAsString:(int)a3
{
  if (!a3)
    return CFSTR("PRIMARY_MIGRATOR");
  if (a3 == 1)
    return CFSTR("SECONDARY_MIGRATOR");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsMigratorType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PRIMARY_MIGRATOR")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("SECONDARY_MIGRATOR"));
}

- (void)setLocalState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_localState = a3;
}

- (void)setHasLocalState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocalState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRemoteState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_remoteState = a3;
}

- (void)setHasRemoteState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRemoteState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationStartedEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariCKBookmarksMigrationStartedEvent description](&v3, sel_description), -[AWDSafariCKBookmarksMigrationStartedEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int migratorType;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_localState), CFSTR("localState"));
      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  migratorType = self->_migratorType;
  if (migratorType)
  {
    if (migratorType == 1)
      v7 = CFSTR("SECONDARY_MIGRATOR");
    else
      v7 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_migratorType);
  }
  else
  {
    v7 = CFSTR("PRIMARY_MIGRATOR");
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("migratorType"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_14;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_remoteState), CFSTR("remoteState"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksMigrationStartedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return;
LABEL_9:
    PBDataWriterWriteInt64Field();
    return;
  }
LABEL_8:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_9;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_migratorType;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return;
LABEL_9:
    *((_QWORD *)a3 + 2) = self->_remoteState;
    *((_BYTE *)a3 + 36) |= 2u;
    return;
  }
LABEL_8:
  *((_QWORD *)a3 + 1) = self->_localState;
  *((_BYTE *)a3 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_timestamp;
    *((_BYTE *)result + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_migratorType;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 1) = self->_localState;
  *((_BYTE *)result + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 2) = self->_remoteState;
  *((_BYTE *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_migratorType != *((_DWORD *)a3 + 8))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_localState != *((_QWORD *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_remoteState != *((_QWORD *)a3 + 2))
        goto LABEL_21;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_migratorType;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_localState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_remoteState;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_migratorType = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      return;
LABEL_9:
    self->_remoteState = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_8:
  self->_localState = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
    goto LABEL_9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)localState
{
  return self->_localState;
}

- (int64_t)remoteState
{
  return self->_remoteState;
}

@end
