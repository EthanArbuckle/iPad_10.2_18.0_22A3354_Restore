@implementation AWDWRMStreamingReport

- (void)dealloc
{
  objc_super v3;

  -[AWDWRMStreamingReport setInstValues:](self, "setInstValues:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMStreamingReport;
  -[AWDWRMStreamingReport dealloc](&v3, sel_dealloc);
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

- (void)setSamplePeriods:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_samplePeriods = a3;
}

- (void)setHasSamplePeriods:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSamplePeriods
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsEnd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isEnd = a3;
}

- (void)setHasIsEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsEnd
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumStall:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numStall = a3;
}

- (void)setHasNumStall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumStall
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLPM:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lPM = a3;
}

- (void)setHasLPM:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLPM
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setOnline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_online = a3;
}

- (void)setHasOnline:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasOnline
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setOffline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_offline = a3;
}

- (void)setHasOffline:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOffline
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDurationLPM:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationLPM = a3;
}

- (void)setHasDurationLPM:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationLPM
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDurationOffline:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_durationOffline = a3;
}

- (void)setHasDurationOffline:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDurationOffline
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearInstValues
{
  -[NSMutableArray removeAllObjects](self->_instValues, "removeAllObjects");
}

- (void)addInstValues:(id)a3
{
  NSMutableArray *instValues;

  instValues = self->_instValues;
  if (!instValues)
  {
    instValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_instValues = instValues;
  }
  -[NSMutableArray addObject:](instValues, "addObject:", a3);
}

- (unint64_t)instValuesCount
{
  return -[NSMutableArray count](self->_instValues, "count");
}

- (id)instValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_instValues, "objectAtIndex:", a3);
}

+ (Class)instValuesType
{
  return (Class)objc_opt_class();
}

- (void)setCounter:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCounter
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMStreamingReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMStreamingReport description](&v3, sel_description), -[AWDWRMStreamingReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSMutableArray *instValues;
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplePeriods), CFSTR("sample_periods"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration), CFSTR("duration"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEnd), CFSTR("isEnd"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numStall), CFSTR("num_stall"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lPM), CFSTR("LPM"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_online), CFSTR("online"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_offline), CFSTR("offline"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationLPM), CFSTR("duration_LPM"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationOffline), CFSTR("duration_offline"));
LABEL_12:
  if (-[NSMutableArray count](self->_instValues, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_instValues, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    instValues = self->_instValues;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(instValues);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("inst_values"));

  }
  if ((*(_WORD *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counter), CFSTR("counter"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMStreamingReportReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *instValues;
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  instValues = self->_instValues;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(instValues);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_samplePeriods;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 5) = self->_duration;
  *((_WORD *)a3 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)a3 + 48) = self->_isEnd;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 10) = self->_numStall;
  *((_WORD *)a3 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)a3 + 49) = self->_lPM;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)a3 + 51) = self->_online;
  *((_WORD *)a3 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_27:
    *((_DWORD *)a3 + 6) = self->_durationLPM;
    *((_WORD *)a3 + 26) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  *((_BYTE *)a3 + 50) = self->_offline;
  *((_WORD *)a3 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_27;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 7) = self->_durationOffline;
    *((_WORD *)a3 + 26) |= 0x10u;
  }
LABEL_12:
  if (-[AWDWRMStreamingReport instValuesCount](self, "instValuesCount"))
  {
    objc_msgSend(a3, "clearInstValues");
    v6 = -[AWDWRMStreamingReport instValuesCount](self, "instValuesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addInstValues:", -[AWDWRMStreamingReport instValuesAtIndex:](self, "instValuesAtIndex:", i));
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_counter;
    *((_WORD *)a3 + 26) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *instValues;
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
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 52) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 44) = self->_samplePeriods;
  *(_WORD *)(v5 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 20) = self->_duration;
  *(_WORD *)(v5 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 48) = self->_isEnd;
  *(_WORD *)(v5 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 40) = self->_numStall;
  *(_WORD *)(v5 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v5 + 49) = self->_lPM;
  *(_WORD *)(v5 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *(_BYTE *)(v5 + 51) = self->_online;
  *(_WORD *)(v5 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *(_BYTE *)(v5 + 50) = self->_offline;
  *(_WORD *)(v5 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  *(_DWORD *)(v5 + 24) = self->_durationLPM;
  *(_WORD *)(v5 + 52) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 28) = self->_durationOffline;
    *(_WORD *)(v5 + 52) |= 0x10u;
  }
LABEL_12:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  instValues = self->_instValues;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(instValues);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addInstValues:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instValues, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_counter;
    *(_WORD *)(v6 + 52) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *instValues;
  __int16 v9;

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
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_samplePeriods != *((_DWORD *)a3 + 11))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_duration != *((_DWORD *)a3 + 5))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_71;
    if (self->_isEnd)
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
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numStall != *((_DWORD *)a3 + 10))
      goto LABEL_71;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0)
      goto LABEL_71;
    if (self->_lPM)
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0)
      goto LABEL_71;
    if (self->_online)
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
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0)
      goto LABEL_71;
    goto LABEL_54;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0)
    goto LABEL_71;
  if (self->_offline)
  {
    if (!*((_BYTE *)a3 + 50))
      goto LABEL_71;
    goto LABEL_54;
  }
  if (*((_BYTE *)a3 + 50))
  {
LABEL_71:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_54:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_durationLPM != *((_DWORD *)a3 + 6))
      goto LABEL_71;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_durationOffline != *((_DWORD *)a3 + 7))
      goto LABEL_71;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((_QWORD *)a3 + 4))
  {
    v5 = -[NSMutableArray isEqual:](instValues, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 26);
  LOBYTE(v5) = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_counter != *((_DWORD *)a3 + 4))
      goto LABEL_71;
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
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_samplePeriods;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v14 = 2654435761 * self->_duration;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_isEnd;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_numStall;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_lPM;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_online;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_offline;
    if ((has & 8) != 0)
      goto LABEL_10;
LABEL_20:
    v9 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v8 = 0;
  if ((has & 8) == 0)
    goto LABEL_20;
LABEL_10:
  v9 = 2654435761 * self->_durationLPM;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_durationOffline;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  v11 = -[NSMutableArray hash](self->_instValues, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_counter;
  else
    v12 = 0;
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
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
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_samplePeriods = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_duration = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_isEnd = *((_BYTE *)a3 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_numStall = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_lPM = *((_BYTE *)a3 + 49);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_online = *((_BYTE *)a3 + 51);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_offline = *((_BYTE *)a3 + 50);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  self->_durationLPM = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 26) & 0x10) != 0)
  {
LABEL_11:
    self->_durationOffline = *((_DWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 4);
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
        -[AWDWRMStreamingReport addInstValues:](self, "addInstValues:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if ((*((_WORD *)a3 + 26) & 2) != 0)
  {
    self->_counter = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)samplePeriods
{
  return self->_samplePeriods;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)isEnd
{
  return self->_isEnd;
}

- (unsigned)numStall
{
  return self->_numStall;
}

- (BOOL)lPM
{
  return self->_lPM;
}

- (BOOL)online
{
  return self->_online;
}

- (BOOL)offline
{
  return self->_offline;
}

- (unsigned)durationLPM
{
  return self->_durationLPM;
}

- (unsigned)durationOffline
{
  return self->_durationOffline;
}

- (NSMutableArray)instValues
{
  return self->_instValues;
}

- (void)setInstValues:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)counter
{
  return self->_counter;
}

@end
