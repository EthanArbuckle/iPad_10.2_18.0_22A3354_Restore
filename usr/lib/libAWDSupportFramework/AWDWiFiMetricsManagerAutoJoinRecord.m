@implementation AWDWiFiMetricsManagerAutoJoinRecord

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  -[AWDWiFiMetricsManagerAutoJoinRecord setNetworksExcludedFromAJDueToThresholds:](self, "setNetworksExcludedFromAJDueToThresholds:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinRecord;
  -[AWDWiFiMetricsManagerAutoJoinRecord dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBeganTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_beganTimestamp = a3;
}

- (void)setHasBeganTimestamp:(BOOL)a3
{
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBeganTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setEndedTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_endedTimestamp = a3;
}

- (void)setHasEndedTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasEndedTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWakeTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_wakeTimestamp = a3;
}

- (void)setHasWakeTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasWakeTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEnteredKnownNetworkGeotagLocationTimeStamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_enteredKnownNetworkGeotagLocationTimeStamp = a3;
}

- (void)setHasEnteredKnownNetworkGeotagLocationTimeStamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasEnteredKnownNetworkGeotagLocationTimeStamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRetryIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_retryIndex = a3;
}

- (void)setHasRetryIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRetryIndex
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (unint64_t)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount
{
  return self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count;
}

- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCounts
{
  return self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.list;
}

- (void)clearScannedNetworksExcludedFromAJDueToBlacklistReasonCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts;
  unint64_t count;

  p_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts = &self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts;
  count = self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts->list[a3];
}

- (void)setScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setScanTypes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_scanTypes = a3;
}

- (void)setHasScanTypes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasScanTypes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setLastScanType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lastScanType = a3;
}

- (void)setHasLastScanType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLastScanType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResetTypes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_resetTypes = a3;
}

- (void)setHasResetTypes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasResetTypes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setResetReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_resetReason = a3;
}

- (void)setHasResetReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasResetReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setScanResultFound:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_scanResultFound = a3;
}

- (void)setHasScanResultFound:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasScanResultFound
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setKnownNetworksFoundInScans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_knownNetworksFoundInScans = a3;
}

- (void)setHasKnownNetworksFoundInScans:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKnownNetworksFoundInScans
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLastScanError:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lastScanError = a3;
}

- (void)setHasLastScanError:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLastScanError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRssiBitmap:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rssiBitmap = a3;
}

- (void)setHasRssiBitmap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRssiBitmap
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCcaBitmap:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ccaBitmap = a3;
}

- (void)setHasCcaBitmap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCcaBitmap
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setBandScanCount24:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_bandScanCount24 = a3;
}

- (void)setHasBandScanCount24:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBandScanCount24
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setBandScanCount5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_bandScanCount5 = a3;
}

- (void)setHasBandScanCount5:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBandScanCount5
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNwExclusionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nwExclusionCount = a3;
}

- (void)setHasNwExclusionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNwExclusionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)clearNetworksExcludedFromAJDueToThresholds
{
  -[NSMutableArray removeAllObjects](self->_networksExcludedFromAJDueToThresholds, "removeAllObjects");
}

- (void)addNetworksExcludedFromAJDueToThresholds:(id)a3
{
  NSMutableArray *networksExcludedFromAJDueToThresholds;

  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  if (!networksExcludedFromAJDueToThresholds)
  {
    networksExcludedFromAJDueToThresholds = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_networksExcludedFromAJDueToThresholds = networksExcludedFromAJDueToThresholds;
  }
  -[NSMutableArray addObject:](networksExcludedFromAJDueToThresholds, "addObject:", a3);
}

- (unint64_t)networksExcludedFromAJDueToThresholdsCount
{
  return -[NSMutableArray count](self->_networksExcludedFromAJDueToThresholds, "count");
}

- (id)networksExcludedFromAJDueToThresholdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networksExcludedFromAJDueToThresholds, "objectAtIndex:", a3);
}

