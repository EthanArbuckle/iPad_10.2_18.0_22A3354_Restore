@implementation WiFiAnalyticsAWDWiFiDPSReport

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
  id v4;
  NSMutableArray *stallNotifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stallNotifications = self->_stallNotifications;
  v8 = v4;
  if (!stallNotifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_stallNotifications;
    self->_stallNotifications = v6;

    v4 = v8;
    stallNotifications = self->_stallNotifications;
  }
  -[NSMutableArray addObject:](stallNotifications, "addObject:", v4);

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
  id v4;
  NSMutableArray *probeResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  probeResults = self->_probeResults;
  v8 = v4;
  if (!probeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_probeResults;
    self->_probeResults = v6;

    v4 = v8;
    probeResults = self->_probeResults;
  }
  -[NSMutableArray addObject:](probeResults, "addObject:", v4);

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
  id v4;
  NSMutableArray *dpsCounterSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dpsCounterSamples = self->_dpsCounterSamples;
  v8 = v4;
  if (!dpsCounterSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_dpsCounterSamples;
    self->_dpsCounterSamples = v6;

    v4 = v8;
    dpsCounterSamples = self->_dpsCounterSamples;
  }
  -[NSMutableArray addObject:](dpsCounterSamples, "addObject:", v4);

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
  id v4;
  NSMutableArray *usbEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  usbEvents = self->_usbEvents;
  v8 = v4;
  if (!usbEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_usbEvents;
    self->_usbEvents = v6;

    v4 = v8;
    usbEvents = self->_usbEvents;
  }
  -[NSMutableArray addObject:](usbEvents, "addObject:", v4);

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSReport;
  -[WiFiAnalyticsAWDWiFiDPSReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiDPSReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  WiFiAnalyticsAWDWiFiDPSEpilogue *dpsEpiloge;
  void *v27;
  WiFiAnalyticsAWDWiFiDPSSnapshot *snapshot;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_stallNotifications, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_stallNotifications, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v6 = self->_stallNotifications;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v51 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("stallNotification"));
  }
  if (-[NSMutableArray count](self->_probeResults, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_probeResults, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v13 = self->_probeResults;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("probeResult"));
  }
  if (-[NSMutableArray count](self->_dpsCounterSamples, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_dpsCounterSamples, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v20 = self->_dpsCounterSamples;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("dpsCounterSample"));
  }
  dpsEpiloge = self->_dpsEpiloge;
  if (dpsEpiloge)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue dictionaryRepresentation](dpsEpiloge, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("dpsEpiloge"));

  }
  snapshot = self->_snapshot;
  if (snapshot)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot dictionaryRepresentation](snapshot, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("snapshot"));

  }
  if (-[NSMutableArray count](self->_usbEvents, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_usbEvents, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = self->_usbEvents;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v39;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v39 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v38);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("usbEvent"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_stallNotifications;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_probeResults;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_dpsCounterSamples;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  if (self->_dpsEpiloge)
    PBDataWriterWriteSubmessage();
  if (self->_snapshot)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_usbEvents;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id v21;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v21 = v4;
  if (-[WiFiAnalyticsAWDWiFiDPSReport stallNotificationsCount](self, "stallNotificationsCount"))
  {
    objc_msgSend(v21, "clearStallNotifications");
    v5 = -[WiFiAnalyticsAWDWiFiDPSReport stallNotificationsCount](self, "stallNotificationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[WiFiAnalyticsAWDWiFiDPSReport stallNotificationAtIndex:](self, "stallNotificationAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addStallNotification:", v8);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiDPSReport probeResultsCount](self, "probeResultsCount"))
  {
    objc_msgSend(v21, "clearProbeResults");
    v9 = -[WiFiAnalyticsAWDWiFiDPSReport probeResultsCount](self, "probeResultsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[WiFiAnalyticsAWDWiFiDPSReport probeResultAtIndex:](self, "probeResultAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addProbeResult:", v12);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiDPSReport dpsCounterSamplesCount](self, "dpsCounterSamplesCount"))
  {
    objc_msgSend(v21, "clearDpsCounterSamples");
    v13 = -[WiFiAnalyticsAWDWiFiDPSReport dpsCounterSamplesCount](self, "dpsCounterSamplesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[WiFiAnalyticsAWDWiFiDPSReport dpsCounterSampleAtIndex:](self, "dpsCounterSampleAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addDpsCounterSample:", v16);

      }
    }
  }
  if (self->_dpsEpiloge)
    objc_msgSend(v21, "setDpsEpiloge:");
  if (self->_snapshot)
    objc_msgSend(v21, "setSnapshot:");
  if (-[WiFiAnalyticsAWDWiFiDPSReport usbEventsCount](self, "usbEventsCount"))
  {
    objc_msgSend(v21, "clearUsbEvents");
    v17 = -[WiFiAnalyticsAWDWiFiDPSReport usbEventsCount](self, "usbEventsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WiFiAnalyticsAWDWiFiDPSReport usbEventAtIndex:](self, "usbEventAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addUsbEvent:", v20);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_stallNotifications;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addStallNotification:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = self->_probeResults;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addProbeResult:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v15);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = self->_dpsCounterSamples;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addDpsCounterSample:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v21);
  }

  v25 = -[WiFiAnalyticsAWDWiFiDPSEpilogue copyWithZone:](self->_dpsEpiloge, "copyWithZone:", a3);
  v26 = (void *)v6[3];
  v6[3] = v25;

  v27 = -[WiFiAnalyticsAWDWiFiDPSSnapshot copyWithZone:](self->_snapshot, "copyWithZone:", a3);
  v28 = (void *)v6[5];
  v6[5] = v27;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = self->_usbEvents;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v33), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend(v6, "addUsbEvent:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v31);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *stallNotifications;
  NSMutableArray *probeResults;
  NSMutableArray *dpsCounterSamples;
  WiFiAnalyticsAWDWiFiDPSEpilogue *dpsEpiloge;
  WiFiAnalyticsAWDWiFiDPSSnapshot *snapshot;
  NSMutableArray *usbEvents;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  stallNotifications = self->_stallNotifications;
  if ((unint64_t)stallNotifications | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](stallNotifications, "isEqual:"))
  {
    goto LABEL_19;
  }
  probeResults = self->_probeResults;
  if ((unint64_t)probeResults | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](probeResults, "isEqual:"))
      goto LABEL_19;
  }
  dpsCounterSamples = self->_dpsCounterSamples;
  if ((unint64_t)dpsCounterSamples | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](dpsCounterSamples, "isEqual:"))
      goto LABEL_19;
  }
  dpsEpiloge = self->_dpsEpiloge;
  if ((unint64_t)dpsEpiloge | *((_QWORD *)v4 + 3))
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSEpilogue isEqual:](dpsEpiloge, "isEqual:"))
      goto LABEL_19;
  }
  snapshot = self->_snapshot;
  if ((unint64_t)snapshot | *((_QWORD *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSSnapshot isEqual:](snapshot, "isEqual:"))
      goto LABEL_19;
  }
  usbEvents = self->_usbEvents;
  if ((unint64_t)usbEvents | *((_QWORD *)v4 + 7))
    v11 = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
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
  v7 = -[WiFiAnalyticsAWDWiFiDPSEpilogue hash](self->_dpsEpiloge, "hash");
  v8 = v7 ^ -[WiFiAnalyticsAWDWiFiDPSSnapshot hash](self->_snapshot, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_usbEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  WiFiAnalyticsAWDWiFiDPSEpilogue *dpsEpiloge;
  id v22;
  WiFiAnalyticsAWDWiFiDPSSnapshot *snapshot;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
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
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        -[WiFiAnalyticsAWDWiFiDPSReport addStallNotification:](self, "addStallNotification:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v5[4];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        -[WiFiAnalyticsAWDWiFiDPSReport addProbeResult:](self, "addProbeResult:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v5[2];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        -[WiFiAnalyticsAWDWiFiDPSReport addDpsCounterSample:](self, "addDpsCounterSample:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v18);
  }

  dpsEpiloge = self->_dpsEpiloge;
  v22 = v5[3];
  if (dpsEpiloge)
  {
    if (v22)
      -[WiFiAnalyticsAWDWiFiDPSEpilogue mergeFrom:](dpsEpiloge, "mergeFrom:");
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiDPSReport setDpsEpiloge:](self, "setDpsEpiloge:");
  }
  snapshot = self->_snapshot;
  v24 = v5[5];
  if (snapshot)
  {
    if (v24)
      -[WiFiAnalyticsAWDWiFiDPSSnapshot mergeFrom:](snapshot, "mergeFrom:");
  }
  else if (v24)
  {
    -[WiFiAnalyticsAWDWiFiDPSReport setSnapshot:](self, "setSnapshot:");
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v5[7];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[WiFiAnalyticsAWDWiFiDPSReport addUsbEvent:](self, "addUsbEvent:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * m), (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v27);
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
  objc_storeStrong((id *)&self->_stallNotifications, a3);
}

- (NSMutableArray)probeResults
{
  return self->_probeResults;
}

- (void)setProbeResults:(id)a3
{
  objc_storeStrong((id *)&self->_probeResults, a3);
}

- (NSMutableArray)dpsCounterSamples
{
  return self->_dpsCounterSamples;
}

- (void)setDpsCounterSamples:(id)a3
{
  objc_storeStrong((id *)&self->_dpsCounterSamples, a3);
}

- (WiFiAnalyticsAWDWiFiDPSEpilogue)dpsEpiloge
{
  return self->_dpsEpiloge;
}

- (void)setDpsEpiloge:(id)a3
{
  objc_storeStrong((id *)&self->_dpsEpiloge, a3);
}

- (WiFiAnalyticsAWDWiFiDPSSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSMutableArray)usbEvents
{
  return self->_usbEvents;
}

- (void)setUsbEvents:(id)a3
{
  objc_storeStrong((id *)&self->_usbEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usbEvents, 0);
  objc_storeStrong((id *)&self->_stallNotifications, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_probeResults, 0);
  objc_storeStrong((id *)&self->_dpsEpiloge, 0);
  objc_storeStrong((id *)&self->_dpsCounterSamples, 0);
}

@end
