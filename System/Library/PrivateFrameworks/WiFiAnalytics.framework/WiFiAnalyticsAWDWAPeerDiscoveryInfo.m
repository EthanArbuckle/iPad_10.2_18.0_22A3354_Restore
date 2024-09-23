@implementation WiFiAnalyticsAWDWAPeerDiscoveryInfo

- (void)setNumPeersDiscovered:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numPeersDiscovered = a3;
}

- (void)setHasNumPeersDiscovered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumPeersDiscovered
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIOSPeers:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iOSPeers = a3;
}

- (void)setHasIOSPeers:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIOSPeers
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTvOSPeers:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tvOSPeers = a3;
}

- (void)setHasTvOSPeers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTvOSPeers
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMacOSPeers:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_macOSPeers = a3;
}

- (void)setHasMacOSPeers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMacOSPeers
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
  v8.super_class = (Class)WiFiAnalyticsAWDWAPeerDiscoveryInfo;
  -[WiFiAnalyticsAWDWAPeerDiscoveryInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWAPeerDiscoveryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numPeersDiscovered);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("numPeersDiscovered"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tvOSPeers);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("tvOSPeers"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_iOSPeers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("iOSPeers"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_macOSPeers);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("macOSPeers"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWAPeerDiscoveryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_numPeersDiscovered;
    *((_BYTE *)v4 + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      v4[5] = self->_tvOSPeers;
      *((_BYTE *)v4 + 24) |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_iOSPeers;
  *((_BYTE *)v4 + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    v4[3] = self->_macOSPeers;
    *((_BYTE *)v4 + 24) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_numPeersDiscovered;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_iOSPeers;
  *((_BYTE *)result + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_tvOSPeers;
  *((_BYTE *)result + 24) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 3) = self->_macOSPeers;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_numPeersDiscovered != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_iOSPeers != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_tvOSPeers != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_macOSPeers != *((_DWORD *)v4 + 3))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_numPeersDiscovered;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_iOSPeers;
      if ((*(_BYTE *)&self->_has & 8) != 0)
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
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_tvOSPeers;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_macOSPeers;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_numPeersDiscovered = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_tvOSPeers = *((_DWORD *)v4 + 5);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v4 + 24) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_iOSPeers = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    self->_macOSPeers = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:

}

- (unsigned)numPeersDiscovered
{
  return self->_numPeersDiscovered;
}

- (unsigned)iOSPeers
{
  return self->_iOSPeers;
}

- (unsigned)tvOSPeers
{
  return self->_tvOSPeers;
}

- (unsigned)macOSPeers
{
  return self->_macOSPeers;
}

@end