+ (Class)networksExcludedFromAJDueToThresholdsType
{
  return (Class)objc_opt_class();
}

- (void)setBandExclusionReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_bandExclusionReason = a3;
}

- (void)setHasBandExclusionReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBandExclusionReason
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerAutoJoinRecord description](&v3, sel_description), -[AWDWiFiMetricsManagerAutoJoinRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  $F9739C39B86B3C7E49387613BF7BBB27 v5;
  void *v6;
  NSMutableArray *networksExcludedFromAJDueToThresholds;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beganTimestamp), CFSTR("beganTimestamp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endedTimestamp), CFSTR("endedTimestamp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wakeTimestamp), CFSTR("wakeTimestamp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_enteredKnownNetworkGeotagLocationTimeStamp), CFSTR("enteredKnownNetworkGeotagLocationTimeStamp"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state), CFSTR("state"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryIndex), CFSTR("retryIndex"));
LABEL_9:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("scannedNetworksExcludedFromAJDueToBlacklistReasonCounts"));
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanTypes), CFSTR("scanTypes"));
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v5 & 0x4000) == 0)
        goto LABEL_12;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastScanType), CFSTR("lastScanType"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resetTypes), CFSTR("resetTypes"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resetReason), CFSTR("resetReason"));
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanResultFound), CFSTR("scanResultFound"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_knownNetworksFoundInScans), CFSTR("knownNetworksFoundInScans"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastScanError), CFSTR("lastScanError"));
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssiBitmap), CFSTR("rssiBitmap"));
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v5 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaBitmap), CFSTR("ccaBitmap"));
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v5 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bandScanCount24), CFSTR("bandScanCount24"));
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bandScanCount5), CFSTR("bandScanCount5"));
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nwExclusionCount), CFSTR("nwExclusionCount"));
LABEL_22:
  if (-[NSMutableArray count](self->_networksExcludedFromAJDueToThresholds, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_networksExcludedFromAJDueToThresholds, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("networksExcludedFromAJDueToThresholds"));

  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bandExclusionReason), CFSTR("bandExclusionReason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAutoJoinRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  unint64_t v5;
  $F9739C39B86B3C7E49387613BF7BBB27 v6;
  NSMutableArray *networksExcludedFromAJDueToThresholds;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count);
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v6 & 0x4000) == 0)
        goto LABEL_15;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $F9739C39B86B3C7E49387613BF7BBB27 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_DWORD *)a3 + 36) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_beganTimestamp;
  *((_DWORD *)a3 + 36) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 5) = self->_endedTimestamp;
  *((_DWORD *)a3 + 36) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 8) = self->_wakeTimestamp;
  *((_DWORD *)a3 + 36) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_7;
LABEL_38:
    *((_DWORD *)a3 + 35) = self->_state;
    *((_DWORD *)a3 + 36) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_37:
  *((_QWORD *)a3 + 6) = self->_enteredKnownNetworkGeotagLocationTimeStamp;
  *((_DWORD *)a3 + 36) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_38;
LABEL_7:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 31) = self->_retryIndex;
    *((_DWORD *)a3 + 36) |= 0x8000u;
  }
LABEL_9:
  if (-[AWDWiFiMetricsManagerAutoJoinRecord scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount](self, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount"))
  {
    objc_msgSend(a3, "clearScannedNetworksExcludedFromAJDueToBlacklistReasonCounts");
    v6 = -[AWDWiFiMetricsManagerAutoJoinRecord scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount](self, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:", -[AWDWiFiMetricsManagerAutoJoinRecord scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:](self, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:", i));
    }
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_scanTypes;
    *((_DWORD *)a3 + 36) |= 0x40000u;
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v9 & 0x4000) == 0)
        goto LABEL_16;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 24) = self->_lastScanType;
  *((_DWORD *)a3 + 36) |= 0x800u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 30) = self->_resetTypes;
  *((_DWORD *)a3 + 36) |= 0x4000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 29) = self->_resetReason;
  *((_DWORD *)a3 + 36) |= 0x2000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v9 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 33) = self->_scanResultFound;
  *((_DWORD *)a3 + 36) |= 0x20000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 22) = self->_knownNetworksFoundInScans;
  *((_DWORD *)a3 + 36) |= 0x200u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 23) = self->_lastScanError;
  *((_DWORD *)a3 + 36) |= 0x400u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 32) = self->_rssiBitmap;
  *((_DWORD *)a3 + 36) |= 0x10000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v9 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 21) = self->_ccaBitmap;
  *((_DWORD *)a3 + 36) |= 0x100u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v9 & 0x80) == 0)
      goto LABEL_24;
