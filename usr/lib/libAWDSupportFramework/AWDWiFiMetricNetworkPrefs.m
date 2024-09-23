@implementation AWDWiFiMetricNetworkPrefs

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricNetworkPrefs setMostUsedNetworks:](self, "setMostUsedNetworks:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricNetworkPrefs;
  -[AWDWiFiMetricNetworkPrefs dealloc](&v3, sel_dealloc);
}

- (void)setAtjEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_atjEnabled = a3;
}

- (void)setHasAtjEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasAtjEnabled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setAtjCanceledCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_atjCanceledCount = a3;
}

- (void)setHasAtjCanceledCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAtjCanceledCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAtjUsedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_atjUsedCount = a3;
}

- (void)setHasAtjUsedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAtjUsedCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAdhocNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_adhocNetsCount = a3;
}

- (void)setHasAdhocNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdhocNetsCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPrefNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prefNetsCount = a3;
}

- (void)setHasPrefNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrefNetsCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCaptiveNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_captiveNetsCount = a3;
}

- (void)setHasCaptiveNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCaptiveNetsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setApplePersHotspotNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_applePersHotspotNetsCount = a3;
}

- (void)setHasApplePersHotspotNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasApplePersHotspotNetsCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWapiNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wapiNetsCount = a3;
}

- (void)setHasWapiNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWapiNetsCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMostUsedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mostUsedCount = a3;
}

- (void)setHasMostUsedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMostUsedCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearMostUsedNetworks
{
  -[NSMutableArray removeAllObjects](self->_mostUsedNetworks, "removeAllObjects");
}

- (void)addMostUsedNetworks:(id)a3
{
  NSMutableArray *mostUsedNetworks;

  mostUsedNetworks = self->_mostUsedNetworks;
  if (!mostUsedNetworks)
  {
    mostUsedNetworks = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_mostUsedNetworks = mostUsedNetworks;
  }
  -[NSMutableArray addObject:](mostUsedNetworks, "addObject:", a3);
}

- (unint64_t)mostUsedNetworksCount
{
  return -[NSMutableArray count](self->_mostUsedNetworks, "count");
}

- (id)mostUsedNetworksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mostUsedNetworks, "objectAtIndex:", a3);
}

+ (Class)mostUsedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHiddenNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hiddenNetsCount = a3;
}

- (void)setHasHiddenNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHiddenNetsCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWepNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wepNetsCount = a3;
}

- (void)setHasWepNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWepNetsCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWpaNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wpaNetsCount = a3;
}

- (void)setHasWpaNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWpaNetsCount
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setEapNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_eapNetsCount = a3;
}

- (void)setHasEapNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEapNetsCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOpenNonCaptiveNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_openNonCaptiveNetsCount = a3;
}

- (void)setHasOpenNonCaptiveNetsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOpenNonCaptiveNetsCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricNetworkPrefs;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricNetworkPrefs description](&v3, sel_description), -[AWDWiFiMetricNetworkPrefs dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSMutableArray *mostUsedNetworks;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_atjEnabled), CFSTR("atjEnabled"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_atjCanceledCount), CFSTR("atjCanceledCount"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_atjUsedCount), CFSTR("atjUsedCount"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_adhocNetsCount), CFSTR("adhocNetsCount"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_prefNetsCount), CFSTR("prefNetsCount"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_captiveNetsCount), CFSTR("captiveNetsCount"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_applePersHotspotNetsCount), CFSTR("applePersHotspotNetsCount"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wapiNetsCount), CFSTR("wapiNetsCount"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mostUsedCount), CFSTR("mostUsedCount"));
LABEL_11:
  if (-[NSMutableArray count](self->_mostUsedNetworks, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_mostUsedNetworks, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    mostUsedNetworks = self->_mostUsedNetworks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(mostUsedNetworks);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mostUsedNetworks"));

  }
  v11 = (__int16)self->_has;
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_22:
      if ((v11 & 0x1000) == 0)
        goto LABEL_23;
      goto LABEL_39;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hiddenNetsCount), CFSTR("hiddenNetsCount"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_23:
    if ((v11 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wepNetsCount), CFSTR("wepNetsCount"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x2000) == 0)
  {
LABEL_24:
    if ((v11 & 0x40) == 0)
      goto LABEL_25;
LABEL_41:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eapNetsCount), CFSTR("eapNetsCount"));
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v3;
    goto LABEL_26;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wpaNetsCount), CFSTR("wpaNetsCount"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
    goto LABEL_41;
LABEL_25:
  if ((v11 & 0x200) != 0)
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_openNonCaptiveNetsCount), CFSTR("openNonCaptiveNetsCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricNetworkPrefsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *mostUsedNetworks;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  mostUsedNetworks = self->_mostUsedNetworks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(mostUsedNetworks);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = (__int16)self->_has;
  if ((v10 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_20:
      if ((v10 & 0x1000) == 0)
        goto LABEL_21;
      goto LABEL_37;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  v10 = (__int16)self->_has;
  if ((v10 & 0x1000) == 0)
  {
LABEL_21:
    if ((v10 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v10 = (__int16)self->_has;
  if ((v10 & 0x2000) == 0)
  {
LABEL_22:
    if ((v10 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_23:
    if ((v10 & 0x200) == 0)
      return;
    goto LABEL_24;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return;
LABEL_24:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int16 v9;

  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    *((_BYTE *)a3 + 76) = self->_atjEnabled;
    *((_WORD *)a3 + 40) |= 0x4000u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_atjCanceledCount;
  *((_WORD *)a3 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 7) = self->_atjUsedCount;
  *((_WORD *)a3 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_adhocNetsCount;
  *((_WORD *)a3 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_prefNetsCount;
  *((_WORD *)a3 + 40) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_captiveNetsCount;
  *((_WORD *)a3 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
LABEL_30:
    *((_DWORD *)a3 + 16) = self->_wapiNetsCount;
    *((_WORD *)a3 + 40) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_29:
  *((_DWORD *)a3 + 5) = self->_applePersHotspotNetsCount;
  *((_WORD *)a3 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_30;
LABEL_9:
  if ((has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 11) = self->_mostUsedCount;
    *((_WORD *)a3 + 40) |= 0x100u;
  }
LABEL_11:
  if (-[AWDWiFiMetricNetworkPrefs mostUsedNetworksCount](self, "mostUsedNetworksCount"))
  {
    objc_msgSend(a3, "clearMostUsedNetworks");
    v6 = -[AWDWiFiMetricNetworkPrefs mostUsedNetworksCount](self, "mostUsedNetworksCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMostUsedNetworks:", -[AWDWiFiMetricNetworkPrefs mostUsedNetworksAtIndex:](self, "mostUsedNetworksAtIndex:", i));
    }
  }
  v9 = (__int16)self->_has;
  if ((v9 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 1u;
    v9 = (__int16)self->_has;
    if ((v9 & 0x80) == 0)
    {
LABEL_17:
      if ((v9 & 0x1000) == 0)
        goto LABEL_18;
      goto LABEL_34;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 10) = self->_hiddenNetsCount;
  *((_WORD *)a3 + 40) |= 0x80u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x1000) == 0)
  {
LABEL_18:
    if ((v9 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 17) = self->_wepNetsCount;
  *((_WORD *)a3 + 40) |= 0x1000u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x2000) == 0)
  {
LABEL_19:
    if ((v9 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 18) = self->_wpaNetsCount;
  *((_WORD *)a3 + 40) |= 0x2000u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_20:
    if ((v9 & 0x200) == 0)
      return;
    goto LABEL_21;
  }
LABEL_36:
  *((_DWORD *)a3 + 9) = self->_eapNetsCount;
  *((_WORD *)a3 + 40) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return;
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_openNonCaptiveNetsCount;
  *((_WORD *)a3 + 40) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *mostUsedNetworks;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int16 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_atjEnabled;
    *(_WORD *)(v5 + 80) |= 0x4000u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_atjCanceledCount;
  *(_WORD *)(v5 + 80) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 28) = self->_atjUsedCount;
  *(_WORD *)(v5 + 80) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 16) = self->_adhocNetsCount;
  *(_WORD *)(v5 + 80) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_prefNetsCount;
  *(_WORD *)(v5 + 80) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 32) = self->_captiveNetsCount;
  *(_WORD *)(v5 + 80) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 20) = self->_applePersHotspotNetsCount;
  *(_WORD *)(v5 + 80) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  *(_DWORD *)(v5 + 64) = self->_wapiNetsCount;
  *(_WORD *)(v5 + 80) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 44) = self->_mostUsedCount;
    *(_WORD *)(v5 + 80) |= 0x100u;
  }
LABEL_11:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  mostUsedNetworks = self->_mostUsedNetworks;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(mostUsedNetworks);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMostUsedNetworks:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mostUsedNetworks, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v14 = (__int16)self->_has;
  if ((v14 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_timestamp;
    *(_WORD *)(v6 + 80) |= 1u;
    v14 = (__int16)self->_has;
    if ((v14 & 0x80) == 0)
    {
LABEL_20:
      if ((v14 & 0x1000) == 0)
        goto LABEL_21;
      goto LABEL_37;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 40) = self->_hiddenNetsCount;
  *(_WORD *)(v6 + 80) |= 0x80u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x1000) == 0)
  {
LABEL_21:
    if ((v14 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 68) = self->_wepNetsCount;
  *(_WORD *)(v6 + 80) |= 0x1000u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x2000) == 0)
  {
LABEL_22:
    if ((v14 & 0x40) == 0)
      goto LABEL_23;
LABEL_39:
    *(_DWORD *)(v6 + 36) = self->_eapNetsCount;
    *(_WORD *)(v6 + 80) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return (id)v6;
    goto LABEL_24;
  }
LABEL_38:
  *(_DWORD *)(v6 + 72) = self->_wpaNetsCount;
  *(_WORD *)(v6 + 80) |= 0x2000u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x40) != 0)
    goto LABEL_39;
LABEL_23:
  if ((v14 & 0x200) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 56) = self->_openNonCaptiveNetsCount;
    *(_WORD *)(v6 + 80) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *mostUsedNetworks;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 40);
  if ((has & 0x4000) == 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x4000) != 0)
      goto LABEL_82;
    goto LABEL_10;
  }
  if ((*((_WORD *)a3 + 40) & 0x4000) == 0)
    goto LABEL_82;
  if (self->_atjEnabled)
  {
    if (!*((_BYTE *)a3 + 76))
      goto LABEL_82;
    goto LABEL_10;
  }
  if (*((_BYTE *)a3 + 76))
  {
LABEL_82:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_10:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_atjCanceledCount != *((_DWORD *)a3 + 6))
      goto LABEL_82;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_atjUsedCount != *((_DWORD *)a3 + 7))
      goto LABEL_82;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_adhocNetsCount != *((_DWORD *)a3 + 4))
      goto LABEL_82;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_prefNetsCount != *((_DWORD *)a3 + 15))
      goto LABEL_82;
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_captiveNetsCount != *((_DWORD *)a3 + 8))
      goto LABEL_82;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_applePersHotspotNetsCount != *((_DWORD *)a3 + 5))
      goto LABEL_82;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x800) == 0 || self->_wapiNetsCount != *((_DWORD *)a3 + 16))
      goto LABEL_82;
  }
  else if ((*((_WORD *)a3 + 40) & 0x800) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_mostUsedCount != *((_DWORD *)a3 + 11))
      goto LABEL_82;
  }
  else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
    goto LABEL_82;
  }
  mostUsedNetworks = self->_mostUsedNetworks;
  if ((unint64_t)mostUsedNetworks | *((_QWORD *)a3 + 6))
  {
    v5 = -[NSMutableArray isEqual:](mostUsedNetworks, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 40);
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_82;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_hiddenNetsCount != *((_DWORD *)a3 + 10))
      goto LABEL_82;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x1000) == 0 || self->_wepNetsCount != *((_DWORD *)a3 + 17))
      goto LABEL_82;
  }
  else if ((*((_WORD *)a3 + 40) & 0x1000) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x2000) == 0 || self->_wpaNetsCount != *((_DWORD *)a3 + 18))
      goto LABEL_82;
  }
  else if ((*((_WORD *)a3 + 40) & 0x2000) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_eapNetsCount != *((_DWORD *)a3 + 9))
      goto LABEL_82;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_82;
  }
  LOBYTE(v5) = (v9 & 0x200) == 0;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_openNonCaptiveNetsCount != *((_DWORD *)a3 + 14))
      goto LABEL_82;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    v22 = 2654435761 * self->_atjEnabled;
    if ((has & 8) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_atjCanceledCount;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v22 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_atjUsedCount;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_adhocNetsCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_prefNetsCount;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_captiveNetsCount;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_applePersHotspotNetsCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
LABEL_18:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_18;
LABEL_9:
  v9 = 2654435761 * self->_wapiNetsCount;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_mostUsedCount;
    goto LABEL_20;
  }
