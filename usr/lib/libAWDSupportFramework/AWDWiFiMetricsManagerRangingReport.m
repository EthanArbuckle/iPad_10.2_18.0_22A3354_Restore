@implementation AWDWiFiMetricsManagerRangingReport

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerRangingReport setRttSamples:](self, "setRttSamples:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRangingReport;
  -[AWDWiFiMetricsManagerRangingReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSelfPreferredChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_selfPreferredChannel = a3;
}

- (void)setHasSelfPreferredChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSelfPreferredChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSelfPreferredChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_selfPreferredChannelFlags = a3;
}

- (void)setHasSelfPreferredChannelFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSelfPreferredChannelFlags
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSelfMasterChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_selfMasterChannel = a3;
}

- (void)setHasSelfMasterChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSelfMasterChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPeerPreferredChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_peerPreferredChannel = a3;
}

- (void)setHasPeerPreferredChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPeerPreferredChannel
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPeerPreferredChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_peerPreferredChannelFlags = a3;
}

- (void)setHasPeerPreferredChannelFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPeerPreferredChannelFlags
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPeerMasterChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_peerMasterChannel = a3;
}

- (void)setHasPeerMasterChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPeerMasterChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRangingChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rangingChannel = a3;
}

- (void)setHasRangingChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRangingChannel
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRangingBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rangingBandwidth = a3;
}

- (void)setHasRangingBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRangingBandwidth
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setResultFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_resultFlags = a3;
}

- (void)setHasResultFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResultFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResultStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setValidCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_validCount = a3;
}

- (void)setHasValidCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasValidCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNumMeasurements:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numMeasurements = a3;
}

- (void)setHasNumMeasurements:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumMeasurements
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAwdlLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_awdlLatency = a3;
}

- (void)setHasAwdlLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAwdlLatency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRangingLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rangingLatency = a3;
}

- (void)setHasRangingLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRangingLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearRttSamples
{
  -[NSMutableArray removeAllObjects](self->_rttSamples, "removeAllObjects");
}

- (void)addRttSamples:(id)a3
{
  NSMutableArray *rttSamples;

  rttSamples = self->_rttSamples;
  if (!rttSamples)
  {
    rttSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_rttSamples = rttSamples;
  }
  -[NSMutableArray addObject:](rttSamples, "addObject:", a3);
}

- (unint64_t)rttSamplesCount
{
  return -[NSMutableArray count](self->_rttSamples, "count");
}

- (id)rttSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rttSamples, "objectAtIndex:", a3);
}

+ (Class)rttSamplesType
{
  return (Class)objc_opt_class();
}

- (void)setRangingChannelQuality:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rangingChannelQuality = a3;
}

- (void)setHasRangingChannelQuality:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRangingChannelQuality
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRangingReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerRangingReport description](&v3, sel_description), -[AWDWiFiMetricsManagerRangingReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $43FC9849F3234CB89BE835B6112B5A07 has;
  void *v5;
  NSMutableArray *rttSamples;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfPreferredChannel), CFSTR("selfPreferredChannel"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfPreferredChannelFlags), CFSTR("selfPreferredChannelFlags"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfMasterChannel), CFSTR("selfMasterChannel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerPreferredChannel), CFSTR("peerPreferredChannel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerPreferredChannelFlags), CFSTR("peerPreferredChannelFlags"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerMasterChannel), CFSTR("peerMasterChannel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_protocolVersion), CFSTR("protocolVersion"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rangingChannel), CFSTR("rangingChannel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rangingBandwidth), CFSTR("rangingBandwidth"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resultFlags), CFSTR("resultFlags"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resultStatus), CFSTR("resultStatus"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_validCount), CFSTR("validCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numMeasurements), CFSTR("numMeasurements"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_awdlLatency), CFSTR("awdlLatency"));
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rangingLatency), CFSTR("rangingLatency"));
LABEL_18:
  if (-[NSMutableArray count](self->_rttSamples, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rttSamples, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    rttSamples = self->_rttSamples;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(rttSamples);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rttSamples"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rangingChannelQuality), CFSTR("rangingChannelQuality"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerRangingReportReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $43FC9849F3234CB89BE835B6112B5A07 has;
  NSMutableArray *rttSamples;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  rttSamples = self->_rttSamples;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(rttSamples);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $43FC9849F3234CB89BE835B6112B5A07 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 22) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 19) = self->_selfPreferredChannel;
  *((_DWORD *)a3 + 22) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 20) = self->_selfPreferredChannelFlags;
  *((_DWORD *)a3 + 22) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_selfMasterChannel;
  *((_DWORD *)a3 + 22) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 7) = self->_peerPreferredChannel;
  *((_DWORD *)a3 + 22) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 8) = self->_peerPreferredChannelFlags;
  *((_DWORD *)a3 + 22) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 6) = self->_peerMasterChannel;
  *((_DWORD *)a3 + 22) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 9) = self->_protocolVersion;
  *((_DWORD *)a3 + 22) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 11) = self->_rangingChannel;
  *((_DWORD *)a3 + 22) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 10) = self->_rangingBandwidth;
  *((_DWORD *)a3 + 22) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 14) = self->_resultFlags;
  *((_DWORD *)a3 + 22) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 15) = self->_resultStatus;
  *((_DWORD *)a3 + 22) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 21) = self->_validCount;
  *((_DWORD *)a3 + 22) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
