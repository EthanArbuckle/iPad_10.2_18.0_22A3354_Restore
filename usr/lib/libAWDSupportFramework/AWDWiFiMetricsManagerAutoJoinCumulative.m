@implementation AWDWiFiMetricsManagerAutoJoinCumulative

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinCumulative;
  -[AWDWiFiMetricsManagerAutoJoinCumulative dealloc](&v3, sel_dealloc);
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

- (unint64_t)scanTypesCountsCount
{
  return self->_scanTypesCounts.count;
}

- (unsigned)scanTypesCounts
{
  return self->_scanTypesCounts.list;
}

- (void)clearScanTypesCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addScanTypesCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scanTypesCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scanTypesCounts;
  unint64_t count;

  p_scanTypesCounts = &self->_scanTypesCounts;
  count = self->_scanTypesCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_scanTypesCounts->list[a3];
}

- (void)setScanTypesCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)excludedDueToAJBlacklistCountsCount
{
  return self->_excludedDueToAJBlacklistCounts.count;
}

- (unsigned)excludedDueToAJBlacklistCounts
{
  return self->_excludedDueToAJBlacklistCounts.list;
}

- (void)clearExcludedDueToAJBlacklistCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addExcludedDueToAJBlacklistCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)excludedDueToAJBlacklistCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_excludedDueToAJBlacklistCounts;
  unint64_t count;

  p_excludedDueToAJBlacklistCounts = &self->_excludedDueToAJBlacklistCounts;
  count = self->_excludedDueToAJBlacklistCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_excludedDueToAJBlacklistCounts->list[a3];
}

- (void)setExcludedDueToAJBlacklistCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setUserChoseToAssociateToAJBlacklistedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_userChoseToAssociateToAJBlacklistedCount = a3;
}

- (void)setHasUserChoseToAssociateToAJBlacklistedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUserChoseToAssociateToAJBlacklistedCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAjScansPerformedWithLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ajScansPerformedWithLocation = a3;
}

- (void)setHasAjScansPerformedWithLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAjScansPerformedWithLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAjScansPerformedWithoutLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ajScansPerformedWithoutLocation = a3;
}

- (void)setHasAjScansPerformedWithoutLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAjScansPerformedWithoutLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount = a3;
}

- (void)setHasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRssiBitmap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rssiBitmap = a3;
}

- (void)setHasRssiBitmap:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRssiBitmap
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCcaBitmap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ccaBitmap = a3;
}

- (void)setHasCcaBitmap:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCcaBitmap
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBandScanCount24:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bandScanCount24 = a3;
}

- (void)setHasBandScanCount24:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBandScanCount24
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBandScanCount5:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_bandScanCount5 = a3;
}

