@implementation AWDLibnetcoreCellularFallbackReport

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  -[AWDLibnetcoreCellularFallbackReport setPrimaryInterfaceAttemptStatisticsReports:](self, "setPrimaryInterfaceAttemptStatisticsReports:", 0);
  -[AWDLibnetcoreCellularFallbackReport setDataUsageSnapshotsAtNetworkEvents:](self, "setDataUsageSnapshotsAtNetworkEvents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreCellularFallbackReport;
  -[AWDLibnetcoreCellularFallbackReport dealloc](&v3, sel_dealloc);
}

- (void)setFellback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fellback = a3;
}

- (void)setHasFellback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFellback
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)denyReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_denyReason;
  else
    return 1;
}

- (void)setDenyReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_denyReason = a3;
}

- (void)setHasDenyReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDenyReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)denyReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DA68[a3 - 1];
}

- (int)StringAsDenyReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DENY_REASON_BLOCKED_FROM_USING_CELL_DATA")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DENY_REASON_EXCEEDED_CELL_FALLBACK_DATA_BUDGET")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DENY_REASON_METRICS_TESTING_DENIED")))
    return 3;
  return 1;
}

- (void)setFallbackTimerMsecs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fallbackTimerMsecs = a3;
}

- (void)setHasFallbackTimerMsecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFallbackTimerMsecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)networkEventsCount
{
  return self->_networkEvents.count;
}

- (int)networkEvents
{
  return self->_networkEvents.list;
}

- (void)clearNetworkEvents
{
  PBRepeatedInt32Clear();
}

- (void)addNetworkEvents:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)networkEventsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_networkEvents;
  unint64_t count;

  p_networkEvents = &self->_networkEvents;
  count = self->_networkEvents.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_networkEvents->list[a3];
}

- (void)setNetworkEvents:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)networkEventsAsString:(int)a3
{
  if ((a3 - 1) >= 0xA)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DA80[a3 - 1];
}

- (int)StringAsNetworkEvents:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_USER_TURNING_OFF_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_WIFI_TRIGGER_DISCONNECT")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_SYMPTOMS_SENDING_WIFI_RECOMMENDED_SIGNAL")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_SYMPTOMS_SENDING_WEAK_FALLBACK_SIGNAL")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_SYMPTOMS_SENDING_STRONG_FALLBACK_SIGNAL")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_CONNECTION_BEING_REUSED")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_DATA_STALL_AT_APP_LAYER")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_BETTER_ROUTE")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_CELLULAR_FALLBACK_TIMER_START")) & 1) != 0)
    return 9;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NETWORK_EVENT_CELLULAR_FALLBACK_ATTEMPT_START")))
    return 10;
  return 1;
}

- (unint64_t)timeToNetworkEventsMsecsCount
{
  return self->_timeToNetworkEventsMsecs.count;
}

- (unint64_t)timeToNetworkEventsMsecs
{
  return self->_timeToNetworkEventsMsecs.list;
}

- (void)clearTimeToNetworkEventsMsecs
{
  PBRepeatedUInt64Clear();
}

- (void)addTimeToNetworkEventsMsecs:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)timeToNetworkEventsMsecsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_timeToNetworkEventsMsecs;
  unint64_t count;

  p_timeToNetworkEventsMsecs = &self->_timeToNetworkEventsMsecs;
  count = self->_timeToNetworkEventsMsecs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_timeToNetworkEventsMsecs->list[a3];
}

- (void)setTimeToNetworkEventsMsecs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)clearPrimaryInterfaceAttemptStatisticsReports
{
  -[NSMutableArray removeAllObjects](self->_primaryInterfaceAttemptStatisticsReports, "removeAllObjects");
}

- (void)addPrimaryInterfaceAttemptStatisticsReports:(id)a3
{
  NSMutableArray *primaryInterfaceAttemptStatisticsReports;

  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  if (!primaryInterfaceAttemptStatisticsReports)
  {
    primaryInterfaceAttemptStatisticsReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_primaryInterfaceAttemptStatisticsReports = primaryInterfaceAttemptStatisticsReports;
  }
  -[NSMutableArray addObject:](primaryInterfaceAttemptStatisticsReports, "addObject:", a3);
}

- (unint64_t)primaryInterfaceAttemptStatisticsReportsCount
{
  return -[NSMutableArray count](self->_primaryInterfaceAttemptStatisticsReports, "count");
}

- (id)primaryInterfaceAttemptStatisticsReportsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_primaryInterfaceAttemptStatisticsReports, "objectAtIndex:", a3);
}

+ (Class)primaryInterfaceAttemptStatisticsReportsType
{
  return (Class)objc_opt_class();
}

- (void)clearDataUsageSnapshotsAtNetworkEvents
{
  -[NSMutableArray removeAllObjects](self->_dataUsageSnapshotsAtNetworkEvents, "removeAllObjects");
}