LABEL_50:
    *((_DWORD *)a3 + 20) = self->_bandScanCount5;
    *((_DWORD *)a3 + 36) |= 0x80u;
    if ((*(_DWORD *)&self->_has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_49:
  *((_DWORD *)a3 + 19) = self->_bandScanCount24;
  *((_DWORD *)a3 + 36) |= 0x40u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
    goto LABEL_50;
LABEL_24:
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
LABEL_25:
    *((_DWORD *)a3 + 28) = self->_nwExclusionCount;
    *((_DWORD *)a3 + 36) |= 0x1000u;
  }
LABEL_26:
  if (-[AWDWiFiMetricsManagerAutoJoinRecord networksExcludedFromAJDueToThresholdsCount](self, "networksExcludedFromAJDueToThresholdsCount"))
  {
    objc_msgSend(a3, "clearNetworksExcludedFromAJDueToThresholds");
    v10 = -[AWDWiFiMetricsManagerAutoJoinRecord networksExcludedFromAJDueToThresholdsCount](self, "networksExcludedFromAJDueToThresholdsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addNetworksExcludedFromAJDueToThresholds:", -[AWDWiFiMetricsManagerAutoJoinRecord networksExcludedFromAJDueToThresholdsAtIndex:](self, "networksExcludedFromAJDueToThresholdsAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_bandExclusionReason;
    *((_DWORD *)a3 + 36) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _DWORD *v6;
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  $F9739C39B86B3C7E49387613BF7BBB27 v8;
  NSMutableArray *networksExcludedFromAJDueToThresholds;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_DWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_timestamp;
    *(_DWORD *)(v5 + 144) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 32) = self->_beganTimestamp;
  *(_DWORD *)(v5 + 144) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *(_QWORD *)(v5 + 40) = self->_endedTimestamp;
  *(_DWORD *)(v5 + 144) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *(_QWORD *)(v5 + 64) = self->_wakeTimestamp;
  *(_DWORD *)(v5 + 144) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *(_QWORD *)(v5 + 48) = self->_enteredKnownNetworkGeotagLocationTimeStamp;
  *(_DWORD *)(v5 + 144) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_37:
  *(_DWORD *)(v5 + 140) = self->_state;
  *(_DWORD *)(v5 + 144) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 124) = self->_retryIndex;
    *(_DWORD *)(v5 + 144) |= 0x8000u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    v6[34] = self->_scanTypes;
    v6[36] |= 0x40000u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v8 & 0x4000) == 0)
        goto LABEL_12;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_11;
  }
  v6[24] = self->_lastScanType;
  v6[36] |= 0x800u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  v6[30] = self->_resetTypes;
  v6[36] |= 0x4000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  v6[29] = self->_resetReason;
  v6[36] |= 0x2000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  v6[33] = self->_scanResultFound;
  v6[36] |= 0x20000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  v6[22] = self->_knownNetworksFoundInScans;
  v6[36] |= 0x200u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  v6[23] = self->_lastScanError;
  v6[36] |= 0x400u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  v6[32] = self->_rssiBitmap;
  v6[36] |= 0x10000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  v6[21] = self->_ccaBitmap;
  v6[36] |= 0x100u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  v6[19] = self->_bandScanCount24;
  v6[36] |= 0x40u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_49:
  v6[20] = self->_bandScanCount5;
  v6[36] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_21:
    v6[28] = self->_nwExclusionCount;
    v6[36] |= 0x1000u;
  }
