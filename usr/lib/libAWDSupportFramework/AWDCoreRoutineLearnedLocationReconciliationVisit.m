@implementation AWDCoreRoutineLearnedLocationReconciliationVisit

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLearnedLocationReconciliationVisit setAlternativeVisits:](self, "setAlternativeVisits:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationReconciliationVisit;
  -[AWDCoreRoutineLearnedLocationReconciliationVisit dealloc](&v3, sel_dealloc);
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

- (void)setDatapointCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_datapointCount = a3;
}

- (void)setHasDatapointCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDatapointCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDeviceClass:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deviceClass = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWatchPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_watchPresent = a3;
}

- (void)setHasWatchPresent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWatchPresent
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDidUnlock:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_didUnlock = a3;
}

- (void)setHasDidUnlock:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDidUnlock
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNewPlace:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_newPlace = a3;
}

- (void)setHasNewPlace:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNewPlace
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPlaceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPlaceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPlaceLabelType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_placeLabelType = a3;
}

- (void)setHasPlaceLabelType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaceLabelType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPlaceAOIPOI:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_placeAOIPOI = a3;
}

- (void)setHasPlaceAOIPOI:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPlaceAOIPOI
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPercentageVisits:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_percentageVisits = a3;
}

- (void)setHasPercentageVisits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPercentageVisits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPercentageTransitions:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_percentageTransitions = a3;
}

- (void)setHasPercentageTransitions:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPercentageTransitions
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearAlternativeVisits
{
  -[NSMutableArray removeAllObjects](self->_alternativeVisits, "removeAllObjects");
}

- (void)addAlternativeVisits:(id)a3
{
  NSMutableArray *alternativeVisits;

  alternativeVisits = self->_alternativeVisits;
  if (!alternativeVisits)
  {
    alternativeVisits = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_alternativeVisits = alternativeVisits;
  }
  -[NSMutableArray addObject:](alternativeVisits, "addObject:", a3);
}

- (unint64_t)alternativeVisitsCount
{
  return -[NSMutableArray count](self->_alternativeVisits, "count");
}

- (id)alternativeVisitsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_alternativeVisits, "objectAtIndex:", a3);
}

