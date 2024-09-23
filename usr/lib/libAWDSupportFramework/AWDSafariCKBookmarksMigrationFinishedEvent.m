@implementation AWDSafariCKBookmarksMigrationFinishedEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorDomain:](self, "setErrorDomain:", 0);
  -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorCode:](self, "setErrorCode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationFinishedEvent;
  -[AWDSafariCKBookmarksMigrationFinishedEvent dealloc](&v3, sel_dealloc);
}

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

- (int)migratorType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_migratorType;
  else
    return 0;
}

- (void)setMigratorType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_migratorType = a3;
}

- (void)setHasMigratorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMigratorType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)result
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_result;
  else
    return 0;
}

- (void)setResult:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)resultAsString:(int)a3
{
  if (!a3)
    return CFSTR("MIGRATION_SUCCESSFUL");
  if (a3 == 1)
    return CFSTR("MIGRATION_FAILED");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsResult:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MIGRATION_SUCCESSFUL")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("MIGRATION_FAILED"));
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksMigrationFinishedEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariCKBookmarksMigrationFinishedEvent description](&v3, sel_description), -[AWDSafariCKBookmarksMigrationFinishedEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int migratorType;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  NSString *errorDomain;
  NSString *errorCode;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  migratorType = self->_migratorType;
  if (migratorType)
  {
    if (migratorType == 1)
      v6 = CFSTR("SECONDARY_MIGRATOR");
    else
      v6 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_migratorType);
  }
  else
  {
    v6 = CFSTR("PRIMARY_MIGRATOR");
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("migratorType"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_20;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_20;
LABEL_14:
  v7 = self->_result;
  if (v7)
  {
    if (v7 == 1)
      v8 = CFSTR("MIGRATION_FAILED");
    else
      v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_result);
  }
  else
  {
    v8 = CFSTR("MIGRATION_SUCCESSFUL");
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("result"));
LABEL_20:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksMigrationFinishedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if (self->_errorCode)
    PBDataWriterWriteStringField();
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_migratorType;
  *((_BYTE *)a3 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_BYTE *)a3 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 11) = self->_result;
    *((_BYTE *)a3 + 48) |= 8u;
  }
LABEL_6:
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  if (self->_errorCode)
    objc_msgSend(a3, "setErrorCode:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_duration;
      *(_BYTE *)(v5 + 48) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_migratorType;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_result;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
LABEL_6:

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *errorDomain;
  NSString *errorCode;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_migratorType != *((_DWORD *)a3 + 10))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_result != *((_DWORD *)a3 + 11))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_26;
    }
    errorDomain = self->_errorDomain;
    if (!((unint64_t)errorDomain | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
    {
      errorCode = self->_errorCode;
      if ((unint64_t)errorCode | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_migratorType;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761u * self->_duration;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_result;
LABEL_10:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_errorDomain, "hash");
  return v7 ^ -[NSString hash](self->_errorCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_migratorType = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_12:
  self->_duration = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
LABEL_5:
    self->_result = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 4))
    -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorDomain:](self, "setErrorDomain:");
  if (*((_QWORD *)a3 + 3))
    -[AWDSafariCKBookmarksMigrationFinishedEvent setErrorCode:](self, "setErrorCode:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