LABEL_22:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addNetworksExcludedFromAJDueToThresholds:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networksExcludedFromAJDueToThresholds, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v6[18] = self->_bandExclusionReason;
    v6[36] |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  int v7;
  $F9739C39B86B3C7E49387613BF7BBB27 v8;
  int v9;
  NSMutableArray *networksExcludedFromAJDueToThresholds;
  int v11;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 36);
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
        goto LABEL_105;
    }
    else if ((v7 & 8) != 0)
    {
LABEL_105:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_beganTimestamp != *((_QWORD *)a3 + 4))
        goto LABEL_105;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_endedTimestamp != *((_QWORD *)a3 + 5))
        goto LABEL_105;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_wakeTimestamp != *((_QWORD *)a3 + 8))
        goto LABEL_105;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_enteredKnownNetworkGeotagLocationTimeStamp != *((_QWORD *)a3 + 6))
        goto LABEL_105;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_state != *((_DWORD *)a3 + 35))
        goto LABEL_105;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_retryIndex != *((_DWORD *)a3 + 31))
        goto LABEL_105;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_105;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      v8 = self->_has;
      v9 = *((_DWORD *)a3 + 36);
      if ((*(_DWORD *)&v8 & 0x40000) != 0)
      {
        if ((v9 & 0x40000) == 0 || self->_scanTypes != *((_DWORD *)a3 + 34))
          goto LABEL_105;
      }
      else if ((v9 & 0x40000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x800) != 0)
      {
        if ((v9 & 0x800) == 0 || self->_lastScanType != *((_DWORD *)a3 + 24))
          goto LABEL_105;
      }
      else if ((v9 & 0x800) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x4000) != 0)
      {
        if ((v9 & 0x4000) == 0 || self->_resetTypes != *((_DWORD *)a3 + 30))
          goto LABEL_105;
      }
      else if ((v9 & 0x4000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x2000) != 0)
      {
        if ((v9 & 0x2000) == 0 || self->_resetReason != *((_DWORD *)a3 + 29))
          goto LABEL_105;
      }
      else if ((v9 & 0x2000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_DWORD *)&v8 & 0x20000) != 0)
      {
        if ((v9 & 0x20000) == 0 || self->_scanResultFound != *((_DWORD *)a3 + 33))
          goto LABEL_105;
      }
      else if ((v9 & 0x20000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x200) != 0)
      {
        if ((v9 & 0x200) == 0 || self->_knownNetworksFoundInScans != *((_DWORD *)a3 + 22))
          goto LABEL_105;
      }
      else if ((v9 & 0x200) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x400) != 0)
      {
        if ((v9 & 0x400) == 0 || self->_lastScanError != *((_DWORD *)a3 + 23))
          goto LABEL_105;
      }
      else if ((v9 & 0x400) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_DWORD *)&v8 & 0x10000) != 0)
      {
        if ((v9 & 0x10000) == 0 || self->_rssiBitmap != *((_DWORD *)a3 + 32))
          goto LABEL_105;
      }
      else if ((v9 & 0x10000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x100) != 0)
      {
        if ((v9 & 0x100) == 0 || self->_ccaBitmap != *((_DWORD *)a3 + 21))
          goto LABEL_105;
      }
      else if ((v9 & 0x100) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_BYTE *)&v8 & 0x40) != 0)
      {
        if ((v9 & 0x40) == 0 || self->_bandScanCount24 != *((_DWORD *)a3 + 19))
          goto LABEL_105;
      }
      else if ((v9 & 0x40) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_BYTE *)&v8 & 0x80) != 0)
      {
        if ((v9 & 0x80) == 0 || self->_bandScanCount5 != *((_DWORD *)a3 + 20))
          goto LABEL_105;
      }
      else if ((v9 & 0x80) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x1000) != 0)
      {
        if ((v9 & 0x1000) == 0 || self->_nwExclusionCount != *((_DWORD *)a3 + 28))
          goto LABEL_105;
      }
      else if ((v9 & 0x1000) != 0)
      {
        goto LABEL_105;
      }
      networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
      if ((unint64_t)networksExcludedFromAJDueToThresholds | *((_QWORD *)a3 + 13))
      {
        IsEqual = -[NSMutableArray isEqual:](networksExcludedFromAJDueToThresholds, "isEqual:");
        if (!IsEqual)
          return IsEqual;
        v8 = self->_has;
      }
      v11 = *((_DWORD *)a3 + 36);
      LOBYTE(IsEqual) = (v11 & 0x20) == 0;
      if ((*(_BYTE *)&v8 & 0x20) != 0)
      {
        if ((v11 & 0x20) == 0 || self->_bandExclusionReason != *((_DWORD *)a3 + 18))
          goto LABEL_105;
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $F9739C39B86B3C7E49387613BF7BBB27 has;
  $F9739C39B86B3C7E49387613BF7BBB27 v4;
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
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v27 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 1) != 0)
    {
LABEL_3:
      v26 = 2654435761u * self->_beganTimestamp;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v27 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_3;
  }
  v26 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v25 = 2654435761u * self->_endedTimestamp;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v25 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v24 = 2654435761u * self->_wakeTimestamp;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v24 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_6:
    v23 = 2654435761u * self->_enteredKnownNetworkGeotagLocationTimeStamp;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_7;
