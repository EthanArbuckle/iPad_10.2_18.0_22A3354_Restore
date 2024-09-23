@implementation AWDSafariDidTerminateWebProcessBeforeNavigation

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)terminationReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_terminationReason;
  else
    return 0;
}

- (void)setTerminationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_terminationReason = a3;
}

- (void)setHasTerminationReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTerminationReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)terminationReasonAsString:(int)a3
{
  if (!a3)
    return CFSTR("UNRESPONSIVE_WEB_PROCESS");
  if (a3 == 1)
    return CFSTR("PRESENTED_DIALOG");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsTerminationReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UNRESPONSIVE_WEB_PROCESS")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("PRESENTED_DIALOG"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariDidTerminateWebProcessBeforeNavigation;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariDidTerminateWebProcessBeforeNavigation description](&v3, sel_description), -[AWDSafariDidTerminateWebProcessBeforeNavigation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int terminationReason;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    terminationReason = self->_terminationReason;
    if (terminationReason)
    {
      if (terminationReason == 1)
        v6 = CFSTR("PRESENTED_DIALOG");
      else
        v6 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_terminationReason);
    }
    else
    {
      v6 = CFSTR("UNRESPONSIVE_WEB_PROCESS");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("terminationReason"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariDidTerminateWebProcessBeforeNavigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_DWORD *)a3 + 4) = self->_terminationReason;
    *((_BYTE *)a3 + 20) |= 2u;
    return;
  }
  *((_QWORD *)a3 + 1) = self->_timestamp;
  *((_BYTE *)a3 + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_terminationReason;
    *((_BYTE *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 2) == 0 || self->_terminationReason != *((_DWORD *)a3 + 4))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_terminationReason;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 20) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) == 0)
      return;
LABEL_5:
    self->_terminationReason = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_timestamp = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 20) & 2) != 0)
    goto LABEL_5;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
