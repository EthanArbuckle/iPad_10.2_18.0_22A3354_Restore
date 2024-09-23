@implementation AWDScanStatsPerSlice

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  -[AWDScanStatsPerSlice setScanObjects:](self, "setScanObjects:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDScanStatsPerSlice;
  -[AWDScanStatsPerSlice dealloc](&v3, sel_dealloc);
}

- (void)setNumAbort:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numAbort = a3;
}

- (void)setHasNumAbort:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumAbort
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumScanWifiCritical:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numScanWifiCritical = a3;
}

- (void)setHasNumScanWifiCritical:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumScanWifiCritical
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAvgAgeScan:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_avgAgeScan = a3;
}

- (void)setHasAvgAgeScan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvgAgeScan
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)numChanScannedsCount
{
  return self->_numChanScanneds.count;
}

- (unsigned)numChanScanneds
{
  return self->_numChanScanneds.list;
}

- (void)clearNumChanScanneds
{
  PBRepeatedUInt32Clear();
}

- (void)addNumChanScanned:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numChanScannedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numChanScanneds;
  unint64_t count;

  p_numChanScanneds = &self->_numChanScanneds;
  count = self->_numChanScanneds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numChanScanneds->list[a3];
}

- (void)setNumChanScanneds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)numScanModesCount
{
  return self->_numScanModes.count;
}

- (unsigned)numScanModes
{
  return self->_numScanModes.list;
}

- (void)clearNumScanModes
{
  PBRepeatedUInt32Clear();
}

- (void)addNumScanMode:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numScanModeAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numScanModes;
  unint64_t count;

  p_numScanModes = &self->_numScanModes;
  count = self->_numScanModes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numScanModes->list[a3];
}

- (void)setNumScanModes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)numScanBlankedsCount
{
  return self->_numScanBlankeds.count;
}

- (unsigned)numScanBlankeds
{
  return self->_numScanBlankeds.list;
}

- (void)clearNumScanBlankeds
{
  PBRepeatedUInt32Clear();
}

- (void)addNumScanBlanked:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numScanBlankedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numScanBlankeds;
  unint64_t count;

  p_numScanBlankeds = &self->_numScanBlankeds;
  count = self->_numScanBlankeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numScanBlankeds->list[a3];
}

- (void)setNumScanBlankeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearScanObjects
{
  -[NSMutableArray removeAllObjects](self->_scanObjects, "removeAllObjects");
}

- (void)addScanObject:(id)a3
{
  NSMutableArray *scanObjects;

  scanObjects = self->_scanObjects;
  if (!scanObjects)
  {
    scanObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_scanObjects = scanObjects;
  }
  -[NSMutableArray addObject:](scanObjects, "addObject:", a3);
}

- (unint64_t)scanObjectsCount
{
  return -[NSMutableArray count](self->_scanObjects, "count");
}

- (id)scanObjectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_scanObjects, "objectAtIndex:", a3);
}

+ (Class)scanObjectType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDScanStatsPerSlice;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDScanStatsPerSlice description](&v3, sel_description), -[AWDScanStatsPerSlice dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *scanObjects;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numAbort), CFSTR("num_abort"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numScanWifiCritical), CFSTR("num_scan_wifi_critical"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgAgeScan), CFSTR("avg_age_scan"));
LABEL_5:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("num_chan_scanned"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("num_scan_mode"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("num_scan_blanked"));
  if (-[NSMutableArray count](self->_scanObjects, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_scanObjects, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    scanObjects = self->_scanObjects;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(scanObjects);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scan_object"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDScanStatsPerSliceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *scanObjects;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_numChanScanneds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_numChanScanneds.count);
  }
  if (self->_numScanModes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_numScanModes.count);
  }
  if (self->_numScanBlankeds.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_numScanBlankeds.count);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  scanObjects = self->_scanObjects;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(scanObjects);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_23:
    *((_DWORD *)a3 + 23) = self->_numScanWifiCritical;
    *((_BYTE *)a3 + 104) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 10) = self->_numAbort;
  *((_BYTE *)a3 + 104) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 22) = self->_avgAgeScan;
    *((_BYTE *)a3 + 104) |= 2u;
  }