LABEL_14:
    v22 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_14;
LABEL_7:
  v22 = 2654435761 * self->_state;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    v21 = 2654435761 * self->_retryIndex;
    goto LABEL_16;
  }
LABEL_15:
  v21 = 0;
LABEL_16:
  v20 = PBRepeatedUInt32Hash();
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
    v19 = 2654435761 * self->_scanTypes;
    if ((*(_WORD *)&v4 & 0x800) != 0)
    {
LABEL_18:
      v18 = 2654435761 * self->_lastScanType;
      if ((*(_WORD *)&v4 & 0x4000) != 0)
        goto LABEL_19;
      goto LABEL_31;
    }
  }
  else
  {
    v19 = 0;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_18;
  }
  v18 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_19:
    v17 = 2654435761 * self->_resetTypes;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_20;
    goto LABEL_32;
  }
LABEL_31:
  v17 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_20:
    v16 = 2654435761 * self->_resetReason;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_21;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_21:
    v15 = 2654435761 * self->_scanResultFound;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_22;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_22:
    v5 = 2654435761 * self->_knownNetworksFoundInScans;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_23;
    goto LABEL_35;
  }
LABEL_34:
  v5 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_23:
    v6 = 2654435761 * self->_lastScanError;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_24;
    goto LABEL_36;
  }
LABEL_35:
  v6 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_24:
    v7 = 2654435761 * self->_rssiBitmap;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  v7 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_25:
    v8 = 2654435761 * self->_ccaBitmap;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  v8 = 0;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_26:
    v9 = 2654435761 * self->_bandScanCount24;
    if ((*(_BYTE *)&v4 & 0x80) != 0)
      goto LABEL_27;
LABEL_39:
    v10 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_38:
  v9 = 0;
  if ((*(_BYTE *)&v4 & 0x80) == 0)
    goto LABEL_39;
LABEL_27:
  v10 = 2654435761 * self->_bandScanCount5;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_28:
    v11 = 2654435761 * self->_nwExclusionCount;
    goto LABEL_41;
  }
LABEL_40:
  v11 = 0;
