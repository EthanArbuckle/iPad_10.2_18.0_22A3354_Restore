@implementation WiFiAnalyticsAWDWiFiQualityScore

- (void)setChannelQuality:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelQuality = a3;
}

- (void)setHasChannelQuality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelQuality
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTxLoss:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_txLoss = a3;
}

- (void)setHasTxLoss:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTxLoss
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRxLoss:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rxLoss = a3;
}

- (void)setHasRxLoss:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxLoss
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTxLatency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_txLatency = a3;
}

- (void)setHasTxLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxLatency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxLatency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rxLatency = a3;
}

- (void)setHasRxLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxLatency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiQualityScore;
  -[WiFiAnalyticsAWDWiFiQualityScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiQualityScore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelQuality);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("channelQuality"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txLoss);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("txLoss"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txLatency);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("txLatency"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxLoss);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rxLoss"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxLatency);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rxLatency"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiQualityScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_channelQuality;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_txLoss;
  *((_BYTE *)v4 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    v4[5] = self->_txLatency;
    *((_BYTE *)v4 + 28) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[4] = self->_rxLoss;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_rxLatency;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_channelQuality;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_txLoss;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_rxLoss;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_txLatency;
  *((_BYTE *)result + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_rxLatency;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_channelQuality != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0 || self->_txLoss != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_rxLoss != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_txLatency != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_rxLatency != *((_DWORD *)v4 + 3))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_channelQuality;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_txLoss;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_rxLoss;
    if ((*(_BYTE *)&self->_has & 8) != 0)
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
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_txLatency;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_rxLatency;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_channelQuality = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_txLoss = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_txLatency = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_rxLoss = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_rxLatency = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (unsigned)channelQuality
{
  return self->_channelQuality;
}

- (unsigned)txLoss
{
  return self->_txLoss;
}

- (unsigned)rxLoss
{
  return self->_rxLoss;
}

- (unsigned)txLatency
{
  return self->_txLatency;
}

- (unsigned)rxLatency
{
  return self->_rxLatency;
}

@end
