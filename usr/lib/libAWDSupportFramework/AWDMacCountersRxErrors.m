@implementation AWDMacCountersRxErrors

- (void)setRxfrmtoolong:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rxfrmtoolong = a3;
}

- (void)setHasRxfrmtoolong:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRxfrmtoolong
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxfrmtooshrt:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_rxfrmtooshrt = a3;
}

- (void)setHasRxfrmtooshrt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRxfrmtooshrt
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRxinvmachdr:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rxinvmachdr = a3;
}

- (void)setHasRxinvmachdr:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRxinvmachdr
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRxbadfcs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rxbadfcs = a3;
}

- (void)setHasRxbadfcs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRxbadfcs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRxbadplcp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rxbadplcp = a3;
}

- (void)setHasRxbadplcp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxbadplcp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRxcrsglitch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rxcrsglitch = a3;
}

- (void)setHasRxcrsglitch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxcrsglitch
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRxstrt:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rxstrt = a3;
}

- (void)setHasRxstrt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRxstrt
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMacCountersRxErrors;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMacCountersRxErrors description](&v3, sel_description), -[AWDMacCountersRxErrors dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxfrmtoolong), CFSTR("rxfrmtoolong"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxfrmtooshrt), CFSTR("rxfrmtooshrt"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxinvmachdr), CFSTR("rxinvmachdr"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadfcs), CFSTR("rxbadfcs"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxcrsglitch), CFSTR("rxcrsglitch"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadplcp), CFSTR("rxbadplcp"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxstrt), CFSTR("rxstrt"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMacCountersRxErrorsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_rxfrmtoolong;
    *((_BYTE *)a3 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 5) = self->_rxfrmtooshrt;
  *((_BYTE *)a3 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)a3 + 6) = self->_rxinvmachdr;
  *((_BYTE *)a3 + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)a3 + 1) = self->_rxbadfcs;
  *((_BYTE *)a3 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)a3 + 2) = self->_rxbadplcp;
  *((_BYTE *)a3 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return;
LABEL_15:
    *((_QWORD *)a3 + 7) = self->_rxstrt;
    *((_BYTE *)a3 + 64) |= 0x40u;
    return;
  }
LABEL_14:
  *((_QWORD *)a3 + 3) = self->_rxcrsglitch;
  *((_BYTE *)a3 + 64) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)result + 4) = self->_rxfrmtoolong;
    *((_BYTE *)result + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 5) = self->_rxfrmtooshrt;
  *((_BYTE *)result + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 6) = self->_rxinvmachdr;
  *((_BYTE *)result + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 1) = self->_rxbadfcs;
  *((_BYTE *)result + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 2) = self->_rxbadplcp;
  *((_BYTE *)result + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_QWORD *)result + 3) = self->_rxcrsglitch;
  *((_BYTE *)result + 64) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_8:
  *((_QWORD *)result + 7) = self->_rxstrt;
  *((_BYTE *)result + 64) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_rxfrmtoolong != *((_QWORD *)a3 + 4))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 8) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_rxfrmtooshrt != *((_QWORD *)a3 + 5))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x20) == 0 || self->_rxinvmachdr != *((_QWORD *)a3 + 6))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_rxbadfcs != *((_QWORD *)a3 + 1))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_rxbadplcp != *((_QWORD *)a3 + 2))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_rxcrsglitch != *((_QWORD *)a3 + 3))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 64) & 4) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 64) & 0x40) == 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x40) == 0 || self->_rxstrt != *((_QWORD *)a3 + 7))
        goto LABEL_36;
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

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761u * self->_rxfrmtoolong;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_rxfrmtooshrt;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_rxinvmachdr;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_rxbadfcs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_rxbadplcp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761u * self->_rxcrsglitch;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761u * self->_rxstrt;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 8) != 0)
  {
    self->_rxfrmtoolong = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v3 = *((_BYTE *)a3 + 64);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_rxfrmtooshrt = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_rxinvmachdr = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_rxbadfcs = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_rxbadplcp = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      return;
LABEL_15:
    self->_rxstrt = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    return;
  }
LABEL_14:
  self->_rxcrsglitch = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 64) & 0x40) != 0)
    goto LABEL_15;
}

- (unint64_t)rxfrmtoolong
{
  return self->_rxfrmtoolong;
}

- (unint64_t)rxfrmtooshrt
{
  return self->_rxfrmtooshrt;
}

- (unint64_t)rxinvmachdr
{
  return self->_rxinvmachdr;
}

- (unint64_t)rxbadfcs
{
  return self->_rxbadfcs;
}

- (unint64_t)rxbadplcp
{
  return self->_rxbadplcp;
}

- (unint64_t)rxcrsglitch
{
  return self->_rxcrsglitch;
}

- (unint64_t)rxstrt
{
  return self->_rxstrt;
}

@end