LABEL_41:
  v12 = -[NSMutableArray hash](self->_networksExcludedFromAJDueToThresholds, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v13 = 2654435761 * self->_bandExclusionReason;
  else
    v13 = 0;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v20 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_DWORD *)&self->_has |= 8u;
    v5 = *((_DWORD *)a3 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_beganTimestamp = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  self->_endedTimestamp = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  self->_wakeTimestamp = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  self->_enteredKnownNetworkGeotagLocationTimeStamp = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 0x80000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_40:
  self->_state = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 36) & 0x8000) != 0)
  {
LABEL_8:
    self->_retryIndex = *((_DWORD *)a3 + 31);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_9:
  v6 = objc_msgSend(a3, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerAutoJoinRecord addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:](self, "addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:", objc_msgSend(a3, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:", i));
  }
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x40000) != 0)
  {
    self->_scanTypes = *((_DWORD *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x40000u;
    v9 = *((_DWORD *)a3 + 36);
    if ((v9 & 0x800) == 0)
    {
LABEL_14:
      if ((v9 & 0x4000) == 0)
        goto LABEL_15;
      goto LABEL_44;
    }
  }
  else if ((v9 & 0x800) == 0)
  {
    goto LABEL_14;
  }
  self->_lastScanType = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x4000) == 0)
  {
LABEL_15:
    if ((v9 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_resetTypes = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x4000u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x2000) == 0)
  {
LABEL_16:
    if ((v9 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_resetReason = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x2000u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x20000) == 0)
  {
LABEL_17:
    if ((v9 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  self->_scanResultFound = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x20000u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x200) == 0)
  {
LABEL_18:
    if ((v9 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  self->_knownNetworksFoundInScans = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x400) == 0)
  {
LABEL_19:
    if ((v9 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  self->_lastScanError = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((v9 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  self->_rssiBitmap = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x10000u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x100) == 0)
  {
LABEL_21:
    if ((v9 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  self->_ccaBitmap = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x40) == 0)
  {
LABEL_22:
    if ((v9 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  self->_bandScanCount24 = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40u;
  v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x80) == 0)
  {
LABEL_23:
    if ((v9 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_52:
  self->_bandScanCount5 = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 36) & 0x1000) != 0)
  {
LABEL_24:
    self->_nwExclusionCount = *((_DWORD *)a3 + 28);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_25:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 13);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[AWDWiFiMetricsManagerAutoJoinRecord addNetworksExcludedFromAJDueToThresholds:](self, "addNetworksExcludedFromAJDueToThresholds:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
  if ((*((_BYTE *)a3 + 144) & 0x20) != 0)
  {
    self->_bandExclusionReason = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)beganTimestamp
{
  return self->_beganTimestamp;
}

- (unint64_t)endedTimestamp
{
  return self->_endedTimestamp;
}

- (unint64_t)wakeTimestamp
{
  return self->_wakeTimestamp;
}

- (unint64_t)enteredKnownNetworkGeotagLocationTimeStamp
{
  return self->_enteredKnownNetworkGeotagLocationTimeStamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)retryIndex
{
  return self->_retryIndex;
}

- (unsigned)scanTypes
{
  return self->_scanTypes;
}

- (unsigned)lastScanType
{
  return self->_lastScanType;
}

- (unsigned)resetTypes
{
  return self->_resetTypes;
}

- (unsigned)resetReason
{
  return self->_resetReason;
}

- (unsigned)scanResultFound
{
  return self->_scanResultFound;
}

- (unsigned)knownNetworksFoundInScans
{
  return self->_knownNetworksFoundInScans;
}

- (unsigned)lastScanError
{
  return self->_lastScanError;
}

- (unsigned)rssiBitmap
{
  return self->_rssiBitmap;
}

- (unsigned)ccaBitmap
{
  return self->_ccaBitmap;
}

- (unsigned)bandScanCount24
{
  return self->_bandScanCount24;
}

- (unsigned)bandScanCount5
{
  return self->_bandScanCount5;
}

- (unsigned)nwExclusionCount
{
  return self->_nwExclusionCount;
}

- (NSMutableArray)networksExcludedFromAJDueToThresholds
{
  return self->_networksExcludedFromAJDueToThresholds;
}

- (void)setNetworksExcludedFromAJDueToThresholds:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (unsigned)bandExclusionReason
{
  return self->_bandExclusionReason;
}

@end