LABEL_19:
  v10 = 0;
LABEL_20:
  v11 = -[NSMutableArray hash](self->_mostUsedNetworks, "hash", v20);
  v12 = (__int16)self->_has;
  if ((v12 & 1) != 0)
  {
    v13 = 2654435761u * self->_timestamp;
    if ((v12 & 0x80) != 0)
    {
LABEL_22:
      v14 = 2654435761 * self->_hiddenNetsCount;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_23;
      goto LABEL_29;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 0x80) != 0)
      goto LABEL_22;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_23:
    v15 = 2654435761 * self->_wepNetsCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_24;
    goto LABEL_30;
  }
LABEL_29:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_24:
    v16 = 2654435761 * self->_wpaNetsCount;
    if ((v12 & 0x40) != 0)
      goto LABEL_25;
LABEL_31:
    v17 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_26;
LABEL_32:
    v18 = 0;
    return v21 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
  }
LABEL_30:
  v16 = 0;
  if ((v12 & 0x40) == 0)
    goto LABEL_31;
LABEL_25:
  v17 = 2654435761 * self->_eapNetsCount;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_32;
LABEL_26:
  v18 = 2654435761 * self->_openNonCaptiveNetsCount;
  return v21 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x4000) != 0)
  {
    self->_atjEnabled = *((_BYTE *)a3 + 76);
    *(_WORD *)&self->_has |= 0x4000u;
    v5 = *((_WORD *)a3 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_atjCanceledCount = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  self->_atjUsedCount = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  self->_adhocNetsCount = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  self->_prefNetsCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  self->_captiveNetsCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  self->_applePersHotspotNetsCount = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  self->_wapiNetsCount = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
LABEL_10:
    self->_mostUsedCount = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiMetricNetworkPrefs addMostUsedNetworks:](self, "addMostUsedNetworks:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11 = *((_WORD *)a3 + 40);
  if ((v11 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v11 = *((_WORD *)a3 + 40);
    if ((v11 & 0x80) == 0)
    {
LABEL_20:
      if ((v11 & 0x1000) == 0)
        goto LABEL_21;
      goto LABEL_37;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  self->_hiddenNetsCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x1000) == 0)
  {
LABEL_21:
    if ((v11 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  self->_wepNetsCount = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x1000u;
  v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x2000) == 0)
  {
LABEL_22:
    if ((v11 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  self->_wpaNetsCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x2000u;
  v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x40) == 0)
  {
LABEL_23:
    if ((v11 & 0x200) == 0)
      return;
    goto LABEL_24;
  }
LABEL_39:
  self->_eapNetsCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 40) & 0x200) == 0)
    return;
LABEL_24:
  self->_openNonCaptiveNetsCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
}

- (BOOL)atjEnabled
{
  return self->_atjEnabled;
}

- (unsigned)atjCanceledCount
{
  return self->_atjCanceledCount;
}

- (unsigned)atjUsedCount
{
  return self->_atjUsedCount;
}

- (unsigned)adhocNetsCount
{
  return self->_adhocNetsCount;
}

- (unsigned)prefNetsCount
{
  return self->_prefNetsCount;
}

- (unsigned)captiveNetsCount
{
  return self->_captiveNetsCount;
}

- (unsigned)applePersHotspotNetsCount
{
  return self->_applePersHotspotNetsCount;
}

- (unsigned)wapiNetsCount
{
  return self->_wapiNetsCount;
}

- (unsigned)mostUsedCount
{
  return self->_mostUsedCount;
}

- (NSMutableArray)mostUsedNetworks
{
  return self->_mostUsedNetworks;
}

- (void)setMostUsedNetworks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hiddenNetsCount
{
  return self->_hiddenNetsCount;
}

- (unsigned)wepNetsCount
{
  return self->_wepNetsCount;
}

- (unsigned)wpaNetsCount
{
  return self->_wpaNetsCount;
}

- (unsigned)eapNetsCount
{
  return self->_eapNetsCount;
}

- (unsigned)openNonCaptiveNetsCount
{
  return self->_openNonCaptiveNetsCount;
}

@end