- (void)setHasBandScanCount5:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBandScanCount5
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinCumulative;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerAutoJoinCumulative description](&v3, sel_description), -[AWDWiFiMetricsManagerAutoJoinCumulative dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("scanTypesCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("excludedDueToAJBlacklistCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_userChoseToAssociateToAJBlacklistedCount), CFSTR("userChoseToAssociateToAJBlacklistedCount"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ajScansPerformedWithLocation), CFSTR("ajScansPerformedWithLocation"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ajScansPerformedWithoutLocation), CFSTR("ajScansPerformedWithoutLocation"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount), CFSTR("didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssiBitmap), CFSTR("rssiBitmap"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bandScanCount24), CFSTR("bandScanCount24"));
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaBitmap), CFSTR("ccaBitmap"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 0x10) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bandScanCount5), CFSTR("bandScanCount5"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAutoJoinCumulativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_scanTypesCounts.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_scanTypesCounts.count);
  }
  if (self->_excludedDueToAJBlacklistCounts.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_excludedDueToAJBlacklistCounts.count);
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  __int16 has;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_timestamp;
    *((_WORD *)a3 + 48) |= 1u;
  }
  if (-[AWDWiFiMetricsManagerAutoJoinCumulative scanTypesCountsCount](self, "scanTypesCountsCount"))
  {
    objc_msgSend(a3, "clearScanTypesCounts");
    v5 = -[AWDWiFiMetricsManagerAutoJoinCumulative scanTypesCountsCount](self, "scanTypesCountsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addScanTypesCount:", -[AWDWiFiMetricsManagerAutoJoinCumulative scanTypesCountAtIndex:](self, "scanTypesCountAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricsManagerAutoJoinCumulative excludedDueToAJBlacklistCountsCount](self, "excludedDueToAJBlacklistCountsCount"))
  {
    objc_msgSend(a3, "clearExcludedDueToAJBlacklistCounts");
    v8 = -[AWDWiFiMetricsManagerAutoJoinCumulative excludedDueToAJBlacklistCountsCount](self, "excludedDueToAJBlacklistCountsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addExcludedDueToAJBlacklistCount:", -[AWDWiFiMetricsManagerAutoJoinCumulative excludedDueToAJBlacklistCountAtIndex:](self, "excludedDueToAJBlacklistCountAtIndex:", j));
    }
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_userChoseToAssociateToAJBlacklistedCount;
    *((_WORD *)a3 + 48) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 16) = self->_ajScansPerformedWithLocation;
  *((_WORD *)a3 + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 17) = self->_ajScansPerformedWithoutLocation;
  *((_WORD *)a3 + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 21) = self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
  *((_WORD *)a3 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 22) = self->_rssiBitmap;
  *((_WORD *)a3 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 8) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 20) = self->_ccaBitmap;
  *((_WORD *)a3 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x10) == 0)
      return;
    goto LABEL_19;
  }
LABEL_27:
  *((_DWORD *)a3 + 18) = self->_bandScanCount24;
  *((_WORD *)a3 + 48) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return;
LABEL_19:
  *((_DWORD *)a3 + 19) = self->_bandScanCount5;
  *((_WORD *)a3 + 48) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 56) = self->_timestamp;
    *(_WORD *)(v4 + 96) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_userChoseToAssociateToAJBlacklistedCount;
    *(_WORD *)(v5 + 96) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 64) = self->_ajScansPerformedWithLocation;
  *(_WORD *)(v5 + 96) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 68) = self->_ajScansPerformedWithoutLocation;
  *(_WORD *)(v5 + 96) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 84) = self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
  *(_WORD *)(v5 + 96) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 88) = self->_rssiBitmap;
  *(_WORD *)(v5 + 96) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_19:
    *(_DWORD *)(v5 + 72) = self->_bandScanCount24;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_11;
  }