+ (Class)alternativeVisitsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationReconciliationVisit;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLearnedLocationReconciliationVisit description](&v3, sel_description), -[AWDCoreRoutineLearnedLocationReconciliationVisit dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSMutableArray *alternativeVisits;
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
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_datapointCount), CFSTR("datapointCount"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceClass), CFSTR("deviceClass"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_watchPresent), CFSTR("watchPresent"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didUnlock), CFSTR("didUnlock"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_newPlace), CFSTR("newPlace"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_placeType), CFSTR("placeType"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_placeLabelType), CFSTR("placeLabelType"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_placeAOIPOI), CFSTR("placeAOIPOI"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_percentageVisits), CFSTR("percentageVisits"));
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_percentageTransitions), CFSTR("percentageTransitions"));
LABEL_13:
  if (-[NSMutableArray count](self->_alternativeVisits, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_alternativeVisits, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    alternativeVisits = self->_alternativeVisits;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(alternativeVisits);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("alternativeVisits"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedLocationReconciliationVisitReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *alternativeVisits;
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
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  alternativeVisits = self->_alternativeVisits;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(alternativeVisits);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_datapointCount;
  *((_WORD *)a3 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 7) = self->_deviceClass;
  *((_WORD *)a3 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)a3 + 51) = self->_watchPresent;
  *((_WORD *)a3 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)a3 + 48) = self->_didUnlock;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)a3 + 49) = self->_newPlace;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_placeType;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_placeLabelType;
  *((_WORD *)a3 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
LABEL_27:
    *((_DWORD *)a3 + 9) = self->_percentageVisits;
    *((_WORD *)a3 + 26) |= 0x10u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  *((_BYTE *)a3 + 50) = self->_placeAOIPOI;
  *((_WORD *)a3 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_11:
  if ((has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 8) = self->_percentageTransitions;
    *((_WORD *)a3 + 26) |= 8u;
  }
LABEL_13:
  if (-[AWDCoreRoutineLearnedLocationReconciliationVisit alternativeVisitsCount](self, "alternativeVisitsCount"))
  {
    objc_msgSend(a3, "clearAlternativeVisits");
    v6 = -[AWDCoreRoutineLearnedLocationReconciliationVisit alternativeVisitsCount](self, "alternativeVisitsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addAlternativeVisits:", -[AWDCoreRoutineLearnedLocationReconciliationVisit alternativeVisitsAtIndex:](self, "alternativeVisitsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  __int16 has;
  NSMutableArray *alternativeVisits;
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
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 52) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_datapointCount;
  *(_WORD *)(v5 + 52) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_deviceClass;
  *(_WORD *)(v5 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v5 + 51) = self->_watchPresent;
  *(_WORD *)(v5 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 48) = self->_didUnlock;
  *(_WORD *)(v5 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(v5 + 49) = self->_newPlace;
  *(_WORD *)(v5 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 44) = self->_placeType;
  *(_WORD *)(v5 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 40) = self->_placeLabelType;
  *(_WORD *)(v5 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *(_BYTE *)(v5 + 50) = self->_placeAOIPOI;
  *(_WORD *)(v5 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  *(_DWORD *)(v5 + 36) = self->_percentageVisits;
  *(_WORD *)(v5 + 52) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 32) = self->_percentageTransitions;
    *(_WORD *)(v5 + 52) |= 8u;
  }
LABEL_13:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  alternativeVisits = self->_alternativeVisits;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(alternativeVisits);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addAlternativeVisits:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](alternativeVisits, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *alternativeVisits;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 26);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_71;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_datapointCount != *((_DWORD *)a3 + 6))
      goto LABEL_71;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_deviceClass != *((_DWORD *)a3 + 7))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0)
      goto LABEL_71;
    if (self->_watchPresent)
    {
      if (!*((_BYTE *)a3 + 51))
        goto LABEL_71;
    }
    else if (*((_BYTE *)a3 + 51))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_71;
    if (self->_didUnlock)
    {
      if (!*((_BYTE *)a3 + 48))
        goto LABEL_71;
    }
    else if (*((_BYTE *)a3 + 48))
    {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0)
      goto LABEL_71;
    if (self->_newPlace)
    {
      if (!*((_BYTE *)a3 + 49))
        goto LABEL_71;
    }
    else if (*((_BYTE *)a3 + 49))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_placeType != *((_DWORD *)a3 + 11))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_placeLabelType != *((_DWORD *)a3 + 10))
      goto LABEL_71;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0)
      goto LABEL_71;
    goto LABEL_59;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0)
    goto LABEL_71;
  if (self->_placeAOIPOI)
  {
    if (!*((_BYTE *)a3 + 50))
      goto LABEL_71;
    goto LABEL_59;
  }
  if (*((_BYTE *)a3 + 50))
  {
LABEL_71:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_59:
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_percentageVisits != *((_DWORD *)a3 + 9))
      goto LABEL_71;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_percentageTransitions != *((_DWORD *)a3 + 8))
      goto LABEL_71;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  alternativeVisits = self->_alternativeVisits;
  if ((unint64_t)alternativeVisits | *((_QWORD *)a3 + 2))
    LOBYTE(v5) = -[NSMutableArray isEqual:](alternativeVisits, "isEqual:");
  else
    LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_datapointCount;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_deviceClass;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_watchPresent;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_didUnlock;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_newPlace;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_placeType;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_placeLabelType;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_placeAOIPOI;
    if ((has & 0x10) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 8) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_alternativeVisits, "hash");
  }
LABEL_21:
  v11 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_percentageVisits;
  if ((has & 8) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_percentageTransitions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_alternativeVisits, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  void *v5;
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
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v4 = *((_WORD *)a3 + 26);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_datapointCount = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 2u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_deviceClass = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 4u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x400) == 0)
  {
LABEL_5:
    if ((v4 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_watchPresent = *((_BYTE *)a3 + 51);
  *(_WORD *)&self->_has |= 0x400u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x80) == 0)
  {
LABEL_6:
    if ((v4 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_didUnlock = *((_BYTE *)a3 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x100) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_newPlace = *((_BYTE *)a3 + 49);
  *(_WORD *)&self->_has |= 0x100u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_placeType = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_placeLabelType = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x200) == 0)
  {
LABEL_10:
    if ((v4 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_placeAOIPOI = *((_BYTE *)a3 + 50);
  *(_WORD *)&self->_has |= 0x200u;
  v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x10) == 0)
  {
LABEL_11:
    if ((v4 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  self->_percentageVisits = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 26) & 8) != 0)
  {
LABEL_12:
    self->_percentageTransitions = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_13:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AWDCoreRoutineLearnedLocationReconciliationVisit addAlternativeVisits:](self, "addAlternativeVisits:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)datapointCount
{
  return self->_datapointCount;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)watchPresent
{
  return self->_watchPresent;
}

- (BOOL)didUnlock
{
  return self->_didUnlock;
}

- (BOOL)newPlace
{
  return self->_newPlace;
}

- (int)placeType
{
  return self->_placeType;
}

- (int)placeLabelType
{
  return self->_placeLabelType;
}

- (BOOL)placeAOIPOI
{
  return self->_placeAOIPOI;
}

- (int)percentageVisits
{
  return self->_percentageVisits;
}

- (int)percentageTransitions
{
  return self->_percentageTransitions;
}

- (NSMutableArray)alternativeVisits
{
  return self->_alternativeVisits;
}

- (void)setAlternativeVisits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
