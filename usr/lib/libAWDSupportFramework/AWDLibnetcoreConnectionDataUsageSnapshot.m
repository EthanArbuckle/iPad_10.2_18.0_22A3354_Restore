@implementation AWDLibnetcoreConnectionDataUsageSnapshot

- (void)setBytesIn:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBytesIn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBytesOut
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMultipathBytesInCell
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMultipathBytesInInitial
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreConnectionDataUsageSnapshot;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreConnectionDataUsageSnapshot description](&v3, sel_description), -[AWDLibnetcoreConnectionDataUsageSnapshot dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesIn), CFSTR("bytesIn"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOut), CFSTR("bytesOut"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInCell), CFSTR("multipathBytesInCell"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutCell), CFSTR("multipathBytesOutCell"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInWiFi), CFSTR("multipathBytesInWiFi"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInInitial), CFSTR("multipathBytesInInitial"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutWiFi), CFSTR("multipathBytesOutWiFi"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x40) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutInitial), CFSTR("multipathBytesOutInitial"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreConnectionDataUsageSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_bytesIn;
    *((_BYTE *)a3 + 72) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_bytesOut;
  *((_BYTE *)a3 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 3) = self->_multipathBytesInCell;
  *((_BYTE *)a3 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)a3 + 6) = self->_multipathBytesOutCell;
  *((_BYTE *)a3 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)a3 + 5) = self->_multipathBytesInWiFi;
  *((_BYTE *)a3 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 8) = self->_multipathBytesOutWiFi;
  *((_BYTE *)a3 + 72) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    *((_QWORD *)a3 + 7) = self->_multipathBytesOutInitial;
    *((_BYTE *)a3 + 72) |= 0x40u;
    return;
  }
LABEL_16:
  *((_QWORD *)a3 + 4) = self->_multipathBytesInInitial;
  *((_BYTE *)a3 + 72) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_bytesIn;
    *((_BYTE *)result + 72) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_bytesOut;
  *((_BYTE *)result + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 3) = self->_multipathBytesInCell;
  *((_BYTE *)result + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 6) = self->_multipathBytesOutCell;
  *((_BYTE *)result + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 5) = self->_multipathBytesInWiFi;
  *((_BYTE *)result + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 8) = self->_multipathBytesOutWiFi;
  *((_BYTE *)result + 72) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)result + 4) = self->_multipathBytesInInitial;
  *((_BYTE *)result + 72) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_9:
  *((_QWORD *)result + 7) = self->_multipathBytesOutInitial;
  *((_BYTE *)result + 72) |= 0x40u;
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
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_bytesIn != *((_QWORD *)a3 + 1))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_bytesOut != *((_QWORD *)a3 + 2))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_multipathBytesInCell != *((_QWORD *)a3 + 3))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_multipathBytesOutCell != *((_QWORD *)a3 + 6))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_multipathBytesInWiFi != *((_QWORD *)a3 + 5))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x80) == 0 || self->_multipathBytesOutWiFi != *((_QWORD *)a3 + 8))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_multipathBytesInInitial != *((_QWORD *)a3 + 4))
        goto LABEL_41;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 0x40) == 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x40) == 0 || self->_multipathBytesOutInitial != *((_QWORD *)a3 + 7))
        goto LABEL_41;
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
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_bytesIn;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_bytesOut;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_multipathBytesInCell;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_multipathBytesOutCell;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_multipathBytesInWiFi;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761u * self->_multipathBytesInInitial;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761u * self->_multipathBytesOutInitial;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 1) != 0)
  {
    self->_bytesIn = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 72);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bytesOut = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_multipathBytesInCell = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_multipathBytesOutCell = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_multipathBytesInWiFi = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_multipathBytesOutWiFi = *((_QWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x80u;
  v3 = *((_BYTE *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      return;
LABEL_17:
    self->_multipathBytesOutInitial = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    return;
  }
LABEL_16:
  self->_multipathBytesInInitial = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
    goto LABEL_17;
}

- (unint64_t)bytesIn
{
  return self->_bytesIn;
}

- (unint64_t)bytesOut
{
  return self->_bytesOut;
}

- (unint64_t)multipathBytesInCell
{
  return self->_multipathBytesInCell;
}

- (unint64_t)multipathBytesOutCell
{
  return self->_multipathBytesOutCell;
}

- (unint64_t)multipathBytesInWiFi
{
  return self->_multipathBytesInWiFi;
}

- (unint64_t)multipathBytesOutWiFi
{
  return self->_multipathBytesOutWiFi;
}

- (unint64_t)multipathBytesInInitial
{
  return self->_multipathBytesInInitial;
}

- (unint64_t)multipathBytesOutInitial
{
  return self->_multipathBytesOutInitial;
}

@end
