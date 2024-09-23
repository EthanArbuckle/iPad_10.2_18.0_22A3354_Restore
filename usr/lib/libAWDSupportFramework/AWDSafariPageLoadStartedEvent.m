@implementation AWDSafariPageLoadStartedEvent

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

- (void)setConfigurationID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_configurationID = a3;
}

- (void)setHasConfigurationID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfigurationID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPageID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pageID = a3;
}

- (void)setHasPageID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPageID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariPageLoadStartedEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariPageLoadStartedEvent description](&v3, sel_description), -[AWDSafariPageLoadStartedEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_configurationID), CFSTR("configurationID"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_pageID), CFSTR("pageID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariPageLoadStartedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return;
LABEL_7:
      PBDataWriterWriteUint64Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return;
LABEL_7:
      *((_QWORD *)a3 + 2) = self->_pageID;
      *((_BYTE *)a3 + 32) |= 2u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_configurationID;
  *((_BYTE *)a3 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_7;
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
    *((_BYTE *)result + 32) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_configurationID;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 2) = self->_pageID;
  *((_BYTE *)result + 32) |= 2u;
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
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_configurationID != *((_QWORD *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_pageID != *((_QWORD *)a3 + 2))
        goto LABEL_16;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761u * self->_configurationID;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_pageID;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        return;
LABEL_7:
      self->_pageID = *((_QWORD *)a3 + 2);
      *(_BYTE *)&self->_has |= 2u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_configurationID = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
    goto LABEL_7;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)configurationID
{
  return self->_configurationID;
}

- (unint64_t)pageID
{
  return self->_pageID;
}

@end
