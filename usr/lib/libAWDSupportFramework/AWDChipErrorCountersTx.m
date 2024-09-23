@implementation AWDChipErrorCountersTx

- (void)setTxuflo:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_txuflo = a3;
}

- (void)setHasTxuflo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTxuflo
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTxphyerr:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_txphyerr = a3;
}

- (void)setHasTxphyerr:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxphyerr
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTxphycrs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_txphycrs = a3;
}

- (void)setHasTxphycrs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxphycrs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTxchanrej:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_txchanrej = a3;
}

- (void)setHasTxchanrej:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxchanrej
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTxexptime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_txexptime = a3;
}

- (void)setHasTxexptime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTxexptime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDChipErrorCountersTx;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDChipErrorCountersTx description](&v3, sel_description), -[AWDChipErrorCountersTx dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txuflo), CFSTR("txuflo"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txphyerr), CFSTR("txphyerr"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txchanrej), CFSTR("txchanrej"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txphycrs), CFSTR("txphycrs"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txexptime), CFSTR("txexptime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipErrorCountersTxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_txuflo;
    *((_BYTE *)a3 + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_txphyerr;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_QWORD *)a3 + 3) = self->_txphycrs;
  *((_BYTE *)a3 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    *((_QWORD *)a3 + 2) = self->_txexptime;
    *((_BYTE *)a3 + 48) |= 2u;
    return;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_txchanrej;
  *((_BYTE *)a3 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = self->_txuflo;
    *((_BYTE *)result + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_txphyerr;
  *((_BYTE *)result + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 3) = self->_txphycrs;
  *((_BYTE *)result + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 1) = self->_txchanrej;
  *((_BYTE *)result + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 2) = self->_txexptime;
  *((_BYTE *)result + 48) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_txuflo != *((_QWORD *)a3 + 5))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_txphyerr != *((_QWORD *)a3 + 4))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_txphycrs != *((_QWORD *)a3 + 3))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_txchanrej != *((_QWORD *)a3 + 1))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_txexptime != *((_QWORD *)a3 + 2))
        goto LABEL_26;
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

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761u * self->_txuflo;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_txphyerr;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_txphycrs;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761u * self->_txchanrej;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_txexptime;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 0x10) != 0)
  {
    self->_txuflo = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_txphyerr = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_txphycrs = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      return;
LABEL_11:
    self->_txexptime = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_txchanrej = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
    goto LABEL_11;
}

- (unint64_t)txuflo
{
  return self->_txuflo;
}

- (unint64_t)txphyerr
{
  return self->_txphyerr;
}

- (unint64_t)txphycrs
{
  return self->_txphycrs;
}

- (unint64_t)txchanrej
{
  return self->_txchanrej;
}

- (unint64_t)txexptime
{
  return self->_txexptime;
}

@end
