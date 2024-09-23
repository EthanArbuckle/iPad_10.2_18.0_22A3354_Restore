@implementation AWDWiFiDPSReport

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiDPSReport setStallNotifications:](self, "setStallNotifications:", 0);
  -[AWDWiFiDPSReport setProbeResults:](self, "setProbeResults:", 0);
  -[AWDWiFiDPSReport setDpsCounterSamples:](self, "setDpsCounterSamples:", 0);
  -[AWDWiFiDPSReport setDpsEpiloge:](self, "setDpsEpiloge:", 0);
  -[AWDWiFiDPSReport setSnapshot:](self, "setSnapshot:", 0);
  -[AWDWiFiDPSReport setUsbEvents:](self, "setUsbEvents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSReport;
  -[AWDWiFiDPSReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearStallNotifications
{
  -[NSMutableArray removeAllObjects](self->_stallNotifications, "removeAllObjects");
}

- (void)addStallNotification:(id)a3
{
  NSMutableArray *stallNotifications;

  stallNotifications = self->_stallNotifications;
  if (!stallNotifications)
  {
    stallNotifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_stallNotifications = stallNotifications;
  }
  -[NSMutableArray addObject:](stallNotifications, "addObject:", a3);
}

- (unint64_t)stallNotificationsCount
{
  return -[NSMutableArray count](self->_stallNotifications, "count");
}

- (id)stallNotificationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stallNotifications, "objectAtIndex:", a3);
}

+ (Class)stallNotificationType
{
  return (Class)objc_opt_class();
}

- (void)clearProbeResults
{
  -[NSMutableArray removeAllObjects](self->_probeResults, "removeAllObjects");
}

- (void)addProbeResult:(id)a3
{
  NSMutableArray *probeResults;

  probeResults = self->_probeResults;
  if (!probeResults)
  {
    probeResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_probeResults = probeResults;
  }
  -[NSMutableArray addObject:](probeResults, "addObject:", a3);
}

- (unint64_t)probeResultsCount
{
  return -[NSMutableArray count](self->_probeResults, "count");
}

- (id)probeResultAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_probeResults, "objectAtIndex:", a3);
}

+ (Class)probeResultType
{
  return (Class)objc_opt_class();
}

- (void)clearDpsCounterSamples
{
  -[NSMutableArray removeAllObjects](self->_dpsCounterSamples, "removeAllObjects");
}

- (void)addDpsCounterSample:(id)a3
{
  NSMutableArray *dpsCounterSamples;

  dpsCounterSamples = self->_dpsCounterSamples;
  if (!dpsCounterSamples)
  {
    dpsCounterSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_dpsCounterSamples = dpsCounterSamples;
  }
  -[NSMutableArray addObject:](dpsCounterSamples, "addObject:", a3);
}

- (unint64_t)dpsCounterSamplesCount
{
  return -[NSMutableArray count](self->_dpsCounterSamples, "count");
}

- (id)dpsCounterSampleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dpsCounterSamples, "objectAtIndex:", a3);
}

+ (Class)dpsCounterSampleType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDpsEpiloge
{
  return self->_dpsEpiloge != 0;
}

- (BOOL)hasSnapshot
{
  return self->_snapshot != 0;
}

- (void)clearUsbEvents
{
  -[NSMutableArray removeAllObjects](self->_usbEvents, "removeAllObjects");
}

- (void)addUsbEvent:(id)a3
{
  NSMutableArray *usbEvents;

  usbEvents = self->_usbEvents;
  if (!usbEvents)
  {
    usbEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_usbEvents = usbEvents;
  }
  -[NSMutableArray addObject:](usbEvents, "addObject:", a3);
}

- (unint64_t)usbEventsCount
{
  return -[NSMutableArray count](self->_usbEvents, "count");
}

- (id)usbEventAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_usbEvents, "objectAtIndex:", a3);
}