- (void)addDataUsageSnapshotsAtNetworkEvents:(id)a3
{
  NSMutableArray *dataUsageSnapshotsAtNetworkEvents;

  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  if (!dataUsageSnapshotsAtNetworkEvents)
  {
    dataUsageSnapshotsAtNetworkEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_dataUsageSnapshotsAtNetworkEvents = dataUsageSnapshotsAtNetworkEvents;
  }
  -[NSMutableArray addObject:](dataUsageSnapshotsAtNetworkEvents, "addObject:", a3);
}

- (unint64_t)dataUsageSnapshotsAtNetworkEventsCount
{
  return -[NSMutableArray count](self->_dataUsageSnapshotsAtNetworkEvents, "count");
}

- (id)dataUsageSnapshotsAtNetworkEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dataUsageSnapshotsAtNetworkEvents, "objectAtIndex:", a3);
}

+ (Class)dataUsageSnapshotsAtNetworkEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreCellularFallbackReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreCellularFallbackReport description](&v3, sel_description), -[AWDLibnetcoreCellularFallbackReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_networkEvents;
  void *v6;
  unint64_t v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;
  NSMutableArray *primaryInterfaceAttemptStatisticsReports;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *dataUsageSnapshotsAtNetworkEvents;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  unsigned int v23;
  __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fellback), CFSTR("fellback"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v23 = self->_denyReason - 1;
  if (v23 >= 3)
    v24 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_denyReason);
  else
    v24 = off_24C10DA68[v23];
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("denyReason"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fallbackTimerMsecs), CFSTR("fallbackTimer_msecs"));
LABEL_5:
  p_networkEvents = &self->_networkEvents;
  if (self->_networkEvents.count)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    if (self->_networkEvents.count)
    {
      v7 = 0;
      do
      {
        v8 = p_networkEvents->list[v7] - 1;
        if (v8 >= 0xA)
          v9 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), p_networkEvents->list[v7]);
        else
          v9 = off_24C10DA80[v8];
        objc_msgSend(v6, "addObject:", v9);
        ++v7;
      }
      while (v7 < self->_networkEvents.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("networkEvents"));
  }
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("timeToNetworkEvents_msecs"));
  if (-[NSMutableArray count](self->_primaryInterfaceAttemptStatisticsReports, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_primaryInterfaceAttemptStatisticsReports, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("primaryInterfaceAttemptStatisticsReports"));

  }
  if (-[NSMutableArray count](self->_dataUsageSnapshotsAtNetworkEvents, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_dataUsageSnapshotsAtNetworkEvents, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dataUsageSnapshotsAtNetworkEvents"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreCellularFallbackReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  NSMutableArray *primaryInterfaceAttemptStatisticsReports;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *dataUsageSnapshotsAtNetworkEvents;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_networkEvents.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_networkEvents.count);
  }
  if (self->_timeToNetworkEventsMsecs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_timeToNetworkEventsMsecs.count);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_23:
    *((_DWORD *)a3 + 18) = self->_denyReason;
    *((_BYTE *)a3 + 92) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_BYTE *)a3 + 88) = self->_fellback;
  *((_BYTE *)a3 + 92) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 7) = self->_fallbackTimerMsecs;
    *((_BYTE *)a3 + 92) |= 1u;
  }