LABEL_18:
  *(_DWORD *)(v5 + 80) = self->_ccaBitmap;
  *(_WORD *)(v5 + 96) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 76) = self->_bandScanCount5;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  __int16 v6;
  __int16 has;
  __int16 v8;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    v6 = *((_WORD *)a3 + 48);
    if ((*(_WORD *)&self->_has & 1) != 0)
    {
      if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 7))
        goto LABEL_48;
    }
    else if ((v6 & 1) != 0)
    {
LABEL_48:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        has = (__int16)self->_has;
        v8 = *((_WORD *)a3 + 48);
        if ((has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 48) & 0x100) == 0
            || self->_userChoseToAssociateToAJBlacklistedCount != *((_DWORD *)a3 + 23))
          {
            goto LABEL_48;
          }
        }
        else if ((*((_WORD *)a3 + 48) & 0x100) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 2) != 0)
        {
          if ((v8 & 2) == 0 || self->_ajScansPerformedWithLocation != *((_DWORD *)a3 + 16))
            goto LABEL_48;
        }
        else if ((v8 & 2) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 4) != 0)
        {
          if ((v8 & 4) == 0 || self->_ajScansPerformedWithoutLocation != *((_DWORD *)a3 + 17))
            goto LABEL_48;
        }
        else if ((v8 & 4) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x40) != 0)
        {
          if ((v8 & 0x40) == 0 || self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount != *((_DWORD *)a3 + 21))
            goto LABEL_48;
        }
        else if ((v8 & 0x40) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x80) != 0)
        {
          if ((v8 & 0x80) == 0 || self->_rssiBitmap != *((_DWORD *)a3 + 22))
            goto LABEL_48;
        }
        else if ((v8 & 0x80) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x20) != 0)
        {
          if ((v8 & 0x20) == 0 || self->_ccaBitmap != *((_DWORD *)a3 + 20))
            goto LABEL_48;
        }
        else if ((v8 & 0x20) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 8) != 0)
        {
          if ((v8 & 8) == 0 || self->_bandScanCount24 != *((_DWORD *)a3 + 18))
            goto LABEL_48;
        }
        else if ((v8 & 8) != 0)
        {
          goto LABEL_48;
        }
        LOBYTE(IsEqual) = (v8 & 0x10) == 0;
        if ((has & 0x10) != 0)
        {
          if ((v8 & 0x10) == 0 || self->_bandScanCount5 != *((_DWORD *)a3 + 19))
            goto LABEL_48;
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = PBRepeatedUInt32Hash();
  v5 = PBRepeatedUInt32Hash();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v7 = 2654435761 * self->_userChoseToAssociateToAJBlacklistedCount;
    if ((has & 2) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_ajScansPerformedWithLocation;
      if ((has & 4) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v7 = 0;
    if ((has & 2) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_ajScansPerformedWithoutLocation;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_rssiBitmap;
    if ((has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_ccaBitmap;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_19:
    v13 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_12;
LABEL_20:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_18:
  v12 = 0;
  if ((has & 8) == 0)
    goto LABEL_19;
LABEL_11:
  v13 = 2654435761 * self->_bandScanCount24;
  if ((has & 0x10) == 0)
    goto LABEL_20;
LABEL_12:
  v14 = 2654435761 * self->_bandScanCount5;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  __int16 v11;

  if ((*((_WORD *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "scanTypesCountsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricsManagerAutoJoinCumulative addScanTypesCount:](self, "addScanTypesCount:", objc_msgSend(a3, "scanTypesCountAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "excludedDueToAJBlacklistCountsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiMetricsManagerAutoJoinCumulative addExcludedDueToAJBlacklistCount:](self, "addExcludedDueToAJBlacklistCount:", objc_msgSend(a3, "excludedDueToAJBlacklistCountAtIndex:", j));
  }
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x100) != 0)
  {
    self->_userChoseToAssociateToAJBlacklistedCount = *((_DWORD *)a3 + 23);
    *(_WORD *)&self->_has |= 0x100u;
    v11 = *((_WORD *)a3 + 48);
    if ((v11 & 2) == 0)
    {
LABEL_11:
      if ((v11 & 4) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_ajScansPerformedWithLocation = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 2u;
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 4) == 0)
  {
LABEL_12:
    if ((v11 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  self->_ajScansPerformedWithoutLocation = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 4u;
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x40) == 0)
  {
LABEL_13:
    if ((v11 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x40u;
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x80) == 0)
  {
LABEL_14:
    if ((v11 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  self->_rssiBitmap = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x80u;
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x20) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_24:
  self->_ccaBitmap = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  v11 = *((_WORD *)a3 + 48);
  if ((v11 & 8) == 0)
  {
LABEL_16:
    if ((v11 & 0x10) == 0)
      return;
    goto LABEL_17;
  }
LABEL_25:
  self->_bandScanCount24 = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 48) & 0x10) == 0)
    return;
LABEL_17:
  self->_bandScanCount5 = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x10u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)userChoseToAssociateToAJBlacklistedCount
{
  return self->_userChoseToAssociateToAJBlacklistedCount;
}

- (unsigned)ajScansPerformedWithLocation
{
  return self->_ajScansPerformedWithLocation;
}

- (unsigned)ajScansPerformedWithoutLocation
{
  return self->_ajScansPerformedWithoutLocation;
}

- (unsigned)didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount
{
  return self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
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

@end