+ (Class)usbEventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiDPSReport description](&v3, sel_description), -[AWDWiFiDPSReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *stallNotifications;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *probeResults;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSMutableArray *dpsCounterSamples;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  AWDWiFiDPSEpilogue *dpsEpiloge;
  AWDWiFiDPSSnapshot *snapshot;
  void *v24;
  NSMutableArray *usbEvents;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_stallNotifications, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_stallNotifications, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    stallNotifications = self->_stallNotifications;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(stallNotifications);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("stallNotification"));

  }
  if (-[NSMutableArray count](self->_probeResults, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_probeResults, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    probeResults = self->_probeResults;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(probeResults);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("probeResult"));

  }
  if (-[NSMutableArray count](self->_dpsCounterSamples, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_dpsCounterSamples, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    dpsCounterSamples = self->_dpsCounterSamples;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(dpsCounterSamples);
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v19);
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dpsCounterSample"));

  }
  dpsEpiloge = self->_dpsEpiloge;
  if (dpsEpiloge)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSEpilogue dictionaryRepresentation](dpsEpiloge, "dictionaryRepresentation"), CFSTR("dpsEpiloge"));
  snapshot = self->_snapshot;
  if (snapshot)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiDPSSnapshot dictionaryRepresentation](snapshot, "dictionaryRepresentation"), CFSTR("snapshot"));
  if (-[NSMutableArray count](self->_usbEvents, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_usbEvents, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    usbEvents = self->_usbEvents;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        for (m = 0; m != v27; ++m)
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(usbEvents);
          objc_msgSend(v24, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      }
      while (v27);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("usbEvent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *stallNotifications;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *probeResults;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *dpsCounterSamples;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *usbEvents;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  stallNotifications = self->_stallNotifications;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(stallNotifications);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v6);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  probeResults = self->_probeResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(probeResults);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v11);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  dpsCounterSamples = self->_dpsCounterSamples;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(dpsCounterSamples);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v16);
  }
  if (self->_dpsEpiloge)
    PBDataWriterWriteSubmessage();
  if (self->_snapshot)
    PBDataWriterWriteSubmessage();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  usbEvents = self->_usbEvents;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(usbEvents);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    }
    while (v21);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (-[AWDWiFiDPSReport stallNotificationsCount](self, "stallNotificationsCount"))
  {
    objc_msgSend(a3, "clearStallNotifications");
    v5 = -[AWDWiFiDPSReport stallNotificationsCount](self, "stallNotificationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addStallNotification:", -[AWDWiFiDPSReport stallNotificationAtIndex:](self, "stallNotificationAtIndex:", i));
    }
  }
  if (-[AWDWiFiDPSReport probeResultsCount](self, "probeResultsCount"))
  {
    objc_msgSend(a3, "clearProbeResults");
    v8 = -[AWDWiFiDPSReport probeResultsCount](self, "probeResultsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addProbeResult:", -[AWDWiFiDPSReport probeResultAtIndex:](self, "probeResultAtIndex:", j));
    }
  }
  if (-[AWDWiFiDPSReport dpsCounterSamplesCount](self, "dpsCounterSamplesCount"))
  {
    objc_msgSend(a3, "clearDpsCounterSamples");
    v11 = -[AWDWiFiDPSReport dpsCounterSamplesCount](self, "dpsCounterSamplesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addDpsCounterSample:", -[AWDWiFiDPSReport dpsCounterSampleAtIndex:](self, "dpsCounterSampleAtIndex:", k));
    }
  }
  if (self->_dpsEpiloge)
    objc_msgSend(a3, "setDpsEpiloge:");
  if (self->_snapshot)
    objc_msgSend(a3, "setSnapshot:");
  if (-[AWDWiFiDPSReport usbEventsCount](self, "usbEventsCount"))
  {
    objc_msgSend(a3, "clearUsbEvents");
    v14 = -[AWDWiFiDPSReport usbEventsCount](self, "usbEventsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addUsbEvent:", -[AWDWiFiDPSReport usbEventAtIndex:](self, "usbEventAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  NSMutableArray *stallNotifications;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *probeResults;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *dpsCounterSamples;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *usbEvents;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  stallNotifications = self->_stallNotifications;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(stallNotifications);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addStallNotification:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stallNotifications, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  probeResults = self->_probeResults;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(probeResults);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addProbeResult:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeResults, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v15);
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  dpsCounterSamples = self->_dpsCounterSamples;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(dpsCounterSamples);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v6, "addDpsCounterSample:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dpsCounterSamples, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v21);
  }

  v6[3] = -[AWDWiFiDPSEpilogue copyWithZone:](self->_dpsEpiloge, "copyWithZone:", a3);
  v6[5] = -[AWDWiFiDPSSnapshot copyWithZone:](self->_snapshot, "copyWithZone:", a3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  usbEvents = self->_usbEvents;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(usbEvents);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend(v6, "addUsbEvent:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v27);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *stallNotifications;
  NSMutableArray *probeResults;
  NSMutableArray *dpsCounterSamples;
  AWDWiFiDPSEpilogue *dpsEpiloge;
  AWDWiFiDPSSnapshot *snapshot;
  NSMutableArray *usbEvents;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    stallNotifications = self->_stallNotifications;
    if (!((unint64_t)stallNotifications | *((_QWORD *)a3 + 6))
      || (v5 = -[NSMutableArray isEqual:](stallNotifications, "isEqual:")) != 0)
    {
      probeResults = self->_probeResults;
      if (!((unint64_t)probeResults | *((_QWORD *)a3 + 4))
        || (v5 = -[NSMutableArray isEqual:](probeResults, "isEqual:")) != 0)
      {
        dpsCounterSamples = self->_dpsCounterSamples;
        if (!((unint64_t)dpsCounterSamples | *((_QWORD *)a3 + 2))
          || (v5 = -[NSMutableArray isEqual:](dpsCounterSamples, "isEqual:")) != 0)
        {
          dpsEpiloge = self->_dpsEpiloge;
          if (!((unint64_t)dpsEpiloge | *((_QWORD *)a3 + 3))
            || (v5 = -[AWDWiFiDPSEpilogue isEqual:](dpsEpiloge, "isEqual:")) != 0)
          {
            snapshot = self->_snapshot;
            if (!((unint64_t)snapshot | *((_QWORD *)a3 + 5))
              || (v5 = -[AWDWiFiDPSSnapshot isEqual:](snapshot, "isEqual:")) != 0)
            {
              usbEvents = self->_usbEvents;
              if ((unint64_t)usbEvents | *((_QWORD *)a3 + 7))
                LOBYTE(v5) = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_stallNotifications, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_probeResults, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_dpsCounterSamples, "hash");
  v7 = -[AWDWiFiDPSEpilogue hash](self->_dpsEpiloge, "hash");
  v8 = v7 ^ -[AWDWiFiDPSSnapshot hash](self->_snapshot, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_usbEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  AWDWiFiDPSEpilogue *dpsEpiloge;
  uint64_t v21;
  AWDWiFiDPSSnapshot *snapshot;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiDPSReport addStallNotification:](self, "addStallNotification:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        -[AWDWiFiDPSReport addProbeResult:](self, "addProbeResult:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[AWDWiFiDPSReport addDpsCounterSample:](self, "addDpsCounterSample:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v17);
  }
  dpsEpiloge = self->_dpsEpiloge;
  v21 = *((_QWORD *)a3 + 3);
  if (dpsEpiloge)
  {
    if (v21)
      -[AWDWiFiDPSEpilogue mergeFrom:](dpsEpiloge, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDWiFiDPSReport setDpsEpiloge:](self, "setDpsEpiloge:");
  }
  snapshot = self->_snapshot;
  v23 = *((_QWORD *)a3 + 5);
  if (snapshot)
  {
    if (v23)
      -[AWDWiFiDPSSnapshot mergeFrom:](snapshot, "mergeFrom:");
  }
  else if (v23)
  {
    -[AWDWiFiDPSReport setSnapshot:](self, "setSnapshot:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = (void *)*((_QWORD *)a3 + 7);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[AWDWiFiDPSReport addUsbEvent:](self, "addUsbEvent:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v26);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)stallNotifications
{
  return self->_stallNotifications;
}

- (void)setStallNotifications:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)probeResults
{
  return self->_probeResults;
}

- (void)setProbeResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)dpsCounterSamples
{
  return self->_dpsCounterSamples;
}

- (void)setDpsCounterSamples:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDWiFiDPSEpilogue)dpsEpiloge
{
  return self->_dpsEpiloge;
}

- (void)setDpsEpiloge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDWiFiDPSSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)usbEvents
{
  return self->_usbEvents;
}

- (void)setUsbEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