LABEL_5:
  if (-[AWDScanStatsPerSlice numChanScannedsCount](self, "numChanScannedsCount"))
  {
    objc_msgSend(a3, "clearNumChanScanneds");
    v6 = -[AWDScanStatsPerSlice numChanScannedsCount](self, "numChanScannedsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addNumChanScanned:", -[AWDScanStatsPerSlice numChanScannedAtIndex:](self, "numChanScannedAtIndex:", i));
    }
  }
  if (-[AWDScanStatsPerSlice numScanModesCount](self, "numScanModesCount"))
  {
    objc_msgSend(a3, "clearNumScanModes");
    v9 = -[AWDScanStatsPerSlice numScanModesCount](self, "numScanModesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addNumScanMode:", -[AWDScanStatsPerSlice numScanModeAtIndex:](self, "numScanModeAtIndex:", j));
    }
  }
  if (-[AWDScanStatsPerSlice numScanBlankedsCount](self, "numScanBlankedsCount"))
  {
    objc_msgSend(a3, "clearNumScanBlankeds");
    v12 = -[AWDScanStatsPerSlice numScanBlankedsCount](self, "numScanBlankedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addNumScanBlanked:", -[AWDScanStatsPerSlice numScanBlankedAtIndex:](self, "numScanBlankedAtIndex:", k));
    }
  }
  if (-[AWDScanStatsPerSlice scanObjectsCount](self, "scanObjectsCount"))
  {
    objc_msgSend(a3, "clearScanObjects");
    v15 = -[AWDScanStatsPerSlice scanObjectsCount](self, "scanObjectsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addScanObject:", -[AWDScanStatsPerSlice scanObjectAtIndex:](self, "scanObjectAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *scanObjects;
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
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_numAbort;
    *(_BYTE *)(v5 + 104) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 92) = self->_numScanWifiCritical;
  *(_BYTE *)(v5 + 104) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 88) = self->_avgAgeScan;
    *(_BYTE *)(v5 + 104) |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  scanObjects = self->_scanObjects;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(scanObjects);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addScanObject:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scanObjects, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSMutableArray *scanObjects;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 104) & 1) == 0 || self->_numAbort != *((_QWORD *)a3 + 10))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 104) & 1) != 0)
    {
LABEL_22:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 104) & 4) == 0 || self->_numScanWifiCritical != *((_DWORD *)a3 + 23))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 104) & 4) != 0)
    {
      goto LABEL_22;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 104) & 2) == 0 || self->_avgAgeScan != *((_DWORD *)a3 + 22))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 104) & 2) != 0)
    {
      goto LABEL_22;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          scanObjects = self->_scanObjects;
          if ((unint64_t)scanObjects | *((_QWORD *)a3 + 12))
            LOBYTE(IsEqual) = -[NSMutableArray isEqual:](scanObjects, "isEqual:");
          else
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761u * self->_numAbort;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_numScanWifiCritical;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_avgAgeScan;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  v8 = v6 ^ v7 ^ PBRepeatedUInt32Hash();
  return v8 ^ -[NSMutableArray hash](self->_scanObjects, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 104);
  if ((v5 & 1) != 0)
  {
    self->_numAbort = *((_QWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 104) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numScanWifiCritical = *((_DWORD *)a3 + 23);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 104) & 2) != 0)
  {
LABEL_4:
    self->_avgAgeScan = *((_DWORD *)a3 + 22);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v6 = objc_msgSend(a3, "numChanScannedsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDScanStatsPerSlice addNumChanScanned:](self, "addNumChanScanned:", objc_msgSend(a3, "numChanScannedAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "numScanModesCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDScanStatsPerSlice addNumScanMode:](self, "addNumScanMode:", objc_msgSend(a3, "numScanModeAtIndex:", j));
  }
  v12 = objc_msgSend(a3, "numScanBlankedsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[AWDScanStatsPerSlice addNumScanBlanked:](self, "addNumScanBlanked:", objc_msgSend(a3, "numScanBlankedAtIndex:", k));
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 12);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (m = 0; m != v17; ++m)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[AWDScanStatsPerSlice addScanObject:](self, "addScanObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * m));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }
}

- (unint64_t)numAbort
{
  return self->_numAbort;
}

- (unsigned)numScanWifiCritical
{
  return self->_numScanWifiCritical;
}

- (unsigned)avgAgeScan
{
  return self->_avgAgeScan;
}

- (NSMutableArray)scanObjects
{
  return self->_scanObjects;
}

- (void)setScanObjects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
