@implementation WiFiAnalyticsAWDWiFiNWActivityMpduWME

- (void)setTid0:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tid0 = a3;
}

- (void)setHasTid0:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTid0
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTid1:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tid1 = a3;
}

- (void)setHasTid1:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTid1
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTid2:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tid2 = a3;
}

- (void)setHasTid2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTid2
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTid3:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tid3 = a3;
}

- (void)setHasTid3:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTid3
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTid4:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tid4 = a3;
}

- (void)setHasTid4:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTid4
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTid5:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tid5 = a3;
}

- (void)setHasTid5:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTid5
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTid6:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_tid6 = a3;
}

- (void)setHasTid6:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTid6
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTid7:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_tid7 = a3;
}

- (void)setHasTid7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTid7
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityMpduWME;
  -[WiFiAnalyticsAWDWiFiNWActivityMpduWME description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityMpduWME dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("tid0"));

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tid1"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("tid2"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("tid3"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("tid4"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("tid6"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      return v3;
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("tid7"));

    return v3;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tid5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("tid5"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityMpduWMEReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
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
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
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
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteUint64Field();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_tid0;
    *((_BYTE *)v4 + 72) |= 1u;
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
  v4[2] = self->_tid1;
  *((_BYTE *)v4 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[3] = self->_tid2;
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[4] = self->_tid3;
  *((_BYTE *)v4 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v4[5] = self->_tid4;
  *((_BYTE *)v4 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    v4[7] = self->_tid6;
    *((_BYTE *)v4 + 72) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    v4[8] = self->_tid7;
    *((_BYTE *)v4 + 72) |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  v4[6] = self->_tid5;
  *((_BYTE *)v4 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_tid0;
    *((_BYTE *)result + 72) |= 1u;
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
  *((_QWORD *)result + 2) = self->_tid1;
  *((_BYTE *)result + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 3) = self->_tid2;
  *((_BYTE *)result + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 4) = self->_tid3;
  *((_BYTE *)result + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 5) = self->_tid4;
  *((_BYTE *)result + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 6) = self->_tid5;
  *((_BYTE *)result + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      return result;
LABEL_17:
    *((_QWORD *)result + 8) = self->_tid7;
    *((_BYTE *)result + 72) |= 0x80u;
    return result;
  }
LABEL_16:
  *((_QWORD *)result + 7) = self->_tid6;
  *((_BYTE *)result + 72) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    goto LABEL_17;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[72] & 1) == 0 || self->_tid0 != *((_QWORD *)v4 + 1))
      goto LABEL_41;
  }
  else if ((v4[72] & 1) != 0)
  {
LABEL_41:
    v5 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[72] & 2) == 0 || self->_tid1 != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((v4[72] & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[72] & 4) == 0 || self->_tid2 != *((_QWORD *)v4 + 3))
      goto LABEL_41;
  }
  else if ((v4[72] & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[72] & 8) == 0 || self->_tid3 != *((_QWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((v4[72] & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[72] & 0x10) == 0 || self->_tid4 != *((_QWORD *)v4 + 5))
      goto LABEL_41;
  }
  else if ((v4[72] & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[72] & 0x20) == 0 || self->_tid5 != *((_QWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((v4[72] & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[72] & 0x40) == 0 || self->_tid6 != *((_QWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((v4[72] & 0x40) != 0)
  {
    goto LABEL_41;
  }
  v5 = v4[72] >= 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v4[72] & 0x80) == 0 || self->_tid7 != *((_QWORD *)v4 + 8))
      goto LABEL_41;
    v5 = 1;
  }
LABEL_42:

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
    v2 = 2654435761u * self->_tid0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_tid1;
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
    v4 = 2654435761u * self->_tid2;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_tid3;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_tid4;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_tid5;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761u * self->_tid6;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761u * self->_tid7;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 1) != 0)
  {
    self->_tid0 = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 72);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_tid1 = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_tid2 = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_tid3 = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_tid4 = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    self->_tid6 = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 72) & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    self->_tid7 = *((_QWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  self->_tid5 = *((_QWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (v5 < 0)
    goto LABEL_17;
LABEL_9:

}

- (unint64_t)tid0
{
  return self->_tid0;
}

- (unint64_t)tid1
{
  return self->_tid1;
}

- (unint64_t)tid2
{
  return self->_tid2;
}

- (unint64_t)tid3
{
  return self->_tid3;
}

- (unint64_t)tid4
{
  return self->_tid4;
}

- (unint64_t)tid5
{
  return self->_tid5;
}

- (unint64_t)tid6
{
  return self->_tid6;
}

- (unint64_t)tid7
{
  return self->_tid7;
}

@end