LABEL_39:
    *((_DWORD *)a3 + 4) = self->_awdlLatency;
    *((_DWORD *)a3 + 22) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_38:
  *((_DWORD *)a3 + 5) = self->_numMeasurements;
  *((_DWORD *)a3 + 22) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_39;
LABEL_16:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 13) = self->_rangingLatency;
    *((_DWORD *)a3 + 22) |= 0x400u;
  }
LABEL_18:
  if (-[AWDWiFiMetricsManagerRangingReport rttSamplesCount](self, "rttSamplesCount"))
  {
    objc_msgSend(a3, "clearRttSamples");
    v6 = -[AWDWiFiMetricsManagerRangingReport rttSamplesCount](self, "rttSamplesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addRttSamples:", -[AWDWiFiMetricsManagerRangingReport rttSamplesAtIndex:](self, "rttSamplesAtIndex:", i));
    }
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_rangingChannelQuality;
    *((_DWORD *)a3 + 22) |= 0x200u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _DWORD *v6;
  $43FC9849F3234CB89BE835B6112B5A07 has;
  NSMutableArray *rttSamples;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_DWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 88) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 76) = self->_selfPreferredChannel;
  *(_DWORD *)(v5 + 88) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 80) = self->_selfPreferredChannelFlags;
  *(_DWORD *)(v5 + 88) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 72) = self->_selfMasterChannel;
  *(_DWORD *)(v5 + 88) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 28) = self->_peerPreferredChannel;
  *(_DWORD *)(v5 + 88) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 32) = self->_peerPreferredChannelFlags;
  *(_DWORD *)(v5 + 88) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 24) = self->_peerMasterChannel;
  *(_DWORD *)(v5 + 88) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 36) = self->_protocolVersion;
  *(_DWORD *)(v5 + 88) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 44) = self->_rangingChannel;
  *(_DWORD *)(v5 + 88) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 40) = self->_rangingBandwidth;
  *(_DWORD *)(v5 + 88) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 56) = self->_resultFlags;
  *(_DWORD *)(v5 + 88) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 60) = self->_resultStatus;
  *(_DWORD *)(v5 + 88) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 84) = self->_validCount;
  *(_DWORD *)(v5 + 88) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 20) = self->_numMeasurements;
  *(_DWORD *)(v5 + 88) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_42:
  *(_DWORD *)(v5 + 16) = self->_awdlLatency;
  *(_DWORD *)(v5 + 88) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 52) = self->_rangingLatency;
    *(_DWORD *)(v5 + 88) |= 0x400u;
  }
