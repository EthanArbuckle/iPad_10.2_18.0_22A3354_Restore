@implementation AWDSpringBoardIconLaunch

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

- (void)setIconIsFolder:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_iconIsFolder = a3;
}

- (void)setHasIconIsFolder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconIsFolder
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIconIsFromFolder:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_iconIsFromFolder = a3;
}

- (void)setHasIconIsFromFolder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIconIsFromFolder
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIconIsFromDock:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_iconIsFromDock = a3;
}

- (void)setHasIconIsFromDock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIconIsFromDock
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIconPageInFolder:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iconPageInFolder = a3;
}

- (void)setHasIconPageInFolder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIconPageInFolder
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalIconPagesInFolder:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalIconPagesInFolder = a3;
}

- (void)setHasTotalIconPagesInFolder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalIconPagesInFolder
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardIconLaunch;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardIconLaunch description](&v3, sel_description), -[AWDSpringBoardIconLaunch dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iconIsFolder), CFSTR("iconIsFolder"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iconIsFromFolder), CFSTR("iconIsFromFolder"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iconPageInFolder), CFSTR("iconPageInFolder"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iconIsFromDock), CFSTR("iconIsFromDock"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalIconPagesInFolder), CFSTR("totalIconPagesInFolder"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardIconLaunchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 32) = self->_iconIsFolder;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)a3 + 34) = self->_iconIsFromFolder;
  *((_BYTE *)a3 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)a3 + 33) = self->_iconIsFromDock;
  *((_BYTE *)a3 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return;
LABEL_13:
    *((_QWORD *)a3 + 3) = self->_totalIconPagesInFolder;
    *((_BYTE *)a3 + 36) |= 4u;
    return;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_iconPageInFolder;
  *((_BYTE *)a3 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
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
    *((_BYTE *)result + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 32) = self->_iconIsFolder;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 34) = self->_iconIsFromFolder;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 33) = self->_iconIsFromDock;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 1) = self->_iconPageInFolder;
  *((_BYTE *)result + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 3) = self->_totalIconPagesInFolder;
  *((_BYTE *)result + 36) |= 4u;
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
    if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 8) == 0)
      goto LABEL_40;
    if (self->_iconIsFolder)
    {
      if (!*((_BYTE *)a3 + 32))
        goto LABEL_40;
    }
    else if (*((_BYTE *)a3 + 32))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 0x20) == 0)
      goto LABEL_40;
    if (self->_iconIsFromFolder)
    {
      if (!*((_BYTE *)a3 + 34))
        goto LABEL_40;
    }
    else if (*((_BYTE *)a3 + 34))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 36) & 0x10) != 0)
      goto LABEL_40;
    goto LABEL_31;
  }
  if ((*((_BYTE *)a3 + 36) & 0x10) == 0)
    goto LABEL_40;
  if (self->_iconIsFromDock)
  {
    if (!*((_BYTE *)a3 + 33))
      goto LABEL_40;
    goto LABEL_31;
  }
  if (*((_BYTE *)a3 + 33))
  {
LABEL_40:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_31:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_iconPageInFolder != *((_QWORD *)a3 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    goto LABEL_40;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_totalIconPagesInFolder != *((_QWORD *)a3 + 3))
      goto LABEL_40;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_iconIsFolder;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_iconIsFromFolder;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_iconIsFromDock;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761u * self->_iconPageInFolder;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761u * self->_totalIconPagesInFolder;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_iconIsFolder = *((_BYTE *)a3 + 32);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_iconIsFromFolder = *((_BYTE *)a3 + 34);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_iconIsFromDock = *((_BYTE *)a3 + 33);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      return;
LABEL_13:
    self->_totalIconPagesInFolder = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_12:
  self->_iconPageInFolder = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 36) & 4) != 0)
    goto LABEL_13;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)iconIsFolder
{
  return self->_iconIsFolder;
}

- (BOOL)iconIsFromFolder
{
  return self->_iconIsFromFolder;
}

- (BOOL)iconIsFromDock
{
  return self->_iconIsFromDock;
}

- (unint64_t)iconPageInFolder
{
  return self->_iconPageInFolder;
}

- (unint64_t)totalIconPagesInFolder
{
  return self->_totalIconPagesInFolder;
}

@end