LABEL_5:
  if (-[AWDLibnetcoreCellularFallbackReport networkEventsCount](self, "networkEventsCount"))
  {
    objc_msgSend(a3, "clearNetworkEvents");
    v6 = -[AWDLibnetcoreCellularFallbackReport networkEventsCount](self, "networkEventsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addNetworkEvents:", -[AWDLibnetcoreCellularFallbackReport networkEventsAtIndex:](self, "networkEventsAtIndex:", i));
    }
  }
  if (-[AWDLibnetcoreCellularFallbackReport timeToNetworkEventsMsecsCount](self, "timeToNetworkEventsMsecsCount"))
  {
    objc_msgSend(a3, "clearTimeToNetworkEventsMsecs");
    v9 = -[AWDLibnetcoreCellularFallbackReport timeToNetworkEventsMsecsCount](self, "timeToNetworkEventsMsecsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addTimeToNetworkEventsMsecs:", -[AWDLibnetcoreCellularFallbackReport timeToNetworkEventsMsecsAtIndex:](self, "timeToNetworkEventsMsecsAtIndex:", j));
    }
  }
  if (-[AWDLibnetcoreCellularFallbackReport primaryInterfaceAttemptStatisticsReportsCount](self, "primaryInterfaceAttemptStatisticsReportsCount"))
  {
    objc_msgSend(a3, "clearPrimaryInterfaceAttemptStatisticsReports");
    v12 = -[AWDLibnetcoreCellularFallbackReport primaryInterfaceAttemptStatisticsReportsCount](self, "primaryInterfaceAttemptStatisticsReportsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addPrimaryInterfaceAttemptStatisticsReports:", -[AWDLibnetcoreCellularFallbackReport primaryInterfaceAttemptStatisticsReportsAtIndex:](self, "primaryInterfaceAttemptStatisticsReportsAtIndex:", k));
    }
  }
  if (-[AWDLibnetcoreCellularFallbackReport dataUsageSnapshotsAtNetworkEventsCount](self, "dataUsageSnapshotsAtNetworkEventsCount"))
  {
    objc_msgSend(a3, "clearDataUsageSnapshotsAtNetworkEvents");
    v15 = -[AWDLibnetcoreCellularFallbackReport dataUsageSnapshotsAtNetworkEventsCount](self, "dataUsageSnapshotsAtNetworkEventsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addDataUsageSnapshotsAtNetworkEvents:", -[AWDLibnetcoreCellularFallbackReport dataUsageSnapshotsAtNetworkEventsAtIndex:](self, "dataUsageSnapshotsAtNetworkEventsAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *primaryInterfaceAttemptStatisticsReports;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *dataUsageSnapshotsAtNetworkEvents;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_fellback;
    *(_BYTE *)(v5 + 92) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_denyReason;
  *(_BYTE *)(v5 + 92) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 56) = self->_fallbackTimerMsecs;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  PBRepeatedUInt64Copy();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addPrimaryInterfaceAttemptStatisticsReports:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](primaryInterfaceAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addDataUsageSnapshotsAtNetworkEvents:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dataUsageSnapshotsAtNetworkEvents, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSMutableArray *primaryInterfaceAttemptStatisticsReports;
  NSMutableArray *dataUsageSnapshotsAtNetworkEvents;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!IsEqual)
    return IsEqual;
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 92) & 4) != 0)
      goto LABEL_26;
    goto LABEL_10;
  }
  if ((*((_BYTE *)a3 + 92) & 4) == 0)
    goto LABEL_26;
  if (self->_fellback)
  {
    if (!*((_BYTE *)a3 + 88))
      goto LABEL_26;
    goto LABEL_10;
  }
  if (*((_BYTE *)a3 + 88))
  {
LABEL_26:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_10:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 92) & 2) == 0 || self->_denyReason != *((_DWORD *)a3 + 18))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 92) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 92) & 1) == 0 || self->_fallbackTimerMsecs != *((_QWORD *)a3 + 7))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)a3 + 92) & 1) != 0)
  {
    goto LABEL_26;
  }
  IsEqual = PBRepeatedInt32IsEqual();
  if (IsEqual)
  {
    IsEqual = PBRepeatedUInt64IsEqual();
    if (IsEqual)
    {
      primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
      if (!((unint64_t)primaryInterfaceAttemptStatisticsReports | *((_QWORD *)a3 + 10))
        || (IsEqual = -[NSMutableArray isEqual:](primaryInterfaceAttemptStatisticsReports, "isEqual:")) != 0)
      {
        dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
        if ((unint64_t)dataUsageSnapshotsAtNetworkEvents | *((_QWORD *)a3 + 8))
          LOBYTE(IsEqual) = -[NSMutableArray isEqual:](dataUsageSnapshotsAtNetworkEvents, "isEqual:");
        else
          LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_fellback;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_denyReason;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_fallbackTimerMsecs;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
  v7 = v6 ^ PBRepeatedUInt64Hash();
  v8 = v7 ^ -[NSMutableArray hash](self->_primaryInterfaceAttemptStatisticsReports, "hash");
  return v8 ^ -[NSMutableArray hash](self->_dataUsageSnapshotsAtNetworkEvents, "hash");
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 92);
  if ((v5 & 4) != 0)
  {
    self->_fellback = *((_BYTE *)a3 + 88);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 92) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_denyReason = *((_DWORD *)a3 + 18);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 92) & 1) != 0)
  {
LABEL_4:
    self->_fallbackTimerMsecs = *((_QWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v6 = objc_msgSend(a3, "networkEventsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDLibnetcoreCellularFallbackReport addNetworkEvents:](self, "addNetworkEvents:", objc_msgSend(a3, "networkEventsAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "timeToNetworkEventsMsecsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDLibnetcoreCellularFallbackReport addTimeToNetworkEventsMsecs:](self, "addTimeToNetworkEventsMsecs:", objc_msgSend(a3, "timeToNetworkEventsMsecsAtIndex:", j));
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 10);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        -[AWDLibnetcoreCellularFallbackReport addPrimaryInterfaceAttemptStatisticsReports:](self, "addPrimaryInterfaceAttemptStatisticsReports:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 8);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (m = 0; m != v19; ++m)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[AWDLibnetcoreCellularFallbackReport addDataUsageSnapshotsAtNetworkEvents:](self, "addDataUsageSnapshotsAtNetworkEvents:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * m));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }
}

- (BOOL)fellback
{
  return self->_fellback;
}

- (unint64_t)fallbackTimerMsecs
{
  return self->_fallbackTimerMsecs;
}

- (NSMutableArray)primaryInterfaceAttemptStatisticsReports
{
  return self->_primaryInterfaceAttemptStatisticsReports;
}

- (void)setPrimaryInterfaceAttemptStatisticsReports:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)dataUsageSnapshotsAtNetworkEvents
{
  return self->_dataUsageSnapshotsAtNetworkEvents;
}

- (void)setDataUsageSnapshotsAtNetworkEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