LABEL_18:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  rttSamples = self->_rttSamples;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(rttSamples);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addRttSamples:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rttSamples, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    v6[12] = self->_rangingChannelQuality;
    v6[22] |= 0x200u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $43FC9849F3234CB89BE835B6112B5A07 has;
  int v7;
  NSMutableArray *rttSamples;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 22);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_89;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_89:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_selfPreferredChannel != *((_DWORD *)a3 + 19))
        goto LABEL_89;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_selfPreferredChannelFlags != *((_DWORD *)a3 + 20))
        goto LABEL_89;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_selfMasterChannel != *((_DWORD *)a3 + 18))
        goto LABEL_89;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_peerPreferredChannel != *((_DWORD *)a3 + 7))
        goto LABEL_89;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_peerPreferredChannelFlags != *((_DWORD *)a3 + 8))
        goto LABEL_89;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_peerMasterChannel != *((_DWORD *)a3 + 6))
        goto LABEL_89;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_protocolVersion != *((_DWORD *)a3 + 9))
        goto LABEL_89;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_rangingChannel != *((_DWORD *)a3 + 11))
        goto LABEL_89;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rangingBandwidth != *((_DWORD *)a3 + 10))
        goto LABEL_89;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_resultFlags != *((_DWORD *)a3 + 14))
        goto LABEL_89;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_resultStatus != *((_DWORD *)a3 + 15))
        goto LABEL_89;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_validCount != *((_DWORD *)a3 + 21))
        goto LABEL_89;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_numMeasurements != *((_DWORD *)a3 + 5))
        goto LABEL_89;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_awdlLatency != *((_DWORD *)a3 + 4))
        goto LABEL_89;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_rangingLatency != *((_DWORD *)a3 + 13))
        goto LABEL_89;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_89;
    }
    rttSamples = self->_rttSamples;
    if ((unint64_t)rttSamples | *((_QWORD *)a3 + 8))
    {
      v5 = -[NSMutableArray isEqual:](rttSamples, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 22);
    LOBYTE(v5) = (v9 & 0x200) == 0;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_rangingChannelQuality != *((_DWORD *)a3 + 12))
        goto LABEL_89;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $43FC9849F3234CB89BE835B6112B5A07 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v22 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      v21 = 2654435761 * self->_selfPreferredChannel;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v22 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_3;
  }
  v21 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v20 = 2654435761 * self->_selfPreferredChannelFlags;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v20 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_5:
    v19 = 2654435761 * self->_selfMasterChannel;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v18 = 2654435761 * self->_peerPreferredChannel;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v17 = 2654435761 * self->_peerPreferredChannelFlags;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v17 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_8:
    v16 = 2654435761 * self->_peerMasterChannel;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_9:
    v15 = 2654435761 * self->_protocolVersion;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v15 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v4 = 2654435761 * self->_rangingChannel;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_11:
    v5 = 2654435761 * self->_rangingBandwidth;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v5 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    v6 = 2654435761 * self->_resultFlags;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_13:
    v7 = 2654435761 * self->_resultStatus;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_14:
    v8 = 2654435761 * self->_validCount;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v8 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_15:
    v9 = 2654435761 * self->_numMeasurements;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_16;
LABEL_32:
    v10 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_31:
  v9 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_32;
LABEL_16:
  v10 = 2654435761 * self->_awdlLatency;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    v11 = 2654435761 * self->_rangingLatency;
    goto LABEL_34;
  }
LABEL_33:
  v11 = 0;
LABEL_34:
  v12 = -[NSMutableArray hash](self->_rttSamples, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    v13 = 2654435761 * self->_rangingChannelQuality;
  else
    v13 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)a3 + 22);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_selfPreferredChannel = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_selfPreferredChannelFlags = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x2000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_selfMasterChannel = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_peerPreferredChannel = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_peerPreferredChannelFlags = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  self->_peerMasterChannel = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  self->_protocolVersion = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  self->_rangingChannel = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  self->_rangingBandwidth = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  self->_resultFlags = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  self->_resultStatus = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  self->_validCount = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  self->_numMeasurements = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_42:
  self->_awdlLatency = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 22) & 0x400) != 0)
  {
LABEL_17:
    self->_rangingLatency = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_18:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AWDWiFiMetricsManagerRangingReport addRttSamples:](self, "addRttSamples:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if ((*((_BYTE *)a3 + 89) & 2) != 0)
  {
    self->_rangingChannelQuality = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x200u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)selfPreferredChannel
{
  return self->_selfPreferredChannel;
}

- (unsigned)selfPreferredChannelFlags
{
  return self->_selfPreferredChannelFlags;
}

- (unsigned)selfMasterChannel
{
  return self->_selfMasterChannel;
}

- (unsigned)peerPreferredChannel
{
  return self->_peerPreferredChannel;
}

- (unsigned)peerPreferredChannelFlags
{
  return self->_peerPreferredChannelFlags;
}

- (unsigned)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (unsigned)rangingChannel
{
  return self->_rangingChannel;
}

- (unsigned)rangingBandwidth
{
  return self->_rangingBandwidth;
}

- (unsigned)resultFlags
{
  return self->_resultFlags;
}

- (unsigned)resultStatus
{
  return self->_resultStatus;
}

- (unsigned)validCount
{
  return self->_validCount;
}

- (unsigned)numMeasurements
{
  return self->_numMeasurements;
}

- (unsigned)awdlLatency
{
  return self->_awdlLatency;
}

- (unsigned)rangingLatency
{
  return self->_rangingLatency;
}

- (NSMutableArray)rttSamples
{
  return self->_rttSamples;
}

- (void)setRttSamples:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unsigned)rangingChannelQuality
{
  return self->_rangingChannelQuality;
}

@end
